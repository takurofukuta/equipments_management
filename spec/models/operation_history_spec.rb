require "rails_helper"

RSpec.describe OperationHistory, type: :model do
  describe "バリデーションのチェック" do
    subject {operation_history.valid?}
    context "データが条件を満たす時" do
      let(:operation_history) { build(:operation_history) }
      it "保存できる" do
        expect(subject).to eq true
      end
    end
    context "contentが空の場合" do
      let(:operation_history) { build(:operation_history, content: "") }
      it "エラーが発生し、エラーメッセージが表示される" do
        expect(subject).to eq false
        expect(operation_history.errors.messages[:content]).to include "を入力してください"
      end
    end
  end
end
