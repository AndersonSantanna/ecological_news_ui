import 'package:flutter/material.dart';

class NewsBrazilScene extends StatelessWidget {
  const NewsBrazilScene({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<ListItem> items = List<ListItem>.generate(
      1000,
      (i) => MessageItem("Notice $i", "Message body $i"),
    );
    return Container(
      color: Colors.white,
      child: ListView.builder(
        // Let the ListView know how many items it needs to build.
        itemCount: items.length,
        // Provide a builder function. This is where the magic happens.
        // Convert each item into a widget based on the type of item it is.
        itemBuilder: (context, index) {
          final item = items[index];

          return ListTile(
            title: item.buildTitle(context),
            subtitle: item.buildSubtitle(context),
          );
        },
      ),
      // Text("teste")
    );
  }
}

abstract class ListItem {
  /// The title line to show in a list item.
  Widget buildTitle(BuildContext context);

  /// The subtitle line, if any, to show in a list item.
  Widget buildSubtitle(BuildContext context);
}

/// A ListItem that contains data to display a message.
class MessageItem implements ListItem {
  final String sender;
  final String body;

  MessageItem(this.sender, this.body);

  Widget buildTitle(BuildContext context) => Text(sender);

  Widget buildSubtitle(BuildContext context) => Text(body);
}
