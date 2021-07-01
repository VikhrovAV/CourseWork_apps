import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:fluttercommerce/models/product.dart';
import 'package:fluttercommerce/painters/circlepainters.dart';
import 'package:fluttercommerce/screens/products_list.dart';
import 'package:fluttercommerce/screens/search.dart';
import 'package:fluttercommerce/screens/shoppingcart.dart';
import 'package:fluttercommerce/screens/usersettings.dart';
import 'package:fluttercommerce/screens/whell.dart';
import 'package:fluttercommerce/utils/constant.dart';
import 'package:fluttercommerce/widgets/item_product.dart';
import 'package:fluttercommerce/utils/navigator.dart';
import 'package:page_transition/page_transition.dart';

import 'checkout.dart';
import 'products_list.dart';
import 'usersettings.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int currentIndex = 0;

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        backgroundColor: Colors.white,
        key: _scaffoldKey,
        drawer: Drawer(child: leftDrawerMenu()),
        appBar: buildAppBar(context),
        bottomNavigationBar: new TabBar(
          tabs: [
            Tab(
              icon: new Icon(Icons.home),
            ),
            Tab(
              icon: new Icon(Icons.circle_notifications),
            ),
            Tab(
              icon: new Icon(Icons.shopping_cart),
            ),
            Tab(
              icon: new Icon(Icons.account_circle),
            )
          ],
          labelColor: Theme
              .of(context)
              .primaryColor,
          unselectedLabelColor: Colors.blueGrey,
          indicatorSize: TabBarIndicatorSize.label,
          indicatorPadding: EdgeInsets.all(8.0),
          indicatorColor: Colors.red,
        ),
        body: TabBarView(
          children: [
            Container(
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    CategoriesListView(
                      title: "YOUR TITLES",
                      categories: [
                        'menu.png',
                        'tshirt.png',
                        'telephone.png',
                        'armchair.png',
                        'baby.png',
                        'lipstick.png',
                        'diamond.png',
                        'book.png'
                      ],
                      categoryTitle: [
                        'Все',
                        'Мат. платы',
                        'Процессоры',
                        'ОЗУ',
                        'Видеокарты',
                        'SSD',
                        'Блоки питания',
                        'Корпуса'
                      ],
                    ),
                    buildCarouselSlider(),
                    SizedBox(
                      height: 5.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            child: Text(
                              "Популярный товар",
                              style: TextStyle(
                                  fontSize: 19.0, fontWeight: FontWeight.bold),
                              textAlign: TextAlign.start,
                            ),
                          ),
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  PageTransition(
                                    type: PageTransitionType.fade,
                                    child: ProductList(),
                                  ),
                                );
                              },
                              child: Text(
                                "Смотреть все",
                                style: TextStyle(
                                    fontSize: 15.0, color: Colors.blue),
                                textAlign: TextAlign.end,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    buildTrending(),
                    Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            child: Text(
                              "Рекомендуем",
                              style: TextStyle(
                                  fontSize: 19.0, fontWeight: FontWeight.bold),
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
                                style: TextStyle(
                                    fontSize: 15.0, color: Colors.blue),
                                textAlign: TextAlign.end,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    buildTrending(),
                  ],
                ),
              ),
            ),
            WhellFortune(),
            ShoppingCart(false),
            UserSettings(),
          ],
        ),
      ),
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
              ),
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
              ),
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
              ),
            ],
          ),
        )
      ],
    );
  }

  CarouselSlider buildCarouselSlider() {
    return CarouselSlider(
      height: 150,
      viewportFraction: 0.9,
      aspectRatio: 16 / 9,
      autoPlay: true,
      enlargeCenterPage: true,
      items: imgList.map(
            (url) {
          return Stack(
            children: <Widget>[
              Container(
                margin: EdgeInsets.all(5.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                  child: Image.network(
                    url,
                    fit: BoxFit.cover,
                    width: 1000.0,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Text(
                        "Лучший магазин",
                        style: TextStyle(color: Colors.white, fontSize: 24),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text(
                            "Российский магазин,осуществляющий продажу компьютерной техники",
                            style:
                            TextStyle(color: Colors.white, fontSize: 14)),
                      ),
                    ],
                  ),
                ),
              )
            ],
          );
        },
      ).toList(),
    );
  }

  BottomNavyBar buildBottomNavyBar(BuildContext context) {
    return BottomNavyBar(
      selectedIndex: currentIndex,
      showElevation: true,
      onItemSelected: (index) =>
          setState(() {
            currentIndex = index;
          }),
      items: [
        BottomNavyBarItem(
          icon: Icon(Icons.home),
          title: Text('Главная страница'),
          activeColor: Theme
              .of(context)
              .primaryColor,
        ),
        BottomNavyBarItem(
            icon: Icon(Icons.apps),
            title: Text('Категории'),
            activeColor: Theme
                .of(context)
                .primaryColor),
        BottomNavyBarItem(
            icon: Icon(Icons.shopping_cart),
            title: Text('Корзина'),
            activeColor: Theme
                .of(context)
                .primaryColor),
        BottomNavyBarItem(
            icon: Icon(Icons.shopping_basket),
            title: Text('Заказы'),
            activeColor: Theme
                .of(context)
                .primaryColor),
      ],
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      title: Text(
        "Меню",
        style: TextStyle(color: Colors.black, fontSize: 16),
      ),
      leading: new IconButton(
          icon: new Icon(MaterialCommunityIcons.getIconData("menu"),
              color: Colors.black),
          onPressed: () => _scaffoldKey.currentState.openDrawer()),
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
                child: ShoppingCart(true),
              ),
            );
          },
        ),
      ],
      backgroundColor: Colors.white,
    );
  }

  leftDrawerMenu() {
    Color blackColor = Colors.black.withOpacity(0.6);
    return Container(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          Container(
            padding: EdgeInsets.symmetric(vertical: 16.0),
            height: 150,
            child: DrawerHeader(
              child: ListTile(
                trailing: Icon(
                  Icons.chevron_right,
                  size: 28,
                ),
                subtitle: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      PageTransition(
                        type: PageTransitionType.fade,
                        child: UserSettings(),
                      ),
                    );
                  },
                  child: Text(
                    "Смотреть профиль",
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: blackColor),
                  ),
                ),
                title: Text(
                  "Вихров Антон",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: blackColor),
                ),
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(
                      "http://t0.gstatic.com/licensed-image?q=tbn:ANd9GcRQnzeYa6mquVvWb8SKm8AEfeRTqW0AeUBZSIz2KOVAVwocKC1azIOmYMH1SjA6"),
                ),
              ),
              decoration: BoxDecoration(
                color: Color(0xFFF8FAFB),
              ),
            ),
          ),
          ListTile(
            leading: Icon(
              Feather.getIconData('home'),
              color: blackColor,
            ),
            title: Text(
              'Меню',
              style: TextStyle(
                  fontSize: 16, fontWeight: FontWeight.w600, color: blackColor),
            ),
            onTap: () {
              Navigator.push(
                context,
                PageTransition(
                  type: PageTransitionType.fade,
                  child: Home(),
                ),
              );
            },
          ),

          ListTile(
            leading: Icon(Feather.getIconData('search'), color: blackColor),
            title: Text('Поиск',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: blackColor)),
            onTap: () {
              Navigator.push(
                context,
                PageTransition(
                  type: PageTransitionType.fade,
                  child: Search(),
                ),
              );
            },
          ),
          ListTile(
            trailing: Icon(
              Ionicons.getIconData('ios-radio-button-on'),
              color: Color(0xFFFB7C7A),
              size: 18,
            ),
            leading: Icon(Feather.getIconData('bell'), color: blackColor),
            title: Text('Уведомления',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: blackColor)),
            onTap: () {
              Nav.route(context,Checkout());
            },
          ),
          ListTile(
            trailing: Icon(
              Icons.looks_two,
              color: Color(0xFFFB7C7A),
              size: 18,
            ),
            leading:
            Icon(Feather.getIconData('shopping-cart'), color: blackColor),
            title: Text('Корзина',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: blackColor)),
            onTap: () {
              Navigator.push(
                context,
                PageTransition(
                  type: PageTransitionType.fade,
                  child: ShoppingCart(true),
                ),
              );
            },
          ),
          ListTile(
            leading: Icon(Feather.getIconData('list'), color: blackColor),
            title: Text('Мои заказы',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: blackColor)),
            onTap: () {
              Nav.route(context, ProductList());
            },
          ),
          ListTile(
            leading: Icon(Feather.getIconData('award'), color: blackColor),
            title: Text('Достижения',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: blackColor)),
            onTap: () {
              Nav.route(context, Checkout());
            },
          ),
          ListTile(
            leading:
            Icon(Feather.getIconData('message-circle'), color: blackColor),
            title: Text('Поддержка',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: blackColor)),
            onTap: () {
              Nav.route(context, ProductList());
            },
          ),
          ListTile(
            leading:
            Icon(Feather.getIconData('help-circle'), color: blackColor),
            title: Text('Помощь',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: blackColor)),
            onTap: () {
              Nav.route(context, UserSettings());
            },
          ),
          ListTile(
            leading: Icon(Feather.getIconData('settings'), color: blackColor),
            title: Text('Настройки',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: blackColor)),
            onTap: () {
              Navigator.push(
                context,
                PageTransition(
                  type: PageTransitionType.fade,
                  child: UserSettings(),
                ),
              );
            },
          ),
          ListTile(
            leading: Icon(Feather.getIconData('x-circle'), color: blackColor),
            title: Text('Выход',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: blackColor)),
            onTap: () {
              SystemChannels.platform.invokeMethod('SystemNavigator.pop');
            },
          ),
        ],
      ),
    );
  }
}

class CategoriesListView extends StatelessWidget {
  final String title;
  final List<String> categories;
  final List<String> categoryTitle;

  const CategoriesListView({Key key,
    @required this.title,
    @required this.categories,
    @required this.categoryTitle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: LinePainter(),
      child: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 12),
            height: 90,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: categories.length,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      PageTransition(
                        type: PageTransitionType.fade,
                        child: ProductList(),
                      ),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Container(
                          width: 55,
                          height: 55,
                          padding: EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                            border: Border.all(
                              color: Colors.blueGrey,
                              width: 1,
                            ),
                          ),
                          child: Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                image: AssetImage(
                                  "assets/images/" + categories[index],
                                ),
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            categoryTitle[index],
                            style: TextStyle(
                              fontSize: 14,
                              fontFamily: 'Regular',
                              color: Colors.black,
                            ),
                          ),
                        )
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
