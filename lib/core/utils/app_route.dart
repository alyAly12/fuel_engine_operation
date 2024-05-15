import 'package:activation_app/core/component/custom_issue_sent_success_screen.dart';
import 'package:activation_app/core/component/empty_home_screen.dart';
import 'package:activation_app/core/component/empty_screen.dart';
import 'package:activation_app/features/home_feature/presentation/widgets/notification_widget/notification_view.dart';
import 'package:activation_app/features/scan_feature/presentation/view/scan_screen.dart';
import 'package:activation_app/features/scan_feature/presentation/view/vehicle_activation_screen.dart';
import 'package:activation_app/features/scan_feature/presentation/widgets/report_chip_issue_screen.dart';
import 'package:go_router/go_router.dart';
import '../../features/home_feature/presentation/screens/home_screen.dart';
import '../../features/home_feature/presentation/screens/report_issue_screen.dart';
import '../../features/pairing_feature/presentation/screen/pairing_view.dart';
import '../../features/side_menu_feature/presentation/screens/inner_screen/about_app_feature/about_app_screen.dart';
import '../../features/side_menu_feature/presentation/screens/inner_screen/filter_screen_feature/presentation/view/filter_screen.dart';
import '../../features/side_menu_feature/presentation/screens/inner_screen/help_support_feature/help_and_support.dart';
import '../../features/side_menu_feature/presentation/screens/inner_screen/history_feature/presentation/view/history_screen.dart';
import '../../features/side_menu_feature/presentation/screens/inner_screen/profile_feature/presentation/view/profile_screen.dart';
import '../../features/side_menu_feature/presentation/screens/inner_screen/search_feature/presentation/view/search_result_screen.dart';
import '../../features/side_menu_feature/presentation/screens/inner_screen/search_feature/presentation/view/search_screen.dart';
import '../../features/side_menu_feature/presentation/screens/side_menu_screen.dart';
import '../../features/splash_feature/presentation/screens/splash_view.dart';
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
  static const kNotificationView ='/notificationView';
  static const kEmptyView ='/emptyView';
  static const kSearchScreen ='/searchView';
  static const kSearchResultScreen ='/searchResultScreen';
  static const kProfileScreen ='/profileView';
  static const kEmptyHomeScreen ='/emptyHomeScreen';

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
      GoRoute(
        path: kNotificationView,
        builder:(context,state)=>const NotificationScreen(),
        pageBuilder: (context, state) => buildPageWithDefaultTransition<void>(
          context: context,
          state: state,
          child: const NotificationScreen(),
        ),
      ),
      GoRoute(
        path: kEmptyView,
        builder:(context,state)=>const EmptyScreen(),
        pageBuilder: (context, state) => buildPageWithDefaultTransition<void>(
          context: context,
          state: state,
          child: const EmptyScreen(),
        ),
      ),
      GoRoute(
        path: kSearchScreen,
        builder:(context,state)=>const SearchScreen(),
        pageBuilder: (context, state) => buildPageWithDefaultTransition<void>(
          context: context,
          state: state,
          child: const SearchScreen(),
        ),
      ),
      GoRoute(
        path: kSearchResultScreen,
        builder:(context,state)=>const SearchResultScreen(),
        pageBuilder: (context, state) => buildPageWithDefaultTransition<void>(
          context: context,
          state: state,
          child: const SearchResultScreen(),
        ),
      ),
      GoRoute(
        path: kProfileScreen,
        builder:(context,state)=>const ProfileScreen(),
        pageBuilder: (context, state) => buildPageWithDefaultTransition<void>(
          context: context,
          state: state,
          child: const ProfileScreen(),
        ),
      ),
      GoRoute(
        path: kEmptyHomeScreen,
        builder:(context,state)=>const EmptyHomeScreen(),
        pageBuilder: (context, state) => buildPageWithDefaultTransition<void>(
          context: context,
          state: state,
          child: const EmptyHomeScreen(),
        ),
      ),
    ]);
}