package com.siftintegrationreactnative
import com.facebook.react.bridge.LifecycleEventListener
import com.facebook.react.bridge.ReactApplicationContext
import com.facebook.react.bridge.ReactContextBaseJavaModule
import com.facebook.react.bridge.ReactMethod
import com.facebook.react.bridge.Promise
import siftscience.android.Sift
import java.lang.Exception


class SiftIntegrationReactNativeModule(pReactContext: ReactApplicationContext) : ReactContextBaseJavaModule(pReactContext),
  LifecycleEventListener {

  private var siftConfig: Sift.Config? = null
  private  var reactContext = pReactContext;

  init {
    reactContext.addLifecycleEventListener(this)
  }

  override fun getName(): String {
        return "SiftIntegrationReactNative"
    }
    @ReactMethod
    fun setSiftConfig(accountId: String, beaconKey: String, disallowCollectingLocationData: Boolean , promise: Promise) {
      try {
        siftConfig = Sift.Config.Builder()
            .withAccountId(accountId)
            .withBeaconKey(beaconKey)
            .withDisallowLocationCollection(disallowCollectingLocationData)
            .build()
        Sift.open(reactContext, siftConfig)
          promise.resolve("Done")
      }catch(e : Exception){
          promise.reject("ERROR_SETTING_CONFIG", "Failed to set Sift configuration.", e)

        }
    }

    @ReactMethod
    fun setUserId(userId: String , promise: Promise) {
      try {
        Sift.setUserId(userId)
        promise.resolve("Done")
      }catch(e : Exception){
        promise.reject("ERROR_SETTING_CONFIG", "Failed to set Sift configuration.", e)

      }
    }

      @ReactMethod
      fun unsetUserId(promise: Promise) {
        try {
          Sift.unsetUserId()
          promise.resolve("Done")

        }catch (e : Exception){
          promise.reject("ERROR_SETTING_CONFIG", "Failed to set Sift configuration.", e)

        }
      }

      @ReactMethod
      fun collect(promise: Promise) {
        try{
          Sift.collect()
          promise.resolve("Done")
        }catch (e : Exception){
          promise.reject("ERROR_SETTING_CONFIG", "Failed to set Sift configuration.", e)
        }
      }

      @ReactMethod
      fun openWithScreenName(screenName: String, promise: Promise) {
        try {
          Sift.open(reactContext, screenName)
          promise.resolve("Done")
        }catch (e : Exception){
          promise.reject("ERROR_SETTING_CONFIG", "Failed to set Sift configuration.", e)
        }
      }

      override fun onHostResume() {
        Sift.resume(reactApplicationContext)
      }

      override fun onHostPause() {
        Sift.pause()
      }

      override fun onHostDestroy() {
        Sift.close()
      }
  }
