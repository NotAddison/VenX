import 'package:flutter/material.dart';
import 'package:venx/widgets/modal.dart';
import '../models/machine_schema.dart';
import '../screens/machine.dart';
import 'package:page_transition/page_transition.dart';
import '../utils/requests.dart';
import 'nfc.dart';

import 'package:flutter/foundation.dart' show kIsWeb;

// ignore: must_be_immutable
class MachinePreview extends StatefulWidget {
  final Machine machine;
  final bool isCard;
  double width;
  MachinePreview(
      {super.key,
      required this.machine,
      this.isCard = false,
      this.width = double.maxFinite});

  @override
  State<MachinePreview> createState() => _MachinePreviewState();
}

class _MachinePreviewState extends State<MachinePreview> {
  bool machineIsFav = false;

  void callback({status = false}) {
    print(status);
  }

  @override
  void initState() {
    super.initState();
    isFavorited(machine: widget.machine).then((value) => setState(() {
          machineIsFav = value;
        }));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: 220,
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
                        Expanded(
                            child: Image.asset('assets/images/machine.png')),
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
                        Text(widget.machine.title,
                            style: const TextStyle(
                                fontSize: 25, fontWeight: FontWeight.w600)),
                        Text(widget.machine.address,
                            style: const TextStyle(fontSize: 15)),
                        // Button at the bottom
                        const SizedBox(height: 10),

                        widget.isCard == false
                            ? Expanded(
                                flex: 1,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Expanded(
                                            child: MaterialButton(
                                                onPressed: () {
                                                  if (kIsWeb) {
                                                    showModal(
                                                        context,
                                                        "NFC Unavaliable",
                                                        "NFC is not avaliable on web.",
                                                        const Icon(Icons.error,
                                                            color: Colors.red));
                                                    return;
                                                  }

                                                  // NOTE: For Demo Purpose, reusing NFC component to "READ".
                                                  // For actual produciton, we will be using NFC component to "WRITE".
                                                  Navigator.push(
                                                    context,
                                                    PageTransition(
                                                        type: PageTransitionType
                                                            .fade,
                                                        child: NFC(
                                                          callback: callback,
                                                          initText:
                                                              "Hover over the card reader",
                                                          initSubText:
                                                              "to Login to the VenX Machine",
                                                          failText:
                                                              "Failed to login",
                                                          failSubText:
                                                              "Please try again",
                                                          successText:
                                                              "Login Successful",
                                                          successSubText:
                                                              "Welcome to the VenX Machine",
                                                        )),
                                                  );
                                                },
                                                color: const Color.fromARGB(
                                                    255, 247, 247, 247),
                                                // Shape
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(5),
                                                ),
                                                child: const Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    Icon(
                                                      Icons.login_outlined,
                                                      size: 15,
                                                      color: Colors.grey,
                                                    ),
                                                    SizedBox(width: 10),
                                                    Text("Login",
                                                        style: TextStyle(
                                                          fontSize: 15,
                                                        )),
                                                    // Expanded(
                                                    //   child: SizedBox(
                                                    //     width: double.maxFinite,
                                                    //     child: Container(
                                                    //       alignment:
                                                    //           Alignment.centerRight,
                                                    //       child: const Icon(
                                                    //         Icons.arrow_forward_ios,
                                                    //         size: 15,
                                                    //         color: Colors.grey,
                                                    //       ),
                                                    //     ),
                                                    //   ),
                                                    // )
                                                  ],
                                                ))),
                                        const SizedBox(width: 10),
                                        MaterialButton(
                                          onPressed: () {
                                            // Demo : No Routing Service
                                            showModal(
                                                context,
                                                "Routing Service Unavaliable",
                                                "Due to financial constraints, the routing service is not avaliable (for public demo).",
                                                const Icon(Icons.error,
                                                    color: Colors.red));
                                          },
                                          color: const Color.fromARGB(
                                              255, 247, 247, 247),
                                          minWidth: 15,
                                          height: 40,
                                          // Shape
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                          ),
                                          child: const Icon(
                                            Icons.route_outlined,
                                            size: 15,
                                            color: Colors.grey,
                                          ),
                                        ),
                                        const SizedBox(width: 9),
                                        MaterialButton(
                                          onPressed: () {
                                            manageFavorites(
                                                machine: widget.machine);
                                            setState(() {
                                              machineIsFav = !machineIsFav;
                                            });
                                          },
                                          color: const Color.fromARGB(
                                              255, 247, 247, 247),
                                          minWidth: 15,
                                          height: 40,
                                          // Shape
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                          ),
                                          child: Icon(
                                            machineIsFav
                                                ? Icons.favorite
                                                : Icons
                                                    .favorite_outline_outlined,
                                            size: 15,
                                            color: Colors.red,
                                          ),
                                        ),
                                      ],
                                    ),

                                    // Spacer
                                    const SizedBox(height: 5),

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
                                            child: MachineView(
                                                machine: widget.machine),
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
                                      child: const Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Icon(
                                            Icons.menu_open_rounded,
                                            size: 15,
                                            color: Colors.grey,
                                          ),
                                          SizedBox(width: 10),
                                          Text("Details"),
                                        ],
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
