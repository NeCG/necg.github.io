module Jekyll
  class ProjectsIndex < Page
    def initialize(site, base, dir)
      @site = site
      @base = base
      @dir  = dir
      @name = "index.html"

      self.process(@name)
      self.read_yaml(File.join(base, '_layouts'), 'projects.html')
      self.data['projects'] = self.get_projects(site)
    end

    def get_projects(site)
      {}.tap do |projects|
        Dir['_projects/*.yml'].each do |path|
          name   = File.basename(path, '.yml')
          config = YAML.load(File.read(File.join(@base, path)))
          projects[name] = config if config['published']
        end
      end
    end
  end

  class ProjectIndex < Page
    def initialize(site, base, dir, path)
      @site     = site
      @base     = base
      @dir      = dir
      @name     = "index.html"
      self.data = YAML.load(File.read(File.join(@base, path)))

      self.process(@name) if self.data['published']
    end
  end

  class GenerateProjects < Generator
    safe true
    priority :normal

    def generate(site)
      self.write_projects(site)
    end

    # Loops through the list of project pages and processes each one.
    def write_projects(site)
      if Dir.exists?('_projects')
        Dir.chdir('_projects')
        Dir["*.yml"].each do |path|
          name = File.basename(path, '.yml')
          self.write_project_index(site, "_projects/#{path}", name)
        end

        Dir.chdir(site.source)
        self.write_projects_index(site)
      end
    end

    def write_projects_index(site)
      projects = ProjectsIndex.new(site, site.source, "/projects")
      projects.render(site.layouts, site.site_payload)
      projects.write(site.dest)

      site.pages << projects
      site.static_files << projects
    end

    def write_project_index(site, path, name)
      project = ProjectIndex.new(site, site.source, "/projects/#{name}", path)

      if project.data['published']
        project.render(site.layouts, site.site_payload)
        project.write(site.dest)

        site.pages << project
        site.static_files << project
      end
    end
  end
end
