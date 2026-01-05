

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';


class ImagesColumn extends StatelessWidget {
  final List<String> column1;
  const ImagesColumn( {super.key, required this.column1});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return Column(
      children: [
        Container(
          height: height * 0.6,
          width: 150,
          child: ListView.builder(
            itemCount: 4,
            itemBuilder: (context, index) {
              return card(index);
            },
          ),
        ),
      ],
    );
  }

  Widget card(index) {
    return Container(
      margin: EdgeInsets.all(5),
      decoration: BoxDecoration(color: Colors.transparent),
      height: 170,
      child: Material(
        clipBehavior: Clip.antiAliasWithSaveLayer,

        borderRadius: BorderRadius.all(Radius.circular(15)),
        child: Image.asset(column1[index], fit: BoxFit.fill),
      ),
    );
  }
}
