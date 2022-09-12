import 'package:keiko_good_day/env/config.dart';

class FlavorSetting {
  FlavorSetting.development() {
    Config.getInstance(
      flavorName: 'development',
      apiBaseUrl: 'https://restapi.8sisi.id',
    );
  }

  FlavorSetting.staging() {
    Config.getInstance(
      flavorName: 'staging',
      apiBaseUrl: 'https://restapi.8sisi.id',
    );
  }

  FlavorSetting.production() {
    Config.getInstance(
      flavorName: 'production',
      apiBaseUrl: 'https://restapi.8sisi.id',
    );
  }
}
