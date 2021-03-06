require 'sinatra'
require_relative'./database.rb'

get '/' do
   redirect to '/students'
end

get '/students' do
    db = DBHandler.new
    @all_students = db.all
    @title = "All Students: "
    @message = "The table below displays all student information stored in the system."
    erb :application do
        erb :index
    end
end

get '/students/undergrad' do
    db = DBHandler.new
    @all_students = db.undergrad
    @title = "Currently Enrolled Students: "
    @message = "The table below displays information of all currently enrolled students."
    erb :application do
        erb :index
    end
end

get '/students/graduated' do
    db = DBHandler.new
    @all_students = db.graduated
    @title = "Graduated Students: "
    @message = "The table below displays information of students who have graduated."
    erb :application do
        erb :index
    end
end


post '/students' do
   db = DBHandler.new
   db.create(params[:firstname], params[:lastname], params[:email], params[:major], params[:graduated])
   redirect to '/students'
end

get '/students/new' do
   erb :application do
      erb :new 
   end
end

get '/students/:id' do
   id = params[:id].to_i
   db = DBHandler.new
   @student = db.get(id)
   erb :application do
      erb :show 
   end
end



get '/students/:id' do
   id = params[:id].to_i
   db = DBHandler.new
   @student = db.get(id)
   erb :application do
      erb :show 
   end
end

get '/students/:id/edit' do
   id = params[:id].to_i
   db = DBHandler.new
   @student = db.get(id)
   erb :application do
      erb :edit 
   end
end

patch '/students/:id' do
   id = params[:id].to_i
   db = DBHandler.new
   db.update(id, params[:firstname], params[:lastname], params[:email], params[:major], params[:graduated])
   redirect to '/students'
end

get '/students/:id/delete' do
   id = params[:id].to_i
   db = DBHandler.new
   db.destroy(id)
   redirect to '/students'
end