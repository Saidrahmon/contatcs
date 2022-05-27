import 'package:contacts_bloc/bloc/load_contact/contact_event.dart';
import 'package:contacts_bloc/bloc/load_contact/contact_state.dart';
import 'package:contacts_bloc/bloc/load_contact/contact_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
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
            return Container(
              decoration: BoxDecoration(
                color: Colors.black12
              ),
              child: ListView(
                children: state.contacts
                    .map((e) => Container(
                          margin: EdgeInsets.all(8.0),
                          padding: EdgeInsets.all(12.0),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8)
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(e.firstName + e.lastName, style: TextStyle(fontSize: 20),),
                              Text(e.phoneNumber, style: TextStyle(fontSize: 16),),
                            ],
                          ),
                        ))
                    .toList(),
              ),
            );
          }
          return Container();
        },
      );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: view,
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            context.read<ContactBloc>().add(AddContactEvent());
          },
        ),
      ),
    );
  }
}
