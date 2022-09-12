import 'package:json_annotation/json_annotation.dart';

part 'redeem_gift_body.g.dart';

@JsonSerializable(createFactory: false)
class RedeemGiftBody {
  RedeemGiftBody({this.shopId, this.itemId, this.motorisId, this.point});

  final int? shopId;
  final int? itemId;
  final int? motorisId;
  final String? point;

  Map<String, dynamic> toJson() => _$RedeemGiftBodyToJson(this);
}
