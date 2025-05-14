import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:smartstore2/design/colors.dart';
import 'package:smartstore2/pages/home.dart';

class BasketNotChecked extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ShoppingPageChecked(),
    );
  }
}

class ShoppingPageChecked extends StatefulWidget {
  @override
  _ShoppingPageCheckedState createState() => _ShoppingPageCheckedState();
}

class _ShoppingPageCheckedState extends State<ShoppingPageChecked> {
  List<Map<String, dynamic>> products = [
    {
      "name": "Сметана Простоквашино 10% 300г",
      "price": "74.99₽",
      "image": "assets/images/smetana.png"
    },
    {
      "name": "Пирожное Milka бисквитное с кремом цельное молоко 29г",
      "price": "55.99₽",
      "image": "assets/images/milka.png"
    },
    {
      "name": "Колбаса Папа Может, Сервелат Финский, 0,42кг",
      "price": "164.99₽",
      "image": "assets/images/kolbasa.png"
    },
    {
      "name": "Майонез СЛОБОДА, провансаль, 67%, 750г",
      "price": "159.99₽",
      "image": "assets/images/mayonez.png"
    },
  ];

  void _openScanner() async {
    final scannedProduct = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => BarcodeScanPageChecked()),
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
        title: TextField(
          decoration: InputDecoration(
            hintText: "Поиск",
            prefixIcon: Icon(Icons.search),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
            filled: true,
            fillColor: Colors.white,
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
                image: DecorationImage(
                  image: AssetImage("assets/images/banner.png"),
                  fit: BoxFit.cover,
                ),
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
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                InkWell(
                  onTap: _openScanner,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.camera_alt, color: Colors.black),
                      SizedBox(width: 8),
                      Text("Используйте камеру",
                          style: TextStyle(color: primaryColor, fontSize: 18)),
                    ],
                  ),
                ),
                SizedBox(height: 8),
                InkWell(
                  onTap: () {
                    print("Подтверждение возраста");
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.verified, color: Colors.red),
                      SizedBox(width: 8),
                      Text("Подтвердите ваш возраст",
                          style: TextStyle(color: Colors.red, fontSize: 16)),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
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
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: ListTile(
        leading: Image.asset(product["image"], width: 50, height: 50,
            errorBuilder: (context, error, stackTrace) {
          return Icon(Icons.image_not_supported, size: 50);
        }),
        title: Text(product["name"], style: TextStyle(fontSize: 13)),
        trailing: Text(product["price"],
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
      ),
    );
  }
}

class BarcodeScanPageChecked extends StatelessWidget {
  final Map<String, Map<String, dynamic>> barcodeToProduct = {
    '123456': {
      "name": "Новое молоко",
      "price": "80.00₽",
      "image": "assets/images/milk.png"
    },
    '789012': {
      "name": "Шоколад",
      "price": "99.99₽",
      "image": "assets/images/chocolate.png"
    },
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
