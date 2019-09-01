module Serialize
  extend ActiveSupport::Concern

  def serialize_array(data)
    ActiveModelSerializers::SerializableResource.new(data)
  end
  
end