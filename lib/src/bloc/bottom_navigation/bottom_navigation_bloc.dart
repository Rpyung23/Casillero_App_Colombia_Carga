import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'bottom_navigation_event.dart';
part 'bottom_navigation_state.dart';

class BottomNavigationBloc
    extends Bloc<BottomNavigationEvent, BottomNavigationState> {
  // BottomNavigationBloc() : super(PageLoading());
  BottomNavigationBloc() : super(PageLoading());

  int currentIndex = 0;

  @override
  Stream<BottomNavigationState> mapEventToState(
      BottomNavigationEvent event) async* {
    // if (event is AppStarted) {
    //   this.add(PageTapped(index: this.currentIndex));
    // }
    if (event is PageTapped) {
      this.currentIndex = event.index;
      yield CurrentIndexChanged(currentIndex: this.currentIndex);
      yield PageLoading();
    }
  }

  @override
  BottomNavigationState get initialState =>
      CurrentIndexChanged(currentIndex: 0);
}
