RSpec.describe Types::MotorcycleType do
  subject { described_class }

  types = GraphQL::Define::TypeDefiner.instance

  it { is_expected.to have_field(:title).of_type(types.String) }
  it { is_expected.to have_field(:description).of_type(types.String) }
  it { is_expected.to have_field(:image_url).of_type (types.String) }
  it { is_expected.to have_field(:user_id).of_type(!types.Int).with_property(:user_id) }
  it { is_expected.to have_field(:user) }
end
