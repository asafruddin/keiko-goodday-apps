// ignore_for_file: one_member_abstracts

import 'package:dio/dio.dart';
import 'package:keiko_good_day/data/model/request/confirmation/picture_confirmation_body.dart';
import 'package:keiko_good_day/data/model/request/purchasing/purchasing_body.dart';
import 'package:keiko_good_day/data/model/request/redeem_gift/confirm_redeem_gift_body.dart';
import 'package:keiko_good_day/data/model/request/redeem_gift/redeem_gift_body.dart';
import 'package:keiko_good_day/data/model/response/redeem_gift/redeem_gift_history_model.dart';
import 'package:keiko_good_day/domain/entity/redeem_gift_history.dart';

abstract class ActorDatasource {
  Future<void> purchaseProduct(PurchasingBody body);
  Future<void> redeemGift(RedeemGiftBody body);
  Future<RedeemGiftHistoryEntity> getRedeemGiftHistory(int motorisId);
  Future<void> submitReport(PictureConfirmationBody body);
  Future<void> confirmRedeemGift(ConfirmRedeemGiftBody body);
}

class ActorDataSourceImpl implements ActorDatasource {
  ActorDataSourceImpl(this._dio);

  final Dio _dio;

  @override
  Future<void> purchaseProduct(PurchasingBody body) async {
    await _dio.post<dynamic>('/wholesale-deals/transactions',
        data: body.toJson());
    return;
  }

  @override
  Future<void> redeemGift(RedeemGiftBody body) async {
    await _dio.post<dynamic>('/redeem-points/exchange', data: body.toJson());
    return;
  }

  @override
  Future<RedeemGiftHistoryEntity> getRedeemGiftHistory(int motorisId) async {
    final result = await _dio.get<dynamic>('/redeem-points/history/$motorisId');
    return RedeemGiftHistoryModel.fromJson(result.data as Map<String, dynamic>);
  }

  @override
  Future<void> submitReport(PictureConfirmationBody body) async {
    final formData = FormData.fromMap({
      'shop_id': body.shopId,
      'motoris_id': body.motorisId,
      'description': body.description,
      'date': body.date,
      'longitude': body.longitude,
      'latitude': body.latitude,
      'point1': body.point1,
      'point2': body.point2,
      'point3': body.point3,
      'img1': body.img1 == null
          ? null
          : await MultipartFile.fromFile(body.img1 ?? ''),
      'img2': body.img2 == null
          ? null
          : await MultipartFile.fromFile(body.img2 ?? ''),
      'img3': body.img3 == null
          ? null
          : await MultipartFile.fromFile(body.img3 ?? '')
    });

    await _dio.post<dynamic>('/receive-shops/add', data: formData);
    return;
  }

  @override
  Future<void> confirmRedeemGift(ConfirmRedeemGiftBody body) async {
    final formData = FormData.fromMap({
      'motoris_id': body.motorisId,
      'img': await MultipartFile.fromFile(body.img ?? '')
    });
    await _dio.post<dynamic>('/redeem-points/confirm/${body.historyId}',
        data: formData);
    return;
  }
}
