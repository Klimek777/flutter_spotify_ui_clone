import 'package:flutter/material.dart';
import 'package:flutter_spotify_ui/data/data.dart';

class SideMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: 280.0,
      color: Colors.black,
      child: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Image.asset(
                  'assets/spotify_logo.png',
                  height: 55.0,
                  filterQuality: FilterQuality.high,
                ),
              ),
            ],
          ),
          _sideMenuIconTab(
            iconData: Icons.home,
            title: 'Home',
            onTap: () {},
          ),
          _sideMenuIconTab(
            iconData: Icons.search,
            title: 'Search',
            onTap: () {},
          ),
          _sideMenuIconTab(
            iconData: Icons.audiotrack,
            title: 'Radio',
            onTap: () {},
          ),
          const SizedBox(
            height: 12.0,
          ),
          _LibraryPlayLists(),
        ],
      ),
    );
  }
}

class _sideMenuIconTab extends StatelessWidget {
  final IconData iconData;
  final String title;
  final VoidCallback onTap;
  const _sideMenuIconTab({
    Key? key,
    required this.iconData,
    required this.title,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      textColor: Colors.white,
      leading: Icon(
        iconData,
        color: Colors.white,
        size: 28.0,
      ),
      title: Text(
        title,
        overflow: TextOverflow.ellipsis,
      ),
      onTap: onTap,
    );
  }
}

class _LibraryPlayLists extends StatefulWidget {
  @override
  _LibraryPlayListsState createState() => _LibraryPlayListsState();
}

class _LibraryPlayListsState extends State<_LibraryPlayLists> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
        padding: const EdgeInsets.symmetric(vertical: 12.0),
        physics: const ClampingScrollPhysics(),
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 8.0,
                  horizontal: 16.0,
                ),
                child: Text(
                  'YOUR LIBRARY',
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(color: Colors.white),
                ),
              ),
              ...yourLibrary
                  .map(
                    (e) => ListTile(
                      textColor: Colors.white,
                      dense: true,
                      title: Text(
                        e,
                        overflow: TextOverflow.ellipsis,
                      ),
                      onTap: () {},
                    ),
                  )
                  .toList()
            ],
          ),
        ],
      ),
    );
  }
}
