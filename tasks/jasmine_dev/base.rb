class JasmineDev < Thor
  include Thor::Actions

  def self.source_root
    File.dirname(__FILE__)
  end

  def self.project_root
    File.join(JasmineDev.source_root, '..', '..')
  end

  no_tasks do
    def node_installed?
      run "which node", :verbose => false, :capture => true
      exit_code = $?.to_s[-1]
      return true if exit_code == '0'

      say "Node.js is required to develop Jasmine. Please visit http://nodejs.org to install. ",
          :red
      false
    end
  end
end
