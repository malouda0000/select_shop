part of 'home_bloc.dart';

@immutable
sealed class HomeEvent {
// sealed class HomeEvent extends Equatable {
}

final class BottomNavBarTapdedEvent extends HomeEvent {
//  int tappdedPageNumber = 1;
  int tappdedPageNumber;

  BottomNavBarTapdedEvent({
    required this.tappdedPageNumber,
  });
}




final class HomeGetHomeCategoEvent extends HomeEvent {

}



// final class SetLanguageEvent extends HomeEvent {
//  final String languageCode;

//    SetLanguageEvent(this.languageCode);

//   @override
//   List<Object> get props => [languageCode];

// }