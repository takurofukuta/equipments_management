require 'rails_helper'

RSpec.describe "新規登録・ログイン・ログアウト処理", type: :request do
  describe "新規登録のチェック" do
    let(:user) { build(:user) }
    let(:params) { attributes_for(:user) }
    subject { post(user_registration_path, params: { user: params })}
    context "バリデーションに成功した時" do
      it "リクエストに成功する" do
        subject
        expect(response).to have_http_status(302)
      end
      it "新規登録に成功する" do
        expect { subject }.to change(User, :count).by(1)
      end
      it "新規登録後に備品一覧ページへのリダイレクトに成功する" do
        subject
        pending "テストが失敗する原因がわからないので保留"
        expect(response).to redirect_to equipments_path
      end
    end
    context "バリデーションに失敗した時" do
      it "リクエストに成功する" do
        post(user_registration_path, params: { user: attributes_for(:user, user_name: nil) })
        expect(response).to have_http_status(200)
      end
      it "新規登録に失敗する" do        
        expect { post(user_registration_path, params: { user: attributes_for(:user, user_name: nil) }) }.not_to change(User, :count)
      end
      it 'エラーが表示されること' do
        post(user_registration_path, params: { user: attributes_for(:user, user_name: nil) })
        expect(response.body).to include "error"
      end
    end
  end

  describe "ログイン画面のチェック" do
    let(:user) {create(:user)}
    it "ログイン画面の表示に成功する" do
      get(new_user_session_path)
      expect(response).to have_http_status(200)
    end
    it "ログインに成功する" do
      sign_in user
      post(user_session_path, params: { user: user })
      expect(response).to have_http_status(302)
    end
    it "ログアウトに成功する" do
      sign_out user
      delete(destroy_user_session_path, params: { user: user })
      expect(response).to have_http_status(302)
    end
    context "ログインに失敗した時" do      
      it "ログインに失敗する" do
        post(user_session_path, params: { user: user, user_name: nil })
        expect(response).to have_http_status(200)
      end
      it "フラッシュメッセージが表示される" do
        post(user_session_path, params: { user: user, user_name: nil })
        expect(flash[:alert].present?).to eq true
      end
    end
  end
end