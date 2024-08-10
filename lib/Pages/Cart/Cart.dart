import 'package:flutter/material.dart';
import 'package:flutter_application_2/Pages/Cart/Model/cartModel.dart';
import 'package:flutter_application_2/Pages/Services/Cache/sheredPrafrences.dart';
import 'package:flutter_application_2/Pages/Services/dbOrder.dart';
import 'package:provider/provider.dart';

class CheckOut extends StatefulWidget {
  const CheckOut({super.key});

  @override
  State<CheckOut> createState() => _CheckOutState();
}

class _CheckOutState extends State<CheckOut> {
  @override
  void initState() {
    SqlDb.intialDb();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:
         AppBar(
          title: const Text('CheckOut'),
          
        ),
        body: ListCheckOut());
  }
}

class ListCheckOut extends StatelessWidget {
  const ListCheckOut({super.key});

  @override
  Widget build(BuildContext context) {
    var model = Provider.of<Cart>(context);
    return Column(
      children: [
        Expanded(
          flex: 9,
          child: ListView.builder(
              itemCount: model.bascketItems.length,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    leading: Image.network(model.bascketItems[index].thumbnail),
                    title: Text(
                        '${model.bascketItems[index].title}${model.bascketItems[index].price} '),
                    trailing: IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () {
                        model.remove(model.bascketItems[index]);
                      },
                    ),
                  ),
                );
              }),
        ),
        Expanded(
            child: InkWell(
          onTap: () async {
            if (model.products.isEmpty) {
              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text('السلة فارغة ...')));
            } else {
              await SqlDb.insertData(
                  "INSERT INTO 'orders'('User','total_price','count')  VALUES('${CacheData.getData(key: 'UserName')}','${model.totalPrice.toString()}','${model.count.toString()}') ");
              //
              model.removeAll();
            }
          },
          child: Container(
            width: double.infinity,
            color: Color(0xFFF6B26B),
            child: const Center(
                child: const Text('BUY NOW',
                    style: TextStyle(color: Colors.white, fontSize: 20)
                    // style: TextStyle(fontWeight: FontWeight.bold),
                    )),
          ),
        ))
      ],
    );
  }
}
