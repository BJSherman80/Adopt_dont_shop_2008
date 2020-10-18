# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Pet.destroy_all
Shelter.destroy_all


shelter_1 = Shelter.create( name: "Brett's Pet Palace",
                            address: "456 Sesame Ave",
                            city: "Denver",
                            state: "CO",
                            zip: 80222,
                            )
shelter_2 = Shelter.create( name: "Critters Galore",
                           address: "222 22nd Ave.",
                           city: "Denver",
                           state: "CO",
                           zip: 82222,
                           )
shelter_3 = Shelter.create( name: "Fuzzy Friends",
                          address: "444 44th Ave.",
                          city: "Denver",
                          state: "CO",
                          zip: 84444,
                          )

user_1 = User.create( name: "Austin Powers",
                          address: "4555 Shag Ave",
                          city: "Denver",
                          state: "CO",
                          zip: 84444,
                          id: 1
                          )
review_1 = Review.create!(shelter_id: shelter_1.id, user_id: user_1.id, title: "Horrible service", rating: 1, content: "I saw a man slap a kitten", picture: "https://felineengineering.com/wp-content/uploads/2019/07/Adorable-sad-kitten-e1562788887775-974x1024.jpg", name_of_user: "Dr. Evil")
review_2 = Review.create!(shelter_id: shelter_1.id, user_id: user_1.id, title: "Buncha Cuties", rating: 5, content: "There's hairless cats here!", name_of_user: "Dr. Evil")
shelter_1.pets.create!(name: "Lex Luther", age: 7, sex: "Male", image: "https://www.rd.com/wp-content/uploads/2018/12/50-Funny-Animal-Pictures-That-You-Need-In-Your-Life-25.jpg")
shelter_1.pets.create!(name: "Bart", age: 4, sex: "Female", image: "https://i.pinimg.com/236x/19/80/34/198034b0276ec4242dc003c13d328e9e--big-eyes-lemurs.jpg")
shelter_1.pets.create!(name: "Kevin", age: 3, sex: "Female", image: "https://www.insidedogsworld.com/wp-content/uploads/2017/06/German-Shepherd-Standard-Coat-GSC-1000x575-1-1-1-1-1000x575.jpg")
shelter_1.pets.create!(name: "Lucy", age: 4, sex: "Female", image: "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcTP7Uk2EhVbKema9-M5rUWlW-Xxk-EN88WViQ&usqp=CAU")
shelter_2.pets.create!(name: "Elon Musk", age: 5, sex: "Male", image: "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcS170WDJT1xQLj237cvbRIFR0K-rMR-Ga8isw&usqp=CAU")
shelter_2.pets.create!(name: "Kobe", age: 6, sex: "Female", image: "https://cdn.mos.cms.futurecdn.net/VSy6kJDNq2pSXsCzb6cvYF.jpg")
shelter_2.pets.create!(name: "Durant", age: 7, sex: "Male", image: "https://img.webmd.com/dtmcms/live/webmd/consumer_assets/site_images/article_thumbnails/other/dog_cool_summer_slideshow/1800x1200_dog_cool_summer_other.jpg")
shelter_3.pets.create!(name: "Derek Carr", age: 8, sex: "Female", image: "https://thehappypuppysite.com/wp-content/uploads/2018/05/chow-chow-header.jpg")
shelter_3.pets.create!(name: "Randy Moss", age: 9, sex: "Female", image: "https://www.bostonherald.com/wp-content/uploads/2020/05/GettyImages-824860820.jpg")
shelter_3.pets.create!(name: "Minty", age: 10, sex: "Female", image: "https://thumbs-prod.si-cdn.com/nnJARGtKrLypH4y3Vov2zGTG4xw=/fit-in/1600x0/filters:focal(554x699:555x700)/https://public-media.si-cdn.com/filer/a4/04/a404c799-7118-459a-8de4-89e4a44b124f/img_1317.jpg")
