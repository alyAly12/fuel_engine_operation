import 'dart:async';

import 'package:activation_app/features/side_menu_feature/presentation/screens/inner_screen/profile_feature/data/models/profile_info_response_model.dart';
import 'package:activation_app/features/side_menu_feature/presentation/screens/inner_screen/profile_feature/domain/entity/profile_info_response_entity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/use_case/profile_info_use_case.dart';


part 'profile_info_event.dart';
part 'profile_info_state.dart';

class ProfileInfoBloc extends Bloc<ProfileInfoEvent, ProfileInfoState> {
  ProfileInfoUseCase profileInfoUseCase;
  ProfileInfoBloc(this.profileInfoUseCase) : super(ProfileInfoInitial()) {
    on<GetProfileInfoEvent>(_getInfo);
  }
  FutureOr<void>_getInfo(GetProfileInfoEvent event ,Emitter<ProfileInfoState>emit)async{
    final result = await profileInfoUseCase.call(event.profileInfoResponseModel);
    result.fold(
            (l) => {emit(ProfileInfoFailureState(l.message))},
            (r) => {emit(ProfileInfoSuccessState(r))}
    );
  }
 @override
  void onChange(Change<ProfileInfoState> change) {
   print(change);
    super.onChange(change);
  }
}
