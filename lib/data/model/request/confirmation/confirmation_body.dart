import 'package:json_annotation/json_annotation.dart';

part 'confirmation_body.g.dart';

@JsonSerializable(createFactory: false)
class ConfirmationBody {
  ConfirmationBody({this.start, this.end, this.motorisId});

  final String? start;
  final String? end;
  final int? motorisId;

  Map<String, dynamic> toJson() => _$ConfirmationBodyToJson(this);
}
