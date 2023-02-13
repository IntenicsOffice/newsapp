import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class Videos extends StatefulWidget {
  const Videos({Key? key}) : super(key: key);

  @override
  State<Videos> createState() => _VideosState();
}

class _VideosState extends State<Videos> {
  List<Widget> pages = [];
  late VideoPlayerController _controller;
  // ignore: prefer_final_fields
  late Future<void> _initializeVideoPlayerFuture;
  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(
      'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4',
    );

    _initializeVideoPlayerFuture = _controller.initialize();
    _controller.play();
    // _controller.setLooping(true);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // ignore: unnecessary_null_comparison
    return _controller.value == null
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : Scaffold(
            extendBodyBehindAppBar: true,
            appBar: AppBar(
              // centerTitle: true,
              toolbarHeight: 55,

              backgroundColor: Colors.transparent,
              // ignore: avoid_unnecessary_containers
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'यश भारत',
                    style: TextStyle(
                        fontSize: 25,
                        color: Color.fromARGB(255, 195, 9, 3),
                        fontWeight: FontWeight.bold),
                  ),
                  Container(
                    // width: 80,
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.grey),
                    child: const Text(
                      'पूरी खबर',
                    ),
                  ),
                ],
              ),
              elevation: 0,
            ),
            backgroundColor: const Color.fromARGB(197, 167, 167, 167),
            body: PageView.builder(
                onPageChanged: (int pages) {
                  print('Page changed to $pages');
                },
                itemCount: 10,
                scrollDirection: Axis.vertical,
                itemBuilder: ((context, index) {
                  return Container(
                    color: Colors.transparent,
                    child: Center(
                      child: FutureBuilder(
                        future: _initializeVideoPlayerFuture,
                        builder: (context, snapshot) {
                          return GestureDetector(
                            onTap: () {
                              if (_controller.value.isPlaying) {
                                setState(() {
                                  // pause
                                  if (_controller.value.isPlaying) {
                                    _controller.pause();
                                  } else {
                                    _controller.play();
                                  }
                                });
                              }
                            },
                            child: Center(
                              child: AspectRatio(
                                aspectRatio: _controller.value.aspectRatio,
                                child: VideoPlayer(_controller),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  );
                })),
            floatingActionButton: SizedBox(
              height: MediaQuery.of(context).size.height,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Column(
                    children: [
                      FloatingActionButton(
                        elevation: 0,
                        backgroundColor: Colors.transparent,
                        onPressed: () {},
                        child: const Icon(
                          Icons.favorite,
                          size: 30,
                        ),
                      ),
                      const Text(
                        "Like",
                        style: TextStyle(color: Colors.white),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Column(
                    children: [
                      FloatingActionButton(
                        elevation: 0,
                        backgroundColor: Colors.transparent,
                        onPressed: () {},
                        // icon
                        child: const Icon(
                          Icons.chat_rounded,
                          size: 30,
                        ),
                      ),
                      const Text(
                        'Comment',
                        style: TextStyle(color: Colors.white),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Column(
                    children: [
                      FloatingActionButton(
                        elevation: 0,
                        backgroundColor: Colors.transparent,
                        onPressed: () {},
                        // icon
                        child: const Icon(
                          Icons.bookmark,
                          size: 30,
                        ),
                      ),
                      const Text(
                        'save',
                        style: TextStyle(color: Colors.white),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Column(
                    children: [
                      FloatingActionButton(
                        elevation: 0,
                        backgroundColor: Colors.transparent,
                        onPressed: () {},
                        // icon
                        child: const Icon(
                          Icons.share,
                          size: 30,
                        ),
                      ),
                      const Text(
                        'Share',
                        style: TextStyle(color: Colors.white),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                ],
              ),
            ),
          );
  }
}
