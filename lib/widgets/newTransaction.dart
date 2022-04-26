import "package:flutter/material.dart";

class NewTransaction extends StatefulWidget {
  final Function addFunction;
  NewTransaction(this.addFunction);

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();

  final amountController = TextEditingController();

  void submitData() {
    final enteredTitle = titleController.text;
    final enteredAmount = double.parse(amountController.text);
    if (enteredTitle.isEmpty || enteredAmount <= 0) {
      return;
    }
    widget.addFunction(enteredTitle, enteredAmount);
    Navigator.of(context).pop();
  }

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
                  keyboardType: TextInputType.number,
                  onSubmitted: (_) => submitData(),
                ),
                Container(
                  height:70,
                  child:Row(children: <Widget>[
                  Text("No Date Chosen!"),
                  FlatButton(
                    textColor: Theme.of(context).primaryColor,
                    onPressed: () {}, 
                    child: Text("Choose Date",
                    style: TextStyle(fontWeight: FontWeight.bold)
                    ))
                ]),),
                RaisedButton(
                  onPressed: () {
                    submitData();
                  },
                  color: Theme.of(context).primaryColor,
                  child: Text("Add Transaction"),
                  textColor: Theme.of(context).textTheme.button.color,
                ),
              ],
            )));
  }
}
