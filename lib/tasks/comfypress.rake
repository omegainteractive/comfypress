# Small hack to auto-run migrations during testing
namespace :db do
  task :abort_if_pending_migrations => [:migrate]
end

namespace :comfypress do
  namespace :fixtures do
    
    desc 'Import Fixture data into database (options: FROM=folder_name TO=site_identifier)'

    task :import => :environment do
      to            = ENV['TO'] || ENV['FROM']
      from          = ENV['FROM']
      force_reload  = ENV['FORCE'].try(:downcase) != 'false'

      puts "Importing CMS Fixtures from Folder [#{from}] to Site [#{to}] ..."

      # changing so that logger is going straight to screen
      logger_org = ComfyPress.logger
      ComfyPress.logger = Logger.new(STDOUT)

      ComfyPress::Fixtures.import_all(to, from, force_reload)

      ComfyPress.logger = logger_org
    end
    
    desc 'Export database data into Fixtures (options: FROM=site_identifier.com TO=folder_name)'
    task :export => :environment do
      to    = ENV['TO'] || ENV['FROM']
      from  = ENV['FROM']
      
      puts "Exporting CMS data from Site [#{from}] to Folder [#{to}] ..."

      # changing so that logger is going straight to screen
      logger_org = ComfyPress.logger
      ComfyPress.logger = Logger.new(STDOUT)

      ComfyPress::Fixtures.export_all(from, to)

      ComfyPress.logger = logger_org
      
      puts 'Done!'
    end
  end
end
