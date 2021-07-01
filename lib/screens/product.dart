import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:fluttercommerce/models/product.dart';
import 'package:fluttercommerce/screens/search.dart';
import 'package:fluttercommerce/screens/shoppingcart.dart';
import 'package:fluttercommerce/screens/usersettings.dart';
import 'package:fluttercommerce/utils/colors.dart';
import 'package:fluttercommerce/widgets/dotted_slider.dart';
import 'package:fluttercommerce/widgets/item_product.dart';
import 'package:fluttercommerce/widgets/star_rating.dart';
import 'package:page_transition/page_transition.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class ProductPage extends StatefulWidget {
  final Product product;

  ProductPage({this.product});

  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  bool isClicked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        color: Theme.of(context).backgroundColor,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height / 11,
        child: Container(
          padding: EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            border: Border.all(width: 0.5, color: Colors.black12),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Row(
                children: <Widget>[
                  SizedBox(
                    child: Divider(
                      color: Colors.black26,
                      height: 4,
                    ),
                    height: 24,
                  ),
                  Text(
                    "15 990Р",
                    style: TextStyle(
                        color: Colors.black54,
                        fontSize: 18,
                        decoration: TextDecoration.lineThrough),
                  ),
                  SizedBox(
                    width: 6,
                  ),
                  Text(
                    "10 990Р",
                    style: TextStyle(
                        color: Colors.red,
                        fontSize: 20,
                        fontWeight: FontWeight.w700),
                  )
                ],
              ),
              SizedBox(
                width: 6,
              ),
              RaisedButton(
                onPressed: () {
                  _alert(context);
                  setState(() {
                    isClicked = !isClicked;
                  });
                },
                textColor: Colors.white,
                padding: const EdgeInsets.all(0.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Container(
                  width: MediaQuery.of(context).size.width / 2.9,
                  height: 60,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: <Color>[
                        CustomColors.GreenLight,
                        CustomColors.GreenDark,
                      ],
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(8.0),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: CustomColors.GreenShadow,
                        blurRadius: 15.0,
                        spreadRadius: 7.0,
                        offset: Offset(0.0, 0.0),
                      )
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Icon(
                        MaterialCommunityIcons.getIconData(
                          "cart-outline",
                        ),
                        color: Colors.white,
                      ),
                      new Text(
                        "В корзину",
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              actions: <Widget>[
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      PageTransition(
                        type: PageTransitionType.fade,
                        child: Search(),
                      ),
                    );
                  },
                  child: Icon(
                    MaterialCommunityIcons.getIconData("magnify"),
                    color: Colors.black,
                  ),
                ),
                Stack(
                  children: <Widget>[
                    IconButton(
                      icon: Icon(
                        MaterialCommunityIcons.getIconData("cart-outline"),
                      ),
                      color: Colors.black,
                      onPressed: () {
                        Navigator.push(
                          context,
                          PageTransition(
                            type: PageTransitionType.fade,
                            child: UserSettings(),
                          ),
                        );
                      },
                    ),
                    isClicked
                        ? Positioned(
                            left: 9,
                            bottom: 13,
                            child: Icon(
                              Icons.looks_one,
                              size: 14,
                              color: Colors.red,
                            ),
                          )
                        : Text(""),
                  ],
                ),
              ],
              iconTheme: IconThemeData(
                color: Colors.black, //change your color here
              ),
              backgroundColor: Colors.white,
              expandedHeight: MediaQuery.of(context).size.height / 2.4,
              floating: false,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                centerTitle: true,
                title: Text(
                  this.widget.product.name,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16.0,
                  ),
                ),
                background: Padding(
                  padding: EdgeInsets.only(top: 48.0),
                  child: dottedSlider(),
                ),
              ),
            ),
          ];
        },
        body: Container(
          height: MediaQuery.of(context).size.height,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                _buildInfo(context), //Product Info
                _buildExtra(context),
                _buildDescription(context),
                _buildComments(context),
                _buildProducts(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  showAlertDialog(BuildContext context) {
    // set up the button
    Widget okButton = FlatButton(
      child: Text("OK"),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Корзина"),
      content: Text("Продукт добавлен в корзину"),
      actions: [
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  _alert(BuildContext context) {
    var alertStyle = AlertStyle(
      animationType: AnimationType.shrink,
      isCloseButton: false,
      isOverlayTapDismiss: false,
      descStyle: TextStyle(fontWeight: FontWeight.bold),
      animationDuration: Duration(milliseconds: 400),
      alertBorder: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
        side: BorderSide(
          color: Colors.grey,
        ),
      ),
      titleStyle: TextStyle(
        color: Color.fromRGBO(0, 179, 134, 1.0),
      ),
    );
    Alert(
      context: context,
      style: alertStyle,
      type: AlertType.success,
      title: "Успешно",
      desc: "Товар добавлен в корзину",
      buttons: [
        DialogButton(
          child: Text(
            "Назад",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: () => Navigator.pop(context),
          color: Color.fromRGBO(0, 179, 134, 1.0),
        ),
        DialogButton(
          child: Text(
            "В корзину",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: () => Navigator.push(
            context,
            PageTransition(
              type: PageTransitionType.fade,
              child: ShoppingCart(true),
            ),
          ),
          gradient: LinearGradient(colors: [
            Color.fromRGBO(116, 116, 191, 1.0),
            Color.fromRGBO(52, 138, 199, 1.0)
          ]),
        )
      ],
    ).show();
  }

  _productSlideImage(String imageUrl) {
    return Container(
      height: 200,
      width: double.infinity,
      decoration: BoxDecoration(
        image:
            DecorationImage(image: AssetImage(imageUrl), fit: BoxFit.contain),
      ),
    );
  }

  dottedSlider() {
    return DottedSlider(
      maxHeight: 200,
      children: <Widget>[
        _productSlideImage(widget.product.icon),
        _productSlideImage(widget.product.icon),
        _productSlideImage(widget.product.icon),
        _productSlideImage(widget.product.icon),
      ],
    );
  }

  _buildInfo(context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Container(width: 130, child: Text("Гнездо процессора")),
                SizedBox(
                  width: 48,
                ),
                Text("AM4"),
              ],
            ),
            SizedBox(
              height: 8,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Container(width: 130, child: Text("Слотов памяти")),
                SizedBox(
                  width: 48,
                ),
                Text("4"),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 12.0),
              child: Text(
                "Все параметры >",
                style: TextStyle(color: Colors.black45),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _buildExtra(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border(
        top: BorderSide(width: 1.0, color: Colors.black12),
        bottom: BorderSide(width: 1.0, color: Colors.black12),
      )),
      padding: EdgeInsets.all(4.0),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height / 4,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text("Сокет"),
            Row(
              children: <Widget>[
                // OutlineButton(
                //   shape: new RoundedRectangleBorder(
                //       borderRadius: new BorderRadius.circular(8.0)),
                //   child: Text('64 GB'),
                //   onPressed: () {}, //callback when button is clicked
                //   borderSide: BorderSide(
                //     color: Colors.grey, //Color of the border
                //     style: BorderStyle.solid, //Style of the border
                //     width: 0.8, //width of the border
                //   ),
                // ),
                // SizedBox(
                //   width: 8,
                // ),
                OutlineButton(
                  shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(8.0)),
                  child: Text('AM4'),
                  onPressed: () {}, //callback when button is clicked
                  borderSide: BorderSide(
                    color: Colors.red, //Color of the border
                    style: BorderStyle.solid, //Style of the border
                    width: 1, //width of the border
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 8,
            ),
            Text("Максимальный объем ОЗУ"),
            Row(
              children: <Widget>[
                OutlineButton(
                  shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(8.0)),
                  child: Text('128GB'),
                  onPressed: () {}, //callback when button is clicked
                  borderSide: BorderSide(
                    color: Colors.orangeAccent, //Color of the border
                    style: BorderStyle.solid, //Style of the border
                    width: 1.5, //width of the border
                  ),
                ),
                SizedBox(
                  width: 8,
                ),
                // OutlineButton(
                //   shape: new RoundedRectangleBorder(
                //       borderRadius: new BorderRadius.circular(8.0)),
                //   child: Text('SILVER'),
                //   onPressed: () {}, //callback when button is clicked
                //   borderSide: BorderSide(
                //     color: Colors.grey, //Color of the border
                //     style: BorderStyle.solid, //Style of the border
                //     width: 0.8, //width of the border
                //   ),
                // ),
                // SizedBox(
                //   width: 8,
                // ),
                // OutlineButton(
                //   shape: new RoundedRectangleBorder(
                //       borderRadius: new BorderRadius.circular(8.0)),
                //   child: Text('PINK'),
                //   onPressed: () {}, //callback when button is clicked
                //   borderSide: BorderSide(
                //     color: Colors.grey, //Color of the border
                //     style: BorderStyle.solid, //Style of the border
                //     width: 0.8, //width of the border
                //   ),
                // ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  _buildDescription(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height / 3.8,
      child: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text(
              "Описание",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black45,
                fontSize: 18,
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Text(
                "ASUS ROG STRIX B450-F GAMING II поддерживает максимальный объем оперативной памяти в 128 Гб. Предусмотрены разъемы M2, SATA 3 и 4 слота под память DDR4."),
            SizedBox(
              height: 8,
            ),
            Center(
              child: GestureDetector(
                onTap: () {
                  _settingModalBottomSheet(context);
                },
                child: Text(
                  "Читать целиком",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.blueGrey,
                      fontSize: 16),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  _buildComments(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(width: 1.0, color: Colors.black12),
          bottom: BorderSide(width: 1.0, color: Colors.black12),
        ),
      ),
      width: MediaQuery.of(context).size.width,
      child: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "Коментарии",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.black54),
                ),
                Text(
                  "Смотреть все",
                  style: TextStyle(fontSize: 18.0, color: Colors.blue),
                  textAlign: TextAlign.end,
                ),
              ],
            ),
            SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                StarRating(rating: 4, size: 20),
                SizedBox(
                  width: 8,
                ),
                Text(
                  "110 коментариев",
                  style: TextStyle(color: Colors.black54),
                )
              ],
            ),
            SizedBox(
              child: Divider(
                color: Colors.black26,
                height: 4,
              ),
              height: 24,
            ),
            ListTile(
              leading: CircleAvatar(
                backgroundImage: NetworkImage(
                    "https://miro.medium.com/fit/c/256/256/1*mZ3xXbns5BiBFxrdEwloKg.jpeg"),
              ),
              subtitle: Text(
                  "Отличный товар"),
              title: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  StarRating(rating: 4, size: 15),
                  SizedBox(
                    width: 8,
                  ),
                  Text(
                    "24 Апр 2021",
                    style: TextStyle(fontSize: 12, color: Colors.black54),
                  ),
                ],
              ),
            ),
            SizedBox(
              child: Divider(
                color: Colors.black26,
                height: 4,
              ),
              height: 24,
            ),
            ListTile(
              leading: CircleAvatar(
                backgroundImage: NetworkImage(
                    "https://visatimes.ru/wp-content/uploads/2018/12/fotografii-na-pasport.jpg"),
              ),
              subtitle: Text(
                  "Лучшее что я брал за последнее время"),
              title: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  StarRating(rating: 4, size: 15),
                  SizedBox(
                    width: 8,
                  ),
                  Text(
                    "20 Мая 2021",
                    style: TextStyle(fontSize: 12, color: Colors.black54),
                  ),
                ],
              ),
            ),
            SizedBox(
              child: Divider(
                color: Colors.black26,
                height: 4,
              ),
              height: 24,
            ),
            ListTile(
              leading: CircleAvatar(
                backgroundImage: NetworkImage(
                    "https://visatimes.ru/wp-content/uploads/2018/12/foto-na-pasport-rf.jpg"),
              ),
              subtitle: Text(
                  "Замечательный товар. Я в восторге!"),
              title: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  StarRating(rating: 4, size: 15),
                  SizedBox(
                    width: 8,
                  ),
                  Text(
                    "6 Мар 2021",
                    style: TextStyle(fontSize: 12, color: Colors.black54),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  _buildProducts(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(6.0),
          child: Row(
            children: <Widget>[
              Expanded(
                child: Text(
                  "Похожий товар",
                  style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.w600,
                      color: Colors.black54),
                  textAlign: TextAlign.start,
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    print("Clicked");
                  },
                  child: Text(
                    "Смотреть все",
                    style: TextStyle(fontSize: 18.0, color: Colors.blue),
                    textAlign: TextAlign.end,
                  ),
                ),
              ),
            ],
          ),
        ),
        buildTrending()
      ],
    );
  }

  Column buildTrending() {
    return Column(
      children: <Widget>[
        Container(
          height: 180,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: <Widget>[
              TrendingItem(
                product: Product(
                    company: 'ASUS',
                    name: 'ROG STRIX B450-F',
                    icon: 'assets/phone1.jpeg',
                    rating: 4,
                    remainingQuantity: 5,
                    price: '10 990'),
                gradientColors: [Color(0XFFa466ec), Colors.purple[400]],
              ),
              TrendingItem(
                product: Product(
                    company: 'GIGABYTE',
                    name: 'GeForce GTX 1660',
                    icon: 'assets/phone2.jpeg',
                    rating: 4.5,
                    remainingQuantity: 5,
                    price: '40 240'),
                gradientColors: [Color(0XFF6eed8c), Colors.green[400]],
              ),
              TrendingItem(
                product: Product(
                    company: 'KINGSTON',
                    name: 'HyperX FURY',
                    icon: 'assets/mi1.png',
                    rating: 3,
                    price: '7 990'),
                gradientColors: [Color(0XFFf28767), Colors.orange[400]],
              ),TrendingItem(
                product: Product(
                    company: 'ASUS',
                    name: 'ROG STRIX B450-F',
                    icon: 'assets/phone1.jpeg',
                    rating: 4,
                    remainingQuantity: 5,
                    price: '10 990'),
                gradientColors: [Color(0XFFa466ec), Colors.purple[400]],
              ),
              TrendingItem(
                product: Product(
                    company: 'GIGABYTE',
                    name: 'GeForce GTX 1660',
                    icon: 'assets/phone2.jpeg',
                    rating: 4.5,
                    remainingQuantity: 5,
                    price: '40 240'),
                gradientColors: [Color(0XFF6eed8c), Colors.green[400]],
              ),
              TrendingItem(
                product: Product(
                    company: 'KINGSTON',
                    name: 'HyperX FURY',
                    icon: 'assets/mi1.png',
                    rating: 3,
                    price: '7 990'),
                gradientColors: [Color(0XFFf28767), Colors.orange[400]],
              ),TrendingItem(
                product: Product(
                    company: 'ASUS',
                    name: 'ROG STRIX B450-F',
                    icon: 'assets/phone1.jpeg',
                    rating: 4,
                    remainingQuantity: 5,
                    price: '10 990'),
                gradientColors: [Color(0XFFa466ec), Colors.purple[400]],
              ),
              TrendingItem(
                product: Product(
                    company: 'GIGABYTE',
                    name: 'GeForce GTX 1660',
                    icon: 'assets/phone2.jpeg',
                    rating: 4.5,
                    remainingQuantity: 5,
                    price: '40 240'),
                gradientColors: [Color(0XFF6eed8c), Colors.green[400]],
              ),
              TrendingItem(
                product: Product(
                    company: 'KINGSTON',
                    name: 'HyperX FURY',
                    icon: 'assets/mi1.png',
                    rating: 3,
                    price: '7 990'),
                gradientColors: [Color(0XFFf28767), Colors.orange[400]],
              ),
            ],
          ),
        )
      ],
    );
  }
}

void _settingModalBottomSheet(context) {
  showModalBottomSheet(
      context: context,
      builder: (BuildContext bc) {
        return Container(
          width: MediaQuery.of(context).size.width,
          child: Container(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Text(
                  "Описание",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black45,
                    fontSize: 18,
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                    "ASUS ROG STRIX B450-F GAMING II поддерживает максимальный объем оперативной памяти в 128 Гб. Предусмотрены разъемы M2, SATA 3 и 4 слота под память DDR4. Приятным бонусом к покупке материнской платы ASUS ROG STRIX B450-F GAMING II станет гарантия от производителя на 36 месяцев. Представленная материнская плата поддерживает технологию Cross Fire Х, что предусматривает возможность использовать одновременно до 3 видеокарт: так удастся получить рост производительности в играх. В данную плату встроены светодиоды, которые выступают в роли подсветки, они будут кстати при наличии прозрачной боковой стенки в корпусе."),
                SizedBox(
                  height: 8,
                ),
              ],
            ),
          ),
        );
      });
}
