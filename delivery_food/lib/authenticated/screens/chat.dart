import 'package:delivery_food/data/model/chat/group_chat.dart';
import 'package:delivery_food/provider/chat_provider.dart';
import 'package:delivery_food/provider/user_provider.dart';
import 'package:delivery_food/routes/chat_message_arg.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:delivery_food/components/reusable_card.dart';
import 'package:delivery_food/constans/app_stype.dart';
import 'package:delivery_food/widget/pattern.dart';

import '../../data/model/user.dart';
import '../../routes/route.dart';
import '../../widget/leading_button.dart';
import '../../widget/loading_view.dart';
import '../../widget/profile_buttom.dart';

class Chat extends StatefulWidget {
  const Chat({Key? key}) : super(key: key);

  @override
  State<Chat> createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  @override
  Widget build(BuildContext context) {
    ChatProvider chatProvider = Provider.of<ChatProvider>(context);
    UserProvider userProvider = Provider.of<UserProvider>(context);
    chatProvider.getAllChatInUser("${userProvider.user.id}");
    List<GroupChat> list = chatProvider.lisGroupchatInUser;
    User orner = User();

    User _getOrnerUser(GroupChat groupChat) {
      for (var user in userProvider.listUser) {
        if (groupChat.idUser1 == user.id || groupChat.idUser2 == user.id) {
          if (user.id != userProvider.user.id) {
            return user;
          }
        }
      }
      return User();
    }

    return Scaffold(
        extendBodyBehindAppBar: true,
        body: SafeArea(
            child: Pattern(
                child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                LeadingButton(onPress: () {}),
                const SizedBox(
                  width: 100,
                ),
                ProfileButtom(onPress: () {}),
              ],
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 20),
              child: Text(
                'Chat',
                style: kHeadingStyle,
              ),
            ),
            list.isEmpty
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : SizedBox(
                    height: MediaQuery.of(context).size.height * 0.5,
                    child: ListView.builder(
                      itemBuilder: (context, index) {
                        User orner = _getOrnerUser(list[index]);
                        chatProvider.getAllMessageInId("${list[index].id}");
                        return GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, RouteGenerator.chat,
                                arguments: ChatMessageArgument(
                                    idchat: "${list[index].id}",
                                    ornerUser: orner,
                                    listGroupMesgae:
                                        chatProvider.listGroupMesgae));
                          },
                          child: ReusableCard(
                            cardChild: ListTile(
                              leading:
                                  // Text("${list[index].id}+${orner.username}")
                                  Image.network(
                                orner.photoUrl == null
                                    ? 'https://icon-library.com/images/no-profile-picture-icon-female/no-profile-picture-icon-female-24.jpg'
                                    : orner.photoUrl!,
                                width: 62,
                                height: 62,
                              ),
                              title: Text(
                                orner.lastname!,
                                style: kSubTitleStyle,
                              ),
                              subtitle: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "hihihihih",
                                    style: kHintInputStyle,
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                ],
                              ),
                              trailing: Text(
                                "10.00",
                                style: kHintInputStyle,
                              ),
                            ),
                          ),
                        );
                      },
                      itemCount: list.length,
                    ),
                  )
          ],
        ))));
  }
}
