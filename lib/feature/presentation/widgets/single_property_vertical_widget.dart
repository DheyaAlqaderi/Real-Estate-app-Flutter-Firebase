import 'package:flutter/material.dart';


class SinglePropertyVertical extends StatefulWidget {
  SinglePropertyVertical({super.key, this.image, this.name, this.address, this.price, this.rating, required this.isFavorite});

  final String? image;
  final String? name;
  final String? address;
  final dynamic price;
  final dynamic rating;
  var isFavorite;

  @override
  State<SinglePropertyVertical> createState() => _SinglePropertyVerticalState();
}

class _SinglePropertyVerticalState extends State<SinglePropertyVertical> {
  bool _selected = true;

  @override
  void initState() {
    super.initState();
    setState(() {
      if(widget.isFavorite != null) {
        _selected = widget.isFavorite;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
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
          width: 160,
          height: 231,
          decoration: ShapeDecoration(
            color: const Color(0xFFF5F4F7),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25),
            ),
          ),
          child: Column(
            children: [
              imageSection(widget.image.toString(), widget.price),
              const SizedBox(height: 5,),
              Padding(
                padding:  const EdgeInsets.all(5.0),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    widget.name.toString(),
                    textAlign: TextAlign.right,
                    maxLines: 1, // Set the maximum number of lines
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: Color(0xFF242B5C),
                      fontSize: 12,
                      fontFamily: 'Raleway',
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(2.0),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        widget.address.toString(),
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
              ),
              const Padding(
                padding: EdgeInsets.all(3.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      '4.5 ',
                      style: TextStyle(
                        color: Color(0xFF53577A),
                        fontSize: 8,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w700,
                        height: 0.12,
                      ),
                    ),

                    Icon(Icons.star, color: Colors.orange, size: 10,)
                  ],
                ),
              ),
            ],
          )
      ),
    );
  }

  imageSection(String image, dynamic price) {
    return Container(
        height: 160,
        decoration: ShapeDecoration(
          image: DecorationImage(
            image: AssetImage(image),
            fit: BoxFit.fill,
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
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
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
                  child: SizedBox(
                    width: 41,
                    height: 20,
                    child: Center(
                      child: Text(
                        "${price.toString()} /m",
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 7,
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
