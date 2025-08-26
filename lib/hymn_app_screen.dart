import 'package:flutter/material.dart';

class Song {
  final int id;
  final String title;

  Song({required this.id, required this.title});
}

class HymnAppScreen extends StatefulWidget {
  const HymnAppScreen({super.key});

  @override
  State<HymnAppScreen> createState() => _HymnAppScreenState();
}

class _HymnAppScreenState extends State<HymnAppScreen> {
  // State for the currently displayed hymn page image
  int _currentPageNumber = 1; // Default to the first page/image

  final List<Song> _allSongs = [
    Song(id: 1, title: '그 이름 높도다'),
    Song(id: 2, title: '나 주님 알기 전'),
    Song(id: 3, title: '나는 생명떡 먹고 산다'),
    Song(id: 4, title: '나는야 놀라운 친구 있네'),
    Song(id: 5, title: '나는야 친구 되신'),
    Song(id: 6, title: '나를 만드신 분은'),
    Song(id: 7, title: '나를 사랑하는 주님'),
    Song(id: 8, title: '나보다 먼저'),
    Song(id: 9, title: '날 사랑하여 준 친구'),
    Song(id: 10, title: '내 맘에'),
    Song(id: 11, title: '내 맘의 빛'),
    Song(id: 12, title: '내 주는 크고'),
    Song(id: 13, title: '내가 산을 향하여'),
    Song(id: 14, title: '또 별을 만드시고'),
    Song(id: 15, title: '많은 선지자'),
    Song(id: 16, title: '무화과나무 잎이 마르고'),
    Song(id: 17, title: '사랑의 예수님'),
    Song(id: 18, title: '사랑의 주'),
    Song(id: 19, title: '사랑의 주 예수님이'),
    Song(id: 20, title: '생명수 샘'),
    Song(id: 21, title: '여호와는 나의 반석'),
    Song(id: 22, title: '예수 사랑하심은'),
    Song(id: 23, title: '예수 항상 나의 친구'),
    Song(id: 24, title: '예수께로 가면'),
    Song(id: 25, title: '예수는 참 포도나무'),
    Song(id: 26, title: '예수님 날 위하여'),
    Song(id: 27, title: '예수님 향기'),
    Song(id: 28, title: '예수님은 나의 빛'),
    Song(id: 29, title: '예수님은 내 편'),
    Song(id: 30, title: '예수님은 생명의'),
    Song(id: 31, title: '예수님은 우리의 화평'),
    Song(id: 32, title: '예수님의 사랑'),
    Song(id: 33, title: '예수님의 사랑 크셔라'),
    Song(id: 34, title: '예수의 이름은'),
    Song(id: 35, title: '오이 밭에 오이가'),
    Song(id: 36, title: '우리의 대장 예수님'),
    Song(id: 37, title: '임마누엘'),
    Song(id: 38, title: '주 나의 사랑'),
    Song(id: 39, title: '주 예수 사랑 기쁨'),
    Song(id: 40, title: '주는 나를 사랑해'),
    Song(id: 41, title: '주님 보시고'),
    Song(id: 42, title: '천사가 전하여 준'),
    Song(id: 43, title: '첫째 날에 하나님'),
    Song(id: 44, title: '하늘보다 높고'),
    Song(id: 45, title: 'Deep and Wide'),
    Song(id: 46, title: 'Deep Down'),
    Song(id: 47, title: 'Fairest Lord Jesus'),
    Song(id: 48, title: 'I am the Good Shepherd'),
    Song(id: 49, title: 'It\'s Possible with God'),
    Song(id: 50, title: 'Praise the Lord Together'),
    Song(id: 51, title: 'Remember Your Creator'),
    Song(id: 52, title: 'Shout for Joy to the Lord'),
    Song(id: 53, title: 'The Lord is Good to Me'),
    Song(id: 54, title: '38년 된 병자'),
    Song(id: 55, title: '가나 혼인잔치'),
    Song(id: 56, title: '강도만난 자'),
    Song(id: 57, title: '기생 라합'),
    Song(id: 58, title: '꿈쟁이 요셉'),
    Song(id: 59, title: '나사로야 나오라'),
    Song(id: 60, title: '내일 이맘때에'),
    Song(id: 61, title: '네 명의 문둥이'),
    Song(id: 62, title: '노를 저어라'),
    Song(id: 63, title: '만나'),
    Song(id: 64, title: '므비보셋'),
    Song(id: 65, title: '베드로와 요한이'),
    Song(id: 66, title: '보고 싶어'),
    Song(id: 67, title: '보리떡 다섯 개'),
    Song(id: 68, title: '사람 낚는 어부 되게 하리라'),
    Song(id: 69, title: '사랑의 무지개'),
    Song(id: 70, title: '삼갈의 막대기'),
    Song(id: 71, title: '생명을 사랑하는 하나님'),
    Song(id: 72, title: '슬기로운 다섯 처녀'),
    Song(id: 73, title: '씨 뿌립니다'),
    Song(id: 74, title: '야곱이 축복받은 이유'),
    Song(id: 75, title: '어린 나귀'),
    Song(id: 76, title: '어린 소년 다윗'),
    Song(id: 77, title: '엄마 보고파'),
    Song(id: 78, title: '왕의 신부 된 에스더'),
    Song(id: 79, title: '임금님의 혼인잔치'),
    Song(id: 80, title: '저 큰 선민'),
    Song(id: 81, title: '주님의 동산'),
    Song(id: 82, title: '중풍병자'),
    Song(id: 83, title: '출애굽기 3장 10절'),
    Song(id: 84, title: '큰 권세가진 내시가'),
    Song(id: 85, title: '풍랑 이는 바다 위로'),
    Song(id: 86, title: '하나님의 부름 받은 아브라함'),
    Song(id: 87, title: '하나님의 약속은'),
    Song(id: 88, title: '하나랍니다'),
    Song(id: 89, title: '호수 저편으로'),
    Song(id: 90, title: 'Footprints on the Water'),
    Song(id: 91, title: 'Go Fish, Go Fish'),
    Song(id: 92, title: 'Joshua Fit the Battle of Jericho'),
    Song(id: 93, title: 'Who Did Swallow Jonah?'),
    Song(id: 94, title: '골로새서 1장 13절'),
    Song(id: 95, title: '깜깜해요 이 세상은'),
    Song(id: 96, title: '나의 사랑하는 책'),
    Song(id: 97, title: '날 만드심이라'),
    Song(id: 98, title: '내 맘에 가장 귀한'),
    Song(id: 99, title: '말씀이 나를 비추시고'),
    Song(id: 100, title: '성경목록가'),
    Song(id: 101, title: '수고하고 짐진 자들아'),
    Song(id: 102, title: '여호와의 손이 짧아'),
    Song(id: 103, title: '예수님이 가르치신'),
    Song(id: 104, title: '예수님이 말씀하시니'),
    Song(id: 105, title: '오 죄의 삯은'),
    Song(id: 106, title: '오직 성령의 열매'),
    Song(id: 107, title: '펑펑 솟아나요'),
    Song(id: 108, title: '하나님 선물'),
    Song(id: 109, title: '하나님이 세상을'),
    Song(id: 110, title: '한 사람으로 말미암아서'),
    Song(id: 111, title: 'Ask, Seek and Knock'),
    Song(id: 112, title: 'God Made Me'),
    Song(id: 113, title: 'John : '),
    Song(id: 114, title: '걱정 근심 산 되어'),
    Song(id: 115, title: '기쁨 내 맘 속에 있네'),
    Song(id: 116, title: '나는 시냇가에 심긴 나무'),
    Song(id: 117, title: '나는 주 안에서'),
    Song(id: 118, title: '나의 기쁨이'),
    Song(id: 119, title: '나의 입술의 모든 말과'),
    Song(id: 120, title: '내 마음에 사랑이'),
    Song(id: 121, title: '내 마음의 속삭임'),
    Song(id: 122, title: '내 맘에 감사의 열매를'),
    Song(id: 123, title: '내가 그리스도와 함께'),
    Song(id: 124, title: '내가 주를 사랑하는 이유'),
    Song(id: 125, title: '내가 주를 찬양할 수 있는 건'),
    Song(id: 126, title: '너는 왜 항상 웃니'),
    Song(id: 127, title: '너와 내가 가야할 길'),
    Song(id: 128, title: '너희는 먼저 그의 나라와'),
    Song(id: 129, title: '눈 깜짝할 사이에'),
    Song(id: 130, title: '눈은 어디 있나'),
    Song(id: 131, title: '둥지 안에서는'),
    Song(id: 132, title: '또 한 주간'),
    Song(id: 133, title: '모든 것 주님께 맡기고'),
    Song(id: 134, title: '믿음이 자라요'),
    Song(id: 135, title: '바람 불어도'),
    Song(id: 136, title: '승리는 내 것일세'),
    Song(id: 137, title: '신나는 여름캠프'),
    Song(id: 138, title: '아프지만 나았다'),
    Song(id: 139, title: '양 바친 목자도'),
    Song(id: 140, title: '여행'),
    Song(id: 141, title: '예수 안에서'),
    Song(id: 142, title: '예수님 나를 따르라고'),
    Song(id: 143, title: '예수님 내 맘에 모신 후'),
    Song(id: 144, title: '예수님 제자'),
    Song(id: 145, title: '예수님께서 부르셨어요'),
    Song(id: 146, title: '왕왕왕왕 나는 왕자다'),
    Song(id: 147, title: '왜 너는 내일 일을'),
    Song(id: 148, title: '우린 그의 만드신 바라'),
    Song(id: 149, title: '우린 하나님 세계 나는 조종사'),
    Song(id: 150, title: '작고 볼품없는 나를'),
    Song(id: 151, title: '작은 엘리야'),
    Song(id: 152, title: '저 마귀 유혹할 때에'),
    Song(id: 153, title: '주는 나를 기르시는 목자'),
    Song(id: 154, title: '주님만 생각할래'),
    Song(id: 155, title: '주님은 선하신 분'),
    Song(id: 156, title: '주님의 눈으로'),
    Song(id: 157, title: '찬송해 봐요'),
    Song(id: 158, title: '하나님은 화가'),
    Song(id: 159, title: '하나님이 주신 머리'),
    Song(id: 160, title: '하나님이 지키시네'),
    Song(id: 161, title: '한 가지만 들어요'),
    Song(id: 162, title: '호흡 있는 자마다'),
    Song(id: 163, title: 'I belong to Jesus'),
    Song(id: 164, title: 'Let my little light shine'),
    Song(id: 165, title: 'Teach me your way'),
    Song(id: 166, title: '귀여운 꼬마 어느 날'),
    Song(id: 167, title: '나팔소리 울리며'),
    Song(id: 168, title: '뚝딱뚝딱 배를 만든다'),
    Song(id: 169, title: '마음속에 죄'),
    Song(id: 170, title: '문 하나만 있네'),
    Song(id: 171, title: '반석에 짓는'),
    Song(id: 172, title: '세상에는 두 길이 있네'),
    Song(id: 173, title: '심판 받을 준비됐나'),
    Song(id: 174, title: '예수님 맞을 준비됐나'),
    Song(id: 175, title: '이 세상에 사는 사람'),
    Song(id: 176, title: '이 세상에 예수님'),
    Song(id: 177, title: '이 세상의 많은 사람'),
    Song(id: 178, title: '갔네 갔네'),
    Song(id: 179, title: '기쁜 소식'),
    Song(id: 180, title: '나 자유 얻었네'),
    Song(id: 181, title: '나갔네 나갔네'),
    Song(id: 182, title: '나는 구원열차 올라타고서'),
    Song(id: 183, title: '나는 예수님 만났네'),
    Song(id: 184, title: '나는 하나님의 것'),
    Song(id: 185, title: '날 구원했네'),
    Song(id: 186, title: '내 대신 죽으심으로'),
    Song(id: 187, title: '내 죄 용서하신 주님'),
    Song(id: 188, title: '내 죄는 사했네'),
    Song(id: 189, title: '내 죄를 씻어주신 날'),
    Song(id: 190, title: '내가 기쁜 이유'),
    Song(id: 191, title: '내가 너희를 쉬게 하리라'),
    Song(id: 192, title: '내게 임했네'),
    Song(id: 193, title: '너는 두 번 난 것을'),
    Song(id: 194, title: '다른 이름으로'),
    Song(id: 195, title: '다신 다신'),
    Song(id: 196, title: '먹과 같이 검은'),
    Song(id: 197, title: '메시야 오셨네'),
    Song(id: 198, title: '무거운 죄짐 벗기 원하면'),
    Song(id: 199, title: '복음을 심었습니다'),
    Song(id: 200, title: '복음의 눈썰매'),
    Song(id: 201, title: '생명의 금방울 소리'),
    Song(id: 202, title: '복음의 씨앗'),
    Song(id: 203, title: '부활하신 주님'),
    Song(id: 204, title: '십자가에서 나를 위하여'),
    Song(id: 205, title: '아 놀라워라'),
    Song(id: 206, title: '아름다운 이야기가 있네'),
    Song(id: 207, title: '열렸네 열렸네'),
    Song(id: 208, title: '예수 안에 있는 나'),
    Song(id: 209, title: '예수님 날 사랑하사'),
    Song(id: 210, title: '예수님 십자가 위에서'),
    Song(id: 211, title: '예수님 안에는'),
    Song(id: 212, title: '예수님을 모르는 애'),
    Song(id: 213, title: '예수님의 보혈로'),
    Song(id: 214, title: '오 기쁘고 기쁜 이 날'),
    Song(id: 215, title: '오 우리 영혼이'),
    Song(id: 216, title: '오 하늘 영광'),
    Song(id: 217, title: '우린 다 양처럼'),
    Song(id: 218, title: '작은 벌레 자라서'),
    Song(id: 219, title: '조각목'),
    Song(id: 220, title: '죄 보따리'),
    Song(id: 221, title: '죄 사함을 얻으라'),
    Song(id: 222, title: '죄를 알지도 못하신'),
    Song(id: 223, title: '주 예수 십자가 위에서'),
    Song(id: 224, title: '주 예수를 찬양합시다'),
    Song(id: 225, title: '주님 내 안에 사네'),
    Song(id: 226, title: '주를 못 박았네'),
    Song(id: 227, title: '주와 하나 되었어요'),
    Song(id: 228, title: '주의 이름 높이세'),
    Song(id: 229, title: '즐거운 식사시간'),
    Song(id: 230, title: '진정 사랑해 주님을'),
    Song(id: 231, title: '하나님 내 맘에'),
    Song(id: 232, title: '하나님 어린양 예수님'),
    Song(id: 233, title: '하나님의 말씀으로'),
    Song(id: 234, title: '고요한 밤 거룩한 밤'),
    Song(id: 235, title: '그 어린 주 예수'),
    Song(id: 236, title: '그 여관엔'),
    Song(id: 237, title: '기쁘게 울려라'),
    Song(id: 238, title: '기쁘다 구주 오셨네'),
    Song(id: 239, title: '동방박사 세 사람'),
    Song(id: 240, title: '사랑 많은 예수님'),
    Song(id: 241, title: '저 들 밖에 한 밤중에'),
    Song(id: 242, title: '천지만물 지으신 주'),
    Song(id: 243, title: '그 나라 갈 때에'),
    Song(id: 244, title: '나팔소리가 울려 퍼지며'),
    Song(id: 245, title: '난 천국 집을 향해'),
    Song(id: 246, title: '사막에 샘이'),
    Song(id: 247, title: '작은 광주리의'),
    Song(id: 248, title: '저 높은 우주에'),
    Song(id: 249, title: '주님 발자국'),
    Song(id: 250, title: '천국 가면'),
    Song(id: 251, title: '천국에 들어가는 길은'),
    Song(id: 252, title: '천사들의 나팔소리'),
    Song(id: 253, title: '하나님 나라로 오세요'),
    Song(id: 254, title: '하나님 나라에'),
    Song(id: 255, title: '힘으로도 못가요'),
    Song(id: 256, title: 'Citizen of Heaven'),
    Song(id: 257, title: '가라가라 세상을 향해'),
    Song(id: 258, title: '가리라'),
    Song(id: 259, title: '길 잃은 어린 양'),
    Song(id: 260, title: '꿈을 이루신 하나님'),
    Song(id: 261, title: '나 주님의 입 되어'),
    Song(id: 262, title: '나는 십자가의 꼬마 군병'),
    Song(id: 263, title: '나는 진군하는'),
    Song(id: 264, title: '남으로 북으로'),
    Song(id: 265, title: '너는 들어본 적 있니'),
    Song(id: 266, title: '너는 알고 있니'),
    Song(id: 267, title: '너는 전에'),
    Song(id: 268, title: '누가 복음을 전할까'),
    Song(id: 269, title: '똑똑똑'),
    Song(id: 270, title: '많은 사람 못 들었네'),
    Song(id: 271, title: '보라 보라'),
    Song(id: 272, title: '스톱 들어보세요'),
    Song(id: 273, title: '아름다운 소리'),
    Song(id: 274, title: '아름다운 소식 전하자'),
    Song(id: 275, title: '어느 나라로 갈까'),
    Song(id: 276, title: '어느 누구게나'),
    Song(id: 277, title: '예수님 사랑 모르는'),
    Song(id: 278, title: '이 작은 나의 빛'),
    Song(id: 279, title: '이제 내가 할 일은'),
    Song(id: 280, title: '작은 별'),
    Song(id: 281, title: '저물어 어둠이'),
    Song(id: 282, title: '주 예수님 문 밖에서'),
    Song(id: 283, title: '주여 나를 가르쳐'),
    Song(id: 284, title: '하나님 말씀으로'),
    Song(id: 285, title: '한 번도 복음을'),
    Song(id: 286, title: 'There Were Twelve disciples'),
  ];
  List<Song> _filteredSongs = [];
  final TextEditingController _searchController = TextEditingController();
  bool _showSearchResults = false;
  bool _isShowingSongList = true;

