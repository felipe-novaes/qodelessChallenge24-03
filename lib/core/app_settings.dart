enum EAppMode { LocalhostChrome, LocalhostAndroid, Beta, Demo, Prod }

class AppSettings {
  static void initSystem(EAppMode currentMode) {
    mode = currentMode;
    switch (mode) {
      case EAppMode.LocalhostAndroid:
        apiUrl = "https://10.0.2.2:5000/api";
        break;
      case EAppMode.LocalhostChrome:
        apiUrl = "https://localhost:5000/api";
        break;
      case EAppMode.Beta:
        apiUrl = "https://572e-201-49-245-32.ngrok.io/api";
        break;
      case EAppMode.Demo:
        apiUrl = "https://572e-201-49-245-32.ngrok.io/api";
        break;
      case EAppMode.Prod:
        apiUrl = "https://572e-201-49-245-32.ngrok.io/api";
        break;
    }
  }

  static EAppMode mode = EAppMode.Beta;
  static String apiUrl = "";
}
