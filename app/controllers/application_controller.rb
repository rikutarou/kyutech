class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

#  before_action :authenticate_user! #これがコントローラに書いてあると、ログイン必須になる
#  ここで指定すると、全体にかかってしまう。homes_controllerは未ログインでも見せたいので、ここでは指定しない。

end
