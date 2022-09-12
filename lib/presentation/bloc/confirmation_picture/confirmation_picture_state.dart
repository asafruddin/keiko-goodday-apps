part of 'confirmation_picture_bloc.dart';

class ConfirmationPictureState extends Equatable {
  const ConfirmationPictureState(
      {this.isSubmiting = false, this.failOrSuccess});

  final bool isSubmiting;
  final Either<Failure, bool>? failOrSuccess;

  ConfirmationPictureState copyWith(
      {bool? isSubmiting, Either<Failure, bool>? failOrSuccess}) {
    return ConfirmationPictureState(
        isSubmiting: isSubmiting ?? this.isSubmiting,
        failOrSuccess: failOrSuccess ?? this.failOrSuccess);
  }

  @override
  List<Object?> get props => [isSubmiting, failOrSuccess];
}

class ConfirmationPictureInitial extends ConfirmationPictureState {}
