require 'rails_helper'

RSpec.describe "操作履歴データの処理", type: :request do
  describe "GET #index" do
    subject { get(operation_history_path) }
    let(:user) {create(:user)}
    before { sign_in user }
    it "リクエストに成功" do
      subject
      expect(response).to have_http_status(200)
    end
  end

end