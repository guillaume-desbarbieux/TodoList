%rebase('base.tpl')

<div class="card shadow-sm">
  <div class="card-body">
    <h5 class="card-title mb-3">Edit Task #{{number}}</h5>

    <form action="/edit/{{number}}" method="post" class="needs-validation" novalidate>
      <div class="mb-3">
        <label for="task" class="form-label">Task description</label>
        <input type="text" class="form-control" id="task" name="task" value="{{current_data[0]}}" maxlength="100" required>
        <div class="invalid-feedback">
          Please provide a task description.
        </div>
      </div>

      <div class="mb-3">
        <label for="status" class="form-label">Status</label>
        <select class="form-select" id="status" name="status" required>
          <option value="open" {{ 'selected' if current_data[1] == 'open' else '' }}>Open</option>
          <option value="closed" {{ 'selected' if current_data[1] == 'closed' else '' }}>Closed</option>
        </select>
        <div class="invalid-feedback">
          Please select a status.
        </div>
      </div>

      <button type="submit" class="btn btn-primary">💾 Save changes</button>
      <a href="/todo" class="btn btn-secondary">Cancel</a>
    </form>
  </div>
</div>