class VideosController < ApplicationController

  before_action :authenticate_user!, except: [:show, :count_views]
  before_action :set_video, only: [:edit, :update, :destroy]

  # GET /videos
  # GET /videos.json
  def index
    @videos = current_user.videos
  end

  # GET /videos/1
  # GET /videos/1.json
  def show
    @video = Video.find(params[:id])
  end

  # GET /videos/new
  def new
    @video = Video.new
  end

  # GET /videos/1/edit
  def edit
  end

  # POST /videos
  # POST /videos.json
  def create
    @video = current_user.videos.new(video_params)
    respond_to do |format|
      if @video.save
        format.html { redirect_to videos_path(), notice: 'Video criado com sucesso.' }
        format.json { render :index, status: :created, location: @video }
      else
        format.html { redirect_to new_video_path(), notice: 'Video não salvo.' }
        format.json { render json: @video.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /videos/1
  # PATCH/PUT /videos/1.json
  def update
    respond_to do |format|
      if @video.update(video_params)
        format.html { redirect_to videos_path(), notice: 'Video atualizado com sucesso.' }
        format.json { render :index, status: :ok, location: @video }
      else
        format.html { redirect_to edit_video_path(@video), alert: 'Video não atualizado' }
        format.json { render json: @video.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /videos/1
  # DELETE /videos/1.json
  def destroy
    @video.destroy
    respond_to do |format|
      format.html { redirect_to videos_url, notice: 'Video excluido com sucesso.' }
      format.json { head :no_content }
    end
  end

  def count_views
    @video = Video.find(params[:video_id].to_i)
    @video.video_views.increment
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_video
      if current_user.present?
        @video = current_user.videos.where(id: params[:id]).includes(:video_views).first
        if @video.nil?
          respond_to do |format|
            format.html { redirect_to videos_path(), notice: 'Você não tem permissão para acessar esse vídeo.' }
          end
        end
      else
        @video = Video.find(params[:id])
      end
    end

    # Only allow a list of trusted parameters through.
    def video_params
      return if params[:video].nil?
      params.require(:video).permit(:name, :url)
    end
end
