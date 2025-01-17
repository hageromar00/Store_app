import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:store2_app/models/product_model.dart';
import 'package:store2_app/services/update_services.dart';
import 'package:store2_app/widgets/custom_button.dart';
import 'package:store2_app/widgets/custom_field.dart';

class UpdatePage extends StatefulWidget {
  UpdatePage({super.key});
  static String id = 'update';

  @override
  State<UpdatePage> createState() => _UpdatePageState();
}

class _UpdatePageState extends State<UpdatePage> {
  String?  prodname,image, desc, price;
  bool isLoad = false;

  @override
  Widget build(BuildContext context) {
    ProductModel product =
        ModalRoute.of(context)!.settings.arguments as ProductModel;
    return ModalProgressHUD(
      inAsyncCall: isLoad,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 14, 6, 88),
          title: const Text(
            'Update Product',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              CustomTextField(
                hintext: 'productname: ',
                onchange: (data) {
                  prodname = data;
                },
              ),
              SizedBox(
                height: 10,
              ),
              CustomTextField(
                hintext: 'price: ',
                onchange: (data) {
                  price = data;
                },
                inputTyp: TextInputType.number,
              ),
              SizedBox(
                height: 10,
              ),
              CustomTextField(
                hintext: 'description: ',
                onchange: (data) {
                  desc = data;
                },
              ),
              SizedBox(
                height: 10,
              ),
              CustomTextField(
                hintext: 'image: ',
                onchange: (data) {
                  image = data;
                },
              ),
              SizedBox(
                height: 50,
              ),
              CustomButtonField(
                ontap: () async {
                  isLoad = true;
                  setState(() {});
                  print('hhhhhhh');
                  try {
                    await update(product);
                    print('success');
                  }  catch (e) {
                        print(e.toString());
                      }
                        isLoad = false;
                      setState(() {});
                },
                text: 'UPDATE',
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> update(ProductModel product) async {
    await UpdateProducts().updateProduct(
      title:prodname==null ? product.title :prodname!,
      desc: desc == null ? product.description : desc!,
      image: image == null ? product.image : image!,
      category: product.category,
      price: price == null ? product.price.toString() : price!,
      id: product.id,
    );
  }
}
/////////////////


// class UpdatePage extends StatefulWidget {
//   UpdatePage({super.key});
//   static String id = 'updatepage';

//   @override
//   State<UpdatePage> createState() => _UpdatePageState();
// }

// class _UpdatePageState extends State<UpdatePage> {
//   String? prodName, image, price, desc;
//   bool isLoad = false;
//   @override
//   Widget build(BuildContext context) {
//     ProductModel prode =
//         ModalRoute.of(context)!.settings.arguments as ProductModel;
//     return ModalProgressHUD(
//       inAsyncCall: isLoad,
//       child: Scaffold(
//         appBar: AppBar(
//           title: const Text(
//             'Update Product',
//             style: TextStyle(
//               color: Colors.black,
//             ),
//           ),
//           // backgroundColor: Colors.transparent,
//           centerTitle: true,
//           // elevation: 0,
//         ),
//         body: Padding(
//           padding: const EdgeInsets.all(10),
//           child: SingleChildScrollView(
//             child: Column(
//               children: [
//                 const SizedBox(
//                   height: 100,
//                 ),
//                 CustomTextField(
//                   onchange: (data) {
//                     prodName = data;
//                   },
//                   hintext: 'product Name: ',
//                 ),
//                 const SizedBox(
//                   height: 10,
//                 ),
//                 CustomTextField(
//                   hintext: 'describtions: ',
//                   onchange: (data) {
//                     desc = data;
//                   },
//                 ),
//                 const SizedBox(
//                   height: 10,
//                 ),
//                 CustomTextField(
//                   hintext: 'price: ',
//                   onchange: (data) {
//                     price = data;
//                   },
//                   inputTyp: TextInputType.number,
//                 ),
//                 const SizedBox(
//                   height: 10,
//                 ),
//                 CustomTextField(
//                   hintext: 'image: ',
//                   onchange: (dataa) {
//                     image = dataa;
//                   },
//                 ),
//                 const SizedBox(
//                   height: 50,
//                 ),
//                 CustomButtonField(
//                     text: 'Update',
//                     ontap: () async {
//                       isLoad = true;
//                       setState(() {});
//                       try {
//                       await  updat(prode);
//                        print('success');
//                       } catch (e) {
//                         print(e.toString());
//                       }
//                       isLoad = false;
//                       setState(() {});
//                     })
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   Future<void> updat(ProductModel prode) async{
//    await UpdateProducts().updateProduct(
//     id: prode.id,
//         title: prodName == null ? prode.title : prodName!,
//         price: price == null ? prode.price.toString() : price!,
//         desc: desc == null ? prode.description : desc!,
//         image: image == null ? prode.image : image!,
//         category: prode.category);

        
//     //   title: prodName!,
//     //   price: price!,
//     //   desc: desc!,
//     //   image: image!,
//     //   category: prode.category,
//     //   id: 1,
//     // );
//   }
// }
