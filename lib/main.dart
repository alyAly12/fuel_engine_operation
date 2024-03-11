import 'package:activation_app/core/common_state/connection_check_bloc/connection_check_bloc.dart';
import 'package:activation_app/core/utils/app_consts.dart';
import 'package:activation_app/core/utils/app_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';
import 'core/common_state/custom_keyboard_bloc.dart';
import 'core/component/navigator_global.dart';
import 'core/utils/app_colors.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home:  ActivationApp(),
  ));
}

class ActivationApp extends StatelessWidget {
  const ActivationApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context)=>ConnectionCheckBloc()..add(CheckLocationEvent())..add(NfcCheckEvent())),
        BlocProvider(
          create: (context) => CustomKeyboardBloc(),
        ),
      ],
      child: BlocConsumer<ConnectionCheckBloc,ConnectionCheckState >(
        listenWhen: (previous, current) => previous != current,
        listener: (context, state) {
          if(state is NotConnectedState ){
            GlobalNavigator.showNotificationDialog(
                text: state.message,
                goIcon: state.icon,
                bkColor:const Color(0xffFEEDB6) ,
                iconColor: state.color
            );
          }else if(state is ConnectedState){
            GlobalNavigator.showNotificationDialog(
                text: state.message,
                goIcon: state.icon,
                bkColor:const Color(0xffEFF2F5) ,
                iconColor: state.color
            );
          }
          if(state is LocationNotConnectedState){
            GlobalNavigator.showNotificationDialog(
                text: state.message,
                goIcon: state.icon,
                bkColor:const Color(0xffFEEDB6) ,
                iconColor: state.color
            );
          }else if(state is LocationConnectedState){
            GlobalNavigator.showNotificationDialog(
                text: state.message,
                goIcon: state.icon,
                bkColor:const Color(0xffEFF2F5) ,
                iconColor: state.color
            );
          }
          if(state is NfcNotAvailabilityState){
            GlobalNavigator.showNotificationDialog(
                text: state.message,
                goIcon: state.icon,
                bkColor:const Color(0xffFEEDB6) ,
                iconColor: state.color
            );
          }
          else if(state is NfcAvailabilityState ){
            GlobalNavigator.showNotificationDialog(
                text: state.message,
                goIcon: state.icon,
                bkColor:const Color(0xffEFF2F5) ,
                iconColor: state.color
            );
          }
        },
        builder: (context, state) {
          return Sizer(
            builder: (context, orientation, deviceType) {
              return MaterialApp.router(
                key: navigatorKey,
                debugShowCheckedModeBanner: false,
                title: 'Activation-App',
                theme: ThemeData.light(useMaterial3: false).copyWith(
                  iconTheme: const IconThemeData(
                      color: AppColors.appBarColor, size: 0),
                  textTheme:
                  GoogleFonts.robotoTextTheme(ThemeData
                      .light()
                      .textTheme),
                ),
                routerConfig: AppRoute.router,
              );
            },
          );
        },
      ),
    );
  }
}

