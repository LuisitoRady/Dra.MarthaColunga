class UsersController < ApplicationController
  before_action :authenticate_user
  before_action :set_type
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /users
  # GET /users.json
  def index
    if current_user.type == "Secretary" && (type == "Secretary" || type == "Admin" || type == "User")
        redirect_to pacients_path
    end

    if current_user.type == "Secretary"
      @users = Pacient.all
    else 
      @users = type_class.all
    end
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = type_class.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @user = type_class.new(user_params)

    respond_to do |format|
      if @user.save
        #redirect_to @user, success: "Se ha creado exitosamente el #{@user.type}"
        format.html { redirect_to @user, success: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, success: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, success: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_type
      @type = type
    end

    def type
      User.types.include?(params[:type]) ? params[:type] : "User"
    end

    def type_class
      type.constantize
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = type_class.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(type.underscore.to_sym).permit(:names, :lastnames, :type, :age, :cellphone, :email, :init_preg_week, :salary, :category_id, :password)
    end

    def authenticate_user
      if !current_user
        redirect_to root_url
      elsif current_user.type == "Pacient"
        redirect_to root_path, danger: 'No tienes acceso a esta información.'
      end
    end
end
