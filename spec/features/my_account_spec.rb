describe "My Account" do

  context "for a logged user" do

    let(:password) { "1234" }
    let!(:user) { User.create! email:"jmperez@example.com", password:password, password_confirmation: password, name:"John Doe"}

    it "should show her basic data" do
      login(user, password)
      visit my_account_path

      expect(page).to have_content(user.name)
      expect(page).to have_content(user.email)
    end
  end
end