require 'rails_helper'

RSpec.describe Motorcycle, type: :model do
  describe "Associations" do
    it { should belong_to(:user) }
  end

  describe "Validations" do
    it { should validate_presence_of(:title) }
    # it { should validate_uniqueness_of(:title) }
    it { should validate_presence_of(:description) }
    # it { should validate_uniqueness_of(:description) }
  end
end
