require 'rails_helper'

RSpec.describe "Sessions", type: :request do
  describe "ログイン画面のチェック" do
    context "ログイン画面の表示"
    it "成功する" do
      get new_user_session_path
      expect(response).to have_http_status(200)
    end
  end
end