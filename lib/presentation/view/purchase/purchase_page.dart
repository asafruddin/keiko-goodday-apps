import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:keiko_good_day/core/injection/di.dart';
import 'package:keiko_good_day/core/local_storage/shared_preferences.dart';
import 'package:keiko_good_day/core/utils/constant/key_constant.dart';
import 'package:keiko_good_day/domain/entity/shops_entity.dart';
import 'package:keiko_good_day/presentation/bloc/master_data_loader/master_data_loader_bloc.dart';
import 'package:keiko_good_day/presentation/view/purchase/widget/purchase_shop_list.dart';
import 'package:keiko_good_day/presentation/view/visit/local_widget/user_card.dart';

class PurchasePage extends StatefulWidget {
  const PurchasePage({Key? key}) : super(key: key);

  @override
  State<PurchasePage> createState() => _PurchasePageState();
}

class _PurchasePageState extends State<PurchasePage> {
  final _prefs = sl<SharedPrefs>();
  final _masterBloc = sl<MasterDataLoaderBloc>();

  @override
  Widget build(BuildContext context) {
    final idGrosir = _prefs.getInt(KeyConstant.keyUserId);
    return BlocProvider(
      create: (context) => _masterBloc..add(OnGetShopList(idGrosir!)),
      child: Scaffold(
          appBar: AppBar(
            title: Image.asset('assets/img_logo.png', height: 50),
            backgroundColor: Colors.transparent,
            elevation: 0,
            // actions: [
            //   IconButton(
            //       onPressed: () {},
            //       icon:
            //           Icon(Icons.search, color: Theme.of(context).primaryColor))
            // ],
          ),
          body: BlocBuilder<MasterDataLoaderBloc, MasterDataLoaderState>(
            builder: (context, state) {
              return RefreshIndicator(
                onRefresh: () => Future.sync(() => context
                    .read<MasterDataLoaderBloc>()
                    .add(OnGetShopList(idGrosir!))),
                child: ListView(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                  children: [
                    UserCard(),
                    const SizedBox(height: 10),
                    PurchaseShopList(
                        shops: state.shopEntity?.shops ?? <DataShopsEntity>[]),
                  ],
                ),
              );
            },
          )),
    );
  }
}
