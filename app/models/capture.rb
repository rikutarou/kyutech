class Capture < ApplicationRecord
  #  after_initialize :update_imgurl, if: :new_record?
  #  after_create :afcre # :update_imgurl
  #  after_update :afup  # :update_imgurl
    before_validation :beva
  #  after_save :afsave  # :update_imgurl

    private
    def beva
      print "=== before validation ";
      print "------"
      print self.url
      print "------"
      update_imgurl
    end

    def update_imgurl
      require "open-uri"
      if (!self.url.nil? && self.url.length > 2) then
        self.imgurl = open("https://cutycapt.tobata.asia/link.php?url="+self.url).read
        print self.imgurl
      end
    end

    # 以下は不要
      def afcre
        print "=== create";
        print "------"
        print self.url
        print "------"
      end
      def afup
        print "=== update";
        print "------"
        print self.url
        print "------"
      end
      def afsave
        print "=== save";
        print "------"
        print self.url
        print "------"
      end

    end
