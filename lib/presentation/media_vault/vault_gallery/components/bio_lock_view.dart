part of 'gallery_view/vault_gallery_view.dart';

class _BioLockView extends StatelessWidget {
  const _BioLockView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Locked',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          // Some dialogs saying use finger print to unlock
          const SizedBox(
            height: 16,
          ),
          const Text(
            'Use your fingerprint to unlock',
          ),
          // 1 Button to activate unlock biometric
          const SizedBox(
            height: 16,
          ),
          // ElevatedButton(
          //     onPressed: () {
          //       context.read<BodyPictureRepository>().cacheService.dos();
          //     },
          //     child: const Text('TEST')),
          const SizedBox(
            height: 16,
          ),
          ElevatedButton(
            onPressed: () async {
              context.read<LockGalleryCubit>().unlock();
              // try {
              //   final auth = LocalAuthentication();
              //   // ···
              //   final canAuthenticateWithBiometrics =
              //       await auth.canCheckBiometrics;
              //   final canAuthenticate = canAuthenticateWithBiometrics ||
              //       await auth.isDeviceSupported();

              //   if (canAuthenticate) {
              //     unawaited(
              //       auth
              //           .authenticate(
              //         localizedReason: 'Please authenticate to show gallery',
              //         options: const AuthenticationOptions(
              //           biometricOnly: true,
              //         ),
              //       )
              //           .then((value) {
              //         if (value) {
              //           context.read<LockGalleryCubit>().unlock();
              //         }
              //       }),
              //     );
              //   }
              // } on PlatformException catch (e) {
              //   debugPrint(e.toString());
              // } on Exception catch (e) {
              //   // TODO
              //   debugPrint(e.toString());
              // }
            },
            child: const Text('Activate'),
          ),
          const SizedBox(
            height: 16,
          ),
        ],
      ),
    );
  }
}
