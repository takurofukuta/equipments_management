require "rails_helper"

RSpec.describe Lending, type: :model do
  describe "バリデーションのチェック" do
    subject {lending.valid?}
    context "データが条件を満たす時" do
      let(:lending) { build(:lending) }
      it "保存できる" do
        expect(subject).to eq true
      end
    end
    context "lendings_statusが空の場合" do
      let(:lending) { build(:lending, lendings_status: nil) }
      it "エラーが発生し、エラーメッセージが表示される" do
        expect(subject).to eq false
        expect(lending.errors.messages[:lendings_status]).to include "を入力してください"
      end
    end
    context "return_timeが空の場合" do
      let(:lending) { build(:lending, return_time: nil) }
      it "エラーが発生し、エラーメッセージが表示される" do
        expect(subject).to eq false
        expect(lending.errors.messages[:return_time]).to include "を入力してください"
      end
    end
  end
end
