class UrlsController < ApplicationController
  before_action :set_url, only: [:capture, :show, :edit, :update, :destroy]
  before_action :authenticate_user! #これがコントローラに書いてあると、ログイン必須になる

  # GET /urls/1/capture
  def capture
    # @url = Url.find(params[:id])# set_url
    @url.capture
    redirect_to page_urls_url(params[:page_id]), notice: 'New capture was successfully created.'
  end

  def allcapture
    Url.all.each do |url|
      url.capture
    end
  end

  # GET /urls
  # GET /urls.json
  def index
    @page = Page.find(params[:page_id])
    @urls = Url.where(page_id: params[:page_id])
  end

  # GET /urls/1
  # GET /urls/1.json
  def show
    @page = Page.find(params[:page_id])
    # @url = Url.find(params[:id]) # set_url
  end

  # GET /urls/new
  def new
    @url = Url.new
    @page = Page.find(params[:page_id])
  end

  # GET /urls/1/edit
  def edit
    # @url = Url.find(params[:id])# set_url
  end

  # POST /urls
  # POST /urls.json
  def create
    @url = Url.new(url_params)
    @page = Page.find(params[:page_id])
    respond_to do |format|
      if @url.save
        @url.capture # 新規作成したとき、ここで、キャプチャ
        format.html { redirect_to edit_page_url_url(@page,@url), notice: 'URLを追加しました。' }
        format.json { render :show, status: :created, location: @url }
      else
        format.html { render :new }
        format.json { render json: @url.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /urls/1
  # PATCH/PUT /urls/1.json
  def update
    @page = Page.find(params[:page_id])
    respond_to do |format|
      if @url.update(url_params)
        @url.capture
        format.html { redirect_to page_urls_url(@page), notice: 'URLを更新をしました。' }
        format.json { render :show, status: :ok, location: @url }
      else
        format.html { render :edit }
        format.json { render json: @url.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /urls/1
  # DELETE /urls/1.json
  def destroy
    @page = Page.find(params[:page_id])
    @url.destroy
    respond_to do |format|
      format.html { redirect_to page_urls_url(@page), notice: 'URLを削除しました。' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_url
      @url = Url.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def url_params
      params.require(:url).permit(:name, :url, :x, :y, :w, :h, :px, :py, :pw, :ph, :zoom, :autoup, :captime, :hour, :minute, :visible, :user_id, :page_id)
    end
end
