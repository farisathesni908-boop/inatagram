import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:instagram/Repository/Api/Profile_Api.dart';
import 'package:instagram/UI/home.dart';
import 'package:instagram/UI/homepage.dart';
import 'package:instagram/UI/login.dart';
import 'package:instagram/bloc/highlight_stories_bloc.dart';
import 'package:instagram/bloc/highlights_bloc.dart';
import 'package:instagram/bloc/instagram_bloc.dart';
import 'package:instagram/bloc/instagram_event.dart';
import 'package:instagram/bloc/profile/bloc/profile_bloc.dart';
import 'package:instagram/bloc/profile/bloc/profile_event.dart';

const String basePath = 'https://instagram120.p.rapidapi.com/';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ProfileBloc(),
        ),
         BlocProvider(
          create: (context) => InstagramBloc(),
        ),
         BlocProvider(
          create: (context) =>  HighlightStoriesBloc(),

        ),
          BlocProvider(
          create: (context) =>  HighlightsBloc(),
            child: Home(user_name: "your_username"),
        ),
        //  BlocProvider(
        //   create: (context) => ProfileBloc()..add(LoadProfile()),
        // ),
        // BlocProvider(create: (context) => ProfileBloc()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),
        home: Login(),
      ),
    );
  }
}
