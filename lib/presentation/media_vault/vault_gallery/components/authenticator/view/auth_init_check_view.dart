import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:watcha_body/presentation/media_vault/vault_gallery/components/authenticator/bloc/auth_initialization_checker_bloc.dart';

import 'package:watcha_body/presentation/media_vault/vault_gallery/components/authenticator/components/authorize_view.dart';
import 'package:watcha_body/presentation/media_vault/vault_gallery/components/authenticator/components/initialize_view.dart';

class AuthInitCheckView extends StatelessWidget {
  const AuthInitCheckView({super.key});
  static const routeName = '/vault-section/auth_init_check';

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthInitializationChecker,
        AuthInitializationCheckerState>(
      listener: (context, state) {},
      builder: (context, state) {
        return switch (state) {
          AuthInitializationCheckerStateInitial() =>

            // return const Text('No body invokes me');
            Center(
              child: CircularProgressIndicator(
                color: Theme.of(context).colorScheme.tertiaryFixed,
              ),
            ),
          AuthInitializationCheckerStateNotInitialized() =>
            const InitializeView(),
          AuthInitializationCheckerStateInitialized() => const AuthorizeView(),
          AuthInitializationCheckerStateLoading() =>
            const CircularProgressIndicator(),
          AuthInitializationCheckerStateFailed() =>
            const Center(child: Text('Failed to initialize')),
        };

        // return state.map(
        //   initial: (value) {},
        //   initialized: (value) {},
        //   notInitialized: (value) {},
        //   loading: (value) {},
        //   failed: (value) {},
        // );
      },
    );
  }
}
