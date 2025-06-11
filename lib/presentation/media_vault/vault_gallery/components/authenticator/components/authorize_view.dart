import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:watcha_body/presentation/media_vault/vault_gallery/components/authenticator/bloc/auth_gate_keeper_bloc.dart';
import 'package:watcha_body/presentation/media_vault/vault_gallery/components/authenticator/cubit/authenicate_cubit.dart';
import 'package:watcha_body/presentation/media_vault/vault_gallery/components/gallery_view/vault_gallery_view.dart';

class AuthorizeView extends StatelessWidget {
  const AuthorizeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthenicateCubit, AuthenicateState>(
      listener: (context, state) {
        switch (state) {
          case AuthenicateStateAuthenticated():
            // Navigator.pushNamed(context, VaultGalleryView.routeName);
            context
                .read<AuthGateKeeperBloc>()
                .add(const AuthGateKeeperEvent.triggerAuth());
            break;

          case AuthenicateStateUnauthenticated():
            ScaffoldMessenger.of(context)
                .showSnackBar(const SnackBar(content: Text('Wrong password')));
            break;
          case AuthenicateStateFailed(:final message):
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(message)));
            break;
          default:
            break;
        }

        // state.mapOrNull(
        //   authenticated: (value) {},
        //   unauthenticated: (value) {},
        //   failed: (value) {},
        // );
      },
      child: const _AuthForm(),
    );
  }
}

class _AuthForm extends StatefulWidget {
  const _AuthForm();

  @override
  State<_AuthForm> createState() => _AuthFormState();
}

class _AuthFormState extends State<_AuthForm> {
  final _formKey = GlobalKey<FormState>();
  final passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(18),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Unlock your gallary',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
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

              //20
              const SizedBox(height: 30),

              FilledButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    context
                        .read<AuthenicateCubit>()
                        .authenticate(passwordController.text);
                  }
                },
                child: const Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
