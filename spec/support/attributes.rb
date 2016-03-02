def restaurant_attributes(overrides = {})
  {
    name: "Test Cafe",
    address: "123 Fake Street, New York, NY 10001",
    phone: "(123) 456-7890",
    website: "http://www.testcafe.com"
  }.merge(overrides)
end