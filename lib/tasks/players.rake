desc "gets current member data"
task :get_members => :environment do
  Player.get_page('members', '281934')
end
