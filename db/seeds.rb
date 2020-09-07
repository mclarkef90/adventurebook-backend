# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

users= User.create([
  {
  username:"morgan", email: "morgan@aol.com", password_digest: "morgan", biography: "born in NJ", profile_img:"https://images.theconversation.com/files/350865/original/file-20200803-24-50u91u.jpg?ixlib=rb-1.1.0&q=45&auto=format&w=1200&h=1200.0&fit=crop"
  },
  {
  username:"brad", email: "brad@aol.com", password_digest: "brad", biography: "born in RI", profile_img:"https://i.guim.co.uk/img/media/c9b0aad22638133aa06cd68347bed2390b555e63/0_477_2945_1767/master/2945.jpg?width=1200&height=1200&quality=85&auto=format&fit=crop&s=97bf92d90f51da7067d00f8156512925"
  },
  {
  username:"lauren", email: "Lauren@aol.com", password_digest: "lauren", biography: "born in NJ and morgan's older sister", profile_img:"https://www.aljazeera.com/mritems/imagecache/mbdxxlarge/mritems/Images/2020/4/13/ecab8c7af42a439d9043b0ade6e1f05b_18.jpg"
  }
  ])

adventures= Adventure.create([
  {
  user_id: 2,
  title: "Top of the Gate",
  description: "Potomac riverside lounge atop Watergate Hotel with breathtaking view, cocktails & Italian bites.",
  image_url: "https://media-cdn.tripadvisor.com/media/photo-s/0f/3e/05/0c/view-at-sunset-at-top.jpg",
  completions: 2, likes: 1
  },
  {
  user_id: 1,
  title: "Boat to Mt.Vernon",
  description: "Mount Vernon is an American landmark and former plantation of George Washington, the first President of the United States, and his wife, Martha Washington. The estate is on the banks of the Potomac River in Fairfax County, Virginia, near Alexandria, across from Prince George's County, Maryland",
  image_url: "https://upload.wikimedia.org/wikipedia/commons/5/50/WestFrontMansionMountVernon.jpg",
  likes: 5
  },
  {
  user_id: 3,
  title: "Dumbarton Oaks",
  description: "The Garden, designed by renowned landscape gardener Beatrix Farrand, is an oasis within the city. Explore sixteen acres of terraced gardens and vistas, orchards and kitchen gardens, and a vast wilderness of meadows and wooded pathways. The Museum is home to a world-class collection of Byzantine and Pre-Columbian art, housed in magnificent galleries.",
  image_url: "https://upload.wikimedia.org/wikipedia/commons/a/ad/Fountainterrace2b.jpg"
  },
  ])

reviews= Review.create([
  {
  comment: "Dying to go back, drinks were expensive",
  user_id: 3,
  adventure_id: 1,
  completed: true,
  liked: true
  },
  {
  comment: "Great Plants!",
  user_id: 2,
  adventure_id: 3
  },
  {
  comment: "Got Seasick",
  user_id: 1,
  adventure_id: 2,
  completed: true,
  liked: true
  },
  {
  comment: "Beautiful views of Georgetown",
  user_id: 1,
  adventure_id: 1,
  completed: true,
  liked: true
  }
  ])
