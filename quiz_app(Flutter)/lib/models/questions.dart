class Question {
  final int id, answer;
  final String question;
  final List<String> options;

  Question({
    required this.id,
    required this.question,
    required this.options,
    required this.answer,
  });
}

const List sample_data = [
  {
    "id": 1,
    "question": "Capital city of Canada?",
    "options": [
      'Vancouver 밴쿠버',
      'Toronto 토론토',
      'Otawa 오타와',
      'Montréal 몬트리올',
    ],
    "answer_index": 2,
  },
  {
    "id": 2,
    "question": "Capital city of Netherlands?",
    "options": [
      'Rotterdam 로테르담',
      'Amsterdam 암스테르담',
      'Eindhoven 에인트호벤',
      'Groningen 그로닝겐',
    ],
    "answer_index": 1,
  },
  {
    "id": 3,
    "question": "Capital city of Australia?",
    "options": [
      'Melbourne 멜버른',
      'Adelaide 애들레이드',
      'Sydney 시드니',
      'Canberra 캔버라',
    ],
    "answer_index": 3,
  },
  {
    "id": 4,
    "question": "Capital city of Czech?",
    "options": [
      'Brno 브르노',
      'Praha 프라하',
      'Plzeň 플젠',
      'Ostrava 오스트라바',
    ],
    "answer_index": 1,
  },
  {
    "id": 5,
    "question": "Capital city of Indonesia?",
    "options": [
      'Jakarta 자카르타',
      'Bandung 반둥',
      'Surabaya 수라바야',
      'Purwokerto 푸르워케르토',
    ],
    "answer_index": 0,
  },
  {
    "id": 6,
    "question": "Capital city of Vietnam?",
    "options": [
      'Da Nang 다낭',
      'Hai Phong 하이퐁',
      'Da Lat 달랏',
      'Ha Noi 하노이',
    ],
    "answer_index": 3,
  },
  {
    "id": 7,
    "question": "Capital city of Italy?",
    "options": [
      'Milano 밀라노',
      'venezia 베네치아',
      'Roma 로마',
      'Napoli 나폴리',
    ],
    "answer_index": 2,
  },
  {
    "id": 8,
    "question": "Capital city of Finland?",
    "options": [
      'Helsinki 헬싱키',
      'Turku 투르쿠',
      'Tampere 탐페레',
      'Oulu 오울루',
    ],
    "answer_index": 0,
  },
  {
    "id": 9,
    "question": "Capital city of Belgium?",
    "options": [
      'Gent 헨트',
      'Brugge 브뤼허',
      'Brussel 브뤼셀',
      'Charleroi 샤를루아',
    ],
    "answer_index": 2,
  },
  {
    "id": 10,
    "question": "Capital city of U.S.A?",
    "options": [
      'New York 뉴욕',
      'Los Angeles 로스앤젤레스',
      'Washington D.C. 워싱텅 D.C.',
      'Seattle 시애틀',
    ],
    "answer_index": 2,
  },
  {
    "id": 11,
    "question": "Capital city of Philippines?",
    "options": [
      'Cebu 세부',
      'Maynila 마닐라',
      'Dabaw 다바오',
      'Butuan 부투안',
    ],
    "answer_index": 1,
  },
  {
    "id": 12,
    "question": "Capital city of Uruguay?",
    "options": [
      'Rocha 로차',
      'Melo 멜로',
      'Florida 플로리다',
      'Montevideo 몬테비데오',
    ],
    "answer_index": 3,
  },
  {
    "id": 13,
    "question": "Capital city of Mexico?",
    "options": [
      'Ciudad de México 멕시코시티',
      'Monterrey 몬테레이',
      'Guadalajara 과달라하라',
      'Merida 메리다',
    ],
    "answer_index": 0,
  },
  {
    "id": 14,
    "question": "Capital city of Portugal?",
    "options": [
      'Porto 포르투',
      'Braga 브라가',
      'Aveiro 아베이루',
      'Lisbon 리스본',
    ],
    "answer_index": 3,
  },
  {
    "id": 15,
    "question": "Capital city of Spain?",
    "options": [
      'Barcelona 바르셀로나',
      'Sevilla 세비야',
      'Madrid 마드리드',
      'Valencia 발렌시아',
    ],
    "answer_index": 2,
  },
  {
    "id": 16,
    "question": "Capital city of Japan?",
    "options": [
      'Osaka 오사카',
      'Kyoto 교토',
      'Tokyo 도쿄',
      'Fukuoka 후쿠오카',
    ],
    "answer_index": 2,
  },
  {
    "id": 17,
    "question": "Capital city of Sweden?",
    "options": [
      'Gothenburg 예테보리',
      'Stockholm 스톡홀름',
      'Malmö 말뫼',
      'Helsingborg 헬싱보리',
    ],
    "answer_index": 1,
  },
  {
    "id": 18,
    "question": "Capital city of Poland?",
    "options": [
      'Lublin 루블린',
      'Gdansk 그다인스크',
      'Krakow 크라쿠프',
      'Warsaw 바르샤바',
    ],
    "answer_index": 3,
  },
  {
    "id": 19,
    "question": "Capital city of Ukraine?",
    "options": [
      'Lviv 리비우',
      'Kyiv 키이우',
      'Dnipro 드니프로',
      'Kharkiv 하르키우',
    ],
    "answer_index": 1,
  },
  {
    "id": 20,
    "question": "Capital city of Ghana?",
    "options": [
      'Accra 아크라',
      'Kumasi 쿠마시',
      'Tamale 타말레',
      'Cape Coast 케이프코스트',
    ],
    "answer_index": 0,
  },
  {
    "id": 21,
    "question": "Capital city of Argentina?",
    "options": [
      'Buenos Aires 부에노스 아이레스',
      'Cordoba 코르도바',
      'Mendoza 멘도사',
      'Salta 살타',
    ],
    "answer_index": 0,
  },
  {
    "id": 22,
    "question": "Capital city of Senegal?",
    "options": [
      'Touba 투바',
      'Dakar 다카르',
      'Tambacounda 탐바쿤다',
      'Louga 루가',
    ],
    "answer_index": 1,
  },
  {
    "id": 23,
    "question": "Capital city of Denmark?",
    "options": [
      'Aarhus 오르후스',
      'Herning 헤닝',
      'Odense 오덴세',
      'København 코펜하겐',
    ],
    "answer_index": 3,
  },
  {
    "id": 24,
    "question": "Capital city of UAE(Arab Emirates)?",
    "options": [
      'Abu Dhabi 아부다비',
      'Dubai 두바이',
      'Al Ain 알아인',
      'Fujairah 푸자이라',
    ],
    "answer_index": 0,
  },
];
