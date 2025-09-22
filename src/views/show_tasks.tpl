%rebase('base.tpl')

<a href="/todo?show=open">Show open</a>
<a href="/todo?show=closed">Show closed</a>
<a href="/todo?show=all">Show all</a>
<h3>{{status}} items are as follows:</h3>
<table border="1">
%for row in rows:
  <tr>
      <td><a href={{"/edit/"+str(row[0])}}>Edit</a></td>
  %for col in row:
    <td>{{col}}</td>
  %end
  </tr>
%end
</table>
<a href="/new">Add a new task</a>