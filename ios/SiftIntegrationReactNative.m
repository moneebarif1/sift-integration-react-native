#import <React/RCTBridgeModule.h>

@interface RCT_EXTERN_MODULE(SiftIntegrationReactNative, NSObject)

RCT_EXTERN_METHOD(setSiftConfig:(NSString *)accountId beaconKey:(NSString *)beaconKey disallowCollectingLocationData:(BOOL)disallowCollectingLocationData withResolver:(RCTPromiseResolveBlock)resolve
                  withRejecter:(RCTPromiseRejectBlock)reject)

RCT_EXTERN_METHOD(setUserId: (NSString *)userId withResolver:(RCTPromiseResolveBlock)resolve
                  withRejecter:(RCTPromiseRejectBlock)reject)

RCT_EXTERN_METHOD(unsetUserId :(RCTPromiseResolveBlock)resolve
                  withRejecter:(RCTPromiseRejectBlock)reject)

RCT_EXTERN_METHOD(collect :(RCTPromiseResolveBlock)resolve
                  withRejecter:(RCTPromiseRejectBlock)reject)

+ (BOOL)requiresMainQueueSetup
{
  return NO;
}

@end
