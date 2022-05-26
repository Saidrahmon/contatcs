import 'package:bloc/bloc.dart';
import 'package:contacts_bloc/bloc/load_contact/contact_event.dart';
import 'package:contacts_bloc/bloc/load_contact/contact_state.dart';
import 'package:http/http.dart' as http;

class ContactBloc extends Bloc<ContactEvent, ContactState> {
  ContactBloc() : super(InitialContactState()) {
    http.Client client = http.Client();
    on<LoadContactsEvent>((event, emit) async {
      emit(LoadingContactState());
      http.Response response =  await client.get(
          Uri.parse("https://628f193e0e69410599d5289f.mockapi.io/api/contact"));
      print(response);
      emit(LoadedContactSate([]));
    });
  }
}