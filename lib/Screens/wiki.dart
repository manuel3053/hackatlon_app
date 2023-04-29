import 'package:flutter/material.dart';
import 'package:hackatlon_app/Widgets/userbar.dart';

import '../Widgets/info.dart';

class Wiki extends StatefulWidget {
  const Wiki({
    super.key,
  });

  @override
  State<Wiki> createState() => _WikiState();
}

class _WikiState extends State<Wiki> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Padding(
        padding: EdgeInsets.only(top: 10),
        child: ListView.separated(
          itemCount: 30,
          itemBuilder: (BuildContext context, int i) {
            return i!=0 ? Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Info(),
            ) : Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: IconButton(
                icon: Icon(Icons.add),
                onPressed: (){},
              ),
            );
          },
          separatorBuilder: (BuildContext context, int index) {
            return Container(
              height: 15,
            );
          },
        ),
      ),
    );
  }
}
