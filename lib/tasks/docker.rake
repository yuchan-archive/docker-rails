namespace :docker do
    desc "Build Postgresql container"
    task :build_pg do
        sh "docker build  -t pg config/docker/pg"
    end

    desc "Run Postgresql container"
    task :run_pg do
        sh "docker run -d -p 5432:5432 --name pg pg"
    end

    desc "Build Rails application container"
    task :build_app do
        sh "docker build -t app ."
    end

    desc "Run Rails application container"
    task :run_app do
        sh "docker run -d -p 5000:8080 --link pg:db --name app app"
    end
end
