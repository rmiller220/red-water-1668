require 'rails_helper'

RSpec.describe Dish, type: :model do
  describe "validations" do
    it {should validate_presence_of :name}
    it {should validate_presence_of :description}
  end
  describe "relationships" do
    it {should belong_to :chef}
    it {should have_many :dish_ingredients}
    it {should have_many(:ingredients).through(:dish_ingredients)}
  end

  describe "instance methods" do
    before :each do
      test_data
    end
    it "#total_calories" do
      expect(@dish_1.total_calories).to eq(300)
      expect(@dish_3.total_calories).to eq(600)
    end

    it "#dish_chef_name" do
      expect(@dish_1.dish_chef_name).to eq(@chef_1.name)
      expect(@dish_3.dish_chef_name).to eq(@chef_2.name)
    end
  end
end