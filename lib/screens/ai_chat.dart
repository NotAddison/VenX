import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:venx/widgets/sub_base.dart';
import '../widgets/modal.dart';

// For the testing purposes, you should probably use https://pub.dev/packages/uuid.
String randomString() {
  final random = Random.secure();
  final values = List<int>.generate(16, (i) => random.nextInt(255));
  return base64UrlEncode(values);
}

class AIChat extends StatefulWidget {
  const AIChat({super.key});

  @override
  State<AIChat> createState() => _AIChatState();
}

class _AIChatState extends State<AIChat> {
  final List<types.Message> _messages = [];
  final _user = const types.User(id: '82091008-a484-4a89-ae75-a22bf8d6f3ac');
  final _ai = const types.User(id: 'e7c8f8c8-1c1f-4f1d-8c4e-7d9b9c5d8c9c');
  bool _isMounted = false;

  // Add initial message
  @override
  void initState() {
    super.initState();
    _isMounted = true;

    // DEMO PURPOSES : DEMO MESSAGES
    populateChat();
  }

  @override
  void dispose() {
    _isMounted = false;
    super.dispose();
  }

  void populateChat() async {
    if (!_isMounted) return;
    setState(() {
      _messages.insert(
          0,
          types.TextMessage(
            author: _user,
            createdAt: DateTime.now().millisecondsSinceEpoch,
            id: randomString(),
            text: 'What can I make with the ingredients I reserved?',
          ));
    });

    // Delay for 1 second
    await Future.delayed(const Duration(seconds: 3));
    if (!_isMounted) return;

    setState(() {
      _messages.insert(
          0,
          types.TextMessage(
              author: _ai,
              createdAt: DateTime.now().millisecondsSinceEpoch,
              id: randomString(),
              text: """These are the items that you have recently reserved: \n 
- 1 Brown Rice\n 
- 1 Dried Chickpea\n
- 1 Tomato Sauce\n
- 1 Canned Salmon\n
                  """));
    });

    // Delay for 1 second
    await Future.delayed(const Duration(seconds: 5));
    if (!_isMounted) return;

    setState(() {
      _messages.insert(
          0,
          types.TextMessage(
              author: _ai,
              createdAt: DateTime.now().millisecondsSinceEpoch,
              id: randomString(),
              text:
                  """Using the machine's auto cooking machine, you can request the following dishes to be made: \n 
- Brown Rice with Dried Chickpea\n
- Brown Rice with Tomato Sauce\n
- Brown Rice with Canned Salmon\n
- Dried Chickpea with Tomato Sauce\n
- Dried Chickpea with Canned Salmon\n
- Tomato Sauce with Canned Salmon\n
                  """));
    });

    // Delay for 1 second
    await Future.delayed(const Duration(seconds: 5));
    if (!_isMounted) return;

    setState(() {
      _messages.insert(
          0,
          types.TextMessage(
              author: _user,
              createdAt: DateTime.now().millisecondsSinceEpoch,
              id: randomString(),
              text:
                  "I think I would like to have the Brown Rice with Canned Salmon"));
    });

    await Future.delayed(const Duration(seconds: 8));
    if (!_isMounted) return;

    setState(() {
      _messages.insert(
          0,
          types.TextMessage(
              author: _ai,
              createdAt: DateTime.now().millisecondsSinceEpoch,
              id: randomString(),
              text: """That's a great choice!
here are approximate nutrition facts for a meal of brown rice with canned salmon, based on standard serving sizes:

=== Brown Rice ===

Serving Size: 1 cup cooked
Calories: 215
Total Fat: 1.6g
Saturated Fat: 0.3g
Cholesterol: 0mg
Sodium: 10mg
Total Carbohydrates: 45g
Dietary Fiber: 3.5g
Sugars: 0.7g
Protein: 5g

=== Canned Salmon ===

Serving Size: 3 ounces (85g)
Calories: 120
Total Fat: 5g
Saturated Fat: 1g
Omega-3 Fatty Acids: 1.4g
Cholesterol: 40mg
Sodium: 360mg
Total Carbohydrates: 0g
Protein: 17g
                  """));
    });

    await Future.delayed(const Duration(seconds: 8));
    if (!_isMounted) return;

    setState(() {
      _messages.insert(
          0,
          types.TextMessage(
              author: _ai,
              createdAt: DateTime.now().millisecondsSinceEpoch,
              id: randomString(),
              text:
                  "It seems that you are 1.5km away (15 minutes) from the machine. \n\nWould you like me to start preparing the dish?"));
    });

    await Future.delayed(const Duration(seconds: 5));
    if (!_isMounted) return;

    setState(() {
      _messages.insert(
          0,
          types.TextMessage(
              author: _user,
              createdAt: DateTime.now().millisecondsSinceEpoch,
              id: randomString(),
              text: "Yes, please start preparing the dish."));
    });

    await Future.delayed(const Duration(seconds: 5));
    if (!_isMounted) return;

    setState(() {
      _messages.insert(
          0,
          types.TextMessage(
              author: _ai,
              createdAt: DateTime.now().millisecondsSinceEpoch,
              id: randomString(),
              text: "I will notify you when the dish is ready :)"));
    });
  }

  void _handleSendPressed(types.PartialText message) {
    if (!_isMounted) return;
    // Notify Demo
    print('Sending message: ${message.text}');
    showModal(
        context,
        "This is a Demo",
        "Due to the costs of hosting an AI Model, \n I have taken the API offline.",
        const Icon(Icons.warning_amber_rounded, color: Colors.yellow));

    // final textMessage = types.TextMessage(
    //   author: _user,
    //   createdAt: DateTime.now().millisecondsSinceEpoch,
    //   id: randomString(),
    //   text: message.text,
    // );

    // _addMessage(textMessage);

    // // Send message to the AI
    // promptAI(textMessage.text);
  }

  Future<void> promptAI(String message) async {
    if (!_isMounted) return;
    print('Prompting AI...');

    // Get the response from the AI

    // Add temp response
    final response = types.TextMessage(
      author: _ai,
      createdAt: DateTime.now().millisecondsSinceEpoch,
      id: randomString(),
      text: 'Hello, I am the AI.',
    );
    _addMessage(response);
  }

  void _addMessage(types.Message message) {
    if (!_isMounted) return;
    setState(() {
      _messages.insert(0, message);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Scaffold(
            body: Base(
          title: "AI Chat (Demo)",
          body: Chat(
            messages: _messages,
            onSendPressed: _handleSendPressed,
            user: _user,
          ),
        )),
      ],
    );

    // return Scaffold(
    //   body: Base(
    //     title: "AI Chat",
    //     body: Chat(
    //       messages: _messages,
    //       onSendPressed: _handleSendPressed,
    //       user: _user,
    //     ),
    //   ),
    // );
  }
}
