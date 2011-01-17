class GlassesController < ApplicationController
  # GET /glasses
  # GET /glasses.xml
  def index
    @glasses = Glass.all
    @glass = Glass.current_day

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @glasses }
    end
  end
  
  # POST /glasses
  # POST /glasses.xml
  def create
    @glass = Glass.one_more

    respond_to do |format|
        format.html { redirect_to(root_path, :notice => 'Another glass down!') }
        format.xml  { render :xml => @glass, :status => :created, :location => @glass }
    end
  end

  # DELETE /glasses/1
  # DELETE /glasses/1.xml
  def destroy
    Glass.one_less

    respond_to do |format|
      format.html { redirect_to(glasses_url) }
      format.xml  { head :ok }
    end
  end
end
