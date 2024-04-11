# Base image:
    FROM ruby:3.3.0

    # Install dependencies
    RUN apt-get update -qq && apt-get install -y nodejs postgresql-client
    
    # Set an environment variable where the Rails app is installed to inside of Docker image
    ENV RAILS_ENV production
    ENV RAILS_ROOT /var/www/myapp
    RUN mkdir -p $RAILS_ROOT 
    
    # Set working directory
    WORKDIR $RAILS_ROOT
    
    # Adding gems
    COPY Gemfile Gemfile
    RUN bundle install --jobs 20 --retry 5 
    
    # Adding project files
    COPY . .
    
    # Expose port 3000 to the Docker host, so we can access it from the outside
    EXPOSE 3000
    
    # The main command to run when the container starts. Also tell the Rails dev server to bind to all interfaces by default.
    CMD ["bundle", "exec", "rails", "server", "-b", "0.0.0.0"]
