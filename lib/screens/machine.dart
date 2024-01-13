import 'package:flutter/material.dart';
import '../models/machine_schema.dart';
import '../widgets/sub_base.dart';
import '../widgets/preview_machine.dart';
import '../widgets/card_stock.dart';
import '../screens/ai_chat.dart';
import 'package:page_transition/page_transition.dart';

class MachineView extends StatefulWidget {
  final Machine machine;
  const MachineView({super.key, required this.machine});

  @override
  State<MachineView> createState() => _MachineViewState();
}

class _MachineViewState extends State<MachineView> {
  @override
  Widget build(BuildContext context) {
    return Base(
      showAppBar: false,
      body: Padding(
        padding:
            const EdgeInsets.only(top: 80, left: 30, right: 30, bottom: 30),
        child: Column(
          children: [
            // Preview
            MachinePreview(machine: widget.machine, isCard: true),

            // Spacer
            const SizedBox(height: 20),

            // Item stock List
            Expanded(
              child: ShaderMask(
                shaderCallback: (Rect bounds) {
                  return const LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.purple,
                      Colors.transparent,
                      Colors.transparent,
                      Colors.purple
                    ],
                    stops: [
                      0.0,
                      0.05,
                      0.9,
                      1.0
                    ], // 10% purple, 80% transparent, 10% purple
                  ).createShader(bounds);
                },
                blendMode: BlendMode.dstOut,
                child: ListView.builder(
                  padding: const EdgeInsets.only(top: 10, bottom: 10),
                  itemCount: widget.machine.stocks.length,
                  itemBuilder: (context, index) {
                    return StockCard(
                      stock:
                          widget.machine.stocks[index] as Map<String, dynamic>,
                      machine: widget.machine,
                    );
                  },
                ),
              ),
            ),

            // Spacer
            const SizedBox(height: 20),

            // Column, button at the end of the screen
            Column(
              children: [
                // Button
                MaterialButton(
                  onPressed: () {
                    // transition push
                    Navigator.push(
                      context,
                      PageTransition(
                        type: PageTransitionType.fade,
                        child: const AIChat(),
                      ),
                    );
                  },
                  minWidth: double.maxFinite,
                  height: 50,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  color: const Color.fromARGB(255, 247, 247, 247),
                  child: const Text("Ask AI"),
                ),

                // Spacer
                const SizedBox(height: 10),

                MaterialButton(
                  onPressed: () {
                    // transition pop
                    Navigator.pop(context);
                  },
                  minWidth: double.maxFinite,
                  height: 50,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  color: const Color.fromARGB(255, 247, 247, 247),
                  child: const Text("Return"),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
