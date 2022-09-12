import 'package:dartz/dartz.dart';
import 'package:keiko_good_day/core/exceptions/failure.dart';
import 'package:keiko_good_day/data/model/request/confirmation/picture_confirmation_body.dart';
import 'package:keiko_good_day/data/model/request/purchasing/purchasing_body.dart';
import 'package:keiko_good_day/data/model/request/redeem_gift/confirm_redeem_gift_body.dart';
import 'package:keiko_good_day/data/model/request/redeem_gift/redeem_gift_body.dart';
import 'package:keiko_good_day/domain/entity/redeem_gift_history.dart';

// ignore: one_member_abstracts
abstract class ActorRepository {
  Future<Either<Failure, void>> purchaseProduct(PurchasingBody body);
  Future<Either<Failure, void>> redeemGift(RedeemGiftBody body);
  Future<Either<Failure, RedeemGiftHistoryEntity>> getRedeemGiftHistory(
      int motorisId);
  Future<Either<Failure, void>> confirmRedeemGift(ConfirmRedeemGiftBody body);
  Future<Either<Failure, void>> confirmVisitShop(PictureConfirmationBody body);
}
