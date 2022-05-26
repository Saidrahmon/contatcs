import 'package:contacts_bloc/bloc/load_contact/contact_event.dart';
import 'package:contacts_bloc/bloc/load_contact/contact_state.dart';
import 'package:contacts_bloc/bloc/load_contact/load_contact_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  //life cycles

  @override
  void initState() {
    super.initState();
    loadContacts();
  }

  //methods

  void loadContacts() {
    context.read<ContactBloc>().add(LoadContactsEvent());
  }

  //listeners

  void contactListener(BuildContext context, ContactState state) {
    if (state is LoadedContactSate) {
      print("loaded -------------------");
    }
  }

  //widgets

  Widget get view => BlocConsumer<ContactBloc, ContactState>(
        listener: (BuildContext context, state) =>
            contactListener(context, state),
        builder: (context, state) {
          if (state is InitialContactState) {
            return Container();
          }
          if (state is LoadingContactState) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is LoadedContactSate) {
            return ListView(
              children: state.contacts
                  .map((e) => Container(
                        child: Text(e.firstName),
                      ))
                  .toList(),
            );
          }
          return Container();
        },
      );

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => ContactBloc()),
      ],
      child: MaterialApp(
        home: Scaffold(
          body: view,
        ),
      ),
    );
  }
}
