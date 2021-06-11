import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    var _imageFile;
    return Scaffold(
      backgroundColor: Colors.blue,
      drawer: Drawer(

        child: Column(
          children: [GestureDetector(
                      child: Row(children: [
               Icon(Icons.exit_to_app)
               ,
              Text("LogOut")

            ],),
          )],
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            Colors.white38.withOpacity(0.2),
            Colors.white30.withOpacity(0.6)
          ], begin: Alignment.bottomCenter, end: Alignment.topCenter),
          //     image: DecorationImage(
          //   image: _imageFile == null
          //       ? AssetImage('lib/Images/Customer2.png')
          //       : FileImage(_imageFile),
          //   fit: BoxFit.cover,
          // )
        ),
        height: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(width: 20),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 250,
                      height: 40,
                      decoration: BoxDecoration(
                        color: Colors.white54,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: TextField(
                        onChanged: (value) {},
                        decoration: InputDecoration(
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          hintText: "Search Here",
                          prefixIcon: Icon(Icons.search),
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 7,
                          ),
                        ),
                      ),
                    ),
                    IconBillWithCounter(
                      photo: 'lib/Images/add-to-cart.png',
                      press: () => print("Add To Cart Button"),
                    ),
                    IconBillWithCounter(
                      photo: 'lib/Images/bell.png',
                      numOfItems: 3,
                      press: () => print("Notification Button"),
                    ),
                  ],
                ),
              ),
              // Container(
              //     margin: EdgeInsets.symmetric(
              //       horizontal: 20,
              //     ),
              //     width: double.infinity,
              //     height: 110,
              //     decoration: BoxDecoration(
              //         borderRadius: BorderRadius.circular(20),
              //         image: DecorationImage(
              //           image: _imageFile == null
              //               ? AssetImage('lib/Images/hot_deals.png')
              //               : FileImage(_imageFile),
              //           fit: BoxFit.fill,
              //         ))),
              // SizedBox(
              //   height: 30,
              // ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Special for you",
                      style: TextStyle(fontSize: 18, color: Colors.black),
                    ),
                    GestureDetector(
                        onTap: () {
                          print("See More Special");
                        },
                        child: Text("See More")),
                  ],
                ),
              ),
              SizedBox(
                height: 15,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    SpecialOfferCard(
                      image:
                          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRd2gjgc_Sr8CjjBbHmyHAU8HrDcfVrqC_XdQ&usqp=CAU",
                      category: "Smart Phones",
                      numOfBrand: 18,
                      press: () {},
                    ),
                    SpecialOfferCard(
                      image:
                          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRgHSpexdLQk8aa_j_UDj-X4xrQyY1PcfB4-UY8qAZKxBIttUHKt4LrfFfhdfs5zz2n0lM&usqp=CAU",
                      category: "Cars",
                      numOfBrand: 22,
                      press: () {},
                    ),
                    SpecialOfferCard(
                      image:
                          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS_LvdysRH4dGM_xIUuxmQhGcz5c84O0FR7jg&usqp=CAU",
                      category: "Clothes",
                      numOfBrand: 10,
                      press: () {},
                    ),
                    SizedBox(
                      width: 20,
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Popular",
                      style: TextStyle(fontSize: 18, color: Colors.black),
                    ),
                    GestureDetector(
                        onTap: () {
                          print("See More Popular");
                        },
                        child: Text("See More")),
                  ],
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Popular(
                      imageFile: _imageFile,
                      image: Image.asset(
                        'lib/Images/car-oil.png',
                        fit: BoxFit.contain,
                      ),
                      title: "Total Oil",
                      price: "  10\$",
                    ),
                    Popular(
                      imageFile: _imageFile,
                      image: Image.asset(
                        'lib/Images/mobile cover.jpg',
                        fit: BoxFit.contain,
                      ),
                      title: "Mobile Cover",
                      price: "  8\$",
                    ),
                    Popular(
                      imageFile: _imageFile,
                      image: Image.asset(
                        'lib/Images/apartment.jpg',
                        fit: BoxFit.fill,
                      ),
                      title: "Apartment For Sale",
                      price: "  1000\$",
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class Popular extends StatelessWidget {
  const Popular({
    Key key,
    @required imageFile,
    this.width = 140,
    this.aspectRatio = 1.02,
    this.product,
    this.image,
    this.title,
    this.price,
  })  : _imageFile = imageFile,
        super(key: key);

  final _imageFile;
  final double width, aspectRatio;
  final product;
  final image;
  final String title;
  final String price;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: SizedBox(
          width: width,
          child: Column(
            children: [
              AspectRatio(
                aspectRatio: aspectRatio,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white54.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(20),

                    // image: DecorationImage(
                    //   image:
                    //   _imageFile == null
                    //       ? AssetImage('lib/Images/car-oil.png')
                    //       : FileImage(_imageFile),
                    //   fit: BoxFit.cover,
                    // )
                  ),
                  child: image,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "$title",
                style: TextStyle(fontSize: 16, color: Colors.black),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "$price",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Colors.deepOrange,
                    ),
                  ),
                  InkWell(
                    borderRadius: BorderRadius.circular(10),
                    onTap: () {
                      print("Love Button");
                    },
                    child: Container(
                      width: 20,
                      height: 20,
                      decoration: BoxDecoration(
                        color: Colors.white38.withOpacity(0.1),
                        shape: BoxShape.circle,
                      ),
                      child: Image.network(
                          "https://cdn0.iconfinder.com/data/icons/housing-interface-1/16/Heart-512.png"),
                    ),
                  )
                ],
              )
            ],
          )),
    );
  }
}

