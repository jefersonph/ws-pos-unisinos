class LendsController < ApplicationController

  skip_before_filter :verify_authenticity_token, :except => [:update, :destroy]
  
  # GET /lends
  # GET /lends.json
  def index
    @lends = User.find_by_id(params[:user_id]).lends

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @lends }
    end
  end

  # GET /lends/1
  # GET /lends/1.json
  def show
    @lend = User.find_by_id(params[:user_id]).lends.find_by_id(params[:id])
    
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @lend }
    end
  end

  # GET /lends/new
  # GET /lends/new.json
  def new
    @user = User.find_by_id(params[:user_id])
    @lend = @user.lends.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @lend }
    end
  end

  # GET /lends/1/edit
  def edit
    @user = User.find_by_id(params[:user_id])
    @lend = @user.lends.find_by_id(params[:id])
  end

  # POST /lends
  # POST /lends.json
  def create
    @lend = User.find_by_id(params[:user_id]).lends.create(params[:lend])
    
    respond_to do |format|
      if @lend.save
        format.html { redirect_to user_lends_path(params[:user_id]), notice: 'Lend was successfully created.' }
        format.json { render json: @lend }
      else
        format.html { render action: "new" }
        format.json { render json: @lend.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /lends/1
  # PUT /lends/1.json
  def update
    @lend = User.find_by_id(params[:user_id]).lends.find_by_id(params[:id])

    respond_to do |format|
      if @lend.update_attributes(params[:lend])
        format.html { redirect_to user_lends_path(params[:user_id]), notice: 'Lend was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @lend.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lends/1
  # DELETE /lends/1.json
  def destroy
    @lend = User.find_by_id(params[:user_id]).lends.find_by_id(params[:id])
    @lend.destroy

    respond_to do |format|
      format.html { redirect_to user_lends_path(params[:user_id]) }
      format.json { head :no_content }
    end
  end

  def delete
    @lend = User.find_by_id(params[:user_id]).lends.find_by_id(params[:lend_id])
    
    #logger.debug "Lend: #{User.find_by_id(params[:user_id]).lends.find_by_id(params[:lend_id])}"

    @lend.destroy

    respond_to do |format|
      format.html { redirect_to user_lends_path(params[:user_id]) }
      format.json { head :no_content }
    end
  end
end
