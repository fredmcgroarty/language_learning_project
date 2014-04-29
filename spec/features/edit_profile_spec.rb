require 'spec_helper'

describe 'editting users profile' do
  before(:each) do
		@mark = create(:user)
		create(:user_total_profile_1)
  	@tiff = create(:user)
		create(:user_total_profile_2)
    visit '/user_profile/edit' 
  end



	context "user profile display" do 
		before(:each) do
      login_as @mark
  		visit '/user_profile/edit' 
  		expect(current_path).to eq edit_user_profile_path(@mark)
      expect(current_path).to eq edit_user_profile_path(current_user)
      expect(page).to have_content(@mark.user_info && @mark.user_profile && @mark.email)
      expect(current_path).to eq edit_user_profile_path
      expect(page).to have_select("user_profile[native_lang]")
      expect(page).to have_select("user_profile[first_lang]")
      expect(page).to have_select("user_profile[second_lang]")
      click_button 'Update User profile'
      expect(page).to have_content 'Update successful'
  	

		it "should display user profile" do 
            visit '/user_profile/edit'
            expect(current_path).to eq edit_user_profile_path(current_user)
            expect(page).to have_content(@mark.user_info && @mark.user_profile && @mark.email)


	end

  
     

  end

end
  end


