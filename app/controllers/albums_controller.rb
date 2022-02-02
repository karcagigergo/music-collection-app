require 'open-uri'
require 'json'
require 'rest-client'

OpenURI::Buffer.send :remove_const, 'StringMax' if OpenURI::Buffer.const_defined?('StringMax')
OpenURI::Buffer.const_set 'StringMax', 0

class AlbumsController < ApplicationController
  before_action :set_album, only: %i[show edit update destroy]
  before_action :fetch_artist_names, only: %i[new create edit update]

  def index
    @albums = Album.all
  end

  def show
  end

  def new
    @album = Album.new
  end

  def edit
  end

  def create
    @album = Album.new(album_params)
    @album.user = current_user
    respond_to do |format|
      if @album.save
        format.html { redirect_to album_url(@album), notice: "Album was successfully created." }
        format.json { render :show, status: :created, location: @album }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @album.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @album.update(album_params)
        format.html { redirect_to album_url(@album), notice: "Album was successfully updated." }
        format.json { render :show, status: :ok, location: @album }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @album.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    if current_user.admin?
      @album.destroy
      respond_to do |format|
        format.html { redirect_to albums_url, notice: "Album was successfully destroyed." }
        format.json { head :no_content }
    end
    else
      respond_to do |format|
        format.html { redirect_to @album, notice: 'Only Admins users can destroy Albums.' }
        format.json { head :unauthorized }
      end
    end
  end

  def fetch_artists
    response = RestClient.get ENV['MOAT_API'], { Basic: ENV['MOAT_HEADERS'] }
    @artists = JSON.parse(response.body).flatten
  end

  private

  def set_album
    @album = Album.find(params[:id])
  end

  def album_params
    params.require(:album).permit(:album_name, :year, :artist_name, :user_id)
  end

  def fetch_artist_names
    response = RestClient.get ENV['MOAT_API'], { Basic: ENV['MOAT_HEADERS'] }
    results = JSON.parse(response.body).flatten
    @artist_names = []
    results.each do |result|
      @artist_names << result["name"]
    end
    @artist_names
  end
end
