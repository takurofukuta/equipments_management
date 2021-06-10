require "rails_helper"

RSpec.describe Equipment, type: :model do
  describe "バリデーションのチェック" do
    subject { equipment.valid? }
    context "データが条件を満たす時" do
      let(:equipment) { build(:equipment) }
      it "保存できる" do
        expect(subject).to eq true
      end
    end
    context "genreがnilの場合" do
      let(:equipment) { build(:equipment, genre: nil) }      
      it "エラーが発生し、エラーメッセージが表示される" do
        expect(subject).to eq false
        expect(equipment.errors.messages[:genre]).to include "を入力してください"
      end
    end
    context "lab_equipment_nameが空の場合" do
      let(:equipment) { build(:equipment, lab_equipment_name: "") }
      it "エラーが発生し、エラーメッセージが表示される" do
        expect(subject).to eq false
        expect(equipment.errors.messages[:lab_equipment_name]).to include "を入力してください"
      end
    end
    context "maker_nameが空の場合" do
      let(:equipment) { build(:equipment, maker_name: "") }
      it "エラーが発生し、エラーメッセージが表示される" do
        expect(subject).to eq false
        expect(equipment.errors.messages[:maker_name]).to include "を入力してください"
      end
    end
    context "product_nameが空の場合" do
      let(:equipment) { build(:equipment, product_name: "") }
      it "エラーが発生し、エラーメッセージが表示される" do
        expect(subject).to eq false
        expect(equipment.errors.messages[:product_name]).to include "を入力してください"
      end
    end
    context "purchase_yearがnilの場合" do
      let(:equipment) { build(:equipment, purchase_year: nil) }
      it "エラーが発生し、エラーメッセージが表示される" do
        expect(subject).to eq false
        expect(equipment.errors.messages[:purchase_year]).to include "を入力してください"
      end
    end
  end
end