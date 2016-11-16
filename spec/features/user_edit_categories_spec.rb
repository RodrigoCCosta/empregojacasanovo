require 'rails_helper'

feature 'User edit categories' do
  scenario 'successfully' do
    category = Category.create(name: 'Desenvolvimento')

    visit edit_category_path(category)

    fill_in 'Nome:',     with: 'Programação'

    click_on 'Atualizar Categoria'

    expect(page).to have_css('h1', text: 'Programação')

  end

  scenario 'edit with valid data' do
    category = Category.create(name: 'Análise') 

    visit edit_category_path(category)

    fill_in 'Nome:',     with: ''

    click_on 'Atualizar Categoria'

    expect(page).to have_content 'Não foi possível editar os dados da Categoria'
  end
end
