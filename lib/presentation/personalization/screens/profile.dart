import 'package:flutter/material.dart';
import 'package:ubiqmerchant_version_2/core/constants/app_sizes.dart';
import 'package:ubiqmerchant_version_2/presentation/personalization/screens/widgets/profile_pic.dart';
import 'package:ubiqmerchant_version_2/presentation/personalization/screens/widgets/profilemenu_builder.dart';


class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: AppSizes.appBarHeight),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const ProfilePic(),
                      const Spacer(),
                      Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            RichText(text: TextSpan(
                                style: const TextStyle(
                                    color: Colors.black54
                                ),
                                children: [
                                  TextSpan(
                                    text: "Good Evening\n",
                                    style: const TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  TextSpan(
                                      text: "Yuvanraj Arumugam"),
                                ]
                            )),
                            Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  const Icon(Icons.call,color: Colors.black54),
                                  const SizedBox(width: 10),
                                  Text("+${91} ${8124612033}",
                                      style: const TextStyle(
                                          color: Colors.black54
                                      ))
                                ]),
                            Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  const Icon(Icons.email,color: Colors.black54),
                                  const SizedBox(width: 10),
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width/2.3,
                                    child: Text('yuvanraj@gmail.com',
                                      style: const TextStyle(
                                        color: Colors.black54,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  )
                                ]),
                            Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  const Icon(Icons.calendar_month,color: Colors.black54
                                  ),
                                  const SizedBox(width: 10),
                                  Text("24-12-2000",
                                      style: const TextStyle(
                                          color: Colors.black54)
                                  )
                                ]
                            )
                          ])
                    ]),
              ),
              const SizedBox(height: 20),
              const ProfileMenuBuilder()
            ])
    );
  }
}
