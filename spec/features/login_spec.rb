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
  end
end