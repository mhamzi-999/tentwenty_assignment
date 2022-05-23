import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:tentwenty/helpers/constants.dart';
import 'package:tentwenty/urls.dart';

import '../../../models/upcoming_model/upcoming_model.dart';
import '../../movie_detail_page/movie_detail_page.dart';

class WatchList extends StatefulWidget {
  final Result result;
  const WatchList({Key? key, required this.result}) : super(key: key);

  @override
  State<WatchList> createState() => _WatchListState();
}

class _WatchListState extends State<WatchList> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        CONSTANTS.navigateToScreen(context, MovieDetailPage(movieId: widget.result.id!,));
      },
      child: Container(
        margin: const EdgeInsets.all(20),
        height: 180,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image:   DecorationImage(
            image:
            CachedNetworkImageProvider(
            URLS.BASE_URL_IMAGES+widget.result.backdropPath.toString(),
            ),
                fit: BoxFit.fill
          )
        ),
        child: Container(
          alignment: Alignment.bottomLeft,
          margin: const EdgeInsets.only(left: 20,right: 20,bottom: 20,),
          child: Text(widget.result.title.toString(),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
            color: CONSTANTS.colorFromHex("FFFFFF"),
            fontSize: 18,
            fontWeight: FontWeight.w500
          ),),
        ),
      ),
    );
  }
}
