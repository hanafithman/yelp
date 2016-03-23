def restaurant_attributes(overrides = {})
  {
    name: "Test Cafe",
    address: "123 Fake Street, New York, NY 10001",
    phone: "(123) 456-7890",
    website: "http://www.testcafe.com",
    image: open("#{Rails.root}/app/assets/images/restaurant.png")
  }.merge(overrides)
end

def user_attributes(overrides = {})
  {
    first_name: "User",
    last_name: "Example",
    email: "user@example.com",
    password: "secretgarden",
    password_confirmation: "secretgarden"
  }.merge(overrides)
end