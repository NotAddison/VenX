import 'package:flutter/material.dart';
import '../widgets/sub_base.dart';
import '../widgets/preview_machine.dart';
import '../utils/requests.dart';

class Bookmarks extends StatefulWidget {
  const Bookmarks({super.key});

  @override
  State<Bookmarks> createState() => _BookmarksState();
}

class _BookmarksState extends State<Bookmarks> {
  late Future<List<Widget>> machinesFuture;

  @override
  void initState() {
    super.initState();
    machinesFuture = getFavorites().then((machines) {
      return machines.map((machine) {
        return Container(
          margin: const EdgeInsets.only(bottom: 30),
          child: MachinePreview(
            machine: machine,
            isCard: false,
          ),
        );
      }).toList();
    });
  }

  Future<void> _refresh() async {
    setState(() {
      machinesFuture = getFavorites().then((machines) {
        return machines.map((machine) {
          return Container(
            margin: const EdgeInsets.only(bottom: 30),
            child: MachinePreview(
              machine: machine,
              isCard: false,
            ),
          );
        }).toList();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Base(
      showNavBar: false,
      title: "Bookmarks",
      body: RefreshIndicator(
        onRefresh: _refresh,
        child: FutureBuilder<List<Widget>>(
          future: machinesFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              // Return a loading indicator while waiting for the data
              return const CircularProgressIndicator();
            } else if (snapshot.hasError) {
              // Return an error message if an error occurs
              return Text('Error: ${snapshot.error}');
            } else {
              // Return the list of widgets when the data is available
              return SizedBox(
                height: double.maxFinite,
                child: SingleChildScrollView(
                  padding: const EdgeInsets.only(bottom: 40),
                  clipBehavior: Clip.none,
                  physics: const AlwaysScrollableScrollPhysics(),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: snapshot.data?.isNotEmpty ?? false
                          ? snapshot.data!
                          : <Widget>[
                              // Center text
                              const SizedBox(
                                child: Center(
                                  child: Text(
                                    "An Empty Bookmark List...",
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w300,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                    ),
                  ),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
