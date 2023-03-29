import 'package:get/get.dart';

class ForumController extends GetxController {
  List<dynamic> popularTopic = List.empty().obs;
  List<dynamic> listCommunity = List.empty().obs;
  List<dynamic> hottestPost = List.empty().obs;
  List<dynamic> searchPost = List.empty().obs;

  var searchKeyword = "".obs;
  var selectedPolling = 0.obs;

  void getPopularTopic() {
    popularTopic = [
      {'name': 'Trust Issue', 'count': 120},
      {'name': 'Lelah', 'count': 70},
      {'name': 'Mental Illness', 'count': 30}
    ];
  }

  void getCommunityForYou() {
    listCommunity = [
      {
        'image': 'hidup-sehat.jpg',
        'title': 'Komunitas Hidup Sehat',
        'desc':
            'Mari bersama membangun mental yang kuat ditengah kepadatan dunia',
        'created_at': '11 Februari 2023',
        'banner': 'b-hidup-sehat.png',
        'member': 450,
        'postCount': 100,
        'topicCount': 12,
      },
      {
        'image': 'dunia-akhirat.jpg',
        'title': 'Komunitas dunia Akhirat',
        'desc':
            'Komunitas untuk anda yang sibuk dengan dunia dan lupa dengan akhirat',
        'created_at': '11 Februari 2023',
        'banner': 'b-dunia-akhirat.png',
        'member': 120,
        'postCount': 80,
        'topicCount': 12,
      },
    ];
  }

  void getHottestPost() {
    hottestPost = [
      {
        'id': '1',
        'user_image': 'risa-olive.jpg',
        'username': 'Risa Olive',
        'created_at': '1 jam yang lalu',
        'content': "Bagaimana cara meningkatkan mood dan mental yang positif?",
        'like': 120,
        'comment': 43,
        'view': 467,
        'isPolling': false,
      },
      {
        'id': '2',
        'user_image': 'cinta-matahari.png',
        'username': 'Cinta Matahari',
        'created_at': '12 jam yang lalu',
        'content':
            "Bagaimana cara mengatasi stres yang berlebihan dan mempengaruhi mood dan mental?",
        'like': 120,
        'comment': 43,
        'view': 467,
        'isPolling': true,
      },
      {
        'id': '3',
        'user_image': 'tony-setiawan.jpg',
        'username': 'Tony Setiawan',
        'created_at': '2 hari  yang lalu',
        'content':
            "Apakah olahraga dapat membantu meningkatkan mood dan mental seseorang?",
        'like': 120,
        'comment': 43,
        'view': 467,
        'isPolling': false,
      },
    ];
  }

  void getSearchPost({required String keyword}) {
    searchKeyword.value = keyword;
    searchPost = keyword.toLowerCase() == "lelah"
        ? [
            {
              'id': '1',
              'user_image': 'risa-olive.jpg',
              'username': 'Risa Olive',
              'created_at': '1 jam yang lalu',
              'content':
                  "Bagaimana cara meningkatkan mood dan mental yang positif?",
              'like': 120,
              'comment': 43,
              'view': 467,
              'isPolling': false,
            },
            {
              'id': '2',
              'user_image': 'cinta-matahari.png',
              'username': 'Cinta Matahari',
              'created_at': '12 jam yang lalu',
              'content':
                  "Bagaimana cara mengatasi stres yang berlebihan dan mempengaruhi mood dan mental?",
              'like': 120,
              'comment': 43,
              'view': 467,
              'isPolling': true,
            },
            {
              'id': '3',
              'user_image': 'tony-setiawan.jpg',
              'username': 'Tony Setiawan',
              'created_at': '2 hari  yang lalu',
              'content':
                  "Apakah olahraga dapat membantu meningkatkan mood dan mental seseorang?",
              'like': 120,
              'comment': 43,
              'view': 467,
              'isPolling': false,
            },
          ]
        : [];
  }

