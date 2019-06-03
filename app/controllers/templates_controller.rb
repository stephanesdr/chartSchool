# frozen_string_literal: true

class TemplatesController < ApplicationController
  include TemplatesHelper
  before_action :authenticate_person!, only: %i[new create]
  before_action :not_the_creator, only: %i[show edit]

  def new
    @template = Template.all
  end

  def create
    @template = Template.create(title: params[:title], description: params[:description], resource: params[:resource], person: current_person)
    if @template.errors.any?
      flash[:warning] = "Echec dans la création du modèle, veuillez à ce que tout les champs soit correctement rempli"
      redirect_to request.referer
    elsif flash[:notice] = "Modèle correctement créé"
      redirect_to template_path(@template.id)
    end
  end

  def show
    @template = Template.find(params[:id])
    @steps = @template.step_templates
  end

  def edit
    @template = Template.find(params[:id])
  end

  def update
    @template = Template.find(params[:id])
    @template.update(title: params[:template][:title], description: params[:template][:description], resource: params[:template][:resource])
    redirect_to template_path(@template.id)
  end
end
