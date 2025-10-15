import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store_app/features/common/widgets/custom_text_button.dart';

import '../../../core/utils/app_color.dart';

class ReviewBottomSheet extends StatefulWidget {
  const ReviewBottomSheet({super.key});

  @override
  State<ReviewBottomSheet> createState() => _ReviewBottomSheetState();
}

class _ReviewBottomSheetState extends State<ReviewBottomSheet> {
  double rating = 0;
  final TextEditingController reviewController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 390.w,
      height: 416.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: AppColors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 24, right: 24, top: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 163),
              child: Container(
                width: 64,
                height: 6,
                margin: EdgeInsets.only(bottom: 12),
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Leave a Review",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                IconButton(
                  icon: Icon(Icons.close),
                  onPressed: () => Navigator.pop(context),
                ),
              ],
            ),

            Divider(),
            SizedBox(height: 8),
            Text(
              "How was your order?",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: AppColors.primary,
                fontFamily: "GeneralSans",
              ),
            ),
            SizedBox(height: 4),
            Text(
              "Please give your rating and also your review.",
              style: TextStyle(color: Colors.grey[600]),
            ),
            SizedBox(height: 16),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(5, (index) {
                return IconButton(
                  icon: Icon(
                    Icons.star,
                    color: index < rating ? Colors.orange : Colors.grey[300],
                    size: 32,
                  ),
                  onPressed: () {
                    setState(() {
                      rating = index + 1.0;
                    });
                  },
                );
              }),
            ),
            SizedBox(
              height: 20.h,
            ),
            TextField(
              controller: reviewController,
              maxLines: 3,
              decoration: InputDecoration(
                hintText: "Write your review...",
                filled: true,
                fillColor: Colors.grey[100],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: AppColors.primary100),
                ),
              ),
            ),

            SizedBox(height: 25),

            CustomTextButton(
              title: "Submit",
              backgroundColor: AppColors.primary,
              onPressed: () {},
              titleColor: AppColors.white,
            ),
          ],
        ),
      ),
    );
  }
}
