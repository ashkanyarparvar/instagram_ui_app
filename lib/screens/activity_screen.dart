import 'package:flutter/material.dart';
import 'package:instagram_main_1/model/enums/activity_type_enum.dart';

class ActivityScreen extends StatefulWidget {
  const ActivityScreen({Key? key}) : super(key: key);

  @override
  State<ActivityScreen> createState() => _ActivityScreenState();
}

class _ActivityScreenState extends State<ActivityScreen>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff1C1F2E),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: 70,
              color: Color(0xff1C1F2E),
              child: TabBar(
                  controller: _tabController,
                  labelStyle: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  indicatorWeight: 3,
                  indicatorColor: Color(0xffF35383),
                  indicatorPadding: EdgeInsets.symmetric(horizontal: 20),
                  tabs: [
                    Tab(
                      text: 'Following',
                    ),
                    Tab(
                      text: 'You',
                    ),
                  ]),
            ),
            Expanded(
              child: TabBarView(controller: _tabController, children: [
                _getSampleList(),
                _getSampleList(),
              ]),
            ),
          ],
        ),
      ),
    );
  }

  Widget _getSampleList() {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.only(left: 30, top: 20),
            child: Text(
              'New',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              return _getRow(ActivityStatus.likes);
            },
            childCount: 2,
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.only(left: 30, top: 20),
            child: Text(
              'Today',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              return _getRow(ActivityStatus.followBack);
            },
            childCount: 5,
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.only(left: 30, top: 20),
            child: Text(
              'This Week',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              return _getRow(ActivityStatus.following);
            },
            childCount: 10,
          ),
        ),
      ],
    );
  }

  Widget _getRow(ActivityStatus status) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 18),
      child: Row(
        children: [
          Container(
            height: 6,
            width: 6,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Color(0xffF35383),
            ),
          ),
          SizedBox(
            width: 7,
          ),
          SizedBox(
            height: 40,
            width: 40,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: FittedBox(
                fit: BoxFit.cover,
                child: Image.asset('images/profile.png'),
              ),
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    'AshkanYarparvar',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Started following',
                    style: TextStyle(
                      color: Color(0xffC5C5C5),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    'you',
                    style: TextStyle(
                      color: Color(0xffC5C5C5),
                      fontSize: 12,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    '3min',
                    style: TextStyle(
                      color: Color(0xffC5C5C5),
                      fontSize: 10,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Spacer(),
          _getActionActivityRow(status)
        ],
      ),
    );
  }

  Widget _getActionActivityRow(ActivityStatus status) {
    switch (status) {
      case ActivityStatus.followBack:
        return ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: Color(0xffF35383),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(6),
            ),
          ),
          onPressed: () {},
          child: Text('Follow'),
        );

      case ActivityStatus.likes:
        return SizedBox(
          height: 40,
          width: 40,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: FittedBox(
              fit: BoxFit.cover,
              child: Image.asset('images/item8.png'),
            ),
          ),
        );
      case ActivityStatus.following:
        return OutlinedButton(
          style: OutlinedButton.styleFrom(
            side: BorderSide(
              color: Color(0xffC5C5C5),
              width: 2,
            ),
          ),
          onPressed: () {},
          child: Text(
            'Message',
            style: TextStyle(
              fontSize: 12,
              color: Color(0xffC5C5C5),
            ),
          ),
        );
      default:
        return OutlinedButton(
          style: OutlinedButton.styleFrom(
            side: BorderSide(
              color: Color(0xffC5C5C5),
              width: 2,
            ),
          ),
          onPressed: () {},
          child: Text(
            'Message',
            style: TextStyle(
              fontSize: 12,
              color: Color(0xffC5C5C5),
            ),
          ),
        );
    }
  }
}
