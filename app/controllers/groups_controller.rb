# frozen_string_literal: true

class GroupsController < ApplicationController
  def new
    @group = Group.new
  end

  def index
    @groups = Group.all
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

  private

  def group_params
    params.require(:group).permit(:name)
  end
end
