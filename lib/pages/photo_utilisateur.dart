import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:photo_view/photo_view.dart';
import 'package:sursa_mobile/utils/requete.dart';

class PhotoUtilisateur extends StatelessWidget {
  //
  List photos;
  //
  PhotoUtilisateur(this.photos);

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      mainAxisSpacing: 5,
      crossAxisSpacing: 5,
      children: List.generate(
        photos.length,
        (index) {
          String img = photos[index];
          return InkWell(
            onTap: () {
              //
              Get.dialog(
                Center(
                  child: PhotoView(
                    backgroundDecoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    //urlImage
                    //http://192.168.1.185/www/sursa
                    imageProvider: NetworkImage(
                        "${Requete.urlImage}/assets/img/avatar/${img}"),
                  ),
                ),
              );
            },
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                      "${Requete.urlImage}/assets/img/avatar/${img}"),
                ),
              ),
            ),
          );
        }, //['photo']
      ),
    );
  }
}
