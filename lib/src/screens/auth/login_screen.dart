import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:form_validator/form_validator.dart';
import 'package:get/get.dart';
import 'package:job_camer/src/screens/auth/register_screen.dart';
import 'package:job_camer/src/screens/global/global_screen.dart';
import 'package:job_camer/src/shared/widgets/text_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool _isRemembered = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _formKey.currentState?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(15),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _buildTextHeader(),
                const SizedBox(height: 50),
                _buildBody(),
                const SizedBox(height: 32),
                _buildButtons(),
                _buidChangeAuth()
              ],
            ),
          ),
        ),
      ),
    );
  }

  Row _buidChangeAuth() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Vous n'avez pas de compte?"),
        TextButton(
          onPressed: _goToRegister,
          child: const Text("S'enregistrer"),
        ),
      ],
    );
  }

  Column _buildButtons() {
    return Column(
      children: [
        ElevatedButton(
          onPressed: _login,
          child: const Text("Connexion"),
        ),
        ElevatedButton.icon(
          onPressed: _googleLogin,
          icon: const Icon(Icons.g_mobiledata),
          label: const Text("Google"),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.red,
          ),
        )
      ],
    );
  }

  Column _buildBody() {
    return Column(
      children: [
        CustomTexTField(
          hintText: 'Email',
          controller: _emailController,
          validator: ValidationBuilder().required().email().build(),
        ),
        const SizedBox(height: 10),
        CustomPasswordTextField(
          controller: _passwordController,
          validator: ValidationBuilder().required().build(),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                CupertinoCheckbox(
                  value: _isRemembered,
                  onChanged: _onCheckboxChanged,
                ),
                const Text("Se souvenir de moi"),
              ],
            ),
            TextButton(
              onPressed: () {},
              child: const Text("Mot de passe oublie?"),
            ),
          ],
        )
      ],
    );
  }

  Column _buildTextHeader() {
    return Column(
      children: [
        Text(
          "Hey, Vous revoila sur Job Camer",
          style: Get.textTheme.titleLarge?.copyWith(
            color: Get.theme.primaryColor,
          ),
        ),
        const SizedBox(height: 10),
        const Text(
          "Connectez-vous à Job Camer Trouvez votre prochaine opportunité professionnelle!",
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  void _login() {
    if (!_formKey.currentState!.validate()) {
      return;
    }
    Get.to(() => const GlobalScreen());
  }

  void _onCheckboxChanged(bool? value) {
    setState(() {
      _isRemembered = value ?? false;
    });
  }

  void _googleLogin() {
    _login();
  }

  void _goToRegister() {
    Get.to(() => const RegisterScreen());
  }
}
