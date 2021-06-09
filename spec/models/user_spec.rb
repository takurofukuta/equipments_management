require "rails_helper"

RSpec.describe User, type: :model do
  describe "バリデーションのチェック" do

    context "データが条件を満たす時" do
      let(:user) { build(:user) }
      it "保存できる" do
        expect(user.valid?).to eq true
      end
    end
    context "user_nameが空の場合" do
      let(:user) { build(:user, user_name: "") }
      it "エラーが発生し、エラーメッセージが表示される" do
        expect(user.valid?).to eq false
        expect(user.errors.messages[:user_name]).to eq ["を入力してください", "は不正な値です"]
      end
    end
    context "" do
      
    end
    context "" do
      
    end
    context "" do
      
    end
    context "" do
      
    end
    context "" do
      
    end
    context "" do
      
    end
    context "" do
      
    end
    context "" do
      
    end
    context "" do
      
    end
    context "" do
      
    end
    context "" do
      
    end
    context "" do
      
    end
    context "" do
      
    end
    context "" do
      
    end
  end
end