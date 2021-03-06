class MicropostsController < ApplicationController

  #skip_before_filter :authenticate_user!

  before_action :set_micropost, only: [:show, :edit, :update, :destroy]

  # before_action do
  #   if request.format == Mime::ALL
  #     request.format = request.xhr? ? :js : :html
  #   end
  # end
  # GET /microposts
  # GET /microposts.json
  def index
    @microposts = Micropost.all
  end

  # GET /microposts/1
  # GET /microposts/1.json
  def show
    @micropost.create_activity :read, owner: current_user, recipient: @micropost.user
  end

  # GET /microposts/new
  def new
    @micropost = Micropost.new
  end

  # GET /microposts/1/edit
  def edit
  end

  # POST /microposts
  # POST /microposts.json
  def create
    @micropost = Micropost.new(micropost_params)

    respond_to do |format|
      if @micropost.save
        @micropost.create_activity :create, owner: current_user

        format.html { redirect_to @micropost }
        format.json { render :show, status: :created, location: @micropost }
      else
        format.html { render :new }
        format.json { render json: @micropost.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /microposts/1
  # PATCH/PUT /microposts/1.json
  def update
    respond_to do |format|
      if @micropost.update(micropost_params)

        @micropost.create_activity :update, owner: current_user, recipient: @micropost.user

        format.html { redirect_to @micropost, notice: 'Micropost was successfully updated.' }
        format.json { render :show, status: :ok, location: @micropost }
      else
        format.html { render :edit }
        format.json { render json: @micropost.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /microposts/1
  # DELETE /microposts/1.json
  def destroy
    @micropost.destroy
    respond_to do |format|
      #format.html { redirect_to microposts_url, notice: 'Micropost was successfully destroyed.' }
      #@format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_micropost
      @micropost = Micropost.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def micropost_params
      params.require(:micropost).permit(:content, :user_id, :humanizer_answer, :humanizer_question_id)
    end
end
