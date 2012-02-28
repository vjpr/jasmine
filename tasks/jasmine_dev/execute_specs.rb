class JasmineDev < Thor
  desc "execute_specs_in_node", "Run all relevant specs in Node.js"
  def execute_specs_in_node
    return unless node_installed?

    invoke :build_distribution
    invoke :count_specs

    say "Running all appropriate specs via Node.js", :cyan

    use_color = Term::ANSIColor.coloring? ? "--color" : "--noColor"

    run "node spec/node_suite.js #{use_color}"
  end
end
