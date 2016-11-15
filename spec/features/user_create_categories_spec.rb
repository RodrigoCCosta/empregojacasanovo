require 'rails_helper'

feature 'User create categories' do
  scenario 'successfully' do
    category = Category.new(name: 'Estágio')

    visit new_category_path

    fill_in 'Nome',      with: category.name

    click_on 'Criar Categoria'

    expect(page).to have_css('h1', text: category.name)
  end


end
