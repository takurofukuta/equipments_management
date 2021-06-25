require 'rails_helper'

RSpec.describe "備品データの処理", type: :request do
  describe "GET #index" do
    let(:user) {create(:user)}
    it "リクエストに成功" do
      sign_in user
      get(equipments_path)
      expect(response).to have_http_status(200)
    end      
  end
  describe "POST #create" do
    subject {post(equipments_path, params: { equipment: attributes_for(:equipment) })}
    before { sign_in user }
    context "パラメータが正常な時" do
      let(:user) {create(:user)}
      let(:equipment) {create(:equipment, registered_user: user)}
      it "リクエストに成功" do
        subject
        expect(response).to have_http_status(302)
      end
      it "備品データが保存される" do
        expect { subject }.to change { Equipment.count }.by(1)
      end
      it "備品データ保存後、備品一覧ページにリダイレクトする" do
        subject
        expect(response).to redirect_to equipments_path
      end
    end

    context "パラメータが異常な時" do
      
    end 

  end

  # describe "詳細表示" do
  #   let(:user) {create(:user)}
  #   it "ログイン画面の表示成功する" do
  #     get(new_user_session_path)
  #     expect(response).to have_http_status(200)
  #   end
  #   it "ログインに成功する" do
  #     sign_in user
  #     post(user_session_path, params: { user: user })
  #     expect(response).to have_http_status(302)
  #   end
  #   it "ログアウトに成功する" do
  #     sign_out user
  #     delete(destroy_user_session_path, params: { user: user })
  #     expect(response).to have_http_status(302)
  #   end
  # end
end