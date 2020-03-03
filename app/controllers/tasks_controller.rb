class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]

  def index
    @tasks = Task.all
  end

  def show
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    @task.save
    redirect_to task_path(@task)
    # la methode create est appeler suite à ces etapes :
    # je submit ds le form
    # ca envoie une requete http en post - je peux le voir en inspectant le form ds linspecteur
    # ds le routes.rb, le post renvoi vers cette methode create ou je suis actuellement
    # la methode create est appliqué
  end

  def edit
  end

  def update
    @task.update(task_params)
    redirect_to task_path(@task)
    # la methode update est appeler suite à ces etapes :
    # je submit ds le form
    # ca envoie une requete http en patch - je peux le voir en inspectant le form ds linspecteur, html ecrit post
    # ds le routes.rb, le patch renvoi vers cette methode update ou je suis actuellement
    # la methode update est appliqué
  end

  def destroy
    @task.destroy

    redirect_to tasks_path
  end

  private

  def set_task
    @task = Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:title, :details, :completed)
  end
end
