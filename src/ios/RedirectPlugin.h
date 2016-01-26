#import <Cordova/CDV.h>
#import <Cordova/CDVPlugin.h>
#import <WebKit/WebKit.h>
#import <CoreBluetooth/CoreBluetooth.h>
#import <CoreLocation/CoreLocation.h>

@interface RedirectPlugin : CDVPlugin <CBCentralManagerDelegate, CLLocationManagerDelegate>

- (void) switchToPasscode: (CDVInvokedUrlCommand*)command;

@end
