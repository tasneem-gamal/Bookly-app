import 'package:bookly/features/home/data/models/book_model/book_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../home/data/repo/home_repo.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit(this.homeRepo) : super(SearchInitial());

  final HomeRepo homeRepo;

  Future<void> searchBooks(String subject) async {
    emit(SearchLoading());
    var result = await homeRepo.searchForBooks(subject: subject);
    result.fold(
      (failure) {
        emit(SearchFailure(failure.errMessage));
      }, 
      (books) {
        emit(SearchSuccess(books));
      }
    );
  }
}
