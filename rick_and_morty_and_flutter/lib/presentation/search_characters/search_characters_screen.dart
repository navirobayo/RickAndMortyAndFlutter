import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty_and_flutter/blocs/search_characters_bloc/bloc/search_characters_bloc.dart';
import 'package:rick_and_morty_and_flutter/presentation/search_result_detail_screen/search_result_detail_screen.dart';

//* Character search feature.

class SearchCharactersScreen extends StatefulWidget {
  const SearchCharactersScreen({Key? key}) : super(key: key);

  @override
  _SearchCharactersScreenState createState() => _SearchCharactersScreenState();
}

class _SearchCharactersScreenState extends State<SearchCharactersScreen> {
  final SearchCharactersBloc searchCharactersBloc = SearchCharactersBloc();
  bool hasQuery = false;

  @override
  void initState() {
    searchCharactersBloc.add(SearchCharactersEventLoad());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(24),
            child: Row(
              children: [
                GestureDetector(
                  child: Icon(Icons.arrow_back),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                Expanded(
                  child: TextField(
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(), hintText: 'Search ...'),
                    onChanged: (query) {
                      setState(() {
                        hasQuery = query.isNotEmpty;
                      });
                      searchCharactersBloc
                          .add(SearchCharactersEventLoad(query: query));
                    },
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: BlocConsumer<SearchCharactersBloc, SearchCharactersState>(
              bloc: searchCharactersBloc,
              listenWhen: (previous, current) =>
                  current is SearchCharactersState,
              buildWhen: (previous, current) =>
                  current is! SearchCharactersActionState,
              listener: (context, state) {},
              builder: (context, state) {
                switch (state.runtimeType) {
                  case SearchCharactersFetchingLoading:
                    return hasQuery
                        ? const Center(child: CircularProgressIndicator())
                        : Center(child: Text('Cool Icon here - No search'));
                  case SearchCharactersFetchingError:
                    final errorState = state as SearchCharactersFetchingError;
                    return Center(child: Text(errorState.errorMessage));
                  case SearchCharactersFetchingSuccess:
                    final successState =
                        state as SearchCharactersFetchingSuccess;
                    return hasQuery
                        ? ListView.builder(
                            itemCount: successState.searchCharacters.length,
                            itemBuilder: (context, index) {
                              return ListTile(
                                title: Text(
                                    successState.searchCharacters[index].name),
                                subtitle: Text(successState
                                    .searchCharacters[index].species),
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          SearchResultDetailScreen(
                                              searchCharacter: state
                                                  .searchCharacters[index]),
                                    ),
                                  );
                                },
                              );
                            },
                          )
                        : Center(
                            child: Text("Cool Icon here - No search"),
                          );
                  default:
                    return Center(child: CircularProgressIndicator());
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