class SpecialOfferCard extends StatelessWidget {
  const SpecialOfferCard({
    Key key,
    @required this.category,
    @required this.image,
    @required this.numOfBrand,
    @required this.press,
  }) : super(key: key);

  final String category;
  final image;
  final int numOfBrand;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: SizedBox(
        width: 200,
        height: 100,
        child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Stack(children: [
              Image.network(image),
              Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                      Color(0xFF343434).withOpacity(0.4),
                      Color(0xFF343434).withOpacity(0.15)
                    ])),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 15,
                  vertical: 10,
                ),
                child: Text.rich(TextSpan(
                  style: TextStyle(color: Colors.white),
                  children: [
                    TextSpan(
                      text: "$category\n",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'opensans',
                      ),
                    ),
                    TextSpan(
                      text: "$numOfBrand Brands",
                      style: TextStyle(
                        fontSize: 12,
                        fontFamily: 'opensans',
                      ),
                    ),
                  ],
                )),
              )
            ])),
      ),
    );
  }
}

class IconBillWithCounter extends StatelessWidget {
  IconBillWithCounter({
    Key key,
    @required this.photo,
    this.numOfItems = 0,
    @required this.press,
  }) : super(key: key);

  var _imageFile;
  final String photo;
  final int numOfItems;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: press,
      borderRadius: BorderRadius.circular(50),
      child: Stack(
        overflow: Overflow.visible,
        children: [
          Container(
            padding: EdgeInsets.all(12),
            height: 46,
            width: 46,
            decoration: BoxDecoration(
                color: Colors.white54,
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: _imageFile == null
                      ? AssetImage(photo)
                      : FileImage(_imageFile),
                  fit: BoxFit.cover,
                )),
          ),
          if (numOfItems != 0)
            Positioned(
              top: -3,
              right: 0,
              child: Container(
                height: 16,
                width: 16,
                decoration: BoxDecoration(
                  color: Colors.red,
                  shape: BoxShape.circle,
                  border: Border.all(width: 1.5, color: Colors.white),
                ),
                child: Center(
                  child: Text(
                    "$numOfItems",
                    style: TextStyle(
                      fontSize: 10,
                      height: 1,
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            )
        ],
      ),
    );
  }
}
