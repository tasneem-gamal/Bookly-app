import 'package:bookly/core/utils/functions/launch_url.dart';
import 'package:bookly/core/widgets/custom_button.dart';
import 'package:bookly/features/home/data/models/book_model/book_model.dart';
import 'package:flutter/material.dart';

class BookAction extends StatelessWidget {
  const BookAction({super.key, required this.bookModel});

  final BookModel bookModel;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        children: [
          const Expanded(
              child: CustomButton(
            text: 'Free',
            backgroundColor: Colors.white,
            textColor: Colors.black,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16), bottomLeft: Radius.circular(16)),
          )),
          Expanded(
              child: CustomButton(
            onPressed: () {
              CustomLaunchUrl(context, bookModel.volumeInfo.previewLink!);
            },
            fontSize: 16.0,
            text: getText(bookModel),
            backgroundColor: const Color(0xffEF8262),
            textColor: Colors.white,
            borderRadius: const BorderRadius.only(
                topRight: Radius.circular(16),
                bottomRight: Radius.circular(16)),
          )),
        ],
      ),
    );
  }
  
  String getText(BookModel bookModel) {
    if(!(bookModel.volumeInfo.previewLink == null)){
      return 'Not Available';
    } else {
      return 'Preview';
    }
  }
}
