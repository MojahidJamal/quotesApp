import 'package:dartz/dartz.dart';
import 'package:quotes/core/error/failures.dart';
import 'package:quotes/core/usecases/usecase.dart';
import 'package:quotes/features/random_qutoe/domain/entities/quotes.dart';
import 'package:quotes/features/random_qutoe/domain/repositories/quote_repository.dart';

class GetRandomQuote implements UseCase<Quotes, NoParams> {
  final QuoteRepositorty quoteRepositorty;

  GetRandomQuote({required this.quoteRepositorty});

  @override
  Future<Either<Failure, Quotes>> call(NoParams params) =>
      quoteRepositorty.getRandomQuote();
}
