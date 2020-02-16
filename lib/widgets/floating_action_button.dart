import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/dice_list.dart';
import '../screen/add_dice_screen.dart';

class HomePageFAB extends StatelessWidget {
  const HomePageFAB({
    Key key,
    @required this.diceList,
  }) : super(key: key);

  final DiceList diceList;

  @override
  Widget build(BuildContext context) {
    const title = 'Add Dice';
    return FloatingActionButton.extended(
      icon: Icon(Icons.add),
      label: const Text(title),
      tooltip: title,
      onPressed: () {
        showModalBottomSheet<void>(
          context: context,
          isScrollControlled: true,
          builder: (context) => ChangeNotifierProvider.value(
            value: diceList,
            child: SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom),
                child: AddDiceScreen(),
              ),
            ),
          ),
        );
      },
    );
  }
}
