class ProjectsController < ApplicationController
  before_action :set_user

  def index
    @projects = @user.projects
    render :index
  end

  def new
    @project = @user.projects.new
    render :new
  end

  def create
    @project = @user.projects.new(project_params)
    if @project.save
      flash[:notice] = "Project successfully added!"
      redirect_to project_path(@project)
    else
      flash[:alert] = "There was an error. Please try again."
      render :new
    end
  end

  def show
    @project = Project.find(params[:id])
    render :show
  end

  def edit
    @project = Project.find(params[:id])
    render :edit
  end

  def update
    @project = Project.find(params[:id])
    if @project.update(project_params)
      flash[:notice] = "Project successfully updated"
      redirect_to project_path(@project)
    else
      flash[:alert] = "there was an error. Please try again."
      render :edit
    end
  end

  def destroy
    @project = Project.find(params[:id])
    @project.destroy
    flash[:notice] = "Project successfully deleted!"
    redirect_to projects_path
  end

  private
  def project_params
    params.require(:project).permit(:title, :description, :complete)
  end

  def set_user
    @user = current_user
  end

end