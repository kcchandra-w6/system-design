ALTER TABLE t_chats ADD COLUMN deleted_at timestamptz NULL;
ALTER TABLE t_chats ADD COLUMN deleted_by varchar NULL;

ALTER TABLE t_chat_logs ADD COLUMN deleted_at timestamptz NULL;
ALTER TABLE t_chat_logs ADD COLUMN deleted_by varchar NULL;
