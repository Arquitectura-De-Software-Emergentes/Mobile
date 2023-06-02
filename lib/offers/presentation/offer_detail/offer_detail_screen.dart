import 'package:flutter/material.dart';
import 'package:teacher_finder/common/widgets/app_bar_custom.dart';

import '../../domain/entities/offer.dart';
import 'widgets/offer_detail_card.dart';

class OfferDetailScreen extends StatelessWidget {
  const OfferDetailScreen({super.key, required this.offer});
  final Offer offer;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarCustom(isHome: false),
      body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 45, horizontal: 25),
          child: OfferDetailCard(offer: offer)),
    );
  }
}
