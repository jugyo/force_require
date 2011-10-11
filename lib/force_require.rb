module Gem
  def self._all_partials(gemdir)
    Dir[File.join(gemdir, "gems/*")]
  end

  def self._all_load_paths
    result = []

    Gem.path.each do |gemdir|
      each_load_path _all_partials(gemdir) do |load_path|
        result << load_path
      end
    end

    result
  end
end

module Kernel
  def new_require(name)
    begin
      org_require name
    rescue LoadError
      if Thread.current[:force_require_mode]
        force_require name
      else
        raise
      end
    end
  end
  alias_method :org_require, :require
  alias_method :require, :new_require

  def force_require(name)
    Thread.current[:force_require_mode] = true
    Gem._all_load_paths.each do |dir|
      Dir[File.join(dir, "#{name}#{Gem.suffix_pattern}")].each do |file|
        require file
        return true
      end
    end
    raise LoadError, "no such file to load -- #{name}"
  ensure
    Thread.current[:force_require_mode] = false
  end
  alias_method :require!, :force_require
end