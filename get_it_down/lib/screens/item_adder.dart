import 'package:flutter/material.dart';
import 'package:get_it_down/models/items_data.dart';
import 'package:provider/provider.dart';

class ItemAdder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String? onChang;
    return Container(
      padding: MediaQuery.of(context).viewInsets,
      /* child: Padding(
        padding: const EdgeInsets.all(20.0),*/
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                onChanged: (input) {
                  onChang = input;
                  print('/////$onChang/////');
                },
                style: const TextStyle(color: Colors.black),
                autofocus: true,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Add',
                  hintText: '...',
                  hoverColor: Colors.black,
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  print('****$onChang****');
                  Provider.of<ItemsData>(context, listen: false)
                      .addItem(onChang!);
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                    primary: Theme.of(context).primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    textStyle: const TextStyle(
                        fontSize: 15, fontWeight: FontWeight.bold)),
                child: const Text("Add"),
              ),
            ],
          ),
        ),
      ),
      //   ),
    );
  }
}
