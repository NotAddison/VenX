import 'dart:convert';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:nfc_manager/nfc_manager.dart';

class NFC extends StatefulWidget {
  final Function callback;
  final String initText;
  final String initSubText;
  final Icon initIcon;

  final String successText;
  final String successSubText;
  final Icon successIcon;

  final String failText;
  final String failSubText;
  final Icon failIcon;

  NFC({
    Key? key,
    required this.callback,
    this.initText = "Tap your food bank or credit card",
    this.initSubText = "to reserve this item",
    this.initIcon = const Icon(
      Icons.nfc,
      size: 100,
      color: Colors.grey,
    ),
    this.successText = "",
    this.successSubText = "Your item has been reserved successfully!",
    this.successIcon = const Icon(
      Icons.check_circle_outline,
      size: 100,
      color: Colors.green,
    ),
    this.failText = "Failed to read NFC tag",
    this.failSubText = "Please try again",
    this.failIcon = const Icon(
      Icons.error_outline,
      size: 100,
      color: Colors.red,
    ),
  }) : super(key: key);

  @override
  State<NFC> createState() => _NFCState();
}

class _NFCState extends State<NFC> {
  String displayText = '';
  String subText = '';
  Icon popupIcon = const Icon(
    Icons.nfc,
    size: 100,
    color: Colors.grey,
  );

  @override
  void initState() {
    super.initState();
    displayText = widget.initText;
    subText = widget.initSubText;
    popupIcon = widget.initIcon;
    initNFC();
  }

  Future<void> initNFC() async {
    try {
      NfcManager.instance.startSession(onDiscovered: (NfcTag tag) async {
        String decodedText = decodeNFCData(tag.data);

        // If fail
        if (decodedText == 'Unknown') {
          updateStateOnCallback(
            widget.failText,
            widget.failSubText,
            widget.failIcon,
          );
        } else {
          updateStateOnCallback(
            'Hello, $decodedText',
            widget.successSubText,
            widget.successIcon,
          );
        }

        // Wait for 3 seconds
        await Future.delayed(const Duration(seconds: 2));

        widget.callback(status: decodedText != 'Unknown');

        // check if still mounted, if it is pop the page
        if (mounted && Navigator.canPop(context)) {
          Navigator.pop(context);
        }
      });
    } catch (e) {
      print(e);
    }
  }

  void updateStateOnCallback(
      String newDisplayText, String newSubText, Icon newIcon) {
    if (mounted) {
      setState(() {
        displayText = newDisplayText;
        subText = newSubText;
        popupIcon = newIcon;
      });
    }
  }

  String decodeNFCData(Map<String, dynamic> nfcData) {
    try {
      List<int> nfcPayload =
          nfcData['ndef']['cachedMessage']['records'][0]['payload'].cast<int>();

      // Remove control characters and decode the payload as UTF-8 text
      String decodedText = utf8.decode(nfcPayload);

      // Remove the first 3 characters (language code)
      decodedText = decodedText.substring(3);

      print(decodedText);
      return decodedText;
    } catch (e) {
      print(e);
      return 'Unknown';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: InkWell(
        onTap: () {
          // Pop the page
          Navigator.pop(context);
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
                width: 300,
                height: 300,
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
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    popupIcon,
                    const SizedBox(height: 20),
                    Column(
                      children: [
                        Wrap(
                          children: [
                            Text(
                              displayText,
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
                              subText,
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
          ],
        ),
      ),
    );
  }
}
