class MyClassesController < ApplicationController
  # GET /my_classes
  # GET /my_classes.xml
  autocomplete :student, :name

  def index
    @my_classes = MyClass.all
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @my_classes }
    end
  end

  # GET /my_classes/1
  # GET /my_classes/1.xml

  def add_subject
    #binding.pry
    @class=MyClass.find(params[:class])
    @class.subjects<< Subject.find(params[:subject])
    @class.save
    @location=request.env["HTTP_REFERER"]
    #redirect_to request.env["HTTP_REFERER"]    
  end


  def add_stud
      #binding.pry
       stud_ids=params[:student][:id]
       my_class=MyClass.find(params[:my_class])
       stud_ids.each do |i|
        student=Student.find(i)
        my_class.students<< student
        my_class.save
       end
       redirect_to :back
  end

  def add_student
    @class=MyClass.find(params[:class])
    @class.students<< Student.find(params[:student])
    @class.save
    @location=request.env["HTTP_REFERER"]
  end  

  def add_teacher
    #binding.pry
    @subject=Subject.find(params[:subject])
    @class=MyClass.find(params[:class])
    @teacher=Teacher.find(params[:teacher]) 
    @flag=0
    #@teacher.subjects.each do |s|      
      #if ((@class.subjects.map(&:name).include?(s.name)) rescue false)
        # @flag=1
         @classteacher=MyClassTeacher.new(:my_class_id=>params[:class],:teacher_id=>params[:teacher],:subjectname=>@subject.name)
         @classteacher.save        
        @location=request.env["HTTP_REFERER"]
       # break
      #end
   # end   
      # @class.teachers<< @teacher
      # @subject=Subject.find(params[:subject])
      # @subject.teacher = @teacher 
      # @subject.save
      # @class.save
      # @location=request.env["HTTP_REFERER"]
    # if @flag == 0
    #   data = {:message => "This Teacher doesnot having this subject"}
    #   render :json => data, :status => :ok
    # end  
  end   

  def remove_subject
    subject=Subject.find(params[:subject])
    myclass=MyClass.find(params[:myclass])
    subjects = myclass.subjects
    subjects.delete(subject)
    classteacher=MyClassTeacher.where(:subjectname=>subject.name) rescue nil  
    classteacher.each{|t| t.delete}
    redirect_to(:back)
  end

  def remove_teacher
     classteacher=MyClassTeacher.find(params[:classteacher])
     classteacher.delete
     redirect_to(:back)
  end  

  def remove_student
    @student=Student.find(params[:student])
    @student.update_attributes(:my_class_id=>nil) 
    redirect_to(:back)
  end    

  def show
    @my_class = MyClass.find(params[:id])
    @student=Student.find(5)
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @my_class }
    end
  end

  # GET /my_classes/new
  # GET /my_classes/new.xml
  def new
    @my_class = MyClass.new
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @my_class }
    end
  end

  # GET /my_classes/1/edit
  def edit
    @my_class = MyClass.find(params[:id])
  end

  # POST /my_classes
  # POST /my_classes.xml
  def create
    @my_class = MyClass.new(params[:my_class])

    respond_to do |format|
      if @my_class.save
        format.html { redirect_to(@my_class, :notice => 'My class was successfully created.') }
        format.xml  { render :xml => @my_class, :status => :created, :location => @my_class }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @my_class.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /my_classes/1
  # PUT /my_classes/1.xml
  def update
    @my_class = MyClass.find(params[:id])
    respond_to do |format|
      if @my_class.update_attributes(params[:my_class])
        format.html { redirect_to(@my_class, :notice => 'My class was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @my_class.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /my_classes/1
  # DELETE /my_classes/1.xml
  def destroy
    @my_class = MyClass.find(params[:id])
    @my_class.destroy
    respond_to do |format|
      format.html { redirect_to(my_classes_url) }
      format.xml  { head :ok }
    end
  end
end