  Map<String, Object> getDetailPost({required String id}) {
    return id == '1'
        ? {
            'id': '1',
            'user_image': 'risa-olive.jpg',
            'username': 'Risa Olive',
            'created_at': '1 jam yang lalu',
            'content':
                "Bagaimana cara meningkatkan mood dan mental yang positif?",
            'like': 120,
            'comment': 43,
            'view': 467,
            'isPolling': false,
            'desc':
                'Ditengah hiruk piuk dunia bagaimana cara kalian untuk meningkatkan mood? Jujur saja saya sendiri lelah dengan hidup ini apalagi dengan pekerjaan yang melelahkan.',
            'tags': ['mood', 'pekerjaan'],
            'pooling': [],
            'comments': [
              {
                'id': '1',
                'user_image': 'risa-olive.jpg',
                'username': 'Tony Setiawan',
                'created_at': '2 menit yang lalu',
                'content': "Menurut saya anda hanya perlu healing.",
                'like': 12
              },
              {
                'id': '2',
                'user_image': 'risa-olive.jpg',
                'username': 'Sulis Solawat',
                'created_at': '10 menit yang lalu',
                'content':
                    "Anda hanya perlu meluangkan waktu sejenak untuk menenangkan pikiran dan mengingat hal - hal baik yang terjadi. Semoga anda menjadi lebih baik, semangat!",
                'like': 77
              }
            ]
          }
        : id == '2'
            ? {
                'id': '2',
                'user_image': 'cinta-matahari.png',
                'username': 'Cinta Matahari',
                'created_at': '12 jam yang lalu',
                'content':
                    "Bagaimana cara mengatasi stres yang berlebihan dan mempengaruhi mood dan mental?",
                'like': 120,
                'comment': 43,
                'view': 467,
                'isPolling': true,
                'desc':
                    'Ditengah hiruk piuk dunia bagaimana cara kalian untuk meningkatkan mood? Jujur saja saya sendiri lelah dengan hidup ini apalagi dengan pekerjaan yang melelahkan.',
                'tags': ['mood', 'pekerjaan'],
                'pooling': [
                  'Tidur dengan nyenyak',
                  'Berlibur selama 2 hari',
                  'Bertemu dengan orang tersayang'
                ],
                'comments': [
                  {
                    'id': '1',
                    'user_image': 'risa-olive.jpg',
                    'username': 'Tony Setiawan',
                    'created_at': '2 menit yang lalu',
                    'content': "Menurut saya anda hanya perlu healing.",
                    'like': 12
                  },
                  {
                    'id': '2',
                    'user_image': 'risa-olive.jpg',
                    'username': 'Sulis Solawat',
                    'created_at': '10 menit yang lalu',
                    'content':
                        "Anda hanya perlu meluangkan waktu sejenak untuk menenangkan pikiran dan mengingat hal - hal baik yang terjadi. Semoga anda menjadi lebih baik, semangat!",
                    'like': 77
                  }
                ]
              }
            : {
                'id': '3',
                'user_image': 'tony-setiawan.jpg',
                'username': 'Tony Setiawan',
                'created_at': '2 hari  yang lalu',
                'content':
                    "Apakah olahraga dapat membantu meningkatkan mood dan mental seseorang?",
                'like': 120,
                'comment': 43,
                'view': 467,
                'isPolling': false,
                'desc':
                    'Ditengah hiruk piuk dunia bagaimana cara kalian untuk meningkatkan mood? Jujur saja saya sendiri lelah dengan hidup ini apalagi dengan pekerjaan yang melelahkan.',
                'tags': ['mood', 'pekerjaan'],
                'pooling': [],
                'comments': [
                  {
                    'id': '1',
                    'user_image': 'risa-olive.jpg',
                    'username': 'Tony Setiawan',
                    'created_at': '2 menit yang lalu',
                    'content': "Menurut saya anda hanya perlu healing.",
                    'like': 12
                  },
                  {
                    'id': '2',
                    'user_image': 'risa-olive.jpg',
                    'username': 'Sulis Solawat',
                    'created_at': '10 menit yang lalu',
                    'content':
                        "Anda hanya perlu meluangkan waktu sejenak untuk menenangkan pikiran dan mengingat hal - hal baik yang terjadi. Semoga anda menjadi lebih baik, semangat!",
                    'like': 77
                  }
                ]
              };
  }

  @override
  void onInit() {
    getPopularTopic();
    getCommunityForYou();
    getHottestPost();
    super.onInit();
  }
}
