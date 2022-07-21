import 'package:keiko_good_day/app/app.dart';
import 'package:keiko_good_day/bootstrap.dart';
import 'package:keiko_good_day/env/flavor.dart';

void main() {
  bootstrap(App.new, FlavorSetting.staging());
}
