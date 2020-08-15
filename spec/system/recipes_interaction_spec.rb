require 'rails_helper'

RSpec.describe "RecipesInteraction" do
  let(:user) { create(:user) }
  let(:recipe) { create(:recipe, user: user) }

  before do
    driven_by :rack_test

    system_log_in(user)
  end

  describe 'Creating a recipe' do
    it 'creates and shows the newly created recipe' do
      title = 'Test Recipe'
      description = 'Test description'
      instructions = 'Test instruction'
      ingredients = 'Test ingredient'

      click_on('Add Recipe')

      within('form') do
        fill_in 'recipe_title', with: title
        fill_in 'recipe_description', with: description
        fill_in 'recipe_instructions_attributes_0_step', with: instructions
        fill_in 'recipe_ingredients_attributes_0_name', with: ingredients

        click_on 'Create Recipe'
      end

      expect(page).to have_content(title)
      expect(page).to have_content(description)
      expect(page).to have_content(instructions)
      expect(page).to have_content(ingredients)
    end
  end

  describe 'Editing a recipe' do
    it 'edits and shows the recipe' do
      title = 'Test Recipe'
      description = 'Test description'
      instructions = 'Test instruction'
      ingredients = 'Test ingredient'

      visit recipe_path(recipe)

      click_on 'Edit Recipe'

      within('form') do
        fill_in 'recipe_title', with: title
        fill_in 'recipe_description', with: description
        fill_in 'recipe_instructions_attributes_0_step', with: instructions
        fill_in 'recipe_ingredients_attributes_0_name', with: ingredients

        click_on 'Update Recipe'
      end

      expect(page).to have_content(title)
      expect(page).to have_content(description)
      expect(page).to have_content(instructions)
      expect(page).to have_content(ingredients)
    end
  end

  describe 'Deleting an recipe' do
    it 'deletes the recipe and redirect to index view' do
      visit recipe_path(recipe)

      click_on 'Delete Recipe'

      expect(page).to have_content('Recipes')
    end
  end

  describe 'Going home to recipe index page' do
    it 'goes back to recipe index page' do
      visit recipe_path(recipe)

      click_on 'Home'

      expect(page).to have_content('Recipes')
    end
  end
end
