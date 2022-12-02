// ignore_for_file: unused_element, avoid_print, avoid_unnecessary_containers, sized_box_for_whitespace

import 'package:app_order/models/pagination.dart';
import 'package:app_order/providers.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

import '../models/slider.dart';

class HomeSliderWidget extends ConsumerWidget {
  const HomeSliderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      // ignore: prefer_const_literals_to_create_immutables
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              // ignore: prefer_const_constructors
              Padding(
                padding: const EdgeInsets.only(
                  left: 16,
                ),
                // ignore: prefer_const_constructors
                child: Text(
                  "Các sản phẩm mới",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              )
            ],
          ),
          Padding(
              padding: const EdgeInsets.all(1.0),
              child: Container(
                height: 150,
                width: 400,
                child: _sliderList(ref),
              ))
        ],
      ),
    );
  }

  Widget _sliderList(WidgetRef ref) {
    final sliders = ref.watch(
      slidersProvider(
        PaginationModel(page: 1, pageSize: 10),
      ),
    );
    return sliders.when(
        data: (list) {
          return imageCarousel(list!);
        },
        error: (_, __) => const Center(
              child: Text("ERR"),
            ),
        loading: () => const Center(
              child: CircularProgressIndicator(),
            ));
  }

  Widget imageCarousel(
    List<SliderModel> sliderList,
  ) {
    return CarouselSlider(
      items: sliderList.map((model) {
        return Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(model.fullImagePath),
              fit: BoxFit.contain,
            ),
          ),
        );
      }).toList(),
      options: CarouselOptions(
          enlargeCenterPage: true,
          autoPlay: true,
          aspectRatio: 16 / 9,
          autoPlayCurve: Curves.decelerate,
          enableInfiniteScroll: true,
          autoPlayAnimationDuration: const Duration(milliseconds: 800),
          viewportFraction: 0.8),
    );
  }
}
