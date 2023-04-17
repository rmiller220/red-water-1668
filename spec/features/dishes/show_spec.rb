require 'rails_helper'

RSpec.describe 'Dish Show Page' do
  describe 'As a visitor' do
    before :each do
      test_data
      
    end
    it "I see the dish's name and description" do
      visit "/dishes/#{@dish_1.id}"

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

    it "I see a form to add an existing Ingredient to that Dish" do
      visit "/dishes/#{@dish_1.id}"

      expect(page).to have_content("Add Ingredient:")
      expect(page).to have_field(:ingredient_id)
      expect(page).to have_button("Submit")

      visit "/dishes/#{@dish_3.id}"

      expect(page).to have_content("Add Ingredient:")
      expect(page).to have_field(:ingredient_id)
      expect(page).to have_button("Submit")
    end

    it "When I fill in the form with the ID of an Ingredient that exists in the database" do
      visit "/dishes/#{@dish_1.id}"

      fill_in :ingredient_id, with: @ingredient_3.id
      click_button "Submit"
      expect(current_path).to eq("/dishes/#{@dish_1.id}")

      within "#ingredients" do
        expect(page).to have_content(@ingredient_3.name)
      end
    end
  end 
end