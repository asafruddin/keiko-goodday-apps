import 'package:keiko_good_day/env/config.dart';

class FlavorSetting {
  FlavorSetting.development() {
    Config.getInstance(
      flavorName: 'development',
      apiBaseUrl: 'https://restapi.8sisi.id/api',
    );
  }

  FlavorSetting.staging() {
    Config.getInstance(
      flavorName: 'staging',
      apiBaseUrl: 'https://restapi.8sisi.id/api',
    );
  }

  FlavorSetting.production() {
    Config.getInstance(
      flavorName: 'production',
      apiBaseUrl: 'https://restapi.8sisi.id/api',
    );
  }
}
