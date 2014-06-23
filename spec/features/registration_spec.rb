describe "Registration" do

  let(:name) { "Juan Pérez" }
  let(:email) { "juanperez@example.com" }
  let(:password) { "password" }


  context "with correct data" do

    it "should be able to sign up succesfully" do
      visit new_user_path

      fill_in 'Name', with: name
      fill_in 'Email', with: email
      fill_in 'Password', with: password
      fill_in 'Repeat your password', with: password

      click_button 'Sign up'

      expect(page).to have_content("Your account has been succesfully created")
      expect(page).to have_content("Hi #{name}")
    end

  end

  context "with incorrect data" do
    let(:name) {"Juan Pérez"}
    let(:password) { "1234" }
    it "should not be able to sign up without a mail" do
      visit new_user_path

      fill_in 'Name', with:name
      fill_in 'Password', with: password
      fill_in 'Repeat your password', with: password

      click_button 'Sign up'

      expect(page).to have_content "errors"
      expect(page).not_to have_content("Hi #{name}")
    end

    it "should not be able to sign up without a name" do
      visit new_user_path

      fill_in 'Email', with:email
      fill_in 'Password', with: password
      fill_in 'Repeat your password', with: password

      click_button 'Sign up'

      expect(page).to have_content "errors"
      expect(page).not_to have_content("Hi #{name}")
    end

    it "should not be able to login without a password" do
      visit new_user_path
      fill_in 'Name', with:name
      fill_in 'Email', with:email

      click_button 'Sign up'

      expect(page).to have_content "errors"
      expect(page).not_to have_content("Hi #{name}")
    end
  end
end