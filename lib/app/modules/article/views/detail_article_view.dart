import 'package:flutter/material.dart';

import 'package:get/get.dart';

class DetailArticleView extends GetView {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DetailArticleView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'DetailArticleView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
