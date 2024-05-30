import 'package:flutter/material.dart';

import '../../../../core/utils/app_text.dart';
import '../widgets/query_news_widget.dart';
import '../widgets/source_details_list.dart';

class ExplorePage extends StatefulWidget {
  const ExplorePage({super.key});

  @override
  State<ExplorePage> createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AppText(
          text: 'Explore',
          textStyle: Theme.of(context).textTheme.titleMedium,
          textSize: 25,
        ),
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: TabBar(
                controller: _tabController,
                dividerColor: Theme.of(context).scaffoldBackgroundColor,
                tabs: const [
                  Text('News'),
                  Text('Topics'),
                  Text('Sources'),
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Expanded(
              child: TabBarView(controller: _tabController, children: [
                QueryNewsWidget(),
                QueryNewsWidget(),
                SourceDetailsList(),
              ]),
            )
          ],
        ),
      )),
    );
  }
}
