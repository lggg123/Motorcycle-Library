RSpec.describe Motorcycle, type: :model do
  describe "Factory For Model" do
    it 'has a valid factory' do
        expect(build(:motorcycle)).to be_valid
    end
  end

  let(:user) { create(:user) }
  let(:attributes) do
    {
        title: 'Honda',
        description: 'Motorcycles from Honda',
        image_url: 'https://global.honda/products/motorcycles.html',
        user: user
    }
  end

  let(:motorcycle) { create(:motorcycle, **attributes) }
  describe "Associations" do
    it { should belong_to(:user) }
  end

  describe "Validations" do
    it { should validate_presence_of(:title) }
    it { expect(motorcycle).to validate_uniqueness_of(:title) }
    it { should validate_presence_of(:description) }
    it { expect(motorcycle).to validate_uniqueness_of(:description) }
  end
end
