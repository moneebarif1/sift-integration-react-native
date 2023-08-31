import { NativeModules, Platform } from 'react-native';

const LINKING_ERROR =
  `The package 'sift-integration-react-native' doesn't seem to be linked. Make sure: \n\n` +
  Platform.select({ ios: "- You have run 'pod install'\n", default: '' }) +
  '- You rebuilt the app after installing the package\n' +
  '- You are not using Expo managed workflow\n';

const SiftIntegrationReactNative = NativeModules.SiftIntegrationReactNative
  ? NativeModules.SiftIntegrationReactNative
  : new Proxy(
      {},
      {
        get() {
          throw new Error(LINKING_ERROR);
        },
      }
    );

export function setSiftConfig(
  accountId: string,
  beaconKey: string,
  disallowCollectingLocationData: boolean
) {
  return SiftIntegrationReactNative.setSiftConfig(
    accountId,
    beaconKey,
    disallowCollectingLocationData
  );
}

export function setUserId(userId: string) {
  return SiftIntegrationReactNative.setUserId(userId);
}

export function unsetUserId() {
  return SiftIntegrationReactNative.unsetUserId();
}

export function collect() {
  return SiftIntegrationReactNative.collect();
}

export function openWithScreenName(screenName: string) {
  if (screenName !== null && screenName !== undefined && screenName !== '') {
    SiftIntegrationReactNative.openWithScreenName(screenName);
  }
}
