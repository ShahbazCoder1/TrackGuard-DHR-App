# Flutter ProGuard Rules
-keep class io.flutter.app.** { *; }
-keep class io.flutter.plugin.** { *; }
-keep class io.flutter.util.** { *; }
-keep class io.flutter.view.** { *; }
-keep class io.flutter.** { *; }
-keep class io.flutter.plugins.** { *; }

# Suppress warnings for Flutter deferred components (Play Core optional dependencies)
-dontwarn com.google.android.play.core.**
-dontwarn com.google.android.play.**
-dontwarn com.google.common.util.concurrent.**

# LiteRT-LM (litertlm) Flutter Plugin & JNI Bridge
# Prevents R8 from stripping LiteRtLmJniBridge and related native JNI helpers
-keep class org.rockstudio.litertlm.** { *; }
-keep interface org.rockstudio.litertlm.** { *; }
-keepclassmembers class org.rockstudio.litertlm.** { *; }
-keepclassmembernames class org.rockstudio.litertlm.** { *; }
-dontwarn org.rockstudio.litertlm.**

# Google LiteRT-LM Android SDK & C++ JNI runtime
-keep class com.google.ai.edge.litertlm.** { *; }
-keep interface com.google.ai.edge.litertlm.** { *; }
-keepclassmembers class com.google.ai.edge.litertlm.** { *; }
-keepclassmembernames class com.google.ai.edge.litertlm.** { *; }
-dontwarn com.google.ai.edge.litertlm.**

# Dart JNI interop (jni, jni_flutter)
-keep class com.github.dart_lang.jni.** { *; }
-keep interface com.github.dart_lang.jni.** { *; }
-keepclassmembers class com.github.dart_lang.jni.** { *; }
-dontwarn com.github.dart_lang.jni.**

# Native methods (JNI) across all libraries
-keepclasseswithmembernames,includedescriptorclasses class * {
    native <methods>;
}

# Preserve annotations and reflection metadata
-keepattributes *Annotation*,Signature,InnerClasses,EnclosingMethod
-keepclassmembers class * {
    @androidx.annotation.Keep *;
}

# Ignore warnings from unresolved optional library references
-ignorewarnings

