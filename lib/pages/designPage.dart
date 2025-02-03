import 'package:flutter/material.dart';
import 'package:mytailor/pages/measurementsPage.dart';
import 'package:mytailor/changenotifiers/user.dart';
import 'package:provider/provider.dart';

class DesignPage extends StatefulWidget {
  const DesignPage({super.key});

  @override
  State<DesignPage> createState() => _DesignPageState();
}

class _DesignPageState extends State<DesignPage> {
  String? apparel;
  String? collar;
  String? sleeve;
  String? cuff;
  String? placket;
  String? pocket;
  String? yoke;
  String? pleat;
  String? hem;
  String? seam;
  String? button;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Center(
            child: Text(
              "DESIGN YOURS",
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
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const MeasurePage(false)),
                  );
                },
                icon: Icon(Icons.done))
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: buildDropdown(
                    "Apparel Type",
                    ["Tops", "Skirts", "Dress", "Trousers"],
                    (value) => context
                        .read<UserDetailsProvider>()
                        .updateDetail('apparel', value)),
              ),
              SizedBox(height: 5),
              Image.asset('assets/test_cloth.jpeg', fit: BoxFit.cover),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    buildDropdown(
                        "Collar Type",
                        [
                          "Spread collar",
                          "Button-down collar",
                          "Mandarin collar",
                          "Wing collar",
                          "Club collar",
                          "Convertible collar"
                        ],
                        (value) => context
                            .read<UserDetailsProvider>()
                            .updateDetail('collar', value)),
                    buildDropdown(
                        "Sleeve Type",
                        [
                          "Short sleeve",
                          "Long sleeve",
                          "Raglan sleeve",
                          "Roll-up sleeve with tab"
                        ],
                        (value) => context
                            .read<UserDetailsProvider>()
                            .updateDetail('sleeve', value)),
                    buildDropdown(
                        "Cuff Type",
                        [
                          "Standard buttoned cuff",
                          "French cuff",
                          "Barrel cuff",
                          "Elastic cuff"
                        ],
                        (value) => context
                            .read<UserDetailsProvider>()
                            .updateDetail('cuff', value)),
                    buildDropdown(
                        "Placket Type",
                        [
                          "Standard button placket",
                          "Concealed placket",
                          "No placket"
                        ],
                        (value) => context
                            .read<UserDetailsProvider>()
                            .updateDetail('placket', value)),
                    buildDropdown(
                        "Pocket",
                        ["No pockets", "Single pocket", "Double pockets"],
                        (value) => context
                            .read<UserDetailsProvider>()
                            .updateDetail('pocket', value)),
                    buildDropdown(
                        "Yoke Style",
                        ["Single-piece yoke", "Split yoke"],
                        (value) => context
                            .read<UserDetailsProvider>()
                            .updateDetail('yoke', value)),
                    buildDropdown(
                        "Pleat Type",
                        ["Box pleat", "Knife pleats", "No pleats"],
                        (value) => context
                            .read<UserDetailsProvider>()
                            .updateDetail('pleat', value)),
                    buildDropdown(
                        "Hem Style",
                        ["Straight hem", "Curved hem", "Double-fold hem"],
                        (value) => context
                            .read<UserDetailsProvider>()
                            .updateDetail('hem', value)),
                    buildDropdown(
                        "Seam Finish",
                        ["Overlocked", "French seams", "Flat-felled seams"],
                        (value) => context
                            .read<UserDetailsProvider>()
                            .updateDetail('seam', value)),
                    buildDropdown(
                        "Button Type",
                        [
                          "Plastic buttons",
                          "Wooden buttons",
                          "Metal buttons",
                          "Pearl snap buttons"
                        ],
                        (value) => context
                            .read<UserDetailsProvider>()
                            .updateDetail('button', value)),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildDropdown(
      String label, List<String> items, ValueChanged<String?> onChanged) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          SizedBox(height: 8),
          DropdownButtonFormField<String>(
            value: null,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            ),
            items: items
                .map((item) => DropdownMenuItem(value: item, child: Text(item)))
                .toList(),
            onChanged: onChanged,
          ),
        ],
      ),
    );
  }
}
