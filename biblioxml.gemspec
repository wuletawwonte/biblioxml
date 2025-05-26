# frozen_string_literal: true

require_relative "lib/biblioxml/version"

Gem::Specification.new do |spec|
  spec.name = "biblioxml"
  spec.version = Biblioxml::VERSION
  spec.authors = ["Wuletaw Wonte"]
  spec.email = ["wuletawwonte@gmail.com"]

  spec.summary = "Convert bible xml file standards."
  spec.description = "Convert bible xml file standard from a custom one to Zefania and OSIS standards."
  spec.homepage = "https://github.com/wuletawwonte/biblioxml.git"
  spec.required_ruby_version = ">= 3.1.0"

  spec.metadata["changelog_uri"] = "https://github.com/wuletawwonte/biblioxml/blob/main/CHANGELOG.md"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  gemspec = File.basename(__FILE__)
  spec.files = IO.popen(%w[git ls-files -z], chdir: __dir__, err: IO::NULL) do |ls|
    ls.readlines("\x0", chomp: true).reject do |f|
      (f == gemspec) ||
        f.start_with?(*%w[bin/ test/ spec/ features/ .git .github appveyor Gemfile])
    end
  end
  spec.bindir = "bin"
  spec.executables = spec.files.grep(%r{\Abin/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  # Uncomment to register a new dependency of your gem
  # spec.add_dependency "example-gem", "~> 1.0"
end
