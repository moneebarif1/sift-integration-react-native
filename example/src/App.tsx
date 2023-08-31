import * as React from 'react';

import { StyleSheet, View, Text } from 'react-native';
import {
  setSiftConfig,
  setUserId,
  unsetUserId,
  collect,
} from 'sift-integration-react-native';

export default function App() {
  React.useEffect(() => {
    setSiftConfig('accountId', 'beaconKey', false).then((result: string) => {
      console.log(result);
    });

    setUserId('accountId').then((result: string) => {
      console.log(result);
    });

    unsetUserId().then((result: string) => {
      console.log(result);
    });

    collect().then((result: string) => {
      console.log(result);
    });
  }, []);

  return (
    <View style={styles.container}>
      <Text>Result: {0}</Text>
    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    alignItems: 'center',
    justifyContent: 'center',
  },
  box: {
    width: 60,
    height: 60,
    marginVertical: 20,
  },
});
