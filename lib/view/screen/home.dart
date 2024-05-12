import 'package:cached_network_image/cached_network_image.dart';
import 'package:delivery/controller/home_controller.dart';
import 'package:delivery/core/class/handlingdataview.dart';
import 'package:delivery/core/constant/routes.dart';
import 'package:delivery/data/model/itemsmodel.dart';
import 'package:delivery/linkapi.dart';
import 'package:delivery/view/widget/customappbar.dart';
import 'package:delivery/view/widget/home/customcardhome.dart';
import 'package:delivery/view/widget/home/customtitlehome.dart';
import 'package:delivery/view/widget/home/listcategorieshome.dart';
import 'package:delivery/view/widget/home/listitemshome.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    HomeControllerImp controller =  Get.put(HomeControllerImp());
    return GetBuilder<HomeControllerImp>(
        builder: (controller) => Container(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: ListView(
              children: [
                // CustomAppBar(
                //   mycontroller: controller.search!,
                //   titleappbar: "43".tr,
                //   // onPressedIcon: () {},
                //   onPressedSearch: () {
                //     controller.onSearchItems();
                //   },
                //   onChanged: (val) {
                //     controller.checkSearch(val);
                //   },
                //   onPressedIconFavorite: () {
                //     Get.toNamed(AppRoute.myfavroite);
                //   },
                // ),
                // HandlingDataView(
                //     statusRequest: controller.statusRequest,
                //     widget: !controller.isSearch
                //         ?  Column(
                //             crossAxisAlignment: CrossAxisAlignment.start,
                //             children: [
                //               if (controller.settingsdata.isNotEmpty)CustomCardHome(
                //                   title: "${controller.settingsdata [0]['settings_titleome']}",
                //                   body: "${controller.settingsdata [0]['settings_bodyhome']}",),
                //               const CustomTitleHome(title: "Categories"),
                //               const ListCategoriesHome(),
                //               const CustomTitleHome(title: "Top Selling"),
                //               const ListItemsHome(),
                //             ],
                //           )
                //         : ListItemsSearch(listdatamodel: controller.listdata))

                // const CustomTitleHome(title: "Offer"),
                // const ListItemsHome()
              ],
            )));
  }
}

class ListItemsSearch extends GetView<HomeControllerImp> {
  final List<ItemsModel> listdatamodel;
  const ListItemsSearch({Key? key, required this.listdatamodel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: listdatamodel.length,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              controller.goToPageProductDetails(listdatamodel[index]);
            },
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 20),
              child: Card(
                  child: Container(
                padding: EdgeInsets.all(10),
                child: Row(
                  children: [
                    Expanded(
                        child: CachedNetworkImage(
                            imageUrl:
                                "${AppLink.imagestItems}/${listdatamodel[index].itemsImage}")),
                    Expanded(
                        flex: 2,
                        child: ListTile(
                          title: Text(listdatamodel[index].itemsName!),
                          subtitle: Text(listdatamodel[index].categoriesName!),
                        )),
                  ],
                ),
              )),
            ),
          );
        });
  }
}
