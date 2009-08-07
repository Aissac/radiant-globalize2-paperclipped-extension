namespace :radiant do
  namespace :extensions do
    namespace :globalize2_paperclipped do
      
      desc "Runs the migration of the Globalize2 Paperclipped extension"
      task :migrate => :environment do
        require 'radiant/extension_migrator'
        if ENV["VERSION"]
          Globalize2PaperclippedExtension.migrator.migrate(ENV["VERSION"].to_i)
        else
          Globalize2PaperclippedExtension.migrator.migrate
        end
      end
      
      desc "Copies public assets of the Globalize2 Paperclipped to the instance public/ directory."
      task :update => :environment do
        puts "Globalize2Paperclipped Extension has no public assets. Nothing done."
      end  
    end
  end
end