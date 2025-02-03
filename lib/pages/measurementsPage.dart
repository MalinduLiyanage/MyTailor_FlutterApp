import 'package:flutter/material.dart';
import 'package:mytailor/pages/fabricPage.dart';
import 'package:mytailor/changenotifiers/user.dart';
import 'package:provider/provider.dart';

class MeasurePage extends StatefulWidget {
  final bool isHome;

  const MeasurePage(this.isHome, {super.key});

  @override
  State<MeasurePage> createState() => _MeasurePageState();
}

class _MeasurePageState extends State<MeasurePage> {
  // Text controllers for each measurement field
  final TextEditingController _bodyController = TextEditingController();
  final TextEditingController _chestController = TextEditingController();
  final TextEditingController _waistController = TextEditingController();
  final TextEditingController _hipController = TextEditingController();
  final TextEditingController _thighController = TextEditingController();
  final TextEditingController _sleeveController = TextEditingController();
  final TextEditingController _legController = TextEditingController();

  @override
  void initState() {
    super.initState();

    // Load the existing values from UserDetailsProvider if they are not null
    final userDetails = context.read<UserDetailsProvider>().userDetails;

    if (userDetails.body != null) {
      _bodyController.text = userDetails.body!;
    }
    if (userDetails.chest != null) {
      _chestController.text = userDetails.chest!;
    }
    if (userDetails.waist != null) {
      _waistController.text = userDetails.waist!;
    }
    if (userDetails.hip != null) {
      _hipController.text = userDetails.hip!;
    }
    if (userDetails.thigh != null) {
      _thighController.text = userDetails.thigh!;
    }
    if (userDetails.sleeveLen != null) {
      _sleeveController.text = userDetails.sleeveLen!;
    }
    if (userDetails.legLen != null) {
      _legController.text = userDetails.legLen!;
    }
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
              "MEASUREMENTS",
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
                // Save the entered measurements to the UserDetailsProvider
                context
                    .read<UserDetailsProvider>()
                    .updateDetail('body', _bodyController.text);
                context
                    .read<UserDetailsProvider>()
                    .updateDetail('chest', _chestController.text);
                context
                    .read<UserDetailsProvider>()
                    .updateDetail('waist', _waistController.text);
                context
                    .read<UserDetailsProvider>()
                    .updateDetail('hip', _hipController.text);
                context
                    .read<UserDetailsProvider>()
                    .updateDetail('thigh', _thighController.text);
                context
                    .read<UserDetailsProvider>()
                    .updateDetail('sleeveLen', _sleeveController.text);
                context
                    .read<UserDetailsProvider>()
                    .updateDetail('legLen', _legController.text);

                // Navigate to next page or pop depending on isHome
                if (widget.isHome == false) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const FabricPage(false)),
                  );
                } else {
                  Navigator.pop(context);
                }
              },
              icon: Icon(
                widget.isHome == false
                    ? Icons.check
                    : Icons.save, // Change icon based on isHome
              ),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 5),
              Center(
                child: Image.asset(
                  'assets/female_measurements.png',
                  fit: BoxFit.cover,
                  height: 500,
                ),
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    buildTextField("Body Height (in cm)", _bodyController),
                    buildTextField(
                        "Chest Measurement (in cm)", _chestController),
                    buildTextField(
                        "Waist Measurement (in cm)", _waistController),
                    buildTextField("Hip Circumference (in cm)", _hipController),
                    buildTextField("Thigh Width (in cm)", _thighController),
                    buildTextField("Sleeve Length (in cm)", _sleeveController),
                    buildTextField("Leg Length (in cm)", _legController),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTextField(String label, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          SizedBox(height: 8),
          TextField(
            controller: controller,
            keyboardType: TextInputType.number,
            maxLines: 1,
            maxLength: 3,
            enableSuggestions: false,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            ),
          ),
        ],
      ),
    );
  }
}
