# frozen_string_literal: true

require_relative "lib/gtfskit/version"

Gem::Specification.new do |spec|
  spec.name = "gtfskit"
  spec.version = Gtfskit::VERSION
  spec.authors = ["julianfssen"]
  spec.email = ["julian@toadbits.com"]

  spec.summary = "Ruby library and binding for the General Transit Feed Specification (GTFS)"
  spec.description = "Ruby library and binding for the General Transit Feed Specification (GTFS)"
  spec.homepage = "https://github.com/toadbits/gtfskit"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 2.6.0"

  spec.metadata["allowed_push_host"] = "https://github.com"
  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/toadbits/gtfskit"
  spec.metadata["changelog_uri"] = "https://github.com/toadbits/gtfskit/blob/main/CHANGELOG.md"

  spec.files = Dir.chdir(__dir__) do
    `git ls-files -z`.split("\x0").reject do |f|
      (File.expand_path(f) == __FILE__) || f.start_with?(*%w[bin/ test/ spec/ features/ .git .circleci appveyor])
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "debug", "~> 1.9"
  spec.add_development_dependency "minitest", "~> 5.0"
  spec.add_development_dependency "rake", "~> 13.0"
end
