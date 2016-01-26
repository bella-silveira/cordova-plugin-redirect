#import <Cordova/CDV.h>
#import <Cordova/CDVPlugin.h>
#import <WebKit/WebKit.h>
#import <CoreBluetooth/CoreBluetooth.h>
#import <CoreLocation/CoreLocation.h>

@interface RedirectPlugin : CDVPlugin <CBCentralManagerDelegate, CLLocationManagerDelegate>
	
	@property (nonatomic, retain) CBCentralManager* bluetoothManager;
    @property (nonatomic) BOOL bluetoothEnabled;
    @property (nonatomic) NSString* bluetoothState;
    @property (strong, nonatomic) CLLocationManager* locationManager;

- (void) switchToPasscode: (CDVInvokedUrlCommand*)command;

@end
