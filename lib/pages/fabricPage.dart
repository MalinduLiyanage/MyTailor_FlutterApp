import 'package:flutter/material.dart';
import 'package:mytailor/pages/orderPage.dart';
import 'package:provider/provider.dart';
import 'package:mytailor/changenotifiers/user.dart';

class FabricPage extends StatefulWidget {
  final bool isHome;
  const FabricPage(this.isHome, {super.key});

  @override
  State<FabricPage> createState() => _FabricPageState();
}

class _FabricPageState extends State<FabricPage> {
  String? selectedFabric;

  @override
  void initState() {
    super.initState();
    selectedFabric = context.read<UserDetailsProvider>().userDetails.fabric;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Center(
            child: Text(
              "FABRIC SELECTION",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                letterSpacing: 2.0,
              ),
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {
                if (widget.isHome == false) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const OrderPage()),
                  );
                } else {
                  Navigator.pop(context);
                }
              },
              icon: Icon(
                widget.isHome == false ? Icons.check : Icons.save,
              ),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                buildSelectableCard("COTTON"),
                buildSelectableCard("LINEN"),
                buildSelectableCard("POLYESTER"),
                buildSelectableCard("SILK"),
                buildSelectableCard("DENIM"),
                buildSelectableCard("STRETCH FABRIC"),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildSelectableCard(String title) {
    bool isSelected = selectedFabric == title;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
          setState(() {
            selectedFabric = title;
          });
          context.read<UserDetailsProvider>().updateDetail('fabric', title);
        },
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: isSelected ? Colors.blue : Colors.white,
            border: Border.all(color: isSelected ? Colors.blue : Colors.grey),
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              if (isSelected)
                BoxShadow(
                  color: Colors.blue.withOpacity(0.5),
                  blurRadius: 10,
                  spreadRadius: 2,
                ),
            ],
          ),
          padding: EdgeInsets.all(16),
          child: Center(
            child: Text(
              title,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: isSelected ? Colors.white : Colors.black,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
