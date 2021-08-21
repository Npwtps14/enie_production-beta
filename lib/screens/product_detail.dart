import 'package:dio/dio.dart';
import 'package:enie_production/screens/category_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_hex_color/flutter_hex_color.dart';
import 'package:line_icons/line_icon.dart';
import 'package:line_icons/line_icons.dart';
import 'cart_screen.dart';

class GetItem extends StatefulWidget {
  final int itemId;
  final itemName;
  final itemDetail;
  final itemImg;
  final itemPrice;
  final itemCapacity;
  final itemHowToUse;

  const GetItem(
      {int this.itemId,
      this.itemName,
      this.itemDetail,
      this.itemImg,
      this.itemPrice,
      this.itemCapacity,
      this.itemHowToUse});
  @override
  ProductDetailPageState createState() => new ProductDetailPageState();
}

//Getitem จากหน้า product มาหน้า Product details
class ProductDetailPageState extends State<GetItem> {
  Dio dio = new Dio();
  int _itemCount = 1;

  num total; // จำนวน item + and -
  // void main() {
  //   int count = this._itemCount;
  //   double productPrice = widget.itemPrice;
  //   double total = count * productPrice ;
  //   print(total);
  // }

  Future postCartData() async {
    final String pathUrl = 'https://app1.fantasy.co.th/salon-carts';

    dynamic cartData = {
      "user_id": "1",
      "product_id": widget.itemId,
      "product_name": widget.itemName,
      "item_count": this._itemCount,
      "status": "1",
      "product_price": this.total,
      "product_img": 'https://office.enie.co.th/images/product/300/${widget.itemImg}'
    };
    var response = await dio.post(pathUrl,
        data: cartData,
        options: Options(headers: {
          'Content-type': 'application/json',
        }));

    return response.data;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () {
          return new Future(() => true);
        },
        child: Scaffold(
          backgroundColor: HexColor('#f0f0f0'),
          resizeToAvoidBottomInset: false, //remove warnning pixel
          appBar: AppBar(
            automaticallyImplyLeading: true,
            title: Text(
              'รายละเอียดสินค้า',
              style: GoogleFonts.kanit(),
            ),
            leading: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CategoryPage()),
                );
              },
              child: Icon(
                Icons.arrow_back, // add custom icons also
              ),
            ),
            actions: <Widget>[
              Padding(
                padding: EdgeInsets.only(right: 20.0),
                child: GestureDetector(
                  onTap: () {},
                  child: IconButton(
                      icon: LineIcon(LineIcons.shoppingCart),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => CartPage()),
                        );
                      }),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 20.0),
              ),
            ],
            backgroundColor: HexColor('#36803a'),
          ),

          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      Card(
                        child: Container(
                          height: 160,
                          width: double.infinity,
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Image.network(
                            'https://office.enie.co.th/images/product/800/' +
                                widget.itemImg,
                            fit: BoxFit.fitHeight,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 8),
                  Container(
                    width: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.all(4),
                      child: Card(
                        child: Padding(
                          padding: EdgeInsets.all(8),
                          child: Text(widget.itemName,
                              style: GoogleFonts.kanit(
                                fontSize: 20,
                                fontWeight: FontWeight.w400,
                              )),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 2),
                  Container(
                    width: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.all(4),
                      child: Card(
                        child: Padding(
                          padding: EdgeInsets.all(8),
                          child: Text('ขนาด' + ' ${widget.itemCapacity}' + '',
                              style: GoogleFonts.kanit(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                              )),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 4),
                  Container(
                    child: Padding(
                        padding: EdgeInsets.all(4),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          padding: const EdgeInsets.all(2),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                '  ${this.total = this._itemCount * widget.itemPrice}' +
                                    ' บาท  ',
                                style: GoogleFonts.kanit(
                                    color: HexColor('#ffffff')),
                              ),
                            ],
                          ),
                        )),
                  ),
                  SizedBox(height: 8),
                  Container(
                    width: double.infinity,
                    alignment: Alignment.center,
                    child: Padding(
                      padding: const EdgeInsets.all(2),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          _itemCount != 0
                              ? new IconButton(
                                  icon: new Icon(
                                    Icons.remove_circle,
                                    color: Colors.red,
                                    size: 30,
                                  ),
                                  onPressed: () => setState(() => _itemCount--),
                                )
                              : Container(
                                  alignment: Alignment.center,
                                ),
                          Padding(padding: EdgeInsets.all(4)),
                          new Text(
                            '  จำนวน   ' + _itemCount.toString(),
                            style: GoogleFonts.kanit(
                                fontWeight: FontWeight.bold, fontSize: 16.0),
                          ),
                          new IconButton(
                            icon: new Icon(
                              Icons.add_box,
                              color: Colors.green,
                              size: 30,
                            ),
                            onPressed: () => setState(() => _itemCount++),
                          ),
                          RaisedButton(
                            color: Colors.blueAccent,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                            onPressed: () async {
                              await postCartData().then((value) {
                                print(value);
                              });
                            },
                            child: Text(
                              "ใส่ตระกร้า",
                              style: GoogleFonts.kanit(color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 2),
                  Container(
                    width: double.infinity,
                    alignment: Alignment.centerLeft,
                    child: Card(
                      child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Container(
                            width: double.infinity,
                            child: Text(
                              'คำอธิบาย ' + '${widget.itemDetail}',
                              style: GoogleFonts.kanit(),
                            ),
                          )),
                    ),
                  ),
                  SizedBox(height: 2),
                  Container(
                    width: double.infinity,
                    child: Card(
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          'วิธีใช้ ' + '${widget.itemHowToUse}',
                          style: GoogleFonts.kanit(),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
