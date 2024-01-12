import 'dart:typed_data';
import 'dart:convert';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:nfc_manager/nfc_manager.dart';

class NFC extends StatefulWidget {
  const NFC({super.key});

  @override
  State<NFC> createState() => _NFCState();
}

class _NFCState extends State<NFC> {
  String displayText = 'Tap your food bank or credit card';
  String subText = 'to reserve this item';
  Icon popupIcon = const Icon(
    Icons.nfc,
    size: 100,
    color: Colors.grey,
  );

  @override
  void initState() {
    super.initState();
    initNFC();
  }

  Future<void> initNFC() async {
    NfcManager.instance.startSession(onDiscovered: (NfcTag tag) async {
      String decodedText = decodeNFCData(tag.data);

      // If fail
      if (decodedText == 'Unknown') {
        setState(() {
          displayText = 'Failed to read NFC tag';
          subText = 'Please try again';
          popupIcon = const Icon(
            Icons.error_outline,
            size: 100,
            color: Colors.red,
          );
        });
      } else {
        setState(() {
          displayText = 'Hello, $decodedText';
          subText = 'Your item has been reserved sucessfully!';
          popupIcon = const Icon(
            Icons.check_circle_outline,
            size: 100,
            color: Colors.green,
          );
        });
      }
      // Wait for 5 seconds
      await Future.delayed(const Duration(seconds: 3));

      // check if still mounted, if it is pop the page
      if (mounted && Navigator.canPop(context)) {
        Navigator.pop(context);
      }
    });
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
