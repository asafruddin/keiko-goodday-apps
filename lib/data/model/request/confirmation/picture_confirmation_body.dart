import 'package:json_annotation/json_annotation.dart';
part 'picture_confirmation_body.g.dart';

@JsonSerializable(createFactory: false)
class PictureConfirmationBody {
  PictureConfirmationBody(
      {this.shopId,
      this.motorisId,
      this.description,
      this.date,
      this.latitude,
      this.longitude,
      this.img1,
      this.img2,
      this.img3,
      this.point1,
      this.point2,
      this.point3});

  final int? shopId;
  final int? motorisId;
  final String? description;
  final String? date;
  final String? latitude;
  final String? longitude;
  final String? img1;
  final String? img2;
  final String? img3;
  final double? point1;
  final double? point2;
  final double? point3;

  Map<String, dynamic> toJson() => _$PictureConfirmationBodyToJson(this);
}
