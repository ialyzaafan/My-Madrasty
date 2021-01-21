import 'package:flutter/material.dart';
import 'package:madrasty/models/installmentClass.dart';
import 'package:madrasty/style/style.dart';
import 'package:madrasty/views/general/General.dart';

class Installment extends StatelessWidget {
  final List<InstallmentClass> installmentsList;
  Installment(this.installmentsList);
  Widget _buildInstallmentState(double total, double paid) {
    if (paid == total) {
      return Row(
        children: [
          CircleAvatar(
            child: Icon(Icons.done, color: Colors.white),
            radius: 8,
            backgroundColor: mainColor,
          ),
          SizedBox(
            width: 5,
          ),
          Text('Paid')
        ],
      );
    } else if (paid < total) {
      return Row(
        children: [
          CircleAvatar(
            radius: 8,
            backgroundColor: Colors.red,
          ),
          SizedBox(
            width: 5,
          ),
          Text('Late')
        ],
      );
    } else
      return Container();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        title: Text(
          'Installment',
          style: titleStyle,
        ),
        iconTheme: IconThemeData(
          color: mainColor, //change your color here
        ),
        elevation: 0,
        backgroundColor: backgroundColor,
      ),
      body: containerPadding(
        ListView.builder(
            itemCount: installmentsList.length,
            itemBuilder: (BuildContext context, int index) {
              return Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
                child: Column(
                  children: [
                    ListTile(
                      contentPadding:
                          EdgeInsets.only(top: 10, left: 10, right: 10),
                      leading: CircleAvatar(
                        radius: 30,
                        backgroundColor: backgroundColor,
                        child: Image.asset(
                          installmentsList[index].imgURL,
                          fit: BoxFit.contain,
                        ),
                      ),
                      title: Text(
                        '${installmentsList[index].time.toLocal()}'
                            .split(' ')[0],
                        style: backgroundTextStyle,
                      ),
                      subtitle: Text(
                        installmentsList[index].title,
                        style: smallTitleStyle,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          bottom: 10, left: 90, right: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('L.E ${installmentsList[index].paid}'),
                          SizedBox(
                            height: 5,
                          ),
                          _buildInstallmentState(installmentsList[index].total,
                              installmentsList[index].paid)
                        ],
                      ),
                    ),
                  ],
                ),
              );
            }),
      ),
    );
  }
}
