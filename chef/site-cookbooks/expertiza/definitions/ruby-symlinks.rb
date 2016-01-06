define :ruby_symlinks, action: :create, force: false, path: '/usr/bin' do
  rv = params[:name].to_s
  #rv = rv.slice(0..2).delete('.') if node[:platform] == 'gentoo'

  %w( ruby irb erb ri testrb rdoc gem rake ).each do |name|
    path = ::File.join(params[:path], name)
    scope = self

    link path do
      to path + rv
      action params[:action]

      unless params[:force]
        not_if do
          if ::File.exist?(path) && !::File.symlink?(path)
            scope.log "Not modifying non-symbolic-link #{path}"
            true
          end
        end
      end
    end
  end
end
