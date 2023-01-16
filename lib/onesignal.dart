import 'dart:async';
import 'dart:io' show Platform;
/*import 'package:onesignal_flutter/onesignal_flutter.dart';
// import 'package:flutter/foundation.dart' show kDebugMode;

class PushNotificationService {
  static StreamController<String?> _notificationStream =
      StreamController.broadcast();

  static Stream<String?> get notificationStream => _notificationStream.stream;
  static Future<void> initPlatformState() async {
    // if (kDebugMode) {
    //   //Remove this method to stop OneSignal Debugging
    //   OneSignal.shared.setLogLevel(OSLogLevel.verbose, OSLogLevel.none);
    // }
    await OneSignal.shared.setAppId("d2c39650-dc48-4c48-81a1-78eb17cd9f4f");
    if (Platform.isIOS) {
      OneSignal.shared
          .promptUserForPushNotificationPermission()
          .then((accepted) {
        print("PERMISO ACEPTADO : $accepted");
      });
    }
    OneSignal.shared
        .setNotificationOpenedHandler((OSNotificationOpenedResult result) {
      print('ABRIENDO LA NOTIFICACIÓN: $result');
      _notificationStream.add(result.notification.body);
    });

    OneSignal.shared.setNotificationWillShowInForegroundHandler(
        (OSNotificationReceivedEvent event) {
      print('LA APLICACIÓN ESTÁ ABIERTA Y LLEGÓ UNA PUSH : $event');
      _notificationStream.add(event.notification.body);

      /// Display Notification, send null to not display
      event.complete(null);
    });
  }

  void closeStreams() {
    _notificationStream.close();
  }
}

// Platform messages are asynchronous, so we initialize in an async method.*/
