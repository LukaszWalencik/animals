import 'dart:async';

import 'package:animals/features/favorites_firebase/cubit/favoritesfirebase_state.dart';
import 'package:animals/repository/favorite_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoritesFirebaseCubit extends Cubit<FavoritesFirebaseState> {
  FavoritesFirebaseCubit(
    this._animalsFirebaseRepository,
  ) : super(const FavoritesFirebaseState(
          favoriteAnimal: [],
          errorMessage: '',
          isLoading: false,
        ));

  final AnimalsFirebaseRepository _animalsFirebaseRepository;
  StreamSubscription? _streamSubscription;

  Future<void> start() async {
    emit(
      const FavoritesFirebaseState(
          favoriteAnimal: [], isLoading: true, errorMessage: ''),
    );

    _streamSubscription =
        _animalsFirebaseRepository.getAnimalsStream().listen((favoriteAnimal) {
      emit(FavoritesFirebaseState(
          favoriteAnimal: favoriteAnimal, isLoading: false, errorMessage: ''));
    })
          ..onError((error) {
            emit(
              FavoritesFirebaseState(
                favoriteAnimal: const [],
                isLoading: false,
                errorMessage: error.toString(),
              ),
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
    start();
  }
}
