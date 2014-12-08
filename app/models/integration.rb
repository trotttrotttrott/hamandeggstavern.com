class Integration < ActiveRecord::Base
  belongs_to :admin
end

class Integration::Facebook < Integration
end
