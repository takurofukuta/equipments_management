require 'rails_helper'

RSpec.describe "貸出状況の処理", type: :request do
  describe "GET #index" do
    let(:user) {create(:user)}
    before { sign_in user }
    it "リクエストに成功" do
      get(lendings_path)
      expect(response).to have_http_status(200)
    end      
  end
  describe "GET #lendings_history" do
    let(:user) {create(:user)}
    before { sign_in user }
    it "リクエストに成功" do
      get(lendings_history_path)
      expect(response).to have_http_status(200)
    end      
  end

end
