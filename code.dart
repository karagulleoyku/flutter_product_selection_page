import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: UrunSecimEkrani(),
    );
  }
}

class UrunSecimEkrani extends StatefulWidget { 
  @override
  _UrunSecimEkraniState createState() => _UrunSecimEkraniState();
}

class _UrunSecimEkraniState extends State<UrunSecimEkrani> {
  List<Map<String, dynamic>> urunler = [
    {'ad': 'Ürün 1', 'fiyat': 100},
    {'ad': 'Ürün 2', 'fiyat': 150},
    {'ad': 'Ürün 3', 'fiyat': 200},
    {'ad': 'Ürün 4', 'fiyat': 250},
    {'ad': 'Ürün 5', 'fiyat': 300},
  ];

  int secilenUrunIndex = -1; //başlangıçta -1 verildi

  void urunSec(int index) {
    setState(() {
      secilenUrunIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
         child: Text('Ürün Seçimi'),
      ),
        ),
      body: Column(
        children: [
          // Yatay ListView için ürün isimleri
          Container(
            height: 100,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: urunler.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () => urunSec(index),
                  child: Container(
                    padding: EdgeInsets.all(16),
                    margin: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                    decoration: BoxDecoration(
                      color: secilenUrunIndex == index
                          ? Colors.redAccent.withOpacity(0.7)
                          : Colors.grey[200],
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Center(
                      child: Text(
                        urunler[index]['ad'],
                        style: TextStyle(
                          fontSize: 18,
                          color: secilenUrunIndex == index
                              ? Colors.white
                              : Colors.black,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Expanded(
            child: GridView.builder(
              padding: EdgeInsets.all(16),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 8,
                crossAxisSpacing: 8,
                childAspectRatio: 2,
              ),
              itemCount: urunler.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () => urunSec(index),
                  child: Container(
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: secilenUrunIndex == index
                          ? Colors.redAccent.withOpacity(0.5)
                          : Colors.grey[300],
                      borderRadius: BorderRadius.circular(8),
                      border: secilenUrunIndex == index
                          ? Border.all(color: Colors.redAccent, width: 2)
                          : null,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          urunler[index]['ad'],
                          style: TextStyle(fontSize: 15),
                        ),
                        SizedBox(height: 8),
                        Text(
                          '${urunler[index]['fiyat']} TL',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
