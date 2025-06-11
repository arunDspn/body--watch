import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:watcha_body/presentation/media_vault/vault_gallery/components/authenticator/bloc/auth_gate_keeper_bloc.dart';
import 'package:watcha_body/presentation/media_vault/vault_gallery/components/authenticator/view/auth_init_check_view.dart';
import 'package:watcha_body/presentation/media_vault/vault_gallery/components/authenticator/view/vault_section.dart';
import 'package:watcha_body/presentation/media_vault/vault_gallery/components/gallery_view/vault_gallery_view.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  static const routeName = '/vault-section/auth-gate';

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        switch (context.read<AuthGateKeeperBloc>().state) {
          case AuthGateKeeperStateAuthenticated():
            Navigator.of(context).pushNamed(
              VaultGalleryView.routeName,
            );
            break;

          case AuthGateKeeperStateUnauthenticated():
            Navigator.of(context).pushNamed(AuthInitCheckView.routeName);
            break;

          default:
            break;
        }

        // context.read<AuthGateKeeperBloc>().state.mapOrNull(
        //       authenticated: (_) {},
        //       unauthenticated: (value) {},
        //     );
      },
    );
    return Builder(
      builder: (context) {
        return BlocListener<AuthGateKeeperBloc, AuthGateKeeperState>(
          listener: (context, state) async {
            switch (state) {
              case AuthGateKeeperStateAuthenticated():
                unawaited(navigatorKey.currentState!
                    .pushNamed(VaultGalleryView.routeName));
                break;

              case AuthGateKeeperStateUnauthenticated():
                unawaited(navigatorKey.currentState!
                    .pushNamed(AuthInitCheckView.routeName));
                break;

              default:
                break;
            }

            // state.mapOrNull(
            //   authenticated: (value) {},
            //   unauthenticated: (value) {},
            // );
          },
          child: const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          ),
        );
      },
    );
  }
}
