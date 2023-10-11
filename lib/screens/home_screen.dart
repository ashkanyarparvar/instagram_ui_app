import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:instagram_main_1/screens/share_bottomsheet.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff1C1F2E),
      appBar: AppBar(
        backgroundColor: Color(0xff1C1F2E),
        elevation: 0,
        title: Container(
          height: 24,
          width: 128,
          child: Image.asset('images/moodinger_logo.png'),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 18),
            child: Icon(Icons.message_rounded),
          ),
        ],
      ),
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: SizedBox(
                width: 120,
                height: 35,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xffF35383),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  onPressed: () {
                    showModalBottomSheet(
                        barrierColor: Colors.transparent,
                        backgroundColor: Colors.transparent,
                        context: context,
                        isScrollControlled: true,
                        builder: (BuildContext context) {
                          return Padding(
                            padding: EdgeInsets.only(
                              bottom: MediaQuery.of(context).viewInsets.bottom,
                            ),
                            child: DraggableScrollableSheet(
                              initialChildSize: 0.4,
                              minChildSize: 0.2,
                              maxChildSize: 0.7,
                              builder: (context, controler) {
                                return ShareBottomSheet(
                                  controller: controler,
                                );
                              },
                            ),
                          );
                        });
                  },
                  child: Text('open ButtomSheet'),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: _getStoryList(),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  return Column(
                    children: [
                      SizedBox(
                        height: 34,
                      ),
                      _getPostHeader(),
                      SizedBox(
                        height: 24,
                      ),
                      _getMainPost(),
                    ],
                  );
                },
                childCount: 4,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // SingleChildScrollView(
  //         child: Column(
  //           children: [
  //             SizedBox(
  //               height: 40,
  //               width: 150,
  //   child: ElevatedButton(
  //     style: ElevatedButton.styleFrom(
  //       primary: Color(0xffF35383),
  //       shape: RoundedRectangleBorder(
  //         borderRadius: BorderRadius.circular(15),
  //       ),
  //     ),
  //     onPressed: () {
  //       showModalBottomSheet(
  //           barrierColor: Colors.transparent,
  //           backgroundColor: Colors.transparent,
  //           context: context,
  //           isScrollControlled: true,
  //           builder: (BuildContext context) {
  //             return DraggableScrollableSheet(
  //               initialChildSize: 0.4,
  //               minChildSize: 0.2,
  //               maxChildSize: 0.7,
  //               builder: (context, controler) {
  //                 return ShareBottomSheet(
  //                   controller: controler,
  //                 );
  //               },
  //             );
  //           });
  //     },
  //     child: Text('open BottomSheet'),
  //   ),
  // ),
  // SizedBox(
  //               height: 120,
  //               child: ListView.builder(
  //                 scrollDirection: Axis.horizontal,
  //                 itemBuilder: ((context, index) {
  //                   return index == 0 ? _getAddStoryBox() : _getStoryBox();
  //                 }),
  //                 itemCount: 10,
  //               ),
  //             ),
  //             _getPostList(),
  //           ],
  //         ),
  Widget _getStoryList() {
    return Container(
      height: 120,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: ((context, index) {
          return index == 0 ? _getAddStoryBox() : _getStoryBox();
        }),
        itemCount: 10,
      ),
    );
  }

  Widget _getPostList() {
    return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: ((context, index) {
        return Column(
          children: [
            _getPostHeader(),
            SizedBox(
              height: 34,
            ),
            _getMainPost()
          ],
        );
      }),
      itemCount: 10,
    );
  }

  Widget _getMainPost() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 4),
      child: Container(
        height: 440,
        width: 394,
        child: Stack(
          alignment: AlignmentDirectional.bottomCenter,
          children: [
            Positioned(
              top: 0,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.asset('images/post_cover.png'),
              ),
            ),
            Positioned(
              top: 15,
              right: 15,
              child: Icon(
                Icons.video_collection_rounded,
                color: Colors.white,
              ),
            ),
            Positioned(
              bottom: 15,
              child: Container(
                width: 320,
                height: 46,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [
                      Color.fromRGBO(255, 255, 255, 0.5),
                      Color.fromRGBO(255, 255, 255, 0.2)
                    ],
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    children: [
                      Image.asset('images/icon_hart.png'),
                      SizedBox(
                        width: 8,
                      ),
                      Text(
                        '2.6 K',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(
                        width: 35,
                      ),
                      Image.asset('images/icon_comments.png'),
                      SizedBox(
                        width: 8,
                      ),
                      Text(
                        '1.5 K',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(
                        width: 35,
                      ),
                      Image.asset('images/icon_share.png'),
                      SizedBox(
                        width: 35,
                      ),
                      Image.asset('images/icon_save.png'),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _getPostHeader() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 17),
      child: Row(
        children: [
          DottedBorder(
            borderType: BorderType.RRect,
            radius: Radius.circular(12),
            padding: EdgeInsets.all(2),
            color: Color(0xffF35383),
            strokeWidth: 2,
            dashPattern: [10, 0],
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              child: Container(
                height: 44,
                width: 44,
                child: Container(
                  width: 40,
                  height: 40,
                  child: Image.asset('images/profile.png'),
                ),
              ),
            ),
          ),
          SizedBox(
            width: 12,
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'ashkanyarparvar',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'اشکان یارپرور برنامه نویس موبایل',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                ),
              ),
            ],
          ),
          Spacer(),
          Icon(
            Icons.menu_sharp,
            color: Colors.white,
          ),
        ],
      ),
    );
  }

  Widget _getAddStoryBox() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 12, horizontal: 8),
      child: Column(
        children: [
          Container(
            width: 64,
            height: 64,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
              // borderRadius: BorderRadius.circular(17),
            ),
            child: Padding(
              padding: EdgeInsets.all(2),
              child: Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                    color: Color(0xff1C1F2E), shape: BoxShape.circle
                    // borderRadius: BorderRadius.circular(15),
                    ),
                child: Image.asset('images/icon_plus.png'),
              ),
            ),
          ),
          SizedBox(
            height: 8,
          ),
          Text(
            ' your story',
            style: TextStyle(color: Colors.white),
          )
        ],
      ),
    );
  }

  Widget _getStoryBox() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5, vertical: 12),
      child: Column(
        children: [
          DottedBorder(
            borderType: BorderType.Circle,
            // radius: Radius.circular(17),
            padding: EdgeInsets.all(2),
            color: Color(0xffF35383),
            dashPattern: [10, 0],
            strokeWidth: 2,
            child: ClipOval(
              // borderRadius: BorderRadius.all(Radius.circular(12)),
              child: Container(
                height: 58,
                width: 58,
                decoration: BoxDecoration(shape: BoxShape.circle),
                child: Image.asset('images/profile.png'),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            'ashkan',
            style: TextStyle(color: Colors.white),
          )
        ],
      ),
    );
  }
}
