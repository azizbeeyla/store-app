import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../data/model/review_model.dart';
import 'review_item_widget.dart';

class DetailReviewsWidget extends StatelessWidget {
  final List<ReviewModel> reviews;
  final bool loading;
  const DetailReviewsWidget({required this.reviews, required this.loading, super.key});

  @override
  Widget build(BuildContext context) {
    if (loading) return Center(child: CircularProgressIndicator(),);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("${reviews.length} Reviews", style: TextStyle()),
        SizedBox(height: 8.h),
        ...reviews.map((review) => ReviewItemWidget(review: review)).toList(),
      ],
    );
  }
}
