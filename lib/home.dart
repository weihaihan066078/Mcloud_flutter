import 'package:flutter/material.dart';
import 'utils.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var firstAreaImages = [];
  var secondAreaImages = [];
  var secondAreaTitle = [];
  var thirdAreaImages = [];

  void setUpData() {
    firstAreaImages = [
      'home_picture.png',
      'home_video.png',
      'home_audio.png',
      'home_doc.png'
    ];

    secondAreaImages = [
      'service_backup.png',
      'service_safe.png',
      'service_local.png',
      'service_clean.png',
      'service_download.png',
      'service_usb.png',
      'service_nvr.png',
      'service_dropbox.png',
    ];

    secondAreaTitle = [
      '手机备份',
      '保险箱',
      '已下载',
      '文件去重',
      '离线下载',
      '外部存储',
      'NVR',
      '第三方云',
    ];

    thirdAreaImages = ['home_moviewall.png','home_memory.png','home_recent.png'];

  }

  //area 1
  Container setFirstArea(double width) {

  List<Widget> list = [];

  for (var i = 0; i < firstAreaImages.length; i++) {
    // 你想分几列，就除以几， 高度可以进行自定义
    list.add(Container(
        height: 90,
        width: width / 2,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          // color: Colors.amber,
          image: DecorationImage(image: AssetImage('images/${firstAreaImages[i]}'),fit: BoxFit.cover)
        ),
      )
    );
  }

  return Container(
    padding: const EdgeInsets.all(0),
    // decoration: const BoxDecoration(color: Colors.red),
    child: Wrap(
      spacing: 12.5,
      runSpacing: 12.5,
      children: list,
    ),
  );
}
  
  //area 2
  Container setSecondArea(double width) {

    List<Widget> list = [];

    for (var i = 0; i < secondAreaImages.length; i++) {
      // 你想分几列，就除以几， 高度可以进行自定义
      list.add(
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 35,
              width: width / 4,
              decoration: const BoxDecoration(
               color: Colors.white,
              ),
              child: Image.asset('images/${secondAreaImages[i]}'),
            ),
            const SizedBox(height: 4,),
            Text(secondAreaTitle[i]),
            const SizedBox(height: 4,)
          ],
        )
        
      );
    }

    return Container(
      height: 200,
      padding: const EdgeInsets.fromLTRB(17.5, 10, 17.5, 0),
      decoration: BoxDecoration(color: ColorUtils.hexColor('#f9f9f9')),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            '工具',
            style: TextStyle(fontFamily: 'Medium',fontSize: 17,fontWeight: FontWeight.w600,color: ColorUtils.hexColor('#333333')),
          ),
          const SizedBox(height: 10,),
          Container(
            decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(7)),
            height: 150,
            padding: const EdgeInsets.fromLTRB(0, 4, 0, 4),
            child: Center(
              child: Wrap(children: list),
           ),
          )
          
        ],
      ),
    );
  }

  //area 3
  Container setThirdArea() {

    List<Widget> list = [];

    for (var i = 0; i < thirdAreaImages.length; i++) {
      list.add(
        Container(
          height: 137.5,
          padding: const EdgeInsets.all(0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            image: DecorationImage(image: AssetImage('images/${thirdAreaImages[i]}'),fit: BoxFit.cover)
          ),
          // child: Image.asset('images/${thirdAreaImages[i]}',fit: BoxFit.cover,),
        )
      );
      if (i != thirdAreaImages.length - 1) {
        list.add(
          const SizedBox(height: 15,)
        );
      }
    }
    return Container(
      padding: const EdgeInsets.fromLTRB(17.5, 17, 17.5, 0),
      // decoration: const BoxDecoration(color: Colors.black),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
          children: list,
        ),
    );
  }

  @override
  void initState() {
    super.initState();
    setUpData();
  }

  @override
  Widget build(BuildContext context) {

    var width = MediaQuery.of(context).size.width - 50;
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          elevation: 0,
          leading: TextButton(
              onPressed: () {},
              child: Text(
                'M1_63E0',
                style: TextStyle(
                    color: ColorUtils.hexColor('#333333'),
                    fontSize: 18,
                    fontWeight: FontWeight.w600),
              )),
          leadingWidth: 160,
          actions: [
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.search,
                  color: ColorUtils.hexColor('#333333'),
                )),
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.push_pin,
                  color: ColorUtils.hexColor('#333333'),
                ))
          ],
          backgroundColor: Colors.white,
        ),
        body: Container(
          padding: const EdgeInsets.all(0),
          child: ListView(
            shrinkWrap: true,
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  //area 1
                  Container(
                    // decoration: const BoxDecoration(color: Colors.amber),
                    height: 205,
                    padding: const EdgeInsets.all(5),
                    margin: const EdgeInsets.only(top: 10),
                    width: double.infinity,
                    child: Center(
                      child: setFirstArea(width),
                    ),
                  ),
                  
                  //area 2
                  setSecondArea(width),
                  //area 3
                  setThirdArea()
                ],
              )
            ],
          ),
        )
      ),
    );
  }
}
