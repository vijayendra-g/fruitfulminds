class PostsurveysController < ApplicationController
  def new
    @all_schools = School.all
    @postsurvey_fields = Postsurvey.new(params[:postsurvey])
  end

  def create
    school = School.find_by_name(params[:school])
    begin
      @survey = school.postsurveys.create!(params[:postsurvey])
      flash[:notice] = "Results successfully added."
      redirect_to new_postsurveys_path
    rescue ActiveRecord::RecordInvalid
      flash[:warning] = "Results failed to add. Incomplete or has invalid characters."
      redirect_to new_postsurveys_path(:postsurvey => params[:postsurvey])
    end
  end
end
