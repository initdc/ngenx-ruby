require_relative 'lib/ngenx/version'

Gem::Specification.new do |spec|
    spec.name          = "ngenx"
    spec.version       = Version::buildVer
    spec.authors       = ["initdc"]
    spec.email         = ["initd@outlook.com"]

    spec.summary       = %q{nginx configuration generate tool}
    spec.description   = %q{The nginx is most powerful web server ever before, this tool helps you generate nginx configuration.}
    spec.homepage      = "https://rubygems.org/gems/ngenx"
    spec.license       = "MIT"
    spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")

    # spec.metadata["allowed_push_host"] = "https://gem.fury.io/initdc"

    spec.metadata["homepage_uri"] = spec.homepage
    spec.metadata["source_code_uri"] = "https://github.com/initdc/ngenx"
    spec.metadata["changelog_uri"] = "https://github.com/initdc/ngenx/commits"

    spec.add_development_dependency 'colorize', '~> 0.8.1'
    spec.add_runtime_dependency     'colorize', '~> 0.8.1'
    # Specify which files should be added to the gem when it is released.
    # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
    spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
        `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
    end
    spec.bindir        = "exe"
    spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
    spec.require_paths = ["lib"]
end
