import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:keiko_good_day/core/exceptions/failure.dart';
import 'package:keiko_good_day/data/datasource/actor_datasource.dart';
import 'package:keiko_good_day/data/model/request/confirmation/picture_confirmation_body.dart';
import 'package:keiko_good_day/data/model/request/purchasing/purchasing_body.dart';
import 'package:keiko_good_day/data/model/request/redeem_gift/confirm_redeem_gift_body.dart';
import 'package:keiko_good_day/data/model/request/redeem_gift/redeem_gift_body.dart';
import 'package:keiko_good_day/domain/entity/redeem_gift_history.dart';
import 'package:keiko_good_day/domain/repository/actor_repository.dart';

class ActorRepoImpl implements ActorRepository {
  ActorRepoImpl(this.apiSource);

  final ActorDatasource apiSource;

  @override
  Future<Either<Failure, void>> purchaseProduct(PurchasingBody body) async {
    try {
      return apiSource.purchaseProduct(body).then(right);
    } on DioError catch (e) {
      final failure = ServerFailure(message: e.message);
      return left(failure);
    } catch (e) {
      return left(AnotherFailure('Terjadi Kesalahan : ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, void>> redeemGift(RedeemGiftBody body) async {
    try {
      return apiSource.redeemGift(body).then(right);
    } on DioError catch (e) {
      final failure = ServerFailure(message: e.message);
      return left(failure);
    } catch (e) {
      return left(AnotherFailure('Terjadi Kesalahan : ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, RedeemGiftHistoryEntity>> getRedeemGiftHistory(
      int motorisId) async {
    try {
      return apiSource.getRedeemGiftHistory(motorisId).then(right);
    } on DioError catch (e) {
      final failure = ServerFailure(message: e.message);
      return left(failure);
    } catch (e) {
      return left(AnotherFailure('Terjadi Kesalahan : ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, void>> confirmRedeemGift(
      ConfirmRedeemGiftBody body) async {
    try {
      return apiSource.confirmRedeemGift(body).then(right);
    } on DioError catch (e) {
      final failure = ServerFailure(message: e.message);
      return left(failure);
    } catch (e) {
      return left(AnotherFailure('Terjadi Kesalahan : ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, void>> confirmVisitShop(
      PictureConfirmationBody body) async {
    try {
      return apiSource.submitReport(body).then(right);
    } on DioError catch (e) {
      final failure = ServerFailure(message: e.message);
      return left(failure);
    } catch (e) {
      return left(AnotherFailure('Terjadi Kesalahan : ${e.toString()}'));
    }
  }
}
