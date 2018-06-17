class MemberFunctionsController < ApplicationController
  before_action :set_member_function, only: [:show, :edit, :update, :destroy]

  # GET /member_functions
  # GET /member_functions.json
  def index
    @member_functions = MemberFunction.all
  end

  # GET /member_functions/1
  # GET /member_functions/1.json
  def show
  end

  # GET /member_functions/new
  def new
    @member_function = MemberFunction.new
  end

  # GET /member_functions/1/edit
  def edit
  end

  # POST /member_functions
  # POST /member_functions.json
  def create
    @member_function = MemberFunction.new(member_function_params)

    respond_to do |format|
      if @member_function.save
        format.html { redirect_to @member_function, notice: 'Member function was successfully created.' }
        format.json { render :show, status: :created, location: @member_function }
      else
        format.html { render :new }
        format.json { render json: @member_function.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /member_functions/1
  # PATCH/PUT /member_functions/1.json
  def update
    respond_to do |format|
      if @member_function.update(member_function_params)
        format.html { redirect_to @member_function, notice: 'Member function was successfully updated.' }
        format.json { render :show, status: :ok, location: @member_function }
      else
        format.html { render :edit }
        format.json { render json: @member_function.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /member_functions/1
  # DELETE /member_functions/1.json
  def destroy
    @member_function.destroy
    respond_to do |format|
      format.html { redirect_to member_functions_url, notice: 'Member function was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_member_function
      @member_function = MemberFunction.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def member_function_params
      params.require(:member_function).permit(:member_id, :function, :since, :until, :function_still_active)
    end
end
