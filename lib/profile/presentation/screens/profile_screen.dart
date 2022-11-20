import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurent_app/authentication/presentation/components/create_account.dart';
import 'package:restaurent_app/authentication/presentation/controller/bloc/user_bloc_bloc.dart';
import 'package:restaurent_app/authentication/presentation/controller/bloc/user_bloc_event.dart';
import 'package:restaurent_app/authentication/presentation/controller/bloc/user_bloc_state.dart';
import 'package:restaurent_app/authentication/presentation/screens/AuthenticationPage.dart';
import 'package:restaurent_app/injection_container.dart';
import 'package:restaurent_app/profile/presentation/components/row_container.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<UserBloc>()..add(const UserDetailsEvent()),
      child: Builder(builder: (context) {
        return Scaffold(
          backgroundColor: const Color(0xFFF6F6F6),
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(left: 24.0, right: 24, top: 60),
              child: Column(
                children: [
                  firstContainer(context),
                  const SizedBox(
                    height: 40,
                  ),
                  secondContainer(),
                  const SizedBox(
                    height: 12,
                  ),
                  thirdContainer(),
                  const SizedBox(
                    height: 40,
                  ),
                  forthContainer(context),
                  BlocListener<UserBloc, UserBlocState>(
                    listener: (context, state) {
                      if (state is SignOut) {
                        Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(
                                builder: (context) =>
                                    const Authenticationpage()),
                            (Route<dynamic> route) => false);
                      } else if (state is ErrorUserBlocState) {
                        log(state.message);
                      }
                    },
                    child: const SizedBox(
                      height: 40,
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}

Widget firstContainer(context) {
  return Container(
    width: double.infinity,
    height: 70,
    padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(11.0),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width: 44,
          height: 44,
          decoration:
              const BoxDecoration(color: Colors.black, shape: BoxShape.circle),
        ),
        BlocBuilder<UserBloc, UserBlocState>(
          builder: (context, state) {
            if (state is UserDetailsState) {
              return Padding(
                padding: const EdgeInsets.only(left: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      state.fullname,
                      style: const TextStyle(
                        fontSize: 16.0,
                        wordSpacing: 1.5,
                        letterSpacing: 1.5,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF374151),
                      ),
                      textAlign: TextAlign.start,
                    ),
                    const SizedBox(
                      height: 2,
                    ),
                    Text(
                      state.email,
                      style: const TextStyle(
                        fontSize: 10.0,
                        wordSpacing: 1.5,
                        letterSpacing: 1.5,
                        fontWeight: FontWeight.normal,
                        color: Color(0xFF6B7280),
                      ),
                      textAlign: TextAlign.start,
                    ),
                  ],
                ),
              );
            } else {
              return Container();
            }
          },
        ),
        Container(
          width: 40,
          height: 40,
          decoration: const BoxDecoration(
              color: Color(0xFFF9F9F9), shape: BoxShape.circle),
          child: const Icon(Icons.notifications),
        ),
      ],
    ),
  );
}

Widget secondContainer() {
  return Container(
    width: double.infinity,
    height: 70,
    padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(11.0),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        RichText(
          text: const TextSpan(
            style: TextStyle(
              fontSize: 18.0,
              wordSpacing: 1,
              letterSpacing: 1.2,
              fontWeight: FontWeight.normal,
              color: Color(0xFF374151),
            ),
            children: [
              WidgetSpan(
                child: Icon(
                  Icons.account_circle,
                  size: 24,
                ),
              ),
              TextSpan(
                text: "  Account setting",
              ),
            ],
          ),
        ),
        const Icon(Icons.edit_note_sharp)
      ],
    ),
  );
}

Widget thirdContainer() {
  return Container(
    width: double.infinity,
    height: 204,
    padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 24),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(11.0),
    ),
    child: Column(
      children: const [
        RowContainer(
          iconname: Icons.text_snippet_rounded,
          title: "Language",
        ),
        SizedBox(
          height: 20,
        ),
        RowContainer(
          iconname: Icons.chat,
          title: "Feedback",
        ),
        SizedBox(
          height: 20,
        ),
        RowContainer(
          iconname: Icons.star_outline_outlined,
          title: "Rate us",
        ),
        SizedBox(
          height: 20,
        ),
        RowContainer(
          iconname: Icons.arrow_circle_up,
          title: "Account version",
        ),
      ],
    ),
  );
}

Widget forthContainer(context) {
  return InkWell(
    onTap: () {
      BlocProvider.of<UserBloc>(context).add(const LogOutUserEvent());
    },
    child: Container(
      width: 111,
      height: 35,
      decoration: BoxDecoration(
        color: const Color(0xFFEB4646),
        borderRadius: BorderRadius.circular(11.0),
      ),
      child: Center(
        child: BlocBuilder<UserBloc, UserBlocState>(builder: (context, state) {
          if (state is LodingUserBlocState) {
            return const LoadingWidget();
          } else {
            return const Text(
              "Logout",
              style: TextStyle(
                fontSize: 16.0,
                wordSpacing: 1,
                letterSpacing: 1.2,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            );
          }
        }),
      ),
    ),
  );
}
