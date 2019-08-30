import 'dart:io';

import 'package:admob_flutter/admob_flutter.dart';

String getAppId() {
  if (Platform.isIOS) {
    return 'ca-app-pub-3940256099942544~1458002511';
  } else if (Platform.isAndroid) {
    return 'ca-app-pub-3940256099942544~3347511713';
  }
  return null;
}

String getBannerAdUnitId() {
  if (Platform.isIOS) {
    return 'ca-app-pub-3940256099942544/2934735716';
  } else if (Platform.isAndroid) {
    return 'ca-app-pub-3940256099942544/6300978111';
  }
  return null;
}

AdmobBanner showBannerAd(){
  return AdmobBanner(
    adUnitId: getBannerAdUnitId(),
    adSize: AdmobBannerSize.BANNER,
    listener: (AdmobAdEvent event, Map<String, dynamic> args) {
      switch (event) {
        case AdmobAdEvent.loaded:
          print('Admob banner loaded!');
          break;

        case AdmobAdEvent.opened:
          print('Admob banner opened!');
          break;

        case AdmobAdEvent.closed:
          print('Admob banner closed!');
          break;

        case AdmobAdEvent.failedToLoad:
          print('Admob banner failed to load. Error code: ${args['errorCode']}');
          break;
        case AdmobAdEvent.clicked:
          // TODO: Handle this case.
          break;
        case AdmobAdEvent.impression:
          // TODO: Handle this case.
          break;
        case AdmobAdEvent.leftApplication:
          // TODO: Handle this case.
          break;
        case AdmobAdEvent.completed:
          // TODO: Handle this case.
          break;
        case AdmobAdEvent.rewarded:
          // TODO: Handle this case.
          break;
        case AdmobAdEvent.started:
          // TODO: Handle this case.
          break;
      }
    }
  );
}