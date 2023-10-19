class AboutsController < ApplicationController
  before_action :set_about, only: %i[ index show edit update destroy ]

  # GET /abouts or /abouts.json
  def index
  end

  # GET /abouts/1/edit
  def edit
  end

  # PATCH/PUT /abouts/1 or /abouts/1.json
  def update
    data = {:title => params[:title], :content => params[:content]}.to_json
    url = "https://portfolio-next-cyan-five.vercel.app/api/about?id=#{params[:id]}"

    response = Faraday.put(url, data, "Content-Type" => "application/json")

    if response.success?
      flash[:notice] = 'SOBRE - Atualizado com sucesso!'
      redirect_to abouts_path
    else
      flash[:alert] = 'SOBRE - Erro ao atualizar sobre!'
      render :edit
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_about
      response = Faraday.get('https://portfolio-next-cyan-five.vercel.app/api/about')
      response_json = JSON.parse(response.body)[0]
      @about = About.new({id: response_json['id'], title: response_json['title'], content: response_json['content']})
    end

    # Only allow a list of trusted parameters through.
    def about_params
      params.require(:about).permit(:id, :title, :content)
    end
end
