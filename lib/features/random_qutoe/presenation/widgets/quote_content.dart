import 'package:flutter/material.dart';
import 'package:quotes/core/utils/app_colors.dart';
import 'package:quotes/features/random_qutoe/domain/entities/quotes.dart';

class QuoteContont extends StatelessWidget {
  final Quotes quotes;
  const QuoteContont({Key? key, required this.quotes}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20),
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
          color: AppColors.primary, borderRadius: BorderRadius.circular(30)),
      child: Column(
        children: [
          Text(
            'Measuring programming progress Measuring programming progress Measuring programming progress',
            style: Theme.of(context).textTheme.bodyText1,
            textAlign: TextAlign.center,
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 15),
            child: Text(
              'Bill Gates',
              style: Theme.of(context).textTheme.bodyText1,
            ),
          )
        ],
      ),
    );
  }
}
