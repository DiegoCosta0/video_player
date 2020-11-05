require 'rails_helper'

RSpec.describe User, :type => :model do
  subject {
    described_class.new(
      password: "password",
      password_confirmation: "password",
      email: "diego@teste.com",
      name: "Diego"
    )
  }

  describe "Validations" do

    it "is valid with valid attributes" do
      expect(subject).to be_valid
    end

    it "is not valid without a password" do
      subject.password = nil
      subject.password_confirmation = nil
      expect(subject).to_not be_valid
    end

    it "is not valid without an email" do
      subject.email = nil
      expect(subject).to_not be_valid
    end

    it "is not valid without an name" do
      subject.name = nil
      expect(subject).to_not be_valid
    end

  end

end
