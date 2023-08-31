# sift-integration-react-native

A React Native bridge for integrating Sift with ease.

## 🚀 Installation

To install the library, run the following command:


## 📚 Usage

This library offers the following functions:

- `setSiftConfig`: Set up Sift with the necessary details.
- `setUserId`: Set a specific user ID.
- `unsetUserId`: Remove the current user ID.
- `collect`: Initiate data collection.

**Parameters**:

- `accountId` (String): Obtain this from your Sift console under the API Keys tab.
- `beaconKey` (String): This is also found in the Sift console under the API Keys tab.
- `disallowCollectingLocationData` (Boolean): Set to true if you don't want to collect location data. If you allow Sift to collect location data, ensure you have the appropriate location permissions in your app. Note: Sift won't request permissions that the user hasn't already granted in your application.

```javascript
import { setSiftConfig, setUserId, unsetUserId, collect } from 'sift-integration-react-native';

// Configure Sift
setSiftConfig('accountId', 'beaconKey', false).then((result) => {
    console.log(result);
});

// Define User ID
setUserId('userId').then((result) => {
    console.log(result);
});

// Remove User ID
unsetUserId().then((result) => {
    console.log(result);
});

// Initiate Data Collection
collect().then((result) => {
    console.log(result);
});
```


📂 Example
For a practical demonstration, consult the source in the example folder.

🤝 Contributing
Interested in making a contribution? Please see the contributing guide for more information.

📜 License
This project is licensed under the MIT License.

yaml
