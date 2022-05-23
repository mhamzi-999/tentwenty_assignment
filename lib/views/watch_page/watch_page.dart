import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tentwenty/controllers/upcoming_controller/upcoming_controller.dart';
import 'package:tentwenty/helpers/constants.dart';
import 'package:tentwenty/models/upcoming_model/upcoming_model.dart';
import 'package:tentwenty/views/watch_page/widgets/watch_list.dart';

import '../../menu/custom_bottomnavigation.dart';
import '../shows_page/shows_page.dart';
import '../widgets/custom_progress_indocator.dart';
import '../widgets/no_record.dart';

class WatchPage extends StatefulWidget {
  const WatchPage({Key? key}) : super(key: key);

  @override
  State<WatchPage> createState() => _WatchPageState();
}

class _WatchPageState extends State<WatchPage> {
  final upcomigMoviesController=Get.put(UpcomingController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const CustomBottomNavigation(index: 1,),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(111),
        child: Container(
         color: CONSTANTS.colorFromHex("FFFFFF"),
        padding: const EdgeInsets.only(top:67,left: 20,right: 20,bottom: 24),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Watch",
                textAlign: TextAlign.left,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                color: CONSTANTS.colorFromHex("202C43"),
                fontSize: 16,
                fontWeight: FontWeight.w500
              ),),
              InkWell(
                  onTap: (){
                    CONSTANTS.navigateToScreen(context, ShowsPage());
                  },
                  child: Icon(Icons.search,color: CONSTANTS.colorFromHex("000000"),size: 16.38,))
            ],
          ),
        ),
      ),
      body: Obx((){
      if (upcomigMoviesController.isLoading.value) {
        return customProgressIndicator();
      } else if (upcomigMoviesController.isListNull.value) {
        return noRecordWidget("No record found");
      } else {
        List<Result> resultList=upcomigMoviesController.upcomingResp.value.results!.toList();
        return ListView.builder(
            padding: const EdgeInsets.only(top: 10),
            itemCount: 10,
            itemBuilder: (context, index) => WatchList(result: resultList[index],));
      }
        }
      ),
    );
  }
}
