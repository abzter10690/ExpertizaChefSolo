define :ruby_packages, action: :install do
  rv = params[:name].to_s
  fail 'A Ruby version such as 1.8, 1.9 or 1.9.1 must be given' if rv.empty?

  packages = [
    "ruby",
    "libopenssl-ruby#{rv}",
    ('libshadow-ruby1.8' if rv == '1.8')
  ].compact
  unless packages.nil?
    packages.each do |pkg|
      package pkg do
        action params[:action]
      end
    end
  end
end
