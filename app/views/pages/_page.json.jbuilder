@page.as_json(:include => { :urls => {:include => {:captures => {:only => :imgurl }}}})
#json.extract! page, :id, :name, :mes, :user_id, :created_at, :updated_at
#json.url page_url(page, format: :json)
