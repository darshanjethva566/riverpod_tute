import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_demo/futureprovider/model.dart';
final familyPro = StateNotifierProvider.autoDispose<FamilyProvider,List<DemoModel>>((ref) => FamilyProvider() );
// changenotifier pass karvanu and biju anu state ni type devanu

// state nin type devani kai type ni chhe am
class FamilyProvider extends StateNotifier<List<DemoModel>>{
  FamilyProvider():super([]);//initial state /default state

  void callApi(List<DemoModel> lists){
    //jem bloc ma kariye amj same
    state = lists;
    //here we can call api and pass the value to the state
  }
}

