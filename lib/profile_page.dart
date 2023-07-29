import 'package:cards_store/edit_profile_page.dart';
import 'package:cards_store/http/http_service.dart';
import 'package:cards_store/models/get_profile_response.dart';
import 'package:cards_store/preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controller/profile_controller.dart';

class ProfilePage extends StatefulWidget {
  static var name = "/profile";

  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late Future<GetProfileResponse?> userProfile;
  final profileController = Get.put(ProfileController());

  @override
  void initState() {
    super.initState();
    String userId = getLoginUser()?.data?.user?.id?.toString() ?? "0";
    print(userId);
    userProfile = profileController.getUserProfile(userId);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 10),
      child: SingleChildScrollView(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        physics: const ScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: GestureDetector(
            onTap: () {
              Get.toNamed(EditProfilePage.name);
            },
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: FutureBuilder<GetProfileResponse?>(
                future: userProfile,
                builder: (context, profile) {
                  var profileDetails = profile.data?.data;
                  if (profile.hasData) {
                    return Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      child: Column(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(top: 30),
                            width: 70,
                            height: 70,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              image: DecorationImage(
                                image: NetworkImage(
                                  "${HttpService.profileImageUrl}${profileDetails?.image}",
                                ),
                              ),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(top: 10),
                            child: Text(
                              "${profileDetails?.firstname} ${profileDetails?.lastname}",
                              style: const TextStyle(
                                fontSize: 18,
                              ),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(top: 10),
                            child: Text(
                              "${profileDetails?.email}",
                              style: const TextStyle(
                                fontSize: 18,
                              ),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(top: 10),
                            child: Text(
                              profileDetails?.mobile?.contains("+") == true
                                  ? "${profileDetails?.mobile}"
                                  : "+${profileDetails?.mobile}",
                              style: const TextStyle(
                                fontSize: 18,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          )
                        ],
                      ),
                    );
                  } else if (profile.hasError) {
                    Get.showSnackbar(const GetSnackBar(
                      message: "Error while fetching profile data",
                    ));
                  }
                  return const CircularProgressIndicator();
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
