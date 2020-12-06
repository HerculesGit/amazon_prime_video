class WatchableRepository {
  /// Category - Home, TV Shows, Movies or Kids
  Future<Map<String, dynamic>> findAllWatchableByCategory(
      String category) async {
    return mockData[category];
  }

  Map<String, dynamic> mockData = {
    'Home': {
      'carousel': [
        'https://i.ytimg.com/vi/ptG5yyDacxs/maxresdefault.jpg',
        'https://i.ytimg.com/vi/Wm92_RnFfwA/hqdefault.jpg',
        'https://i.ytimg.com/vi/5ZMNkdYO3WY/maxresdefault.jpg',
        'https://i.ytimg.com/vi/0rWC9iDTDvM/hqdefault.jpg',
        'https://i.ytimg.com/vi/iUjgnXe1TyQ/maxresdefault.jpg'
      ],
      'categories': [
        {
          'name': 'Amazon Originals an Exclusives',
          'movies': [
            {
              'name': 'STUMPTOWN',
              'url':
                  'https://poltronanerd.com.br/wp-content/uploads/2020/09/Stumptown.jpg'
            },
            {
              'name': 'UTOPIA',
              'url': 'https://i.vimeocdn.com/video/836493924_1280x720.jpg'
            },
            {
              'name': 'ALEX RIDER',
              'url': 'https://i.ytimg.com/vi/U9g9A005UNQ/maxresdefault.jpg'
            }
          ],
        },
        {
          'name': 'Recommended movies',
          'movies': [
            {
              'name': 'CÃO DE BRIGA',
              'url':
                  'https://images.justwatch.com/backdrop/8871157/s1440/cao-de-briga.jpg'
            },
            {
              'name': 'RAMBO',
              'url': 'https://i.ytimg.com/vi/sGTGdpwcxP0/maxresdefault.jpg'
            },
            {
              'name': 'PRISION BREAK',
              'url':
                  'https://cdn.fstatic.com/media/movies/photos/2019/06/prison-break-o-resga_t13341.jpg'
            }
          ],
        },
        {
          'name': 'TV show we think you\'ll like',
          'movies': [
            {
              'name': 'BLACK BOX',
              'url': 'https://i.ytimg.com/vi/Qrc8wQqnl0g/maxresdefault.jpg'
            },
            {
              'name': 'HAND NIGHT',
              'url': 'https://i.ytimg.com/vi/BJsQ6zGsnVg/maxresdefault.jpg'
            }
          ],
        },
        {
          'name': 'Recently added movies',
          'movies': [
            {
              'name': 'OLHOS DE DRAGÃO',
              'url': 'https://i.ytimg.com/vi/CK5jXnJA_-Q/maxresdefault.jpg'
            },
            {
              'name': 'RAMBO',
              'url':
                  'https://hmlobservatoriodocinema.elav.tmp.br/wp-content/uploads/2018/07/Jean-Claude-Van-Damme-O-Grande-Dragao-Branco.jpg'
            },
            {
              'name': 'RINGUE DA MORTE',
              'url': 'https://i.ytimg.com/vi/GkzhFUa4SQ8/maxresdefault.jpg'
            }
          ],
        }
      ],
    },
    'TV Shows': {
      'carousel': [
        'https://i.ytimg.com/vi/BjLMHCsdPUg/hqdefault.jpg',
        'https://i.ytimg.com/vi/Xk9yNpTxA5w/maxresdefault.jpg',
        'https://i.ytimg.com/vi/LvjyjkQqGOM/maxresdefault.jpg',
        'https://i.ytimg.com/vi/UtgeE2VzH9M/maxresdefault.jpg',
      ],
      'categories': [
        {
          'name': 'Watch next TV',
          'movies': [
            {
              'name': 'Bob esponja',
              'url':
                  'https://pm1.narvii.com/6907/afebd2912aa71bf20f919c14c2fbb8c08bb00db8r1-724-423v2_uhq.jpg'
            },
            {
              'name': 'Kung Fu Panda',
              'url': 'https://i.ytimg.com/vi/yCk9VAxEpD0/hqdefault.jpg'
            },
            {
              'name': 'Cat Dog',
              'url': 'https://i.ytimg.com/vi/sklZyTp_wwY/maxresdefault.jpg'
            }
          ],
        },
        {
          'name': 'Amazon Originals and Exclusives',
          'movies': [
            {
              'name': 'Dragon Ball Z',
              'url': 'https://i.ytimg.com/vi/03dhtuWST4I/maxresdefault.jpg'
            },
            {
              'name': 'Yu-Gi-Oh! Duel',
              'url': 'https://i.ytimg.com/vi/-trOH68OAGU/maxresdefault.jpg'
            },
            {
              'name': 'As Aventuras de Jackie Chan',
              'url': 'https://i.ytimg.com/vi/xnMHxtfYgbw/maxresdefault.jpg'
            }
          ],
        },
        {
          'name': 'TV show we think you\'ll like',
          'movies': [
            {
              'name': 'Astro Boy',
              'url': 'https://i.ytimg.com/vi/pm75fD2Cii0/hqdefault.jpg'
            },
            {
              'name': 'Tartarugas Ninja',
              'url': 'https://i.ytimg.com/vi/dqQ29NT63Vk/maxresdefault.jpg'
            }
          ],
        },
        {
          'name': 'Recently added movies',
          'movies': [
            {
              'name': 'Bakugan: Guerreiros da Batalha',
              'url': 'https://i.ytimg.com/vi/Gtu7fsep3I8/maxresdefault.jpg'
            },
            {
              'name': 'Beyblade',
              'url': 'https://i.ytimg.com/vi/OOYr_5qi4UA/maxresdefault.jpg'
            },
            {
              'name': 'Bomberman Jetters',
              'url': 'https://i.ytimg.com/vi/PwjZ-81yA6E/hqdefault.jpg'
            }
          ],
        }
      ],
    },
  };
}
