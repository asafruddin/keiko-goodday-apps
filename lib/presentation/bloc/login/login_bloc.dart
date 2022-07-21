// ignore_for_file: avoid_redundant_argument_values

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:keiko_good_day/core/exceptions/failure.dart';
import 'package:keiko_good_day/core/injection/di.dart';
import 'package:keiko_good_day/core/local_storage/shared_preferences.dart';
import 'package:keiko_good_day/core/utils/constant/key_constant.dart';
import 'package:keiko_good_day/data/model/request/auth/login_body.dart';
import 'package:keiko_good_day/domain/entity/login_entity.dart';
import 'package:keiko_good_day/domain/use_case/auth/login_usecase.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc(this.useCase) : super(LoginInitial()) {
    on<OnloginEvent>(onLoginEvent);
  }
  final LoginUseCase useCase;
  final SharedPrefs prefs = sl<SharedPrefs>();

  Future onLoginEvent(OnloginEvent event, Emitter<LoginState> emit) async {
    emit(state.copyWith(
        isLogingIn: true,
        isLoginSuccess: false,
        failure: null,
        loginEntity: null));

    final result = await useCase.execute(event.body!);
    result.fold(
        (l) => emit(state.copyWith(
            isLogingIn: false, failure: l, isLoginSuccess: false)), (r) {
      if (r.status == 200) {
        if (r.token != null && r.token!.isNotEmpty) {
          prefs.putString(KeyConstant.keyAccessToken, r.token!);
        }
        emit(state.copyWith(
            isLogingIn: false, loginEntity: r, isLoginSuccess: true));
      } else {
        emit(state.copyWith(
            isLoginSuccess: false,
            isLogingIn: false,
            failure: ServerFailure(message: r.message)));
      }
    });
  }
}
