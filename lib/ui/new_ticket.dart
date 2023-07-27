import 'package:cards_store/controller/my_tickets_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cards_store/resources/translation_keys.dart' as translations;

class NewTicket extends GetWidget<MyTicketsController> {
  static var name = "/MyTickets/NewTicket";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 10,
        title: Text(translations.newString.tr),
      ),
      body: ListView(
        children: [

        ],
      ),
    );
  }
}
