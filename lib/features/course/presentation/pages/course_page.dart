import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skill_nest/core/common/widgets/appbar.dart';
import 'package:skill_nest/core/common/widgets/course_tile.dart';
import 'package:skill_nest/core/common/widgets/dummy_course.dart';
import 'package:skill_nest/features/course/domain/models/video_models.dart';
import 'package:skill_nest/features/course/domain/models/course_models.dart';
import 'package:skill_nest/core/services/navigation_service/navigation_service.dart';
import 'package:skill_nest/features/course_details/presentation/pages/course_details.dart';

class CoursePage extends StatelessWidget {
  const CoursePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppBar('Enrolled Courses'),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
          child: ListView.separated(
            itemCount: 5,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            separatorBuilder: (context, index) => SizedBox(height: 8.h),
            itemBuilder:(context, index) {
              final course = dummyCourses[index];
              return courseList(
                showPrice: false,
                subTitleMaxLine: 2,
                rating: course.rating,
                courseTitle: course.title,
                subTitle: course.description,
                courseImage: course.thumbnail,
                tutorName: course.instructor.name,
                tutorImage: course.instructor.profileImage,
                coursePrice: '₹ ${course.coursePrice.toStringAsFixed(1)}',
                onListTap: () => NavigationService.push(context, CourseDetailPage(courseModel: course)),
              );
            }
          ),
        ),
      ),
    );
  }
}

// Dummy sources
class DummySources {
  static final _s1080 = VideoSource(url: Uri.parse('https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4'), label: VideoQualityLabel.p1080, bitrateKbps: 4000);
  static final _s720  = VideoSource(url: Uri.parse('https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/Sintel.mp4'), label: VideoQualityLabel.p720, bitrateKbps: 2500);
  static final _s480  = VideoSource(url: Uri.parse('https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/TearsOfSteel.mp4'), label: VideoQualityLabel.p480, bitrateKbps: 1200);

  static final demoCoursePreview = CourseDetailData(
    id: 'c1',
    title: 'Flutter From Scratch',
    subtitle: 'Learn Flutter step by step',
    description: 'A beginner friendly course... (preview mode).',
    thumbnailUrl: 'https://via.placeholder.com/800x450.png?text=Flutter+Course',
    previewSources: [_s720],
    isPurchased: false,
    lessons: [
      Lesson(id: 'l1', title: 'Welcome', duration: const Duration(minutes: 2), sources: [_s720], isFreePreview: true),
      Lesson(id: 'l2', title: 'Setup', duration: const Duration(minutes: 10), sources: [_s1080, _s720, _s480]),
    ],
    rating: 4.6,
    ratingCount: 1250,
    totalDuration: const Duration(hours: 5, minutes: 30),
  );

  static final demoCoursePurchased = CourseDetailData(
    id: 'c1',
    title: 'Flutter From Scratch',
    subtitle: 'Learn Flutter step by step',
    description: 'Full access version.',
    thumbnailUrl: 'https://via.placeholder.com/800x450.png?text=Flutter+Course',
    previewSources: [_s720],
    isPurchased: true,
    lessons: [
      Lesson(id: 'l1', title: 'Welcome', duration: const Duration(minutes: 2), sources: [_s720], isFreePreview: true),
      Lesson(id: 'l2', title: 'Setup', duration: const Duration(minutes: 10), sources: [_s1080, _s720, _s480]),
      Lesson(id: 'l3', title: 'Widgets 101', duration: const Duration(minutes: 25), sources: [_s1080, _s720, _s480]),
    ],
    rating: 4.6,
    ratingCount: 1250,
    totalDuration: const Duration(hours: 5, minutes: 30),
  );
}
