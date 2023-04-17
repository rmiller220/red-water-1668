require 'rails_helper'

RSpec.describe 'Chef Show Page' do
  describe 'As a visitor' do
    before :each do
      test_data
    end
    it "I see a link to view a list of all ingredients
        that this chef uses in their dishes" do
      visit "/chefs/#{@chef_1.id}"

      expect(page).to have_link("View #{@chef_1.name}'s Ingredients")

      visit "/chefs/#{@chef_2.id}"

      expect(page).to have_link("View #{@chef_2.name}'s Ingredients")
    end

    it "When I click on that link I'm taken to a chef's ingredients index page
        and I see a unique list of names of all the ingredients that this
        chef uses" do
      visit "/chefs/#{@chef_1.id}"

      click_link("View #{@chef_1.name}'s Ingredients")
      expect(current_path).to eq("/chefs/#{@chef_1.id}/ingredients")

      expect(page).to have_content(@ingredient_1.name)
      expect(page).to have_content(@ingredient_2.name)
      expect(page).to have_content(@ingredient_3.name)

      visit "/chefs/#{@chef_2.id}"

      click_link("View #{@chef_2.name}'s Ingredients")
      
      expect(current_path).to eq("/chefs/#{@chef_2.id}/ingredients")
      expect(page).to have_content(@ingredient_4.name)
      expect(page).to have_content(@ingredient_5.name)
      expect(page).to have_content(@ingredient_2.name)
    end
  end
end
# As a visitor
# When I visit a chef's show page
# I see a link to view a list of all ingredients that this chef uses in their dishes.
# When I click on that link
# I'm taken to a chef's ingredients index page
# and I can see a unique list of names of all the ingredients that this chef uses.