import 'dart:async';

import 'package:activation_app/features/pairing_feature/domain/entities/login_request_entity.dart';
import 'package:activation_app/features/pairing_feature/domain/entities/login_response_entity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/use_case/login_use_case.dart';

part 'login_event.dart';

part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginUseCase loginUseCase;

  LoginBloc(this.loginUseCase) : super(LoginInitial()) {
    on<LoginUserEvent>(_userLogin);
  }

  Future<FutureOr<void>> _userLogin(
      LoginUserEvent event, Emitter<LoginState> emit) async {
    final userAccount = await loginUseCase.call(event.loginRequestEntity);

    userAccount.fold(
        (l) => {emit(LoginFailureState(l.message)), print('left ${l.message}')},
        (r) => {emit(LoginSuccessState(r)), print('right ${r.message}')});
  }
}
