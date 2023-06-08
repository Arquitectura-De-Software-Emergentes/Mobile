import 'package:flutter/material.dart';
import 'package:teacher_finder/common/widgets/custom_app_bar.dart';

import '../../domain/entities/offer.dart';
import 'widgets/offer_detail_card.dart';

class OfferDetailScreen extends StatelessWidget {
  const OfferDetailScreen({super.key, required this.offer});
  final Offer offer;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 45, horizontal: 25),
          child: OfferDetailCard(offer: offer)),
    );
  }
}
