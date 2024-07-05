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
        context.read<AuthGateKeeperBloc>().state.mapOrNull(
          authenticated: (_) {
            Navigator.of(context).pushNamed(
              VaultGalleryView.routeName,
            );
          },
          unauthenticated: (value) {
            Navigator.of(context).pushNamed(AuthInitCheckView.routeName);
          },
        );
      },
    );
    return Builder(
      builder: (context) {
        return BlocListener<AuthGateKeeperBloc, AuthGateKeeperState>(
          listener: (context, state) async {
            state.mapOrNull(
              authenticated: (value) {
                navigatorKey.currentState!
                    .pushNamed(VaultGalleryView.routeName);
              },
              unauthenticated: (value) {
                navigatorKey.currentState!
                    .pushNamed(AuthInitCheckView.routeName);
              },
            );
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
