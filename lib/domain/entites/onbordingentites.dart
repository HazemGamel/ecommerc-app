

import 'package:equatable/equatable.dart';

class onbordingEntites extends Equatable {
  final String title;
  final String image;
  final String description;

 const onbordingEntites({
    required this.title,
    required this.image,
    required this.description}
);

  @override
  // TODO: implement props
  List<Object?> get props => [title,image,description];
//
//  @override
//  bool get stringify => false;
}