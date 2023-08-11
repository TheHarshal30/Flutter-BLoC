// ignore_for_file: prefer_const_constructors

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'navigation_state.dart';

class NavigationCubit extends Cubit<NavigationState> {
  int index = 0;
  NavigationCubit() : super(NavigationState(index: 0)) {
    onPageChange();
  }
  onPageChange() {
    emit(PageChange(index: index));
  }
}
