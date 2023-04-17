require 'rails_helper'

RSpec.describe 'Dish Show Page' do
  describe 'As a visitor' do
    before :each do
      test_data
      
    end
    it "I see the dish's name and description" do
      visit "/dishes/#{@dish_1.id}"
      save_and_open_page
      expect(page).to have_content("#{@dish_1.name} show page")
      expect(page).to have_content("Name: #{@dish_1.name}")
      expect(page).to have_content("Description: #{@dish_1.description}")
      visit "/dishes/#{@dish_3.id}"
      expect(page).to have_content("#{@dish_3.name} show page")
      expect(page).to have_content("Name: #{@dish_3.name}")
      expect(page).to have_content("Description: #{@dish_3.description}")
    end

    it "I see a list of ingredients for that dish and a total calorie count" do
      visit "/dishes/#{@dish_1.id}"
      within "#ingredients" do
        expect(page).to have_content("Ingredients:")
        expect(page).to have_content(@ingredient_1.name)
        expect(page).to have_content(@ingredient_2.name)
      end 
      expect(page).to have_content("Total Calories: #{@dish_1.total_calories}")
      visit "/dishes/#{@dish_3.id}"

      within "#ingredients" do
        expect(page).to have_content("Ingredients:")
        expect(page).to have_content(@ingredient_4.name)
        expect(page).to have_content(@ingredient_2.name)
      end
      expect(page).to have_content("Total Calories: #{@dish_3.total_calories}")
    end

    it "I see the chef's name" do
      visit "/dishes/#{@dish_1.id}"
      expect(page).to have_content("Chef: #{@dish_1.chef.name}")
      visit "/dishes/#{@dish_3.id}"
      expect(page).to have_content("Chef: #{@dish_3.chef.name}")
    end

  end 
end