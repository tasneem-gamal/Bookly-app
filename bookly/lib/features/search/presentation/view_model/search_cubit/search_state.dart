part of 'search_cubit.dart';

sealed class SearchState extends Equatable {
  const SearchState();

  @override
  List<Object> get props => [];
}

final class SearchInitial extends SearchState {}
final class SearchLoading extends SearchState {}
final class SearchFailure extends SearchState {
  final String errMessage;

  const SearchFailure(this.errMessage);
}
final class SearchSuccess extends SearchState {
  final List<BookModel> books;

  const SearchSuccess(this.books);
}
