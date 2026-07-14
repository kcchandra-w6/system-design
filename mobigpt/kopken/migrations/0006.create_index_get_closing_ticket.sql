CREATE INDEX idx_t_chats_ticket_id_state_channel_handled_by ON t_chats(ticket_id, state, channel, handled_by) WHERE channel in ('whatsapp', 'instagram') AND handled_by = 'mobitech';
CREATE INDEX idx_t_chat_logs_ticket_id_created_at ON t_chat_logs (ticket_id, created_at DESC );
