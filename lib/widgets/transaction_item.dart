import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class TransactionItem extends StatelessWidget {
  const TransactionItem({
    Key key,
    @required this.transaction,
    @required this.deleteTx,
  }) : super(key: key);

  final Transaction transaction;
  final Function deleteTx;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: EdgeInsets.symmetric(
        vertical: 8,
        horizontal: 5,
      ),
      child: ListTile(
        leading: CircleAvatar(
          radius: 30,
          child: Padding(
            padding: EdgeInsets.all(6),
            child: FittedBox(
              child: Text('Rs.${transaction.amount}'),
            ),
          ),
        ),
        title: Text(
          transaction.title,
          style: Theme.of(context).textTheme.headline6,
        ),
        subtitle: Text(
          DateFormat.yMMMd().format(transaction.date),
        ),
        trailing: MediaQuery.of(context).size.width > 450
            ? TextButton.icon(
                style: ButtonStyle(
                    iconColor:
                        MaterialStatePropertyAll(Theme.of(context).errorColor),
                    foregroundColor: MaterialStateProperty.all(
                        Theme.of(context).errorColor)),
                onPressed: () => deleteTx(transaction.id),
                icon: Icon(Icons.delete_rounded),
                label: Text('Remove'),
              )
            : IconButton(
                icon: Icon(Icons.delete_rounded),
                onPressed: () => deleteTx(transaction.id),
                color: Theme.of(context).errorColor,
              ),
      ),
    );
  }
}
