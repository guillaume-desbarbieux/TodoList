%rebase('base.tpl')

<div class="card shadow-sm">
  <div class="card-body">
    <h5 class="card-title mb-3">Add a new task to the ToDo list</h5>

    <form action="/new" method="post" class="needs-validation" novalidate>
      <div class="mb-3">
        <label for="task" class="form-label">Task description</label>
        <input
          type="text"
          class="form-control"
          id="task"
          name="task"
          maxlength="100"
          placeholder="Enter a new task..."
          required
        >
        <div class="invalid-feedback">
          Please provide a task description.
        </div>
      </div>

      <button type="submit" class="btn btn-success">💾 Save</button>
      <a href="/todo" class="btn btn-secondary">Cancel</a>
    </form>
  </div>
</div>