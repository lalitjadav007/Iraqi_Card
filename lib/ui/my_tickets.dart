import 'package:cards_store/controller/my_tickets_controller.dart';
import 'package:cards_store/ui/new_ticket.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cards_store/resources/translation_keys.dart' as translations;

class MyTickets extends GetWidget<MyTicketsController> {
  static var name = "/MyTickets";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 10,
        title: Text(translations.supportTickets.tr),
        actions: [
          ElevatedButton(
              onPressed: () {
                Get.toNamed(NewTicket.name);
              }, child: Text(translations.newString.tr)),
          SizedBox(
            width: 16,
          )
        ],
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return Card(
            margin: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text("Ticket #", style: Theme.of(context).textTheme.titleMedium,),
                      Spacer(),
                      Text("19 minutes ago", style: Theme.of(context).textTheme.bodyMedium,),
                    ],
                  ),
                  Text("hello", style: Theme.of(context).textTheme.bodyMedium,),
                  Divider(),
                  Row(
                    children: [
                      Text("Customer reply", style: Theme.of(context).textTheme.bodyMedium,),
                      Spacer(),
                      Text("High", style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: Colors.red),),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
        itemCount: 10,
      ),
    );
  }
}
