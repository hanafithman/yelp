describe "Navigating restaurants" do
  it "allows navigation from the detail page to the listing page" do
    # Arrange
    restaurant = Restaurant.create!(restaurant_attributes)

    # Action
    visit restaurant_url(restaurant)
    click_link "Back"

    # Assert
    expect(current_path).to eq(restaurants_path)
  end

  it "allows navigation from the listing page to the detail page" do
    # Arrange
    restaurant = Restaurant.create!(restaurant_attributes)
    visit restaurants_url

    # Action
    page.first("a", text: "Show").click

    # Assert
    expect(current_path).to eq(restaurant_path(restaurant))
  end
end