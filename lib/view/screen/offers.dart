import 'package:delivery/controller/favorite_controller.dart';
import 'package:delivery/controller/offers_controller.dart';
import 'package:delivery/core/class/handlingdataview.dart';
import 'package:delivery/core/constant/routes.dart';
import 'package:delivery/view/screen/home.dart';
import 'package:delivery/view/widget/customappbar.dart';
import 'package:delivery/view/widget/offers/customListItemsoffers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OffersView extends StatelessWidget {
  const OffersView({super.key});
  
  @override
  Widget build(BuildContext context) {
    OffersController controller = Get.put(OffersController());
    FavoriteController controllerFav = Get.put(FavoriteController());
    return GetBuilder<OffersController>(
      builder: (controller) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: ListView(
          children: [
            CustomAppBar(
              mycontroller: controller.search!,
              titleappbar: "43".tr,
              // onPressedIcon: () {},
              onPressedSearch: () {
                controller.onSearchItems();
              },
              onChanged: (val) {
                controller.checkSearch(val);
              },
              onPressedIconFavorite: () {
                Get.toNamed(AppRoute.myfavroite);
              },
            ),

          SizedBox(height: 20,),
            !controller.isSearch ?HandlingDataView(
              statusRequest: controller.statusRequest,
              widget: ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: controller.data.length,
                  itemBuilder:(context, index) => CustomListItemsOffers(
                      itemsModel: controller.data[index])))
                :ListItemsSearch(listdatamodel: controller.listdata)

    ],),
      ),
    );
  }
}



