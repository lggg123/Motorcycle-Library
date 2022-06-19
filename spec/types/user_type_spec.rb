describe UserType do
  subject { described_class }

  it { is_expected.to have_field(:first_name).of_type("[String!]!") }
  it { is_expected.to have_field(:last_name).of_type("[String]!") }
  it { is_expected.to have_field(:email).of_type("[String!]!") }
end
