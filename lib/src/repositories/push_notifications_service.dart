import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:locker/src/repositories/notifications_local.dart';

/**
 * Variant: debug
Config: debug
Store: C:\Users\personal\.android\debug.keystore
Alias: AndroidDebugKey
MD5: AD:61:89:03:D3:49:9A:59:06:30:19:61:8E:31:2E:0C
SHA1: E4:66:37:1B:DD:C8:C4:4A:A5:6F:C3:FD:33:F1:B6:C8:F8:BA:FB:D2
SHA-256: BC:D8:BD:71:F2:5C:EF:DC:33:BC:95:65:32:97:04:A2:66:16:EB:34:D3:FA:96:DC:AB:F1:09:D0:C2:3E:29:57
Valid until: viernes, 23 de febrero de 2052
----------
Variant: release
Config: release
Store: null
Alias: null
----------
Variant: profile
Config: debug
Store: C:\Users\personal\.android\debug.keystore
Alias: AndroidDebugKey
MD5: AD:61:89:03:D3:49:9A:59:06:30:19:61:8E:31:2E:0C
SHA1: E4:66:37:1B:DD:C8:C4:4A:A5:6F:C3:FD:33:F1:B6:C8:F8:BA:FB:D2
SHA-256: BC:D8:BD:71:F2:5C:EF:DC:33:BC:95:65:32:97:04:A2:66:16:EB:34:D3:FA:96:DC:AB:F1:09:D0:C2:3E:29:57
Valid until: viernes, 23 de febrero de 2052
----------
Variant: debugAndroidTest
Config: debug
Store: C:\Users\personal\.android\debug.keystore
Alias: AndroidDebugKey
MD5: AD:61:89:03:D3:49:9A:59:06:30:19:61:8E:31:2E:0C
SHA1: E4:66:37:1B:DD:C8:C4:4A:A5:6F:C3:FD:33:F1:B6:C8:F8:BA:FB:D2
SHA-256: BC:D8:BD:71:F2:5C:EF:DC:33:BC:95:65:32:97:04:A2:66:16:EB:34:D3:FA:96:DC:AB:F1:09:D0:C2:3E:29:57
Valid until: viernes, 23 de febrero de 2052
----------
Variant: debugUnitTest
Config: debug
Store: C:\Users\personal\.android\debug.keystore
Alias: AndroidDebugKey
MD5: AD:61:89:03:D3:49:9A:59:06:30:19:61:8E:31:2E:0C
SHA1: E4:66:37:1B:DD:C8:C4:4A:A5:6F:C3:FD:33:F1:B6:C8:F8:BA:FB:D2
SHA-256: BC:D8:BD:71:F2:5C:EF:DC:33:BC:95:65:32:97:04:A2:66:16:EB:34:D3:FA:96:DC:AB:F1:09:D0:C2:3E:29:57
Valid until: viernes, 23 de febrero de 2052
----------
Variant: releaseUnitTest
Config: release
Store: null
Alias: null
----------
Variant: profileUnitTest
Config: debug
Store: C:\Users\personal\.android\debug.keystore
Alias: AndroidDebugKey
MD5: AD:61:89:03:D3:49:9A:59:06:30:19:61:8E:31:2E:0C
SHA1: E4:66:37:1B:DD:C8:C4:4A:A5:6F:C3:FD:33:F1:B6:C8:F8:BA:FB:D2
SHA-256: BC:D8:BD:71:F2:5C:EF:DC:33:BC:95:65:32:97:04:A2:66:16:EB:34:D3:FA:96:DC:AB:F1:09:D0:C2:3E:29:57
Valid until: viernes, 23 de febrero de 2052
----------

> Task :firebase_auth:signingReport
Variant: debugAndroidTest
Config: debug
Store: C:\Users\personal\.android\debug.keystore
Alias: AndroidDebugKey
MD5: AD:61:89:03:D3:49:9A:59:06:30:19:61:8E:31:2E:0C
SHA1: E4:66:37:1B:DD:C8:C4:4A:A5:6F:C3:FD:33:F1:B6:C8:F8:BA:FB:D2
SHA-256: BC:D8:BD:71:F2:5C:EF:DC:33:BC:95:65:32:97:04:A2:66:16:EB:34:D3:FA:96:DC:AB:F1:09:D0:C2:3E:29:57
Valid until: viernes, 23 de febrero de 2052
----------
Variant: debugUnitTest
Config: debug
Store: C:\Users\personal\.android\debug.keystore
Alias: AndroidDebugKey
MD5: AD:61:89:03:D3:49:9A:59:06:30:19:61:8E:31:2E:0C
SHA1: E4:66:37:1B:DD:C8:C4:4A:A5:6F:C3:FD:33:F1:B6:C8:F8:BA:FB:D2
SHA-256: BC:D8:BD:71:F2:5C:EF:DC:33:BC:95:65:32:97:04:A2:66:16:EB:34:D3:FA:96:DC:AB:F1:09:D0:C2:3E:29:57
Valid until: viernes, 23 de febrero de 2052
----------
Variant: releaseUnitTest
Config: debug
Store: C:\Users\personal\.android\debug.keystore
Alias: AndroidDebugKey
MD5: AD:61:89:03:D3:49:9A:59:06:30:19:61:8E:31:2E:0C
SHA1: E4:66:37:1B:DD:C8:C4:4A:A5:6F:C3:FD:33:F1:B6:C8:F8:BA:FB:D2
SHA-256: BC:D8:BD:71:F2:5C:EF:DC:33:BC:95:65:32:97:04:A2:66:16:EB:34:D3:FA:96:DC:AB:F1:09:D0:C2:3E:29:57
Valid until: viernes, 23 de febrero de 2052
----------
Variant: profileUnitTest
Config: debug
Store: C:\Users\personal\.android\debug.keystore
Alias: AndroidDebugKey
MD5: AD:61:89:03:D3:49:9A:59:06:30:19:61:8E:31:2E:0C
SHA1: E4:66:37:1B:DD:C8:C4:4A:A5:6F:C3:FD:33:F1:B6:C8:F8:BA:FB:D2
SHA-256: BC:D8:BD:71:F2:5C:EF:DC:33:BC:95:65:32:97:04:A2:66:16:EB:34:D3:FA:96:DC:AB:F1:09:D0:C2:3E:29:57
Valid until: viernes, 23 de febrero de 2052
----------

> Task :firebase_core:signingReport
Variant: debugAndroidTest
Config: debug
Store: C:\Users\personal\.android\debug.keystore
Alias: AndroidDebugKey
MD5: AD:61:89:03:D3:49:9A:59:06:30:19:61:8E:31:2E:0C
SHA1: E4:66:37:1B:DD:C8:C4:4A:A5:6F:C3:FD:33:F1:B6:C8:F8:BA:FB:D2
SHA-256: BC:D8:BD:71:F2:5C:EF:DC:33:BC:95:65:32:97:04:A2:66:16:EB:34:D3:FA:96:DC:AB:F1:09:D0:C2:3E:29:57
Valid until: viernes, 23 de febrero de 2052
----------
Variant: debugUnitTest
Config: debug
Store: C:\Users\personal\.android\debug.keystore
Alias: AndroidDebugKey
MD5: AD:61:89:03:D3:49:9A:59:06:30:19:61:8E:31:2E:0C
SHA1: E4:66:37:1B:DD:C8:C4:4A:A5:6F:C3:FD:33:F1:B6:C8:F8:BA:FB:D2
SHA-256: BC:D8:BD:71:F2:5C:EF:DC:33:BC:95:65:32:97:04:A2:66:16:EB:34:D3:FA:96:DC:AB:F1:09:D0:C2:3E:29:57
Valid until: viernes, 23 de febrero de 2052
----------
Variant: releaseUnitTest
Config: debug
Store: C:\Users\personal\.android\debug.keystore
Alias: AndroidDebugKey
MD5: AD:61:89:03:D3:49:9A:59:06:30:19:61:8E:31:2E:0C
SHA1: E4:66:37:1B:DD:C8:C4:4A:A5:6F:C3:FD:33:F1:B6:C8:F8:BA:FB:D2
SHA-256: BC:D8:BD:71:F2:5C:EF:DC:33:BC:95:65:32:97:04:A2:66:16:EB:34:D3:FA:96:DC:AB:F1:09:D0:C2:3E:29:57
Valid until: viernes, 23 de febrero de 2052
----------
Variant: profileUnitTest
Config: debug
Store: C:\Users\personal\.android\debug.keystore
Alias: AndroidDebugKey
MD5: AD:61:89:03:D3:49:9A:59:06:30:19:61:8E:31:2E:0C
SHA1: E4:66:37:1B:DD:C8:C4:4A:A5:6F:C3:FD:33:F1:B6:C8:F8:BA:FB:D2
SHA-256: BC:D8:BD:71:F2:5C:EF:DC:33:BC:95:65:32:97:04:A2:66:16:EB:34:D3:FA:96:DC:AB:F1:09:D0:C2:3E:29:57
Valid until: viernes, 23 de febrero de 2052
----------

> Task :firebase_messaging:signingReport
Variant: debugAndroidTest
Config: debug
Store: C:\Users\personal\.android\debug.keystore
Alias: AndroidDebugKey
MD5: AD:61:89:03:D3:49:9A:59:06:30:19:61:8E:31:2E:0C
SHA1: E4:66:37:1B:DD:C8:C4:4A:A5:6F:C3:FD:33:F1:B6:C8:F8:BA:FB:D2
SHA-256: BC:D8:BD:71:F2:5C:EF:DC:33:BC:95:65:32:97:04:A2:66:16:EB:34:D3:FA:96:DC:AB:F1:09:D0:C2:3E:29:57
Valid until: viernes, 23 de febrero de 2052
----------
Variant: debugUnitTest
Config: debug
Store: C:\Users\personal\.android\debug.keystore
Alias: AndroidDebugKey
MD5: AD:61:89:03:D3:49:9A:59:06:30:19:61:8E:31:2E:0C
SHA1: E4:66:37:1B:DD:C8:C4:4A:A5:6F:C3:FD:33:F1:B6:C8:F8:BA:FB:D2
SHA-256: BC:D8:BD:71:F2:5C:EF:DC:33:BC:95:65:32:97:04:A2:66:16:EB:34:D3:FA:96:DC:AB:F1:09:D0:C2:3E:29:57
Valid until: viernes, 23 de febrero de 2052
----------
Variant: releaseUnitTest
Config: debug
Store: C:\Users\personal\.android\debug.keystore
Alias: AndroidDebugKey
MD5: AD:61:89:03:D3:49:9A:59:06:30:19:61:8E:31:2E:0C
SHA1: E4:66:37:1B:DD:C8:C4:4A:A5:6F:C3:FD:33:F1:B6:C8:F8:BA:FB:D2
SHA-256: BC:D8:BD:71:F2:5C:EF:DC:33:BC:95:65:32:97:04:A2:66:16:EB:34:D3:FA:96:DC:AB:F1:09:D0:C2:3E:29:57
Valid until: viernes, 23 de febrero de 2052
----------
Variant: profileUnitTest
Config: debug
Store: C:\Users\personal\.android\debug.keystore
Alias: AndroidDebugKey
MD5: AD:61:89:03:D3:49:9A:59:06:30:19:61:8E:31:2E:0C
SHA1: E4:66:37:1B:DD:C8:C4:4A:A5:6F:C3:FD:33:F1:B6:C8:F8:BA:FB:D2
SHA-256: BC:D8:BD:71:F2:5C:EF:DC:33:BC:95:65:32:97:04:A2:66:16:EB:34:D3:FA:96:DC:AB:F1:09:D0:C2:3E:29:57
Valid until: viernes, 23 de febrero de 2052
----------

> Task :flutter_facebook_auth:signingReport
Variant: debugAndroidTest
Config: debug
Store: C:\Users\personal\.android\debug.keystore
Alias: AndroidDebugKey
MD5: AD:61:89:03:D3:49:9A:59:06:30:19:61:8E:31:2E:0C
SHA1: E4:66:37:1B:DD:C8:C4:4A:A5:6F:C3:FD:33:F1:B6:C8:F8:BA:FB:D2
SHA-256: BC:D8:BD:71:F2:5C:EF:DC:33:BC:95:65:32:97:04:A2:66:16:EB:34:D3:FA:96:DC:AB:F1:09:D0:C2:3E:29:57
Valid until: viernes, 23 de febrero de 2052
----------
Variant: debugUnitTest
Config: debug
Store: C:\Users\personal\.android\debug.keystore
Alias: AndroidDebugKey
MD5: AD:61:89:03:D3:49:9A:59:06:30:19:61:8E:31:2E:0C
SHA1: E4:66:37:1B:DD:C8:C4:4A:A5:6F:C3:FD:33:F1:B6:C8:F8:BA:FB:D2
SHA-256: BC:D8:BD:71:F2:5C:EF:DC:33:BC:95:65:32:97:04:A2:66:16:EB:34:D3:FA:96:DC:AB:F1:09:D0:C2:3E:29:57
Valid until: viernes, 23 de febrero de 2052
----------
Variant: releaseUnitTest
Config: debug
Store: C:\Users\personal\.android\debug.keystore
Alias: AndroidDebugKey
MD5: AD:61:89:03:D3:49:9A:59:06:30:19:61:8E:31:2E:0C
SHA1: E4:66:37:1B:DD:C8:C4:4A:A5:6F:C3:FD:33:F1:B6:C8:F8:BA:FB:D2
SHA-256: BC:D8:BD:71:F2:5C:EF:DC:33:BC:95:65:32:97:04:A2:66:16:EB:34:D3:FA:96:DC:AB:F1:09:D0:C2:3E:29:57
Valid until: viernes, 23 de febrero de 2052
----------
Variant: profileUnitTest
Config: debug
Store: C:\Users\personal\.android\debug.keystore
Alias: AndroidDebugKey
MD5: AD:61:89:03:D3:49:9A:59:06:30:19:61:8E:31:2E:0C
SHA1: E4:66:37:1B:DD:C8:C4:4A:A5:6F:C3:FD:33:F1:B6:C8:F8:BA:FB:D2
SHA-256: BC:D8:BD:71:F2:5C:EF:DC:33:BC:95:65:32:97:04:A2:66:16:EB:34:D3:FA:96:DC:AB:F1:09:D0:C2:3E:29:57
Valid until: viernes, 23 de febrero de 2052
----------

> Task :flutter_secure_storage:signingReport
Variant: debugAndroidTest
Config: debug
Store: C:\Users\personal\.android\debug.keystore
Alias: AndroidDebugKey
MD5: AD:61:89:03:D3:49:9A:59:06:30:19:61:8E:31:2E:0C
SHA1: E4:66:37:1B:DD:C8:C4:4A:A5:6F:C3:FD:33:F1:B6:C8:F8:BA:FB:D2
SHA-256: BC:D8:BD:71:F2:5C:EF:DC:33:BC:95:65:32:97:04:A2:66:16:EB:34:D3:FA:96:DC:AB:F1:09:D0:C2:3E:29:57
Valid until: viernes, 23 de febrero de 2052
----------
Variant: debugUnitTest
Config: debug
Store: C:\Users\personal\.android\debug.keystore
Alias: AndroidDebugKey
MD5: AD:61:89:03:D3:49:9A:59:06:30:19:61:8E:31:2E:0C
SHA1: E4:66:37:1B:DD:C8:C4:4A:A5:6F:C3:FD:33:F1:B6:C8:F8:BA:FB:D2
SHA-256: BC:D8:BD:71:F2:5C:EF:DC:33:BC:95:65:32:97:04:A2:66:16:EB:34:D3:FA:96:DC:AB:F1:09:D0:C2:3E:29:57
Valid until: viernes, 23 de febrero de 2052
----------
Variant: releaseUnitTest
Config: debug
Store: C:\Users\personal\.android\debug.keystore
Alias: AndroidDebugKey
MD5: AD:61:89:03:D3:49:9A:59:06:30:19:61:8E:31:2E:0C
SHA1: E4:66:37:1B:DD:C8:C4:4A:A5:6F:C3:FD:33:F1:B6:C8:F8:BA:FB:D2
SHA-256: BC:D8:BD:71:F2:5C:EF:DC:33:BC:95:65:32:97:04:A2:66:16:EB:34:D3:FA:96:DC:AB:F1:09:D0:C2:3E:29:57
Valid until: viernes, 23 de febrero de 2052
----------
Variant: profileUnitTest
Config: debug
Store: C:\Users\personal\.android\debug.keystore
Alias: AndroidDebugKey
MD5: AD:61:89:03:D3:49:9A:59:06:30:19:61:8E:31:2E:0C
SHA1: E4:66:37:1B:DD:C8:C4:4A:A5:6F:C3:FD:33:F1:B6:C8:F8:BA:FB:D2
SHA-256: BC:D8:BD:71:F2:5C:EF:DC:33:BC:95:65:32:97:04:A2:66:16:EB:34:D3:FA:96:DC:AB:F1:09:D0:C2:3E:29:57
Valid until: viernes, 23 de febrero de 2052
----------

> Task :google_sign_in_android:signingReport
Variant: debugAndroidTest
Config: debug
Store: C:\Users\personal\.android\debug.keystore
Alias: AndroidDebugKey
MD5: AD:61:89:03:D3:49:9A:59:06:30:19:61:8E:31:2E:0C
SHA1: E4:66:37:1B:DD:C8:C4:4A:A5:6F:C3:FD:33:F1:B6:C8:F8:BA:FB:D2
SHA-256: BC:D8:BD:71:F2:5C:EF:DC:33:BC:95:65:32:97:04:A2:66:16:EB:34:D3:FA:96:DC:AB:F1:09:D0:C2:3E:29:57
Valid until: viernes, 23 de febrero de 2052
----------
Variant: debugUnitTest
Config: debug
Store: C:\Users\personal\.android\debug.keystore
Alias: AndroidDebugKey
MD5: AD:61:89:03:D3:49:9A:59:06:30:19:61:8E:31:2E:0C
SHA1: E4:66:37:1B:DD:C8:C4:4A:A5:6F:C3:FD:33:F1:B6:C8:F8:BA:FB:D2
SHA-256: BC:D8:BD:71:F2:5C:EF:DC:33:BC:95:65:32:97:04:A2:66:16:EB:34:D3:FA:96:DC:AB:F1:09:D0:C2:3E:29:57
Valid until: viernes, 23 de febrero de 2052
----------
Variant: releaseUnitTest
Config: debug
Store: C:\Users\personal\.android\debug.keystore
Alias: AndroidDebugKey
MD5: AD:61:89:03:D3:49:9A:59:06:30:19:61:8E:31:2E:0C
SHA1: E4:66:37:1B:DD:C8:C4:4A:A5:6F:C3:FD:33:F1:B6:C8:F8:BA:FB:D2
SHA-256: BC:D8:BD:71:F2:5C:EF:DC:33:BC:95:65:32:97:04:A2:66:16:EB:34:D3:FA:96:DC:AB:F1:09:D0:C2:3E:29:57
Valid until: viernes, 23 de febrero de 2052
----------
Variant: profileUnitTest
Config: debug
Store: C:\Users\personal\.android\debug.keystore
Alias: AndroidDebugKey
MD5: AD:61:89:03:D3:49:9A:59:06:30:19:61:8E:31:2E:0C
SHA1: E4:66:37:1B:DD:C8:C4:4A:A5:6F:C3:FD:33:F1:B6:C8:F8:BA:FB:D2
SHA-256: BC:D8:BD:71:F2:5C:EF:DC:33:BC:95:65:32:97:04:A2:66:16:EB:34:D3:FA:96:DC:AB:F1:09:D0:C2:3E:29:57
Valid until: viernes, 23 de febrero de 2052
----------

> Task :hexcolor:signingReport
Variant: debugAndroidTest
Config: debug
Store: C:\Users\personal\.android\debug.keystore
Alias: AndroidDebugKey
MD5: AD:61:89:03:D3:49:9A:59:06:30:19:61:8E:31:2E:0C
SHA1: E4:66:37:1B:DD:C8:C4:4A:A5:6F:C3:FD:33:F1:B6:C8:F8:BA:FB:D2
SHA-256: BC:D8:BD:71:F2:5C:EF:DC:33:BC:95:65:32:97:04:A2:66:16:EB:34:D3:FA:96:DC:AB:F1:09:D0:C2:3E:29:57
Valid until: viernes, 23 de febrero de 2052
----------
Variant: debugUnitTest
Config: debug
Store: C:\Users\personal\.android\debug.keystore
Alias: AndroidDebugKey
MD5: AD:61:89:03:D3:49:9A:59:06:30:19:61:8E:31:2E:0C
SHA1: E4:66:37:1B:DD:C8:C4:4A:A5:6F:C3:FD:33:F1:B6:C8:F8:BA:FB:D2
SHA-256: BC:D8:BD:71:F2:5C:EF:DC:33:BC:95:65:32:97:04:A2:66:16:EB:34:D3:FA:96:DC:AB:F1:09:D0:C2:3E:29:57
Valid until: viernes, 23 de febrero de 2052
----------
Variant: releaseUnitTest
Config: debug
Store: C:\Users\personal\.android\debug.keystore
Alias: AndroidDebugKey
MD5: AD:61:89:03:D3:49:9A:59:06:30:19:61:8E:31:2E:0C
SHA1: E4:66:37:1B:DD:C8:C4:4A:A5:6F:C3:FD:33:F1:B6:C8:F8:BA:FB:D2
SHA-256: BC:D8:BD:71:F2:5C:EF:DC:33:BC:95:65:32:97:04:A2:66:16:EB:34:D3:FA:96:DC:AB:F1:09:D0:C2:3E:29:57
Valid until: viernes, 23 de febrero de 2052
----------
Variant: profileUnitTest
Config: debug
Store: C:\Users\personal\.android\debug.keystore
Alias: AndroidDebugKey
MD5: AD:61:89:03:D3:49:9A:59:06:30:19:61:8E:31:2E:0C
SHA1: E4:66:37:1B:DD:C8:C4:4A:A5:6F:C3:FD:33:F1:B6:C8:F8:BA:FB:D2
SHA-256: BC:D8:BD:71:F2:5C:EF:DC:33:BC:95:65:32:97:04:A2:66:16:EB:34:D3:FA:96:DC:AB:F1:09:D0:C2:3E:29:57
Valid until: viernes, 23 de febrero de 2052
 * 
 * **/
