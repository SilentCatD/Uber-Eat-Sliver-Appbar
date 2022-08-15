import 'dart:math';

import 'package:bubble_tab_indicator/bubble_tab_indicator.dart';
import 'package:flutter/material.dart';

class MyHomePage2 extends StatefulWidget {
  const MyHomePage2({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage2> createState() => _MyHomePage2State();
}

class _MyHomePage2State extends State<MyHomePage2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          const MySliverAppBar(),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  margin: const EdgeInsets.only(bottom: 5),
                  child: const ListTile(
                    title: Text("Title"),
                  ),
                );
              },
              childCount: 20,
            ),
          ),
        ],
      ),
    );
  }
}

class MySliverAppBar extends StatefulWidget {
  const MySliverAppBar({Key? key}) : super(key: key);

  @override
  State<MySliverAppBar> createState() => _MySliverAppBarState();
}

class _MySliverAppBarState extends State<MySliverAppBar> {
  final _expandedHeight = 280.0;
  final starBucksMenu = [
    'Hot Coffees',
    'Hot Teas',
    'Hot Drinks',
    'Frappuccino® Blended Beverages',
    'Cold Coffees',
    'Iced Teas',
    'Cold Drinks',
  ];

  @override
  Widget build(BuildContext context) {
    const _flexSpaceOverflow = kToolbarHeight;
    final _cardHeight = _expandedHeight -
        _flexSpaceOverflow -
        MediaQuery.of(context).viewPadding.top -
        kToolbarHeight;
    final _collapsedHeight =
        _cardHeight + MediaQuery.of(context).viewPadding.top - kToolbarHeight;
    return DefaultTabController(
      length: starBucksMenu.length,
      child: SliverAppBar(
        stretch: true,
        pinned: true,
        expandedHeight: _expandedHeight,
        backgroundColor: Colors.black,
        collapsedHeight: _collapsedHeight,
        flexibleSpace: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            final FlexibleSpaceBarSettings settings =
                context.dependOnInheritedWidgetOfExactType<
                    FlexibleSpaceBarSettings>()!;
            final List<Widget> children = <Widget>[];
            final double deltaExtent = settings.maxExtent - settings.minExtent;
            // 0.0 -> Expanded
            // 1.0 -> Collapsed to toolbar
            final double t = (1.0 -
                    (settings.currentExtent - settings.minExtent) / deltaExtent)
                .clamp(0.0, 1.0);
            final switchLimit = t < 0.9;
            children.add(
              Column(
                children: [
                  Expanded(
                    child: SizedBox(
                      child: Image.network(
                        'https://hrinsider-v2.vietnamworks.com//wp-content/uploads/2022/05/shutterstock_1072863746-1.jpg',
                        fit: BoxFit.cover,
                        width: double.infinity,
                        height: double.infinity,
                      ),
                    ),
                  ),
                  Container(
                    height: _flexSpaceOverflow,
                    color: Theme.of(context).scaffoldBackgroundColor,
                  )
                ],
              ),
            );
            children.add(
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: EdgeInsets.only(
                    left: 24 * (1 - t),
                    right: 24 * (1 - t),
                  ),
                  child: Container(
                    height: _cardHeight,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(4),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset:
                              const Offset(0, 2), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(
                        top: 14 + MediaQuery.of(context).viewPadding.top * t,
                        left: 24,
                        bottom: 12,
                        right: 24,
                      ),
                      child: LayoutBuilder(builder: (context, constraint) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: EdgeInsets.only(left: 24 * t),
                              width: (constraint.maxWidth * 2 / 3) * (1 - t) +
                                  constraint.maxWidth * t,
                              child: Text(
                                "Amerigo Italian Restaurant",
                                style: const TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.w400,
                                ),
                                textScaleFactor: max(0.8, 1 - t),
                              ),
                            ),
                            const Spacer(),
                            AnimatedSwitcher(
                              duration: const Duration(milliseconds: 300),
                              child: switchLimit
                                  ? Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Text(
                                          "Breakfast and Brunch • Italian • \$\$",
                                          style: TextStyle(
                                            fontSize: 12,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Row(
                                          children: const [
                                            Icon(Icons.access_time),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Text(
                                              "30-40 MIN",
                                              style: TextStyle(
                                                fontSize: 12,
                                              ),
                                            ),
                                            SizedBox(width: 16),
                                            Text(
                                              '4.6',
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 12.0,
                                              ),
                                            ),
                                            Icon(
                                              Icons.star,
                                              color: Colors.yellow,
                                              size: 20,
                                            ),
                                            Text(
                                              '(500+)',
                                              style: TextStyle(
                                                color: Colors.grey,
                                                fontSize: 12.0,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    )
                                  : TabBar(
                                      isScrollable: true,
                                      unselectedLabelColor: Colors.black,
                                      tabs: starBucksMenu.map((e) {
                                        return Tab(
                                          text: e,
                                        );
                                      }).toList(),
                                      indicator: const BubbleTabIndicator(
                                          indicatorHeight: 30.0,
                                          indicatorColor: Colors.black,
                                          tabBarIndicatorSize:
                                              TabBarIndicatorSize.tab,
                                          insets: EdgeInsets.all(1),
                                          padding: EdgeInsets.all(10)),
                                    ),
                            ),
                          ],
                        );
                      }),
                    ),
                  ),
                ),
              ),
            );
            children.add(
              Positioned(
                top: MediaQuery.of(context).viewPadding.top,
                left: 0,
                child: Material(
                  color: Colors.transparent,
                  child: IconButton(
                    icon: const Icon(Icons.arrow_back),
                    color: !switchLimit ? Colors.black : Colors.white,
                    onPressed: () {},
                  ),
                ),
              ),
            );
            return Stack(
              children: children,
            );
          },
        ),
      ),
    );
  }
}
