import 'package:flutter/material.dart';

class TTabBar extends StatelessWidget {
  const TTabBar({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            isScrollable: true,
            dividerColor: Colors.transparent,
            labelColor: Colors.black,
            labelStyle:
                const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            indicator: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30),
            ),
            tabs: const [
              Tab(
                text: "🍿 Coming soon",
              ),
              Tab(
                text: "👀 Everyone's watching",
              ),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            Text("coming_soon"),
            Text("everyones_watching"),
          ],
        ),
      ),
    );
  }
}
