desc "gets current member online status"
task :get_online_status => :environment do
  Online.get_online_status
end
