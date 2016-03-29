# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
restaurants = Restaurant.create!([
  {
    name: "The Origin Cafe & Restaurant",
    address: "8, Jalan 1/67B, Off Jalan Mengkudu, Ampang, 55000 Kuala Lumpur, Malaysia",
    phone: "03-42535388",
    website: "http://www.originvegcafe.com",
    image: open("#{Rails.root}/app/assets/images/originvegcafe.jpg")  
  },
  {
    name: "Aenon Health Kitchen",
    address: "No 1, Jalan 4/93, Taman Miharja, 55200 Kuala Lumpur, Malaysia",
    phone: "03-92010972",
    website: "http://aenonhealthkitchen.webs.com",
    image: open("#{Rails.root}/app/assets/images/aenonhealthkitchen.jpg")  
  },  
  {
    name: "Eco Life Kitchen",
    address: "40-4, Jalan Metro Pudu, 55100, Kuala Lumpur, Malaysia",
    phone: "03-92210133",
    website: "https://www.facebook.com/Eco-Life-Kitchen-%E5%9C%92%E5%91%B3%E9%A3%9F%E5%9D%8A-625332800933830",
    image: open("#{Rails.root}/app/assets/images/ecolifekitchen.jpg")  
  },    
  {
    name: "Fortunate Coffee",
    address: "H-G-3A, Plaza Riverwalk, Off Jalan Ipoh, 51200 Kuala Lumpur, Malaysia",
    phone: "03-40400305",
    website: "https://www.facebook.com/fortunatecoffeemy",
    image: open("#{Rails.root}/app/assets/images/fortunatecoffee.png")  
  },    
  {
    name: "Gandhi's Vegetarian Restaurant",
    address: "Scott Sentral Service, Ste 3A/05, Ground Floor, 28 Jalan Scott, Brickfields, 50470 Kuala Lumpur, Malaysia",
    phone: "03-22733190",
    website: "https://www.facebook.com/Gandhis-Vegetarian-Restaurant-228968530504442",
    image: open("#{Rails.root}/app/assets/images/gandhisvegetarian.jpg")  
  },    
  {
    name: "Happy Garden Vege Cafe",
    address: "Jalan 3/23A, Taman Danau Kota, Off Jalan Genting Kelang, Setapak, 53300 Kuala Lumpur, Malaysia",
    phone: "+60 3-41442281",
    website: "https://www.facebook.com/Happy-Garden-Vege-Cafe-595047500550023",
    image: open("#{Rails.root}/app/assets/images/happygarden.jpg")  
  },    
])

#restaurants.each { |restaurant| puts restaurant.name }

20.times do |n|
  first_name = Faker::Name.first_name
  password = Faker::Internet.password
  User.create!(
    first_name: first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.safe_email(first_name),
    password: password,
    password_confirmation: password    
  )
end

user_ids = User.pluck(:id)
ratings = [1, 2, 3, 4, 5]
review_count = [5, 10, 15, 20]
restaurants.each do |restaurant|
  review_count.sample.times do
    Review.create!(
      rating: ratings.sample,
      comment: Faker::Lorem.paragraph,  
      user_id: user_ids.sample,
      restaurant_id: restaurant.id
    )
  end
end