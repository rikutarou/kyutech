class Url < ApplicationRecord
  belongs_to :page
  has_many :captures, :dependent => :destroy

  before_validation :force_add_http
  # かならず、http:// または https:// ではじまるようにする。ついていなければ着ける
  def force_add_http
    if ( self.url.start_with?("http://") || self.url.start_with?("https://") ) then

    else
      self.url = "http://"+ self.url
    end

  end

  def first
    if (!self.url.nil? && self.url.length > 2 && self.captures.size==0) then capture end
      return self.captures.first
  end
  def last
    if (!self.url.nil? && self.url.length > 2 && self.captures.size==0) then capture end
      return self.captures.last
  end

  def capture
      require "open-uri"
      if (!self.url.nil? && self.url.length > 2) then
         if (self.w.nil? && self.h.nil? ) then
           cut = ""
         else
           cut = "&x="+self.x.to_s+"&y="+self.y.to_s+"&w="+self.w.to_s+"&h="+self.h.to_s
         end
          @imgurl = open("https://cutycapt.tobata.asia/link.php?url="+self.url+cut).read
          #print @imgurl
          @c = Capture.create(imgurl: @imgurl, url: self, w: self.w, h:self.h)
          self.captures << @c    # これで、CaptureをUrlに登録！
          return @imgurl
      end
  end
end
