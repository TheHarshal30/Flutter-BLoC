import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:taskk/logic/models/news.dart';
import 'package:taskk/logic/models/remote_services.dart';

part 'news_state.dart';

class NewsCubit extends Cubit<NewsState> {
  NewsCubit() : super(NewsState(news: null, isLoaded: false)) {
    news();
  }
  news() async {
    NewsService newsService = NewsService();
    News? news = await newsService.getNews();
    if (news != null) {
      emit(NewsState(news: news, isLoaded: true));
    }
  }
}
