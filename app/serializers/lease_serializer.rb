class LeaseSerializer < ActiveModel::Serializer
  attributes :rent, :tenant_id, :apartment_id
  belongs_to :tenant
end
