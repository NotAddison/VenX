import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:page_transition/page_transition.dart  ';
import 'nfc.dart';

class StockCard extends StatelessWidget {
  final Map<String, dynamic> stock;

  const StockCard({Key? key, required this.stock}) : super(key: key);

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
                child: Image.network(
                  stock['image'] ??
                      'https://picsum.photos/250?image=${stock['qty'] ?? 0}',
                  fit: BoxFit.cover,
                ),
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
                      "${stock['name']} | ${stock['qty']}",
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),

                    // Spacing
                    const SizedBox(height: 5),

                    // Price
                    Text(
                      "\$${stock['price'].toString()}",
                      style: const TextStyle(
                        fontSize: 15,
                      ),
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
                    stock['description'] ?? "No Facts Avaliable",
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
                      // transition to nfc page
                      Navigator.push(
                        context,
                        PageTransition(
                          type: PageTransitionType.fade,
                          child: NFC(),
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
