namespace :raketask do
  desc "recreate database"
  task :recreate do
       Rake::Task[ 'db:reset' ].execute
  end
  task :csv => :environment do
      require 'csv'
      CSV.open("mailer.csv", "w") do |csv|
        @authors = Author.all.uniq # your query here
        csv << ['name', 'email']  #column head of csv file
        @authors.each do |author|
        csv << [author.name, author.email] #fields name
      end
    end
  end
  desc "create a directory"
  task :check do
    puts "Enter the name of the destination directory: "
    @dir = STDIN.gets.strip  #Calling gets by itself would result in a call to "Kernel#gets" which is not what we want.
    if  File.directory?("../#{@dir}") #Checks whether the user requested directory exists and if not creates a new one.
      puts "The directory exists"
    else
      puts "Creating the requested directory..."
      mkdir "public/#{@dir}"
    end
  end
  desc "wrtite into file"
  task :plain => :environment do
    @count_author = Author.all.count
    @count_article = Article.all.count
    @count_comment = Comment.all.count
    @articles = Article.all
    @max_comments = Article.first.comments.count
    @articles.each do |a|
      if (a.comments.count > @max_comments)
        @max_comments = a.comments.count
        @article_name = a.title
        @article_id = a.id
      end
    end
    @middle_count_comments = @count_comment/@count_article
    @tags = Tag.all
    File.open("./public/plain/" + DateTime.now.strftime('%H:%M:%S') + ".html", "w+") do |f|
      f.write("<html><head><meta charset=UTF-8><link rel='stylesheet' href='https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css'><head><body><div class='container'<ul class='list-group'>")
      f << "<li class='list-group-item'> Авторы<span class='badge'>#{@count_author}</span> </li>"
      f << "<li class='list-group-item'> Статьи<span class='badge'> #{@count_article}</span> </li>"
      f << "<li class='list-group-item'> Комментарии<span class='badge'> #{@count_comment}</span> </li>"
      f << "<li class='list-group-item'> Самое большое число комментириев у статьи <a href='localhost:3000/article/#{@article_id}'>#{@article_name}</a> <span class='badge'>#{@max_comments}</span> </li>"
      f << "<li class='list-group-item'> Среднее количество комментириев у статей <span class='badge'> #{@middle_count_comments} </span></li>"
      f << "<br><h1>Таблица тегов</h1><br>"
      f << "<table class='table table-bordered'><tr><td>Тэги</td><td>Количество статей с данным тегом</td></tr>"
      @tags.each do |t|
        f << "<tr><td>"
        f << t.name
        f << "</td><td>"
        f << t.articles.count
        f << "</td></tr>"
      end
      f << "</table>"
      f.write("</ul></div></body></html>")
    end
  end
end