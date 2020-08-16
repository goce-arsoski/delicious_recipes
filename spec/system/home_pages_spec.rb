require 'rails_helper'

RSpec.describe 'HomePages' do
  before do
    driven_by :rack_test

    visit root_path
  end

  it 'show the home link' do
    expecting = page.has_link?('Delicious Recipes')

    expect(expecting).to be true
  end

  context 'when no user is signed in' do
    it 'shows the Sign in link' do
      expecting = page.has_link?('Sign in')

      expect(expecting).to be true
    end

    it 'shows the Sign up link' do
      expecting = page.has_link?('Sign up')

      expect(expecting).to be true
    end
  end

  context 'when user is signed in into the app' do
    before do
      system_log_in(create(:user))

      visit root_path
    end

    it 'shows the Add Recipe link' do
      expecting = page.has_link?('Add Recipe')

      expect(expecting).to be true
    end

    it 'shows the My Recipes link' do
      expecting = page.has_link?('My Recipes')

      expect(expecting).to be true
    end

    it 'shows the Edit User link' do
      expecting = page.has_link?('Edit User')

      expect(expecting).to be true
    end

    it 'shows the My Profile link' do
      expecting = page.has_link?('My Profile')

      expect(expecting).to be true
    end

    it 'shows the Sign out link' do
      expecting = page.has_link?('Sign out')

      expect(expecting).to be true
    end
  end

  context 'when a recipe is present' do
    let!(:recipe) { create(:recipe) }

    before do
      visit root_path
    end

    it 'shows the recipe title' do
      expecting = page.has_content?(recipe.title)

      expect(expecting).to be true
    end

    it 'shows the recipe description' do
      expecting = page.has_content?(recipe.description)

      expect(expecting).to be true
    end

    it 'shows the recipe created time' do
      expecting = page.has_content?(recipe.created_at.localtime.strftime('%B %d, %Y'))

      expect(expecting).to be true
    end

    it 'shows the recipe last edited time' do
      expecting = page.has_content?(recipe.updated_at.localtime.strftime('%B %d, %Y'))

      expect(expecting).to be true
    end
  end
end
