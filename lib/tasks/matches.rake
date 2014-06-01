desc "gets latest matches"
task :get_matches => :environment do
  Match.get_matches('matches', '281934', '10')
end
