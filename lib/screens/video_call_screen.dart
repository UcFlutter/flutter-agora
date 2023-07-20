import 'package:agora_uikit/agora_uikit.dart';
import 'package:flutter/material.dart';

class VideoCallScreen extends StatefulWidget {
  const VideoCallScreen({super.key});

  @override
  State<VideoCallScreen> createState() => _VideoCallScreenState();
}

class _VideoCallScreenState extends State<VideoCallScreen> {
  final _client = AgoraClient(
    agoraConnectionData: AgoraConnectionData(
      appId: 'a6810f83c0c549aab473207134b69489',
      channelName: 'testChan',
      tempToken:
          '007eJxTYCiP+PPqUbH+lMxJmzQcmaaVnL61ce3FCkE7pvt3siU26okoMCSaWRgapFkYJxskm5pYJiYmmZgbGxmYGxqbJJlZmlhYVhzckdIQyMjgU3GUmZEBAkF8DoaS1OIS54zEPAYGANzHIMs=',
      uid: 12,
    ),
  );

  Future<void> _initializeAgora() async {
    await _client.initialize();
  }

  @override
  void initState() {
    _initializeAgora();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
        ),
        body: SafeArea(
          child: Stack(
            children: [
              AgoraVideoViewer(
                client: _client,
                showNumberOfUsers: true,
                layoutType: Layout.floating,
              ),
              AgoraVideoButtons(client: _client)
            ],
          ),
        ),
      ),
    );
  }
}
