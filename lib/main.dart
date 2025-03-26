import 'package:camera/camera.dart';
import 'package:face_condition_detection/camera_screen.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final cameras = await availableCameras();

  // // Print all available cameras
  // for (var camera in cameras) {
  //   debugPrint("Camera: ${camera.name}");
  // }

  runApp(MainApp(cameras: cameras));
}

class MainApp extends StatefulWidget {
  final List<CameraDescription> cameras;

  const MainApp({super.key, required this.cameras});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  late CameraDescription camera;
  int count = 1;

  @override
  void initState() {
    super.initState();
    camera = widget.cameras.first;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Column(
          children: [
            const SizedBox(height: 30),

            Center(child: CameraScreen(camera: camera)),
            const SizedBox(height: 10),
            FloatingActionButton(
              child: Icon(Icons.flip_camera_android),
              onPressed: () {
                if (camera == widget.cameras.first) {
                  debugPrint("hereee ");
                  setState(() {
                    camera = widget.cameras.last;
                  });
                } else {
                  debugPrint("hereee wuhoo");
                  setState(() {
                    camera = widget.cameras.first;
                  });
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
