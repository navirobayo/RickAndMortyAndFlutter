import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

// Import your EpisodeDataUiModel and EpisodesRepo here
import 'package:rick_and_morty_and_flutter/models/episode_data_ui_model.dart';
import 'package:rick_and_morty_and_flutter/repository/episodes_repo.dart';

part 'episodes_event.dart';
part 'episodes_state.dart';

class EpisodesBloc extends Bloc<EpisodesEvent, EpisodesState> {
  EpisodesBloc() : super(EpisodesInitial()) {
    on<EpisodesEventLoad>(episodesEventLoad);
  }

  FutureOr<void> episodesEventLoad(
      EpisodesEventLoad event, Emitter<EpisodesState> emit) async {
    emit(EpisodesFetchingLoading());
    List<EpisodeDataUiModel> episodes = await EpisodesRepo.getEpisodes();

    emit(EpisodesFetchingSuccess(episodes));
  }
}
