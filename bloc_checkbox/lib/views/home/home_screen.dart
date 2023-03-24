import 'package:bloc_example_app/blocs/bloc_status.dart';
import 'package:bloc_example_app/blocs/home/home_bloc.dart';
import 'package:bloc_example_app/blocs/home/home_event.dart';
import 'package:bloc_example_app/blocs/home/home_state.dart';
import 'package:bloc_example_app/repository/home/home_repository.dart';
import 'package:bloc_example_app/src/app_strings.dart';
import 'package:bloc_example_app/views/home/widgets/app_drawer.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(AppStrings.appBarText)),
      drawer: const AppDrawer(),
      body: BlocProvider(
        create: (context) => HomeBloc(homeRepo: HomeRepository()),
        child: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            if (state.appStatus == const InitialStatus()) {
              context.read<HomeBloc>().add(HomeGetCardData());
            }

            return state.appStatus is SubmissionLoading
                ? const Center(
                    child: CircularProgressIndicator(color: Colors.black))
                : Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: ListView.builder(
                      itemCount:
                          state.homeCardModel?.data.yogaTypes.length ?? 0,
                      itemBuilder: (context, index) {
                        return Card(
                          child: Column(
                            children: [
                              CachedNetworkImage(
                                  imageUrl: state.homeCardModel?.data
                                          .yogaTypes[index].image ??
                                      "",
                                  fit: BoxFit.fill),
                              Text(
                                state.homeCardModel?.data.yogaTypes[index]
                                        .name ??
                                    "",
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  );
          },
        ),
      ),
    );
  }
}
