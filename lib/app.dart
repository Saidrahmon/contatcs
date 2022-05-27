import 'package:contacts_bloc/bloc/load_contact/contact_bloc.dart';
import 'package:contacts_bloc/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => ContactBloc()),
      ],
      child: const Home(),
    );
  }
}

