import 'package:flutter/material.dart';
import 'package:musicapp2/models/song_model.dart';
import 'package:musicapp2/screens/home_screen.dart';
import 'package:musicapp2/screens/playlist_screen.dart';
import 'package:musicapp2/widgets/widgets.dart';
class Playlist {
  final String title;
  final List<Song> songs;
  final String imageUrl;

  Playlist(
  {
    required this.title,
    required this.songs,
    required this.imageUrl,
});
  static List<Playlist>playlists=[
    Playlist(title: 'James Arthur',
        songs: Song.song,
        imageUrl: 'assets/images/ab67616d00001e0220beb61f61fcbeb33b10a9ab.jpg'),
    Playlist(title: 'Miley Cyrus',
        songs: Song.song,
        imageUrl: 'assets/images/artworks-000228218397-2rmlbz-t500x500.jpg'),
    Playlist(title: 'Taylor Swift',
        songs: Song.song,
        imageUrl: 'assets/images/Taylor_Swift_-_Evermore.png')

  ];

}