class PushNotificationServices {
  static FirebaseMessaging messaging = FirebaseMessaging.instance;
  static String? token = "";

  static Future<void> _backgroundHandler(RemoteMessage message) async {
    await Firebase.initializeApp();
    print("_backgroundHandler HANDLER ${message.messageId}");
  }

  static Future<void> _onMessageHandler(RemoteMessage message) async {
    print("_onMessageHandler HANDLER ${message.messageId}");
    showNotifications(
        message.notification!.title!, message.notification!.body!);
  }

  static Future<void> _onOpenMessageOpenApp(RemoteMessage message) async {
    print("_onOpenMessageOpenApp HANDLER ${message.messageId}");
    showNotifications(
        message.notification!.title!, message.notification!.body!);
  }

  static Future initializeApp() async {
    // Push Notificarion
    await Firebase.initializeApp();
    var storage = new FlutterSecureStorage();

    token = await FirebaseMessaging.instance.getToken();
    await storage.write(key: 'tokenFirebase', value: token);
    print("TOKEN FIREBASE MESSAGIN");
    print(token);

    //Handlers

    FirebaseMessaging.onBackgroundMessage(_backgroundHandler);
    FirebaseMessaging.onMessage.listen(_onMessageHandler);
    FirebaseMessaging.onMessageOpenedApp.listen(_onOpenMessageOpenApp);
    // Local Notifications
  }
}
