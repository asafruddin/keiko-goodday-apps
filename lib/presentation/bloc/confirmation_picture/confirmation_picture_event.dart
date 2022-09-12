part of 'confirmation_picture_bloc.dart';

abstract class ConfirmationPictureEvent extends Equatable {
  const ConfirmationPictureEvent();

  @override
  List<Object> get props => [];
}

class OnConfirmaRedeemGift extends ConfirmationPictureEvent {
  const OnConfirmaRedeemGift(this.body);

  final ConfirmRedeemGiftBody body;
}

class OnConfirmVisitShop extends ConfirmationPictureEvent {
  const OnConfirmVisitShop(this.body);

  final PictureConfirmationBody body;
}
