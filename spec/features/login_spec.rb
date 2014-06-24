describe "Login" do
  context "provided correct email and password" do
    let(:email) { "jmperez@example.org" }
    let(:password) { "password" }
    let!(:user) { User.create! email:email, password:password, password_confirmation: password, name:"John Doe"}

    it "should let the user sign in succesfully" do
      visit login_path

      fill_in "Email", with:email
      fill_in "Password", with:password

      click_button "Sign in"

      expect(page).to have_content("Hi #{user.name}")
    end

    it "should let the user logout" do
      visit login_path

      fill_in "Email", with:email
      fill_in "Password", with:password

      click_button "Sign in"
      click_button "Log out"

      expect(page).to have_content("Sign up or login")

    end
  end



  context "provided incorrect credentials" do
    let(:email) { "jmperez@example.org" }
    let(:not_registered_mail) { "johndoe@example.org" }
    let(:password) { "password" }
    let(:wrong_password) { "wrongpassword"}

    let!(:user) { User.create! email:email, password:password, password_confirmation: password, name:"John Doe"}

    it "should not let the user sign in if wrong password" do
      visit login_path

      fill_in "Email", with:email
      fill_in "Password", with:wrong_password

      click_button "Sign in"

      expect(page).to have_content("Incorrect email or password")
    end

    it "should not let the user login if user does not exist" do
      visit login_path
      fill_in "Email", with:not_registered_mail
      fill_in "Password", with:wrong_password

      click_button "Sign in"

      expect(page).to have_content("Incorrect email or password")
    end
  end
end