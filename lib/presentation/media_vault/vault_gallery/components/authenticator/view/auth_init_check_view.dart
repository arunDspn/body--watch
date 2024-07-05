import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:watcha_body/presentation/media_vault/vault_gallery/components/authenticator/bloc/auth_initialization_checker_bloc.dart';

import '../components/authorize_view.dart';
import '../components/initialize_view.dart';

class AuthInitCheckView extends StatelessWidget {
  const AuthInitCheckView({super.key});
  static const routeName = '/vault-section/auth_init_check';

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthInitializationChecker,
        AuthInitializationCheckerState>(
      listener: (context, state) {},
      builder: (context, state) {
        return state.map(
          initial: (value) {
            // return const Text('No body invokes me');
            return Center(
              child: CircularProgressIndicator(
                color: Theme.of(context).colorScheme.tertiaryFixed,
              ),
            );
          },
          initialized: (value) {
            return const AuthorizeView();
          },
          notInitialized: (value) {
            return const InitializeView();
          },
          loading: (value) {
            return const CircularProgressIndicator();
          },
          failed: (value) {
            return const Center(child: Text('Failed to initialize'));
          },
        );
      },
    );
  }
}
