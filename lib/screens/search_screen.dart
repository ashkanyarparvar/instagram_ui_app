import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff1C1F2E),
      body: SafeArea(
        child: CustomScrollView(slivers: [
          SliverToBoxAdapter(
            child: _getHeaderSearch(),
          ),
          SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            sliver: SliverGrid(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  return Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: FittedBox(
                        fit: BoxFit.cover,
                        child: Image.asset('images/item$index.png'),
                      ),
                    ),
                  );
                },
                childCount: 10,
              ),
              gridDelegate: SliverQuiltedGridDelegate(
                  crossAxisCount: 3,
                  mainAxisSpacing: 4,
                  crossAxisSpacing: 4,
                  repeatPattern: QuiltedGridRepeatPattern.inverted,
                  pattern: [
                    QuiltedGridTile(2, 1),
                    QuiltedGridTile(2, 2),
                    QuiltedGridTile(1, 1),
                    QuiltedGridTile(1, 1),
                    QuiltedGridTile(1, 1),
                  ]),
            ),
          ),
        ]),
      ),
    );
  }

  Widget _getHeaderSearch() {
    return Column(
      children: [
        Container(
          height: 46,
          margin: EdgeInsets.only(left: 18, right: 18, top: 12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(13),
            color: Color(0xff272B40),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              children: [
                Image.asset('images/icon_search.png'),
                SizedBox(
                  width: 15,
                ),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Search',
                      hintStyle: TextStyle(color: Colors.white),
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                    ),
                  ),
                ),
                SizedBox(
                  width: 15,
                ),
                Image.asset('images/icon_scan.png')
              ],
            ),
          ),
        ),
        _getStoryList(),
      ],
    );
  }
  // GridView.custom(
  //         gridDelegate: SliverQuiltedGridDelegate(
  //             crossAxisCount: 3,
  //             mainAxisSpacing: 4,
  //             crossAxisSpacing: 4,
  //             repeatPattern: QuiltedGridRepeatPattern.inverted,
  //             pattern: [
  //               QuiltedGridTile(2, 1),
  //               QuiltedGridTile(2, 2),
  //               QuiltedGridTile(1, 1),
  //               QuiltedGridTile(1, 1),
  //               QuiltedGridTile(1, 1),
  //             ]),
  //         childrenDelegate: SliverChildBuilderDelegate(
  //           childCount: 10,
  //           (context, index) {
  //             return Container(
  //               decoration: BoxDecoration(
  //                 borderRadius: BorderRadius.circular(10),
  //               ),
  //               child: ClipRRect(
  //                 borderRadius: BorderRadius.circular(10),
  //                 child: FittedBox(
  //                   fit: BoxFit.cover,
  //                   child: Image.asset('images/item$index.png'),
  //                 ),
  //               ),
  //             );
  //           },
  //         ),
  //       ),

  Widget _getStoryList() {
    return Container(
      height: 23,
      margin: EdgeInsets.symmetric(vertical: 20),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              color: Color(0xff272B40),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Center(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 18, vertical: 4),
                child: Text(
                  'Ashkan$index ',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                  ),
                ),
              ),
            ),
          );
        },
        itemCount: 10,
      ),
    );
  }
}
