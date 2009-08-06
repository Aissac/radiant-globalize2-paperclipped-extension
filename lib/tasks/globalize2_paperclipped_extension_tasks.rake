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
        is_svn_or_dir = proc {|path| path =~ /\.svn/ || File.directory?(path) }
        puts "Copying assets from Globalize2PaperclippedExtension"
        Dir[Globalize2PaperclippedExtension.root + "/public/**/*"].reject(&is_svn_or_dir).each do |file|
          path = file.sub(Globalize2PaperclippedExtension.root, '')
          directory = File.dirname(path)
          mkdir_p RAILS_ROOT + directory, :verbose => false
          cp file, RAILS_ROOT + path, :verbose => false
        end
      end  
    end
  end
end
