import 'package:flutter/material.dart';
import 'package:instant_pay_u/services/global%20widget/main_logo_widget.dart';

class OneOnescreenView extends StatefulWidget {
  const OneOnescreenView({super.key});

  @override
  State<OneOnescreenView> createState() => _OneOnescreenViewState();
}

class _OneOnescreenViewState extends State<OneOnescreenView> {
  final ScrollController _scrollController = ScrollController();
  final List<Map<String, dynamic>> messages = [
    {'text': 'Hi! How are you?', 'isSent': false},
    {'text': '45', 'isSent': false},
    {'text': ' ₹500?', 'isSent': false},
    {'text': '1500', 'isSent': true},
  ];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(0.0),
      child: SafeArea(
        child: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.blueAccent,
              leading: IconButton(
                icon: Icon(Icons.arrow_back_ios_rounded),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              title: Row(
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage(''), // Replace with a real image
                  ),
                  SizedBox(width: 10),
                  Text(
                    'nameee',
                    style: TextStyle(fontSize: 18),
                  ),
                ],
              ),
              actions: [
                IconButton(
                  icon: Icon(Icons.call),
                  onPressed: () {},
                ), IconButton(
                  icon: Icon(Icons.more_vert),
                  onPressed: () {},
                ),
              ],
            ),
            body: Column(mainAxisAlignment: MainAxisAlignment.end, children: [
              Center(child: Column(
                children: [
                  CircleAvatar(child: Image.asset(""),),
                  Container(child: MainLogoWidget()),
                ],
              ),),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   children: [
              //     Row(
              //       children: [
              //         Icon(Icons.arrow_back_ios_rounded),
              //         Text("Name"),
              //       ],
              //     ),
              //     Row(
              //       children: [
              //         Icon(Icons.phone),
              //         Icon(Icons.more_vert_rounded),
              //       ],
              //     )
              //   ],
              // ),
              Expanded(
                child: ListView.builder(
                  reverse:
                    false, // Reverses the order so the list starts from the bottom.
                  padding: EdgeInsets.all(10.0),
                  itemCount: messages.length,
                  itemBuilder: (context, index) {
                    final message = messages[index];
                    return ChatBubble(
                      message: message['text'],
                      isSent: message['isSent'],
                    );
                  },
                ),
              ),ChatInputField()
            ])),
      ),
    );
  }
}

class ChatBubble extends StatelessWidget {
  final String message;
  final bool isSent;

  ChatBubble({required this.message, required this.isSent});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isSent ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 5),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: isSent ? Colors.blueAccent : Colors.grey[300],
          borderRadius: BorderRadius.circular(15),
        ),
        child: Text(
          message,
          style: TextStyle(
            color: isSent ? Colors.white : Colors.black,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}

class ChatInputField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      color: Colors.grey[200],
      child: Row(
        children: [
          IconButton(
            icon: Icon(Icons.attach_file),
            onPressed: () {},
          ),
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Type a message',
                border: InputBorder.none,
              ),
            ),
          ),
          ElevatedButton(onPressed: () {
            
          }, child: Text("send \n money")),     ElevatedButton(onPressed: () {
            
          }, child: Text("request \n money")),
          IconButton(
            icon: Icon(Icons.send),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}