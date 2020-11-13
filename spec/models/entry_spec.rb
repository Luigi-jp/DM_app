require 'rails_helper'

RSpec.describe Entry, type: :model do
  # 関連付けのテスト
  describe "Association" do
    let(:association) do
      described_class.reflect_on_association(target)
    end

    # Userモデルとの関連付けをチェック
    context "User" do
      let(:target) { :user }
      # Userモデルとの関連付けがbelongs_toであること
      it { expect(association.macro).to eq :belongs_to }
      # 関連付いているモデルがUserモデルであること
      it { expect(association.class_name).to eq "User" }
    end

    # Roomモデルとの関連付けをチェック
    context "Room" do
      let(:target) { :room }
      # Roomモデルとの関連付けがbelongs_toであること
      it { }
      # 関連付いているモデルがRoomモデルであること
      it { }
    end
  end
end
