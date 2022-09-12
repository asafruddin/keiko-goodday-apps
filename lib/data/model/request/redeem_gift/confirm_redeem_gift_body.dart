import 'package:json_annotation/json_annotation.dart';

@JsonSerializable(createFactory: false)
class ConfirmRedeemGiftBody {
  ConfirmRedeemGiftBody({this.motorisId, this.img, this.historyId});

  final int? motorisId;
  final int? historyId;
  final String? img;
}
