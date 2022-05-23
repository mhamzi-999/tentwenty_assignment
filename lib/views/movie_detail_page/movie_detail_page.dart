import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tentwenty/views/movie_detail_page/widgets/bottom_widget.dart';
import 'package:tentwenty/views/movie_detail_page/widgets/top_widget.dart';

import '../../controllers/upcomig_detail_controller/upcoming_detail_controller.dart';
import '../widgets/custom_progress_indocator.dart';
import '../widgets/no_record.dart';

class MovieDetailPage extends StatefulWidget {
  final int movieId;
  const MovieDetailPage({Key? key, required this.movieId}) : super(key: key);

  @override
  State<MovieDetailPage> createState() => _MovieDetailPageState();
}

class _MovieDetailPageState extends State<MovieDetailPage> {
  final upcomingDetail=Get.put(UpcomingDetailController());
  @override
  void initState(){
    WidgetsBinding.instance.addPostFrameCallback((_) {
      upcomingDetail.getUpcomingDetailData(widget.movieId);
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx((){
      if (upcomingDetail.isLoading.value) {
        return customProgressIndicator();
      } else if (upcomingDetail.isListNull.value) {
        return noRecordWidget("Something went wrong, please try again");
      } else {
        return SingleChildScrollView(
          child: Column(
            children: [
              TopWidget(upcomingDetail: upcomingDetail,movieId: widget.movieId,),
              BottomWidget(upcomingDetail: upcomingDetail,)
            ],
          ),
        );
      }
        }
      ),
    );
  }
}
