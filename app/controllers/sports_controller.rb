class SportsController < ApplicationController
  def index
    @sports = Sport.page(params[:page]).per(10)

    render("sports/index.html.erb")
  end

  def show
    @photo = Photo.new
    @sport = Sport.find(params[:id])

    render("sports/show.html.erb")
  end

  def new
    @sport = Sport.new

    render("sports/new.html.erb")
  end

  def create
    @sport = Sport.new

    @sport.name = params[:name]
    @sport.spot_id = params[:spot_id]

    save_status = @sport.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/sports/new", "/create_sport"
        redirect_to("/sports")
      else
        redirect_back(:fallback_location => "/", :notice => "Sport created successfully.")
      end
    else
      render("sports/new.html.erb")
    end
  end

  def edit
    @sport = Sport.find(params[:id])

    render("sports/edit.html.erb")
  end

  def update
    @sport = Sport.find(params[:id])

    @sport.name = params[:name]
    @sport.spot_id = params[:spot_id]

    save_status = @sport.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/sports/#{@sport.id}/edit", "/update_sport"
        redirect_to("/sports/#{@sport.id}", :notice => "Sport updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Sport updated successfully.")
      end
    else
      render("sports/edit.html.erb")
    end
  end

  def destroy
    @sport = Sport.find(params[:id])

    @sport.destroy

    if URI(request.referer).path == "/sports/#{@sport.id}"
      redirect_to("/", :notice => "Sport deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Sport deleted.")
    end
  end
end
