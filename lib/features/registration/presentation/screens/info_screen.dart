import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:neosoft_assessment/core/extension/extensions.dart';
import '../../../../core/enums/enums.dart';
import '../../../../core/utils/validators.dart';
import '../cubit/dropdown_textfield_cubit.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_dropdown.dart';
import '../widgets/custom_text_field.dart';

class ProfessionalInfoScreen extends StatefulWidget {
  const ProfessionalInfoScreen({super.key});

  @override
  State<ProfessionalInfoScreen> createState() => _ProfessionalInfoScreenState();
}

class _ProfessionalInfoScreenState extends State<ProfessionalInfoScreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController universityController = TextEditingController();
  final TextEditingController gradeController = TextEditingController();
  final TextEditingController experienceYearController =
      TextEditingController();
  final TextEditingController designationController = TextEditingController();
  final TextEditingController domainController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Your Info",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 35),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              const Text(
                "Educational Info",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              SizedBox(height: 10),

              BlocBuilder<DropdownCubit<EducationLevel>, EducationLevel?>(
                builder: (context, selectedEducation) {
                  return CustomDropdownField<EducationLevel>(
                    label: "Education*",
                    value: selectedEducation,
                    hintText: "Select Your Qualification",
                    items: EducationLevel.values,
                    getLabel: (e) => e.displayName,
                    onChanged: (value) {
                      if (value != null) {
                        context
                            .read<DropdownCubit<EducationLevel>>()
                            .selectValue(value);
                      }
                    },
                  );
                },
              ),
              const SizedBox(height: 15),

              BlocBuilder<DropdownCubit<YearOfPassing>, YearOfPassing?>(
                builder: (context, yearOfPassing) {
                  return CustomDropdownField<YearOfPassing>(
                    label: "Year of Passing*",
                    value: yearOfPassing,
                    hintText: "Enter year of Passing",
                    items: YearOfPassing.values,
                    getLabel: (e) => e.displayName,
                    onChanged: (value) {
                      if (value != null) {
                        context
                            .read<DropdownCubit<YearOfPassing>>()
                            .selectValue(value);
                      }
                    },
                  );
                },
              ),
              SizedBox(height: 15),
              CustomTextField(
                label: "University*",
                controller: universityController,
                hintText: "Enter your University",
                keyboardType: TextInputType.name,
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r'^[a-zA-Z ]*$')),
                ],
                obscureText: false,
              ),
              SizedBox(height: 15),
              CustomTextField(
                label: "Grade*",
                controller: gradeController,
                hintText: "Enter your Grade or Percentage",
                obscureText: false,
              ),
              SizedBox(height: 18),
              const Text(
                "Professional Info",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              SizedBox(height: 15),
              BlocBuilder<DropdownCubit<ExperienceLevel>, ExperienceLevel?>(
                builder: (context, yearOfPassing) {
                  return CustomDropdownField<ExperienceLevel>(
                    label: "Year of Passing*",
                    value: yearOfPassing,
                    hintText: "Enter year of Passing",
                    items: ExperienceLevel.values,
                    getLabel: (e) => e.displayName,
                    onChanged: (value) {
                      if (value != null) {
                        context
                            .read<DropdownCubit<ExperienceLevel>>()
                            .selectValue(value);
                      }
                    },
                  );
                },
              ),
              const SizedBox(height: 15),

              BlocBuilder<DropdownCubit<Designation>, Designation?>(
                builder: (context, selectedDesignation) {
                  return CustomDropdownField<Designation>(
                    label: "Designation*",
                    hintText: "Select Designation",
                    value: selectedDesignation,
                    items: Designation.values,
                    getLabel: (e) => e.displayName,
                    onChanged: (value) {
                      if (value != null) {
                        context.read<DropdownCubit<Designation>>().selectValue(
                          value,
                        );
                      }
                    },
                  );
                },
              ),
              const SizedBox(height: 15),

              BlocBuilder<DropdownCubit<Domain>, Domain?>(
                builder: (context, selectedDomain) {
                  return CustomDropdownField<Domain>(
                    label: "Domain",
                    hintText: "Select your Domain",
                    value: selectedDomain,
                    items: Domain.values,
                    getLabel: (e) => e.displayName,
                    onChanged: (value) {
                      if (value != null) {
                        context.read<DropdownCubit<Domain>>().selectValue(
                          value,
                        );
                      }
                    },
                  );
                },
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: CustomButton(
                      label: "Previous",
                      isPrimary: false,
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                  SizedBox(width: 5),
                  Expanded(
                    child: CustomButton(
                      label: "Next",
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          log("Validate");
                        }
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
