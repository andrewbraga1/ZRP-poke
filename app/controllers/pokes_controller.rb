class PokesController < ApplicationController
    def busca 
        params.permit(:pokemon_name)
        begin
            response = RestClient.get "https://pokeapi.co/api/v2/pokemon/"+params[:pokemon_name], {accept: :json}
            response_json = JSON.parse response
            res = response_json["abilities"].map{ |item| item["ability"]["name"]} if response_json["abilities"].size > 0
        rescue
            res = 'Sem resultados'
        end
      
        respond_to do |format|    
            format.html { render json: res, status:200 }
            format.json { render json: res, status:200 }
        end
    end

end
