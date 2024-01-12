import 'package:flutter/material.dart';
import '../models/machine_schema.dart';
import '../widgets/sub_base.dart';
import '../widgets/preview_machine.dart';
import '../widgets/card_stock.dart';

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
      title: widget.machine.title,
      showReturnButton: false,
      body: Container(
          child: Padding(
        padding:
            const EdgeInsets.only(top: 30, left: 30, right: 30, bottom: 30),
        child: Column(
          children: [
            // Preview
            MachinePreview(machine: widget.machine, isCard: true),

            // Spacer
            const SizedBox(height: 40),

            // Item stock List
            Expanded(
              child: ListView.builder(
                itemCount: widget.machine.stocks.length,
                itemBuilder: (context, index) {
                  return StockCard(stock: widget.machine.stocks[index]);
                },
              ),
            ),

            // Spacer
            const SizedBox(height: 20),

            // Column, button at the end of the screen
            Column(
              children: [
                // Button
                MaterialButton(
                  onPressed: () {},
                  minWidth: double.maxFinite,
                  height: 50,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  color: const Color.fromARGB(255, 255, 255, 255),
                  child: const Text("Dietrition / AI Nutritionist"),
                ),

                // Spacer
                const SizedBox(height: 10),

                MaterialButton(
                  onPressed: () {},
                  minWidth: double.maxFinite,
                  height: 50,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  color: const Color.fromARGB(255, 255, 255, 255),
                  child: const Text("Return"),
                )
              ],
            ),
          ],
        ),
      )),
    );
  }
}
