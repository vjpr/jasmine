class JasmineDev < Thor

  desc "build", "Build Jasmine js & css files"
  method_option :directory, :default => "./lib/jasmine-core"

  def build(directory)
    invoke JasmineDev, ["js_hint"]

    say "Building Jasmine distribution from source into #{directory}", :cyan

    say 'Building JavaScript...', :yellow
    inside directory do
      create_file "jasmine.js", concat_contents_of(jasmine_js_paths)
      create_file "jasmine-html.js", concat_contents_of(jasmine_html_js_paths)
    end

    say 'Buliding CSS...', :yellow
    run "compass compile", :capture => true

    copy_file File.join("#{JasmineDev.project_root}", 'src', 'html', 'jasmine.css'),
              File.join(directory, 'jasmine.css')
  end

  no_tasks do
    def jasmine_js_paths
      first_files = JSON.parse(File.read("#{JasmineDev.project_root}/src/SourcesList.json"))
      first_paths = first_files.collect { |f| "#{JasmineDev.project_root}/src/core/#{f}" }

      remaining_paths = Dir.glob("#{JasmineDev.project_root}/src/core/*.js")
      remaining_paths << "#{JasmineDev.project_root}/src/version.js"

      add_only_new_elements(first_paths, remaining_paths)
    end

    def jasmine_html_js_paths
      first_paths = ["#{JasmineDev.project_root}/src/html/HtmlReporterHelpers.js"] + Dir.glob('./src/html/*.js')

      add_only_new_elements(first_paths, Dir.glob("#{JasmineDev.project_root}/src/html/*.js"))
    end

    def add_only_new_elements(first, remaining)
      remaining.inject(first) do |result, element|
        result << element unless result.include?(element)
        result
      end
    end

    def concat_contents_of(paths)
      paths.inject("") do |string, path|
        string << File.read(path)
        string
      end
    end
  end
end