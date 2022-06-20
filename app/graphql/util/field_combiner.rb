module Util
  class FieldCombiner
    def self.combine(query_types)
      Array(query_types).inject({}) do
        acc.merge!(query_type.fields)
      end
    end
  end
end
