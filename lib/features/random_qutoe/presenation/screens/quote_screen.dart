import 'package:flutter/material.dart';
import 'package:quotes/config/routes/app_routes.dart';
import 'package:quotes/core/utils/app_colors.dart';
import 'package:quotes/core/utils/app_strings.dart';
import 'package:quotes/core/utils/assets_manager.dart';
import 'package:quotes/core/utils/constants.dart';
import 'package:quotes/core/utils/media_query_values.dart';
import 'package:quotes/features/random_qutoe/presenation/widgets/quote_content.dart';

class QuoteScreen extends StatefulWidget {
  const QuoteScreen({Key? key}) : super(key: key);

  @override
  State<QuoteScreen> createState() => _QuoteScreenState();
}

class _QuoteScreenState extends State<QuoteScreen> {
  Widget _buildBodyContent() {
    return Column(
      children: [
        QuoteContont(),
        Container(
          margin: EdgeInsets.symmetric(vertical: 15),
          padding: const EdgeInsets.all(10),
          decoration:
              BoxDecoration(color: AppColors.primary, shape: BoxShape.circle),
          child: Icon(
            Icons.access_alarm,
            size: 28,
            color: Colors.white,
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final appBar = AppBar(
      title: Text(AppStrings.appName),
    );
    return Scaffold(appBar: appBar, body: _buildBodyContent());
  }
}
