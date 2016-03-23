describe "Creating a new restaurant" do
  before do
    admin = User.create!(user_attributes(admin: true))
    sign_in(admin)
  end

  it "saves the restaurant and shows the new restaurant's details" do
    # Arrange
    restaurant = Restaurant.new(restaurant_attributes)

    # Action
    visit restaurants_url
    click_link "New Restaurant"

    # Assert
    expect(current_path).to eq(new_restaurant_path)
    expect(find_field("Name").value).to eq(nil)
    expect(find_field("Address").value).to eq(nil)
    expect(find_field("Phone").value).to eq(nil)
    expect(find_field("Website").value).to eq(nil)

    # Action
    fill_in "Name", with: restaurant.name
    fill_in "Address", with: restaurant.address
    fill_in "Phone", with: restaurant.phone
    fill_in "Website", with: restaurant.website
    attach_file "Image", "#{Rails.root}/app/assets/images/restaurant.png"

    click_button "Create Restaurant"

    # Assert
    expect(current_path).to eq(restaurant_path(Restaurant.last))
    expect(page).to have_text(restaurant.name)
    expect(page).to have_text(restaurant.address)
    expect(page).to have_text(restaurant.phone)
    expect(page).to have_text(restaurant.website)
    # TODO: expect(page).to have_text("Movie was successfully created!")
  end
end
