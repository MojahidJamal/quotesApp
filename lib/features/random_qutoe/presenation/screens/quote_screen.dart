import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:quotes/config/routes/app_routes.dart';
import 'package:quotes/core/utils/app_colors.dart';
import 'package:quotes/core/utils/app_strings.dart';
import 'package:quotes/core/utils/assets_manager.dart';
import 'package:quotes/core/utils/constants.dart';
import 'package:quotes/core/utils/media_query_values.dart';
import 'package:quotes/features/random_qutoe/presenation/cubit/random_quote_cubit.dart';
import 'package:quotes/features/random_qutoe/presenation/widgets/quote_content.dart';
import 'package:quotes/core/widgets/erroe_widget.dart' as error_widget;

class QuoteScreen extends StatefulWidget {
  const QuoteScreen({Key? key}) : super(key: key);

  @override
  State<QuoteScreen> createState() => _QuoteScreenState();
}

class _QuoteScreenState extends State<QuoteScreen> {
  _getRandomQuote() =>
      BlocProvider.of<RandomQuoteCubit>(context).getRandomQuote();

  @override
  void initState() {
    super.initState();
    _getRandomQuote();
  }

  Widget _buildBodyContent() {
    return BlocBuilder<RandomQuoteCubit, RandomQuoteState>(
        builder: (context, state) {
      if (state is RandomQuoteIsLoading) {
        return Center(
          child: SpinKitFadingCircle(
            color: AppColors.primary,
          ),
        );
      } else if (state is RandomQuoteError) {
        return const error_widget.ErrorWidget();
      } else if (state is RandomQuoteLoaded) {
        return Column(
          children: [
            QuoteContont(
              quotes: state.quote,
            ),
            InkWell(
              onTap: () => _getRandomQuote(),
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 15),
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: AppColors.primary, shape: BoxShape.circle),
                child: const Icon(
                  Icons.access_alarm,
                  size: 28,
                  color: Colors.white,
                ),
              ),
            )
          ],
        );
      } else {
        return Center(
          child: SpinKitFadingCircle(
            color: AppColors.primary,
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final appBar = AppBar(
      title: Text(AppStrings.appName),
    );
    return RefreshIndicator(
        child: Scaffold(appBar: appBar, body: _buildBodyContent()),
        onRefresh: () => _getRandomQuote());
  }
}
