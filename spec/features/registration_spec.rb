describe "Registration" do

  let(:name) { "Juan Pérez" }
  let(:email) { "juanperez@example.com" }
  let(:password) { "password" }

  it "should be able to sign up succesfully" do
    visit new_user_path

    fill_in 'Nombre', with: name
    fill_in 'Email', with: email
    fill_in 'Clave', with: password
    fill_in 'Repita su clave', with: password

    click_button 'Registrarme'

    expect(page).to have_content("Hola #{name}")
  end
end