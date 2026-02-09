import 'package:flutter/material.dart';
import '../models/models.dart';
import '../widgets/widgets.dart';

class FurniturePage extends StatefulWidget {
  const FurniturePage({super.key});

  @override
  State<FurniturePage> createState() => _FurniturePageState();
}

class _FurniturePageState extends State<FurniturePage> {
  final _controller = PageController(viewportFraction: 0.92);
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const SliverAppBar(
            pinned: true,
            title: Text(
              'Furniture',
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.w600),
            ),
          ),

          SliverToBoxAdapter(
            child: BannerCarousel(
              controller: _controller,
              items: banners,
              index: _index,
              onChanged: (i) => setState(() => _index = i),
            ),
          ),

          const SliverToBoxAdapter(
            child: SectionTitle('Styled Chairs'),
          ),

          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            sliver: ChairGrid(items: chairs),
          ),
        ],
      ),
    );
  }
}
