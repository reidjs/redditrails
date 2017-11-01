<% @post.comments.where(parent_comment_id: nil).each do |comment| %>
  <a href="<%= post_comment_url(@post) %>"><%= comment.body %><br>
  <% end %>
  <ul>
  <% comment.child_comments.each do |child|  %>
  <li><a href="<%= post_comment_url(@post, comment) %>"><%= child.body%></a></li>
  <% end %>
  </ul>
<% end %>
