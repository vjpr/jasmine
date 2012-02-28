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
      return true if has_node?

      say "Node.js is required to develop Jasmine. Please visit http://nodejs.org to install. ",
          :red
      false
    end

    def has_node?
      run "which node", :verbose => false, :capture => true
      last_exit_code = $?.to_s[-1]

      last_exit_code == '0'
    end
  end
end
