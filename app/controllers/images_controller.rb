class ImagesController < ApplicationController
  #before_filter :is_user_logged_in?, :only => [:createNoId]

  #before_filter :authenticate
  # GET /images
  # GET /images.json
  def index
    @images = Image.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @images }
    end
  end

  # GET /images/1
  # GET /images/1.json
  def show
    @image = Image.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @image }
    end
  end

  # GET /images/new
  # GET /images/new.json
  def new
    @image = Image.new
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @image }
    end
  end

  # GET /images/1/edit
  def edit
    @image = Image.find(params[:id])
  end

  # POST /images
  # POST /images.json
  def create
    @image = Image.new(params[:image])
    @image.user_id = current_user.id
    logger.debug "The value variable x = '#{@image}'"
    respond_to do |format|
      if @image.save
        format.html { redirect_to current_user, notice: 'Image was successfully created.' }
        format.json { render json: @image, status: :created, location: @image }
      else
        format.html { render action: "new" }
        format.json { render json: @image.errors, status: :unprocessable_entity }
      end
    end
  end

  def createNoRedirect
    @image = Image.new(params[:image])
    @image.user_id = current_user.id
    logger.debug "The value variable x = '#{@image}'"
    respond_to do |format|
      if @image.save
        format.html { redirect_to current_user, notice: 'Image was successfully created.' }
        format.json { render json: @image, status: :created, location: @image }
      else
        format.html { render action: "new" }
        format.json { render json: @image.errors, status: :unprocessable_entity }
      end
    end
  end

  def createNoId
    @image = Image.new(params[:image])
    logger.debug "The value variable x = '#{@image}'"
    @image.path = PhotoUploader.new
    @image.path.cache!(params[:image])    
    #logger.debug uploader.to_yaml
    #logger.debug uploader.cache_name
     if @image.path.cached?
     #render :partial => 'imageInit', :locals => { :image => @image } 
      redirect_to root_url, :locals => { :image => @image }   
   else
    redirect_to root_url,  notice: 'Upload did not processed.'  
  end
      
end

  # PUT /images/1
  # PUT /images/1.json
  def update
    @image = Image.find(params[:id])

    respond_to do |format|
      if @image.update_attributes(params[:image])
        format.html { redirect_to @image, notice: 'Image was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @image.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /images/1
  # DELETE /images/1.json
  def destroy
    @image = Image.find(params[:id])
    @image.destroy

    respond_to do |format|
      format.html { redirect_to current_user }
      format.json { head :ok }
    end
  end
end
