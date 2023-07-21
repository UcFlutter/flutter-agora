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
          '007eJxTYJArTuo5rG/wZoJ205uFjlseOuet8dzyLXPJs3ib6c7RmTMUGBLNLAwN0iyMkw2STU0sExOTTMyNjQzMDY1NkswsTSwsjXV3pTQEMjJE34tiZGSAQBCfg6EktbjEOSMxj4EBANJFIIA=+PPqUbH+007eJxTYJArTuo5rG/wZoJ205uFjlseOuet8dzyLXPJs3ib6c7RmTMUGBLNLAwN0iyMkw2STU0sExOTTMyNjQzMDY1NkswsTSwsjXV3pTQEMjJE34tiZGSAQBCfg6EktbjEOSMxj4EBANJFIIA=',
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
