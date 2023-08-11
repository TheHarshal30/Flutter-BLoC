part of 'news_cubit.dart';

@immutable
class NewsState {
  final News? news;
  final bool isLoaded;
  NewsState({required this.news, required this.isLoaded});
}
