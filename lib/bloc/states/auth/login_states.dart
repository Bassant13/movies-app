abstract class LogInStates {}
class LogInInitState extends LogInStates {}
class LogInLoadingState extends LogInStates {}
class LogInErrorState extends LogInStates {
  LogInErrorState(String s);
}
class LogInSuccessState extends LogInStates {}
