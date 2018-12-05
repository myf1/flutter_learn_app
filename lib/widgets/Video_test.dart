import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class MyVideo extends StatefulWidget {
  @override
  _MyVideoState createState() => new _MyVideoState();
}

class _MyVideoState extends State<MyVideo> {
  VideoPlayerController _playerController;
  var _isPlaying = false;
  
  @override
  void initState() {
    super.initState();
    _playerController = VideoPlayerController.network("http://s3m.mediav.com/galileo/487144-89e68daaf1432c077d6d829f3fb3c672.mp4");
    
    _playerController.addListener((){
      final bool isPlaying = _playerController.value.isPlaying;
      if (isPlaying != _isPlaying) {
        setState(() {
          _isPlaying = isPlaying;
        });
      }
    });
    
    _playerController.initialize().then((_){
      setState(() {
        _playerController.play();
      });
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Video Test'),
      ),
      body: new Center(
        child: _playerController.value.initialized
        ? AspectRatio(aspectRatio: _playerController.value.aspectRatio,child: VideoPlayer(_playerController),)
        : new Container(
          width: MediaQuery.of(context).size.width,
          //高度
          height: 250.0,
          // 盒子样式
          decoration: new BoxDecoration(
            color: Colors.black,
            //设置Border属性给容器添加边框
            border: new Border.all(
              //为边框添加颜色
              color: Colors.black,
              width: 1.0, //边框宽度
            ),
          ),
          child: Center(child:new CircularProgressIndicator()),
        )
      ),
      floatingActionButton: FloatingActionButton(onPressed: 
      _playerController.value.isPlaying? _playerController.pause : _playerController.play
      ,child: Icon(_playerController.value.isPlaying?Icons.pause:Icons.play_arrow),),
      
    );
  }
}