  @override
  void initState() {
    super.initState();
    _filteredSongs = _allSongs;
    _currentPageNumber = _allSongs.isNotEmpty ? _allSongs.first.id : 1;
    _searchController.addListener(_filterSongs);
  }

  void _filterSongs() {
    final query = _searchController.text.toLowerCase();
    if (mounted) { // Always good to check `mounted` before `setState` in async contexts or listeners
      setState(() {
        if (query.isEmpty) {
          _filteredSongs = _allSongs;
        } else {
          _filteredSongs = _allSongs.where((song) {
            final titleMatches = song.title.toLowerCase().contains(query);
            final idMatches = song.id.toString().contains(query);
            return titleMatches || idMatches;
          }).toList();
        }
      });
    }
  }

  void _handleSongSelection(Song song) {
    if (mounted) {
      setState(() {
        _currentPageNumber = song.id;
        _isShowingSongList = false;
        _searchController.clear();
        _filteredSongs = _allSongs;
        _showSearchResults = false;
      });
    }
    FocusScope.of(context).unfocus();
  }

  @override
  void dispose() {
    _searchController.removeListener(_filterSongs);
    _searchController.dispose();
    super.dispose();
  }

  // Helper to get the current song title based on _currentPageNumber
  String _getCurrentSongTitle() {
    final currentSong = _allSongs.firstWhere(
            (song) => song.id == _currentPageNumber,
        orElse: () => Song(title: 'Page $_currentPageNumber', id: _currentPageNumber) // Fallback
    );
    return currentSong.title;
  }


