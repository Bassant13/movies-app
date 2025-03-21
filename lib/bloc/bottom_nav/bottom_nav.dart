import 'package:bloc/bloc.dart';
import '../states/bottom_nav/bottom_nav.dart';
class ButtomNavBloc extends Cubit<ButtomNavState> {
  ButtomNavBloc() : super(ButtomNavInitState());
  int currentIndex = 0;
  changePage(value) {
    currentIndex = value;
    emit(ButtomNavSuccessState());
  }
}
