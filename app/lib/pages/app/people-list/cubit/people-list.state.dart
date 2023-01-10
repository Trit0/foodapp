// import 'package:flutter/cupertino.dart';
// import 'package:nice_flutter_kit/nice_flutter_kit.dart';
//
// import 'package:foodapp/api/base/people/models/people.model.dart';
//
// @immutable
// class PeopleListState extends NiceBaseState {
//   final List<PeopleModel>? people;
//   PeopleListState({required super.loading, required super.error, this.people});
//
//   const PeopleListState.initialState() : people = null, super.initialState();
//
//   PeopleListState copyWith({
//     bool? loading,
//     bool? error,
//     List<PeopleModel>? people,
//   }) {
//     return PeopleListState(loading: loading ?? this.loading, error: error ?? this.error, people: people ?? this.people);
//   }
//
//   @override
//   NiceBaseState copyWithLoadingAndError({bool? loading, bool? error}) {
//     return copyWith(loading: loading, error: error);
//   }
//
//   @override
//   List<Object?> get props => [
//     loading,
//     error,
//     people
//   ];
// }