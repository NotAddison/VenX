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

  // Add initial message
  @override
  void initState() {
    super.initState();

    // DEMO PURPOSES : DEMO MESSAGES
    populateChat();
  }

  void populateChat() async {
    setState(() {
      _messages.insert(
          0,
          types.TextMessage(
            author: _user,
            createdAt: DateTime.now().millisecondsSinceEpoch,
            id: randomString(),
            text: 'What can I make using the ingredients I have reserved?',
          ));
    });

    // Delay for 1 second
    await Future.delayed(const Duration(seconds: 3));

    setState(() {
      _messages.insert(
          0,
          types.TextMessage(
              author: _ai,
              createdAt: DateTime.now().millisecondsSinceEpoch,
              id: randomString(),
              text:
                  "Based on your recent reservations, you have reserved the following: \n - 1 Lettuce\n - 1 Cucumber\n"));
    });

    // Delay for 1 second
    await Future.delayed(const Duration(seconds: 5));

    setState(() {
      _messages.insert(
          0,
          types.TextMessage(
              author: _ai,
              createdAt: DateTime.now().millisecondsSinceEpoch,
              id: randomString(),
              text:
                  "Using the machine's auto cooking machine, you can request the following dishes to be made: \n - 1 Salad\n - 1 Cucumber Salad\n - 1 Cucumber Soup\n - 1 Cucumber Juice\n - 1 Lettuce Salad\n - 1 Lettuce Soup\n - 1 Lettuce Juice\n"));
    });

    // Delay for 1 second
    await Future.delayed(const Duration(seconds: 2));

    setState(() {
      _messages.insert(
          0,
          types.TextMessage(
              author: _ai,
              createdAt: DateTime.now().millisecondsSinceEpoch,
              id: randomString(),
              text: ""));
    });
  }

  void _handleSendPressed(types.PartialText message) {
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
