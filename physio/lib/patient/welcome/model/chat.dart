import 'package:flutter/material.dart';

class ChatMessage {
  String messageContent;
  String messageType;
  String time;

  final IconData;
  ChatMessage({
    required this.messageContent,
    required this.messageType,
    required this.IconData,
    required this.time,
  });
}

List<ChatMessage> messages = [
  ChatMessage(
      messageContent:
          "Hi Pramod, how is your left knee \npain? Hope you are sticking to the \nroutine we planed together?",
      IconData: Icons.done_all_rounded,
      time: "10:49 AM",
      messageType: "receiver"),
  ChatMessage(
    messageContent:
        "Hi Dr. Roma, knee pain has come \ndown. Yes I am sticking to routine.",
    messageType: "sender",
    IconData: Icons.done_all_rounded,
    time: "10:49 AM",
  ),
  ChatMessage(
    messageContent:
        "Your routine is coming close to end \ntowards the end of this week. Let’s \nplan your next steps forward.",
    messageType: "receiver",
    IconData: Icons.done_all_rounded,
    time: "10:49 AM",
  ),
  ChatMessage(
    messageContent: "That sounds great, let’s do it!",
    messageType: "sender",
    IconData: Icons.done_all_rounded,
    time: "10:49 AM",
  ),
  ChatMessage(
    messageContent:
        "Hi Pramod, how is your left knee \npain? Hope you are sticking to the \nroutine we planed together?",
    messageType: "receiver",
    IconData: Icons.done_all_rounded,
    time: "10:49 AM",
  ),
  ChatMessage(
    messageContent:
        "Hi Dr. Roma, knee pain has come \ndown. Yes I am sticking to routine.",
    messageType: "sender",
    IconData: Icons.done_all_rounded,
    time: "10:49 AM",
  ),
  ChatMessage(
    messageContent:
        "Hi Pramod, how is your left knee \npain? Hope you are sticking to the \nroutine we planed together?",
    messageType: "receiver",
    IconData: Icons.done_all_rounded,
    time: "10:49 AM",
  ),
  ChatMessage(
    messageContent:
        "Hi Dr. Roma, knee pain has come \ndown. Yes I am sticking to routine.",
    messageType: "sender",
    IconData: Icons.done_all_rounded,
    time: "10:49 AM",
  ),
];
