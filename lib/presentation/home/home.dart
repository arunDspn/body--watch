import 'package:flutter/material.dart';
import 'package:watcha_body/presentation/media_vault/vault_gallery/components/authenticator/view/vault_section.dart';
import 'package:watcha_body/presentation/media_vault/vault_gallery/components/gallery_view/vault_gallery_view.dart';
import 'package:watcha_body/presentation/overview/overview.dart';
import 'package:watcha_body/size_config.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  static const routeName = '/home';

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final screens = [
    const OverView(),
    const VaultSection(),
  ];
  int index = 0;
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: index,
        elevation: 0,
        unselectedItemColor: Theme.of(context).colorScheme.secondary,
        selectedItemColor: Theme.of(context).colorScheme.primary,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.list_alt_rounded,
              color: Theme.of(context).colorScheme.secondary,
            ),
            activeIcon: Icon(
              Icons.list_alt_rounded,
              color: Theme.of(context).colorScheme.primary,
              size: getProportionateScreenWidth(25),
            ),
            label: 'Overview',
          ),
          // BottomNavigationBarItem(
          //   icon: Icon(
          //     Icons.auto_graph_rounded,
          //     color: Theme.of(context).colorScheme.secondary,
          //   ),
          //   activeIcon: Icon(
          //     Icons.auto_graph_rounded,
          //     color: Theme.of(context).colorScheme.primary,
          //     size: getProportionateScreenWidth(25),
          //   ),
          //   label: 'Charts',
          // ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.photo_album_sharp,
              color: Theme.of(context).colorScheme.secondary,
            ),
            activeIcon: Icon(
              Icons.auto_graph_rounded,
              color: Theme.of(context).colorScheme.primary,
              size: getProportionateScreenWidth(25),
            ),
            label: 'Pictures',
          ),
        ],
        onTap: (index) {
          setState(() {
            this.index = index;
          });

          // if (index == 1) {
          //   Navigator.pushNamed(context, '/settings');
          // }§
        },
      ),
      body: SafeArea(
        // child: index == 0 ? const OverView() : VaultSection(),
        // child: screens[index],
        child: IndexedStack(
          index: index,
          children: screens,
        ),
      ),
    );
  }
}
