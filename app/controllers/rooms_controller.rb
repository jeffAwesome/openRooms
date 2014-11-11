class RoomsController < ApplicationController
  before_action :set_room, only: [:edit, :update, :destroy]
  before_action :set_new, only: [:index, :popular, :recent]

  # GET /rooms
  # GET /rooms.json
  def index
    #@rooms = Room.all
    if params[:search]
      @rooms = Room.search(params[:search]).order("created_at DESC")
    else
      @rooms = Room.all.order('created_at DESC')
  end
  end

  def popular
    @rooms = Room.all
  end

  def recent
    @rooms = Room.order('created_at desc')
  end

  def toggle_like
    @room = Room.find(params[:room_id])
    current_user.toggle_like!(@room)
    redirect_to :root, notice: "Your action regarding #{@room.title} has been saved."
  end


  # GET /rooms/new
  def new
    @room = Room.new
  end

  # GET /rooms/1/edit
  def edit
  end

  # POST /rooms
  # POST /rooms.json
  def create
    @room = Room.new(room_params)

    respond_to do |format|
      if @room.save
        format.html { redirect_to rooms_path(), notice: 'Room was successfully created.' }
        format.json { render action: 'show', status: :created, location: @room }
      else
        format.html { render action: 'new' }
        format.json { render json: @room.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /rooms/1
  # PATCH/PUT /rooms/1.json
  def update
    respond_to do |format|
      if @room.update(room_params)
        format.html { redirect_to @room, notice: 'Room was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @room.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rooms/1
  # DELETE /rooms/1.json
  def destroy
    @room.destroy
    respond_to do |format|
      format.html { redirect_to rooms_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_room
      @room = Room.find(params[:id])
    end

    def set_new
      @room = Room.new
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def room_params
      params.require(:room).permit(:title, :image, :room_image, :user_id)
    end
end
