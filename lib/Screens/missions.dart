import 'package:flutter/material.dart';

class Missions extends StatefulWidget {
  const Missions({
    super.key,
  });

  @override
  State<Missions> createState() => _MissionsState();
}

class _MissionsState extends State<Missions>{

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text('Missions'),
      ),
    );
  }
}