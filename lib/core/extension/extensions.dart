import '../enums/enums.dart';

extension EducationLevelExtension on EducationLevel {
  String get displayName {
    switch (this) {
      case EducationLevel.postGraduate:
        return "Post Graduate";
      case EducationLevel.graduate:
        return "Graduate";
      case EducationLevel.hscDiploma:
        return "HSC/Diploma";
      case EducationLevel.ssc:
        return "SSC";
    }
  }
}

extension YearOfPassingExtension on YearOfPassing {
  String get displayName {
    return name.replaceAll("year", ""); // Converts year2024 → 2024
  }
}

extension ExperienceLevelExtension on ExperienceLevel {
  String get displayName {
    switch (this) {
      case ExperienceLevel.zeroToOne:
        return "0-1 Years";
      case ExperienceLevel.oneToThree:
        return "1-3 Years";
      case ExperienceLevel.threeToFive:
        return "3-5 Years";
      case ExperienceLevel.fivePlus:
        return "5+ Years";
    }
  }
}

extension DesignationExtension on Designation {
  String get displayName {
    switch (this) {
      case Designation.juniorDeveloper:
        return "Junior Developer";
      case Designation.seniorDeveloper:
        return "Senior Developer";
      case Designation.projectManager:
        return "Project Manager";
      case Designation.architect:
        return "Architect";
    }
  }
}

extension DomainExtension on Domain {
  String get displayName {
    switch (this) {
      case Domain.softwareDevelopment:
        return "Software Development";
      case Domain.dataScience:
        return "Data Science";
      case Domain.cybersecurity:
        return "Cybersecurity";
      case Domain.cloudComputing:
        return "Cloud Computing";
      case Domain.networking:
        return "Networking";
      case Domain.uiUxDesign:
        return "UI/UX Design";
      case Domain.artificialIntelligence:
        return "Artificial Intelligence";
      case Domain.devOps:
        return "DevOps";
      case Domain.businessAnalysis:
        return "Business Analysis";
      case Domain.digitalMarketing:
        return "Digital Marketing";
    }
  }
}
