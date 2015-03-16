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
    @middle_count_comments = @count_comment.to_f/@count_article.to_f
    @tags = Tag.all
    File.open("./public/plain/plain.html", "w+") do |f|
      f.write("<html><head><meta charset=UTF-8><head><body><ul>")
      f << "<li>Всего авторов - #{@count_author} </li>"
      f << "<li> Всего статей - #{@count_article} </li>"
      f << "<li> Всего комментириев к статьям #{@count_comment} </li>"
      f << "<li> Самое большое число комментириев у статьи <a href='localhost:3000/article/#{@article_id}'>#{@article_name}</a> - #{@max_comments} </li>"
      f << "<li> Среднее количество комментириев у статей - #{@middle_count_comments.round} </li>"
      f << "<table><tr>"
      @tags.each do |t|
        f << "td"
        f << t.name
        f << "   "
        f << t.articles.count
        f << "</td>"
      end
      f << "</tr></table>"
      f.write("</ul></body></html>")
    end
  end
end