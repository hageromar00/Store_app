import 'package:flutter/material.dart';
import 'package:store2_app/models/product_model.dart';
import 'package:store2_app/screens/update_page.dart';

class CustomCard extends StatelessWidget {
  CustomCard({super.key, required this.prod});
  ProductModel prod;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, UpdatePage.id,arguments: prod);
      },
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            decoration: const BoxDecoration(boxShadow: [
              BoxShadow(
                  blurRadius: 60,
                  color: Color.fromARGB(255, 215, 211, 211),
                  spreadRadius: 0,
                  offset: Offset(10, 13))
            ]),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: Card(
                elevation: 20,
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        prod.title.substring(0, 10),
                        style: TextStyle(color: Colors.grey),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            r'$' '${prod.price}',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Icon(
                            Icons.favorite,
                            color: Colors.red,
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          Positioned(
              left: 80,
              top: -60,
              child: Image.network(
                prod.image,
                height: 100,
                width: 100,
              ))
        ],
      ),
    );
  }
}
