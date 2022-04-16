import "package:flutter/material.dart";

class NewTransaction extends StatelessWidget {
  final titleController = TextEditingController();
  final amountController = TextEditingController();
  final Function addFunction;
  NewTransaction(this.addFunction);
  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 5,
        child: Container(
            padding: EdgeInsets.all(6),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                TextField(
                  autocorrect: true,
                  decoration: InputDecoration(labelText: "Title"),
                  controller: titleController,
                ),
                TextField(
                  autocorrect: true,
                  decoration: InputDecoration(labelText: "Amount"),
                  controller: amountController,
                ),
                FlatButton(
                  onPressed: () {
                    addFunction(titleController.text.toString(), double.parse(amountController.text));
                  },
                  child: Text("Add Transaction"),
                  textColor: Colors.blueAccent,
                ),
              ],
            )));
  }
}
