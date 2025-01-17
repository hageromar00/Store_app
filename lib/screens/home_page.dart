import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:store2_app/models/product_model.dart';
import 'package:store2_app/services/get_all_product.dart';
import 'package:store2_app/widgets/custom_card.dart';
class homePage extends StatelessWidget {
  const homePage({Key? key}) : super(key: key);
  static String id = 'HomePAge';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                FontAwesomeIcons.cartPlus,
                color: Colors.black,
              ))
        ],
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'New Trend',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16, top: 65),
        child: FutureBuilder<List<ProductModel>>(
          future: GetAllProducts().getAllProducts(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<ProductModel> products = snapshot.data!;
              return GridView.builder(
                  itemCount: products.length,
                  clipBehavior: Clip.none,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 1.5,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 100,
                  ),
                  itemBuilder: (context, index) {
                    return CustomCard(prod: products[index]);
                  });
            } else {
              return const Center(
                child: Center(child: CircularProgressIndicator()),
              );
            }
          },
        ),
      ),
    );
  }
}

//////////////////////////////////////////////////////////////
// class homePage extends StatelessWidget {
//   const homePage({super.key});
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           actions: [
//             IconButton(
//                 onPressed: () {}, icon: const Icon(FontAwesomeIcons.cartPlus))
//           ],
//           centerTitle: true,
//           title: const Text(
//             'New Trend',
//             style: TextStyle(fontWeight: FontWeight.bold),
//           ),
//         ),
//         body: Padding(
//             padding: const EdgeInsets.only(left: 16, right: 16, top: 65),
//             child: FutureBuilder<List<ProductModel>>(
//                 future: GetAllProducts().getAllProducts(),
//                 builder: (context, snapshot) {
//                   if (snapshot.hasData) {
//                     List<ProductModel> products = snapshot.data!;
//                     return GridView.builder(
//                         itemCount: products.length,
//                         clipBehavior: Clip.none,
//                         gridDelegate:
//                             const SliverGridDelegateWithFixedCrossAxisCount(
//                                 crossAxisCount: 2,
//                                 crossAxisSpacing: 40,
//                                 mainAxisSpacing: 100,
//                                 childAspectRatio: 1.3),
//                         itemBuilder: (context, index) {
//                           return CustomCard(
//                             prod: products[index],
//                           );
//                         });
//                   } else {
//                     return const Center(child: CircularProgressIndicator());
//                   }
//                 })));
//   }
// }
