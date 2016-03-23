describe "Viewing the list of restaurants" do
  it "show the restaurants" do
    # Arrange
    restaurant1 = Restaurant.create!(name: "Veg Cafe",
                                     address: "123 Fake Street, New York, NY 10001",
                                     phone: "(123) 456-7890", 
                                     website: "http://www.vegcafe.com",
                                     image: open("#{Rails.root}/app/assets/images/restaurant.png"))
    restaurant2 = Restaurant.create!(name: "Veg Steamboat",
                                     address: "38 Fake Avenue, Boston, MA 02115", 
                                     phone: "(234) 567-8901", 
                                     website: "http://www.vegsteamboat",
                                     image: open("#{Rails.root}/app/assets/images/restaurant.png"))
    restaurant3 = Restaurant.create!(name: "Veg Sushi",
                                     address: "168 Fake Alley, Detroit, MI 48226",
                                     phone: "(345) 678-9012", 
                                     website: "http://www.vegsushi.com",
                                     image: open("#{Rails.root}/app/assets/images/restaurant.png"))

    # Action
    visit restaurants_url

    # Assert
    expect(page).to have_text(restaurant1.name)
    expect(page).to have_text(restaurant2.name)
    expect(page).to have_text(restaurant3.name)

    expect(page).to have_text(restaurant1.address)
    expect(page).to have_text(restaurant1.phone)
    expect(page).to have_text(restaurant1.website)
  end
end