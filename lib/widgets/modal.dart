import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class Modal extends StatefulWidget {
  final String displayText;
  final String subText;
  final Icon popupIcon;
  final bool autoPop;

  const Modal(
      {super.key,
      required this.displayText,
      required this.subText,
      required this.popupIcon,
      this.autoPop = true});

  @override
  State<Modal> createState() => _ModalState();
}

void showModal(BuildContext context, String displayText, String subText,
    Icon popupIcon) async {
  await Navigator.push(
    context,
    PageTransition(
      type: PageTransitionType.fade,
      child: Modal(
        displayText: displayText,
        subText: subText,
        popupIcon: popupIcon,
      ),
    ),
  );
}

class _ModalState extends State<Modal> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: InkWell(
        onTap: () {
          widget.autoPop ? Navigator.pop(context) : null;
        },
        child: Stack(
          fit: StackFit.expand,
          children: [
            // Blur effect
            BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
              child: Container(
                color: Colors.black.withOpacity(0),
              ),
            ),
            // Center Container
            Center(
              child: Container(
                width: MediaQuery.of(context).size.width * 0.8,
                height: 150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: const Color.fromARGB(255, 250, 250, 250),
                  boxShadow: const [
                    BoxShadow(
                      color: Color.fromARGB(31, 0, 0, 0),
                      offset: Offset(0, 4),
                      blurRadius: 10,
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      widget.popupIcon,
                      const SizedBox(height: 20),
                      Column(
                        children: [
                          Wrap(
                            children: [
                              Text(
                                widget.displayText,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                          Wrap(
                            children: [
                              Text(
                                widget.subText,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
