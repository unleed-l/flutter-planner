import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class TransactionItem extends StatelessWidget {
  const TransactionItem({
    Key? key,
    required this.themeContext,
    required this.tr,
    required this.onDelete,
  }) : super(key: key);

  final ThemeData themeContext;
  final Transaction tr;
  final void Function(String id) onDelete;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          10,
        ),
      ),
      margin: const EdgeInsets.symmetric(
        vertical: 8,
        horizontal: 5,
      ),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: themeContext.colorScheme.primary,
          radius: 30,
          child: Padding(
            padding: const EdgeInsets.all(6),
            child: FittedBox(
              child: Text(
                'R\$${tr.value}',
                style: const TextStyle(
                  fontFamily: 'Quicksand',
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ),
        title: Text(
          tr.title,
          style: themeContext.textTheme.headline6,
        ),
        subtitle: Text(
          DateFormat(DateFormat.YEAR_MONTH_DAY, 'pt_Br').format(tr.date),
          style: themeContext.textTheme.headline4,
        ),
        trailing: MediaQuery.of(context).size.width > 480
            ? TextButton.icon(
                onPressed: () => onDelete(tr.id),
                icon: Icon(
                  Icons.delete,
                  color: themeContext.colorScheme.secondary,
                ),
                label: Text(
                  'Excluir',
                  style: TextStyle(
                    color: themeContext.colorScheme.secondary,
                  ),
                ),
              )
            : IconButton(
                icon: const Icon(Icons.delete),
                onPressed: () => onDelete(tr.id),
                color: themeContext.colorScheme.secondary,
              ),
      ),
    );
  }
}
