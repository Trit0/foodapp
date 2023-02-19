import 'package:flutter/cupertino.dart';
import 'package:foodapp/api/pantry/models/pantry_item.model.dart';
import 'package:nice_flutter_kit/nice_flutter_kit.dart';

@immutable
class PantryState extends NiceBaseState {
  final List<PantryItemsModel>? pantryItems;

  const PantryState({
    required super.loading,
    required super.error,
    required this.pantryItems,
  });

  const PantryState.initialState()
      : pantryItems = null,
        super.initialState();

  PantryState copyWith({
    bool? loading,
    bool? error,
    List<PantryItemsModel>? pantryItems,
  }) {
    return PantryState(
      loading: loading ?? this.loading,
      error: error ?? this.error,
      pantryItems: pantryItems ?? this.pantryItems,
    );
  }

  @override
  NiceBaseState copyWithLoadingAndError({bool? loading, bool? error}) {
    return copyWith(loading: loading, error: error);
  }

  @override
  List<Object?> get props => [
        loading,
        error,
        pantryItems,
      ];
}
