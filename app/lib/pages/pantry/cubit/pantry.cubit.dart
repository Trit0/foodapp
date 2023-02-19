import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodapp/pages/pantry/cubit/pantry.state.dart';
import 'package:foodapp/repositories/pantry.repository.dart';
import 'package:nice_flutter_kit/nice_flutter_kit.dart';

class PantryCubit extends NiceBaseCubit<PantryState> {
  final PantryRepository _pantryRepository;
  static PantryCubit of(BuildContext context) => BlocProvider.of<PantryCubit>(context);

  PantryCubit(this._pantryRepository) : super(const PantryState.initialState());

  Future<void> init() async {
    loadPantryItems();
  }

  Future<void> loadPantryItems() async {
    final items = await _pantryRepository.getPantryItems();
    emit(state.copyWith(pantryItems: items));
  }
}
