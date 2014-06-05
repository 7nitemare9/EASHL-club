class PlayerSeasonStat < ActiveRecord::Base
  belongs_to :player
  require 'web_helpers'

  def self.get_data(player_id)
    url = 'http://www.easports.com/iframe/nhl14proclubs/api/platforms/xbox/members/' + player_id + '/stats'
    create_hash WebHelpers.read_json(url)
  end

  def self.create_hash(json_hash)
    data = json_hash["raw"][0]
    unless data == nil
      hash = { 
        :skwins             =>  data["skwins"],
        :sklosses           =>  data["sklosses"],
        :skgp               =>  data["skgp"],
        :skgoals            =>  data["skgoals"],
        :skassists          =>  data["skassists"],
        :skpoints           =>  data["skpoints"],
        :skgwg              =>  data["skgwg"],
        :skplusmin          =>  data["skplusmin"],
        :skpim              =>  data["skpim"],
        :skppg              =>  data["skppg"],
        :skshg              =>  data["skshg"],
        :skoffsides         =>  data["skoffsides"],
        :skfights           =>  data["skfights"],
        :skfightswon        =>  data["skfightswon"],
        :skfo               =>  data["skfo"],
        :skfow              =>  data["skfow"],
        :skfol              =>  data["skfol"],
        :skfop              =>  data["skfop"],
        :skhits             =>  data["skhits"],
        :skbs               =>  data["skbs"],
        :skshots            =>  data["skshots"],
        :skshotpct          =>  data["skshotpct"],
        :skdekes            =>  data["skdekes"],
        :skdekesmade        =>  data["skdekesmade"],
        :skgiveaways        =>  data["skgiveaways"],
        :sktakeaways        =>  data["sktakeaways"],
        :skscrnchances      =>  data["skscrnchances"],
        :skscrngoals        =>  data["skscrngoals"],
        :glwins             =>  data["glwins"],
        :gllosses           =>  data["gllosses"],
        :glot               =>  data["glot"],
        :glshots            =>  data["glshots"],
        :glgaa              =>  data["glgaa"],
        :glga               =>  data["glga"],
        :glmin              =>  data["glmin"],
        :glbrkshots         =>  data["glbrkshots"],
        :glbrksaves         =>  data["glbrksaves"],
        :glbrksavepct       =>  data["glbrksavepct"],
        :glpenshots         =>  data["glpenshots"],
        :glpensaves         =>  data["glpensaves "],
        :glpensavepct       =>  data["glpensavepct"],
        :glsaves            =>  data["glsaves"],
        :glsavepct          =>  data["glsavepct"],
        :glso               =>  data["glso"],
        :glsoperiods        =>  data["glsoperiods"],
        :glwins             =>  data["glwins"],
        :glgp               =>  data["glgp"],
        :lwgp               =>  data["lwgp"],
        :rwgp               =>  data["rwgp"],
        :cgp                =>  data["cgp"],
        :dgp                =>  data["dgp"]
      }
    end
  end

end
