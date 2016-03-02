describe "A restaurant" do
  it "requires a name" do
    # Arrange
    restaurant = Restaurant.new(name: "")

    # Action
    restaurant.valid? # populate errors

    # Assert
    expect(restaurant.errors[:name].any?).to eq(true)
  end

  it "is valid with example attributes" do
    # Arrange
    restaurant = Restaurant.new(restaurant_attributes)

    # Assert
    expect(restaurant.valid?).to eq(true)
  end
end