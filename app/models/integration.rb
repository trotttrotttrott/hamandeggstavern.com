class Integration < ActiveRecord::Base
  attr_accessible :admin_id, :token, :type
  belongs_to :admin
end

class Integration::Facebook < Integration
end
