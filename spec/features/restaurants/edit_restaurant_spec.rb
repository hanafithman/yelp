describe "Editing a restaurant" do
  it "updates the restaurant and shows the restaurant's updated details" do
    # Arrange
    restaurant = Restaurant.create!(restaurant_attributes)

    # Action
    visit restaurant_path(restaurant)
    click_link "Edit"

    # Assert
    expect(current_path).to eq(edit_restaurant_path(restaurant))
    expect(find_field("Name").value).to eq(restaurant.name)

    # Action
    fill_in "Name", with: "Updated Restaurant Name"
    click_button "Update Restaurant"

    # Assert
    expect(current_path).to eq(restaurant_path(restaurant))
    expect(page).to have_text("Updated Restaurant Name")
    # TODO: expect(page).to have_text("Restaurant successfully updated!")
  end
end