import 'package:flutter/material.dart';

// ignore: must_be_immutable
class SinglePropertyHorizental extends StatefulWidget {
  var isFavorite;
  final String? image;
  final String? name;
  final String? address;
  final dynamic price;
  final dynamic rating;

  SinglePropertyHorizental(
      {super.key,
    this.image,
    this.name,
    this.address,
    this.price,
    this.rating,
    required this.isFavorite,
  });

  @override
  State<SinglePropertyHorizental> createState() => _SinglePropertyHorizentalState();
}

class _SinglePropertyHorizentalState extends State<SinglePropertyHorizental> {
  late bool _selected;

  @override
  void initState() {
    super.initState();
    setState(() {
      _selected = widget.isFavorite;
    });
  }
  @override
  Widget build(BuildContext context) {
    return  secondRealEstateTopDetailsState(
        widget.image,
        widget.name,
        widget.address,
        widget.price,
        widget.rating);
  }

  secondRealEstateTopDetailsState(
      String? image,
      String? name,
      String? address,
      dynamic price,
      dynamic rating) {
    return InkWell(
      onTap: (){
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(builder: (context) => propertyDetailsPage(
        //     image: widget.image,
        //     price: widget.price,
        //     address: widget.address,
        //     name: widget.name,
        //     rating: widget.rating,
        //     isFavorite: widget.isFavorite,
        //   )),
        // );
      },
      child: Container(
        width: 268,
        height: 156,
        decoration: ShapeDecoration(
          color: const Color(0xFFF5F4F7),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        child: Row(
          children: [
            SizedBox(
              width: 140,
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const SizedBox(height: 8,),
                    Padding(
                      padding: const EdgeInsets.only(right: 5),
                      child: Text(
                        name.toString(),
                        maxLines: 1, // Set the maximum number of lines
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          color: Colors.black,
                          fontFamily: 'Raleway',
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 0.36,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10,),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            "$rating  ",
                            style: const TextStyle(
                              color: Color(0xFF53577A),
                              fontSize: 8,
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.w700,
                              height: 0.12,
                            ),
                          ),
                          const Icon(Icons.star, color: Colors.orange, size: 10,)
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            "$address ",
                            maxLines: 1, // Set the maximum number of lines
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              color: Color(0xFF53577A),
                              fontSize: 8,
                              fontFamily: 'Raleway',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          const Icon(Icons.location_on_sharp,color: Colors.grey, size: 10,)
                        ],
                      ),
                    ),
                    const Expanded(child: SizedBox(height: 10,)),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Row(
                        children: [
                          const Expanded(
                            child: Text('شهر /',
                              maxLines: 1, // Set the maximum number of lines
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                color: Color(0xFF242B5C),
                                fontSize: 16,
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.w600,
                                letterSpacing: 0.48,
                              ),),
                          ),
                          const Text(
                            'الف',
                            style: TextStyle(
                              color: Color(0xFF242B5C),
                              fontSize: 16,
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.w600,
                              height: 0,
                              letterSpacing: 0.48,
                            ),
                          ),
                          const SizedBox(width: 5,),
                          Text(
                            price.toString(),
                            style: const TextStyle(
                              color: Color(0xFF242B5C),
                              fontSize: 16,
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.w600,
                              height: 0,
                              letterSpacing: 0.48,
                            ),
                          ),

                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            imageSection(image.toString())
          ],
        ),
      ),
    );
  }

  imageSection(String image) {
    return Container(
        width: 126,
        decoration: ShapeDecoration(
          image: DecorationImage(
            image: AssetImage(image),
            fit: BoxFit.cover,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        child: Stack(
          children: [

            Positioned(
                top: 8,
                right: 8,
                child: Container(
                  width: 24.81,
                  height: 25,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: const Color(0xFF234F68),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 5,
                      ),
                    ],
                  ),
                  child: Center(
                    child: IconButton(
                      icon: const Icon(Icons.favorite, size: 11,),
                      color: _selected? Colors.white: Colors.red,
                      onPressed: () {
                        setState(() {
                          _selected ? _selected=false : _selected=true;
                        });

                        // Add your button onPressed logic here
                        // print('Button tapped!');
                      },
                    ),
                  ),
                )
            ),

            Positioned(
                bottom: 3,
                right: 5,
                child: ElevatedButton(
                  onPressed: () {
                    // Add your button onPressed logic here
                    // print('Button tapped!');
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.all(0), backgroundColor: const Color(0xFF234F68),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const SizedBox(
                    width: 41,
                    height: 27,
                    child: Center(
                      child: Text(
                        'شقة',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 8,
                          fontFamily: 'Raleway',
                          fontWeight: FontWeight.w500,
                          height: 0,
                          letterSpacing: 0.24,
                        ),
                      ),
                    ),
                  ),
                )

            ),

          ],
        )
    );
  }
}



