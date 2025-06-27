abstract interface class TokenService {
  Future<String?> getAccessToken();
  Future<String?> getRefreshToken();
  Future<void> saveTokens(String accessToken, {String? refreshToken});
  Future<void> clearTokens();
}
