//import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:musicapp2/main.dart';
import 'package:musicapp2/widgets/section_header.dart';
import 'package:musicapp2/widgets/Song_card.dart';
import 'package:musicapp2/models/song_model.dart';
import 'package:musicapp2/models/playlist_model.dart';
import 'package:musicapp2/widgets/widgets.dart';
import '../widgets/playlist_card.dart';
import 'package:musicapp2/widgets/playlist_card.dart';
class HomeScreen extends StatelessWidget{
  const HomeScreen({Key? key}): super(key:key);

  //get song => null;

  @override
  Widget build(BuildContext context){
    List<Song> songs= Song.song;
    List<Playlist>playlists=Playlist.playlists;
    return
      Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.deepPurple.shade800.withOpacity(0.8),
                Colors.deepPurple.shade200.withOpacity(0.8),
              ],
            )
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: const _CustomAppBar(),
          bottomNavigationBar: const _CustomNavBar(),
              body: SingleChildScrollView(
            child: Column(
              children: [
                const _DiscoverMusic(),
                _TrendingMusic(songs: songs),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [SectionHeader(title: 'Playlist'),
                    ListView.builder(
                      shrinkWrap: true,
                      padding: const EdgeInsets.only(top: 20),
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: playlists.length,
                        itemBuilder: ((context,index){
                          return PlaylistCard(playlists: playlists[index]);

              }
              )),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      );
  }
}


class _TrendingMusic extends StatelessWidget {
  const _TrendingMusic({
    super.key,
    required this.songs,
  });

  final List<Song> songs;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0,
      top: 20.0,
      bottom: 20.0,),
      child: Column(
        children:[
          const Padding(
            padding: const EdgeInsets.only(right: 20.0,
            ),
            child: SectionHeader(title : 'Trending Music'),
          ),
          const SizedBox(height: 20),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.27,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
                itemCount: songs.length,
                itemBuilder: (context,index){
                return SongCard(song: songs[index]);
                },
          ),
          ),
    ],
      ),
    );
  }
}


class SectionHeader extends StatelessWidget {

  const SectionHeader({
    Key? Key,
    required this.title,
    this.action='view more',
  });
  final String title;
  final String action;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(title,
      style: Theme.of(context).textTheme.headline6!.copyWith(
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),),
      Text(action,
      style: Theme.of(context)
      .textTheme
      .bodyLarge!
      .copyWith(color: Colors.white)),
    ],
                  );
  }
}

class _DiscoverMusic extends StatelessWidget {
  const _DiscoverMusic({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Welcome',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          const SizedBox(height: 5),
          Text('enjoy your favourite music',
            style: Theme.of(context)
                .textTheme
                .headline6!
                .copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          TextFormField(
            decoration: InputDecoration(
              isDense: true,
              filled: true,
              fillColor: Colors.white,
              hintText: 'Search',
              hintStyle: Theme.of(context)
                  .textTheme.bodyMedium!
                  .copyWith(color: Colors.grey.shade400),
              prefixIcon:
                Icon(Icons.search, color: Colors.grey.shade400),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15.0),
                borderSide: BorderSide.none,
              )
            ),
          )
        ],
      ),
    );
  }
}

class _CustomNavBar extends StatelessWidget {
  const _CustomNavBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.deepPurple.shade800,
      unselectedItemColor: Colors.white,
      selectedItemColor: Colors.white,
      showUnselectedLabels: false,
      showSelectedLabels: false,
        items:const[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label:'Home'),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_outline),
            label:'Favourites'),
          BottomNavigationBarItem(
            icon: Icon(Icons.play_circle_outline),
            label:'play'),
          BottomNavigationBarItem(
            icon: Icon(Icons.people_outline),
            label:'profile'),],);
  }
}
class _CustomAppBar extends StatelessWidget implements PreferredSizeWidget{
// class _CustomAppBar extends StatefulWidget {
  const _CustomAppBar({
    Key? Key,}) : super (key:Key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: const Icon(Icons.grid_view_rounded),
      actions: [
        Container(
          margin: const EdgeInsets.only(right: 20),
          child: const CircleAvatar(
            backgroundImage: AssetImage(
                'assets/images/76285a03af77ba88ec188d90f0ff4c79.jpg'
            ),
          ),
        )
      ],
    );

  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
