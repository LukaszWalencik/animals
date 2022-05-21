import 'dart:async';

import 'package:animals/features/favorites_firebase/cubit/favoritesfirebase_state.dart';
import 'package:animals/repository/favorite_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoritesFirebaseCubit extends Cubit<FavoritesFirebaseState> {
  final AnimalsFirebaseRepository _animalsFirebaseRepository;

  FavoritesFirebaseCubit(this._animalsFirebaseRepository)
      : super(const FavoritesFirebaseInitial());
  StreamSubscription? _streamSubscription;

  Future<void> start() async {
    emit(const FavoritesFirebaseLoading());

    _streamSubscription =
        _animalsFirebaseRepository.getAnimalsStream().listen((favoriteAnimal) {
      emit(FavoritesFirebaseSuccess(favoriteAnimal: favoriteAnimal));
    })
          ..onError((error) {
            emit(
              const FavoritesFirebaseError(
                  message: 'Can\t load favorites from Firebase'),
            );
          });
  }

  @override
  Future<void> close() {
    _streamSubscription?.cancel();
    return super.close();
  }

  Future<void> delete({required String id}) async {
    await _animalsFirebaseRepository.remove(id: id);
  }
  // Future<void> delete({required int id}) async {
  //   await _animalsFirebaseRepository.remove(id: id);
  //   start();
  // }
}
