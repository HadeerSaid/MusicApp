import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';
import 'package:musicapp2/screens/song_screen.dart';
import 'package:musicapp2/main.dart';
import 'package:musicapp2/widgets/section_header.dart';
import 'package:musicapp2/widgets/Song_card.dart';
import 'package:musicapp2/models/song_model.dart';
import 'package:musicapp2/models/playlist_model.dart';
import 'package:musicapp2/widgets/widgets.dart';
import '../widgets/playlist_card.dart';
import 'package:musicapp2/widgets/playlist_card.dart';
import '../models/song_model.dart';
import '../widgets/seekbar.dart';
import 'package:rxdart/rxdart.dart' as rxdart;
import 'package:musicapp2/screens/home_screen.dart';
import 'package:flutter/widgets.dart';

class SongScreen extends StatefulWidget {
  const SongScreen({Key? Key}) :super (key: Key);

  @override
  State<SongScreen> createState() => _SongScreenState();
}

class _SongScreenState extends State<SongScreen>{
  AudioPlayer audioPlayer = AudioPlayer();
  Song song= Get.arguments ?? Song.song[0];

  @override
  void initState(){
    super.initState();

    audioPlayer.setAudioSource(
      ConcatenatingAudioSource(
        children:[
          AudioSource.uri(
            Uri.parse('asset:///${song.url}'),),
          AudioSource.uri(
            Uri.parse('asset:///${Song.song[1].url}'),),
        ],
      ),

    );

  }

  @override
  void dispose(){
    audioPlayer.dispose();
    super.dispose();
  }

  Stream<SeekBarData> get _seekBarDataStream =>
      rxdart.Rx.combineLatest2<Duration,Duration?,SeekBarData>(
          audioPlayer.positionStream,
          audioPlayer.durationStream,
              (Duration position, Duration? duration,){
            return SeekBarData(position, duration?? Duration.zero,);
          }
      );
  @override
  Widget build (BuildContext context){



    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.transparent,
        elevation: 0,),
      extendBodyBehindAppBar: true,
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            song.coverUrl,
            fit: BoxFit.cover,
          ),
          const BackgroundFilter(),
          _MusicPlayer(
            song: song,
              seekBarDataStream: _seekBarDataStream,
              audioPlayer: audioPlayer),
        ],
      ),
    );
  }
}

class _MusicPlayer extends StatelessWidget {
  const _MusicPlayer({
    Key? key,
    required this.song,
    required Stream<SeekBarData> seekBarDataStream,
    required this.audioPlayer,
  }) : _seekBarDataStream = seekBarDataStream;

  final Song song;
  final Stream<SeekBarData> _seekBarDataStream;
  final AudioPlayer audioPlayer;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 50.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            song.title,
            style: Theme.of(context).textTheme.headlineSmall!.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            song.description,
            maxLines: 2,
            style: Theme.of(context).
            textTheme.
            bodySmall!.
            copyWith(
              color: Colors.white,

            ),
          ),
          const SizedBox(height: 30),
          StreamBuilder<SeekBarData>(
          stream: _seekBarDataStream,
          builder: (context,snapshot){
            final positionData = snapshot.data;
            return SeekBar(
              position: positionData?.duration?? Duration.zero,
              duration: positionData?.duration?? Duration.zero,
              onChangeEnd: (newPosition) {
                audioPlayer.seek(newPosition);
              },
            );
          },
        ),
          PlayerButtons(audioPlayer: audioPlayer),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          IconButton(
            iconSize: 35,
            onPressed: () {},
            icon: const Icon(
              Icons.settings,
              color: Colors.white,
            ),
          ),
          IconButton(
            iconSize: 35,
            onPressed: () {},
            icon: const Icon(
              Icons.cloud_download,
              color: Colors.white,
            ),
          ),
          ],
      ),
        ],
      ),
    );
  }
}


class BackgroundFilter extends StatelessWidget {
  const BackgroundFilter({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (rect){
        return LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.white,
              Colors.white.withOpacity(0.5),
              Colors.white.withOpacity(0.0),
            ],
            stops:const [
              0.0,
              0.4,
              0.6]).createShader(rect);
      },
      blendMode: BlendMode.dstOut,
      child: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.deepPurple.shade200.withOpacity(0.8),
                Colors.deepPurple.shade800.withOpacity(0.8),
              ],
            )
        ),
      ),
    );
  }
}
