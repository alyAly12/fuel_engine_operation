import 'package:activation_app/core/component/custom_issue_sent_success_screen.dart';
import 'package:activation_app/features/home_feature/presentation/view/home_screen.dart';
import 'package:activation_app/features/home_feature/presentation/view/report_issue_screen.dart';
import 'package:activation_app/features/pairing_feature/presentation/view/pairing_view.dart';
import 'package:activation_app/features/scan_feature/presentation/view/scan_screen.dart';
import 'package:activation_app/features/scan_feature/presentation/view/vehicle_activation_screen.dart';
import 'package:activation_app/features/scan_feature/presentation/widgets/report_chip_issue_screen.dart';
import 'package:activation_app/features/side_menu_feature/presentation/view/inner_screen/filter_screen_feature/presentation/view/filter_screen.dart';
import 'package:activation_app/features/side_menu_feature/presentation/view/inner_screen/history_feature/presentation/view/history_screen.dart';
import 'package:activation_app/features/side_menu_feature/presentation/view/side_menu_screen.dart';
import 'package:go_router/go_router.dart';
import '../../features/side_menu_feature/presentation/view/inner_screen/about_app_feature/about_app_screen.dart';
import '../../features/side_menu_feature/presentation/view/inner_screen/help_support_feature/help_and_support.dart';
import '../../features/splash_feature/presentation/view/splash_view.dart';
import '../component/custom_activation_success_screen.dart';
import '../component/custom_page_transition.dart';

abstract class AppRoute
{
  static const kPairingView = '/pairingView';
  static const kHomeView = '/homeView';
  static const kReportIssueView = '/reportIssueView';
  static const kReportIssueSuccessView = '/reportIssueSuccessView';
  static const kScanScreen = '/scanView';
  static const kVehicleActivationScreen = '/vehicleActivationView';
  static const kReportChipIssueView = '/reportChipIssueView';
  static const kRegistrationSuccessView = '/registrationSuccessView';
  static const kSideMenuView = '/sideMenuView';
  static const kHelpView = '/helpView';
  static const kAboutAppView ='/aboutAppView';
  static const kHistoryView ='/historyView';
  static const kFilterView ='/filterView';

static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder:(context,state)=>const SplashView(),
      ),
      GoRoute(
        path: kPairingView,
        builder:(context,state)=>const PairingScreen(),
        pageBuilder: (context, state) => buildPageWithDefaultTransition<void>(
          context: context,
          state: state,
          child: const PairingScreen(),
        ),
      ),
      GoRoute(
        path: kHomeView,
        builder:(context,state)=>const HomeScreen(),
        pageBuilder: (context, state) => buildPageWithDefaultTransition<void>(
          context: context,
          state: state,
          child: const HomeScreen(),
        ),
      ),
      GoRoute(
        path: kReportIssueView,
        builder:(context,state)=>const ReportIssueScreen(),
        pageBuilder: (context, state) => buildPageWithDefaultTransition<void>(
          context: context,
          state: state,
          child: const ReportIssueScreen(),
        ),
      ),
      GoRoute(
        path: kReportIssueSuccessView,
        builder:(context,state)=>const CustomIssueSentSuccess(),
        pageBuilder: (context, state) => buildPageWithDefaultTransition<void>(
          context: context,
          state: state,
          child: const CustomIssueSentSuccess(),
        ),
      ),
      GoRoute(
        path: kScanScreen,
        builder:(context,state)=>const ScanScreen(),
        pageBuilder: (context, state) => buildPageWithDefaultTransition<void>(
          context: context,
          state: state,
          child: const ScanScreen(),
        ),
      ),
      GoRoute(
        path: kVehicleActivationScreen,
        builder:(context,state)=>const VehicleActivationScreen(),
        pageBuilder: (context, state) => buildPageWithDefaultTransition<void>(
          context: context,
          state: state,
          child: const VehicleActivationScreen(),
        ),
      ),
      GoRoute(
        path: kReportChipIssueView,
        builder:(context,state)=>const ReportChipIssueScreen(),
        pageBuilder: (context, state) => buildPageWithDefaultTransition<void>(
          context: context,
          state: state,
          child: const ReportChipIssueScreen(),
        ),
      ),
      GoRoute(
        path: kRegistrationSuccessView,
        builder:(context,state)=>const CustomActivationSuccess(),
        pageBuilder: (context, state) => buildPageWithDefaultTransition<void>(
          context: context,
          state: state,
          child: const CustomActivationSuccess(),
        ),
      ),
      GoRoute(
        path: kSideMenuView,
        builder:(context,state)=>const SideMenuScreen(),
        pageBuilder: (context, state) => buildPageWithDefaultTransition<void>(
          context: context,
          state: state,
          child: const SideMenuScreen(),
        ),
      ),
      GoRoute(
        path: kHelpView,
        builder:(context,state)=>const HelpAndSupport(),
        pageBuilder: (context, state) => buildPageWithDefaultTransition<void>(
          context: context,
          state: state,
          child: const HelpAndSupport(),
        ),
      ),
      GoRoute(
        path: kAboutAppView,
        builder:(context,state)=>const AboutAppScreen(),
        pageBuilder: (context, state) => buildPageWithDefaultTransition<void>(
          context: context,
          state: state,
          child: const AboutAppScreen(),
        ),
      ),
      GoRoute(
        path: kHistoryView,
        builder:(context,state)=>const HistoryScreen(),
        pageBuilder: (context, state) => buildPageWithDefaultTransition<void>(
          context: context,
          state: state,
          child: const HistoryScreen(),
        ),
      ),
      GoRoute(
        path: kFilterView,
        builder:(context,state)=>const FilterScreen(),
        pageBuilder: (context, state) => buildPageWithDefaultTransition<void>(
          context: context,
          state: state,
          child: const FilterScreen(),
        ),
      ),
    ]);
}