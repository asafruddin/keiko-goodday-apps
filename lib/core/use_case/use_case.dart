import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:keiko_good_day/core/exceptions/failure.dart';

abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> build(Params params);

  Future<Either<Failure, Type>> execute(Params params) {
    return build(params).onError((error, stackTrace) {
      Failure failure;
      if (error is Failure) {
        failure = error;
      } else if (error is DioError) {
        if (error.type == DioErrorType.other) {
          failure = ServerFailure(message: error.message);
        } else if (error.response!.statusCode! < 500) {
          // ignore: avoid_dynamic_calls
          failure = ServerFailure(message: error.response!.data['message']);
        } else {
          final message = error.response!.statusMessage;
          failure = ServerFailure(message: message);
        }
      } else {
        failure = AnotherFailure(error.toString());
      }
      return Future.value(Left(failure));
    });
  }

  // Stream<Either<Failure, Type>> execute(Params params) {
  //   return build(params).onErrorResume((error, stackTrace) {
  // Failure failure;
  // if (error is Failure) {
  //   failure = error;
  // } else if (error is DioError) {
  //   if (error.type == DioErrorType.other) {
  //     failure = ServerFailure(message: error.message);
  //   } else if (error.response!.statusCode! < 500) {
  //     // ignore: avoid_dynamic_calls
  //     failure = ServerFailure(message: error.response!.data['message']);
  //   } else {
  //     final message = error.response!.statusMessage;
  //     failure = ServerFailure(message: message);
  //   }
  // } else {
  //   failure = AnotherFailure(error.toString());
  // }
  // return Stream.value(Left(failure));
  //   });
  // }
}

class NoParams extends Equatable {
  @override
  List<Object?> get props => [];
}
