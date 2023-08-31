import Foundation
import Sift

@objc(SiftIntegrationReactNative)
class SiftIntegrationReactNative: NSObject {

    @objc(setSiftConfig:beaconKey:disallowCollectingLocationData:withResolver:withRejecter:)
    func setSiftConfig(_ accountId: String,
                             beaconKey: String,
                             disallowCollectingLocationData: Bool,
                             resolve: @escaping RCTPromiseResolveBlock,
                             reject: @escaping RCTPromiseRejectBlock) -> Void {
        // Set up Sift config here.
        // Currently, we are just resolving the promise.
        let sift = Sift.sharedInstance()
        sift?.accountId = accountId
        sift?.beaconKey = beaconKey
        sift?.disallowCollectingLocationData = disallowCollectingLocationData
        sift?.upload()

        resolve("Done")
    }

    @objc(setUserId:withResolver:withRejecter:)
    func setUserId(_ userId: String,
                         resolve: @escaping RCTPromiseResolveBlock,
                         reject: @escaping RCTPromiseRejectBlock) -> Void {
        // Set up user ID here.
        // Currently, we are just resolving the promise.
        let sift = Sift.sharedInstance();
        sift?.userId = userId;
        resolve("Done")
    }

    @objc(unsetUserId:withRejecter:)
     func unsetUserId(_ resolve: @escaping RCTPromiseResolveBlock,
                           reject: @escaping RCTPromiseRejectBlock) -> Void {
        // Unset user ID here.
        // Currently, we are just resolving the promise.
         let sift = Sift.sharedInstance();
         sift?.unsetUserId();
         resolve("Done")
    }
    
    @objc(collect:withRejecter:)
    func collect(_ resolve: @escaping RCTPromiseResolveBlock,
                       reject: @escaping RCTPromiseRejectBlock) -> Void {
        // Collect data or execute the required function.
        // Currently, we are just resolving the promise.
        let sift = Sift.sharedInstance();
        sift?.collect();
        resolve("Done")
    }

}
