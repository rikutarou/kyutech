render @page.as_json
# @page.as_json(:include => { :urls => {:include => {:captures => {:only => :imgurl }}}})
# json.partial! "pages/page", page: @page
