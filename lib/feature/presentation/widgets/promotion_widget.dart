import 'package:flutter/material.dart';

// ignore: non_constant_identifier_names
PromotionWidget(String image, String title) {
  return Container(
    width: 310.0,
    height: 180,
    decoration: const BoxDecoration(
      borderRadius: BorderRadius.only(
        bottomRight: Radius.circular(25),
        topLeft: Radius.circular(25),
        topRight: Radius.circular(25),
      ),
    ),
    child: Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(image),
              fit: BoxFit.cover,
            ),
            borderRadius: const BorderRadius.only(
              bottomRight: Radius.circular(25),
              topLeft: Radius.circular(25),
              topRight: Radius.circular(25),
            ),
          ),
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  colors: [
                    Colors.black.withOpacity(0.1),
                    Colors.black.withOpacity(0.6),
                  ]
              ),
              borderRadius: const BorderRadius.only(
                bottomRight: Radius.circular(25),
                topLeft: Radius.circular(25),
                topRight: Radius.circular(25),
              ),
            ),
          ),
        ),

        Positioned(
          bottom: 0,
          left: 0,
          child: SizedBox(
            width: 93,
            height: 56, // Set your custom height
            child: ElevatedButton(
                onPressed: (){},
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white, backgroundColor: const Color(0xFF234F68), // Text color
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(10)
                    ), // Corner radius
                  ),
                ),
                child: const Icon(Icons.arrow_forward)
            ),
          ),
        ),

        Positioned(
          top: 55,
          right: 33,
          child: Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontFamily: 'Raleway',
              fontWeight: FontWeight.w700,
              height: 0,
              letterSpacing: 0.54,
            ),
          ),
        ),

        const Positioned(
          top: 105,
          right: 9,
          child: Text(
            'جميع التخفيضات تصل إلى 60%',
            style: TextStyle(
              color: Colors.white,
              fontSize: 10,
              fontFamily: 'Raleway',
              fontWeight: FontWeight.w400,
              height: 0,
            ),
          ),
        )
      ],
    ),
  );
}