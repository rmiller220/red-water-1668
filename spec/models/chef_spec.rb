require 'rails_helper'

RSpec.describe Chef, type: :model do
  describe "validations" do
    it {should validate_presence_of :name}
  end
  describe "relationships" do
    it {should have_many :dishes}
    it {should have_many(:ingredients).through(:dishes)}
  end

  describe "instance methods" do
    before :each do
      test_data
    end
    it "#unique_ingredients" do
      expect(@chef_1.unique_ingredients.sort).to eq([@ingredient_1, @ingredient_2, @ingredient_3].sort)
      expect(@chef_2.unique_ingredients.sort).to eq([@ingredient_4, @ingredient_5, @ingredient_2].sort)
    end
  end
end