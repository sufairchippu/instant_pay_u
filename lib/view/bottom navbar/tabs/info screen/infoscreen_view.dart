import 'package:flutter/material.dart';

class InfoscreenView extends StatefulWidget {
  const InfoscreenView({super.key});

  @override
  State<InfoscreenView> createState() => _InfoscreenViewState();
}

class _InfoscreenViewState extends State<InfoscreenView> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 11, //news numberss
      itemBuilder: (context, index) {
        return Container(decoration: BoxDecoration(border: Border.all(width: 1)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [ Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Title"),Icon(Icons.more_vert_sharp)
                ],
              ),
              Image.network("src"),
             
              Text("Description")
            ],
          ),
        );
      },
    );
  }
}
