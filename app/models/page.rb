class Page < ApplicationRecord
  belongs_to :user
  has_many :urls, :dependent => :destroy

end
