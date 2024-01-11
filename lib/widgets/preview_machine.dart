import 'package:flutter/material.dart';
import '../models/machine_schema.dart';

class MachinePreview extends StatelessWidget {
  final Machine machine;
  const MachinePreview({super.key, required this.machine});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      height: 250,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                // Image
                Container(
                  width: 180,
                  height: double.maxFinite,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: const Color.fromARGB(255, 255, 255, 255),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset:
                            const Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  child: const Placeholder(),
                ),

                // Space
                const SizedBox(width: 10),

                // Column Body
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(machine.title,
                            style: const TextStyle(
                                fontSize: 25, fontWeight: FontWeight.w600)),
                        const SizedBox(height: 10),
                        const Text("Machine Address",
                            style: TextStyle(fontSize: 15)),
                        // Button at the bottom
                        const SizedBox(height: 10),

                        Expanded(
                            flex: 1,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                MaterialButton(
                                  onPressed: () {},
                                  color:
                                      const Color.fromARGB(255, 247, 247, 247),
                                  minWidth: 200,
                                  height: 40,
                                  // Shape
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: const Text("View Machine"),
                                ),
                              ],
                            ))
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
