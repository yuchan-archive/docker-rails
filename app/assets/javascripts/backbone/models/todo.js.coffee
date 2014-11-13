class DockerRails.Models.Todo extends Backbone.Model
  paramRoot: 'todo'

  defaults:
    due: null
    task: null

class DockerRails.Collections.TodosCollection extends Backbone.Collection
  model: DockerRails.Models.Todo
  url: '/todos'
