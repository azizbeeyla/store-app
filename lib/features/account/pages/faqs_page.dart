import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store_app/core/utils/app_color.dart';
import 'package:store_app/features/account/widgets/selectable_widget.dart';
import 'package:store_app/features/common/widgets/custom_appbar_main.dart';
import 'package:store_app/features/common/widgets/custom_botttom_navigation.dart';
import 'package:store_app/features/home/widgets/row_textform_widget.dart';

import '../widgets/faq_item.dart';

class FaqPage extends StatefulWidget {
  const FaqPage({super.key});

  @override
  State<FaqPage> createState() => _FaqPageState();
}

class _FaqPageState extends State<FaqPage> {
  int selectedIndex = 0;
  final categories = [
    "Gener"
        "al",
    "Account",
    "Service",
    "Payment",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: CustomAppBarMain(title: "FAQs"),
      body: Padding(
        padding: EdgeInsets.only(left: 24, top: 16, right: 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Divider(
              color: AppColors.primary100,
            ),
            SizedBox(
              height: 24.h,
            ),
            SizedBox(
              height: 40.h,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: categories.length,
                separatorBuilder: (context, _) => SizedBox(width: 8.w),
                itemBuilder: (context, index) {
                  return SelectableWidget(
                    title: categories[index],
                    isSelected: selectedIndex == index,
                    onTap: () {
                      setState(() => selectedIndex = index);
                    },
                  );
                },
              ),
            ),
            SizedBox(height: 16.h),
            RowTextFormWidget(
              showFilter: false,
              hintText: 'Search for questions...',
            ),
            SizedBox(height: 16.h),

            Expanded(
              child: ListView.separated(
                itemCount: _faqList.length,
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 14),
                itemBuilder: (context, index) {
                  final item = _faqList[index];
                  return Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.shade300),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: FaqItem(
                      question: item['question']!,
                      answer: item['answer']!,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const CustomBottomNavigationBar(isActive: 4),
    );
  }
}

final List<Map<String, String>> _faqList = [
  {
    'question': 'How do I make a purchase?',
    'answer':
        'When you find a product you want to purchase, tap on it to view the product details. Check the price, description, and available options (if applicable), and then tap the “Add to Cart” button. Follow the on-screen instructions to complete the purchase, including providing shipping details and payment information.',
  },
  {
    'question': 'What payment methods are accepted?',
    'answer':
        'We accept credit/debit cards, PayPal, and other secure payment options.',
  },
  {
    'question': 'How do I track my orders?',
    'answer':
        'You can track your orders from your account page under the “My Orders” section.',
  },
  {
    'question': 'Can I cancel or return an order?',
    'answer':
        'Yes, you can cancel or return an order within 7 days if it meets our return policy requirements.',
  },
  {
    'question': 'How can I contact customer support for assistance?',
    'answer':
        'You can reach our support team through the “Contact Us” section or by emailing support@example.com.',
  },
];
