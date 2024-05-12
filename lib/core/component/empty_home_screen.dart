import 'package:activation_app/core/component/subtitle_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import '../../features/home_feature/presentation/widgets/custom_header_container.dart';
import '../utils/app_colors.dart';
import '../utils/app_route.dart';
import '../utils/app_strings.dart';
import '../utils/assets_manager.dart';



class EmptyHomeScreen extends StatelessWidget {
  const EmptyHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        GoRouter.of(context).pushReplacement(AppRoute.kHomeView);
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        floatingActionButton: Padding(
          padding:const EdgeInsets.only(bottom: 15),
          child: FloatingActionButton(
            onPressed: (){
              GoRouter.of(context).push(AppRoute.kScanScreen);
            },
            backgroundColor: AppColors.redColor,
            child: const Icon(Icons.add_sharp,size: 30,),
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height:10,),
            const CustomHeaderContainer(),
            SizedBox(height: 20,),
            Lottie.asset(AssetsManager.noOrderLottie,fit: BoxFit.cover,height:200),
            SizedBox(height: 10,),
            SubTitleWidget(subTitle: AppStrings.emptyScreenTitle,fontSize:15 ,color:AppColors.lightTitleColor,fontWeight: FontWeight.normal,),
          ],
        ),
      ),
    );
  }
}
