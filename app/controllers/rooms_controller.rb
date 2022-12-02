class RoomsController < ApplicationController
  before_action :set_room, only: %i[ show edit update destroy chat clear_role message_history ]
  before_action :authenticate_user!
  
  # GET /rooms or /rooms.json
  def index
    @rooms = Room.all
  end

  # GET /rooms/1 or /rooms/1.json
  def show
  end

  def clear_role
    if params[:role] == 'host'
      @room.update_attribute(:host_id, nil)
    elsif  params[:role] == 'player'
      @room.update_attribute(:player_id, nil)
    end
    redirect_to action: 'index'
  end

  # GET /rooms/new
  def new
    @room = Room.new
  end

  # GET /rooms/1/edit
  def edit
  end

  # POST /rooms or /rooms.json
  def create
    @room = Room.new(room_params)

    respond_to do |format|
      if @room.save
        format.html { redirect_to room_url(@room), notice: "Room was successfully created." }
        format.json { render :show, status: :created, location: @room }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @room.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /rooms/1 or /rooms/1.json
  def update
    respond_to do |format|
      if @room.update(room_params)
        format.html { redirect_to room_url(@room), notice: "Room was successfully updated." }
        format.json { render :show, status: :ok, location: @room }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @room.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rooms/1 or /rooms/1.json
  def destroy
    @room.destroy

    respond_to do |format|
      format.html { redirect_to rooms_url, notice: "Room was successfully destroyed." }
      format.json { head :no_content }
    end
  end


  def chat
    if params[:role].present? && params[:role] == 'host'
      @room.update_attribute(:host_id, current_user.id)
    elsif params[:role].present? && params[:role] == 'player'
      @room.update_attribute(:player_id, current_user.id)
    end
    @current_user = current_user
    @message = Message.new
    @messages = @room.messages
  end

  def message_history
    @messages = @room.messages
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_room
      @room = Room.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def room_params
      params.require(:room).permit(:name, :host_id, :player_id)
    end
end
