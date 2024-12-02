require_relative "lib/blog/version"

Gem::Specification.new do |spec|
  spec.name        = "blog"
  spec.version     = Blog::VERSION
  spec.authors     = [ "A.V. Peredery" ]
  spec.email       = [ "peredery@pm.me" ]
  spec.homepage    = "https://github.com/hexlet"
  spec.summary     = "Summary of Blog."
  spec.description = "Description of Blog."

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the "allowed_push_host"
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  spec.metadata['allowed_push_host'] = 'https://github.com/hexlet'
  spec.metadata['rubygems_mfa_required'] = 'true'

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/hexlet"
  spec.metadata["changelog_uri"] = "https://github.com/hexlet"

  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]
  end

  spec.add_dependency "rails", ">= 7.2.2"
end
