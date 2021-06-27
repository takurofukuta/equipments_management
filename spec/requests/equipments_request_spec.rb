require 'rails_helper'

RSpec.describe "備品データの処理", type: :request do
  describe "GET #index" do
    let(:user) {create(:user)}
    before { sign_in user }
    it "リクエストに成功" do
      get(equipments_path)
      expect(response).to have_http_status(200)
    end      
  end
  describe "POST #create" do
    subject {post(equipments_path, params: params)}
    before { sign_in user }
    context "パラメータが正常な時" do
      let(:user) {create(:user)}
      let(:equipment) {create(:equipment, registered_user: user)}
      let(:params) { { equipment: attributes_for(:equipment) } }
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
      let(:user) {create(:user)}
      let(:equipment) {create(:equipment, registered_user: user, genre: nil)}
      let(:params) { { equipment: attributes_for(:equipment, :invalid) } }
      it "リクエストに成功" do
        subject
        expect(response).to have_http_status(200)
      end
      it "備品データが保存されない" do
        expect { subject }.not_to change(Equipment, :count)
      end
      it "備品一覧ページがレンダリングされる" do
        subject
        expect(response.body).to include "<h1 class=\"text-center\">備品データ一覧</h1>"
      end
    end 

  end

  describe "GET #edit" do
    subject { get(edit_equipment_path(equipment_id)) }
    before { sign_in user }
    context "備品idが存在する時" do
      let(:user) {create(:user, admin: true)}
      let(:equipment) {create(:equipment)}
      let(:equipment_id) { equipment.id }
      it "備品データ編集画面の表示に成功する" do
        subject
        expect(response).to have_http_status(200)
      end
    end
    context "備品idが存在しない場合" do
      let(:user) {create(:user, admin: true)}
      let(:equipment_id) { -1 }
      it "備品一覧ページにリダイレクト" do
        subject
        expect(response).to have_http_status(302)
      end
    end
  end

  describe "PATCH #create" do
    subject { patch(equipment_path(equipment.id), params: params) }
    before { sign_in user }
    context "パラメータが正常の時" do
      let(:user) {create(:user, admin: true)}
      let(:equipment) {create(:equipment)}
      let(:params) { { equipment: attributes_for(:equipment) } }

      it "リクエストが成功する" do
        subject
        expect(response).to have_http_status(302)
      end
      it "研究室備品名が更新される" do
        origin_lab_equipment_name = equipment.lab_equipment_name
        new_lab_equipment_name = params[:equipment][:lab_equipment_name]
        expect { subject }.to change { equipment.reload.lab_equipment_name }.from(origin_lab_equipment_name).to(new_lab_equipment_name)
      end
      it "メーカー名が更新される" do        
        origin_maker_name = equipment.maker_name
        new_maker_name = params[:equipment][:maker_name]
        expect { subject }.to change { equipment.reload.maker_name }.from(origin_maker_name).to(new_maker_name)
      end
      it "製品名が更新される" do
        origin_product_name = equipment.product_name
        new_product_name = params[:equipment][:product_name]
        expect { subject }.to change { equipment.reload.product_name }.from(origin_product_name).to(new_product_name)        
      end
      it "購入年度が更新される" do
        origin_purchase_year = equipment.purchase_year
        new_purchase_year = params[:equipment][:purchase_year]
        expect { subject }.to change { equipment.reload.purchase_year }.from(origin_purchase_year).to(new_purchase_year)                
      end
      it "資産番号が更新される" do
        origin_asset_num = equipment.asset_num
        new_asset_num = params[:equipment][:asset_num]
        expect { subject }.to change { equipment.reload.asset_num }.from(origin_asset_num).to(new_asset_num)                        
      end
      it "金額が更新される" do
        origin_price = equipment.price
        new_price = params[:equipment][:price]
        expect { subject }.to change { equipment.reload.price }.from(origin_price).to(new_price)                        
      end
      it "備考欄が更新される" do
        origin_remarks = equipment.remarks
        new_remarks = params[:equipment][:remarks]
        expect { subject }.to change { equipment.reload.remarks }.from(origin_remarks).to(new_remarks)                        
      end
      it "詳細ページにリダイレクトされる" do 
        subject
        expect(response).to redirect_to equipment_path(equipment.id)
      end
    end
    context "パラメータが異常な時" do
      let(:user) {create(:user, admin: true)}
      let(:equipment) {create(:equipment)}
      let(:params) { { equipment: attributes_for(:equipment, genre: nil) } }
      it "リクエストに成功する" do
        subject
        expect(response).to have_http_status(200)        
      end
      it "編集ページがレンダリングされる" do
        subject
        expect(response.body).to include "<h1 class=\"text-center\">備品データ編集</h1>"
      end
      it "研究室備品名が更新されない" do
        expect { subject }.not_to change(equipment.reload, :lab_equipment_name)
      end
      it "メーカー名が更新されない" do        
        expect { subject }.not_to change(equipment.reload, :maker_name)
      end
      it "製品名が更新されない" do
        expect { subject }.not_to change(equipment.reload, :product_name)
      end
      it "購入年度が更新されない" do
        expect { subject }.not_to change(equipment.reload, :purchase_year)
      end
      it "資産番号が更新されない" do
        expect { subject }.not_to change(equipment.reload, :asset_num)
      end
      it "金額が更新されない" do
        expect { subject }.not_to change(equipment.reload, :price)
      end
      it "備考欄が更新されない" do
        expect { subject }.not_to change(equipment.reload, :remarks)
      end
    end
  end
  describe "DELETE #destroy" do
    subject { delete(equipment_path(equipment.id)) }
    before { sign_in user }
    let!(:user) {create(:user, admin: true)}
    let!(:equipment) {create(:equipment)}
    it "リクエストが成功する" do
      subject
      expect(response).to have_http_status(302)
    end
    it "備品データが削除される" do
      expect {subject}.to change(Equipment, :count).by(-1)
    end
    it "備品データ一覧ページにリダイレクトする" do
      subject
      expect(response).to redirect_to root_path
    end
  end
end