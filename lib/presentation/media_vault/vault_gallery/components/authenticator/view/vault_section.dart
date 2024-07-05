import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:page_transition/page_transition.dart';
import 'package:watcha_body/presentation/media_vault/vault_gallery/components/authenticator/view/auth_check_view.dart';
import 'package:watcha_body/presentation/media_vault/vault_gallery/components/authenticator/view/auth_init_check_view.dart';
import 'package:watcha_body/presentation/media_vault/vault_gallery/components/gallery_view/vault_gallery_view.dart';
import 'package:watcha_body/presentation/media_vault/vault_gallery/cubit/filtered_gallery_images_cubit.dart';

class MyNavigatorObserver extends NavigatorObserver {
  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    // Handle route push event (e.g., print a message)
    print('Pushed route: ${route.settings.name}');
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    // Handle route pop event (e.g., update state)
    print('Popped route: ${route.settings.name}');
  }

  @override
  void didRemove(Route<dynamic> route, Route<dynamic>? previousRoute) {
    // Handle route removal event (e.g., perform cleanup)
    print('Removed route: ${route.settings.name}');
  }

  @override
  void didReplace({Route? newRoute, Route? oldRoute}) {
    // TODO: implement didReplace

    print(
        'Replaced route: ${oldRoute?.settings.name} by ${newRoute?.settings.name}');
  }
}

final navigatorKey = GlobalKey<NavigatorState>();

class VaultSection extends StatefulWidget {
  const VaultSection({super.key});

  @override
  State<VaultSection> createState() => _VaultSectionState();
}

class MyTrans extends TransitionDelegate {
  @override
  Iterable<RouteTransitionRecord> resolve({
    required List<RouteTransitionRecord> newPageRouteHistory,
    required Map<RouteTransitionRecord?, RouteTransitionRecord>
        locationToExitingPageRoute,
    required Map<RouteTransitionRecord?, List<RouteTransitionRecord>>
        pageRouteToPagelessRoutes,
  }) {
    // TODO: implement resolve
    throw UnimplementedError();
  }
}

class _VaultSectionState extends State<VaultSection> {
  // static const String routeName = '/';

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Navigator(
        observers: [
          MyNavigatorObserver(),
        ],
        // transitionDelegate: DefaultTransitionDelegate(),

        onGenerateRoute: (settings) {
          print(settings.name);
          late Widget page;
          switch (settings.name) {
            case AuthGate.routeName:
              page = const AuthGate();
            case AuthInitCheckView.routeName:
              page = const AuthInitCheckView();

            case VaultGalleryView.routeName:
              page = MultiBlocProvider(
                providers: [
                  BlocProvider(
                    create: (context) => FilteredGalleryImagesCubit(),
                  ),
                ],
                child: const VaultGalleryView(),
              );
            default:
              page = Scaffold(
                body: Center(
                  child: Text('No route defined for ${settings.name}'),
                ),
              );
          }
          // return MaterialPageRoute<dynamic>(
          //   builder: (context) {
          //     return page;
          //   },
          //   settings: settings,
          // );

          return PageTransition(
            type: PageTransitionType.fade,
            child: page,
            settings: settings,
          );
        },
        initialRoute: AuthGate.routeName,
        key: navigatorKey,
      ),
    );
  }
}
