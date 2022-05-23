import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:tentwenty/helpers/constants.dart';
import 'package:tentwenty/views/shows_page/widgets/search_list.dart';
import 'package:tentwenty/views/shows_page/widgets/shows_list.dart';

import '../../menu/custom_bottomnavigation.dart';
import '../widgets/custom_textfield.dart';

class ShowsPage extends StatefulWidget {
  const ShowsPage({Key? key}) : super(key: key);

  @override
  State<ShowsPage> createState() => _ShowsPageState();
}

class _ShowsPageState extends State<ShowsPage> {
  TextEditingController searchController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: const CustomBottomNavigation(index: 1,),
        appBar: PreferredSize(
        preferredSize: const Size.fromHeight(111),
        child: Container(
          color: CONSTANTS.colorFromHex("FFFFFF"),
          padding: const EdgeInsets.only(top:55,left: 20,right: 20,bottom: 25),
          child:  CustomTextfield(hint: "TV shows, movies and more",
              onChng: (text){
                setState((){});
              },
              controller: searchController,
              suffixIcon: GestureDetector(
              onTap: (){
                searchController.clear();
                setState((){});
              },
              child: Icon(Icons.close,
                color: CONSTANTS.colorFromHex("000000"),size: 16.38,
              ),
            ),
              prefixIcon: GestureDetector(
                onTap: (){
                },
                child: Icon(Icons.search,
                  color: CONSTANTS.colorFromHex("000000"),size: 16.38,
                ),
              )),
        ),
      ),
      body:searchController.text.trim().isNotEmpty?SearchBody() :MasonryGridView.count(
          padding: const EdgeInsets.only(top: 10,left: 20,right: 20,),
          crossAxisCount: 2,
          itemCount: 10,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          itemBuilder: (context, index) {
            return ShowsList();
          },
        )
    );
  }
}
