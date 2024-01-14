import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart  ';
import 'package:venx/models/machine_schema.dart';
import 'package:venx/widgets/modal.dart';
import 'nfc.dart';
import '../utils/requests.dart';

import 'dart:io' show Platform;
import 'package:flutter/foundation.dart' show kIsWeb;

class StockCard extends StatefulWidget {
  final Map<dynamic, dynamic> stock;
  final Machine machine;

  const StockCard({super.key, required this.stock, required this.machine});

  @override
  State<StockCard> createState() => _StockCardState();
}

class _StockCardState extends State<StockCard> {
  void reserveItem({status = false}) {
    if (status) {
      showModal(
          context,
          "Item Reserved!",
          "You have successfully reserved ${widget.stock['name']}!",
          const Icon(Icons.check, color: Colors.green));
    } else {
      showModal(context, "Failed to Reserve Item!", "Please try again!",
          const Icon(Icons.error, color: Colors.red));
    }

    print(widget.machine.id);

    // Update stock
    updateStock(
      machineId: widget.machine.id,
      name: widget.stock['name'],
      qty: widget.stock['qty'] - 1,
    );

    // Force page refresh
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      width: double.maxFinite,
      child: Container(
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: const Color.fromARGB(255, 250, 250, 250),

          // Shadow
          boxShadow: const [
            BoxShadow(
              color: Color.fromARGB(31, 0, 0, 0),
              offset: Offset(0, 4),
              blurRadius: 10,
            ),
          ],
        ),
        child: ExpansionTile(
          clipBehavior: Clip.antiAlias,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          title: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              // Image
              Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: const Color.fromARGB(255, 255, 255, 255),
                ),
                child: widget.stock['image'] == null
                    ? const Icon(Icons.image_not_supported_outlined)
                    : Image.asset("assets/images/${widget.stock['image']}",
                        fit: BoxFit.cover),
              ),

              // Spacing
              const SizedBox(width: 20),

              // Expanded
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Title
                    Text(
                      "${widget.stock['name']}",
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),

                    // Spacing
                    const SizedBox(height: 5),

                    // Quantity
                    Row(
                      children: [
                        const Icon(
                          Icons.inventory_2_outlined,
                          size: 15,
                          color: Colors.grey,
                        ),
                        const SizedBox(width: 3),
                        const Text(":"),
                        const SizedBox(width: 3),
                        Text(
                          widget.stock['qty'].toString(),
                          style: const TextStyle(
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),

                    // Price
                    Row(
                      children: [
                        const Icon(
                          Icons.attach_money_outlined,
                          size: 15,
                          color: Colors.grey,
                        ),
                        const SizedBox(width: 3),
                        const Text(":"),
                        const SizedBox(width: 3),
                        Text(
                          // 2 dp
                          "\$${widget.stock['price'].toStringAsFixed(2)}",
                          style: const TextStyle(
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          childrenPadding: EdgeInsets.zero,
          expandedCrossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  // Body
                  Text(
                    widget.stock['description'] ?? "No Facts Avaliable",
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    style: const TextStyle(
                      fontSize: 15,
                    ),
                  ),

                  // Spacing
                  const SizedBox(height: 10),

                  // Button
                  MaterialButton(
                    onPressed: () {
                      // Check if stock is available
                      if (widget.stock['qty'] == 0) {
                        showModal(
                            context,
                            "Item Unavaliable!",
                            "Sorry, ${widget.stock['name']} is out of stock!",
                            const Icon(Icons.error, color: Colors.red));
                        return;
                      }

                      // Check if platform is not mobile
                      if (!!kIsWeb && (Platform.isAndroid || Platform.isIOS)) {
                        showModal(
                            context,
                            "Unsupported Platform!",
                            "Sorry, this feature is not avaliable on mobile!",
                            const Icon(Icons.error, color: Colors.red));

                        return;
                      }

                      // transition to nfc page
                      Navigator.push(
                        context,
                        PageTransition(
                          type: PageTransitionType.fade,
                          child: NFC(
                            callback: reserveItem,
                          ),
                        ),
                      );
                    },
                    minWidth: double.maxFinite,
                    height: 40,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    color: const Color.fromARGB(255, 255, 255, 255),
                    child: const Row(children: [
                      Icon(Icons.shopping_cart_outlined),
                      SizedBox(width: 10),
                      Text("Reserve Item"),
                    ]),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
