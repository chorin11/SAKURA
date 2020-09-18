# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

  User.create!(
    [
      { id: 1,
        email: '1@1',
        name: '太郎',
        favorite_sweets: 'どら焼き',
        password: '111111'
      },
      { id: 2,
        email: '2@2',
        name: 'ももこ',
        favorite_sweets: '大福',
        password: '222222'
      },
      { id: 3,
        email: '3@3',
        name: 'てつこ',
        favorite_sweets: '饅頭',
        password: '333333'
      },
      { id: 4,
        email: '4@4',
        name: '一郎',
        favorite_sweets: 'もなか',
        password: '444444'
      },
      { id: 5,
        email: '5@5',
        name: '次郎',
        favorite_sweets: '羊羹',
        password: '555555'
      },
      { id: 6,
        email: '6@6',
        name: 'ともこ',
        favorite_sweets: 'あんみつ',
        password: '666666'
      },
      { id: 7,
        email: '7@7',
        name: '三郎',
        favorite_sweets: '栗まんじゅう',
        password: '777777',
      },
      { id: 8,
        email: '8@8',
        name: 'まち子',
        favorite_sweets: '桜もち',
        password: '888888'
      },
      { id: 9,
        email: '9@9',
        name: '吾郎',
        favorite_sweets: 'お干菓子',
        password: '999999'
      },
      { id: 10,
        email: '10@10',
        name: '夏子',
        favorite_sweets: '草餅',
        password: '000000'
      }
    ]
  )