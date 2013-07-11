class ResumesController < ApplicationController
  def new
  end

  def create
    @resume = current_user.resumes.build(params[:resume])

    if @resume.save
      flash[:success] = "Resume created"
      redirect_to current_user
    else
      redirect_to "/"
    end
  end

  def edit
    @resume = current_user.resumes.build if signed_in?
  end

  def show
    @resume = current_user.resumes.last if signed_in?
  end

  def destroy
  end

  def update
      @resume = current_user.resumes.last if signed_in?

    if @resume.update_attributes(params[:resume])
      flash[:success] = "Resume Updated"
      redirect_to current_user
    else
      flash[:failed] = "Resume not updated"
      redirect_to "/"
    end
  end
end
