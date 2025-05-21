import 'package:flutter/material.dart';

class AlbumTile extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  AlbumTile({required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      trailing: Icon(Icons.arrow_forward),
      onTap: onTap,
    );
  }
}