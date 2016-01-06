class PageController < ApplicationController
  def home
  end

  def about_us
  end

  def contact_us
    @submitted = params[:commit]
    @data = params[:name]
    @email = params[:email]
    @question = params[:question]
    @newsletter = params[:newsletter] == "on"
    @male = params[:gender] == "male"
    @female = params[:gender] == "female"
    @year = params[:select]
    if @email == ""
      @error_msg_email = "We need your email"
    end
    if @data == ""
      @error_msg_name = "We need your name"
    end
    #File.open('data.txt', 'w') { |file| file.write("Your name is: #{@data}\nYour email is: #{@email}")}
  end

  def products
  end

  def newsletter
  end

  def blog
  end

  def calendar
    @time = Time.now
    @year = params['year'].to_i
    @month = params['month'].to_i 

    unless @year > 0
      @year = @time.strftime('%Y').to_i
    end

    unless (@month.between?(1, 12))
      @month = @time.strftime('%m').to_i
    end
  end

  def articles
  end

  def login
  end
end
