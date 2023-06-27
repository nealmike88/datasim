-- Table: public.timeseries

-- DROP TABLE IF EXISTS public.timeseries;

CREATE UNLOGGED TABLE IF NOT EXISTS public.timeseries
(
    id integer NOT NULL DEFAULT nextval('timeseries_id_seq'::regclass),
    "timestamp" timestamp without time zone NOT NULL,
    sensor character varying(128) COLLATE pg_catalog."default" NOT NULL,
    value real NOT NULL,
    CONSTRAINT timeseries_pkey PRIMARY KEY (id)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.timeseries
    OWNER to michn;
-- Index: ix_timeseries_sensor

-- DROP INDEX IF EXISTS public.ix_timeseries_sensor;

CREATE INDEX IF NOT EXISTS ix_timeseries_sensor
    ON public.timeseries USING btree
    (sensor COLLATE pg_catalog."default" ASC NULLS LAST)
    TABLESPACE pg_default;
-- Index: ix_timeseries_timestamp

-- DROP INDEX IF EXISTS public.ix_timeseries_timestamp;

CREATE INDEX IF NOT EXISTS ix_timeseries_timestamp
    ON public.timeseries USING btree
    ("timestamp" ASC NULLS LAST)
    TABLESPACE pg_default;