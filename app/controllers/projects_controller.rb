class ProjectsController < ApplicationController
  before_action :set_projects, only: %i[ index edit show  ]

  def index
  end

  def show
    @projects.each do |project|
      if project["id"].to_i == params[:id].to_i
        @project = Project.new(project)
      end
    end
  end

  # GET /projects/1/edit
  def edit
    @projects.each do |project|
      if project["id"].to_i == params[:id].to_i
        @project = Project.new(project)
      end
    end
  end

  def update
    @project = Project.new(project_params)
    if @project.valid?
      url = "https://portfolio-next-cyan-five.vercel.app/api/projects?id=#{params[:id]}"
      response = Faraday.put(url, project_params.to_json, "Content-Type" => "application/json")
      response_json = JSON.parse(response.body)
      puts response_json
      if response_json['status'] == 204 || response_json['status'] == 200
        redirect_to projects_path, notice: 'Projeto atualizado com sucesso!'
      end
    end
  end

  private
  def project_params
    params.require(:project).permit(:name, :image_url, :description, :repository_url, :hosting_url)
  end

  def set_projects
    response = Faraday.get('https://portfolio-next-cyan-five.vercel.app/api/projects')
    response_json = JSON.parse(response.body)
    @projects = response_json
  end
end
