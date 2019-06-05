import 'package:flutter/material.dart';
import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:flutter/foundation.dart';

class ChatPage extends StatefulWidget {
  final int toid;

  ChatPage({Key key, this.toid}) : super(key: key);

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _startSock();

  }
  var chat;
  final WebSocketChannel webSocketChannel = new IOWebSocketChannel.connect(
      'ws://hans.hanmaker.com/?token=czo2MDoiY2RjNE41NWl3VkF0RjZXaUxOZk5zUDhLelNzeDVjZGpnSUoxMDhOSGNoWTREbkdIelRKMVdNcGc3akZrIjs=&cli=android');

  _startSock() {
    new StreamBuilder(
      stream: webSocketChannel.stream,
      builder: (context, snapshot) {
        setState(() {
          chat = snapshot.data;
        });
//        return new Padding(
//          padding: const EdgeInsets.symmetric(vertical: 24.0),
//          child: new Text(snapshot.hasData ? '${snapshot.data}' : ''),
//        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('${widget.toid}'),
        ),
        body: Text('${chat}')
    );
  }

  @override
  void dispose() {
    webSocketChannel.sink.close();
    super.dispose();
  }
}
