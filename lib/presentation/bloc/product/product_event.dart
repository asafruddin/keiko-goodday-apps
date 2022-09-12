part of 'product_bloc.dart';

abstract class ProductEvent extends Equatable {
  const ProductEvent();

  @override
  List<Object> get props => [];
}

class OnInitialProductEvent extends ProductEvent {
  const OnInitialProductEvent(this.productEntity);

  final ProductEntity productEntity;
}

class OnChangeProductQuantity extends ProductEvent {
  const OnChangeProductQuantity(this.product);

  final DataProductsEntity product;
}

class OnPurchasingProduct extends ProductEvent {
  const OnPurchasingProduct(this.body);

  final PurchasingBody body;
}

class OnRedeemGift extends ProductEvent {
  const OnRedeemGift(this.body);

  final RedeemGiftBody body;
}

class OnGetRedeemGiftHistory extends ProductEvent {
  const OnGetRedeemGiftHistory(this.motorisId);

  final int motorisId;
}
