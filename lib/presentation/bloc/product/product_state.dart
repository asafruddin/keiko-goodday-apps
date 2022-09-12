part of 'product_bloc.dart';

class ProductState extends Equatable {
  const ProductState(
      {this.productCart,
      this.productCartList,
      this.isCounting = false,
      this.failOrSuccess,
      this.isSubmiting = false,
      this.giftHistoryEntity});

  final ProductEntity? productCart;
  final List<DataProductsEntity>? productCartList;
  final bool isCounting;
  final Either<Failure, bool>? failOrSuccess;
  final bool isSubmiting;
  final RedeemGiftHistoryEntity? giftHistoryEntity;

  ProductState copyWith(
      {ProductEntity? productCart,
      List<DataProductsEntity>? productCartList,
      bool? isCounting,
      Either<Failure, bool>? failOrSuccess,
      bool? isSubmiting,
      RedeemGiftHistoryEntity? giftHistoryEntity}) {
    return ProductState(
        productCart: productCart ?? this.productCart,
        isCounting: isCounting ?? this.isCounting,
        productCartList: productCartList ?? this.productCartList,
        failOrSuccess: failOrSuccess ?? this.failOrSuccess,
        isSubmiting: isSubmiting ?? this.isSubmiting,
        giftHistoryEntity: giftHistoryEntity ?? this.giftHistoryEntity);
  }

  @override
  List<Object?> get props => [
        productCart,
        productCartList,
        isCounting,
        failOrSuccess,
        isSubmiting,
        giftHistoryEntity
      ];
}

class ProductInitial extends ProductState {}
