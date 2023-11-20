import 'package:demo_application/consts/colors.dart';
import 'package:demo_application/consts/images.dart';
import 'package:demo_application/consts/utils.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        actions: const [
          Icon(
            Icons.more_vert_rounded,
            color: Colors.white,
          )
        ],
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 8,
        ),
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(16),
            )),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                ),
                child: Row(
                  children: [
                    Expanded(
                        child: RichText(
                            text: const TextSpan(
                      children: [
                        TextSpan(
                          text: 'Username\n',
                          style: TextStyle(
                            fontFamily: semiBold,
                            fontSize: 16,
                            color: textColor,
                          ),
                        ),
                        TextSpan(
                          text: 'Last seen',
                          style: TextStyle(
                            fontFamily: semiBold,
                            fontSize: 12,
                            color: greyColor,
                          ),
                        ),
                      ],
                    ))),
                    const CircleAvatar(
                      backgroundColor: btnColor,
                      child: Icon(
                        Icons.video_call_rounded,
                        color: Colors.white,
                      ),
                    ),
                    10.widthBox,
                    const CircleAvatar(
                      backgroundColor: btnColor,
                      child: Icon(
                        Icons.call,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              30.heightBox,
              ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 20,
                  itemBuilder: (context, index) {
                    return Directionality(
                      textDirection:
                          index.isEven ? TextDirection.rtl : TextDirection.ltr,
                      child: Container(
                        padding: const EdgeInsets.only(bottom: 8),
                        child: Row(
                          children: [
                            CircleAvatar(
                              backgroundColor:
                                  index.isEven ? textColor : btnColor,
                              child: Image.asset(
                                ic_user,
                                color: Colors.white,
                              ),
                            ),
                            20.widthBox,
                            Expanded(
                              child: Directionality(
                                textDirection: TextDirection.ltr,
                                child: Container(
                                  padding: const EdgeInsets.all(12),
                                  decoration: BoxDecoration(
                                    color: index.isEven ? bgColor : btnColor,
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: Directionality(
                                    textDirection: TextDirection.ltr,
                                    child: 'Hello, this is a dummy message...'
                                        .text
                                        .fontFamily(semiBold)
                                        .white
                                        .make(),
                                  ),
                                ),
                              ),
                            ),
                            20.widthBox,
                            Directionality(
                              textDirection: TextDirection.ltr,
                              child: '11:00AM'
                                  .text
                                  .color(greyColor)
                                  .size(12)
                                  .make(),
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
              10.heightBox,
              SizedBox(
                height: 40,
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: bgColor,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: TextFormField(
                          maxLines: 1,
                          style: const TextStyle(
                            color: Colors.white,
                            fontFamily: semiBold,fontSize: 12,
                          ),
                          decoration: const InputDecoration(
                            prefixIcon: Icon(
                              Icons.emoji_emotions_rounded,
                              color: greyColor,
                            ),
                            suffixIcon: Icon(
                              Icons.attachment_rounded,
                              color: greyColor,
                            ),
                            hintText: 'Type your message...',
                            hintStyle: TextStyle(
                              fontFamily: semiBold,
                              color: Colors.white,
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ),
                    ),
                    20.widthBox,
                    const CircleAvatar(
                      backgroundColor: btnColor,
                      child: Icon(
                        Icons.send,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
