import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_demo/notifier/notifierprovider.dart';

class NotifierUi extends ConsumerWidget {
  const NotifierUi({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {

    return Scaffold(
      appBar: AppBar(title: Text("Notifier Ui"),),
      body: Consumer(
        builder: (context, ref, child) {
          final data = ref.watch(notifierProProvider);

          return data.when(data: (data) {
            return
            ListView.builder(itemCount: data.length,itemBuilder: (context, index) {
              return ElevatedButton(
                onPressed: () {
                  ref.read(notifierProProvider.notifier).refreshData();
                 // ref.read(notifierProProvider.notifier).updateModel("JSN", index);
                  //
                },
                child: Container(child: Column(mainAxisSize: MainAxisSize.min,children: [
                  Text(data[index].title.toString()),
                  SizedBox(height: 20,),
                  Text(data[index].body.toString()),
                ],),),
              );
            },);
          }, error: (error, stackTrace) => Text(error.toString()), loading: () => Center(child: CircularProgressIndicator(),),);
        },
      ),
    );
  }
}
