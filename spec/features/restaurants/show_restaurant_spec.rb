describe "Viewing an individual restaurant" do
  it "shows the restaurant's details" do
    # Arrange
    restaurant = Restaurant.create!(restaurant_attributes)

    # Action
    visit restaurant_url(restaurant)

    # Assert
    expect(page).to have_text(restaurant.name)
    expect(page).to have_text(restaurant.address)
    expect(page).to have_text(restaurant.phone)
    expect(page).to have_text(restaurant.website)
  end

  # TODO
  # it "shows the restaurant's name in the page title" do
  #   # Arrange
  #   restaurant = Restaurant.create!(restaurant_attributes(name: "Veg Cafe"))

  #   # Action
  #   visit restaurant_url(restaurant)

  #   # Assert
  #   expect(page).to have_title("Yelpdemo - #{restaurant.name}")
  # end

  # TODO
  # it "has an SEO-friendly URL" do
  #   # Arrange
  #   restaurant = Restaurant.create!(restaurant_attributes(name: "Veg: Cafe"))

  #   # Action
  #   visit restaurant_url(restaurant)

  #   # Assert
  #   expect(current_path).to eq("/restaurants/veg-cafe")
  # end
end