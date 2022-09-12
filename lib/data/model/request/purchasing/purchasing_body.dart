import 'package:json_annotation/json_annotation.dart';

part 'purchasing_body.g.dart';

@JsonSerializable(createFactory: false)
class PurchasingBody {
  PurchasingBody(
      {this.shopId, this.wholesaleDealLines, this.isCreate, this.pointTotal});

  final String? shopId;
  final List<WholesaleDealLines>? wholesaleDealLines;
  final String? isCreate;
  final String? pointTotal;

  Map<String, dynamic> toJson() => _$PurchasingBodyToJson(this);
}

@JsonSerializable(createFactory: false)
class WholesaleDealLines {
  WholesaleDealLines({this.itemId, this.qty});

  final String? itemId;
  final int? qty;

  Map<String, dynamic> toJson() => _$WholesaleDealLinesToJson(this);
}
