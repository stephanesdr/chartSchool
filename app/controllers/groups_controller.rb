# frozen_string_literal: true

class GroupsController < ApplicationController
  before_action :set_group, only: %i[show]

  def new
    @group = Group.new
  end

  def index
    @groups = Group.all
    @current_person_groups = current_person.my_groups
  end

  def create
    group = Group.new(group_params)
    if group.valid?
      group.save
      redirect_to group_path(group.id), success: "Groupe créé avec succès"
    else
      @group = group
      render 'new'
    end
  end

  def show; end

  private

  def group_params
    params.require(:group).permit(:name)
  end

  def set_group
    @group = Group.find(params[:id])
  end
end
