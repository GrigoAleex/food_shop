// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductPage extends StatefulWidget {
  final String image, name, price, hero;
  final Color colorTheme;

  const ProductPage(
      {Key? key,
      required this.image,
      required this.name,
      required this.price,
      required this.hero,
      required this.colorTheme})
      : super(key: key);

  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  int _quantity = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white60,
        elevation: 0.0,
        leading: const Icon(
          Icons.menu,
          color: Colors.black,
        ),
        title: AppBarTitle(),
      ),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "SUPER\n" + widget.name.toUpperCase(),
                  style: GoogleFonts.notoSans(
                    fontWeight: FontWeight.w800,
                    fontSize: 27.0,
                  ),
                ),
                const SizedBox(height: 40.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Hero(
                      tag: widget.hero,
                      child: Container(
                        height: 200.0,
                        width: 200.0,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                          image: AssetImage(widget.image),
                          fit: BoxFit.cover,
                        )),
                      ),
                    ),
                    const SizedBox(width: 15.0),
                    Column(
                      children: <Widget>[
                        InteractiveButton(
                          icon: Icons.favorite_border,
                          colorTheme: widget.colorTheme,
                        ),
                        SizedBox(height: 55.0),
                        InteractiveButton(
                          icon: Icons.restore,
                          colorTheme: widget.colorTheme,
                        ),
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 10.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                height: 70.0,
                width: 125.0,
                color: Colors.white,
                child: Center(
                  child: Text(
                    "\$" + (int.parse(widget.price) * _quantity).toString(),
                    style: GoogleFonts.notoSans(
                      fontSize: 40.0,
                      color: widget.colorTheme,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              Container(
                height: 60.0,
                width: 225.0,
                decoration: BoxDecoration(
                  color: widget.colorTheme,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10.0),
                    bottomLeft: Radius.circular(10.0),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: Colors.white,
                        ),
                        child: Row(
                          children: <Widget>[
                            IconButton(
                              onPressed: () {
                                setQuantity(-1);
                              },
                              icon: Icon(
                                Icons.remove,
                                color: widget.colorTheme,
                              ),
                            ),
                            Text(
                              _quantity.toString(),
                              style: GoogleFonts.notoSans(
                                fontSize: 14.0,
                                color: widget.colorTheme,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                setQuantity(1);
                              },
                              icon: Icon(
                                Icons.add,
                                color: widget.colorTheme,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Text(
                      "Add to cart",
                      style: GoogleFonts.notoSans(
                        fontSize: 15.0,
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 8.0, left: 16.0, top: 16.0),
            child: Text(
              "FEATURED",
              style: GoogleFonts.notoSans(
                fontSize: 16.0,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * .75,
            height: 175.0,
            child: ListView(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              children: [
                GridView.count(
                  childAspectRatio: 1 / 3,
                  scrollDirection: Axis.horizontal,
                  crossAxisCount: 2,
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  children: const <Widget>[
                    FeaturedProduct(
                      name: "Sweet Cheese", 
                      price: "11", 
                      image: "assets/images/cheese.png", 
                      backgorund: Color(0xffc2e3fe),
                    ),
                    FeaturedProduct(
                      name: "Sweet popcorn", 
                      price: "20", 
                      image: "assets/images/popcorn.png", 
                      backgorund: Color(0xffc2e3fe),
                    ),
                    FeaturedProduct(
                      name: "Angry donut", 
                      price: "5", 
                      image: "assets/images/donut.png", 
                      backgorund: Color(0xffc2e3fe),
                    ),
                    FeaturedProduct(
                      name: "Mommy's Sandwich", 
                      price: "1", 
                      image: "assets/images/sandwich.png", 
                      backgorund: Color(0xffc2e3fe),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  setQuantity(int value) {
    setState(() {
      _quantity += value;
    });
  }
}

class FeaturedProduct extends StatelessWidget {
  const FeaturedProduct({
    Key? key,
    required this.name,
    required this.price,
    required this.image, 
    required this.backgorund,
  }) : super(key: key);

  final String name;
  final String price;
  final String image;
  final Color backgorund;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Container(
          height: 75.0,
          width: 75.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            color: backgorund,
          ),
          child: Center(
            child: Image.asset(
              image,
              height: 50.0,
              width: 50.0,
            ),
          ),
        ),
        SizedBox(width: 20.0),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              name,
              style: GoogleFonts.notoSans(
                fontSize: 14.0,
                fontWeight: FontWeight.w400,
              ),
            ),
            Text(
              "\$$price",
              style: GoogleFonts.lato(
                fontSize: 16.0,
                fontWeight: FontWeight.w600,
                textStyle: TextStyle(
                  color: Color(0xfffe7d6a),
                ),
              ),
            )
          ],
        ),
      ],
    );
  }
}

class InteractiveButton extends StatelessWidget {
  const InteractiveButton({
    Key? key,
    required IconData icon,
    required Color colorTheme,
  })  : _icon = icon,
        _color = colorTheme,
        super(key: key);

  final IconData _icon;
  final Color _color;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.0,
      width: 50.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.0),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: _color.withOpacity(.15),
            blurRadius: 12.0,
            spreadRadius: 8.0,
            offset: const Offset(0.0, 0.0),
          ),
        ],
      ),
      child: Center(
        child: Icon(
          _icon,
          color: _color,
          size: 25.0,
        ),
      ),
    );
  }
}

class AppBarTitle extends StatelessWidget {
  const AppBarTitle({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        Stack(
          alignment: AlignmentDirectional.center,
          children: [
            Container(
              height: 40.0,
              width: 40.0,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xfffe7d6a).withOpacity(.3),
                    blurRadius: 5.0,
                    spreadRadius: 2.0,
                    offset: const Offset(0.0, 4.0),
                  ),
                ],
                color: const Color(0xfffe7d6a),
                shape: BoxShape.circle,
              ),
              child: const Center(
                child: Icon(
                  Icons.shopping_cart,
                  color: Colors.white,
                ),
              ),
            ),
            Positioned(
              top: 1.0,
              right: 4.0,
              child: Container(
                height: 12.0,
                width: 12.0,
                decoration: const BoxDecoration(
                    color: Colors.white, shape: BoxShape.circle),
                child: Center(
                  child: Text(
                    '1',
                    style: GoogleFonts.notoSans(
                      fontSize: 7.0,
                      textStyle: const TextStyle(
                        color: Colors.red,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}
