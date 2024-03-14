import 'package:flutter/material.dart';

class TableCalander extends StatelessWidget {
  const TableCalander({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Table(
      border: TableBorder.all(
        color: const Color.fromARGB(255, 240, 232, 232),
        width: 1,
        borderRadius: BorderRadius.circular(2),
      ),
      children: [
        for (int i = 0; i < 5; i++)
          TableRow(
            children: [
              for (int i = 0; i < 7; i++)
                const TableCell(
                  child: AspectRatio(
                    aspectRatio: 65 / 74,
                    child: Center(
                      child: Text('1'),
                    ),
                  ),
                ),
            ],
          ),
      ],
    );
  }
}
