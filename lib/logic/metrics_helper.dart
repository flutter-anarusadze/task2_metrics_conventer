class MetricsHelper {
  double convertTo(double amount, String? toMetric, String? fromMetric) {
    if (fromMetric == "cm") {
      if (toMetric == "cm") {
        return amount;
      }
      if (toMetric == "m") {
        return amount / 100;
      }
      if (toMetric == "km") {
        return amount / 100000;
      }
    }

    if (fromMetric == "m") {
      if (toMetric == "cm") {
        return amount * 100;
      }
      if (toMetric == "m") {
        return amount;
      }
      if (toMetric == "km") {
        return amount / 1000;
      }
    }

    if (fromMetric == "km") {
      if (toMetric == "cm") {
        return amount * 100000;
      }
      if (toMetric == "m") {
        return amount * 1000;
      }
      if (toMetric == "km") {
        return amount;
      }
    }

    return amount;
  }
}
