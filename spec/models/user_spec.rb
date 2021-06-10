require "rails_helper"

RSpec.describe User, type: :model do
  describe "バリデーションのチェック" do
    subject {user.valid?}
    context "データが条件を満たす時" do
      let(:user) { build(:user) }
      it "保存できる" do
        expect(subject).to eq true
      end
    end
    context "user_nameが空の場合" do
      let(:user) { build(:user, user_name: "") }
      it "エラーが発生し、エラーメッセージが表示される" do
        expect(subject).to eq false
        expect(user.errors.messages[:user_name]).to eq ["を入力してください", "は不正な値です"]
      end
    end
    context "user_nameが31文字以上の場合" do
      let(:user) { build(:user, user_name: "a" * 31) }
      it "エラーが発生し、エラーメッセージが表示される" do
        expect(subject).to eq false
        expect(user.errors.messages[:user_name]).to include "は30文字以内で入力してください"
      end
    end
    context "user_nameが半角英数字以外を含む場合" do
      let(:user1) { build(:user, user_name: "あ") }
      let(:user2) { build(:user, user_name: "a b") }
      let(:user3) { build(:user, user_name: "aあ") }
      it "エラーが発生し、エラーメッセージが表示される" do
        expect(user1.valid?).to eq false
        expect(user1.errors.messages[:user_name]).to include "は不正な値です"
        expect(user2.valid?).to eq false
        expect(user2.errors.messages[:user_name]).to include "は不正な値です"
        expect(user3.valid?).to eq false
        expect(user3.errors.messages[:user_name]).to include "は不正な値です"
      end
    end
    context "user_nameがすでに存在する場合" do
      before { create(:user, user_name: "test") }
      let(:user) { build(:user, user_name: "test") }
      it "エラーが発生し、エラーメッセージが表示される" do
        expect(subject).to eq false
        expect(user.errors.messages[:user_name]).to include "はすでに存在します"
      end
    end

    context "last_nameが空の場合" do
      let(:user) { build(:user, last_name: "") }
      it "エラーが発生し、エラーメッセージが表示される" do
        expect(subject).to eq false
        expect(user.errors.messages[:last_name]).to include "を入力してください"
      end
    end
    context "last_nameが16文字より多いの場合" do
      let(:user) { build(:user, last_name: "a" * 31) }
      it "エラーが発生し、エラーメッセージが表示される" do
        expect(subject).to eq false
        expect(user.errors.messages[:last_name]).to include "は15文字以内で入力してください"
      end
    end
    context "first_nameが空の場合" do
      let(:user) { build(:user, first_name: "") }
      it "エラーが発生し、エラーメッセージが表示される" do
        expect(subject).to eq false
        expect(user.errors.messages[:first_name]).to include "を入力してください"
      end
    end
    context "first_nameが16文字より多いの場合" do
      let(:user) { build(:user, first_name: "a" * 31) }
      it "エラーが発生し、エラーメッセージが表示される" do
        expect(subject).to eq false
        expect(user.errors.messages[:first_name]).to include "は15文字以内で入力してください"
      end
    end
    context "assignment_yearが空の場合" do
      let(:user) { build(:user, assignment_year: nil) }
      it "エラーが発生し、エラーメッセージが表示される" do
        expect(subject).to eq false
        expect(user.errors.messages[:assignment_year]).to include "を入力してください"
      end
    end
    context "passwordが空の場合" do
      let(:user) { build(:user, encrypted_password: nil) }
      it "エラーが発生し、エラーメッセージが表示される" do
        expect(subject).to eq false
        expect(user.errors.messages[:encrypted_password]).to include "を入力してください"
      end
    end
  end
end