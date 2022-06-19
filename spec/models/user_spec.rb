require 'rails_helper'

RSpec.describe User, type: :model do
  describe "Associations" do
    it { should have_many(:motorcycles) }
  end

  describe "Validations" do
    # subject { Artist.new(name: "Eifel 65") }
    it { should validate_presence_of(:first_name) }
    it { should validate_uniqueness_of(:first_name) }
    it { should validate_presence_of(:last_name) }
    it { should validate_uniqueness_of(:last_name) }
    it { should validate_presence_of(:email) }
    it { should validate_uniqueness_of(:email) }
  end
end
