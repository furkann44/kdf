import 'package:flutter/material.dart';
import 'package:kdf/film/util/utils.dart';

class MetaSection extends StatelessWidget {
  final dynamic data;

  MetaSection(this.data);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          "Hakkında",
          style: TextStyle(color: Colors.white),
        ),
        Container(
          height: 8.0,
        ),
        _getSectionOrContainer('Orijinal Başlık', 'original_title'),
        _getSectionOrContainer('Orijinal Başlık', 'original_name'),
        _getSectionOrContainer('Durum', 'status'),
        _getSectionOrContainer('Süre', 'runtime',
            formatterFunction: formatRuntime),
        _getCollectionSectionOrContainer('Tip', 'genres', 'name'),
        _getCollectionSectionOrContainer('Yönetmen', 'created_by', 'name'),
        _getCollectionSectionOrContainer('Networks', 'networks', 'name'),
        (data['number_of_seasons'] != null &&
                data['number_of_episodes'] != null)
            ? _getMetaInfoSection(
                'Seasons',
                formatSeasonsAndEpisodes(
                    data['number_of_seasons'], data['number_of_episodes']))
            : Container(), 
        _getSectionOrContainer('Latest/Next Episode', 'last_air_date',
            formatterFunction: formatDate),
        _getSectionOrContainer('Bütçe', 'budget',
            formatterFunction: formatNumberToDollars),
        _getSectionOrContainer('Gelir', 'revenue',
            formatterFunction: formatNumberToDollars),
        _getSectionOrContainer('Site', 'homepage', isLink: true),
        _getSectionOrContainer('Imdb', 'imdb_id',
            formatterFunction: getImdbUrl, isLink: true),
      ],
    );
  }

  Widget _getCollectionSectionOrContainer(
      String title, String listKey, String mapKey) {
    return data[listKey] == null
        ? Container()
        : _getMetaInfoSection(title, concatListToString(data[listKey], mapKey));
  }

  Widget _getSectionOrContainer(String title, String content,
      {dynamic formatterFunction, bool isLink: false}) {
    return data[content] == null
        ? Container()
        : _getMetaInfoSection(
            title,
            (formatterFunction != null
                ? formatterFunction(data[content])
                : data[content]),
            isLink: isLink);
  }

  Widget _getMetaInfoSection(String title, String content,
      {bool isLink: false}) {
    if (content == null) return Container();

    var contentSection = Expanded(
      flex: 4,
      child: GestureDetector(
        onTap: () => isLink ? launchUrl(content) : null,
        child: Text(
          content,
          style: TextStyle(
              color: isLink ? Colors.blue : Colors.white, fontSize: 11.0),
        ),
      ),
    );

    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 4.0),
        child: Row(
          children: <Widget>[
            Expanded(
              flex: 2,
              child: Text(
                '$title:',
                style: TextStyle(color: Colors.grey, fontSize: 11.0),
              ),
            ),
            contentSection
          ],
        ));
  }
}
