import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:watcha_body/presentation/media_vault/vault_gallery/components/authenticator/bloc/auth_gate_keeper_bloc.dart';
import 'package:watcha_body/presentation/media_vault/vault_gallery/components/authenticator/bloc/auth_initialization_checker_bloc.dart';
import 'package:watcha_body/presentation/media_vault/vault_gallery/components/authenticator/cubit/create_password_cubit.dart';

class InitializeView extends StatefulWidget {
  const InitializeView({super.key});

  @override
  State<InitializeView> createState() => _InitializeViewState();
}

class _InitializeViewState extends State<InitializeView> {
  // TextEditing controller
  final passwordController = TextEditingController();
  final rePasswordController = TextEditingController();

  // Key
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocListener<CreatePasswordCubit, CreatePasswordState>(
      listener: (context, state) {
        state.mapOrNull(
          success: (value) {
            // context
            //     .read<AuthInitializationChecker>()
            //     .add(const AuthInitializationCheckerEvents.checkAuth());
            context
                .read<AuthGateKeeperBloc>()
                .add(const AuthGateKeeperEvent.triggerUnAuth());
          },
          failed: (value) {
            // Snackbar
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(value.message)));
          },
        );
      },
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(18),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Set Encryption Password',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                // 10
                const SizedBox(height: 10),
                Text(
                  "Enter a strong password to encrypt photos. Re-enter the password for confirmation. Ensure it's at least 8 characters with letters, numbers, and symbols for security.",
                  style: Theme.of(context).textTheme.bodySmall,
                  textAlign: TextAlign.center,
                ),
                // 30
                const SizedBox(height: 30),
                TextFormField(
                  autovalidateMode: AutovalidateMode.always,
                  decoration: const InputDecoration(
                    label: Text('Password'),
                    border: OutlineInputBorder(),
                  ),
                  controller: passwordController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                ),
                // 10
                const SizedBox(height: 20),

                TextFormField(
                  autovalidateMode: AutovalidateMode.always,
                  decoration: const InputDecoration(
                    label: Text('Re-Type Password'),
                    border: OutlineInputBorder(),
                  ),
                  controller: rePasswordController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    } else if (value != passwordController.text) {
                      return 'Password does not match';
                    }
                    return null;
                  },
                ),

                //20
                const SizedBox(height: 30),

                FilledButton(
                  onPressed: () {
                    // Validate returns true if the form is valid, or false otherwise.
                    if (_formKey.currentState!.validate()) {
                      context
                          .read<CreatePasswordCubit>()
                          .createPassword(passwordController.text);
                    }
                  },
                  child: const Text('Submit'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
