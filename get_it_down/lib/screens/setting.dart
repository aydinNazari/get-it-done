import 'package:flutter/material.dart';
import 'package:get_it_down/models/color_theme_data.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class Setting extends StatelessWidget {
  const Setting({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        appBar: AppBar(
          title: Text(
            'Thema Seçimi',
            style: GoogleFonts.chewy(fontSize: 25),
          ),
        ),
        body: SwitchCard(),
      ),
    );
  }
}

class SwitchCard extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    Text greenText = const Text(
      'Green',
      style: TextStyle(color: Colors.green),
    );
    Text redText = const Text(
      'Red',
      style: TextStyle(color: Colors.red),
    );
    bool _value = Provider.of<ColorThemeData>(context).isGreen;
    return Card(
      child: SwitchListTile(
        activeColor: Colors.green,
        activeTrackColor: Colors.green,
        inactiveThumbColor: Colors.red,
        inactiveTrackColor: Colors.red,
        subtitle: _value ? greenText : redText,
        title: const Text(
          'Change Theme Color',
          style: TextStyle(color: Colors.black),
        ),
        value: _value,
        onChanged: (bool value) {
          Provider.of<ColorThemeData>(context, listen: false)
              .switchTheme(value);
        },
      ),
    );
  }
}
