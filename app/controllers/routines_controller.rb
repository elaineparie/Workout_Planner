class RoutinesController < ApplicationController
  before_action :set_routine, only: [:show, :edit, :update, :destroy]
  before_action :redirect, only: [:edit, :update]
  def new
    @routine = Routine.new
    @exercises = Exercise.all
  end

  def create
  @routine = Routine.new(routine_params)
    if @routine.save
      current_member.routines << @routine
    redirect_to routine_path(@routine)
    else
    render new_routine_path
    end
  end

  def edit
  end

  def update
    if @routine.update(routine_params)
      redirect_to routine_path(@routine)
    else
      render :edit
    end
  end

  def index
    @routines = Routine.all
  end

  def show
  end

  private
  def redirect
    if !current_member.routines.include?(@routine)
      redirect_to "/routines?error=cannot view that page"
    end
  end

  def set_routine
    @routine = Routine.find(params[:id])
  end

  def routine_params
    params.require(:routine).permit(:name, :kind, exercise_ids:[], exercise_attributes: [:name, :kind, :sets, :reps, :lbs])
  end

end
