require 'rails_helper'

RSpec.describe "新規登録・ログイン・ログアウト処理", type: :request do
  describe "新規登録" do
    let(:user) {build(:user)}
    it "新規登録に成功する" do
      expect(user).to be_valid
    end      
  end

  describe "ログイン画面のチェック" do
    let(:user) {create(:user)}
    it "ログイン画面の表示成功する" do
      get(new_user_session_path)
      expect(response).to have_http_status(200)
    end
    it "ログインに成功する" do
      sign_in user
      post(user_session_path, params: { user: user })
      expect(response).to have_http_status(302)
    end
  end
end