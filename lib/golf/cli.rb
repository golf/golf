require 'thor'
require 'thor/group'
require 'erb'

module Golf

  class CLI < Thor
    include Thor::Actions
    
    def self.source_root
      File.expand_path("../../../", __FILE__)
    end

    desc "new [NAME] (optional)[TEMPLATE]", "Creates new golf app, takes NAME and optionally TEMPLATE"
    def new(name, template = false)
      unless template
        directory("templates/new", name)
      else
        directory("templates/#{template}", name)
      end
    end

    desc "server", "Run the golf app"
    def server
      `rackup`
    end
    
    desc "compile [DESTINATION]", "Compile the app into a directory"
    def compile(dir)
      Golf::Compiler.compile!
    end
    
    desc "version", "Output the version number"
    def version
      puts Golf::VERSION
    end


  end
  
end
