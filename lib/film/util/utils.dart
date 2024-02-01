import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

enum LoadingState { DONE, LOADING, WAITING, ERROR }

final dollarFormat = NumberFormat("#,##0.00", "tr-TR");
final sourceFormat = DateFormat('yyyy-MM-dd');
final dateFormat = DateFormat.yMMMMd("tr-TR");

Map<int, String> _genreMap = {
  28: 'Aksiyon',
  12: 'Macera',
  16: 'Animasyon',
  35: 'Komedi',
  80: 'Suç',
  99: 'Belgesel',
  18: 'Drama',
  10751: 'Aile',
  10762: 'Çocuk',
  10759: 'Aksiyon & Macera',
  14: 'Fantastik',
  36: 'Tarih',
  27: 'Korku',
  10402: 'Müzik',
  9648: 'Gizem',
  10749: 'Romantik',
  878: 'Bilim Kurgu',
  10770: 'Dizi',
  53: 'Gerilim',
  10752: 'Savaş',
  37: 'Western',
  10763: '',
  10764: 'Gerçeklik',
  10765: 'Bilim Kurgu ve Fantezi',
  10766: 'Soap',
  10767: 'Konuşma',
  10768: 'Savaş & Politik',
};

List<String> getGenresForIds(List<int> genreIds) =>
    genreIds.map((id) => _genreMap[id]).toList();

String getGenreString(List<int> genreIds) {
  StringBuffer buffer = StringBuffer();
  buffer.writeAll(getGenresForIds(genreIds), ", ");
  return buffer.toString();
}

String concatListToString(List<dynamic> data, String mapKey) {
  StringBuffer buffer = StringBuffer();
  buffer.writeAll(data.map<String>((map) => map[mapKey]).toList(), ", ");
  return buffer.toString();
}

String formatSeasonsAndEpisodes(int numberOfSeasons, int numberOfEpisodes) =>
    '$numberOfSeasons Seasons and $numberOfEpisodes Episodes';

String formatNumberToDollars(int amount) => '\$${dollarFormat.format(amount)}';

String formatDate(String date) {
  try {
    return dateFormat.format(sourceFormat.parse(date));
  } catch (Exception) {
    return "";
  }
}

String formatRuntime(int runtime) {
  int hours = runtime ~/ 60;
  int minutes = runtime % 60;

  return '$hours\h $minutes\m';
}

launchUrl(String url) async {
  if (await canLaunch(url)) {
    await launch(url);
  }
}

String getImdbUrl(String imdbId) => 'http://www.imdb.com/title/$imdbId';

final String _imageUrlLarge = "https://image.tmdb.org/t/p/w500/";
final String _imageUrlMedium = "https://image.tmdb.org/t/p/w300/";

String getMediumPictureUrl(String path) => _imageUrlMedium + path;

String getLargePictureUrl(String path) => _imageUrlLarge + path;
