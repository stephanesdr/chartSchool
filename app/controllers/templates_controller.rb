# frozen_string_literal: true

class TemplatesController < ApplicationController
  def new
    @template = Template.all
  end

  def create
    @template = Template.create(title: params[:title], description: params[:description], resource: params[:resource], person: current_person)
    if @template.errors.any?
      flash[:warning] = "Echec dans la création du modèle, veuillez à ce que tout les champs soit correctement rempli"
      redirect_to request.referer
    elsif flash[:notice] = "Modèle correctement créé"
      redirect_to root_path
    end
  end

  def show
    @template = Template.find(params[:id])
    @steps = @template.step_templates
  end
end
