import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../constants/numeric.dart';
import '../controllers/login_controller.dart';
import '../controllers/router_controller.dart';
import '../widgets/google_signin_button.dart';
import '../widgets/textfield_widget.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  final _loginFormKey = GlobalKey<FormState>();
  late final TextEditingController emailEditingController;
  late final TextEditingController passEditingController;
  late final TextEditingController pass2EditingController;
  @override
  void initState() {
    super.initState();
    emailEditingController = TextEditingController();
    passEditingController = TextEditingController();
    pass2EditingController = TextEditingController();
  }

  @override
  void dispose() {
    emailEditingController.dispose();
    passEditingController.dispose();
    pass2EditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(loginControllerProvider, (previous, next) {
      if (next.exception != null) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(next.exception!.message)));
      }
    });
    final loginState = ref.watch(loginControllerProvider);
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      body: Center(
        child: Form(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(spaceXXL),
              child: Center(
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(spaceXXL),
                    child: ConstrainedBox(
                      constraints: const BoxConstraints(maxWidth: 350),
                      child: Form(
                        key: _loginFormKey,
                        child: Column(
                          children: [
                            Text(
                              loginState.isLogin ? 'Iniciar sesión' : 'Crear cuenta',
                              style: textTheme.headlineSmall!.copyWith(color: colorScheme.primary),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: spaceXXXL),
                            TextFieldWidget(
                              controller: emailEditingController,
                              action: TextInputAction.next,
                              label: 'Correo electrónico',
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Debe proveer la identificacion del usuario a conectarse';
                                }
                                return null;
                              },
                            ),
                            const SizedBox(height: spaceL),
                            TextFieldWidget(
                              controller: passEditingController,
                              action: TextInputAction.done,
                              onEditingComplete: () {},
                              suffixIcon: IconButton(
                                onPressed: () => ref.read(loginControllerProvider.notifier).toggleVisibility(),
                                icon: loginState.isVisible
                                    ? const Icon(Icons.visibility_off)
                                    : const Icon(Icons.visibility),
                              ),
                              obscureText: !loginState.isVisible,
                              label: 'Clave',
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'El campo de clave no puede estar vacio';
                                }
                                return null;
                              },
                            ),
                            const SizedBox(height: spaceL),
                            if (!loginState.isLogin)
                              TextFieldWidget(
                                controller: pass2EditingController,
                                action: TextInputAction.done,
                                onEditingComplete: () {},
                                obscureText: !loginState.isVisible,
                                label: 'Vuelva a escribir la clave',
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Este campo no puede estar vacio';
                                  }
                                  if (value != passEditingController.text) {
                                    return 'La clave coincide';
                                  }
                                  return null;
                                },
                              ),
                            const SizedBox(height: spaceXXXL),
                            loginState.isLoading
                                ? const Center(child: CircularProgressIndicator())
                                : FilledButton(
                                    onPressed: () async {
                                      if (_loginFormKey.currentState!.validate()) {
                                        authenticate(
                                          AuthenticationMethod.emailAndPassword,
                                          emailEditingController.text,
                                          passEditingController.text,
                                        );
                                      }
                                    },
                                    child:
                                        loginState.isLogin ? const Text('Iniciar sesión') : const Text('Crear cuenta'),
                                  ),
                            const SizedBox(height: spaceXL),
                            TextButton(
                              onPressed: () {
                                ref.read(loginControllerProvider.notifier).toggleLogin();
                              },
                              child: loginState.isLogin ? const Text('Crear cuenta') : const Text('Iniciar sesión'),
                            ),
                            const SizedBox(height: spaceL),
                            const Divider(),
                            const SizedBox(height: spaceL),
                            GoogleSignInButton(
                              onPressed: () async {
                                await authenticate(AuthenticationMethod.google);
                              },
                            ),
                            const SizedBox(height: spaceL),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> authenticate(AuthenticationMethod method, [String? email, String? password]) async {
    final user = await ref.read(loginControllerProvider.notifier).authenticate(method, email,password);
    debugPrint('user: ${user?.email}');
    if (user != null) ref.read(goRouterProvider).goNamed('home');
  }
}
