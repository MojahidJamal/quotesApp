import 'package:dartz/dartz.dart';
import 'package:quotes/core/error/failures.dart';
import 'package:quotes/features/random_qutoe/domain/entities/quotes.dart';

abstract class QuoteRepositorty {
  Future<Either<Failure, Quotes>> getRandomQuote();
}
