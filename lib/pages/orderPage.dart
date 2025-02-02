import 'package:flutter/material.dart';
import 'package:mytailor/changenotifiers/user.dart';
import 'package:quickalert/quickalert.dart';
import 'package:provider/provider.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({super.key});

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  // Controllers for input fields
  final TextEditingController _streetController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _postalController = TextEditingController();
  final TextEditingController _cardController = TextEditingController();
  final TextEditingController _expiryController = TextEditingController();
  final TextEditingController _cvvController = TextEditingController();

  // Function to check if all fields are filled
  bool _validateInputs() {
    if (_streetController.text.isEmpty ||
        _cityController.text.isEmpty ||
        _postalController.text.isEmpty ||
        _cardController.text.isEmpty ||
        _expiryController.text.isEmpty ||
        _cvvController.text.isEmpty) {
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    String? apparel = context.watch<UserDetailsProvider>().userDetails.apparel;
    String? button = context.watch<UserDetailsProvider>().userDetails.button;
    String? collor = context.watch<UserDetailsProvider>().userDetails.collar;
    String? cuff = context.watch<UserDetailsProvider>().userDetails.cuff;
    String? hem = context.watch<UserDetailsProvider>().userDetails.hem;
    String? placket = context.watch<UserDetailsProvider>().userDetails.placket;
    String? pleat = context.watch<UserDetailsProvider>().userDetails.pleat;
    String? pocket = context.watch<UserDetailsProvider>().userDetails.pocket;
    String? seam = context.watch<UserDetailsProvider>().userDetails.seam;
    String? sleeve = context.watch<UserDetailsProvider>().userDetails.sleeve;
    String? yoke = context.watch<UserDetailsProvider>().userDetails.yoke;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Center(
            child: Text(
              "ORDER SUMMARY",
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
                if (_validateInputs()) {
                  QuickAlert.show(
                    onConfirmBtnTap: () {
                      Navigator.of(context).popUntil((route) => route.isFirst);
                    },
                    context: context,
                    type: QuickAlertType.success,
                    text: 'Transaction Completed Successfully!',
                  );
                } else {
                  QuickAlert.show(
                    context: context,
                    type: QuickAlertType.error,
                    title: 'Error',
                    text: 'All fields must be filled!',
                  );
                }
              },
              icon: Icon(Icons.done),
            ),
          ],
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: [
              // Order Details Section
              Card(
                elevation: 5,
                margin: EdgeInsets.only(bottom: 16),
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Order Details',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text('Apparel Type: $apparel'),
                      Text('Collor Type: $collor'),
                      Text('Sleeve Type: $sleeve'),
                      Text('Cuff Type: $cuff'),
                      Text('Placket Type: $placket'),
                      Text('Pocket: $pocket'),
                      Text('Yoke Style: $yoke'),
                      Text('Pleat Type: $pleat'),
                      Text('Hem Style: $hem'),
                      Text('Seam Finish: $seam'),
                      Text('Button Type: $button'),
                      Divider(),
                      Text(
                        'Total: \$45.00',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),

              // Shipping Address Section
              buildInputCard("Shipping Address", [
                buildTextField("Street Address", _streetController),
                buildTextField("City", _cityController),
                buildTextField("Postal Code", _postalController,
                    keyboardType: TextInputType.number),
              ]),

              // Payment Details Section
              buildInputCard("Payment Details", [
                buildTextField("Card Number", _cardController,
                    keyboardType: TextInputType.number),
                buildTextField("Expiry Date (MM/YY)", _expiryController),
                buildTextField("CVV", _cvvController,
                    keyboardType: TextInputType.number, isObscure: true),
              ]),
            ],
          ),
        ),
      ),
    );
  }

  // Reusable Input Card
  Widget buildInputCard(String title, List<Widget> fields) {
    return Card(
      elevation: 5,
      margin: EdgeInsets.only(bottom: 16),
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            ...fields, // Insert text fields dynamically
          ],
        ),
      ),
    );
  }

  // Reusable Text Field
  Widget buildTextField(String label, TextEditingController controller,
      {TextInputType keyboardType = TextInputType.text,
      bool isObscure = false}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: TextField(
        controller: controller,
        keyboardType: keyboardType,
        obscureText: isObscure,
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(),
        ),
      ),
    );
  }
}
