import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_demo/futureprovider/model.dart';
final statenotiPro = StateNotifierProvider.autoDispose<GetApiData,List<DemoModel>>((ref) => GetApiData() );
// changenotifier pass karvanu and biju anu state ni type devanu

// state nin type devani kai type ni chhe am
class GetApiData extends StateNotifier<List<DemoModel>>{
  GetApiData():super([]);//initial state /default state

  void callApi(){
    //jem bloc ma kariye amj same
    state = list;
    //here we can call api and pass the value to the state
  }
}

