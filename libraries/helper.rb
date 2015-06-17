
class Chef
  class Recipe
    def set_document_root(path)
      template '/etc/httpd/conf/httpd.conf' do
        source node[:platform_version].to_i.to_s + '/httpd.conf.erb'
        mode 0644
        notifies :restart, 'service[httpd]'
        variables({
                      :document_root => path
                  })
      end
    end
  end
end
