import 'package:flutter/material.dart';

class TailorPage extends StatefulWidget {
  const TailorPage({super.key});

  @override
  State<TailorPage> createState() => _TailorPageState();
}

class _TailorPageState extends State<TailorPage> {
  final List<String> imageUrls = [
    'https://neutral.com/cdn/shop/products/1_0fc5c65c-d3c5-4a3a-9a79-68744927a312_1024x1024.jpg?v=1738065541',
    'https://neutral.com/cdn/shop/products/1_c0c12202-4797-4162-a9a2-c1364e38f5db_1024x1024.jpg?v=1738073978',
    'https://neutral.com/cdn/shop/products/11_7619ba9a-f801-4d02-be3a-a38f26d46076_1024x1024.jpg?v=1738065541',
    'https://neutral.com/cdn/shop/products/12_a273ee4e-aa75-46d1-a233-b7dfd3b352db_1024x1024.jpg?v=1738161574',
    'https://neutral.com/cdn/shop/products/1_a0dd947b-b876-45ba-ac41-b5aaf78bad42_1024x1024.jpg?v=1738240401',
    'https://cdn.seventyvenezia.filoblu.com/media/catalog/product/C/A/CA1327460090642_01.jpg',
    'https://cdn.seventyvenezia.filoblu.com/media/catalog/product/A/B/AB1479450252235_01.jpg',
    'https://cdn.seventyvenezia.filoblu.com/media/catalog/product/A/B/AB148070470147999_01.jpg',
    'https://cdn.seventyvenezia.filoblu.com/media/catalog/product/G/O/GO0742540247245_01.jpg',
    'https://cdn.seventyvenezia.filoblu.com/media/catalog/product/G/O/GO0741180003755_01.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Center(
            child: Text(
              "TAILOR MADE",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                letterSpacing: 2.0,
              ),
            ),
          ),
        ),
        body: SizedBox(
          height: double.infinity,
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: MediaQuery.of(context).size.width > 600 ? 2 : 1,
              crossAxisSpacing: 4,
              mainAxisSpacing: 4,
              childAspectRatio: 1.2,
            ),
            itemCount: imageUrls.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 4,
                        spreadRadius: 1,
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Stack(
                      fit: StackFit.expand,
                      children: [
                        Image.network(
                          imageUrls[index],
                          fit: BoxFit.cover,
                          loadingBuilder: (context, child, loadingProgress) {
                            if (loadingProgress == null) {
                              return child; // Image is loaded, return the image
                            } else {
                              return Center(
                                child: CircularProgressIndicator(
                                  value: loadingProgress.expectedTotalBytes !=
                                          null
                                      ? loadingProgress.cumulativeBytesLoaded /
                                          (loadingProgress.expectedTotalBytes ??
                                              1)
                                      : null,
                                ),
                              ); // Show loading overlay
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
