class RenteesController < ApplicationController
  before_action :set_rentee, only: [:show, :edit, :update, :destroy, :add_token]
  before_action :authenticate_user!, :except => [:create]
  protect_from_forgery with: :null_session, if: Proc.new { |c| c.request.format == 'application/json' }


  # GET /rentees
  # GET /rentees.json
  def index
    @rentees = Rentee.all

    redirect_to rentee_engineers_path(current_user.rentee) unless isAdmin?

  end

  # GET /rentees/1
  # GET /rentees/1.json
  def show
  end

  # GET /rentees/new
  def new
    @rentee = Rentee.new
  end

  # GET /rentees/1/edit
  def edit
  end

  # POST /rentees
  # POST /rentees.json
  def create
    @rentee = Rentee.new(rentee_params)

    respond_to do |format|
      if @rentee.save
        @user = User.new(:email => rentee_params[:email], :password => 'password', :password_confirmation => 'password')
        @user.rentee = @rentee
        @user.save

        format.html { redirect_to @rentee, notice: 'Rentee was successfully created.' }
        format.json { render :show, status: :created, location: @rentee }
      else
        format.html { render :new }
        format.json { render json: @rentee.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /rentees/1
  # PATCH/PUT /rentees/1.json
  def update
    respond_to do |format|
      if @rentee.update(rentee_params)
        format.html { redirect_to @rentee, notice: 'Rentee was successfully updated.' }
        format.json { render :show, status: :ok, location: @rentee }
      else
        format.html { render :edit }
        format.json { render json: @rentee.errors, status: :unprocessable_entity }
      end
    end
  end

  def add_token
    # rentee_params
    # binding.pry
    @rentee.tokens += rentee_params[:tokens].to_i
    respond_to do |format|
      if @rentee.save
        format.html { redirect_to @rentee, notice: 'Rentee was successfully updated.' }
        format.json { render :show, status: :ok, location: @rentee }
      else
        format.html { redirect_to @rentee, notice: 'Rentee has error.' }
        format.json { render json: @rentee.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rentees/1
  # DELETE /rentees/1.json
  def destroy
    @rentee.destroy
    respond_to do |format|
      format.html { redirect_to rentees_url, notice: 'Rentee was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_rentee
      @rentee = Rentee.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def rentee_params

      params.require(:rentee).permit(:name, :phone, :address, :tokens, :email)
    end
end