import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodapp/pages/add_pantry_item/add_item.page.dart';
import 'package:foodapp/pages/pantry/cubit/pantry.cubit.dart';
import 'package:foodapp/pages/pantry/cubit/pantry.state.dart';
import 'package:foodapp/pages/pantry/widgets/ingredient-card/pantry_item_card.widget.dart';
import 'package:foodapp/repositories/pantry.repository.dart';

class PantryPage extends StatefulWidget {
  const PantryPage({super.key, this.title});
  final String? title;

  @override
  State<PantryPage> createState() => _PantryPageState();
}

class _PantryPageState extends State<PantryPage> {
  void _addItem() async {
    setState(() {
      Navigator.of(context).push(CupertinoPageRoute(builder: ((context) => const AddItemPage())));
      //AutoRouter.of(context).push(const AddItemPageRoute());
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<PantryCubit>(
      create: (context) => PantryCubit(
        PantryRepository.of(context),
      )..init(),
      child: SafeArea(
        child: CupertinoPageScaffold(
          child: BlocBuilder<PantryCubit, PantryState>(
            buildWhen: (prev, curr) => prev.pantryItems != curr.pantryItems,
            builder: (context, state) {
              return CustomScrollView(
                slivers: [
                  CupertinoSliverNavigationBar(
                    leading: CupertinoButton(
                      onPressed: () => {},
                      child: const Icon(CupertinoIcons.person_crop_circle),
                    ),
                    largeTitle: const Text('Pantry'),
                    trailing: CupertinoButton(
                      onPressed: _addItem,
                      child: const Icon(CupertinoIcons.add),
                    ),
                  ),
                  // This widget fills the remaining space in the viewport.
                  // Drag the scrollable area to collapse the CupertinoSliverNavigationBar.
                  CupertinoSliverRefreshControl(
                    onRefresh: () => PantryCubit.of(context).loadPantryItems(),
                  ),

                  if (state.pantryItems != null)
                    SliverPadding(
                      padding: const EdgeInsets.only(top: 10),
                      sliver: SliverGrid(
                        delegate: SliverChildBuilderDelegate(
                          (context, index) {
                            return PantryItemCard(state.pantryItems![index]);
                          },
                          childCount: state.pantryItems!.length,
                        ),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, childAspectRatio: 1.5),
                      ),
                    ),

                  // SliverFillRemaining(
                  //   child: Column(
                  //     mainAxisAlignment: MainAxisAlignment.start,
                  //     children: <Widget>[
                  //       BlocBuilder<PantryCubit, PantryState>(
                  //         builder: (context, state) {
                  //           return BaseList(
                  //             emptyState: const Text("Empty"),
                  //             data: state.pantryItems,
                  //             itemBuilder: (BuildContext context, int index) {
                  //               return PantryItemCard(state.pantryItems![index]);
                  //             },
                  //           );
                  //         },
                  //       ),
                  //     ],
                  //   ),
                  // ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
