CREATE TABLE public.users
(
    id bigint NOT NULL DEFAULT nextval('users_id_seq'::regclass),
    email character varying(255) COLLATE pg_catalog."default" NOT NULL,
    name character varying(255) COLLATE pg_catalog."default" NOT NULL,
    lastname character varying(255) COLLATE pg_catalog."default" NOT NULL,
    phone character varying(80) COLLATE pg_catalog."default" NOT NULL,
    image character varying(255) COLLATE pg_catalog."default",
    password character varying(255) COLLATE pg_catalog."default" NOT NULL,
    is_available boolean,
    session_token character varying COLLATE pg_catalog."default",
    create_at timestamp without time zone NOT NULL,
    update_at timestamp without time zone NOT NULL,
    CONSTRAINT users_pkey PRIMARY KEY (id),
    CONSTRAINT users_email_key UNIQUE (email),
    CONSTRAINT users_phone_key UNIQUE (phone)
)

TABLESPACE pg_default;

ALTER TABLE public.users
    OWNER to postgres;