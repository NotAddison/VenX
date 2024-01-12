import 'package:flutter/material.dart';

class StockCard extends StatelessWidget {
  final Object stock;
  const StockCard({super.key, required this.stock});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(bottom: 20),
        height: 100,
        width: double.maxFinite,
        child: Card(
          elevation: 1,
          color: Colors.white,
          child: InkWell(
            borderRadius: BorderRadius.circular(10),
            onTap: () {
              print('Card tapped.');
            },
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: <Widget>[
                  // Image
                  Container(
                    width: 80,
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

                  // Spacing
                  const SizedBox(width: 10),

                  // Post content
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Title
                        Text(
                          "Stock Name",
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        // Body
                        Text(
                          "Facts",
                          style: const TextStyle(
                            fontSize: 15,
                          ),
                        ),

                        Text(
                          "Stock Count",
                          style: const TextStyle(
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Spacing
                  const SizedBox(width: 10),
                ],
              ),
            ),
          ),
        ));
  }
}
