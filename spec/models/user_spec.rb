require 'rails_helper'

RSpec.describe User, type: :model do
  # ユーザー名、メールアドレスがあれば有効であること
  it "is valid with name and email" do
    user = User.new(
        name: "Tester",
        email: "tester@example.com"
    )
    expect(user).to be_valid
  end
  # ユーザー名が無ければ無効であること
  it "is invalid without name" do
    user =  User.new(
      name: nil,
      email: "tester@example.com"
    )
    expect(user).to_not be_valid
  end
  # メールアドレスが無ければ無効であること
  it "is invalid without email" do
    user = User.new(
      name: "Tester",
      email: nil
    )
    expect(user).to_not be_valid
  end
  # メールアドレスが重複している場合、無効であること
  it "is invalid with a duplicate email address" do
    User.create(
      name: "Tester",
      email: "tester@example.com"
    )
    user = User.new(
      name: "Tester1",
      email: "tester@example.com"
    )
    expect(user).to_not be_valid
  end

  # 関連付けをテスト
  describe "Message" do
    let(:association) do
      described_class.reflect_on_association(target)
    end

    # Messageモデルとの関連付けをチェック
    context "Message" do
      let(:target) { :messages }
      # Messageモデルとの関連付けがhas_manyであること
      it { expect(association.macro).to eq :has_many }
      # Messageモデルと関連付いていること
      it { expect(association.class_name).to eq "Message" }
    end

    # Entryモデルとの関連付けをチェック
    context "Entry" do
      let(:target) { :entries }
      # Entryモデルとの関連付けがhas_manyであること
      it { expect(association.macro).to eq :has_many }
      # Entryモデルと関連付いていること
      it { expect(association.class_name).to eq "Entry" }
    end
  end
end
