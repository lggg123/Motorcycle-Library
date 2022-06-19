describe MotorcycleType do
  subject { described_class }

  it { is_expected.to have_field(:title).of_type("[String!]!") }
  it { is_expected.to have_field(:description).of_type("[String!]!") }
  it { is_expected.to have_field(:image_url).of_type ("[String!]!") }
  it { is_expected.to have_field(:user).of_type('ID!').with_property(:user_id) }
end
