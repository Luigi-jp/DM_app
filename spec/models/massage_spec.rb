require 'rails_helper'

RSpec.describe Message, type: :model do
  let(:user) { User.new(name: "Tester1", email: "tester1@example.com") }

  # contentがあれば有効であること
  it "is valid with content" do
    message = user.messages.new(content: "Hello")
    expect(message).to be_valid
  end

  # contentが無ければ無効であること
  it "is invalid without content" do
    message = Message.new(content: nil)
    expect(message).to_not be_valid
  end

  # Userと紐付いていること
  describe "Association" do
    let(:association) do
      described_class.reflect_on_association(target)
      # described_class.reflect_on_association(:belongs_to)
    end

    context "users" do
      let(:target) { :user }

      it { expect(association.macro).to eq :belongs_to }
      it { expect(association.class_name).to eq "User" }
    end
  end
end
