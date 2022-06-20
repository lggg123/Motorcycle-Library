RSpec.describe Types::UserType do
  subject { described_class }

  types = GraphQL::Define::TypeDefiner.instance

  it { is_expected.to have_field(:first_name).of_type(types.String) }
  it { is_expected.to have_field(:last_name).of_type(types.String) }
  it { is_expected.to have_field(:email).of_type(types.String) }
end
