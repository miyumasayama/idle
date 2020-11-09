module Login
    def login_as(user)
        visit login_path
        fill_in "session_email", with: user.email
        fill_in "session_password", with: user.password
        click_button "ログイン"
    end

    def fill_profile(profile)
        visit new_profile_path
        fill_in "profile-nickname", with: profile.nickname
        fill_in "profile-age", with: profile.age
        fill_in "profile-favorite", with: profile.favorite
        click_button "プロフィール登録"
    end
        

    
end

RSpec.configure do |config|
    config.include Login
end