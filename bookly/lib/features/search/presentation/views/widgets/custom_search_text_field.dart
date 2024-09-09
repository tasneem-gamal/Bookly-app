import 'package:bookly/features/search/presentation/view_model/search_cubit/search_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomSearchTextField extends StatelessWidget {
  const CustomSearchTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      onSubmitted: (value) async{
        BlocProvider.of<SearchCubit>(context).searchBooks(value);
      },
      decoration: InputDecoration(
          hintText: 'Search',
          enabledBorder: buildOutlinedInputBorder(),
          focusedBorder: buildOutlinedInputBorder(),
          suffixIcon: IconButton(
              onPressed: () {},
              icon: const Opacity(
                  opacity: 0.5,
                  child: Icon(
                    FontAwesomeIcons.magnifyingGlass,
                  )))),
    );
  }

  OutlineInputBorder buildOutlinedInputBorder() {
    return OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.white),
        borderRadius: BorderRadius.circular(12));
  }
}
