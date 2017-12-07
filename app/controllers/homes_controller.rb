class HomesController < ApplicationController

def index
if user_signed_in? then
  @pages = Page.where(user_id: current_user.id)
#  logger.debug(current_user.inspect)
#  logger.debug(current_user.id)
#  logger.debug(@pages.inspect)

 end
end

end
