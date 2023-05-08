import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../Common/common.dart';
import '../Widget/widget.dart';

class LoginPageScreenWithProvider extends StatelessWidget {
  const LoginPageScreenWithProvider({super.key});

  @override
  Widget build(BuildContext context) {
    final loginProvider = Provider.of<LoginProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
        backgroundColor: Colors.transparent,
      ),
      extendBodyBehindAppBar: true,
      resizeToAvoidBottomInset: false,
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
                "https://i.pinimg.com/564x/b7/01/b4/b701b44dcdaaa77ded08cbac502771e9.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  TextFieldCustome(
                    hintText: 'Username',
                    onChanged: (value) {
                      loginProvider.validateUsername(value);
                    },
                    isValidTextField: loginProvider.isUsernameValid,
                    errorMessage: loginProvider.errorUsernameMessage,
                  ),
                  TextFieldCustome(
                    onChanged: (value) {
                      loginProvider.validatePassword(value);
                    },
                    isObsucreText: loginProvider.isHidePassword,
                    isValidTextField: loginProvider.isPasswordValid,
                    errorMessage: loginProvider.errorPasswordMessage,
                    hintText: 'Password',
                    suffixIconWidget: IconButton(
                      onPressed: () {
                        loginProvider.showHidePassword();
                      },
                      icon: loginProvider.isHidePassword
                          ? const Icon(Icons.lock)
                          : const Icon(
                              Icons.lock_open,
                            ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Align(
                    alignment: Alignment.topRight,
                    child: GestureDetector(
                      onTap: () {},
                      child: const Text(
                        'Forgot Password?',
                        style: TextStyle(fontSize: 14.0, color: Colors.blue),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            ButtonCustome(
              onPressed: loginProvider.isButtonUsernameDisable &&
                      loginProvider.isButtonPasswordDisable
                  ? () {
                      loginProvider.navigateToDashboard(context);
                    }
                  : null,
              isIcon: true,
              icon: const Icon(Icons.abc),
              title: 'Login',
              padding: const EdgeInsets.all(24),
            ),
            ButtonCustome(
              onPressed: () {
                loginProvider.navigateToRegisterPage(context);
              },
              title: 'Register',
            )
          ],
        ),
      ),
    );
  }
}
