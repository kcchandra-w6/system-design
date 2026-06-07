CREATE TABLE t_chats (
	id BIGINT GENERATED ALWAYS AS IDENTITY NOT NULL,
	ticket_id varchar NOT NULL,
	conversation_id varchar NOT NULL,
	channel varchar NOT NULL,
	created_at timestamptz NOT NULL,
	created_by varchar NOT NULL,
	state varchar NOT NULL,
	updated_at timestamptz NOT NULL,
	handled_by varchar DEFAULT 'mobitech'::character varying NULL,
	CONSTRAINT t_chats_pk PRIMARY KEY (id),
	CONSTRAINT t_chats_ticket_conversation_un UNIQUE (ticket_id, conversation_id)
);

CREATE TABLE t_chat_logs (
	id int8 GENERATED ALWAYS AS IDENTITY NOT NULL,
	message varchar NULL,
	created_at timestamptz NOT NULL,
	created_by varchar NOT NULL,
	conversation_id varchar NULL,
	ticket_id varchar NULL,
	message_id varchar NULL,
	CONSTRAINT t_chat_logs_pk PRIMARY KEY (id)
);

CREATE TABLE t_chat_token_logs (
	id BIGINT GENERATED ALWAYS AS IDENTITY NOT NULL,
	ticket_id varchar NOT NULL,
	message_id varchar,
	n8n_execution_id varchar NOT NULL,
	workflow_id varchar NOT NULL,
	input_token INTEGER NOT NULL,
	output_token INTEGER NOT NULL,
	model_name varchar NOT NULL,
	created_at timestamptz NOT NULL,
	CONSTRAINT t_chat_token_logs_pk PRIMARY KEY (id)
);

CREATE TABLE t_error_logs (
	id serial4 NOT NULL,
	workflow_name varchar(255) NOT NULL,
	workflow_id varchar(100) NULL,
	identifier varchar(255) NULL,
	ticket_id varchar(100) NULL,
	failing_node varchar(255) NULL,
	error_message text NOT NULL,
	error_type varchar(100) NULL,
	n8n_execution_id varchar(100) NULL,
	n8n_url text NULL,
	severity varchar(50) DEFAULT 'error'::character varying NULL,
	status varchar(50) DEFAULT 'unresolved'::character varying NULL,
	resolved_by varchar(100) NULL,
	resolved_at timestamptz NULL,
	created_at timestamptz DEFAULT now() NULL,
	updated_at timestamptz DEFAULT now() NULL,
	CONSTRAINT t_error_logs_pkey PRIMARY KEY (id)
);
CREATE INDEX idx_error_logs_created_at ON t_error_logs USING btree (created_at DESC);
CREATE INDEX idx_error_logs_identifier ON t_error_logs USING btree (identifier);
CREATE INDEX idx_error_logs_status ON t_error_logs USING btree (status);
CREATE INDEX idx_error_logs_ticket_id ON t_error_logs USING btree (ticket_id);
CREATE INDEX idx_error_logs_workflow_name ON t_error_logs USING btree (workflow_name);
