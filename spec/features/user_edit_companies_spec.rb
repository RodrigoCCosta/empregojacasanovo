require 'rails_helper'

feature 'User edit companies' do
  scenario 'successfully' do
    company = Company.create(name: 'Campus Code',
                             location: 'São Paulo',
                             mail: 'contato@campus.com.br',
                             phone: '2369-3476')

    visit edit_company_path(company)

    fill_in 'Nome:',     with: 'Campus Code - Ruby on Rails'
    fill_in 'Local:',    with: 'Belo Horizonte'
    fill_in 'Email:',    with: 'faleconosco@campus.com.br'
    fill_in 'Telefone:', with: '3312-0176'

    click_on 'Atualizar Empresa'

    expect(page).to have_css('h1', text: 'Campus Code - Ruby on Rails')
    expect(page).to have_content 'Belo Horizonte'
    expect(page).to have_content 'faleconosco@campus.com.br'
    expect(page).to have_content '3312-0176'

  end

  scenario 'edit with valid data' do
    company = Company.create(name: 'Amazon',
                             location: 'Pindamonhangaba',
                             mail: 'contato@amazon.com.br',
                             phone: '2222-3333')

    visit edit_company_path(company)

    fill_in 'Nome:',     with: ''

    click_on 'Atualizar Empresa'

    expect(page).to have_content 'Não foi possível editar os dados da Empresa'
  end
end
