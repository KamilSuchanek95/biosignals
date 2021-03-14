class Measurement
  include Mongoid::Document
  field :data, type: Array
  field :type, type: String
  field :dt, type: String
  belongs_to :user
end
