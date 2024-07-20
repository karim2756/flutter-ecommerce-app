import 'package:flutter/widgets.dart';
import 'package:lottie/lottie.dart';
import 'package:my_project/core/class/statusrequest.dart';
import 'package:my_project/core/constant/imageasset.dart';

class HandlingDataView extends StatelessWidget {
  final StatusRequest statusRequest;
  final Widget widget;
  const HandlingDataView(
      {super.key, required this.statusRequest, required this.widget});

  @override
  Widget build(BuildContext context) {
    return statusRequest == StatusRequest.loading
        ? Center(
            child: Lottie.asset(AppImageAsset.loading, width: 250, height: 250))
        : statusRequest == StatusRequest.serverfailure
            ? Center(
                child: Lottie.asset(AppImageAsset.serverError,
                    width: 250, height: 250))
            : statusRequest == StatusRequest.offlinefailure
                ? Center(
                    child: Lottie.asset(AppImageAsset.noInternet,
                        width: 250, height: 250))
                : statusRequest == StatusRequest.failure
                    ? Center(
                        child: Lottie.asset(AppImageAsset.noData,
                            width: 250, height: 250))
                    : widget;
  }
}

// for requests

class HandlingDataRequest extends StatelessWidget {
  final StatusRequest statusRequest;
  final Widget widget;
  const HandlingDataRequest(
      {super.key, required this.statusRequest, required this.widget});

  @override
  Widget build(BuildContext context) {
    return statusRequest == StatusRequest.loading
        ? Center(
            child: Lottie.asset(AppImageAsset.loading, width: 250, height: 250))
        : statusRequest == StatusRequest.serverfailure
            ? Center(
                child: Lottie.asset(AppImageAsset.serverError,
                    width: 250, height: 250))
            : statusRequest == StatusRequest.offlinefailure
                ? Center(
                    child: Lottie.asset(AppImageAsset.noInternet,
                        width: 250, height: 250))
                : widget;
  }
}
