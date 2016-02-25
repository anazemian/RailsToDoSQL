class Todo <ActiveRecord::Base
  has_many(:comments)
end
#All these methods will be moved into a controller.
# Story: As a programmer, I can create a new ToDo record with title and description.
def createToDo title, description
  item = Todo.new
  item.title = title
  item.description = description
  item.save
end
# Story: As a programmer, I can list all ToDo records.
def allRecords
  todo=Todo.all
end
# Story: As a programmer, I can set a ToDo record to done given the ID of the record
def markDone(id)
  item = Todo.find(id)
  item.done = true
  item.save
end
# Story: As a programmer, I can list all the records that are done.
def allDone
  Todo.where("done = true")
end
# Story: As a programmer, I can list all the records that are not done.
def notDone
  Todo.where("done = false")
end
# Story: As a programmer, I can update the title and description of a ToDo record given the ID of the record.
#update title
def updateTitle(id, title)
  item = Todo.find(id)
  item.title = title
  item.save
end
#update description
def updateDescription(id, description)
  item = Todo.find(id)
  item.description = description
  item.save
end
# Story: As a programmer, I can destroy a ToDo record given the ID of the record.
def destroyRecord(id)
  item = Todo.find(id)
  item.destroy
end
# Story: As a programmer, I can set a ToDo record with a due date.
def addDueDate(id, date)
  item = Todo.find(id)
  item.duedate = date
  item.save
end
# Story: As a programmer, I can list all the records with a due date.
def listAllDue
  Todo.where("duedate is not null")
end
# Story: As a programmer, I can list all the records without a due date.
def listNotDue
  Todo.where("duedate is null")
end
# Story: As a programmer, I can add multiple commments to a ToDo record.
def addComment (id, comment)
  item = Comment.new
  item.comment = comment
  item.todo_id = id
  item.save
end
