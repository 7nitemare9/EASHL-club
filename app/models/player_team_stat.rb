class PlayerTeamStat < ActiveRecord::Base
  belongs_to :player
  require 'web_helpers'

  def self.get_data(team_id, player_id)
    url = 'http://www.easports.com/iframe/nhl14proclubs/api/platforms/xbox/clubs/' +
           team_id + '/members/' + player_id + '/stats?filters=pretty'
    create_hash WebHelpers.read_json(url)
  end

  def self.create_hash(json_hash)
    data = json_hash["raw"][0]
    unless data == nil
      hash = { 
        :playername   => data["playername"],
        :totalgp      => data["totalgp"],
        :skgoals      => data["skgoals"],
        :skassists    => data["skassists"],
        :skplusmin    => data["skplusmin"],
        :skpoints     => data["skpoints"],
        :skpim        => data["skpim"],
        :skppg        => data["skppg"],
        :skshg        => data["skshg"],
        :skhits       => data["skhits"],
        :skbs         => data["skbs"],
        :skshots      => data["skshots"],
        :skshotpct    => data["skshotpct"],
        :glgaa        => data["glgaa"],
        :glga         => data["glga"],
        :glsaves      => data["glsaves"],
        :glsavepct    => data["glsavepct"],
        :glso         => data["glso"],
        :glsoperiods  => data["glsoperiods"],
        :glwins       => data["glwins"],
        :glgp         => data["glgp"],
        :memberId     => data["memberId"]
      }
    end
  end

end
