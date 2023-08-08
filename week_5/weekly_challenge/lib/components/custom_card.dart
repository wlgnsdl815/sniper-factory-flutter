import 'package:flutter/material.dart';
import 'package:weekly_challenge/models/email_model.dart';

class CustomCard extends StatefulWidget {
  final Function(DismissDirection) onDismissed;
  final Email emailData;

  const CustomCard({
    super.key,
    required this.emailData,
    required this.onDismissed,
  });

  @override
  State<CustomCard> createState() => _CustomCardState();
}

class _CustomCardState extends State<CustomCard> {
  bool isRead = false;

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      // 왼쪽으로 슬라이드
      direction: DismissDirection.endToStart,
      onDismissed: widget.onDismissed,
      background: Container(
        width: 30,
        color: Colors.red[400],
        child: Icon(
          Icons.delete_outline,
          color: Colors.white,
          size: 60.0,
        ),
      ),
      // 유니크한 키를 가져야한다
      key: Key(widget.emailData.emailNo.toString()),
      child: InkWell(
        onTap: () {
          setState(() {
            isRead = !isRead;
          });
        },
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Row(
                  children: [
                    isRead
                        ? SizedBox(
                            width: 8.0,
                          )
                        : CircleAvatar(
                            radius: 4,
                            backgroundColor: Colors.green,
                          ),
                    SizedBox(
                      width: 8.0,
                    ),
                    Text(
                      widget.emailData.from,
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Expanded(child: SizedBox()),
                    Text(
                      widget.emailData
                          .DateFormatting(widget.emailData.sendDate),
                      style: TextStyle(fontSize: 18, color: Colors.grey),
                    ),
                    SizedBox(
                      width: 8.0,
                    ),
                    Icon(
                      Icons.star,
                      color: Colors.grey,
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                            width: 30,
                            height: 16,
                            decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(
                                32.0,
                              ),
                            ),
                            child: Text(
                              'TO',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          SizedBox(width: 8.0),
                          Text(
                            widget.emailData.title,
                            style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 30),
                      Text(
                        widget.emailData.detail,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(color: Colors.grey[700]),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
