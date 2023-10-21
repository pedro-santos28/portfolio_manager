class ProfileController < ApplicationController
  before_action :set_profile, only: %i[ index edit show  ]
  def index
  end

  def edit

  end

  def update
    url = "https://portfolio-next-cyan-five.vercel.app/api/profile?id=#{params[:id]}"
    response = Faraday.put(url, profile_params.to_json, "Content-Type" => "application/json")
    response_json = JSON.parse(response.body)
    puts response_json
    if response_json['status'] == 204 || response_json['status'] == 200
      redirect_to profile_path, notice: 'Perfil atualizado com sucesso!'
    end
  end

  private

  def profile_params
    params.require(:profile).permit(:name, :description, :image, traits: [:id, :description])
  end

  def set_profile
    response = Faraday.get('https://portfolio-next-cyan-five.vercel.app/api/profile')
    response_json = JSON.parse(response.body)
    @profile = response_json[0]
    puts @profile
  end


end
