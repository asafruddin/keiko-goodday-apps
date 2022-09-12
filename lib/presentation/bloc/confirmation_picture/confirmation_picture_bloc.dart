import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:keiko_good_day/core/exceptions/failure.dart';
import 'package:keiko_good_day/data/model/request/confirmation/picture_confirmation_body.dart';
import 'package:keiko_good_day/data/model/request/redeem_gift/confirm_redeem_gift_body.dart';
import 'package:keiko_good_day/domain/use_case/actor/confirm_redeem_gift_usecase.dart';
import 'package:keiko_good_day/domain/use_case/actor/confirm_visit_usecase.dart';

part 'confirmation_picture_event.dart';
part 'confirmation_picture_state.dart';

class ConfirmationPictureBloc
    extends Bloc<ConfirmationPictureEvent, ConfirmationPictureState> {
  ConfirmationPictureBloc(this.redeemGiftUseCase, this.visitUseCase)
      : super(ConfirmationPictureInitial()) {
    on<ConfirmationPictureEvent>((event, emit) {});
    on<OnConfirmaRedeemGift>(onConfirmaRedeemGift);
    on<OnConfirmVisitShop>(onConfirmaVisitShop);
  }

  final ConfirmRedeemGiftUseCase redeemGiftUseCase;
  final ConfirmVisitUseCase visitUseCase;

  Future<void> onConfirmaRedeemGift(OnConfirmaRedeemGift event,
      Emitter<ConfirmationPictureState> emit) async {
    emit(state.copyWith(isSubmiting: true, failOrSuccess: null));
    final result = await redeemGiftUseCase.execute(event.body);

    result.fold(
        (l) => emit(state.copyWith(isSubmiting: false, failOrSuccess: left(l))),
        (r) => emit(
            state.copyWith(isSubmiting: false, failOrSuccess: right(true))));
  }

  Future<void> onConfirmaVisitShop(
      OnConfirmVisitShop event, Emitter<ConfirmationPictureState> emit) async {
    emit(state.copyWith(isSubmiting: true, failOrSuccess: null));
    final result = await visitUseCase.execute(event.body);

    result.fold(
        (l) => emit(state.copyWith(isSubmiting: false, failOrSuccess: left(l))),
        (r) => emit(
            state.copyWith(isSubmiting: false, failOrSuccess: right(true))));
  }
}
