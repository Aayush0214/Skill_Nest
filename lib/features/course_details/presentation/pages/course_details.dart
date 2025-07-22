import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skill_nest/core/common/widgets/custom_text.dart';
import 'package:skill_nest/core/theme/app_colors/app_colors.dart';
import 'package:skill_nest/features/home/domain/entity/dummy_entity.dart';
import 'package:skill_nest/features/course/domain/models/video_models.dart';
import 'package:skill_nest/features/course/domain/models/course_models.dart';
import 'package:skill_nest/features/course_details/presentation/widgets/thumbnail.dart';
import 'package:skill_nest/features/course_details/presentation/widgets/about_page.dart';
import 'package:skill_nest/features/course_details/presentation/widgets/lesson_list.dart';
import 'package:skill_nest/features/course_details/presentation/widgets/review_page.dart';
import 'package:skill_nest/features/course_details/presentation/widgets/lessons_page.dart';
import 'package:skill_nest/features/course_details/presentation/widgets/course_app_bar.dart';
import 'package:skill_nest/features/course_details/presentation/widgets/playback_player.dart';
import 'package:skill_nest/features/course_details/presentation/bloc/video_player/course_playback_bloc.dart';

class CourseDetailPage extends StatefulWidget {
  final CourseModel courseModel;
  const CourseDetailPage({super.key, required this.courseModel});

  @override
  State<CourseDetailPage> createState() => _CourseDetailPageState();
}

class _CourseDetailPageState extends State<CourseDetailPage>with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
      courseAppBar(context: context, courseTitle: widget.courseModel.title),
      body: Column(
        children: [
          Expanded(
            flex: 0,
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  thumbnail(thumbnailImage: widget.courseModel.thumbnail, onThumbnailClick: () {}),
                  SizedBox(height: 15.h),
                  customText(
                    maxLines: 2,
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold,
                    textString: widget.courseModel.title,
                  ),
                  SizedBox(height: 3.h),
                  Row(
                    children: [
                      Icon(Icons.star, color: Colors.orange),
                      SizedBox(width: 3.w),
                      customText(
                        maxLines: 1,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                        textString: '${widget.courseModel.rating} (${widget.courseModel.totalReviews} reviews)',
                      ),
                      SizedBox(width: 10.w),
                      customText(textString: '|', fontSize: 16.sp),
                      SizedBox(width: 10.w),
                      customText(
                        maxLines: 1,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                        textString: '${widget.courseModel.totalStudents} students',
                      ),
                    ],
                  ),
                  SizedBox(height: 10.h),
                ],
              ),
            ),
          ),

          // -------- Tabs --------
          Container(
            height: 40.h,
            margin: EdgeInsets.symmetric(horizontal: 8.w),
            padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 4.h),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(10.w),
            ),
            child: TabBar(
              isScrollable: false,
              controller: _tabController,
              labelColor: AppColors.white,
              dividerColor: Colors.transparent,
              unselectedLabelColor: Colors.black54,
              indicatorSize: TabBarIndicatorSize.tab,
              indicator: BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.circular(10.w),
              ),
              tabs: [
                tabItems('Lessons'),
                tabItems('About'),
                tabItems('Reviews'),
              ],
            ),
          ),

          // -------- Tab Content (Must Be Bounded) --------
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                // Lessons Page
                LessonsPage(modules: widget.courseModel.modules),

                // About Page
                AboutPage(
                  learnings: widget.courseModel.learnings,
                  instructor: widget.courseModel.instructor,
                  description: widget.courseModel.description,
                ),

                // Review Page
                ReviewPage(
                  reviews: widget.courseModel.reviews,
                  courseRating: widget.courseModel.rating,
                  totalReviews: widget.courseModel.totalReviews,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

Widget tabItems(String tabName) {
  return customText(
    maxLines: 1,
    fontSize: 16.sp,
    textString: tabName,
    fontWeight: FontWeight.bold,
  );
}

extension _PlaybackInitX on CoursePlaybackBloc {
  void _initFromArgs(CourseDetailArgs args) {
    final c = args.course;
    if (!c.isPurchased) {
      // PREVIEW MODE: use previewSources (fallback: first free lesson)
      final sources = c.previewSources ?? _firstFreeLessonSources(c);
      if (sources != null) {
        add(CPInitialize(mediaType: MediaType.preview, sources: sources));
      }
    } else {
      // FULL MODE: no auto-play? show placeholder until user selects; or auto-play first lesson.
      if (args.autoPlayPreview && c.previewSources != null) {
        add(CPInitialize(mediaType: MediaType.preview, sources: c.previewSources!));
      } else if (c.lessons.isNotEmpty) {
        add(CPNavigateLesson(c.lessons.first));
      }
    }
  }

  List<VideoSource>? _firstFreeLessonSources(CourseDetailData c) {
    try {
      return c.lessons.firstWhere((l) => l.isFreePreview).sources;
    } catch (_) {
      return null;
    }
  }
}



// BlocProvider(
// create: (_) => CoursePlaybackBloc(progressRepo: progressRepo).._initFromArgs(args),
// child: _CourseDetailView(args: args),
// );

class _CourseDetailView extends StatelessWidget {
  final CourseDetailArgs args;
  const _CourseDetailView({required this.args});

  @override
  Widget build(BuildContext context) {
    final c = args.course;
    return Scaffold(
      appBar: AppBar(title: Text(c.title)),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const InlinePlaybackView(),
            const SizedBox(height: 16),
            _CourseMeta(course: c),
            const Divider(),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text('Lessons', style: Theme.of(context).textTheme.titleMedium),
            ),
            LessonList(lessons: c.lessons, isPurchased: c.isPurchased),
            const SizedBox(height: 80),
          ],
        ),
      ),
    );
  }
}

class _CourseMeta extends StatelessWidget {
  final CourseDetailData course;
  const _CourseMeta({required this.course});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        if (course.subtitle != null) ...[
          Text(course.subtitle!, style: Theme.of(context).textTheme.bodyLarge),
          const SizedBox(height: 8),
        ],
        Text('${course.rating.toStringAsFixed(1)} ★ (${course.ratingCount})'),
        const SizedBox(height: 8),
        Text(course.description),
      ]),
    );
  }
}