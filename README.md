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


					<div class="flex-grow-0 py-3 px-4 border-top" id="show_button">
						<div class="input-group">
							<% if  @room.host_id.present? && @room.host_id.to_i == current_user.id && @room.player_id.present?  %>
							   <% if @room.messages.present? %>
								   <%= render partial: 'rooms/show_button_form', locals: {room: @room, hide: false} unless @room.messages.last.action == 'show' %>  
								<% else %>
									<%= render partial: 'rooms/show_button_form' , locals: {room: @room, hide: false} %>
								<% end %>
							<% end %>
						</div>
					</div>