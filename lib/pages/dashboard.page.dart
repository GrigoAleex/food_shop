import 'package:flutter/material.dart';
import 'package:food_shop/Modals/food_tab.modal.dart';
import 'package:food_shop/pages/product.page.dart';
import 'package:google_fonts/google_fonts.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

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
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Container(
              height: 40.0,
              width: 40.0,
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(.3),
                      blurRadius: 3.0,
                      spreadRadius: 1.0,
                      offset: const Offset(0.0, 3.0),
                    ),
                  ],
                  color: const Color(0xFFC6E7FE),
                  shape: BoxShape.circle,
                  image: const DecorationImage(
                    image: AssetImage('assets/images/tuxedo.png'),
                    fit: BoxFit.contain,
                  )),
            )
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: <Widget>[
            Text(
              "SEARCH FOR \nRECEPIES",
              style: GoogleFonts.notoSans(
                  fontWeight: FontWeight.w800, fontSize: 27.0),
            ),
            const SizedBox(height: 25.0),
            Container(
              padding: const EdgeInsets.only(left: 5.0),
              decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(.1),
                  borderRadius: BorderRadius.circular(10.0)),
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Search",
                  hintStyle: GoogleFonts.notoSans(fontSize: 14.0),
                  border: InputBorder.none,
                  fillColor: Colors.grey.withOpacity(.5),
                  prefixIcon: const Icon(Icons.search, color: Colors.grey),
                ),
              ),
            ),
            const SizedBox(height: 15.0),
            Text(
              "Recommended",
              style: GoogleFonts.notoSans(
                fontWeight: FontWeight.w500,
                fontSize: 18.0,
              ),
            ),
            SizedBox(
              height: 200.0,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  _buildListItem(
                    "Hamburger",
                    "assets/images/burger.png",
                    "21",
                    const Color(0xFFFFE9C6),
                    const Color(0xFFDA9551),
                  ),
                  _buildListItem(
                    "Fries",
                    "assets/images/fries.png",
                    "15",
                    const Color(0xFFC2E3FE),
                    const Color(0xFF6A8AAA),
                  ),
                  _buildListItem(
                    "Donuts",
                    "assets/images/donut.png",
                    "17",
                    const Color(0xFFD7FADA),
                    const Color(0xFF56CC7E),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10.0),
            TabBar(
              controller: _tabController,
              isScrollable: true,
              indicatorColor: Colors.transparent,
              labelColor: Colors.black,
              unselectedLabelColor: Colors.grey.withOpacity(.5),
              labelStyle: GoogleFonts.notoSans(
                fontSize: 16.0,
                fontWeight: FontWeight.w700,
              ),
              unselectedLabelStyle: GoogleFonts.notoSans(
                fontSize: 12.0,
                fontWeight: FontWeight.w500,
              ),
              tabs: const [
                Tab(child: Text("FEATURED")),
                Tab(child: Text("COMBO")),
                Tab(child: Text("FAVORITES")),
                Tab(child: Text("RECOMMENDED"))
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height - 450.0,
              child: TabBarView(
                controller: _tabController,
                children: const [
                  FoodTab(),
                  FoodTab(),
                  FoodTab(),
                  FoodTab(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildListItem(String _name, String _image, String _price,
      Color _background, Color _foreground) {
    return Padding(
      padding: const EdgeInsets.only(right: 16.0),
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => ProductPage(
              image: _image, 
              name: _name, 
              price: _price, 
              hero: _name,
              colorTheme: const Color(0xfffe7d6a),
            )
          ));
        },
        child: Container(
          height: 200.0,
          width: 150.0,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0), color: _background),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Hero(
                tag: _name,
                child: Container(
                  height: 75.0,
                  width: 75.0,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Image.asset(
                      _image,
                      height: 50.0,
                      width: 50.0,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 25.0),
              Text(
                "$_name\n\$$_price",
                style: GoogleFonts.notoSans(
                  fontSize: 14.0,
                  color: _foreground,
                ),
                textAlign: TextAlign.center,
              )
            ],
          ),
        ),
      ),
    );
  }
}
