import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_demo/statenotifierprovider/statenotifier.dart';



/// aa imutable state ne change karva use thay like je change na thai sake
/// example :
///   state  =  state.list
///   state  = []
///
/// mutable atle change thai ava
/// imutable change na thai ani mate aapde navo obj levo pade tyare state change thai
class StateNotfierDemo extends ConsumerWidget {
  const StateNotfierDemo({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    print("hii");
    //kaya state ma chhe a aayathi khabar pade
    print(ref.read(statenotiPro.notifier).state.runtimeType);
    return Scaffold(
      body: Column(
        children: [
          Text("Hiii im statenotifierProvider"),
          Consumer(
            
            builder: (context, ref, child) {
              final data = ref.watch(statenotiPro);
              return data.isEmpty?Center(child: Text("No list Found"),):
              Expanded(
                child: ListView.builder(itemCount: data.length,itemBuilder: (context, index) {
                  return ListTile(title: Text(data[index].name),subtitle: Text(data[index].mail),);
                },),
              );

            },
          ),
        ],
      ),
      floatingActionButton: ElevatedButton(
        child: Text("Call Api"),
        onPressed: () {
          ref.read(statenotiPro.notifier).callApi();
          //. notifier thi notifier no object mlse
        },
      ),

    );
  }
}
