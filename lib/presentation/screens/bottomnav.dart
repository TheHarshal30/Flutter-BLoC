// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taskk/presentation/screens/notes.dart';

import '../../logic/cubit/cubit/navigation_cubit.dart';
import 'description.dart';
import 'home.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({super.key});

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavigationCubit, NavigationState>(
      builder: (context, state) {
        if (state is PageChange) {
          return Scaffold(
              body: Stack(
            children: [
              IndexedStack(index: state.index, children: [
                Home(title: "Home Screen", color: Colors.blueAccent),
                Notes()
              ]),
              buildContent(state.index, context),
              Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Padding(
                    padding: const EdgeInsets.only(
                        bottom: 50.0, left: 100, right: 100),
                    child: Container(
                      height: MediaQuery.of(context).size.height / 14,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: BottomNavigationBar(
                          backgroundColor: Colors.black,
                          selectedItemColor: Colors.green[600],
                          unselectedItemColor: Colors.grey,
                          showSelectedLabels: false,
                          showUnselectedLabels: false,
                          currentIndex: state.index,
                          onTap: (index) {
                            context.read<NavigationCubit>().index = index;
                            context.read<NavigationCubit>().onPageChange();
                          },
                          items: [
                            BottomNavigationBarItem(
                                icon: Icon(
                                  Icons.home,
                                  size: 25,
                                ),
                                label: "Home"),
                            BottomNavigationBarItem(
                                icon: Icon(
                                  Icons.list_alt_outlined,
                                  size: 25,
                                ),
                                label: "Description")
                          ],
                        ),
                      ),
                    ),
                  ))
            ],
          ));
        }
        return Container();
      },
    );
  }

  Widget buildContent(int idx, BuildContext context) {
    switch (idx) {
      case 0:
        return Home(
          title: "Home Screen",
          color: Colors.blueAccent,
        );
      case 1:
        return Notes();
      default:
        return Home(
          title: "Home Screen",
          color: Colors.blueAccent,
        );
    }
  }
}
