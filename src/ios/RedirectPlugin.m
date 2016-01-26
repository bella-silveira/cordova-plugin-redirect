#import "RedirectPlugin.h"
#import <AVFoundation/AVFoundation.h>

#import <arpa/inet.h> // For AF_INET, etc.
#import <ifaddrs.h> // For getifaddrs()
#import <net/if.h> // For IFF_LOOPBACK



@implementation RedirectPlugin

- (void)pluginInitialize {
    
    [super pluginInitialize];
    
    self.locationManager = [[CLLocationManager alloc] init];
    self.locationManager.delegate = self;
    
    self.bluetoothManager = [[CBCentralManager alloc]
                             initWithDelegate:self
                             queue:dispatch_get_main_queue()
                             options:@{CBCentralManagerOptionShowPowerAlertKey: @(NO)}];
    [self centralManagerDidUpdateState:self.bluetoothManager]; // Show initial state
}

// Settings
- (void) switchToPasscode: (CDVInvokedUrlCommand*)command
{

    CDVPluginResult* response;
    @try {
        [[UIApplication sharedApplication] openURL: [NSURL URLWithString:@"prefs:root=PASSCODE"]];
        response = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
    }
    @catch (NSException *exception) {
        response = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:exception.reason];
    }
    [self.commandDelegate sendPluginResult:response callbackId:command.callbackId];
}

#pragma mark - CBCentralManagerDelegate

- (void) centralManagerDidUpdateState:(CBCentralManager *)central {
    NSString* state;
    NSString* description;
    
    switch(self.bluetoothManager.state)
    {
        case CBCentralManagerStateResetting:
            state = @"resetting";
            description =@"The connection with the system service was momentarily lost, update imminent.";
            break;
            
        case CBCentralManagerStateUnsupported:
            state = @"unsupported";
            description = @"The platform doesn't support Bluetooth Low Energy.";
            break;
            
        case CBCentralManagerStateUnauthorized:
            state = @"unauthorized";
            description = @"The app is not authorized to use Bluetooth Low Energy.";
            break;
        case CBCentralManagerStatePoweredOff:
            state = @"powered_off";
            description = @"Bluetooth is currently powered off.";
            break;
        case CBCentralManagerStatePoweredOn:
            state = @"powered_on";
            description = @"Bluetooth is currently powered on and available to use.";
            break;
        default:
            state = @"unknown";
            description = @"State unknown, update imminent.";
            break;
    }
    NSLog(@"Bluetooth state changed: %@",description);
    
    self.bluetoothState = state;
    if(state == @"powered_on"){
        self.bluetoothEnabled = true;
    }else{
        self.bluetoothEnabled = false;
    }
    
    NSString* jsString = [NSString stringWithFormat:@"cordova-plugins-redirect._onBluetoothStateChange(\"%@\");", state];
    [self jsCallback:jsString];
}

@end