  @override
  Widget build(BuildContext context) {
        final String currentImagePath = 'assets/hymns/$_currentPageNumber.jpg';

    return Scaffold(
      appBar: AppBar(
        title: _showSearchResults
            ? TextField(
          controller: _searchController,
          autofocus: true, // Open keyboard when search becomes active
          decoration: InputDecoration(
            hintText: 'Search',
            hintStyle: TextStyle(color: Colors.white70),
            border: InputBorder.none,
          ),
          style: TextStyle(color: Colors.white),
          cursorColor: Colors.white,
        )
            : Text(_getCurrentSongTitle()), // Show current song title or page number
        actions: [
          if (_showSearchResults)
            IconButton(
              icon: Icon(Icons.cancel),
              onPressed: (){
                if(mounted){
                  setState(() {
                    _searchController.clear();
                    _showSearchResults = false;
                    _filteredSongs = _allSongs;
                  });
                  FocusScope.of(context).unfocus();
                }
              },
            )
          else
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                if (mounted) {
                  setState(() {
                    _isShowingSongList = true;
                    _showSearchResults = true;
                  });
                }
              },
            ),
        ],
      ),
      body: Stack(
        children: <Widget>[
          Center(
            child: Image.asset(
              currentImagePath,
              fit: BoxFit.contain, // Or BoxFit.cover, BoxFit.fill, etc.
              errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
                return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.error_outline, color: Colors.red, size: 50),
                        SizedBox(height: 10),
                        Text('Error loading image for page $_currentPageNumber.'),
                        Text('Path: $currentImagePath'),
                      ],
                    )
                );
              },

            ),
          ),

          // Search Results List (overlay)
          if (_showSearchResults && _filteredSongs.isNotEmpty)
            Positioned.fill(
              child: Container(
                color: Theme.of(context).scaffoldBackgroundColor.withAlpha((0.95 * 255).round()), // Use theme background
                child: ListView.builder(
                  itemCount: _filteredSongs.length,
                  itemBuilder: (context, index) {
                    final song = _filteredSongs[index];
                    return ListTile(
                      title: Text('${song.id} ${song.title}'),
                      onTap: () => _handleSongSelection(song),
                    );
                  },
                ),
              ),
            ),
          if (_showSearchResults && _searchController.text.isNotEmpty && _filteredSongs.isEmpty)
            Center(
              child: Container(
                padding: EdgeInsets.all(20),
                color: Theme.of(context).scaffoldBackgroundColor.withAlpha((0.95 * 255).round()),
                child: Text("No songs found for '${_searchController.text}'", style: TextStyle(fontSize: 16)),
              ),
            )
        ],
      ),
    );
  }
}
