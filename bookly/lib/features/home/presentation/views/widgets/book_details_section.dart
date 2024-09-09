import 'package:bookly/features/home/data/models/book_model/book_model.dart';
import 'package:bookly/features/home/presentation/views/widgets/book_action.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/styles.dart';
import 'book_rating.dart';
import 'custom_book_image.dart';

class BookDetailsSection extends StatelessWidget {
  const BookDetailsSection({super.key, required this.bookModel});
  
  final BookModel bookModel;
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: width * .18),
          child: CustomBookImage(
            imageUrl: bookModel.volumeInfo.imageLinks?.thumbnail ?? '',
          ),
        ),
        const SizedBox(
          height: 43,
        ),
        Text(
          textAlign: TextAlign.center,
          bookModel.volumeInfo.title!,
          style: Styles.textStyle30.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 6,
        ),
        Text(
          bookModel.volumeInfo.authors![0],
          style: Styles.textStyle18.copyWith(
              fontWeight: FontWeight.w500, fontStyle: FontStyle.italic),
        ),
        const SizedBox(
          height: 16,
        ),
        BookRating(
          rating: '4.9',
          count: bookModel.volumeInfo.pageCount!,
          mainAxisAlignment: MainAxisAlignment.center,
        ),
        const SizedBox(
          height: 37,
        ),
        BookAction(bookModel: bookModel)
      ],
    );
  }
}
