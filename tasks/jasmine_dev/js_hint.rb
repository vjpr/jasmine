class JasmineDev < Thor

  desc "js_hint", "Run Jasmine source through JSHint"
  def js_hint
    return unless node_installed?

    say "Running JSHint... ", :green
    run "node jshint/run.js"
  end
end