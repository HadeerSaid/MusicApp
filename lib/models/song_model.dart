import 'package:musicapp2/screens/home_screen.dart';
class Song{
  final String title;
  final String description;
  final String url;
  final String coverUrl;





  Song(
  {
    required this.title,
    required this.description,
    required this.coverUrl,
    required this.url,
});

  static List<Song> song=[
    Song(title: 'evermore',
        description: 'evermore',
        coverUrl: 'assets/images/Taylor_Swift_-_Evermore.png',
        url: 'Taylor Swift - evermore (Official Lyric Video) ft. Bon Iver.mp3',
    ),
    Song(title: 'malibu',
      description: 'malibu',
      coverUrl: 'assets/images/artworks-000228218397-2rmlbz-t500x500.jpg',
      url: 'Miley Cyrus - Malibu (Lyrics).mp3',
    ),
    Song(title: 'cars outside',
      description: 'cars outside',
      coverUrl: 'assets/images/ab67616d00001e0220beb61f61fcbeb33b10a9ab.jpg',
      url: "James Arthur - Car's Outside.mp3",
    ),
  ];

}