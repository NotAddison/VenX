import 'package:flutter/material.dart';
import '../models/machine_schema.dart';
import '../screens/machine.dart';
import 'package:page_transition/page_transition.dart';

class MachinePreview extends StatelessWidget {
  final Machine machine;
  final bool isCard;
  const MachinePreview({super.key, required this.machine, this.isCard = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      height: 200,
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
                    width: 150,
                    padding: const EdgeInsets.all(15),
                    height: double.maxFinite,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
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
                    // Asset image (../../assets/icon/machine.png)
                    child: Column(
                      children: [
                        Expanded(child: Image.asset('assets/machine.png')),
                      ],
                    )),

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
                        Text(machine.address,
                            style: const TextStyle(fontSize: 15)),
                        // Button at the bottom
                        const SizedBox(height: 10),

                        isCard == false
                            ? Expanded(
                                flex: 1,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    MaterialButton(
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          PageTransition(
                                            type: PageTransitionType.fade,
                                            curve: Curves.linear,
                                            duration: const Duration(
                                                milliseconds: 300),
                                            reverseDuration: const Duration(
                                                milliseconds: 300),
                                            child:
                                                MachineView(machine: machine),
                                          ),
                                        );
                                      },
                                      color: const Color.fromARGB(
                                          255, 247, 247, 247),
                                      minWidth: 170,
                                      height: 40,
                                      // Shape
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                      child: const Text("View Machine"),
                                    ),
                                    const SizedBox(width: 10),
                                    MaterialButton(
                                      onPressed: () {},
                                      color: const Color.fromARGB(
                                          255, 247, 247, 247),
                                      minWidth: 15,
                                      height: 40,
                                      // Shape
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                      child: const Icon(
                                        Icons.favorite_border_outlined,
                                        size: 15,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ],
                                ))
                            : const SizedBox(height: 0),
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
