class PokesController < ApplicationController
    before_action :poke_params
    def busca 
        
        if params[:pokemon_name].present?
            begin
                response = RestClient.get "https://pokeapi.co/api/v2/pokemon/"+params[:pokemon_name], {accept: :json}
                response_json = JSON.parse response
                res = response_json["abilities"].map{ |item| item["ability"]["name"]} if response_json["abilities"].size > 0
            rescue
                res = 'Sem resultados'
            end
        else
            res = 'Digite um nome válido'
        end
        respond_to do |format|    
            format.html { render json: res, status:200 }
            format.json { render json: res, status:200 }
        end
    end

    def no_valid
        res = 'Digite um nome válido'
        respond_to do |format|    
            format.html { render json: res, status:200 }
            format.json { render json: res, status:200 }
        end
    end

    def poke_params
        params.permit(:pokemon_name)
    end

end
