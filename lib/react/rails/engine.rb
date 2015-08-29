module React
  module Rails
    class Engine < ::Rails::Engine
      initializer "react_rails.setup_engine", :group => :all do |app|
        sprockets_env = app.assets || Sprockets # Totally not sure about the Sprockets 4.x way :(
        sprockets_env.register_mime_type 'text/jsx', extensions: ['.jsx', '.js.jsx']
        sprockets_env.register_transformer 'text/jsx', 'application/vnd.facebook.javascript+xml', React::JSX::Template
      end
    end
  end
end
