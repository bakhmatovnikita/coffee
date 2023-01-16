package com.example.cofee
import androidx.annotation.NonNull
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugins.GeneratedPluginRegistrant
import com.yandex.mapkit.MapKitFactory

class MainActivity: FlutterActivity() {
  override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
      MapKitFactory.setApiKey("d56975e0-35ed-4be0-84c9-2766e15664e4");  
    super.configureFlutterEngine(flutterEngine)
  }
}