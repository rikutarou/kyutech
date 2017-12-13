class Page < ApplicationRecord
  belongs_to :user
  has_many :urls, :dependent => :destroy

  def capturebytimecheck
    #    puts self.uphour
    if (self.uphour.include?("-")) then
      hary = self.uphour.split("-")
      range = Range.new(hary[0].to_i,hary[1].to_i)
      p range
      t = Time.new.in_time_zone('Tokyo').hour
      p t
      if (range.include?(t)) then
        self.captureall
      else
        p "Not in time "+t.to_s+" "+self.uphour
      end
    end
  end

  def captureall
    self.urls.each do |url|
      p url.url
      url.capture
    end
  end
end
