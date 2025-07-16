// Filter Type Enum
enum CourseFilterType { all, popular, newest }

extension FilterName on CourseFilterType {
  String get name {
    switch (this) {
      case CourseFilterType.all:
        return 'All';
      case CourseFilterType.popular:
        return 'Popular';
      case CourseFilterType.newest:
        return 'Newest';
    }
  }
}