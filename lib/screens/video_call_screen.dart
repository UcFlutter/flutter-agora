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
      appId: 'adecb4f3dd7a452b99ea0c9f482f648f',
      channelName: 'testChannel',
      tempToken:
          '007eJxTYBB+Wbr8ueSdL7Xxl+8U31KSnxw9Wfv1LT89G7M5XL13/qkrMCSmpCYnmaQZp6SYJ5qYGiVZWqYmGiRbpplYGKWZmVikmfBPTWkIZGSos/dgZGSAQBCfm6EktbjEOSMxLy81h4EBAKkKItI=',
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
