import 'package:firebase_messaging/firebase_messaging.dart';

void listenOnNotifications(){
  FirebaseMessaging.onMessage.listen((event) {
    if(event.notification !=null){
      final title =event.notification!.title;
      final body =event.notification!.body;
      print("title:  $title");
      print("body:  $body");
    }
  });
}

void refreshToken(){
  FirebaseMessaging.instance.onTokenRefresh.listen((token) {
    // delete the old token from shared preferecne for example
    // add the new one
  });
}

void refreshTokenInDB(){
  // tell the backend to refresh the token
}

