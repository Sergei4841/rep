import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:smartstore2/design/colors.dart';
import 'package:smartstore2/pages/home.dart';

class Basket extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ShoppingPage(),
    );
  }
}

class ShoppingPage extends StatefulWidget {
  @override
  _ShoppingPageState createState() => _ShoppingPageState();
}

class _ShoppingPageState extends State<ShoppingPage> {
  List<Map<String, dynamic>> products = [
    {"name": "Сметана Простоквашино 10% 300г", "price": "74.99₽"},
    {"name": "Пирожное Milka", "price": "55.99₽"},
    {"name": "Колбаса Папа Может", "price": "164.99₽"},
    {"name": "Майонез СЛОБОДА", "price": "159.99₽"},
  ];

  void _openScanner() async {
    final scannedProduct = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => BarcodeScanPage()),
    );

    if (scannedProduct != null) {
      setState(() {
        products.add(scannedProduct);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: backgroundColor,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.account_circle_outlined,
              color: Colors.black, size: 40),
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Home()));
          },
        ),
        title: Container(
          height: 45,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(30),
          ),
          child: TextField(
            decoration: InputDecoration(
              hintText: "Поиск",
              prefixIcon: Icon(Icons.search),
              border: InputBorder.none,
              contentPadding: EdgeInsets.symmetric(vertical: 10),
            ),
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications_none, color: Colors.black, size: 40),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 150,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.grey[300], // Заменили изображение на цвет
              ),
              child: Align(
                alignment: Alignment.centerRight,
                child: Icon(Icons.arrow_forward_ios, color: Colors.black54),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FilterButton(icon: Icons.filter_alt, text: "Фильтр"),
                FilterButton(icon: Icons.currency_ruble, text: "Цена"),
                FilterButton(icon: Icons.percent, text: "Скидки"),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: products.length,
              itemBuilder: (context, index) {
                return ProductCard(product: products[index]);
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            InkWell(
              onTap: _openScanner,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.camera_alt, color: Colors.black),
                    SizedBox(width: 8),
                    Text("Используйте камеру",
                        style: TextStyle(color: primaryColor, fontSize: 20)),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FilterButton extends StatelessWidget {
  final IconData icon;
  final String text;

  FilterButton({required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: () {},
      icon: Icon(icon, color: Colors.black),
      label: Text(text, style: TextStyle(color: Colors.black)),
      style: ElevatedButton.styleFrom(
        backgroundColor: secondaryColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  final Map<String, dynamic> product;

  ProductCard({required this.product});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: ListTile(
        leading:
            Icon(Icons.shopping_basket_outlined, size: 40, color: Colors.grey),
        title: Text(product["name"], style: TextStyle(fontSize: 13)),
        trailing: Text(product["price"],
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
      ),
    );
  }
}

class BarcodeScanPage extends StatelessWidget {
  final Map<String, Map<String, dynamic>> barcodeToProduct = {
    '123456': {"name": "Новое молоко", "price": "80.00₽"},
    '789012': {"name": "Шоколад", "price": "99.99₽"},
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Сканер штрихкода')),
      body: MobileScanner(
        controller: MobileScannerController(),
        onDetect: (capture) {
          final barcode = capture.barcodes.first;
          final code = barcode.rawValue ?? '';
          final product = barcodeToProduct[code];

          if (product != null) {
            Navigator.pop(context, product);
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text("Товар с таким штрихкодом не найден")),
            );
          }
        },
      ),
    );
  }
}
