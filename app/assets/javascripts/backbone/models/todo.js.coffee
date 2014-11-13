class DockerRails.Models.Todo extends Backbone.Model
  paramRoot: 'todo'

  defaults:
    due: null
    task: null

  initialize: () ->
    this.on "invalid", (model,error) ->
      alert(error);

  validate: (attrs, options) -> 
    if attrs.due == null || attrs.task == null
      return "due or task is empty!";

class DockerRails.Collections.TodosCollection extends Backbone.Collection
  model: DockerRails.Models.Todo
  url: '/todos'
