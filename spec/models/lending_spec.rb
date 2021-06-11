require "rails_helper"

RSpec.describe Lending, type: :model do
  describe "バリデーションのチェック" do
    subject {lending.valid?}
    context "データが条件を満たす時" doxz
      let(:lending) { build(:lending) }
      it "保存できる" do
        expect(subject).to eq true
      end
    end
    context "lending_nameが空の場合" do
      let(:lending) { build(:lending, lending_name: "") }
      it "エラーが発生し、エラーメッセージが表示される" do
        expect(subject).to eq false
        expect(lending.errors.messages[:lending_name]).to eq ["を入力してください", "は不正な値です"]
      end
    end
  end
end
