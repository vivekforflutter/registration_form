import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:neosoft_assessment/features/registration/presentation/cubit/gender_cubit.dart';
import 'package:neosoft_assessment/features/registration/presentation/cubit/password_visibility_cubit.dart';

import 'core/enums/enums.dart';
import 'features/registration/presentation/cubit/dropdown_textfield_cubit.dart';
import 'features/registration/presentation/cubit/profile_image_cubit.dart';
import 'features/registration/presentation/screens/registration_screen.dart';

void main() {
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => ProfileImageCubit()),
        BlocProvider(create: (_) => GenderCubit()),
        BlocProvider(create: (_) => PasswordVisibilityCubit()),
        BlocProvider(create: (_) => DropdownCubit<EducationLevel>()),
        BlocProvider(create: (_) => DropdownCubit<YearOfPassing>()),
        BlocProvider(create: (_) => DropdownCubit<Designation>()),
        BlocProvider(create: (_) => DropdownCubit<Domain>()),
        BlocProvider(create: (_) => DropdownCubit<ExperienceLevel>()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const RegistrationScreen(),
    );
  }
}
