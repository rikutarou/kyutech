class Capture < ApplicationRecord
  belongs_to :url

  def md5size
    if (self.md5.nil? || self.fsize.nil? ) then
      require "open-uri"
      if (!self.imgurl.nil? && self.imgurl.length > 2) then
        url = self.imgurl.sub(/img\//, 'info.php?i=img/')
        info = open( url ).read
        ary = info.split
        p ary
        self.md5 = ary[0]
        self.fsize = ary[1].to_i
        self.save
      end
    end
  end

end
