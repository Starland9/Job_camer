import 'package:flutter/material.dart';
import 'package:form_validator/form_validator.dart';
import 'package:get/get.dart';
import 'package:job_camer/src/screens/auth/login_screen.dart';
import 'package:job_camer/src/screens/home/home_screen.dart';
import 'package:job_camer/src/shared/widgets/text_field.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

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
        const Text("Vous avez un compte?"),
        TextButton(
          onPressed: _gotoLogin,
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
          child: const Text("S'enregistrer"),
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
          hintText: 'Nom complet',
          controller: _nameController,
          validator: ValidationBuilder().minLength(3).maxLength(20).build(),
        ),
        const SizedBox(height: 10),
        CustomTexTField(
          hintText: 'Telephone',
          controller: _phoneController,
          validator: ValidationBuilder().minLength(10).maxLength(10).build(),
        ),
        const SizedBox(height: 10),
        CustomTexTField(
          hintText: 'Email',
          controller: _emailController,
          validator: ValidationBuilder().required().email().build(),
        ),
        const SizedBox(height: 10),
        CustomPasswordTextField(
          controller: _passwordController,
        ),
      ],
    );
  }

  Column _buildTextHeader() {
    return Column(
      children: [
        Text(
          "Bienvenue sur Job Camer",
          style: Get.textTheme.titleLarge?.copyWith(
            color: Get.theme.primaryColor,
          ),
        ),
        const SizedBox(height: 10),
        const Text(
          "Inscrivez-vous à Job Camer Trouvez votre prochaine opportunité professionnelle!",
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  void _login() {
    Get.to(() => const HomeScreen());
  }

  void _googleLogin() {
    _login();
  }

  void _gotoLogin() {
    Get.to(() => const LoginScreen());
  }
}
