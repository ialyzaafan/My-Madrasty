import 'package:flutter/material.dart';
import 'package:madrasty/models/subject.dart';
import 'package:madrasty/style/style.dart';
import 'package:madrasty/views/general/General.dart';

class WorkDetails extends StatefulWidget {
  final selectedWork;
  WorkDetails(this.selectedWork);
  @override
  _WorkDetailsState createState() => _WorkDetailsState();
}

class _WorkDetailsState extends State<WorkDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: mainColor),
        elevation: 0,
        backgroundColor: backgroundColor,
        title: Text(
          widget.selectedWork.title,
          style: titleStyle,
        ),
      ),
      backgroundColor: backgroundColor,
      body: SingleChildScrollView(
        child: containerPadding(
          Column(
            children: [
              Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: 10,
                            ),
                            Text('10/10/2020'),
                          ],
                        ),
                        ListTile(
                          contentPadding: EdgeInsets.only(top: 20, bottom: 20),
                          title: Text(
                            widget.selectedWork.title,
                            style: smallTitleStyle,
                          ),
                          subtitle: Text(
                            'Mr.' + widget.selectedWork.teacher.name,
                            style: paragraphStyle,
                          ),
                          leading: CircleAvatar(
                            backgroundColor: backgroundColor,
                            radius: 30,
                            child: Image.asset(widget.selectedWork.imgUrl),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          widget.selectedWork.descriptions,
                          style: paragraphStyle,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Note:' + widget.selectedWork.note,
                          style: paragraphStyle,
                        )
                      ],
                    ),
                  ),
                ),
              ),
              widget.selectedWork.type != SubjectType.Classwork &&
                      widget.selectedWork.type != SubjectType.Extra
                  ? Column(
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        buttonWithIcon(context, () {}, 'Upload File', false),
                        SizedBox(
                          height: 10,
                        ),
                        seconderyBtn(context, () {}, 'Mark as adone'),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.attach_file_outlined,
                              color: mainColor,
                              size: 30,
                            ),
                            Text(
                              'File Name',
                              style: paragraphStyle,
                            )
                          ],
                        )
                      ],
                    )
                  : Container()
            ],
          ),
        ),
      ),
    );
  }
}
