import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_project/controller/account_controller.dart';
import 'package:my_project/core/constant/color.dart';
import 'package:my_project/core/constant/imageasset.dart';
import 'package:my_project/core/constant/pageroute.dart';
import 'package:url_launcher/url_launcher.dart';

class Account extends StatelessWidget {
  const Account({super.key});

  @override
  Widget build(BuildContext context) {
    AccountController controller = Get.put(AccountController());
    return ListView(
      children: [
        Stack(
          alignment: Alignment.center,
          clipBehavior: Clip.none,
          children: [
            Container(
              height: Get.width / 2,
              color: AppColor.primaryColor,
            ),
            Positioned(
              top: Get.width / 2.5,
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(color: AppColor.grey.withOpacity(.3)),
                    borderRadius: BorderRadius.circular(50)),
                child: const CircleAvatar(
                  radius: 50,
                  backgroundColor: AppColor.backgroundColor,
                  backgroundImage: AssetImage(AppImageAsset.person),
                ),
              ),
            ),
            Text(
              "${"88".tr} ${controller.username}",
              style: const TextStyle(
                  color: AppColor.backgroundColor,
                  fontSize: 30,
                  fontWeight: FontWeight.bold),
            )
          ],
        ),
        const SizedBox(
          height: 70,
        ),
        Card(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: ListTile(
                  onTap: () {
                    Get.toNamed(AppRoutes.ordersArchive);
                  },
                  leading: Text(
                    "89".tr,
                    style: const TextStyle(fontSize: 17),
                  ),
                  trailing: const Icon(Icons.archive_outlined),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: ListTile(
                  onTap: () {
                    Get.toNamed(AppRoutes.viewAddress);
                  },
                  leading: Text(
                    "90".tr,
                    style: const TextStyle(fontSize: 17),
                  ),
                  trailing: const Icon(Icons.location_on_outlined),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: ListTile(
                  onTap: () {
                    Get.toNamed(AppRoutes.changeLanguage);
                  },
                  leading: Text(
                    "123".tr,
                    style: const TextStyle(fontSize: 17),
                  ),
                  trailing: const Icon(Icons.language_outlined),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: ListTile(
                  leading: Text(
                    "91".tr,
                    style: const TextStyle(fontSize: 17),
                  ),
                  trailing: const Icon(Icons.help_outline_sharp),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: ListTile(
                  onTap: () {
                    launchUrl(Uri.parse("tel:+201279690337"));
                  },
                  leading: Text(
                    "92".tr,
                    style: const TextStyle(fontSize: 17),
                  ),
                  trailing: const Icon(Icons.phone),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: ListTile(
                  onTap: () {
                    controller.logout();
                  },
                  leading: Text(
                    "93".tr,
                    style: const TextStyle(fontSize: 17),
                  ),
                  trailing: const Icon(Icons.logout),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
