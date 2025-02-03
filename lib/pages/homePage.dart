import 'package:flutter/material.dart';
import 'package:infinite_carousel/infinite_carousel.dart';
import 'package:animated_button/animated_button.dart';
import 'package:mytailor/pages/designPage.dart';
import 'package:mytailor/pages/fabricPage.dart';
import 'package:mytailor/pages/measurementsPage.dart';
import 'package:mytailor/pages/tailorPage.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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

  final List<String> catUrls = [
    'assets/cat/BLAZERS.jpg',
    'assets/cat/CASUAL DRESS.jpg',
    'assets/cat/CASUAL TOPS.jpg',
    'assets/cat/CROP TOP.jpg',
    'assets/cat/HIGH NECK.jpg',
    'assets/cat/OFFICE TOPS.jpg',
    'assets/cat/PARTY TOP.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Center(
            child: Text(
              "MY TAILOR",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                letterSpacing: 2.0,
              ),
            ),
          ),
        ),
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "CATEGORIES",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                SizedBox(
                  height: 150,
                  child: InfiniteCarousel.builder(
                    itemCount: catUrls.length,
                    itemExtent: 120,
                    center: true,
                    anchor: 0.0,
                    velocityFactor: 0.2,
                    onIndexChanged: (index) {
                      print('Current index: $index');
                    },
                    axisDirection: Axis.horizontal,
                    loop: true,
                    itemBuilder: (context, itemIndex, realIndex) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const MeasurePage(false)),
                          );
                        },
                        child: Container(
                          margin: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black26,
                                blurRadius: 4,
                                spreadRadius: 2,
                              ),
                            ],
                          ),
                          child: Stack(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(12),
                                child: Image.asset(
                                  catUrls[itemIndex],
                                  fit: BoxFit.cover,
                                  width: double.infinity,
                                  height: double.infinity,
                                ),
                              ),
                              Positioned(
                                bottom: 8,
                                left: 8,
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 8, vertical: 4),
                                  color: Colors.black54,
                                  child: Text(
                                    catUrls[itemIndex]
                                        .replaceFirst('assets/cat/', '')
                                        .split('.')
                                        .first,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 10,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AnimatedButton(
                      color: Color(0xFF294C74),
                      width: 180,
                      height: 100,
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.design_services,
                              color: Colors.white,
                            ),
                            Spacer(),
                            Text(
                              'DESIGN A SUIT',
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const DesignPage()),
                        );
                      },
                    ),
                    Spacer(),
                    AnimatedButton(
                      color: Color(0xFF6F8191),
                      width: 180,
                      height: 100,
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.accessibility_new,
                              color: Colors.white,
                            ),
                            Spacer(),
                            Text(
                              'MEASUREMENTS',
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const MeasurePage(true)),
                        );
                      },
                    ),
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AnimatedButton(
                      color: Color(0xFF3D4249),
                      width: 180,
                      height: 100,
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.checkroom,
                              color: Colors.white,
                            ),
                            Spacer(),
                            Text(
                              'FABRIC \nCOLLECTION',
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const FabricPage(true)),
                        );
                      },
                    ),
                    Spacer(),
                    AnimatedButton(
                      color: Color(0xFFF2630D),
                      width: 180,
                      height: 100,
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.local_mall,
                              color: Colors.white,
                            ),
                            Spacer(),
                            Text(
                              'TAILOR MADE',
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const TailorPage()),
                        );
                      },
                    ),
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "RECENT CHOICES",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.6,
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount:
                          MediaQuery.of(context).size.width > 600 ? 3 : 2,
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
                                  loadingBuilder:
                                      (context, child, loadingProgress) {
                                    if (loadingProgress == null) {
                                      return child;
                                    } else {
                                      return Center(
                                        child: CircularProgressIndicator(
                                          value: loadingProgress
                                                      .expectedTotalBytes !=
                                                  null
                                              ? loadingProgress
                                                      .cumulativeBytesLoaded /
                                                  (loadingProgress
                                                          .expectedTotalBytes ??
                                                      1)
                                              : null,
                                        ),
                                      );
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
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
