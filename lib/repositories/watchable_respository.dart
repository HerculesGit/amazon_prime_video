class WatchableRepository {
  /// Category - Home, TV Shows, Movies or Kids
  Future<Map<String, dynamic>> findAllWatchableByCategory(
      String category) async {
    return mockData[category];
  }

  /// movieId or serieId
  Future<Map<String, dynamic>> getCompleteWatchableInfo(
      String watchableId) async {
    return watchableInfo;
  }

  Map<String, dynamic> watchableInfo = {
    'type': 'movie',
    'name': 'The Legend of Hercules',
    'languages': {
      'audio': [],
      'subtitles': [],
    },
    'castAndCrew': [
      {
        'name': 'Taron Egerton',
        'url':
            'https://m.media-amazon.com/images/M/MV5BMTYzODU2OTI2Nl5BMl5BanBnXkFtZTgwMTUyMTAwMzE@._V1_.jpg',
        'from':
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut et massa et ligula sodales eleifend. Cras vitae nulla pharetra, sodales lacus a, pulvinar justo. Pellentesque arcu massa, malesuada vel sagittis tristique, faucibus at est. Mauris at massa non leo dignissim vulputate. Nulla eu blandit magna. Nunc non dui sit amet lorem consequat gravida. ',
        'know for': '',
        'trivia':
            'Curabitur in leo non massa convallis mattis quis id libero. Donec nec metus venenatis, tincidunt velit eget, viverra urna. Vestibulum ac hendrerit dui, s',
        'quotes':
            'Vestibulum in faucibus orci luctus et ultrices posuere cubilia curae; Vivamus ut diam nec nunc dictum sagittis. Suspendisse gravida',
      }
    ],
    "director": {}
  };

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
    'Movies': {
      'carousel': [
        'https://i.ytimg.com/vi/MZj7G_TDrmQ/maxresdefault.jpg',
        'https://i.ytimg.com/vi/Xk9yNpTxA5w/maxresdefault.jpg',
        'https://i.ytimg.com/vi/vRHXSF0EyDM/maxresdefault.jpg',
      ],
      'categories': [
        {
          'name': 'Watch next movies',
          'movies': [
            {
              'name': 'Street Fight',
              'url': 'https://i.ytimg.com/vi/MZj7G_TDrmQ/maxresdefault.jpg'
            },
            {
              'name': 'Shrek',
              'url': 'https://i.ytimg.com/vi/Lg8PL6nAtSQ/maxresdefault.jpg'
            },
            {
              'name': 'Angry Birds',
              'url': 'https://i.ytimg.com/vi/fpw37HP1e1U/maxresdefault.jpg'
            }
          ],
        },
        {
          'name': 'Amazon Original movies',
          'movies': [
            {
              'name': 'The LIE',
              'url': 'https://i.ytimg.com/vi/i84yWy-Mnts/maxresdefault.jpg'
            },
            {
              'name': '7500',
              'url': 'https://i.ytimg.com/vi/CBLgZ8oy_aA/hqdefault.jpg'
            },
            {
              'name': 'Sharke Whater Extention',
              'url': 'https://i.ytimg.com/vi/RQYHBrtYsnk/maxresdefault.jpg'
            }
          ],
        },
        {
          'name': 'TV show we think you\'ll like',
          'movies': [
            {
              'name': 'Além da Suspeita',
              'url': 'https://i.ytimg.com/vi/DMaEt3F2UWI/maxresdefault.jpg'
            },
            {
              'name': 'Mr Bean Holiday',
              'url': 'https://i.ytimg.com/vi/vRHXSF0EyDM/maxresdefault.jpg'
            }
          ],
        },
        {
          'name': 'Recently added movies',
          'movies': [
            {
              'name': 'Sequestro',
              'url': 'https://i.ytimg.com/vi/Uba0RYjS4EI/maxresdefault.jpg'
            },
            {
              'name': 'Entre A Vingança E O Perdão',
              'url': 'https://i.ytimg.com/vi/CxABWZmT0H8/maxresdefault.jpg'
            },
            {
              'name': 'A Pele de Onagro',
              'url': 'https://i.ytimg.com/vi/DD6moinW5Xg/hqdefault.jpg'
            }
          ],
        }
      ],
    },
    'Kids': {
      'carousel': [
        'https://i.ytimg.com/vi/APyim55ZM2c/maxresdefault.jpg',
        'https://i.ytimg.com/vi/bwGRxdpFmRU/maxresdefault.jpg',
        'https://i.ytimg.com/vi/Q7MaTqgtoxE/maxresdefault.jpg',
      ],
      'categories': [
        {
          'name': 'Watch next movies',
          'movies': [
            {
              'name': 'Dora',
              'url': 'https://i.ytimg.com/vi/APyim55ZM2c/maxresdefault.jpg'
            },
            {
              'name': 'Kung Fu Panda',
              'url': 'https://i.ytimg.com/vi/yCk9VAxEpD0/hqdefault.jpg'
            },
            {
              'name': 'Patati Patata',
              'url': 'https://i.ytimg.com/vi/WJab4pLAQsg/hqdefault.jpg'
            },
          ],
        },
        {
          'name': 'Funny',
          'movies': [
            {
              'name': 'Meet Dave',
              'url': 'https://i.ytimg.com/vi/Y-0vUXX084c/maxresdefault.jpg'
            },
            {
              'name': 'De Volta ao Fundo do Mar',
              'url': 'https://i.ytimg.com/vi/w8Dzld_k7HY/hqdefault.jpg'
            },
            {
              'name': 'The Little Ghost',
              'url': 'https://i.ytimg.com/vi/oUCFU28js18/maxresdefault.jpg'
            }
          ],
        },
        {
          'name': 'Brazilian TV for Kids',
          'movies': [
            {
              'name': 'Osmar 2',
              'url': 'https://i.ytimg.com/vi/DlUXehDm5sg/maxresdefault.jpg'
            },
            {
              'name': 'Peixonauta',
              'url': 'https://i.ytimg.com/vi/s1PcmR44VxY/maxresdefault.jpg'
            }
          ],
        },
        {
          'name': 'Recently added movies',
          'movies': [
            {
              'name': 'Sequestro',
              'url': 'https://i.ytimg.com/vi/Uba0RYjS4EI/maxresdefault.jpg'
            },
            {
              'name': 'Entre A Vingança E O Perdão',
              'url': 'https://i.ytimg.com/vi/CxABWZmT0H8/maxresdefault.jpg'
            },
            {
              'name': 'A Pele de Onagro',
              'url': 'https://i.ytimg.com/vi/DD6moinW5Xg/hqdefault.jpg'
            }
          ],
        }
      ],
    },
  };
}
