%rebase('base.tpl')
<h1 class="mb-3"> Todolist de Guillaume, enfin !!?<h1>

<div class="d-flex gap-2 mb-3">
  <a href="/todo?show=open" class="btn btn-success">Show open</a>
  <a href="/todo?show=closed" class="btn btn-secondary">Show closed</a>
  <a href="/todo?show=all" class="btn btn-primary">Show all</a>
  <a href="/new" class="btn btn-success ms-auto">➕ Add a new task</a>
</div>

<h3 class="mb-3 text-capitalize">{{status}} items</h3>

<table class="table table-striped table-hover align-middle">
  <thead class="table-dark">
    <tr>
      <th scope="col">Action</th>
      <th scope="col">ID</th>
      <th scope="col">Tasks</th>
    </tr>
  </thead>
  <tbody>
  %for row in rows:
    <tr>
      <td>
        <a href="{{'/edit/' + str(row[0])}}" class="btn btn-sm btn-warning">Edit</a>
      </td>
      <td>{{row[0]}}</td>
      <td>{{row[1]}}</td>
    </tr>
  %end
  </tbody>
</table>