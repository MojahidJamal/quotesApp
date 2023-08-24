import 'package:equatable/equatable.dart';

class Quotes extends Equatable {
  final String author;
  final int id;
  final String content;
  final String permalink;

  const Quotes(
      {required this.author,
      required this.id,
      required this.content,
      required this.permalink});

  @override
  List<Object?> get props => [author, id, content, permalink];
}
