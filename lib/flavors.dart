enum Flavor {
  prod,
  dev,
}

class F {
  static Flavor? appFlavor;

  static String get name => appFlavor?.name ?? '';

  static String get title {
    switch (appFlavor) {
      case Flavor.prod:
        return 'Immersion';
      case Flavor.dev:
        return 'Immersion Dev';
      default:
        return 'title';
    }
  }

  static String get env {
    switch (appFlavor) {
      case Flavor.prod:
        return 'Staging'; // replace by "Release" when ready
      case Flavor.dev:
        return 'Staging';
      default:
        return 'title';
    }
  }

}
