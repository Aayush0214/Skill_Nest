import 'package:iconsax/iconsax.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skill_nest/core/common/widgets/custom_text.dart';
import 'package:skill_nest/core/theme/app_colors/app_colors.dart';
import 'package:skill_nest/features/authentication/course_details/presentation/bloc/video_player_bloc.dart';
import 'package:skill_nest/features/authentication/course_details/presentation/widgets/thumbnail_or_video_player.dart';

class CourseDetails extends StatefulWidget {
  final String url;
  final Duration startAt;

  const CourseDetails({super.key, required this.url, required this.startAt});

  @override
  State<CourseDetails> createState() => _CourseDetailsState();
}

class _CourseDetailsState extends State<CourseDetails> {
  bool _showVideoPlayer = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ,
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
        child: Column(
          children: [
            BlocBuilder<VideoPlayerBloc, VideoPlayerState>(
              builder: (context, state) {
                if (state is ShowVideoPlayerState) {
                  _showVideoPlayer = state.showVideoPlayer;
                }
                return thumbnailOrVideoPlayer(
                  showVideoPlayer: _showVideoPlayer,
                  action: () {
                    context.read<VideoPlayerBloc>().add(
                      ShowVideoPlayer(showVideoPlayer: _showVideoPlayer),
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
