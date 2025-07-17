plugins {
    id("com.android.application")
    // START: FlutterFire Configuration
    id("com.google.gms.google-services")
    // END: FlutterFire Configuration
    id("kotlin-android")
    // The Flutter Gradle Plugin must be applied after the Android and Kotlin Gradle plugins.
    id("dev.flutter.flutter-gradle-plugin")
}

android {
    namespace = "com.masoom.skill_nest.skill_nest"
    compileSdk = 35
    ndkVersion = "27.0.12077973"

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_11
        targetCompatibility = JavaVersion.VERSION_11
        isCoreLibraryDesugaringEnabled = true
    }

    kotlinOptions {
        jvmTarget = JavaVersion.VERSION_11.toString()
    }

    defaultConfig {
        // TODO: Specify your own unique Application ID (https://developer.android.com/studio/build/application-id.html).
        applicationId = "com.masoom.skill_nest.skill_nest"
        // You can update the following values to match your application needs.
        // For more information, see: https://flutter.dev/to/review-gradle-config.
        minSdk = 29
        targetSdk = 35
        versionCode = flutter.versionCode
        versionName = flutter.versionName
        multiDexEnabled = true
    }

    buildTypes {
        release {
            // TODO: Add your own signing config for the release build.
            // Signing with the debug keys for now, so `flutter run --release` works.
            signingConfig = signingConfigs.getByName("debug")
        }
    }
}

flutter {
    source = "../.."
}

dependencies {
    // ✅ Required for Java 8+ APIs support (flutter_local_notifications needs it)
    coreLibraryDesugaring("com.android.tools:desugar_jdk_libs:2.1.4")

    // ✅ MultiDex (for handling >65k methods)
    implementation("androidx.multidex:multidex:2.0.1")

    // ✅ Firebase BOM (manages all Firebase versions)
    implementation(platform("com.google.firebase:firebase-bom:32.7.0"))

    // ✅ Firebase Authentication
    implementation("com.google.firebase:firebase-auth-ktx")

    // ✅ Firebase Cloud Messaging (FCM)
    implementation("com.google.firebase:firebase-messaging-ktx")

    // ✅ Optional: Firebase Analytics
    implementation("com.google.firebase:firebase-analytics-ktx")
}
