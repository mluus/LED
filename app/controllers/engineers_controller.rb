class EngineersController < ApplicationController
  before_action :set_engineer, only: [:show, :edit, :update, :destroy]
  protect_from_forgery with: :null_session, if: Proc.new { |c| c.request.format == 'application/json' }
  skip_before_filter  :verify_authenticity_token

  # GET /engineers
  # GET /engineers.json
  def index
    @engineers = Engineer.where(rentee_id: params[:rentee_id])
    @rentee = Rentee.find(params[:rentee_id])
  end

  # GET /engineers/1
  # GET /engineers/1.json
  def show

  end

  # GET /engineers/new
  def new
    @rentee = Rentee.find(params[:rentee_id])
    @engineer = Engineer.new
  end

  # GET /engineers/1/edit
  def edit
    @rentee = Rentee.find(params[:rentee_id])
  end

  # POST /engineers
  # POST /engineers.json
  def create
    @engineer = Engineer.new(engineer_params)
    r = Rentee.find(params[:rentee_id])
    @engineer.rentee = r
      if @engineer.save
      end

    respond_to do |format|
      if @engineer.save
        format.html { redirect_to action: "index", notice: 'Engineer was successfully created.' }
        format.json { render :show, status: :created, location: @engineer }
      else
        format.html { render :new }
        format.json { render json: @engineer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /engineers/1
  # PATCH/PUT /engineers/1.json
  def update
    numTokens = params[:engineer][:tokens].to_i
    engineerId = params[:id]
    renteeId = params[:rentee_id]
    engineerTokens = Engineer.find(engineerId).tokens
    if engineerTokens == nil
      engineerTokens = 0
    end
    renteeTokens = Rentee.find(renteeId).tokens

    if numTokens <= renteeTokens
      renteeTokens = renteeTokens - numTokens
      Rentee.update(renteeId, :tokens => renteeTokens)
      engineerTokens = engineerTokens + numTokens

    else
      flash[:alert] = "Not enough tokens. Please purchase more!"
    end

    respond_to do |format|
      if @engineer.update(:tokens => engineerTokens)
        format.html { redirect_to :back, notice: 'Engineer was successfully updated.' }
        format.json { render :show, status: :ok, location: [@engineer.rentee, @engineer] }
      else
        format.html { render :edit }
        format.json { render json: @engineer.errors, status: :unprocessable_entity }
      end
    end
  end


  def associate
    uuid = params[:device]
    password = params[:password]
    puts uuid
    puts password
    engineer = Engineer.find_by(password: password)
    engineer.device = uuid
    if engineer.save
        render :json => { }
    else
        render :json => { }, :status => 500
    end
  end

  def tokenInfo
    uuid = params[:device]
    puts uuid
    engineer = Engineer.find_by(device: uuid)
    tokens_current = engineer.tokens
    render json: tokens_current
  end


  def usesToken
    uuid = params[:device]
    @engineer = Engineer.find_by(device: uuid)
    a = @engineer.tokens
    puts a
    @engineer.tokens = a - 1
    @engineer.save
  end





  # DELETE /engineers/1
  # DELETE /engineers/1.json
  def destroy
    @engineer.destroy
    respond_to do |format|
      format.html { redirect_to engineers_url, notice: 'Engineer was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_engineer
      @engineer = Engineer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def engineer_params
      params.require(:engineer).permit(:name, :phone, :tokens ,:password,)
    end
end
