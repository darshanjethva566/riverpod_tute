import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


final stateprovider = StateProvider<int>((ref) => 0);
//khali primitive data mate j use thase

class DEmoPage extends ConsumerWidget {
  const DEmoPage({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    print("Build");

    return Scaffold(
      body: Center(
        child: Consumer(builder: (context, ref, child) {
          final val = ref.watch(stateprovider);
          return Text(val.toString());
        },),
      ),
      floatingActionButton: ElevatedButton(
        child: Text("Press"),
        onPressed: () {
          ref.read(stateprovider.notifier).state++;
          //state get karai and ane plus karayu
        },
      ),
    );
  }
}
