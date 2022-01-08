import 'package:flutter/material.dart';
import 'package:getwidget/components/rating/gf_rating.dart';
import 'package:google_fonts/google_fonts.dart';

class FoodTab extends StatefulWidget {
  const FoodTab({Key? key}) : super(key: key);

  @override
  _FoodTabState createState() => _FoodTabState();
}

class _FoodTabState extends State<FoodTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          _buildListItem("Delicious hot dog", 4.0, "6", "assets/images/hotdog.png"),
          _buildListItem("Mexican Taco", 3.0, "3", "assets/images/taco.png"),
          _buildListItem("Cheeze pizza", 5.0, "12", "assets/images/pizza.png"),
          _buildListItem("Mommy's sandwich", 5.0, "2", "assets/images/sandwich.png"),
        ],
      ),
    );
  }

  Widget _buildListItem(String _name, double _rating, String _price, String _image) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween, 
        children: [
          Row(
            children: [
              Container(
                height: 75.0,
                width: 75.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7.0),
                  color: const Color(0xFFFFE3DF),
                ),
                child: Center(
                  child: Image.asset(
                    _image,
                    height: 50.0,
                    width: 50.0,
                  ),
                ),
              ),
              const SizedBox(width: 20.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    _name,
                    style: GoogleFonts.notoSans(
                      fontSize: 14.0,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  GFRating(
                    allowHalfRating: false,
                    value: _rating,
                    size: 15.0,
                    color: Colors.yellow.shade700,
                    borderColor: Colors.transparent,
                    onChanged: (value) {},
                  ),
                  Row(children: <Widget>[
                    Text(
                      "\$$_price",
                      style: GoogleFonts.lato(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w600,
                        textStyle: const TextStyle(
                          color: Color(0xfff6bd7f)
                        )
                      ),
                    ),
                    const SizedBox(width: 3.0),
                    Text(
                      "\$18",
                      style: GoogleFonts.lato(
                        fontSize: 12.0,
                        decoration: TextDecoration.lineThrough,
                        fontWeight: FontWeight.w600,
                        textStyle: TextStyle(
                          color: Colors.grey.withOpacity(.4),  
                        ),
                      ),
                    ),
                  ]),
                ],
              ),
            ],
          ),
          FloatingActionButton(
            heroTag: _name,
            onPressed: null,
            mini: true,
            child: const Center(
              child: Icon(
                Icons.add, 
                color: Colors.white,
              ),
            ),
            backgroundColor: const Color(0xfffe7d6a),
          )
        ],
      ),
    );
  }
}
