import 'package:custom_rating_bar/custom_rating_bar.dart';
import 'package:flutter/material.dart';

class RatingBarDEMO extends StatelessWidget {
  const RatingBarDEMO({super.key});

  /// This demo showcases 5 different types of RatingBars, with different alignments, icons, and colors.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: Text("Rating Bar Demo", style: TextStyle(color: Colors.white)),
      ),
      body: ListView(
        padding: EdgeInsets.all(
          10.0,
        ).copyWith(top: MediaQuery.of(context).padding.top),
        children: [
          _buildDivider("Half Icons"),
          SizedBox(height: 10.0),
          //The first example is a basic RatingBar with half icons allowed.
          RatingBar(
            initialRating: 2.5,
            filledIcon: Icons.star,
            emptyIcon: Icons.star_border,
            alignment: Alignment.center,
            maxRating: 5,
            onRatingChanged: (p0) {
              debugPrint(p0.toString());
            },
          ),
          SizedBox(height: 10),
          _buildDivider("Custom Colors"),
          // The second example is a read-only RatingBar with custom colors.
          RatingBar.readOnly(
            filledIcon: Icons.star_border_sharp,
            emptyIcon: Icons.star_border_sharp,
            initialRating: 3.5,
            emptyColor: Colors.grey,
            filledColor: Colors.redAccent,
            halfFilledColor: Colors.redAccent,
            halfFilledIcon: Icons.star_half_sharp,
            alignment: Alignment.center,
            maxRating: 7,
          ),
          SizedBox(height: 10),
          //The third example is a read-only RatingBar with custom icons.
          _buildDivider("Custom Isons"),
          const RatingBar.readOnly(
            isHalfAllowed: true,
            alignment: Alignment.center,
            filledIcon: Icons.wb_sunny,
            halfFilledIcon: Icons.wb_cloudy,
            emptyIcon: Icons.ac_unit,
            emptyColor: Colors.blue,
            halfFilledColor: Colors.grey,
            initialRating: 3.5,
            maxRating: 7,
          ),

          SizedBox(height: 20),
          //  The fourth example is a vertical RatingBar with half icons allowed.
          _buildDivider("Vertical Rating Bar"),
          RatingBar.readOnly(
            isHalfAllowed: true,
            direction: Axis.vertical,
            alignment: Alignment.center,
            filledIcon: Icons.wb_sunny,
            halfFilledIcon: Icons.wb_cloudy,
            emptyIcon: Icons.ac_unit,
            emptyColor: Colors.blue,
            halfFilledColor: Colors.grey,
            initialRating: 3.5,
            maxRating: 7,
          ),
          SizedBox(height: 20),
          //The fifth example is a RatingBar aligned to the left.
          _buildDivider("Alignment Left"),
          RatingBar.readOnly(
            isHalfAllowed: true,
            alignment: Alignment.centerLeft,
            filledIcon: Icons.wb_sunny,
            halfFilledIcon: Icons.wb_cloudy,
            emptyIcon: Icons.ac_unit,
            emptyColor: Colors.blue,
            halfFilledColor: Colors.grey,
            initialRating: 3.5,
            maxRating: 7,
          ),
          SizedBox(height: 20),

          /// The sixth example is a RatingBar aligned to the right.
          _buildDivider("Alignment Right"),
          RatingBar.readOnly(
            isHalfAllowed: true,
            alignment: Alignment.centerRight,
            filledIcon: Icons.wb_sunny,
            halfFilledIcon: Icons.wb_cloudy,
            emptyIcon: Icons.ac_unit,
            emptyColor: Colors.blue,
            halfFilledColor: Colors.grey,
            initialRating: 3.5,
            maxRating: 7,
          ),
        ],
      ),
    );
  }

  Widget _buildDivider(String text) => Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      Flexible(
        child: Divider(color: Colors.grey[400], height: 48, thickness: 1),
      ),
      const SizedBox(width: 8),
      Text(
        text,
        style: TextStyle(
          color: Colors.grey[500],
          fontSize: 20,
          fontWeight: FontWeight.w300,
        ),
      ),
      const SizedBox(width: 8),
      Flexible(
        child: Divider(color: Colors.grey[350], height: 32, thickness: 1),
      ),
    ],
  );
}
