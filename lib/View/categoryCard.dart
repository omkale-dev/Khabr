import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget {
  final String imageAssetUrl, category;
  CategoryCard({
    @required this.imageAssetUrl,
    @required this.category,
  });
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        margin: EdgeInsets.all(6),
        height: 70,
        width: 130,
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(imageAssetUrl), fit: BoxFit.cover)),
              ),
            ),
            Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.black45,
                borderRadius: BorderRadius.circular(5),
              ),
              child: Text(
                category,
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16),
              ),
            )
          ],
        ),
      ),
    );
  }
}
