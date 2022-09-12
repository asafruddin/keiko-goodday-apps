// ignore_for_file: avoid_print

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:keiko_good_day/core/exceptions/failure.dart';
import 'package:keiko_good_day/data/model/request/purchasing/purchasing_body.dart';
import 'package:keiko_good_day/data/model/request/redeem_gift/redeem_gift_body.dart';
import 'package:keiko_good_day/domain/entity/product_entity.dart';
import 'package:keiko_good_day/domain/entity/redeem_gift_history.dart';
import 'package:keiko_good_day/domain/use_case/actor/get_redeem_gift_history_usecase.dart';
import 'package:keiko_good_day/domain/use_case/actor/purchase_usecase.dart';
import 'package:keiko_good_day/domain/use_case/actor/redeem_gift_usecase.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  ProductBloc(this.purchaseUseCase, this.giftUseCase, this.giftHistoryUseCase)
      : super(ProductInitial()) {
    on<OnInitialProductEvent>((event, emit) =>
        emit(state.copyWith(productCart: event.productEntity)));
    on<OnChangeProductQuantity>(onChangeProductQuantity);
    on<OnPurchasingProduct>(onPurchasingProduct);
    on<OnRedeemGift>(onRedeemGift);
    on<OnGetRedeemGiftHistory>(onGetRedeemGiftHistory);
  }

  final PurchaseUseCase purchaseUseCase;
  final RedeemGiftUseCase giftUseCase;
  final GetRedeemGiftHistoryUseCase giftHistoryUseCase;

  Future<void> onChangeProductQuantity(
      OnChangeProductQuantity event, Emitter<ProductState> emit) async {
    emit(state.copyWith(isCounting: true));
    final tempList = state.productCartList ?? <DataProductsEntity>[];
    final index =
        tempList.indexWhere((element) => element.id == event.product.id);

    final isExist = index > -1;

    if (isExist) {
      tempList.replaceRange(index, index + 1, [event.product]);
    } else {
      tempList.add(event.product.copyWith(quantity: event.product.quantity));
    }

    emit(state.copyWith(productCartList: tempList, isCounting: false));
  }

  Future<void> onPurchasingProduct(
      OnPurchasingProduct event, Emitter<ProductState> emit) async {
    emit(state.copyWith(isSubmiting: true));

    final result = await purchaseUseCase.execute(event.body);

    result.fold(
        (l) => emit(state.copyWith(isSubmiting: false, failOrSuccess: left(l))),
        (r) => emit(
            state.copyWith(isSubmiting: false, failOrSuccess: right(true))));
  }

  Future<void> onRedeemGift(
      OnRedeemGift event, Emitter<ProductState> emit) async {
    emit(state.copyWith(isSubmiting: true));

    final result = await giftUseCase.execute(event.body);

    result.fold(
        (l) => emit(state.copyWith(isSubmiting: false, failOrSuccess: left(l))),
        (r) => emit(
            state.copyWith(isSubmiting: false, failOrSuccess: right(true))));
  }

  Future<void> onGetRedeemGiftHistory(
      OnGetRedeemGiftHistory event, Emitter<ProductState> emit) async {
    final result = await giftHistoryUseCase.execute(event.motorisId);

    result.fold((l) => print('ERROR ---> $l'),
        (r) => emit(state.copyWith(giftHistoryEntity: r)));
  }
}
