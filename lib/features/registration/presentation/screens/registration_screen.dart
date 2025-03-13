import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:neosoft_assessment/features/registration/presentation/screens/info_screen.dart';
import '../../../../core/utils/validators.dart';
import '../cubit/gender_cubit.dart';
import '../cubit/password_visibility_cubit.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_text_field.dart';
import '../widgets/profile_image_picker.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationViewState();
}

class _RegistrationViewState extends State<RegistrationScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final _formKey = GlobalKey<FormState>();

  void _validateAndProceed(BuildContext context) {
    final genderCubit = context.read<GenderCubit>();

    if (_formKey.currentState!.validate()) {
      if (genderCubit.state == null) {
        genderCubit.showValidationError(); // Trigger error state in Bloc
        return;
      }

      log("Form is valid and gender selected");
      Navigator.of(
        context,
      ).push(MaterialPageRoute(builder: (context) => ProfessionalInfoScreen()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Register",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
        ),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          children: [
            const ProfileImagePicker(),
            CustomTextField(
              label: "First Name*",
              controller: nameController,
              hintText: "Enter your first name",
              icon: Icons.person,
              validator: Validators.validateName,
              keyboardType: TextInputType.name,
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp(r'^[a-zA-Z ]*$')),
              ],
              obscureText: false,
            ),
            const SizedBox(height: 15),
            CustomTextField(
              label: "Last Name*",
              controller: lastNameController,
              hintText: "Enter your last name",
              validator: Validators.validateName,
              icon: Icons.person_outline,
              obscureText: false,
              keyboardType: TextInputType.name,
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp(r'^[a-zA-Z ]*$')),
              ],
            ),
            const SizedBox(height: 15),
            CustomTextField(
              label: "Phone Number*",
              controller: phoneController,
              hintText: "Enter your phone number",
              icon: Icons.phone,
              validator: Validators.validatePhone,
              keyboardType: TextInputType.phone,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              obscureText: false,
            ),
            const SizedBox(height: 15),
            CustomTextField(
              label: "Email",
              controller: emailController,
              hintText: "Enter your email",
              icon: Icons.email,
              validator: Validators.validateEmail,
              obscureText: false,
            ),
            const SizedBox(height: 15),

            /// Gender Selection
            BlocBuilder<GenderCubit, Gender?>(
              builder: (context, selectedGender) {
                final hasError = context.read<GenderCubit>().hasError;
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Gender*",
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Radio<Gender>(
                          value: Gender.male,
                          groupValue: selectedGender,
                          onChanged: (Gender? value) {
                            if (value != null) {
                              context.read<GenderCubit>().selectGender(value);
                            }
                          },
                        ),
                        const Text("Male"),
                        const SizedBox(width: 20),
                        Radio<Gender>(
                          value: Gender.female,
                          groupValue: selectedGender,
                          onChanged: (Gender? value) {
                            if (value != null) {
                              context.read<GenderCubit>().selectGender(value);
                            }
                          },
                        ),
                        const Text("Female"),
                      ],
                    ),
                    if (hasError) // Show error message if validation failed
                      const Padding(
                        padding: EdgeInsets.only(left: 10, top: 5),
                        child: Text(
                          "Please select your gender",
                          style: TextStyle(color: Colors.red, fontSize: 14),
                        ),
                      ),
                  ],
                );
              },
            ),

            const SizedBox(height: 15),
            BlocBuilder<PasswordVisibilityCubit, bool>(
              builder: (context, isPasswordVisible) {
                return CustomTextField(
                  label: "Password*",
                  controller: passwordController,
                  hintText: "Enter your password",
                  icon: Icons.lock,
                  suffixIcon:
                      isPasswordVisible
                          ? Icons.visibility
                          : Icons.visibility_off,
                  onSuffixIconTap:
                      () =>
                          context
                              .read<PasswordVisibilityCubit>()
                              .toggleVisibility(),
                  validator: Validators.validatePassword,
                  obscureText: !isPasswordVisible,
                  isPassword: true,
                );
              },
            ),

            const SizedBox(height: 15),
            CustomTextField(
              label: "Confirm Password",
              controller: confirmPasswordController,
              hintText: "Password",
              icon: Icons.email,
              validator:
                  (value) => Validators.validateConfirmPassword(
                    value,
                    passwordController.text,
                  ),
              obscureText: false,
            ),
            const SizedBox(height: 20),
            CustomButton(
              label: "Next",
              onPressed: () => _validateAndProceed(context),
            ),
          ],
        ),
      ),
    );
  }
}
