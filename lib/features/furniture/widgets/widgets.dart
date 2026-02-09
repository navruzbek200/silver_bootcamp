import 'package:flutter/material.dart';
import '../models/models.dart';


class BannerCarousel extends StatelessWidget {
  final PageController controller;
  final List<BannerItem> items;
  final int index;
  final ValueChanged<int> onChanged;

  const BannerCarousel({
    super.key,
    required this.controller,
    required this.items,
    required this.index,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 230,
          child: PageView.builder(
            controller: controller,
            onPageChanged: onChanged,
            itemCount: items.length,
            itemBuilder: (_, i) => _BannerCard(item: items[i]),
          ),
        ),
        const SizedBox(height: 8),
        _Dots(items.length, index),
      ],
    );
  }
}

class _BannerCard extends StatelessWidget {
  final BannerItem item;
  const _BannerCard({required this.item});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 12),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Stack(
          children: [
            Positioned.fill(
              child: Image.network(item.image, fit: BoxFit.cover),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                padding: const EdgeInsets.all(12),
                color: Colors.white.withOpacity(0.9),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(item.title,
                              style:
                              const TextStyle(fontWeight: FontWeight.bold)),
                          Text('\$${item.price}',
                              style:
                              const TextStyle(color: Colors.blue)),
                        ],
                      ),
                    ),
                    const Icon(Icons.shopping_cart_outlined,
                        color: Colors.blue),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Dots extends StatelessWidget {
  final int count;
  final int index;
  const _Dots(this.count, this.index);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        count,
            (i) => Container(
          margin: const EdgeInsets.symmetric(horizontal: 4),
          height: 8,
          width: i == index ? 18 : 8,
          decoration: BoxDecoration(
            color: i == index ? Colors.black : Colors.grey,
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }
}


class ChairGrid extends StatelessWidget {
  final List<ChairItem> items;
  const ChairGrid({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return SliverGrid(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childAspectRatio: 0.85,
      ),
      delegate: SliverChildBuilderDelegate(
            (_, i) => _ChairCard(item: items[i]),
        childCount: items.length,
      ),
    );
  }
}

class _ChairCard extends StatelessWidget {
  final ChairItem item;
  const _ChairCard({required this.item});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Column(
        children: [
          Expanded(
            child: Image.network(item.image, fit: BoxFit.cover),
          ),
          Container(
            padding: const EdgeInsets.all(6),
            color: Colors.white,
            child: Text(
              item.title,
              maxLines: 2,
              style: const TextStyle(fontSize: 11),
            ),
          )
        ],
      ),
    );
  }
}


class SectionTitle extends StatelessWidget {
  final String text;
  const SectionTitle(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 20, 16, 10),
      child: Text(
        text,
        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
    );
  }
}
