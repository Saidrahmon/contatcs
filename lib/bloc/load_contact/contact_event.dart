import 'package:contacts_bloc/model/contact.dart';
import 'package:flutter/material.dart';

@immutable
abstract class ContactEvent{}

class LoadContactsEvent extends ContactEvent{}

class AddContactEvent extends ContactEvent{}