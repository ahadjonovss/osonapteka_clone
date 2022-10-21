import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:osonapteka_app/models/drug_model.dart';
import 'package:osonapteka_app/pages/success_purchase_page.dart';

class AdminPage extends StatefulWidget {
  const AdminPage({Key? key}) : super(key: key);

  @override
  State<AdminPage> createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {
  var formKey = GlobalKey<FormState>();

  String name = '';
  String desc = '';
  int price = 0;
  int quantity = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Admin Panel"),
      ),
      body: Form(
        key: formKey,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(8),
              child: TextFormField(
                onSaved: (val) {
                  name = val ?? "";
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Name',
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8),
              child: TextFormField(
                onSaved: (val) {
                  desc = val ?? "";
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Description',
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8),
              child: TextFormField(
                onSaved: (val) {
                  price = int.parse(val ?? '0');
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Price',
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8),
              child: TextFormField(
                onSaved: (val) {
                  quantity = int.parse(val ?? '0');
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Quantity',
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                formKey.currentState!.save();

                var medicine = Drugs(
                  name: name,
                  description: desc,
                  price: price,
                  imageUrl:
                  'https://apteka.uz/upload/iblock/6d7/6d7e7d1f0b0f604a1b6a21a796c4c8b9.jpeg',
                  quantity: quantity,
                );

                postMedicine(medicine);
              },
              child: Text("Save"),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> postMedicine(Drugs medicine) async {
    String url = "https://pharmacy-app-management.herokuapp.com/api/drugs";

    var response= await Dio().post(url,data: Drugs.DrugsToJson(medicine));

    if(response.statusCode==200){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=>PurchasePage()));
    }


  }
}
