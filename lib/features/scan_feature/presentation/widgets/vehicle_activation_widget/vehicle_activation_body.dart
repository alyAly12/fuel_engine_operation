import 'package:activation_app/features/scan_feature/presentation/widgets/vehicle_activation_widget/vehicle_detail_plate_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../../core/component/custom_decorated_line.dart';
import '../../../../../core/component/custom_key_board.dart';
import '../../../../../core/component/custom_log_button.dart';
import '../../../../../core/component/custom_text_widget.dart';
import '../../../../../core/functions/pick_image_function.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_dialog.dart';
import '../../../../../core/utils/app_route.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/utils/assets_manager.dart';
import '../../../../../core/utils/auth_validator.dart';

class VehicleActivationBody extends StatefulWidget {
  const VehicleActivationBody({super.key});

  @override
  State<VehicleActivationBody> createState() => _VehicleActivationBodyState();
}

class _VehicleActivationBodyState extends State<VehicleActivationBody> {
  final formKey = GlobalKey<FormState>();
  late TextEditingController vehicleNumber ;
  late TextEditingController vehicleLetter;
  late FocusNode numberNode;
  late FocusNode letterNode;
  XFile? _pickedImage;
  XFile? _pickedImage2;

  @override
  void initState() {
    vehicleNumber =TextEditingController();
    vehicleLetter = TextEditingController();
    numberNode =FocusNode();
    letterNode =FocusNode();
    letterNode.addListener(() {_onFocusChange();});
    super.initState();
  }
  @override
  void dispose() {
    vehicleLetter.dispose();
    vehicleNumber.dispose();
    numberNode.dispose();
    letterNode..removeListener(() {_onFocusChange();})..dispose();
    super.dispose();
  }
  void _onFocusChange() {
    setState(() {});
  }
  void removePickedImage(){
    setState(() {
      _pickedImage =null;
    });
  }

  void removePickedImage2(){
    setState(() {
      _pickedImage2 =null;
    });
  }
  Future<void> localImagePicker() async {
    final ImagePicker picker = ImagePicker();
    _pickedImage = await picker.pickImage(source: ImageSource.camera );
    setState(() {});
  }
  Future<void> localImagePicker2() async {
    final ImagePicker picker = ImagePicker();
    _pickedImage2 = await picker.pickImage(source: ImageSource.camera);
    setState(() {});
  }
  Future<void> upLoadImage() async {
    final isValid = formKey.currentState!.validate();
    if(isValid && _pickedImage != null && _pickedImage2 != null){
      GoRouter.of(context).pushReplacement(AppRoute.kRegistrationSuccessView);
    }
    if ( _pickedImage == null || _pickedImage2 == null) {
      DialogsServices.warningDialog(
          context: context, title: 'Please select an image', fct: () {});
      return;
    }else{
      return ;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      reverse: true,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 20,),
            Align(
              alignment: Alignment.topLeft,
              child: CustomTextWidget(
                title: AppStrings.plateNumber,
                fontSize: 14,
                color: AppColors.darkGrey,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            VehicleDetailsPlateContainer(
              keyForm: formKey,
              carNum: vehicleNumber,
              carLetter: vehicleLetter,
              letterNode: letterNode,
              numberNode: numberNode,
              validatorNum: (value){
                return AuthValidator.vehicleNumberValidator(value);
              },
              validatorLetter: (value){
                return AuthValidator.vehicleLetterValidator(value);
              },
              onLetterFieldSubmitted:(value){
                vehicleLetter.text ==value;
              } ,
              onNumberFieldSubmitted:(value){
                vehicleNumber.text ==value;
              } ,
            ),

            const SizedBox(height: 5,),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Flexible(
                  flex:6,
                  child: CustomDecoratedTextLine(title: AppStrings.numbers),
                ),
                const SizedBox(width: 5,),
                Flexible(
                  flex:5,
                  child: CustomDecoratedTextLine(title: AppStrings.letters),
                ),
              ],
            ),
            const SizedBox(height: 40,),
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: 6.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  PickImageFunction(
                    pickedImage: _pickedImage,
                    image: AssetsManager.camCam,
                    imagePickerFun: ()async{
                      await localImagePicker();
                      },
                    removeTheImage: (){
                      removePickedImage();
                    },
                    file:_pickedImage?.path,
                    title: AppStrings.plate,
                    titleColor: AppColors.lightTitleColor,
                  ),
                  PickImageFunction(
                    pickedImage: _pickedImage2,
                    image: AssetsManager.camCam,
                    imagePickerFun: ()async{
                      await localImagePicker2();
                      },
                    removeTheImage: (){
                      removePickedImage2();
                    },
                    file:_pickedImage2?.path,
                    title: AppStrings.chipNum,
                    titleColor: AppColors.lightTitleColor,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Padding(
              padding:  const EdgeInsets.symmetric(horizontal: 5),
              child: CustomLogButton(
                  textColor:Colors.white,
                  textWeight: FontWeight.w500,
                  onPressed: (){
                    upLoadImage();
                  },
                  color:(_pickedImage == null&& _pickedImage2 ==null)?AppColors.orderNumberColor:AppColors.redColor,
                  title: AppStrings.activate,
                  showIcon: true),
            ),

            letterNode.hasFocus?CustomKeyBoard(controller: vehicleLetter, focusNode: letterNode):Container(),
          ],
        ),
      ),
    );
  }
}
