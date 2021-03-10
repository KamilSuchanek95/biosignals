class Measurement
  include Mongoid::Document
  field :data, type: Array
  field :type, type: String
  field :dt, type: String
  belongs_to :user
  # rails g scaffold Measurement data:array user:references type:string dt:string
end
