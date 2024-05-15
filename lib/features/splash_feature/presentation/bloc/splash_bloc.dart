
import 'dart:async';

import 'package:activation_app/features/splash_feature/data/models/splash_response_model.dart';
import 'package:activation_app/features/splash_feature/domain/entities/splash_reponse_entity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/use_case/splash_use_case.dart';


part 'splash_event.dart';
part 'splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  SplashUseCase splashUseCase;
  SplashBloc(this.splashUseCase) : super(SplashInitial()) {
    on<SplashSettingEvent>(_getData);
  }
  FutureOr<void> _getData(SplashSettingEvent event, Emitter<SplashState> emit)async{
    final result = await splashUseCase.call(event.splashResponseModel);
    result.fold((l) => {emit(SplashFailureState(l.message))},
            (r) => {emit(SplashSuccessState(r))});
  }
@override
  void onChange(Change<SplashState> change) {
     print(change);
    super.onChange(change);
  }
}
