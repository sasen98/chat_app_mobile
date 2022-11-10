enum ApiResponse { success, fail }

class Success {
  final ApiResponse apiResponse;
  final String message;
  const Success({
    this.message = "Success",
    this.apiResponse = ApiResponse.success,
  });
}

class Failure {
  final ApiResponse apiResponse;
  final String message;
  const Failure({
    this.message = "Failed",
    this.apiResponse = ApiResponse.fail,
  });
}
