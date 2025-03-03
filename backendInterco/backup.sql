--
-- PostgreSQL database dump
--

-- Dumped from database version 12.22 (Debian 12.22-1.pgdg120+1)
-- Dumped by pg_dump version 12.22 (Debian 12.22-1.pgdg120+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: uuid-ossp; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS "uuid-ossp" WITH SCHEMA public;


--
-- Name: EXTENSION "uuid-ossp"; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION "uuid-ossp" IS 'generate universally unique identifiers (UUIDs)';


--
-- Name: pages_iblock_fields_label_lang_enum; Type: TYPE; Schema: public; Owner: postgress
--

CREATE TYPE public.pages_iblock_fields_label_lang_enum AS ENUM (
    'ru-RU',
    'en-US',
    'zh-CN'
);


ALTER TYPE public.pages_iblock_fields_label_lang_enum OWNER TO postgress;

--
-- Name: pages_iblock_fields_type_enum; Type: TYPE; Schema: public; Owner: postgress
--

CREATE TYPE public.pages_iblock_fields_type_enum AS ENUM (
    'text',
    'array',
    'image',
    'editor'
);


ALTER TYPE public.pages_iblock_fields_type_enum OWNER TO postgress;

--
-- Name: pages_iblock_records_field_value_lang_enum; Type: TYPE; Schema: public; Owner: postgress
--

CREATE TYPE public.pages_iblock_records_field_value_lang_enum AS ENUM (
    'ru-RU',
    'en-US',
    'zh-CN'
);


ALTER TYPE public.pages_iblock_records_field_value_lang_enum OWNER TO postgress;

--
-- Name: pages_iblock_section_value_lang_enum; Type: TYPE; Schema: public; Owner: postgress
--

CREATE TYPE public.pages_iblock_section_value_lang_enum AS ENUM (
    'ru-RU',
    'en-US',
    'zh-CN'
);


ALTER TYPE public.pages_iblock_section_value_lang_enum OWNER TO postgress;

--
-- Name: pages_params_field_value_lang_enum; Type: TYPE; Schema: public; Owner: postgress
--

CREATE TYPE public.pages_params_field_value_lang_enum AS ENUM (
    'ru-RU',
    'en-US',
    'zh-CN'
);


ALTER TYPE public.pages_params_field_value_lang_enum OWNER TO postgress;

--
-- Name: pages_sections_description_value_lang_enum; Type: TYPE; Schema: public; Owner: postgress
--

CREATE TYPE public.pages_sections_description_value_lang_enum AS ENUM (
    'ru-RU',
    'en-US',
    'zh-CN'
);


ALTER TYPE public.pages_sections_description_value_lang_enum OWNER TO postgress;

--
-- Name: pages_sections_title_value_lang_enum; Type: TYPE; Schema: public; Owner: postgress
--

CREATE TYPE public.pages_sections_title_value_lang_enum AS ENUM (
    'ru-RU',
    'en-US',
    'zh-CN'
);


ALTER TYPE public.pages_sections_title_value_lang_enum OWNER TO postgress;

--
-- Name: pages_seo_params_fieldtype_enum; Type: TYPE; Schema: public; Owner: postgress
--

CREATE TYPE public.pages_seo_params_fieldtype_enum AS ENUM (
    'title',
    'description',
    'keywords'
);


ALTER TYPE public.pages_seo_params_fieldtype_enum OWNER TO postgress;

--
-- Name: pages_seo_params_lang_enum; Type: TYPE; Schema: public; Owner: postgress
--

CREATE TYPE public.pages_seo_params_lang_enum AS ENUM (
    'ru-RU',
    'en-US',
    'zh-CN'
);


ALTER TYPE public.pages_seo_params_lang_enum OWNER TO postgress;

--
-- Name: records_description_value_lang_enum; Type: TYPE; Schema: public; Owner: postgress
--

CREATE TYPE public.records_description_value_lang_enum AS ENUM (
    'ru-RU',
    'en-US',
    'zh-CN'
);


ALTER TYPE public.records_description_value_lang_enum OWNER TO postgress;

--
-- Name: records_seo_params_fieldtype_enum; Type: TYPE; Schema: public; Owner: postgress
--

CREATE TYPE public.records_seo_params_fieldtype_enum AS ENUM (
    'title',
    'description',
    'keywords'
);


ALTER TYPE public.records_seo_params_fieldtype_enum OWNER TO postgress;

--
-- Name: records_seo_params_lang_enum; Type: TYPE; Schema: public; Owner: postgress
--

CREATE TYPE public.records_seo_params_lang_enum AS ENUM (
    'ru-RU',
    'en-US',
    'zh-CN'
);


ALTER TYPE public.records_seo_params_lang_enum OWNER TO postgress;

--
-- Name: records_title_value_lang_enum; Type: TYPE; Schema: public; Owner: postgress
--

CREATE TYPE public.records_title_value_lang_enum AS ENUM (
    'ru-RU',
    'en-US',
    'zh-CN'
);


ALTER TYPE public.records_title_value_lang_enum OWNER TO postgress;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: amo_custom_fields; Type: TABLE; Schema: public; Owner: postgress
--

CREATE TABLE public.amo_custom_fields (
    id integer NOT NULL,
    "createdAt" timestamp without time zone DEFAULT '2025-02-25 18:46:18.553'::timestamp without time zone NOT NULL,
    "updatedAt" timestamp without time zone DEFAULT '2025-02-25 18:46:18.553'::timestamp without time zone NOT NULL,
    "deletedAt" timestamp without time zone,
    "amoID" integer,
    attribute character varying DEFAULT 'title'::character varying NOT NULL
);


ALTER TABLE public.amo_custom_fields OWNER TO postgress;

--
-- Name: amo_custom_fields_id_seq; Type: SEQUENCE; Schema: public; Owner: postgress
--

CREATE SEQUENCE public.amo_custom_fields_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.amo_custom_fields_id_seq OWNER TO postgress;

--
-- Name: amo_custom_fields_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgress
--

ALTER SEQUENCE public.amo_custom_fields_id_seq OWNED BY public.amo_custom_fields.id;


--
-- Name: auth-confirm; Type: TABLE; Schema: public; Owner: postgress
--

CREATE TABLE public."auth-confirm" (
    id integer NOT NULL,
    "createdAt" timestamp without time zone DEFAULT '2025-02-25 18:46:18.553'::timestamp without time zone NOT NULL,
    "updatedAt" timestamp without time zone DEFAULT '2025-02-25 18:46:18.553'::timestamp without time zone NOT NULL,
    "deletedAt" timestamp without time zone,
    uuid uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    "isActive" boolean DEFAULT true NOT NULL,
    type character varying NOT NULL,
    "userId" integer
);


ALTER TABLE public."auth-confirm" OWNER TO postgress;

--
-- Name: auth-confirm_id_seq; Type: SEQUENCE; Schema: public; Owner: postgress
--

CREATE SEQUENCE public."auth-confirm_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."auth-confirm_id_seq" OWNER TO postgress;

--
-- Name: auth-confirm_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgress
--

ALTER SEQUENCE public."auth-confirm_id_seq" OWNED BY public."auth-confirm".id;


--
-- Name: callback; Type: TABLE; Schema: public; Owner: postgress
--

CREATE TABLE public.callback (
    id integer NOT NULL,
    "createdAt" timestamp without time zone DEFAULT '2025-02-25 18:46:18.553'::timestamp without time zone NOT NULL,
    "updatedAt" timestamp without time zone DEFAULT '2025-02-25 18:46:18.553'::timestamp without time zone NOT NULL,
    "deletedAt" timestamp without time zone,
    name character varying(1024) NOT NULL,
    slug character varying(1024) NOT NULL,
    "syncBitrix" boolean DEFAULT false NOT NULL,
    "syncAmo" boolean DEFAULT false NOT NULL,
    email character varying(1024)
);


ALTER TABLE public.callback OWNER TO postgress;

--
-- Name: callback_field; Type: TABLE; Schema: public; Owner: postgress
--

CREATE TABLE public.callback_field (
    id integer NOT NULL,
    "createdAt" timestamp without time zone DEFAULT '2025-02-25 18:46:18.553'::timestamp without time zone NOT NULL,
    "updatedAt" timestamp without time zone DEFAULT '2025-02-25 18:46:18.553'::timestamp without time zone NOT NULL,
    "deletedAt" timestamp without time zone,
    name character varying(1024) NOT NULL,
    type character varying DEFAULT 'string'::character varying NOT NULL,
    attribute character varying DEFAULT 'title'::character varying NOT NULL,
    "isRequred" boolean DEFAULT false NOT NULL,
    "callbackId" integer
);


ALTER TABLE public.callback_field OWNER TO postgress;

--
-- Name: callback_field_id_seq; Type: SEQUENCE; Schema: public; Owner: postgress
--

CREATE SEQUENCE public.callback_field_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.callback_field_id_seq OWNER TO postgress;

--
-- Name: callback_field_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgress
--

ALTER SEQUENCE public.callback_field_id_seq OWNED BY public.callback_field.id;


--
-- Name: callback_id_seq; Type: SEQUENCE; Schema: public; Owner: postgress
--

CREATE SEQUENCE public.callback_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.callback_id_seq OWNER TO postgress;

--
-- Name: callback_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgress
--

ALTER SEQUENCE public.callback_id_seq OWNED BY public.callback.id;


--
-- Name: callback_instances; Type: TABLE; Schema: public; Owner: postgress
--

CREATE TABLE public.callback_instances (
    id integer NOT NULL,
    "createdAt" timestamp without time zone DEFAULT '2025-02-25 18:46:18.553'::timestamp without time zone NOT NULL,
    "updatedAt" timestamp without time zone DEFAULT '2025-02-25 18:46:18.553'::timestamp without time zone NOT NULL,
    "deletedAt" timestamp without time zone,
    "callbackId" integer
);


ALTER TABLE public.callback_instances OWNER TO postgress;

--
-- Name: callback_instances_id_seq; Type: SEQUENCE; Schema: public; Owner: postgress
--

CREATE SEQUENCE public.callback_instances_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.callback_instances_id_seq OWNER TO postgress;

--
-- Name: callback_instances_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgress
--

ALTER SEQUENCE public.callback_instances_id_seq OWNED BY public.callback_instances.id;


--
-- Name: callback_instances_value; Type: TABLE; Schema: public; Owner: postgress
--

CREATE TABLE public.callback_instances_value (
    id integer NOT NULL,
    "createdAt" timestamp without time zone DEFAULT '2025-02-25 18:46:18.553'::timestamp without time zone NOT NULL,
    "updatedAt" timestamp without time zone DEFAULT '2025-02-25 18:46:18.553'::timestamp without time zone NOT NULL,
    "deletedAt" timestamp without time zone,
    value character varying DEFAULT ''::character varying,
    "instanceId" integer,
    "fieldId" integer
);


ALTER TABLE public.callback_instances_value OWNER TO postgress;

--
-- Name: callback_instances_value_id_seq; Type: SEQUENCE; Schema: public; Owner: postgress
--

CREATE SEQUENCE public.callback_instances_value_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.callback_instances_value_id_seq OWNER TO postgress;

--
-- Name: callback_instances_value_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgress
--

ALTER SEQUENCE public.callback_instances_value_id_seq OWNED BY public.callback_instances_value.id;


--
-- Name: library_files; Type: TABLE; Schema: public; Owner: postgress
--

CREATE TABLE public.library_files (
    id integer NOT NULL,
    "createdAt" timestamp without time zone DEFAULT '2025-02-25 18:46:18.553'::timestamp without time zone NOT NULL,
    "updatedAt" timestamp without time zone DEFAULT '2025-02-25 18:46:18.553'::timestamp without time zone NOT NULL,
    "deletedAt" timestamp without time zone,
    path character varying,
    type character varying DEFAULT 'file'::character varying NOT NULL,
    name character varying,
    filename character varying,
    size integer,
    "isSystem" boolean DEFAULT false NOT NULL,
    "parentId" integer
);


ALTER TABLE public.library_files OWNER TO postgress;

--
-- Name: COLUMN library_files.path; Type: COMMENT; Schema: public; Owner: postgress
--

COMMENT ON COLUMN public.library_files.path IS 'Путь к файлу';


--
-- Name: COLUMN library_files.type; Type: COMMENT; Schema: public; Owner: postgress
--

COMMENT ON COLUMN public.library_files.type IS 'Тип файла';


--
-- Name: COLUMN library_files.name; Type: COMMENT; Schema: public; Owner: postgress
--

COMMENT ON COLUMN public.library_files.name IS 'Название файла или директории';


--
-- Name: COLUMN library_files.filename; Type: COMMENT; Schema: public; Owner: postgress
--

COMMENT ON COLUMN public.library_files.filename IS 'Название в облаке';


--
-- Name: COLUMN library_files.size; Type: COMMENT; Schema: public; Owner: postgress
--

COMMENT ON COLUMN public.library_files.size IS 'Размер файла';


--
-- Name: COLUMN library_files."isSystem"; Type: COMMENT; Schema: public; Owner: postgress
--

COMMENT ON COLUMN public.library_files."isSystem" IS 'Системная директория';


--
-- Name: library_files_id_seq; Type: SEQUENCE; Schema: public; Owner: postgress
--

CREATE SEQUENCE public.library_files_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.library_files_id_seq OWNER TO postgress;

--
-- Name: library_files_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgress
--

ALTER SEQUENCE public.library_files_id_seq OWNED BY public.library_files.id;


--
-- Name: migrations; Type: TABLE; Schema: public; Owner: postgress
--

CREATE TABLE public.migrations (
    id integer NOT NULL,
    "timestamp" bigint NOT NULL,
    name character varying NOT NULL
);


ALTER TABLE public.migrations OWNER TO postgress;

--
-- Name: migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgress
--

CREATE SEQUENCE public.migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.migrations_id_seq OWNER TO postgress;

--
-- Name: migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgress
--

ALTER SEQUENCE public.migrations_id_seq OWNED BY public.migrations.id;


--
-- Name: pages; Type: TABLE; Schema: public; Owner: postgress
--

CREATE TABLE public.pages (
    id integer NOT NULL,
    "createdAt" timestamp without time zone DEFAULT '2025-02-25 18:46:18.553'::timestamp without time zone NOT NULL,
    "updatedAt" timestamp without time zone DEFAULT '2025-02-25 18:46:18.553'::timestamp without time zone NOT NULL,
    "deletedAt" timestamp without time zone,
    name character varying(1024) NOT NULL,
    description character varying,
    slug character varying,
    type character varying DEFAULT 'Landing'::character varying NOT NULL,
    "pagePath" json,
    "seoId" integer
);


ALTER TABLE public.pages OWNER TO postgress;

--
-- Name: pages-comments; Type: TABLE; Schema: public; Owner: postgress
--

CREATE TABLE public."pages-comments" (
    id integer NOT NULL,
    "createdAt" timestamp without time zone DEFAULT '2025-02-25 18:46:18.553'::timestamp without time zone NOT NULL,
    "updatedAt" timestamp without time zone DEFAULT '2025-02-25 18:46:18.553'::timestamp without time zone NOT NULL,
    "deletedAt" timestamp without time zone,
    content character varying,
    status character varying DEFAULT 'verify'::character varying NOT NULL,
    level integer NOT NULL,
    "recordsId" integer,
    "userId" integer,
    "parentId" integer
);


ALTER TABLE public."pages-comments" OWNER TO postgress;

--
-- Name: pages-comments_id_seq; Type: SEQUENCE; Schema: public; Owner: postgress
--

CREATE SEQUENCE public."pages-comments_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."pages-comments_id_seq" OWNER TO postgress;

--
-- Name: pages-comments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgress
--

ALTER SEQUENCE public."pages-comments_id_seq" OWNED BY public."pages-comments".id;


--
-- Name: pages-components; Type: TABLE; Schema: public; Owner: postgress
--

CREATE TABLE public."pages-components" (
    id integer NOT NULL,
    "createdAt" timestamp without time zone DEFAULT '2025-02-25 18:46:18.553'::timestamp without time zone NOT NULL,
    "updatedAt" timestamp without time zone DEFAULT '2025-02-25 18:46:18.553'::timestamp without time zone NOT NULL,
    "deletedAt" timestamp without time zone,
    "order" integer DEFAULT 0 NOT NULL,
    name character varying(1024) NOT NULL,
    content json,
    "pagesId" integer
);


ALTER TABLE public."pages-components" OWNER TO postgress;

--
-- Name: pages-components_id_seq; Type: SEQUENCE; Schema: public; Owner: postgress
--

CREATE SEQUENCE public."pages-components_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."pages-components_id_seq" OWNER TO postgress;

--
-- Name: pages-components_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgress
--

ALTER SEQUENCE public."pages-components_id_seq" OWNED BY public."pages-components".id;


--
-- Name: pages_iblock; Type: TABLE; Schema: public; Owner: postgress
--

CREATE TABLE public.pages_iblock (
    id integer NOT NULL,
    "createdAt" timestamp without time zone DEFAULT '2025-02-25 18:46:18.553'::timestamp without time zone NOT NULL,
    "updatedAt" timestamp without time zone DEFAULT '2025-02-25 18:46:18.553'::timestamp without time zone NOT NULL,
    "deletedAt" timestamp without time zone,
    name character varying(1024) NOT NULL,
    slug character varying(1024) NOT NULL,
    attributes json,
    "pageId" integer
);


ALTER TABLE public.pages_iblock OWNER TO postgress;

--
-- Name: pages_iblock_fields; Type: TABLE; Schema: public; Owner: postgress
--

CREATE TABLE public.pages_iblock_fields (
    id integer NOT NULL,
    "createdAt" timestamp without time zone DEFAULT '2025-02-25 18:46:18.553'::timestamp without time zone NOT NULL,
    "updatedAt" timestamp without time zone DEFAULT '2025-02-25 18:46:18.553'::timestamp without time zone NOT NULL,
    "deletedAt" timestamp without time zone,
    name character varying(1024) NOT NULL,
    slug character varying(1024) NOT NULL,
    type public.pages_iblock_fields_type_enum NOT NULL,
    "iblockId" integer
);


ALTER TABLE public.pages_iblock_fields OWNER TO postgress;

--
-- Name: pages_iblock_fields_id_seq; Type: SEQUENCE; Schema: public; Owner: postgress
--

CREATE SEQUENCE public.pages_iblock_fields_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.pages_iblock_fields_id_seq OWNER TO postgress;

--
-- Name: pages_iblock_fields_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgress
--

ALTER SEQUENCE public.pages_iblock_fields_id_seq OWNED BY public.pages_iblock_fields.id;


--
-- Name: pages_iblock_fields_label; Type: TABLE; Schema: public; Owner: postgress
--

CREATE TABLE public.pages_iblock_fields_label (
    id integer NOT NULL,
    "createdAt" timestamp without time zone DEFAULT '2025-02-25 18:46:18.553'::timestamp without time zone NOT NULL,
    "updatedAt" timestamp without time zone DEFAULT '2025-02-25 18:46:18.553'::timestamp without time zone NOT NULL,
    "deletedAt" timestamp without time zone,
    value character varying NOT NULL,
    lang public.pages_iblock_fields_label_lang_enum NOT NULL,
    "fieldId" integer
);


ALTER TABLE public.pages_iblock_fields_label OWNER TO postgress;

--
-- Name: pages_iblock_fields_label_id_seq; Type: SEQUENCE; Schema: public; Owner: postgress
--

CREATE SEQUENCE public.pages_iblock_fields_label_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.pages_iblock_fields_label_id_seq OWNER TO postgress;

--
-- Name: pages_iblock_fields_label_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgress
--

ALTER SEQUENCE public.pages_iblock_fields_label_id_seq OWNED BY public.pages_iblock_fields_label.id;


--
-- Name: pages_iblock_id_seq; Type: SEQUENCE; Schema: public; Owner: postgress
--

CREATE SEQUENCE public.pages_iblock_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.pages_iblock_id_seq OWNER TO postgress;

--
-- Name: pages_iblock_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgress
--

ALTER SEQUENCE public.pages_iblock_id_seq OWNED BY public.pages_iblock.id;


--
-- Name: pages_iblock_records; Type: TABLE; Schema: public; Owner: postgress
--

CREATE TABLE public.pages_iblock_records (
    id integer NOT NULL,
    "createdAt" timestamp without time zone DEFAULT '2025-02-25 18:46:18.553'::timestamp without time zone NOT NULL,
    "updatedAt" timestamp without time zone DEFAULT '2025-02-25 18:46:18.553'::timestamp without time zone NOT NULL,
    "deletedAt" timestamp without time zone,
    sort integer DEFAULT 0,
    "iblockId" integer
);


ALTER TABLE public.pages_iblock_records OWNER TO postgress;

--
-- Name: pages_iblock_records_field; Type: TABLE; Schema: public; Owner: postgress
--

CREATE TABLE public.pages_iblock_records_field (
    id integer NOT NULL,
    "createdAt" timestamp without time zone DEFAULT '2025-02-25 18:46:18.553'::timestamp without time zone NOT NULL,
    "updatedAt" timestamp without time zone DEFAULT '2025-02-25 18:46:18.553'::timestamp without time zone NOT NULL,
    "deletedAt" timestamp without time zone,
    "recordId" integer,
    "fieldId" integer
);


ALTER TABLE public.pages_iblock_records_field OWNER TO postgress;

--
-- Name: pages_iblock_records_field_id_seq; Type: SEQUENCE; Schema: public; Owner: postgress
--

CREATE SEQUENCE public.pages_iblock_records_field_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.pages_iblock_records_field_id_seq OWNER TO postgress;

--
-- Name: pages_iblock_records_field_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgress
--

ALTER SEQUENCE public.pages_iblock_records_field_id_seq OWNED BY public.pages_iblock_records_field.id;


--
-- Name: pages_iblock_records_field_value; Type: TABLE; Schema: public; Owner: postgress
--

CREATE TABLE public.pages_iblock_records_field_value (
    id integer NOT NULL,
    "createdAt" timestamp without time zone DEFAULT '2025-02-25 18:46:18.553'::timestamp without time zone NOT NULL,
    "updatedAt" timestamp without time zone DEFAULT '2025-02-25 18:46:18.553'::timestamp without time zone NOT NULL,
    "deletedAt" timestamp without time zone,
    value character varying NOT NULL,
    lang public.pages_iblock_records_field_value_lang_enum NOT NULL,
    "recordFieldId" integer
);


ALTER TABLE public.pages_iblock_records_field_value OWNER TO postgress;

--
-- Name: pages_iblock_records_field_value_id_seq; Type: SEQUENCE; Schema: public; Owner: postgress
--

CREATE SEQUENCE public.pages_iblock_records_field_value_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.pages_iblock_records_field_value_id_seq OWNER TO postgress;

--
-- Name: pages_iblock_records_field_value_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgress
--

ALTER SEQUENCE public.pages_iblock_records_field_value_id_seq OWNED BY public.pages_iblock_records_field_value.id;


--
-- Name: pages_iblock_records_id_seq; Type: SEQUENCE; Schema: public; Owner: postgress
--

CREATE SEQUENCE public.pages_iblock_records_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.pages_iblock_records_id_seq OWNER TO postgress;

--
-- Name: pages_iblock_records_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgress
--

ALTER SEQUENCE public.pages_iblock_records_id_seq OWNED BY public.pages_iblock_records.id;


--
-- Name: pages_iblock_records_sections_pages_iblock_section; Type: TABLE; Schema: public; Owner: postgress
--

CREATE TABLE public.pages_iblock_records_sections_pages_iblock_section (
    "pagesIblockRecordsId" integer NOT NULL,
    "pagesIblockSectionId" integer NOT NULL
);


ALTER TABLE public.pages_iblock_records_sections_pages_iblock_section OWNER TO postgress;

--
-- Name: pages_iblock_section; Type: TABLE; Schema: public; Owner: postgress
--

CREATE TABLE public.pages_iblock_section (
    id integer NOT NULL,
    "createdAt" timestamp without time zone DEFAULT '2025-02-25 18:46:18.553'::timestamp without time zone NOT NULL,
    "updatedAt" timestamp without time zone DEFAULT '2025-02-25 18:46:18.553'::timestamp without time zone NOT NULL,
    "deletedAt" timestamp without time zone,
    "iblockId" integer
);


ALTER TABLE public.pages_iblock_section OWNER TO postgress;

--
-- Name: pages_iblock_section_id_seq; Type: SEQUENCE; Schema: public; Owner: postgress
--

CREATE SEQUENCE public.pages_iblock_section_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.pages_iblock_section_id_seq OWNER TO postgress;

--
-- Name: pages_iblock_section_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgress
--

ALTER SEQUENCE public.pages_iblock_section_id_seq OWNED BY public.pages_iblock_section.id;


--
-- Name: pages_iblock_section_value; Type: TABLE; Schema: public; Owner: postgress
--

CREATE TABLE public.pages_iblock_section_value (
    id integer NOT NULL,
    "createdAt" timestamp without time zone DEFAULT '2025-02-25 18:46:18.553'::timestamp without time zone NOT NULL,
    "updatedAt" timestamp without time zone DEFAULT '2025-02-25 18:46:18.553'::timestamp without time zone NOT NULL,
    "deletedAt" timestamp without time zone,
    value character varying NOT NULL,
    lang public.pages_iblock_section_value_lang_enum NOT NULL,
    "sectionId" integer
);


ALTER TABLE public.pages_iblock_section_value OWNER TO postgress;

--
-- Name: pages_iblock_section_value_id_seq; Type: SEQUENCE; Schema: public; Owner: postgress
--

CREATE SEQUENCE public.pages_iblock_section_value_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.pages_iblock_section_value_id_seq OWNER TO postgress;

--
-- Name: pages_iblock_section_value_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgress
--

ALTER SEQUENCE public.pages_iblock_section_value_id_seq OWNED BY public.pages_iblock_section_value.id;


--
-- Name: pages_id_seq; Type: SEQUENCE; Schema: public; Owner: postgress
--

CREATE SEQUENCE public.pages_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.pages_id_seq OWNER TO postgress;

--
-- Name: pages_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgress
--

ALTER SEQUENCE public.pages_id_seq OWNED BY public.pages.id;


--
-- Name: pages_params; Type: TABLE; Schema: public; Owner: postgress
--

CREATE TABLE public.pages_params (
    id integer NOT NULL,
    "createdAt" timestamp without time zone DEFAULT '2025-02-25 18:46:18.553'::timestamp without time zone NOT NULL,
    "updatedAt" timestamp without time zone DEFAULT '2025-02-25 18:46:18.553'::timestamp without time zone NOT NULL,
    "deletedAt" timestamp without time zone,
    name character varying(1024) NOT NULL,
    slug character varying(1024) NOT NULL,
    type character varying DEFAULT 'text'::character varying NOT NULL,
    "isFilter" boolean DEFAULT false NOT NULL,
    "pagesId" integer
);


ALTER TABLE public.pages_params OWNER TO postgress;

--
-- Name: pages_params_field; Type: TABLE; Schema: public; Owner: postgress
--

CREATE TABLE public.pages_params_field (
    id integer NOT NULL,
    "createdAt" timestamp without time zone DEFAULT '2025-02-25 18:46:18.553'::timestamp without time zone NOT NULL,
    "updatedAt" timestamp without time zone DEFAULT '2025-02-25 18:46:18.553'::timestamp without time zone NOT NULL,
    "deletedAt" timestamp without time zone,
    "paramsId" integer,
    "recordId" integer
);


ALTER TABLE public.pages_params_field OWNER TO postgress;

--
-- Name: pages_params_field_id_seq; Type: SEQUENCE; Schema: public; Owner: postgress
--

CREATE SEQUENCE public.pages_params_field_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.pages_params_field_id_seq OWNER TO postgress;

--
-- Name: pages_params_field_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgress
--

ALTER SEQUENCE public.pages_params_field_id_seq OWNED BY public.pages_params_field.id;


--
-- Name: pages_params_field_value; Type: TABLE; Schema: public; Owner: postgress
--

CREATE TABLE public.pages_params_field_value (
    id integer NOT NULL,
    "createdAt" timestamp without time zone DEFAULT '2025-02-25 18:46:18.553'::timestamp without time zone NOT NULL,
    "updatedAt" timestamp without time zone DEFAULT '2025-02-25 18:46:18.553'::timestamp without time zone NOT NULL,
    "deletedAt" timestamp without time zone,
    value character varying NOT NULL,
    lang public.pages_params_field_value_lang_enum NOT NULL,
    "pagesParamsFieldId" integer
);


ALTER TABLE public.pages_params_field_value OWNER TO postgress;

--
-- Name: pages_params_field_value_id_seq; Type: SEQUENCE; Schema: public; Owner: postgress
--

CREATE SEQUENCE public.pages_params_field_value_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.pages_params_field_value_id_seq OWNER TO postgress;

--
-- Name: pages_params_field_value_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgress
--

ALTER SEQUENCE public.pages_params_field_value_id_seq OWNED BY public.pages_params_field_value.id;


--
-- Name: pages_params_id_seq; Type: SEQUENCE; Schema: public; Owner: postgress
--

CREATE SEQUENCE public.pages_params_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.pages_params_id_seq OWNER TO postgress;

--
-- Name: pages_params_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgress
--

ALTER SEQUENCE public.pages_params_id_seq OWNED BY public.pages_params.id;


--
-- Name: pages_sections; Type: TABLE; Schema: public; Owner: postgress
--

CREATE TABLE public.pages_sections (
    id integer NOT NULL,
    "createdAt" timestamp without time zone DEFAULT '2025-02-25 18:46:18.553'::timestamp without time zone NOT NULL,
    "updatedAt" timestamp without time zone DEFAULT '2025-02-25 18:46:18.553'::timestamp without time zone NOT NULL,
    "deletedAt" timestamp without time zone,
    "pagesId" integer
);


ALTER TABLE public.pages_sections OWNER TO postgress;

--
-- Name: pages_sections_description_value; Type: TABLE; Schema: public; Owner: postgress
--

CREATE TABLE public.pages_sections_description_value (
    id integer NOT NULL,
    "createdAt" timestamp without time zone DEFAULT '2025-02-25 18:46:18.553'::timestamp without time zone NOT NULL,
    "updatedAt" timestamp without time zone DEFAULT '2025-02-25 18:46:18.553'::timestamp without time zone NOT NULL,
    "deletedAt" timestamp without time zone,
    value character varying NOT NULL,
    lang public.pages_sections_description_value_lang_enum NOT NULL,
    "sectionId" integer
);


ALTER TABLE public.pages_sections_description_value OWNER TO postgress;

--
-- Name: pages_sections_description_value_id_seq; Type: SEQUENCE; Schema: public; Owner: postgress
--

CREATE SEQUENCE public.pages_sections_description_value_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.pages_sections_description_value_id_seq OWNER TO postgress;

--
-- Name: pages_sections_description_value_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgress
--

ALTER SEQUENCE public.pages_sections_description_value_id_seq OWNED BY public.pages_sections_description_value.id;


--
-- Name: pages_sections_id_seq; Type: SEQUENCE; Schema: public; Owner: postgress
--

CREATE SEQUENCE public.pages_sections_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.pages_sections_id_seq OWNER TO postgress;

--
-- Name: pages_sections_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgress
--

ALTER SEQUENCE public.pages_sections_id_seq OWNED BY public.pages_sections.id;


--
-- Name: pages_sections_title_value; Type: TABLE; Schema: public; Owner: postgress
--

CREATE TABLE public.pages_sections_title_value (
    id integer NOT NULL,
    "createdAt" timestamp without time zone DEFAULT '2025-02-25 18:46:18.553'::timestamp without time zone NOT NULL,
    "updatedAt" timestamp without time zone DEFAULT '2025-02-25 18:46:18.553'::timestamp without time zone NOT NULL,
    "deletedAt" timestamp without time zone,
    value character varying NOT NULL,
    lang public.pages_sections_title_value_lang_enum NOT NULL,
    "sectionId" integer
);


ALTER TABLE public.pages_sections_title_value OWNER TO postgress;

--
-- Name: pages_sections_title_value_id_seq; Type: SEQUENCE; Schema: public; Owner: postgress
--

CREATE SEQUENCE public.pages_sections_title_value_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.pages_sections_title_value_id_seq OWNER TO postgress;

--
-- Name: pages_sections_title_value_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgress
--

ALTER SEQUENCE public.pages_sections_title_value_id_seq OWNED BY public.pages_sections_title_value.id;


--
-- Name: pages_seo; Type: TABLE; Schema: public; Owner: postgress
--

CREATE TABLE public.pages_seo (
    id integer NOT NULL,
    "createdAt" timestamp without time zone DEFAULT '2025-02-25 18:46:18.553'::timestamp without time zone NOT NULL,
    "updatedAt" timestamp without time zone DEFAULT '2025-02-25 18:46:18.553'::timestamp without time zone NOT NULL,
    "deletedAt" timestamp without time zone
);


ALTER TABLE public.pages_seo OWNER TO postgress;

--
-- Name: pages_seo_id_seq; Type: SEQUENCE; Schema: public; Owner: postgress
--

CREATE SEQUENCE public.pages_seo_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.pages_seo_id_seq OWNER TO postgress;

--
-- Name: pages_seo_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgress
--

ALTER SEQUENCE public.pages_seo_id_seq OWNED BY public.pages_seo.id;


--
-- Name: pages_seo_params; Type: TABLE; Schema: public; Owner: postgress
--

CREATE TABLE public.pages_seo_params (
    id integer NOT NULL,
    "createdAt" timestamp without time zone DEFAULT '2025-02-25 18:46:18.553'::timestamp without time zone NOT NULL,
    "updatedAt" timestamp without time zone DEFAULT '2025-02-25 18:46:18.553'::timestamp without time zone NOT NULL,
    "deletedAt" timestamp without time zone,
    content character varying(2048) DEFAULT ''::character varying NOT NULL,
    lang public.pages_seo_params_lang_enum NOT NULL,
    "fieldType" public.pages_seo_params_fieldtype_enum NOT NULL,
    "pagesSeoId" integer
);


ALTER TABLE public.pages_seo_params OWNER TO postgress;

--
-- Name: pages_seo_params_id_seq; Type: SEQUENCE; Schema: public; Owner: postgress
--

CREATE SEQUENCE public.pages_seo_params_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.pages_seo_params_id_seq OWNER TO postgress;

--
-- Name: pages_seo_params_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgress
--

ALTER SEQUENCE public.pages_seo_params_id_seq OWNED BY public.pages_seo_params.id;


--
-- Name: records; Type: TABLE; Schema: public; Owner: postgress
--

CREATE TABLE public.records (
    id integer NOT NULL,
    "createdAt" timestamp without time zone DEFAULT '2025-02-25 18:46:18.553'::timestamp without time zone NOT NULL,
    "updatedAt" timestamp without time zone DEFAULT '2025-02-25 18:46:18.553'::timestamp without time zone NOT NULL,
    "deletedAt" timestamp without time zone,
    "countView" integer DEFAULT 0 NOT NULL,
    "titleId" integer,
    "descriptionId" integer,
    "pagesId" integer,
    "authorId" integer,
    "seoId" integer
);


ALTER TABLE public.records OWNER TO postgress;

--
-- Name: records_description; Type: TABLE; Schema: public; Owner: postgress
--

CREATE TABLE public.records_description (
    id integer NOT NULL,
    "createdAt" timestamp without time zone DEFAULT '2025-02-25 18:46:18.553'::timestamp without time zone NOT NULL,
    "updatedAt" timestamp without time zone DEFAULT '2025-02-25 18:46:18.553'::timestamp without time zone NOT NULL,
    "deletedAt" timestamp without time zone
);


ALTER TABLE public.records_description OWNER TO postgress;

--
-- Name: records_description_id_seq; Type: SEQUENCE; Schema: public; Owner: postgress
--

CREATE SEQUENCE public.records_description_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.records_description_id_seq OWNER TO postgress;

--
-- Name: records_description_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgress
--

ALTER SEQUENCE public.records_description_id_seq OWNED BY public.records_description.id;


--
-- Name: records_description_value; Type: TABLE; Schema: public; Owner: postgress
--

CREATE TABLE public.records_description_value (
    id integer NOT NULL,
    "createdAt" timestamp without time zone DEFAULT '2025-02-25 18:46:18.553'::timestamp without time zone NOT NULL,
    "updatedAt" timestamp without time zone DEFAULT '2025-02-25 18:46:18.553'::timestamp without time zone NOT NULL,
    "deletedAt" timestamp without time zone,
    value character varying NOT NULL,
    lang public.records_description_value_lang_enum NOT NULL,
    "recordDescriptionId" integer
);


ALTER TABLE public.records_description_value OWNER TO postgress;

--
-- Name: records_description_value_id_seq; Type: SEQUENCE; Schema: public; Owner: postgress
--

CREATE SEQUENCE public.records_description_value_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.records_description_value_id_seq OWNER TO postgress;

--
-- Name: records_description_value_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgress
--

ALTER SEQUENCE public.records_description_value_id_seq OWNED BY public.records_description_value.id;


--
-- Name: records_id_seq; Type: SEQUENCE; Schema: public; Owner: postgress
--

CREATE SEQUENCE public.records_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.records_id_seq OWNER TO postgress;

--
-- Name: records_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgress
--

ALTER SEQUENCE public.records_id_seq OWNED BY public.records.id;


--
-- Name: records_sections_pages_sections; Type: TABLE; Schema: public; Owner: postgress
--

CREATE TABLE public.records_sections_pages_sections (
    "recordsId" integer NOT NULL,
    "pagesSectionsId" integer NOT NULL
);


ALTER TABLE public.records_sections_pages_sections OWNER TO postgress;

--
-- Name: records_seo; Type: TABLE; Schema: public; Owner: postgress
--

CREATE TABLE public.records_seo (
    id integer NOT NULL,
    "createdAt" timestamp without time zone DEFAULT '2025-02-25 18:46:18.553'::timestamp without time zone NOT NULL,
    "updatedAt" timestamp without time zone DEFAULT '2025-02-25 18:46:18.553'::timestamp without time zone NOT NULL,
    "deletedAt" timestamp without time zone
);


ALTER TABLE public.records_seo OWNER TO postgress;

--
-- Name: records_seo_id_seq; Type: SEQUENCE; Schema: public; Owner: postgress
--

CREATE SEQUENCE public.records_seo_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.records_seo_id_seq OWNER TO postgress;

--
-- Name: records_seo_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgress
--

ALTER SEQUENCE public.records_seo_id_seq OWNED BY public.records_seo.id;


--
-- Name: records_seo_params; Type: TABLE; Schema: public; Owner: postgress
--

CREATE TABLE public.records_seo_params (
    id integer NOT NULL,
    "createdAt" timestamp without time zone DEFAULT '2025-02-25 18:46:18.553'::timestamp without time zone NOT NULL,
    "updatedAt" timestamp without time zone DEFAULT '2025-02-25 18:46:18.553'::timestamp without time zone NOT NULL,
    "deletedAt" timestamp without time zone,
    content character varying(2048) DEFAULT ''::character varying NOT NULL,
    lang public.records_seo_params_lang_enum NOT NULL,
    "fieldType" public.records_seo_params_fieldtype_enum NOT NULL,
    "recordSeoId" integer
);


ALTER TABLE public.records_seo_params OWNER TO postgress;

--
-- Name: records_seo_params_id_seq; Type: SEQUENCE; Schema: public; Owner: postgress
--

CREATE SEQUENCE public.records_seo_params_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.records_seo_params_id_seq OWNER TO postgress;

--
-- Name: records_seo_params_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgress
--

ALTER SEQUENCE public.records_seo_params_id_seq OWNED BY public.records_seo_params.id;


--
-- Name: records_title; Type: TABLE; Schema: public; Owner: postgress
--

CREATE TABLE public.records_title (
    id integer NOT NULL,
    "createdAt" timestamp without time zone DEFAULT '2025-02-25 18:46:18.553'::timestamp without time zone NOT NULL,
    "updatedAt" timestamp without time zone DEFAULT '2025-02-25 18:46:18.553'::timestamp without time zone NOT NULL,
    "deletedAt" timestamp without time zone
);


ALTER TABLE public.records_title OWNER TO postgress;

--
-- Name: records_title_id_seq; Type: SEQUENCE; Schema: public; Owner: postgress
--

CREATE SEQUENCE public.records_title_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.records_title_id_seq OWNER TO postgress;

--
-- Name: records_title_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgress
--

ALTER SEQUENCE public.records_title_id_seq OWNED BY public.records_title.id;


--
-- Name: records_title_value; Type: TABLE; Schema: public; Owner: postgress
--

CREATE TABLE public.records_title_value (
    id integer NOT NULL,
    "createdAt" timestamp without time zone DEFAULT '2025-02-25 18:46:18.553'::timestamp without time zone NOT NULL,
    "updatedAt" timestamp without time zone DEFAULT '2025-02-25 18:46:18.553'::timestamp without time zone NOT NULL,
    "deletedAt" timestamp without time zone,
    value character varying NOT NULL,
    lang public.records_title_value_lang_enum NOT NULL,
    "recordTitleId" integer
);


ALTER TABLE public.records_title_value OWNER TO postgress;

--
-- Name: records_title_value_id_seq; Type: SEQUENCE; Schema: public; Owner: postgress
--

CREATE SEQUENCE public.records_title_value_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.records_title_value_id_seq OWNER TO postgress;

--
-- Name: records_title_value_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgress
--

ALTER SEQUENCE public.records_title_value_id_seq OWNED BY public.records_title_value.id;


--
-- Name: reference_book; Type: TABLE; Schema: public; Owner: postgress
--

CREATE TABLE public.reference_book (
    id integer NOT NULL,
    "createdAt" timestamp without time zone DEFAULT '2025-02-25 18:46:18.553'::timestamp without time zone NOT NULL,
    "updatedAt" timestamp without time zone DEFAULT '2025-02-25 18:46:18.553'::timestamp without time zone NOT NULL,
    "deletedAt" timestamp without time zone,
    name character varying(1024) NOT NULL,
    slug character varying(1024) NOT NULL
);


ALTER TABLE public.reference_book OWNER TO postgress;

--
-- Name: reference_book_attributes; Type: TABLE; Schema: public; Owner: postgress
--

CREATE TABLE public.reference_book_attributes (
    id integer NOT NULL,
    "createdAt" timestamp without time zone DEFAULT '2025-02-25 18:46:18.553'::timestamp without time zone NOT NULL,
    "updatedAt" timestamp without time zone DEFAULT '2025-02-25 18:46:18.553'::timestamp without time zone NOT NULL,
    "deletedAt" timestamp without time zone,
    name character varying(1024) NOT NULL,
    slug character varying(1024) NOT NULL,
    type character varying DEFAULT 'text'::character varying NOT NULL,
    "referenceBookId" integer
);


ALTER TABLE public.reference_book_attributes OWNER TO postgress;

--
-- Name: reference_book_attributes_id_seq; Type: SEQUENCE; Schema: public; Owner: postgress
--

CREATE SEQUENCE public.reference_book_attributes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.reference_book_attributes_id_seq OWNER TO postgress;

--
-- Name: reference_book_attributes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgress
--

ALTER SEQUENCE public.reference_book_attributes_id_seq OWNED BY public.reference_book_attributes.id;


--
-- Name: reference_book_id_seq; Type: SEQUENCE; Schema: public; Owner: postgress
--

CREATE SEQUENCE public.reference_book_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.reference_book_id_seq OWNER TO postgress;

--
-- Name: reference_book_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgress
--

ALTER SEQUENCE public.reference_book_id_seq OWNED BY public.reference_book.id;


--
-- Name: reference_book_instances; Type: TABLE; Schema: public; Owner: postgress
--

CREATE TABLE public.reference_book_instances (
    id integer NOT NULL,
    "createdAt" timestamp without time zone DEFAULT '2025-02-25 18:46:18.553'::timestamp without time zone NOT NULL,
    "updatedAt" timestamp without time zone DEFAULT '2025-02-25 18:46:18.553'::timestamp without time zone NOT NULL,
    "deletedAt" timestamp without time zone,
    "referenceBookId" integer
);


ALTER TABLE public.reference_book_instances OWNER TO postgress;

--
-- Name: reference_book_instances_id_seq; Type: SEQUENCE; Schema: public; Owner: postgress
--

CREATE SEQUENCE public.reference_book_instances_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.reference_book_instances_id_seq OWNER TO postgress;

--
-- Name: reference_book_instances_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgress
--

ALTER SEQUENCE public.reference_book_instances_id_seq OWNED BY public.reference_book_instances.id;


--
-- Name: reference_book_instances_value; Type: TABLE; Schema: public; Owner: postgress
--

CREATE TABLE public.reference_book_instances_value (
    id integer NOT NULL,
    "createdAt" timestamp without time zone DEFAULT '2025-02-25 18:46:18.553'::timestamp without time zone NOT NULL,
    "updatedAt" timestamp without time zone DEFAULT '2025-02-25 18:46:18.553'::timestamp without time zone NOT NULL,
    "deletedAt" timestamp without time zone,
    value character varying,
    "valueJson" json,
    "instanceId" integer,
    "attributeId" integer
);


ALTER TABLE public.reference_book_instances_value OWNER TO postgress;

--
-- Name: reference_book_instances_value_id_seq; Type: SEQUENCE; Schema: public; Owner: postgress
--

CREATE SEQUENCE public.reference_book_instances_value_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.reference_book_instances_value_id_seq OWNER TO postgress;

--
-- Name: reference_book_instances_value_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgress
--

ALTER SEQUENCE public.reference_book_instances_value_id_seq OWNED BY public.reference_book_instances_value.id;


--
-- Name: settings; Type: TABLE; Schema: public; Owner: postgress
--

CREATE TABLE public.settings (
    id integer NOT NULL,
    "createdAt" timestamp without time zone DEFAULT '2025-02-25 18:46:18.553'::timestamp without time zone NOT NULL,
    "updatedAt" timestamp without time zone DEFAULT '2025-02-25 18:46:18.553'::timestamp without time zone NOT NULL,
    "deletedAt" timestamp without time zone,
    title character varying(1024) NOT NULL,
    description character varying(1024),
    vk character varying(1024),
    facebook character varying(1024),
    viber character varying(1024),
    whatsapp character varying(1024),
    telegram character varying(1024),
    discord character varying(1024),
    "linkedIn" character varying(1024),
    instagram character varying(1024),
    phone character varying(1024),
    email character varying(1024),
    "urlBitrix" character varying DEFAULT ''::character varying,
    "amoClientId" character varying DEFAULT ''::character varying,
    "amoClientSecret" character varying DEFAULT ''::character varying,
    "amoDomain" character varying DEFAULT ''::character varying,
    "amoBearer" character varying DEFAULT ''::character varying
);


ALTER TABLE public.settings OWNER TO postgress;

--
-- Name: settings-contacts; Type: TABLE; Schema: public; Owner: postgress
--

CREATE TABLE public."settings-contacts" (
    id integer NOT NULL,
    "createdAt" timestamp without time zone DEFAULT '2025-02-25 18:46:18.553'::timestamp without time zone NOT NULL,
    "updatedAt" timestamp without time zone DEFAULT '2025-02-25 18:46:18.553'::timestamp without time zone NOT NULL,
    "deletedAt" timestamp without time zone,
    content character varying(1024),
    description character varying(1024),
    "isPhone" boolean DEFAULT false NOT NULL,
    "emailId" integer,
    "phoneId" integer
);


ALTER TABLE public."settings-contacts" OWNER TO postgress;

--
-- Name: settings-contacts_id_seq; Type: SEQUENCE; Schema: public; Owner: postgress
--

CREATE SEQUENCE public."settings-contacts_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."settings-contacts_id_seq" OWNER TO postgress;

--
-- Name: settings-contacts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgress
--

ALTER SEQUENCE public."settings-contacts_id_seq" OWNED BY public."settings-contacts".id;


--
-- Name: settings_id_seq; Type: SEQUENCE; Schema: public; Owner: postgress
--

CREATE SEQUENCE public.settings_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.settings_id_seq OWNER TO postgress;

--
-- Name: settings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgress
--

ALTER SEQUENCE public.settings_id_seq OWNED BY public.settings.id;


--
-- Name: settings_menu; Type: TABLE; Schema: public; Owner: postgress
--

CREATE TABLE public.settings_menu (
    id integer NOT NULL,
    "createdAt" timestamp without time zone DEFAULT '2025-02-25 18:46:18.553'::timestamp without time zone NOT NULL,
    "updatedAt" timestamp without time zone DEFAULT '2025-02-25 18:46:18.553'::timestamp without time zone NOT NULL,
    "deletedAt" timestamp without time zone,
    title character varying(512) NOT NULL,
    slug character varying(512)
);


ALTER TABLE public.settings_menu OWNER TO postgress;

--
-- Name: settings_menu_id_seq; Type: SEQUENCE; Schema: public; Owner: postgress
--

CREATE SEQUENCE public.settings_menu_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.settings_menu_id_seq OWNER TO postgress;

--
-- Name: settings_menu_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgress
--

ALTER SEQUENCE public.settings_menu_id_seq OWNED BY public.settings_menu.id;


--
-- Name: settings_menu_item; Type: TABLE; Schema: public; Owner: postgress
--

CREATE TABLE public.settings_menu_item (
    id integer NOT NULL,
    "createdAt" timestamp without time zone DEFAULT '2025-02-25 18:46:18.553'::timestamp without time zone NOT NULL,
    "updatedAt" timestamp without time zone DEFAULT '2025-02-25 18:46:18.553'::timestamp without time zone NOT NULL,
    "deletedAt" timestamp without time zone,
    title character varying(512) NOT NULL,
    hash character varying(512),
    "order" integer DEFAULT 0 NOT NULL,
    mpath character varying DEFAULT ''::character varying,
    "menuId" integer,
    "pagesId" integer,
    "parentId" integer
);


ALTER TABLE public.settings_menu_item OWNER TO postgress;

--
-- Name: settings_menu_item_id_seq; Type: SEQUENCE; Schema: public; Owner: postgress
--

CREATE SEQUENCE public.settings_menu_item_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.settings_menu_item_id_seq OWNER TO postgress;

--
-- Name: settings_menu_item_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgress
--

ALTER SEQUENCE public.settings_menu_item_id_seq OWNED BY public.settings_menu_item.id;


--
-- Name: user; Type: TABLE; Schema: public; Owner: postgress
--

CREATE TABLE public."user" (
    id integer NOT NULL,
    "createdAt" timestamp without time zone DEFAULT '2025-02-25 18:46:18.553'::timestamp without time zone NOT NULL,
    "updatedAt" timestamp without time zone DEFAULT '2025-02-25 18:46:18.553'::timestamp without time zone NOT NULL,
    "deletedAt" timestamp without time zone,
    "isActive" boolean DEFAULT false NOT NULL,
    "lastName" character varying(1024) NOT NULL,
    "firstName" character varying(1024) NOT NULL,
    "middleName" character varying(1024),
    email character varying(1024) NOT NULL,
    password character varying(2048) NOT NULL,
    role character varying NOT NULL
);


ALTER TABLE public."user" OWNER TO postgress;

--
-- Name: user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgress
--

CREATE SEQUENCE public.user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_id_seq OWNER TO postgress;

--
-- Name: user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgress
--

ALTER SEQUENCE public.user_id_seq OWNED BY public."user".id;


--
-- Name: users_comments_like; Type: TABLE; Schema: public; Owner: postgress
--

CREATE TABLE public.users_comments_like (
    "pagesCommentsId" integer NOT NULL,
    "userId" integer NOT NULL
);


ALTER TABLE public.users_comments_like OWNER TO postgress;

--
-- Name: amo_custom_fields id; Type: DEFAULT; Schema: public; Owner: postgress
--

ALTER TABLE ONLY public.amo_custom_fields ALTER COLUMN id SET DEFAULT nextval('public.amo_custom_fields_id_seq'::regclass);


--
-- Name: auth-confirm id; Type: DEFAULT; Schema: public; Owner: postgress
--

ALTER TABLE ONLY public."auth-confirm" ALTER COLUMN id SET DEFAULT nextval('public."auth-confirm_id_seq"'::regclass);


--
-- Name: callback id; Type: DEFAULT; Schema: public; Owner: postgress
--

ALTER TABLE ONLY public.callback ALTER COLUMN id SET DEFAULT nextval('public.callback_id_seq'::regclass);


--
-- Name: callback_field id; Type: DEFAULT; Schema: public; Owner: postgress
--

ALTER TABLE ONLY public.callback_field ALTER COLUMN id SET DEFAULT nextval('public.callback_field_id_seq'::regclass);


--
-- Name: callback_instances id; Type: DEFAULT; Schema: public; Owner: postgress
--

ALTER TABLE ONLY public.callback_instances ALTER COLUMN id SET DEFAULT nextval('public.callback_instances_id_seq'::regclass);


--
-- Name: callback_instances_value id; Type: DEFAULT; Schema: public; Owner: postgress
--

ALTER TABLE ONLY public.callback_instances_value ALTER COLUMN id SET DEFAULT nextval('public.callback_instances_value_id_seq'::regclass);


--
-- Name: library_files id; Type: DEFAULT; Schema: public; Owner: postgress
--

ALTER TABLE ONLY public.library_files ALTER COLUMN id SET DEFAULT nextval('public.library_files_id_seq'::regclass);


--
-- Name: migrations id; Type: DEFAULT; Schema: public; Owner: postgress
--

ALTER TABLE ONLY public.migrations ALTER COLUMN id SET DEFAULT nextval('public.migrations_id_seq'::regclass);


--
-- Name: pages id; Type: DEFAULT; Schema: public; Owner: postgress
--

ALTER TABLE ONLY public.pages ALTER COLUMN id SET DEFAULT nextval('public.pages_id_seq'::regclass);


--
-- Name: pages-comments id; Type: DEFAULT; Schema: public; Owner: postgress
--

ALTER TABLE ONLY public."pages-comments" ALTER COLUMN id SET DEFAULT nextval('public."pages-comments_id_seq"'::regclass);


--
-- Name: pages-components id; Type: DEFAULT; Schema: public; Owner: postgress
--

ALTER TABLE ONLY public."pages-components" ALTER COLUMN id SET DEFAULT nextval('public."pages-components_id_seq"'::regclass);


--
-- Name: pages_iblock id; Type: DEFAULT; Schema: public; Owner: postgress
--

ALTER TABLE ONLY public.pages_iblock ALTER COLUMN id SET DEFAULT nextval('public.pages_iblock_id_seq'::regclass);


--
-- Name: pages_iblock_fields id; Type: DEFAULT; Schema: public; Owner: postgress
--

ALTER TABLE ONLY public.pages_iblock_fields ALTER COLUMN id SET DEFAULT nextval('public.pages_iblock_fields_id_seq'::regclass);


--
-- Name: pages_iblock_fields_label id; Type: DEFAULT; Schema: public; Owner: postgress
--

ALTER TABLE ONLY public.pages_iblock_fields_label ALTER COLUMN id SET DEFAULT nextval('public.pages_iblock_fields_label_id_seq'::regclass);


--
-- Name: pages_iblock_records id; Type: DEFAULT; Schema: public; Owner: postgress
--

ALTER TABLE ONLY public.pages_iblock_records ALTER COLUMN id SET DEFAULT nextval('public.pages_iblock_records_id_seq'::regclass);


--
-- Name: pages_iblock_records_field id; Type: DEFAULT; Schema: public; Owner: postgress
--

ALTER TABLE ONLY public.pages_iblock_records_field ALTER COLUMN id SET DEFAULT nextval('public.pages_iblock_records_field_id_seq'::regclass);


--
-- Name: pages_iblock_records_field_value id; Type: DEFAULT; Schema: public; Owner: postgress
--

ALTER TABLE ONLY public.pages_iblock_records_field_value ALTER COLUMN id SET DEFAULT nextval('public.pages_iblock_records_field_value_id_seq'::regclass);


--
-- Name: pages_iblock_section id; Type: DEFAULT; Schema: public; Owner: postgress
--

ALTER TABLE ONLY public.pages_iblock_section ALTER COLUMN id SET DEFAULT nextval('public.pages_iblock_section_id_seq'::regclass);


--
-- Name: pages_iblock_section_value id; Type: DEFAULT; Schema: public; Owner: postgress
--

ALTER TABLE ONLY public.pages_iblock_section_value ALTER COLUMN id SET DEFAULT nextval('public.pages_iblock_section_value_id_seq'::regclass);


--
-- Name: pages_params id; Type: DEFAULT; Schema: public; Owner: postgress
--

ALTER TABLE ONLY public.pages_params ALTER COLUMN id SET DEFAULT nextval('public.pages_params_id_seq'::regclass);


--
-- Name: pages_params_field id; Type: DEFAULT; Schema: public; Owner: postgress
--

ALTER TABLE ONLY public.pages_params_field ALTER COLUMN id SET DEFAULT nextval('public.pages_params_field_id_seq'::regclass);


--
-- Name: pages_params_field_value id; Type: DEFAULT; Schema: public; Owner: postgress
--

ALTER TABLE ONLY public.pages_params_field_value ALTER COLUMN id SET DEFAULT nextval('public.pages_params_field_value_id_seq'::regclass);


--
-- Name: pages_sections id; Type: DEFAULT; Schema: public; Owner: postgress
--

ALTER TABLE ONLY public.pages_sections ALTER COLUMN id SET DEFAULT nextval('public.pages_sections_id_seq'::regclass);


--
-- Name: pages_sections_description_value id; Type: DEFAULT; Schema: public; Owner: postgress
--

ALTER TABLE ONLY public.pages_sections_description_value ALTER COLUMN id SET DEFAULT nextval('public.pages_sections_description_value_id_seq'::regclass);


--
-- Name: pages_sections_title_value id; Type: DEFAULT; Schema: public; Owner: postgress
--

ALTER TABLE ONLY public.pages_sections_title_value ALTER COLUMN id SET DEFAULT nextval('public.pages_sections_title_value_id_seq'::regclass);


--
-- Name: pages_seo id; Type: DEFAULT; Schema: public; Owner: postgress
--

ALTER TABLE ONLY public.pages_seo ALTER COLUMN id SET DEFAULT nextval('public.pages_seo_id_seq'::regclass);


--
-- Name: pages_seo_params id; Type: DEFAULT; Schema: public; Owner: postgress
--

ALTER TABLE ONLY public.pages_seo_params ALTER COLUMN id SET DEFAULT nextval('public.pages_seo_params_id_seq'::regclass);


--
-- Name: records id; Type: DEFAULT; Schema: public; Owner: postgress
--

ALTER TABLE ONLY public.records ALTER COLUMN id SET DEFAULT nextval('public.records_id_seq'::regclass);


--
-- Name: records_description id; Type: DEFAULT; Schema: public; Owner: postgress
--

ALTER TABLE ONLY public.records_description ALTER COLUMN id SET DEFAULT nextval('public.records_description_id_seq'::regclass);


--
-- Name: records_description_value id; Type: DEFAULT; Schema: public; Owner: postgress
--

ALTER TABLE ONLY public.records_description_value ALTER COLUMN id SET DEFAULT nextval('public.records_description_value_id_seq'::regclass);


--
-- Name: records_seo id; Type: DEFAULT; Schema: public; Owner: postgress
--

ALTER TABLE ONLY public.records_seo ALTER COLUMN id SET DEFAULT nextval('public.records_seo_id_seq'::regclass);


--
-- Name: records_seo_params id; Type: DEFAULT; Schema: public; Owner: postgress
--

ALTER TABLE ONLY public.records_seo_params ALTER COLUMN id SET DEFAULT nextval('public.records_seo_params_id_seq'::regclass);


--
-- Name: records_title id; Type: DEFAULT; Schema: public; Owner: postgress
--

ALTER TABLE ONLY public.records_title ALTER COLUMN id SET DEFAULT nextval('public.records_title_id_seq'::regclass);


--
-- Name: records_title_value id; Type: DEFAULT; Schema: public; Owner: postgress
--

ALTER TABLE ONLY public.records_title_value ALTER COLUMN id SET DEFAULT nextval('public.records_title_value_id_seq'::regclass);


--
-- Name: reference_book id; Type: DEFAULT; Schema: public; Owner: postgress
--

ALTER TABLE ONLY public.reference_book ALTER COLUMN id SET DEFAULT nextval('public.reference_book_id_seq'::regclass);


--
-- Name: reference_book_attributes id; Type: DEFAULT; Schema: public; Owner: postgress
--

ALTER TABLE ONLY public.reference_book_attributes ALTER COLUMN id SET DEFAULT nextval('public.reference_book_attributes_id_seq'::regclass);


--
-- Name: reference_book_instances id; Type: DEFAULT; Schema: public; Owner: postgress
--

ALTER TABLE ONLY public.reference_book_instances ALTER COLUMN id SET DEFAULT nextval('public.reference_book_instances_id_seq'::regclass);


--
-- Name: reference_book_instances_value id; Type: DEFAULT; Schema: public; Owner: postgress
--

ALTER TABLE ONLY public.reference_book_instances_value ALTER COLUMN id SET DEFAULT nextval('public.reference_book_instances_value_id_seq'::regclass);


--
-- Name: settings id; Type: DEFAULT; Schema: public; Owner: postgress
--

ALTER TABLE ONLY public.settings ALTER COLUMN id SET DEFAULT nextval('public.settings_id_seq'::regclass);


--
-- Name: settings-contacts id; Type: DEFAULT; Schema: public; Owner: postgress
--

ALTER TABLE ONLY public."settings-contacts" ALTER COLUMN id SET DEFAULT nextval('public."settings-contacts_id_seq"'::regclass);


--
-- Name: settings_menu id; Type: DEFAULT; Schema: public; Owner: postgress
--

ALTER TABLE ONLY public.settings_menu ALTER COLUMN id SET DEFAULT nextval('public.settings_menu_id_seq'::regclass);


--
-- Name: settings_menu_item id; Type: DEFAULT; Schema: public; Owner: postgress
--

ALTER TABLE ONLY public.settings_menu_item ALTER COLUMN id SET DEFAULT nextval('public.settings_menu_item_id_seq'::regclass);


--
-- Name: user id; Type: DEFAULT; Schema: public; Owner: postgress
--

ALTER TABLE ONLY public."user" ALTER COLUMN id SET DEFAULT nextval('public.user_id_seq'::regclass);


--
-- Data for Name: amo_custom_fields; Type: TABLE DATA; Schema: public; Owner: postgress
--

COPY public.amo_custom_fields (id, "createdAt", "updatedAt", "deletedAt", "amoID", attribute) FROM stdin;
\.


--
-- Data for Name: auth-confirm; Type: TABLE DATA; Schema: public; Owner: postgress
--

COPY public."auth-confirm" (id, "createdAt", "updatedAt", "deletedAt", uuid, "isActive", type, "userId") FROM stdin;
\.


--
-- Data for Name: callback; Type: TABLE DATA; Schema: public; Owner: postgress
--

COPY public.callback (id, "createdAt", "updatedAt", "deletedAt", name, slug, "syncBitrix", "syncAmo", email) FROM stdin;
\.


--
-- Data for Name: callback_field; Type: TABLE DATA; Schema: public; Owner: postgress
--

COPY public.callback_field (id, "createdAt", "updatedAt", "deletedAt", name, type, attribute, "isRequred", "callbackId") FROM stdin;
\.


--
-- Data for Name: callback_instances; Type: TABLE DATA; Schema: public; Owner: postgress
--

COPY public.callback_instances (id, "createdAt", "updatedAt", "deletedAt", "callbackId") FROM stdin;
\.


--
-- Data for Name: callback_instances_value; Type: TABLE DATA; Schema: public; Owner: postgress
--

COPY public.callback_instances_value (id, "createdAt", "updatedAt", "deletedAt", value, "instanceId", "fieldId") FROM stdin;
\.


--
-- Data for Name: library_files; Type: TABLE DATA; Schema: public; Owner: postgress
--

COPY public.library_files (id, "createdAt", "updatedAt", "deletedAt", path, type, name, filename, size, "isSystem", "parentId") FROM stdin;
1	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	2025-02-26 09:14:19.837664		images	daulet-turubayev-RAwn1QFwfss-unsplash.png	2348d6f8677ea986836c79bf01b4227f.png	207506	f	\N
2	2025-02-25 18:46:18.553	2025-02-26 09:18:00.347342	2025-02-26 09:18:00.347342		images	daulet-turubayev-RAwn1QFwfss-unsplash.png	3219022a4ee2c86ba778195570cdb9ef.png	207506	f	\N
3	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N		images	daulet-turubayev-RAwn1QFwfss-unsplash.png	996fbcad74d59d1479b3fb6730ca8f9b.png	207506	f	\N
4	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N		images	DALLÂ·E 2024-09-20 00.51.38 1.png	bcb485d608f4e6a9fa07466d506b9f7b.png	533239	f	\N
5	2025-02-25 18:46:18.553	2025-02-27 17:14:10.270281	2025-02-27 17:14:10.270281		file	Ð¡Ð°Ð¸ÌÑ ÐÐÐ ÐÐÐ¢ÐÐ ÐÐ (2).zip	365d963b115567f045a97da5b21547b0.zip	567124	f	\N
6	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N		images	DALLÂ·E 2024-09-20 00.51.38 1.png	270de414d4609e9921623fddb34f905e.png	566808	f	\N
7	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N		images	DALLÂ·E 2024-09-20 00.51.38 1.png	b66aa2f3800efcb5969fc3933b4e6291.png	645353	f	\N
8	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N		images	DALLÂ·E 2024-09-20 00.51.38 1.png	c17d994bb918cf12d0eaa40c6f08f4b4.png	444181	f	\N
9	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N		images	DALLÂ·E 2024-09-20 00.51.38 1.png	3cd4084c1e97b44c01d56dcfc9778f3b.png	548330	f	\N
10	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N		images	jonas-kakaroto-KIPqvvTOC1s-unsplash.png	7718065781f3ed643cfc2f16136c893a.png	391276	f	\N
11	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N		images	jonas-kakaroto-KIPqvvTOC1s-unsplash.png	77f24146d9f7ecab201cf9be464dce3d.png	391276	f	\N
12	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N		images	jonas-kakaroto-KIPqvvTOC1s-unsplash.png	a011ec9cc35d9c1258f5ffeb6adfe342.png	391276	f	\N
13	2025-02-25 18:46:18.553	2025-02-27 18:16:27.417745	2025-02-27 18:16:27.417745		pdf	policy.pdf	0f3f068b61225c94de2f9108ee0123d2.pdf	9616	f	\N
14	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N		docs	policy.docx	c7b190264abed1f1d6285b9fb577110b.docx	7525	f	\N
15	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N		docs	policy.docx	b1aae3847de1572488f5aaf03066b64e.docx	7525	f	\N
16	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N		images	linkedin-sales-solutions-NpyF7rjqmq4-unsplash 1.png	2dfb3ccd6eb74468f92b424f33049bc0.png	361705	f	\N
17	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N		images	jonas-kakaroto-KIPqvvTOC1s-unsplash.png	d499660c915e40db3f45c14d5da2db02.png	391276	f	\N
18	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N		images	linkedin-sales-solutions-pAtA8xe_iVM-unsplash 1.png	670973da319cf9784fc8aa7623dd77f3.png	348752	f	\N
19	2025-02-25 18:46:18.553	2025-02-27 19:57:58.476399	2025-02-27 19:57:58.476399		images	linkedin-sales-solutions-pAtA8xe_iVM-unsplash 1.png	6b5f8b46043d3081f0f436318068f6fb.png	348752	f	\N
20	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N		images	pngwing.com (2) 1.png	13cc7bf22590c668a7f641ecf4754915.png	515224	f	\N
21	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N		images	pngwing.com (3) 1.png	b6e6290768a0bc8f834ea19efe2445d7.png	434233	f	\N
22	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N		images	pngwing.com (4) 1.png	f515b0ab97eef8699c697910f4a38175.png	367598	f	\N
23	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N		images	pngwing.com (4) 1.png	ca88ad1cd612627c383985ad09eccd58.png	390548	f	\N
24	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N		images	pngwing.com (4) 1.png	a7f6d68ddd390c561737fbd60c5ecd9b.png	384798	f	\N
25	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N		images	pngwing.com (4) 1.png	bef29189be1467cf8fc550717ea92ae2.png	302874	f	\N
26	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N		images	pngwing.com (4) 1.png	f02bf4de3aa35d4b1616c0112a33754f.png	291995	f	\N
27	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N		images	pngwing.com (4) 1.png	8805f1491762fe56012cb99fa2840b4d.png	184414	f	\N
28	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N		images	pngwing.com (4) 1.png	e0e7839836114b51b5fee8a9b05d6dda.png	367918	f	\N
29	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N		images	pngwing.com (4) 1.png	eaa8a1b674a3f981c838e9ff2e609c82.png	354639	f	\N
30	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N		images	pngwing.com (4) 1.png	f441ff437d92d423c3a5c0693f5f668e.png	302874	f	\N
\.


--
-- Data for Name: migrations; Type: TABLE DATA; Schema: public; Owner: postgress
--

COPY public.migrations (id, "timestamp", name) FROM stdin;
1	1740509177262	Auto1740509177262
\.


--
-- Data for Name: pages; Type: TABLE DATA; Schema: public; Owner: postgress
--

COPY public.pages (id, "createdAt", "updatedAt", "deletedAt", name, description, slug, type, "pagePath", "seoId") FROM stdin;
1	2025-02-25 19:45:01.815	2025-02-25 19:46:01.095491	\N	Главная		home	Landing	""	1
2	2025-02-25 19:53:18.886	2025-02-25 19:54:01.196223	\N	О компании		about	Landing	""	2
3	2025-02-25 19:57:16.136	2025-02-25 19:57:41.954919	\N	Контакты		contacts	Landing	""	3
4	2025-02-25 20:08:24.399	2025-02-25 20:09:08.912987	\N	Политика конфиденциальности		policy	Landing	""	4
5	2025-02-25 20:11:01.918	2025-02-25 20:11:29.54904	\N	Клиенты		clients	Landing	""	5
6	2025-02-25 20:14:45.881	2025-02-25 20:15:14.987136	\N	Партнерам		partners	Landing	""	6
7	2025-02-25 20:18:10.235	2025-02-25 20:18:39.863466	\N	Карьера		career	Landing	""	7
8	2025-02-25 20:26:03.719	2025-02-25 20:26:33.908564	\N	Новости		news	blog	""	8
9	2025-02-25 20:29:58.894	2025-02-25 20:29:58.894	\N	Статьи и аналитика		articles-analytics	blog	""	\N
10	2025-02-25 20:31:13.642	2025-02-25 20:31:13.642	\N	Пресс-релизы		press-release	blog	""	\N
11	2025-02-25 20:32:50.2	2025-02-25 20:33:18.176978	\N	Услуги		service	blog	""	9
12	2025-02-25 20:38:57.868	2025-02-25 20:39:26.00428	\N	Продукты		products	blog	""	10
\.


--
-- Data for Name: pages-comments; Type: TABLE DATA; Schema: public; Owner: postgress
--

COPY public."pages-comments" (id, "createdAt", "updatedAt", "deletedAt", content, status, level, "recordsId", "userId", "parentId") FROM stdin;
\.


--
-- Data for Name: pages-components; Type: TABLE DATA; Schema: public; Owner: postgress
--

COPY public."pages-components" (id, "createdAt", "updatedAt", "deletedAt", "order", name, content, "pagesId") FROM stdin;
\.


--
-- Data for Name: pages_iblock; Type: TABLE DATA; Schema: public; Owner: postgress
--

COPY public.pages_iblock (id, "createdAt", "updatedAt", "deletedAt", name, slug, attributes, "pageId") FROM stdin;
4	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	О компании	about-company	\N	2
5	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Ключевые вехи	key-milestones	\N	2
6	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Команда	command	\N	2
7	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Основные контакты	main-contacts	\N	3
8	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Социальные сети	social	\N	3
9	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Общие контакты	common-contacts	\N	3
10	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Документы	documents	\N	4
11	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Часто задаваемые вопросы (FAQ)	faq	\N	5
12	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Контакты	clients-contacts	\N	5
13	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Контакты	partners-contact	\N	6
14	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Актуальные вакансии	job-openings	\N	7
15	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Истории сотрудников	career-employee	[{"type":"text","name":"title","fields":{"ru-RU":"Истории сотрудников","en-US":"Employee stories","zh-CN":"员工故事"},"field":{"ru-RU":"Истории сотрудников","en-US":"Employee stories","zh-CN":"员工故事"}},{"type":"textarea","name":"description","fields":{"ru-RU":"Познакомьтесь с историями успеха наших сотрудников, которые уже стали частью команды SA International","en-US":"Get to know the success stories of our employees who have already become part of the SA International team.","zh-CN":"了解我们已经成为SA国际团队一员的员工的成功故事。"},"field":{"ru-RU":"Познакомьтесь с историями успеха наших сотрудников, которые уже стали частью команды SA International","en-US":"Get to know the success stories of our employees who have already become part of the SA International team.","zh-CN":"了解我们已经成为SA国际团队一员的员工的成功故事。"}}]	7
16	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Контакты	career-contcats	\N	7
17	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Шапка новостей	header-news	\N	8
18	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Социальные сети	news-socail	\N	8
19	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Контакты	news-contacts	\N	8
20	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Шапка	header-articles-analytics	\N	9
21	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Шапка	header-press-release	\N	10
22	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Контакты	service-contacts	\N	11
23	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Контакты	products-contacts	\N	12
3	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Контакты	home-contacts	\N	1
1	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Наши направления деятельности	home-direction	\N	1
2	2025-02-25 18:46:18.553	2025-02-26 09:21:28.617565	\N	Стратегические проекты	stratagy-project	[{"type":"text","name":"title","fields":{"ru-RU":"Стратегические проекты","en-US":"Strategic Projects","zh-CN":"战略项目"},"field":{"ru-RU":"Стратегические проекты","en-US":"Strategic Projects","zh-CN":"战略项目"}},{"type":"images","name":"image","fields":{"ru-RU":{"path":"http://cloud.andreyi96.beget.tech:9000/cms/996fbcad74d59d1479b3fb6730ca8f9b.png","type":"images","name":"daulet-turubayev-RAwn1QFwfss-unsplash.png","filename":"996fbcad74d59d1479b3fb6730ca8f9b.png","size":207506,"id":3,"createdAt":"2025-02-25T18:46:18.553Z","updatedAt":"2025-02-25T18:46:18.553Z","deletedAt":null,"isSystem":false},"en-US":{"path":"http://cloud.andreyi96.beget.tech:9000/cms/996fbcad74d59d1479b3fb6730ca8f9b.png","type":"images","name":"daulet-turubayev-RAwn1QFwfss-unsplash.png","filename":"996fbcad74d59d1479b3fb6730ca8f9b.png","size":207506,"id":3,"createdAt":"2025-02-25T18:46:18.553Z","updatedAt":"2025-02-25T18:46:18.553Z","deletedAt":null,"isSystem":false},"zh-CN":{"path":"http://cloud.andreyi96.beget.tech:9000/cms/996fbcad74d59d1479b3fb6730ca8f9b.png","type":"images","name":"daulet-turubayev-RAwn1QFwfss-unsplash.png","filename":"996fbcad74d59d1479b3fb6730ca8f9b.png","size":207506,"id":3,"createdAt":"2025-02-25T18:46:18.553Z","updatedAt":"2025-02-25T18:46:18.553Z","deletedAt":null,"isSystem":false}}}]	1
\.


--
-- Data for Name: pages_iblock_fields; Type: TABLE DATA; Schema: public; Owner: postgress
--

COPY public.pages_iblock_fields (id, "createdAt", "updatedAt", "deletedAt", name, slug, type, "iblockId") FROM stdin;
1	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Заголовок	title	text	1
2	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Список	list	array	1
3	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Ссылка	link	text	1
4	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Изоображение	image	image	1
5	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Заголовок	title	text	2
6	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Описание	description	text	2
7	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Заголовок	title	text	3
8	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Описание	description	text	3
9	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Телефон	phone	text	3
10	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Email	email	text	3
11	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Заголовок	title	text	4
12	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Описание	description	text	4
13	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Год	year	text	5
14	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Описание	description	text	5
15	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	ФИО	fio	text	6
16	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Должность	post	text	6
17	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Описание	description	text	6
18	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Изоображение	image	image	6
19	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Адрес	address	text	7
20	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Ссылка	link	text	7
21	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Общий телефон	general-phone	text	7
22	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Телефон отдела продаж	department-phone	text	7
23	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Телефон технической поддержки	technical-phone	text	7
24	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Общий email	general-email	text	7
25	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Email отдела продаж	department-email	text	7
26	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Email технической поддержки	technical-email	text	7
27	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Время работы	time-job	editor	7
28	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Заголовок	title	text	7
29	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Заголовок	title	text	8
30	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Описание	description	text	8
31	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Email для общих вопросов	general-email	text	9
32	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Email для партнеров	partners-email	text	9
33	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Email для клиентов	clients-email	text	9
34	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Email для прессы	press-emal	text	9
35	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Время работы	workin	editor	9
36	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Заголовок	title	text	10
37	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Описание1	description1	text	10
38	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Описание2	description2	text	10
39	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Список	list	array	10
40	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Файл	file	image	10
41	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Вопрос	question	text	11
42	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Описание	description	text	11
43	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Заголовок	title	text	12
44	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Телефон	phone	text	12
45	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Email	email	text	12
46	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Адрес	address	text	12
47	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	E-mail	email	text	13
48	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Телефон	phone	text	13
49	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Адрес главного офиса	address	text	13
50	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Контактное лицо	user	text	13
51	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Заголовок	title	text	13
52	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Название	title	text	14
53	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Местоположение	location	text	14
54	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Требования	requirements	array	14
55	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Обязанности	responsibilities	array	14
56	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Условия	conditions	array	14
57	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	ФИО	fio	text	15
58	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Должность	post	text	15
59	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Описание	description	text	15
60	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Изоображение	image	image	15
61	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Заголовок	title	text	16
62	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Телефон	phone	text	16
63	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Email	email	text	16
64	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Описание	description	text	16
65	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Доб. к телефону	code-phone	text	16
66	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Заголовок	title	text	17
67	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Описание	description	text	17
68	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Заголовок	title	text	18
69	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Описание	description	text	18
70	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Заголовок	title	text	19
71	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Описание	description	text	19
72	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Телефон	phone	text	19
73	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Адрес	address	text	19
74	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	E-mail	email	text	19
75	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Заголовок	title	text	20
76	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Описание	description	text	20
77	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Заголовок	title	text	21
78	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Описание	description	text	21
79	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Email	email	text	22
80	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Телефон	phone	text	22
81	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Адрес	address	text	22
82	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Email	email	text	23
83	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Телефон	phone	text	23
84	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Адрес	address	text	23
\.


--
-- Data for Name: pages_iblock_fields_label; Type: TABLE DATA; Schema: public; Owner: postgress
--

COPY public.pages_iblock_fields_label (id, "createdAt", "updatedAt", "deletedAt", value, lang, "fieldId") FROM stdin;
1	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Заголовок	ru-RU	1
2	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Title	zh-CN	1
3	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Title	en-US	1
4	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Список	ru-RU	2
5	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	List	en-US	2
6	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	List	zh-CN	2
7	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Ссылка	ru-RU	3
8	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Link	en-US	3
9	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Link	zh-CN	3
10	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Image	en-US	4
11	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Изоображение	ru-RU	4
12	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Image	zh-CN	4
13	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Заголовок	ru-RU	5
14	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Title	en-US	5
15	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Title	zh-CN	5
16	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Описание	ru-RU	6
17	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Description	zh-CN	6
18	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Description	en-US	6
19	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Заголовок	ru-RU	7
20	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Title	en-US	7
21	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Title	zh-CN	7
22	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Описание	ru-RU	8
23	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Description	en-US	8
24	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Description	zh-CN	8
25	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Телефон	ru-RU	9
26	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Phone	en-US	9
27	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Phone	zh-CN	9
28	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Email	ru-RU	10
29	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Email	en-US	10
30	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Email	zh-CN	10
31	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Заголовок	ru-RU	11
32	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Title	zh-CN	11
33	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Title	en-US	11
34	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Description	en-US	12
35	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Description	zh-CN	12
36	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Описание	ru-RU	12
37	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Год	ru-RU	13
38	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Year	en-US	13
39	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Year	zh-CN	13
40	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Описание	ru-RU	14
41	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Description	en-US	14
42	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Description	zh-CN	14
43	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	ФИО	ru-RU	15
44	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	FIO	en-US	15
45	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	FIO	zh-CN	15
46	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Должность	ru-RU	16
47	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Post	zh-CN	16
48	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Post	en-US	16
49	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Описание	ru-RU	17
50	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Description	en-US	17
51	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Description	zh-CN	17
52	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Изоображение	ru-RU	18
53	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Image	en-US	18
54	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Image	zh-CN	18
55	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Адрес	ru-RU	19
56	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Address	en-US	19
57	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	地址	zh-CN	19
58	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Посмотреть на карте Baidu Maps (https://map.baidu.com/)	ru-RU	20
59	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	View on Baidu Maps(https://map.baidu.com/)	en-US	20
60	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	查看在百度地图(https://map.baidu.com/)	zh-CN	20
61	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Общий	ru-RU	21
62	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	General	en-US	21
63	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	总机	zh-CN	21
64	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Отдел продаж	ru-RU	22
65	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Sales Department	en-US	22
66	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	销售部门	zh-CN	22
67	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Техническая поддержка	ru-RU	23
68	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	技术支持	zh-CN	23
69	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Technical Support	en-US	23
70	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Общий	ru-RU	24
71	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	General	en-US	24
72	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	总机	zh-CN	24
73	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Отдел продаж	ru-RU	25
74	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	销售部门	zh-CN	25
75	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Sales Department	en-US	25
76	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Техническая поддержка:	ru-RU	26
77	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Technical Support	en-US	26
78	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	技术支持	zh-CN	26
79	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Время работы	ru-RU	27
80	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Working hours	en-US	27
81	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	工作时间	zh-CN	27
82	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Заголовок	ru-RU	28
83	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Title	en-US	28
84	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	标题	zh-CN	28
85	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Заголовок	ru-RU	29
86	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Title	zh-CN	29
87	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Title	en-US	29
88	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Описание	ru-RU	30
89	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Description	en-US	30
90	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Description	zh-CN	30
91	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Email для общих вопросов	ru-RU	31
92	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Email for General Inquiries	en-US	31
93	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	一般问题邮箱	zh-CN	31
94	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Email for Partners	en-US	32
95	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	合作伙伴邮箱	zh-CN	32
96	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Email для партнеров	ru-RU	32
97	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Email для клиентов	ru-RU	33
98	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Email for Clients	en-US	33
99	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	客户邮箱	zh-CN	33
100	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Email для прессы	ru-RU	34
101	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Email for Press	en-US	34
102	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	新闻邮箱	zh-CN	34
103	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Working hourse	en-US	35
104	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	工作时间	zh-CN	35
105	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Время работы	ru-RU	35
106	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Заголовок	ru-RU	36
107	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Title	en-US	36
108	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Title	zh-CN	36
109	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Описание1	ru-RU	37
110	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Description1	en-US	37
111	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Description1	zh-CN	37
113	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Description2	zh-CN	38
112	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Описание2	ru-RU	38
114	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Description2	en-US	38
115	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Список	ru-RU	39
116	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	List	en-US	39
117	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	List	zh-CN	39
118	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	File	zh-CN	40
119	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	File	en-US	40
120	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Файл	ru-RU	40
121	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Вопрос	ru-RU	41
122	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Question	en-US	41
123	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Question	zh-CN	41
124	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Описание	ru-RU	42
125	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Description	en-US	42
126	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Description	zh-CN	42
127	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Заголовок	ru-RU	43
128	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Title	en-US	43
129	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Title	zh-CN	43
130	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Телефон	ru-RU	44
131	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Phone	en-US	44
132	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Phone	zh-CN	44
133	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Email	en-US	45
134	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Email	zh-CN	45
135	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Email	ru-RU	45
136	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Адрес	ru-RU	46
137	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Address	en-US	46
138	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Address	zh-CN	46
139	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	E-mail	ru-RU	47
140	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	E-mail	en-US	47
141	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	电子邮件	zh-CN	47
142	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Телефон	ru-RU	48
143	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	电话	zh-CN	48
144	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Phone	en-US	48
145	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Адрес главного офиса	ru-RU	49
146	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Main office address	en-US	49
147	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	总部地址	zh-CN	49
148	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Контактное лицо	ru-RU	50
149	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Contact person	en-US	50
150	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	联系人	zh-CN	50
151	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Title	en-US	51
152	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	标题	zh-CN	51
153	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Заголовок	ru-RU	51
154	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Название	ru-RU	52
155	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	标题	zh-CN	52
156	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Location	en-US	53
157	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Местоположение	ru-RU	53
158	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Title	en-US	52
159	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	地点	zh-CN	53
160	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Требования	ru-RU	54
161	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Requirements	en-US	54
162	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	要求	zh-CN	54
163	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Обязанности	ru-RU	55
164	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Responsibilities	en-US	55
165	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	职责	zh-CN	55
166	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Условия	ru-RU	56
167	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Conditions	en-US	56
168	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	条件	zh-CN	56
169	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	ФИО	ru-RU	57
170	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	FIO	en-US	57
171	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	FIO	zh-CN	57
172	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Должность	ru-RU	58
173	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Post	en-US	58
174	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Post	zh-CN	58
175	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Description	en-US	59
176	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Description	zh-CN	59
177	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Описание	ru-RU	59
178	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Изоображение	ru-RU	60
179	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Image	en-US	60
180	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Image	zh-CN	60
181	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Заголовок	ru-RU	61
182	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Title	en-US	61
183	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Title	zh-CN	61
184	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Телефон	ru-RU	62
185	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Phone	en-US	62
186	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Phone	zh-CN	62
187	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Email	ru-RU	63
188	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Email	zh-CN	63
189	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Email	en-US	63
190	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Описание	ru-RU	64
191	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Description	en-US	64
192	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Description	zh-CN	64
193	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Доб. к телефону	ru-RU	65
194	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Code Phone	zh-CN	65
195	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Code Phone	en-US	65
196	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Заголовок	ru-RU	66
197	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Title	en-US	66
198	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Title	zh-CN	66
199	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Описание	ru-RU	67
200	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Description	zh-CN	67
201	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Description	en-US	67
202	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Заголовок	ru-RU	68
203	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Title	en-US	68
204	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Title	zh-CN	68
205	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Описание	ru-RU	69
206	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Description	en-US	69
207	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Description	zh-CN	69
208	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Заголовок	ru-RU	70
209	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Title	en-US	70
210	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Title	zh-CN	70
211	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Описание	ru-RU	71
212	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Description	en-US	71
216	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Phone	zh-CN	72
213	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Description	zh-CN	71
215	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Phone	en-US	72
220	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	E-mail	ru-RU	74
214	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Телефон	ru-RU	72
217	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Address	en-US	73
221	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	E-mail	en-US	74
218	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Адрес	ru-RU	73
219	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Address	zh-CN	73
222	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	E-mail	zh-CN	74
223	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Заголовок	ru-RU	75
224	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Title	en-US	75
225	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Title	zh-CN	75
226	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Описание	ru-RU	76
227	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Description	zh-CN	76
228	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Description	en-US	76
229	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Заголовок	ru-RU	77
230	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Title	en-US	77
231	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Title	zh-CN	77
232	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Description	zh-CN	78
233	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Описание	ru-RU	78
234	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Description	en-US	78
235	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Email	ru-RU	79
236	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Email	en-US	79
237	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Email	zh-CN	79
238	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Телефон	ru-RU	80
239	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Phone	en-US	80
240	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Phone	zh-CN	80
241	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Адрес	ru-RU	81
242	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Address	en-US	81
243	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Address	zh-CN	81
244	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Email	ru-RU	82
245	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Email	en-US	82
246	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Email	zh-CN	82
247	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Телефон	ru-RU	83
248	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Phone	en-US	83
249	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Phone	zh-CN	83
250	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Адрес	ru-RU	84
251	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Address	zh-CN	84
252	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Address	en-US	84
\.


--
-- Data for Name: pages_iblock_records; Type: TABLE DATA; Schema: public; Owner: postgress
--

COPY public.pages_iblock_records (id, "createdAt", "updatedAt", "deletedAt", sort, "iblockId") FROM stdin;
1	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	0	1
2	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	1	1
3	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	2	1
4	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	3	1
5	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	4	1
6	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	0	2
7	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	0	3
8	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	0	4
9	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	0	5
10	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	1	5
11	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	2	5
12	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	3	5
13	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	4	5
14	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	0	6
15	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	1	6
16	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	2	6
17	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	0	7
18	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	1	7
19	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	2	7
20	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	3	7
21	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	0	8
22	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	0	9
23	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	0	10
24	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	1	10
27	2025-02-25 18:46:18.553	2025-02-27 18:40:17.437464	2025-02-27 18:40:17.437464	0	11
26	2025-02-25 18:46:18.553	2025-02-27 18:40:47.242189	2025-02-27 18:40:47.242189	1	11
25	2025-02-25 18:46:18.553	2025-02-27 18:42:35.947375	2025-02-27 18:42:35.947375	0	11
28	2025-02-25 18:46:18.553	2025-02-27 18:42:38.963802	2025-02-27 18:42:38.963802	1	11
29	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	0	11
30	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	1	11
31	2025-02-25 18:46:18.553	2025-02-27 18:44:31.097549	2025-02-27 18:44:31.097549	2	11
32	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	2	11
33	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	0	11
34	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	1	11
35	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	2	11
36	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	0	12
37	2025-02-25 18:46:18.553	2025-02-27 18:54:33.931224	\N	1	12
38	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	2	12
39	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	3	12
40	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	0	13
41	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	1	13
42	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	2	13
43	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	3	13
44	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	0	14
45	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	1	14
46	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	2	14
47	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	0	15
48	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	1	15
49	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	2	15
50	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	0	16
51	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	0	17
52	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	0	18
53	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	0	19
54	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	0	20
55	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	0	21
56	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	0	22
57	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	0	23
58	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	0	2
\.


--
-- Data for Name: pages_iblock_records_field; Type: TABLE DATA; Schema: public; Owner: postgress
--

COPY public.pages_iblock_records_field (id, "createdAt", "updatedAt", "deletedAt", "recordId", "fieldId") FROM stdin;
1	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	1	1
2	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	1	2
3	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	1	3
4	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	1	4
5	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	2	1
6	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	2	2
7	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	2	3
8	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	2	4
9	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	3	1
10	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	3	2
11	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	3	3
12	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	3	4
13	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	4	1
14	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	4	2
15	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	4	3
16	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	4	4
17	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	5	1
18	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	5	2
19	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	5	3
20	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	5	4
21	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	6	5
22	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	6	6
23	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	7	7
24	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	7	8
25	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	7	9
26	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	7	10
27	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	8	11
28	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	8	12
29	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	9	13
30	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	9	14
31	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	10	13
32	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	10	14
33	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	11	13
34	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	11	14
35	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	12	13
36	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	12	14
37	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	13	13
38	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	13	14
39	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	14	15
40	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	14	16
41	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	14	17
42	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	14	18
43	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	15	15
44	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	15	16
45	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	15	17
46	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	15	18
47	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	16	15
48	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	16	16
49	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	16	17
50	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	16	18
51	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	17	19
52	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	17	20
53	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	17	21
54	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	17	22
55	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	17	23
56	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	17	24
57	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	17	25
58	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	17	26
59	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	17	27
60	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	17	28
61	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	18	19
62	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	18	20
63	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	18	21
64	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	18	22
65	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	18	23
66	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	18	24
67	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	18	25
68	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	18	26
69	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	18	27
70	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	18	28
71	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	19	19
72	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	19	20
73	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	19	21
74	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	19	22
75	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	19	23
76	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	19	24
77	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	19	25
78	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	19	26
79	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	19	27
80	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	19	28
81	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	20	19
82	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	20	20
83	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	20	21
84	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	20	22
85	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	20	23
86	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	20	24
87	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	20	25
88	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	20	26
89	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	20	27
90	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	20	28
91	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	21	29
92	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	21	30
93	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	22	31
94	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	22	32
95	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	22	33
96	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	22	34
97	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	22	35
98	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	23	36
99	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	23	37
100	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	23	38
101	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	23	39
102	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	23	40
103	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	24	36
104	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	24	37
105	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	24	38
106	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	24	39
107	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	24	40
108	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	25	41
109	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	25	42
110	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	26	41
111	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	26	42
112	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	27	41
113	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	27	42
114	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	28	41
115	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	28	42
116	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	29	41
117	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	29	42
118	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	30	41
119	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	30	42
120	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	31	41
121	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	31	42
122	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	32	41
123	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	32	42
124	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	33	41
125	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	33	42
126	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	34	41
127	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	34	42
128	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	35	41
129	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	35	42
130	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	36	43
131	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	36	44
132	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	36	45
133	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	36	46
134	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	37	43
135	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	37	44
136	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	37	45
137	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	37	46
138	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	38	43
139	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	38	44
140	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	38	45
141	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	38	46
142	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	39	43
143	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	39	44
144	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	39	45
145	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	39	46
146	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	40	47
147	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	40	48
148	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	40	49
149	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	40	50
150	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	40	51
151	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	41	47
152	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	41	48
153	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	41	49
154	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	41	50
155	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	41	51
156	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	42	47
157	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	42	48
158	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	42	49
159	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	42	50
160	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	42	51
161	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	43	47
162	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	43	48
163	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	43	49
164	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	43	50
165	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	43	51
166	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	44	52
167	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	44	53
168	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	44	54
169	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	44	55
170	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	44	56
171	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	45	52
172	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	45	53
173	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	45	54
174	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	45	55
175	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	45	56
176	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	46	52
177	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	46	53
178	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	46	54
179	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	46	55
180	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	46	56
181	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	47	57
182	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	47	58
183	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	47	59
184	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	47	60
185	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	48	57
186	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	48	58
187	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	48	59
188	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	48	60
189	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	49	57
190	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	49	58
191	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	49	59
192	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	49	60
193	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	50	61
194	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	50	62
195	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	50	63
196	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	50	64
197	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	50	65
198	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	51	66
199	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	51	67
200	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	52	68
201	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	52	69
202	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	53	70
203	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	53	71
204	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	53	72
205	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	53	73
206	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	53	74
207	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	54	75
208	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	54	76
209	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	55	77
210	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	55	78
211	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	56	79
212	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	56	80
213	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	56	81
214	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	57	82
215	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	57	83
216	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	57	84
217	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	58	5
218	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	58	6
\.


--
-- Data for Name: pages_iblock_records_field_value; Type: TABLE DATA; Schema: public; Owner: postgress
--

COPY public.pages_iblock_records_field_value (id, "createdAt", "updatedAt", "deletedAt", value, lang, "recordFieldId") FROM stdin;
1	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Строительное оборудование	ru-RU	1
2	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	建筑设备	zh-CN	1
3	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Construction Equipment	en-US	1
4	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Бетонные заводы;Смесительные системы;Бетоносмесители	ru-RU	2
5	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Concrete Plants;Mixing Systems;Concrete Mixers	en-US	2
6	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	混凝土搅拌站;混合系统;混凝土搅拌机	zh-CN	2
7	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	/	ru-RU	3
8	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	/	en-US	3
9	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	/	zh-CN	3
10	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	{"path":"http://cloud.andreyi96.beget.tech:9000/cms/bcb485d608f4e6a9fa07466d506b9f7b.png","type":"images","name":"DALLÂ·E 2024-09-20 00.51.38 1.png","filename":"bcb485d608f4e6a9fa07466d506b9f7b.png","size":533239,"id":4,"createdAt":"2025-02-25T18:46:18.553Z","updatedAt":"2025-02-25T18:46:18.553Z","deletedAt":null,"isSystem":false}	en-US	4
11	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	{"path":"http://cloud.andreyi96.beget.tech:9000/cms/bcb485d608f4e6a9fa07466d506b9f7b.png","type":"images","name":"DALLÂ·E 2024-09-20 00.51.38 1.png","filename":"bcb485d608f4e6a9fa07466d506b9f7b.png","size":533239,"id":4,"createdAt":"2025-02-25T18:46:18.553Z","updatedAt":"2025-02-25T18:46:18.553Z","deletedAt":null,"isSystem":false}	ru-RU	4
12	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	{"path":"http://cloud.andreyi96.beget.tech:9000/cms/bcb485d608f4e6a9fa07466d506b9f7b.png","type":"images","name":"DALLÂ·E 2024-09-20 00.51.38 1.png","filename":"bcb485d608f4e6a9fa07466d506b9f7b.png","size":533239,"id":4,"createdAt":"2025-02-25T18:46:18.553Z","updatedAt":"2025-02-25T18:46:18.553Z","deletedAt":null,"isSystem":false}	zh-CN	4
13	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Дорожное оборудование	ru-RU	5
14	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	道路設備	zh-CN	5
15	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Road equipment	en-US	5
16	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Асфальтовые заводы;Дорожные катки;Фрезы	ru-RU	6
17	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Asphalt plants;Road rollers;Milling cutters	en-US	6
18	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	瀝青廠;壓路機;銑刀	zh-CN	6
19	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	/	ru-RU	7
20	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	/	en-US	7
21	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	/	zh-CN	7
22	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	{"path":"http://cloud.andreyi96.beget.tech:9000/cms/270de414d4609e9921623fddb34f905e.png","type":"images","name":"DALLÂ·E 2024-09-20 00.51.38 1.png","filename":"270de414d4609e9921623fddb34f905e.png","size":566808,"id":6,"createdAt":"2025-02-25T18:46:18.553Z","updatedAt":"2025-02-25T18:46:18.553Z","deletedAt":null,"isSystem":false}	en-US	8
23	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	{"path":"http://cloud.andreyi96.beget.tech:9000/cms/270de414d4609e9921623fddb34f905e.png","type":"images","name":"DALLÂ·E 2024-09-20 00.51.38 1.png","filename":"270de414d4609e9921623fddb34f905e.png","size":566808,"id":6,"createdAt":"2025-02-25T18:46:18.553Z","updatedAt":"2025-02-25T18:46:18.553Z","deletedAt":null,"isSystem":false}	ru-RU	8
24	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	{"path":"http://cloud.andreyi96.beget.tech:9000/cms/270de414d4609e9921623fddb34f905e.png","type":"images","name":"DALLÂ·E 2024-09-20 00.51.38 1.png","filename":"270de414d4609e9921623fddb34f905e.png","size":566808,"id":6,"createdAt":"2025-02-25T18:46:18.553Z","updatedAt":"2025-02-25T18:46:18.553Z","deletedAt":null,"isSystem":false}	zh-CN	8
25	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Металлургическое оборудование	ru-RU	9
26	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	冶金設備	zh-CN	9
27	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Metallurgical equipment	en-US	9
28	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Плавильные печи;Прокатные станы;Обрабатывающие центры	ru-RU	10
29	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Smelting furnaces;Rolling mills;Machining centers	en-US	10
30	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	熔化爐;軋機;加工中心	zh-CN	10
31	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	/	ru-RU	11
32	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	/	en-US	11
33	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	/	zh-CN	11
34	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	{"path":"http://cloud.andreyi96.beget.tech:9000/cms/b66aa2f3800efcb5969fc3933b4e6291.png","type":"images","name":"DALLÂ·E 2024-09-20 00.51.38 1.png","filename":"b66aa2f3800efcb5969fc3933b4e6291.png","size":645353,"id":7,"createdAt":"2025-02-25T18:46:18.553Z","updatedAt":"2025-02-25T18:46:18.553Z","deletedAt":null,"isSystem":false}	en-US	12
35	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	{"path":"http://cloud.andreyi96.beget.tech:9000/cms/b66aa2f3800efcb5969fc3933b4e6291.png","type":"images","name":"DALLÂ·E 2024-09-20 00.51.38 1.png","filename":"b66aa2f3800efcb5969fc3933b4e6291.png","size":645353,"id":7,"createdAt":"2025-02-25T18:46:18.553Z","updatedAt":"2025-02-25T18:46:18.553Z","deletedAt":null,"isSystem":false}	ru-RU	12
36	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	{"path":"http://cloud.andreyi96.beget.tech:9000/cms/b66aa2f3800efcb5969fc3933b4e6291.png","type":"images","name":"DALLÂ·E 2024-09-20 00.51.38 1.png","filename":"b66aa2f3800efcb5969fc3933b4e6291.png","size":645353,"id":7,"createdAt":"2025-02-25T18:46:18.553Z","updatedAt":"2025-02-25T18:46:18.553Z","deletedAt":null,"isSystem":false}	zh-CN	12
37	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Горнодобывающее оборудование	ru-RU	13
38	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	礦山設備	zh-CN	13
39	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Mining equipment	en-US	13
40	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Дробильные установки;Конвейерные системы;Обогатительное оборудование	ru-RU	14
41	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Crushing plants;Conveyor systems;Mineral processing equipment	en-US	14
42	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	破碎設備;輸送系統;加工設備	zh-CN	14
43	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	/	ru-RU	15
44	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	/	en-US	15
45	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	/	zh-CN	15
46	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	{"path":"http://cloud.andreyi96.beget.tech:9000/cms/c17d994bb918cf12d0eaa40c6f08f4b4.png","type":"images","name":"DALLÂ·E 2024-09-20 00.51.38 1.png","filename":"c17d994bb918cf12d0eaa40c6f08f4b4.png","size":444181,"id":8,"createdAt":"2025-02-25T18:46:18.553Z","updatedAt":"2025-02-25T18:46:18.553Z","deletedAt":null,"isSystem":false}	en-US	16
47	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	{"path":"http://cloud.andreyi96.beget.tech:9000/cms/c17d994bb918cf12d0eaa40c6f08f4b4.png","type":"images","name":"DALLÂ·E 2024-09-20 00.51.38 1.png","filename":"c17d994bb918cf12d0eaa40c6f08f4b4.png","size":444181,"id":8,"createdAt":"2025-02-25T18:46:18.553Z","updatedAt":"2025-02-25T18:46:18.553Z","deletedAt":null,"isSystem":false}	ru-RU	16
96	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	启动了叉车和输送带的自有生产线，扩展了产品线。	zh-CN	32
97	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	2022	ru-RU	33
98	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	2022	en-US	33
48	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	{"path":"http://cloud.andreyi96.beget.tech:9000/cms/c17d994bb918cf12d0eaa40c6f08f4b4.png","type":"images","name":"DALLÂ·E 2024-09-20 00.51.38 1.png","filename":"c17d994bb918cf12d0eaa40c6f08f4b4.png","size":444181,"id":8,"createdAt":"2025-02-25T18:46:18.553Z","updatedAt":"2025-02-25T18:46:18.553Z","deletedAt":null,"isSystem":false}	zh-CN	16
49	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Пищевое оборудование	ru-RU	17
50	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	食品設備	zh-CN	17
51	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Food equipment	en-US	17
52	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Линии для производства пищевых продуктов;Упаковочные машины	ru-RU	18
53	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Food production lines;Packaging machines	en-US	18
54	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	食品生產線;包裝機	zh-CN	18
55	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	/	ru-RU	19
56	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	/	en-US	19
57	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	/	zh-CN	19
58	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	{"path":"http://cloud.andreyi96.beget.tech:9000/cms/3cd4084c1e97b44c01d56dcfc9778f3b.png","type":"images","name":"DALLÂ·E 2024-09-20 00.51.38 1.png","filename":"3cd4084c1e97b44c01d56dcfc9778f3b.png","size":548330,"id":9,"createdAt":"2025-02-25T18:46:18.553Z","updatedAt":"2025-02-25T18:46:18.553Z","deletedAt":null,"isSystem":false}	en-US	20
59	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	{"path":"http://cloud.andreyi96.beget.tech:9000/cms/3cd4084c1e97b44c01d56dcfc9778f3b.png","type":"images","name":"DALLÂ·E 2024-09-20 00.51.38 1.png","filename":"3cd4084c1e97b44c01d56dcfc9778f3b.png","size":548330,"id":9,"createdAt":"2025-02-25T18:46:18.553Z","updatedAt":"2025-02-25T18:46:18.553Z","deletedAt":null,"isSystem":false}	ru-RU	20
60	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	{"path":"http://cloud.andreyi96.beget.tech:9000/cms/3cd4084c1e97b44c01d56dcfc9778f3b.png","type":"images","name":"DALLÂ·E 2024-09-20 00.51.38 1.png","filename":"3cd4084c1e97b44c01d56dcfc9778f3b.png","size":548330,"id":9,"createdAt":"2025-02-25T18:46:18.553Z","updatedAt":"2025-02-25T18:46:18.553Z","deletedAt":null,"isSystem":false}	zh-CN	20
67	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	SA INTERNATIONAL	ru-RU	23
68	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	SA INTERNATIONAL	en-US	23
69	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	上海亚际机电有限公司	zh-CN	23
71	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Your Guide to Innovative Industrial Solutions	en-US	24
72	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	—— 您的创新工业解决方案引导者	zh-CN	24
73	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	+86-21-5432-2755	ru-RU	25
74	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	+86-21-5432-2755	en-US	25
75	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	+86-21-5432-2755	zh-CN	25
76	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	info@inter-sa.com	ru-RU	26
77	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	info@inter-sa.com	en-US	26
78	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	info@inter-sa.com	zh-CN	26
70	2025-02-25 18:46:18.553	2025-02-27 17:33:34.337938	\N	— Ваш проводник в мире инновационных промышленных решений +86-21-5432-2755	ru-RU	24
79	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	История компании	ru-RU	27
84	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Основанная в 2020 году, компания SA International (上海亚际机电有限公司) начала свой путь как часть SIBC Group, фокусируясь на предоставлении консалтинговых услуг и подборе промышленного оборудования для различных отраслей. Наша цель с самого начала заключалась в том, чтобы стать надежным партнером для предприятий по всему миру, предлагая инновационные решения и высокий уровень сервиса.	ru-RU	28
81	2025-02-25 18:46:18.553	2025-02-27 17:36:29.138475	\N	Company History	en-US	27
80	2025-02-25 18:46:18.553	2025-02-27 17:36:29.143593	\N	公司历史	zh-CN	27
82	2025-02-25 18:46:18.553	2025-02-27 17:36:29.147884	\N	Founded in 2020, SA International (上海亚际机电有限公司) began its journey as part of SIBC Group, focusing on providing consulting services and selecting industrial equipment for various industries. From the very start, our goal has been to become a reliable partner for businesses worldwide, offering innovative solutions and high-quality service.	en-US	28
83	2025-02-25 18:46:18.553	2025-02-27 17:36:29.150582	\N	上海亚际机电有限公司成立于2020年，起初作为SIBC集团的一部分，专注于为各行业提供咨询服务和工业设备选型。自公司成立以来，我们的目标是成为全球企业的可靠合作伙伴，提供创新解决方案和高质量服务。	zh-CN	28
85	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	2020	ru-RU	29
86	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	2020	en-US	29
87	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	2020年	zh-CN	29
88	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	ОСНОВАНИЕ SA INTERNATIONAL B COCTABE SIBC GROUP В ШАНХАЕ. ОТКРЫТИЕ ПЕРВОГО ЗАРУБЕЖНОГО ОФИСА В БЛАГОВЕЩЕНСКЕ, РОССИЯ, ЧТО ПОЗВОЛИЛО НАМ УКРЕПИТЬ ПОЗИЦИИ НА РЫНКЕ СНГ.	ru-RU	30
89	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Establishment of SA International as part of SIBC Group in Shanghai. Opening of the first overseas office in Blagoveshchensk, Russia, strengthening our position in the CIS market.	en-US	30
90	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	上海亚际机电有限公司在上海作为SIBC集团的一部分成立，并开设了首个海外办事处——位于俄罗斯布拉戈维申斯克的办事处，巩固了我们在独联体市场的地位。	zh-CN	30
91	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	2021	ru-RU	31
92	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	2021	en-US	31
93	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	2021年	zh-CN	31
94	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	ЗАПУСК СОБСТВЕННОГО ПРОИЗВОДСТВА ВИЛОЧНЫХ ПОГРУЗЧИКОВ И КОНВЕЙЕРНЫХ ЛЕНТ, РАСШИРЕНИЕ ПРОДУКТОВОЙ ЛИНЕЙКИ.	ru-RU	32
95	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Launch of in-house production of forklifts and conveyor belts, expanding the product line.	en-US	32
62	2025-02-25 18:46:18.553	2025-02-28 05:54:10.861049	\N	Creation of a Barter Exchange	en-US	21
63	2025-02-25 18:46:18.553	2025-02-28 05:54:10.864602	\N	建立易货交易平台	zh-CN	21
66	2025-02-25 18:46:18.553	2025-02-28 05:54:10.871663	\N	Together with leading companies, we have invested in developing an innovative barter exchange, enabling businesses to efficiently trade goods and services.	en-US	22
65	2025-02-25 18:46:18.553	2025-02-28 05:54:10.874927	\N	与领先企业合作，我们投资开发创新的易货交易平台， 使企业能够高效交换商品与服务。	zh-CN	22
99	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	2022年	zh-CN	33
100	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	НАЧАЛО ВНЕДРЕНИЯ ИННОВАЦИОННЫХ ТЕХНОЛОГИЙ С ИСПОЛЬЗОВАНИЕМ ИСКУССТВЕННОГО ИНТЕЛЛЕКТА В ПРОИЗВОДСТВЕННЫЕ ПРОЦЕССЫ.	ru-RU	34
101	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Introduction of innovative technologies using artificial intelligence in production processes.	en-US	34
102	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	开始在生产过程中引入人工智能技术，推动创新技术的应用。	zh-CN	34
103	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	2023	ru-RU	35
104	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	2023	en-US	35
105	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	2023年	zh-CN	35
106	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	УЧАСТИЕ В ВОСТОЧНОМ ЭКОНОМИЧЕСКОМ ФОРУМЕ. ПОДПИСАНИЕ ДОГОВОРОВ С ПРАВИТЕЛЬСТВОМ РОССИЙСКОЙ ФЕДЕРАЦИИ О СТРОИТЕЛЬСТВЕ ЗАВОДА ПО ПРОИЗВОДСТВУ ПОРТОВОГО ОБОРУДОВАНИЯ.	ru-RU	36
107	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Participation in the Eastern Economic Forum. Signing agreements with the Russian Federation government to build a plant for port equipment manufacturing.	en-US	36
108	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	参加了东方经济论坛，并与俄罗斯联邦政府签署了建设港口设备生产厂的协议。	zh-CN	36
109	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	2024	ru-RU	37
110	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	2024	en-US	37
111	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	2024年	zh-CN	37
112	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	СОЗДАНИЕ БАРТЕРНОЙ БИРЖИ СОВМЕСТНО С ПАРТНЕРАМИ, ИНВЕСТИЦИИ В РАЗМЕРЕ 5 МЛН ЮАНЕЙ ДЛЯ РАЗВИТИЯ ПРОЕКТА. ПОДГОТОВКА К СТРОИТЕЛЬСТВУ ЗАВОДА ПО ПРОИЗВОДСТВУ РОБОТИЗИРОВАННЫХ РУК В РОССИИ С ЦЕЛЬЮ ПОЛНОЙ ЛОКАЛИЗАЦИИ ПРОИЗВОДСТВА К 2028 ГОДУ. РАСШИРЕНИЕ МЕЖДУНАРОДНОГО ПРИСУТСТВИЯ, ПЛАНИРОВАНИЕ ОТКРЫТИЯ ОФИСОВ В МОСКВЕ И КРЫМУ, УВЕЛИЧЕНИЕ ШТАТА СОТРУДНИКОВ ДО 50 ЧЕЛОВЕК. ОТКРЫТИЕ ОФИСОВ В ГОНКОНГЕ И ИУ.	ru-RU	38
113	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Creation of a barter exchange in partnership with stakeholders, investing 5 million yuan to develop the project. Preparation for the construction of a robotic arm manufacturing plant in Russia with full localization planned by 2028. Expansion of international presence with plans to open offices in Moscow and Crimea, increasing the team to 50 employees. Opening new offices in Hong Kong and Yiwu.	en-US	38
114	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	与合作伙伴共同建立了商品交换市场，投资500万元人民币发展该项目，计划于2028年在俄罗斯建设机器人手臂生产厂，实现生产完全本地化。同时，扩大国际业务，计划在莫斯科和克里米亚开设办事处，员工人数将增至50人。并在香港和义乌开设新办事处。	zh-CN	38
115	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	КУРОЕДОВ ЕВГЕНИЙ	ru-RU	39
116	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Evgeny Kuroedov	en-US	39
117	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	孔恩丰	zh-CN	39
118	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Генеральный директор	ru-RU	40
119	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	总经理	zh-CN	40
120	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	General Director	en-US	40
121	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Более 10 лет опыта в управлении международными проектами и стратегическом развитии	ru-RU	41
122	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Over 10 years of experience in managing international projects and strategic development.	en-US	41
123	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	拥有超过10年国际项目管理和战略发展经验	zh-CN	41
127	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	ДУДНИК ИГОРЬ	ru-RU	43
128	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Igor Dudnik	en-US	43
129	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	伊戈尔	zh-CN	43
130	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Операционный директор	ru-RU	44
131	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	运营长	zh-CN	44
132	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Operations Director	en-US	44
133	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Эксперт в области инновационных технологий с опытом работы в ведущих мировых компаниях	ru-RU	45
134	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Expert in innovative technologies with experience in leading global companies.	en-US	45
135	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	创新技术专家，曾在全球领先企业工作	zh-CN	45
136	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	{"path":"http://cloud.andreyi96.beget.tech:9000/cms/7718065781f3ed643cfc2f16136c893a.png","type":"images","name":"jonas-kakaroto-KIPqvvTOC1s-unsplash.png","filename":"7718065781f3ed643cfc2f16136c893a.png","size":391276,"id":10,"createdAt":"2025-02-25T18:46:18.553Z","updatedAt":"2025-02-25T18:46:18.553Z","deletedAt":null,"isSystem":false}	ru-RU	46
137	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	{"path":"http://cloud.andreyi96.beget.tech:9000/cms/7718065781f3ed643cfc2f16136c893a.png","type":"images","name":"jonas-kakaroto-KIPqvvTOC1s-unsplash.png","filename":"7718065781f3ed643cfc2f16136c893a.png","size":391276,"id":10,"createdAt":"2025-02-25T18:46:18.553Z","updatedAt":"2025-02-25T18:46:18.553Z","deletedAt":null,"isSystem":false}	en-US	46
138	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	{"path":"http://cloud.andreyi96.beget.tech:9000/cms/7718065781f3ed643cfc2f16136c893a.png","type":"images","name":"jonas-kakaroto-KIPqvvTOC1s-unsplash.png","filename":"7718065781f3ed643cfc2f16136c893a.png","size":391276,"id":10,"createdAt":"2025-02-25T18:46:18.553Z","updatedAt":"2025-02-25T18:46:18.553Z","deletedAt":null,"isSystem":false}	zh-CN	46
124	2025-02-25 18:46:18.553	2025-02-27 17:47:17.557208	\N	{"path":"http://cloud.andreyi96.beget.tech:9000/cms/77f24146d9f7ecab201cf9be464dce3d.png","type":"images","name":"jonas-kakaroto-KIPqvvTOC1s-unsplash.png","filename":"77f24146d9f7ecab201cf9be464dce3d.png","size":391276,"id":11,"createdAt":"2025-02-25T18:46:18.553Z","updatedAt":"2025-02-25T18:46:18.553Z","deletedAt":null,"isSystem":false}	ru-RU	42
125	2025-02-25 18:46:18.553	2025-02-27 17:47:17.563938	\N	{"path":"http://cloud.andreyi96.beget.tech:9000/cms/77f24146d9f7ecab201cf9be464dce3d.png","type":"images","name":"jonas-kakaroto-KIPqvvTOC1s-unsplash.png","filename":"77f24146d9f7ecab201cf9be464dce3d.png","size":391276,"id":11,"createdAt":"2025-02-25T18:46:18.553Z","updatedAt":"2025-02-25T18:46:18.553Z","deletedAt":null,"isSystem":false}	en-US	42
126	2025-02-25 18:46:18.553	2025-02-27 17:47:17.569751	\N	{"path":"http://cloud.andreyi96.beget.tech:9000/cms/77f24146d9f7ecab201cf9be464dce3d.png","type":"images","name":"jonas-kakaroto-KIPqvvTOC1s-unsplash.png","filename":"77f24146d9f7ecab201cf9be464dce3d.png","size":391276,"id":11,"createdAt":"2025-02-25T18:46:18.553Z","updatedAt":"2025-02-25T18:46:18.553Z","deletedAt":null,"isSystem":false}	zh-CN	42
139	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	ГАВРИЛОВ ДМИТРИЙ	ru-RU	47
140	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Dmitry Gavrilov	en-US	47
141	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	黄海睿	zh-CN	47
142	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Директор по развитию бизнеса	ru-RU	48
143	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	开发总监	zh-CN	48
144	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Business Development Director	en-US	48
145	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Специалист по международным рынкам и построению эффективных партнерских отношений	ru-RU	49
146	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Specialist in international markets and building effective partnerships.	en-US	49
147	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	国际市场和有效合作伙伴关系建设专家	zh-CN	49
148	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	{"path":"http://cloud.andreyi96.beget.tech:9000/cms/a011ec9cc35d9c1258f5ffeb6adfe342.png","type":"images","name":"jonas-kakaroto-KIPqvvTOC1s-unsplash.png","filename":"a011ec9cc35d9c1258f5ffeb6adfe342.png","size":391276,"id":12,"createdAt":"2025-02-25T18:46:18.553Z","updatedAt":"2025-02-25T18:46:18.553Z","deletedAt":null,"isSystem":false}	ru-RU	50
149	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	{"path":"http://cloud.andreyi96.beget.tech:9000/cms/a011ec9cc35d9c1258f5ffeb6adfe342.png","type":"images","name":"jonas-kakaroto-KIPqvvTOC1s-unsplash.png","filename":"a011ec9cc35d9c1258f5ffeb6adfe342.png","size":391276,"id":12,"createdAt":"2025-02-25T18:46:18.553Z","updatedAt":"2025-02-25T18:46:18.553Z","deletedAt":null,"isSystem":false}	en-US	50
150	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	{"path":"http://cloud.andreyi96.beget.tech:9000/cms/a011ec9cc35d9c1258f5ffeb6adfe342.png","type":"images","name":"jonas-kakaroto-KIPqvvTOC1s-unsplash.png","filename":"a011ec9cc35d9c1258f5ffeb6adfe342.png","size":391276,"id":12,"createdAt":"2025-02-25T18:46:18.553Z","updatedAt":"2025-02-25T18:46:18.553Z","deletedAt":null,"isSystem":false}	zh-CN	50
151	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Китай, г. Шанхай, район Миньхан, улица Синьцзюньхуань, дом 115, корпус 1, офисы 503-505	ru-RU	51
152	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	China, Shanghai, Minhang District, Xinjunhuan Street, Building 115, Unit 1, Offices 503–505	en-US	51
153	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	中国上海市闵行区新骏环路115号1号楼503-505办公室	zh-CN	51
154	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	https://map.baidu.com/	ru-RU	52
155	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	https://map.baidu.com/	en-US	52
156	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	https://map.baidu.com/	zh-CN	52
157	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	+86 (021) 5432 2755	ru-RU	53
158	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	+86 (021) 5432 2755	en-US	53
159	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	+86 (021) 5432 2755	zh-CN	53
160	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	+86 (021) 5432 2755 (ext. 813)	ru-RU	54
161	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	+86 (021) 5432 2755 (ext. 813)	en-US	54
162	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	+86 (021) 5432 2755 (分机813)	zh-CN	54
163	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	+86 (021) 5432 2755 (ext. 804)	ru-RU	55
164	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	+86 (021) 5432 2755 (分机804)	zh-CN	55
165	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	+86 (021) 5432 2755 (ext. 804)	en-US	55
166	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	info@inter-sa.com	ru-RU	56
167	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	info@inter-sa.com	en-US	56
168	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	info@inter-sa.com	zh-CN	56
169	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	sales@inter-sa.com	ru-RU	57
170	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	sales@inter-sa.com	zh-CN	57
171	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	sales@inter-sa.com	en-US	57
172	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	support@inter-sa.com	ru-RU	58
173	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	support@inter-sa.com	en-US	58
174	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	support@inter-sa.com	zh-CN	58
178	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	ШАНХАЙ (ГЛАВНЫЙ ОФИС)	ru-RU	60
179	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	SHANGHAI (MAIN OFFICE)	en-US	60
180	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	上海（总部） 	zh-CN	60
181	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N		ru-RU	61
182	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N		en-US	61
183	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N		zh-CN	61
184	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N		ru-RU	62
185	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N		en-US	62
186	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N		zh-CN	62
187	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N		ru-RU	63
188	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N		en-US	63
189	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N		zh-CN	63
190	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N		ru-RU	64
191	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N		en-US	64
192	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N		zh-CN	64
193	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N		ru-RU	65
194	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N		zh-CN	65
195	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N		en-US	65
196	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N		ru-RU	66
197	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N		en-US	66
198	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N		zh-CN	66
199	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N		ru-RU	67
200	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N		zh-CN	67
201	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N		en-US	67
202	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N		ru-RU	68
203	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N		en-US	68
204	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N		zh-CN	68
205	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N		ru-RU	69
206	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N		en-US	69
207	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N		zh-CN	69
208	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	ИУ	ru-RU	70
209	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Yiwu	en-US	70
210	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	义乌 	zh-CN	70
211	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N		ru-RU	71
212	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N		en-US	71
213	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N		zh-CN	71
214	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N		ru-RU	72
215	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N		en-US	72
216	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N		zh-CN	72
217	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N		ru-RU	73
218	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N		en-US	73
219	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N		zh-CN	73
220	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N		ru-RU	74
221	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N		en-US	74
222	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N		zh-CN	74
223	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N		ru-RU	75
224	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N		zh-CN	75
225	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N		en-US	75
226	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N		ru-RU	76
227	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N		en-US	76
228	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N		zh-CN	76
229	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N		ru-RU	77
230	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N		zh-CN	77
231	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N		en-US	77
232	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N		ru-RU	78
233	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N		en-US	78
234	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N		zh-CN	78
235	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N		ru-RU	79
236	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N		en-US	79
237	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N		zh-CN	79
238	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	ГОНКОНГ	ru-RU	80
239	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Hong Kong	en-US	80
240	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	香港 	zh-CN	80
241	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N		ru-RU	81
242	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N		en-US	81
243	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N		zh-CN	81
244	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N		ru-RU	82
245	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N		en-US	82
246	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N		zh-CN	82
247	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N		ru-RU	83
248	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N		en-US	83
249	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N		zh-CN	83
250	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N		ru-RU	84
251	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N		en-US	84
252	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N		zh-CN	84
253	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N		ru-RU	85
254	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N		zh-CN	85
255	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N		en-US	85
256	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N		ru-RU	86
257	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N		en-US	86
258	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N		zh-CN	86
259	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N		ru-RU	87
260	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N		zh-CN	87
261	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N		en-US	87
262	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N		ru-RU	88
263	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N		en-US	88
264	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N		zh-CN	88
265	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N		ru-RU	89
266	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N		en-US	89
267	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N		zh-CN	89
268	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	БЛАГОВЕЩЕНСК	ru-RU	90
269	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Blagoveshchensk	en-US	90
270	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	布拉戈维申斯克	zh-CN	90
271	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	СОЦИАЛЬНЫЕ СЕТИ	ru-RU	91
272	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	社交媒体	zh-CN	91
273	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	SOCIAL MEDIA	en-US	91
274	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Следите за последними новостями и обновлениями, подписывайтесь на наши официальные страницы в социальных сетях	ru-RU	92
275	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Follow us for the latest news and updates on our official social media pages.	en-US	92
276	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	关注我们的最新消息和更新，订阅我们的官方社交媒体页面	zh-CN	92
277	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	INFO@INTER-SA.COM	ru-RU	93
278	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	info@inter-sa.com	en-US	93
279	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	info@inter-sa.com	zh-CN	93
280	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	partners@inter-sa.com	en-US	94
281	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	partners@inter-sa.com	zh-CN	94
282	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	PARTNERS@INTER-SA.COM	ru-RU	94
283	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	SUPPORT@INTER-SA.COM	ru-RU	95
284	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	support@inter-sa.com	en-US	95
285	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	support@inter-sa.com	zh-CN	95
286	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	PRESS@INTER-SA.COM	ru-RU	96
287	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	press@inter-sa.com	en-US	96
288	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	press@inter-sa.com	zh-CN	96
292	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Политика конфиденциальности	ru-RU	98
295	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Политика конфиденциальности описывает, какие данные мы собираем, как мы их используем, храним и защищаем	ru-RU	99
298	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Мы стремимся обеспечить безопасность вашей персональной информации и соблюдать все применимые законы и нормативные акты в области защиты данных	ru-RU	100
293	2025-02-25 18:46:18.553	2025-02-27 18:15:30.237075	\N	Privacy Policy	en-US	98
294	2025-02-25 18:46:18.553	2025-02-27 18:15:30.240097	\N	隐私政策	zh-CN	98
296	2025-02-25 18:46:18.553	2025-02-27 18:15:30.249665	\N	Our Privacy Policy explains what data we collect, how we use, store, and protect it.	en-US	99
297	2025-02-25 18:46:18.553	2025-02-27 18:15:30.303871	\N	隐私政策描述了我们收集哪些数据、如何使用、存储以及保护这些数据。	zh-CN	99
300	2025-02-25 18:46:18.553	2025-02-27 18:15:30.307009	\N	We are committed to safeguarding your personal information and adhering to all applicable data protection laws and regulations.	en-US	100
299	2025-02-25 18:46:18.553	2025-02-27 18:15:30.309732	\N	我们致力于确保您的个人信息安全，并遵守所有适用的数据保护法律和法规。	zh-CN	100
291	2025-02-25 18:46:18.553	2025-02-27 18:34:18.436757	\N	<p>ПОНЕДЕЛЬНИК - ПЯТНИЦА: 9:00 - 18:00</p><p>СУББОТА: 10:00 - 16:00 (ТОЛЬКО ГЛАВНЫЙ ОФИС)</p><p>ВОСКРЕСЕНЬЕ: ВЫХОДНОЙ</p>	ru-RU	97
303	2025-02-25 18:46:18.553	2025-02-27 18:27:39.893341	\N	信息收集和使用： 我们在您访问网站或使用服务时收集哪些数据及其用途。;Cookie 和类似技术： 我们如何使用 Cookie 改善网站的使用体验。;向第三方传递数据： 我们在何种条件下会将您的数据传递给合作伙伴和服务商。;数据安全： 保护您的信息免遭未经授权访问的措施。;用户权利： 如何管理、更新或删除您的数据。;政策变更：我们如何通知您隐私政策的变更。;联系信息：如何就隐私相关问题与我们联系。	zh-CN	101
304	2025-02-25 18:46:18.553	2025-02-27 18:27:39.90581	\N	{"path":"http://cloud.andreyi96.beget.tech:9000/cms/c7b190264abed1f1d6285b9fb577110b.docx","type":"docs","name":"policy.docx","filename":"c7b190264abed1f1d6285b9fb577110b.docx","size":7525,"id":14,"createdAt":"2025-02-25T18:46:18.553Z","updatedAt":"2025-02-25T18:46:18.553Z","deletedAt":null,"isSystem":false}	zh-CN	102
289	2025-02-25 18:46:18.553	2025-02-27 18:34:18.443832	\N	<p>Monday – Friday: 9:00 AM – 6:00 PM</p><p>Saturday: 10:00 AM – 4:00 PM (Main Office Only)</p><p>Sunday: Closed</p>	en-US	97
290	2025-02-25 18:46:18.553	2025-02-27 18:34:18.446598	\N	<p>周一 - 周五：9:00 - 18:00</p><p>周六：10:00 - 16:00（仅限总部）</p><p>周日：休息</p>	zh-CN	97
357	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N		zh-CN	119
364	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Какова средняя продолжительность доставки?	ru-RU	122
365	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	What is the average delivery time?	en-US	122
301	2025-02-25 18:46:18.553	2025-02-27 18:27:39.880574	\N	Сбор и использование информации: какие  какие данные мы собираем при посещении нашего сайта или использования услуг, и с  какой целью. ;Файлы cookie и аналогичные технологии: как  мы используем файлы cookie для улучшения  работы сайта;Передача данных третьим лицам: условия, при которых мы можем передавать ваши данные партнерам и сервисам. ;Безопасность данных: меры, приемняемые для  защиты ващей информации от  несанкционированного доступа;Права пользователей: как вы можете управлять своими данными, обновлять или удалять их;Изменения в политике: как мы будем  информировать вас об изменениях в нашей Политике конфиденциальности;Контактная информация: как связаться с нами  по вопросам, связанным с конфиденциальностью	ru-RU	101
302	2025-02-25 18:46:18.553	2025-02-27 18:27:39.889477	\N	Information Collection and Use: Details on the data we collect when you visit our website or use our services, and the purposes for which it is collected.;Cookies and Similar Technologies: How we use cookies to enhance your browsing experience.;Data Sharing with Third Parties: Conditions under which we may share your data with partners and service providers.;Data Security: Measures taken to protect your information from unauthorized access;User Rights: How you can manage, update, or delete your personal data.;Policy Updates: How we will notify you of changes to our Privacy Policy. ;Contact Information: How to reach us for questions related to privacy.	en-US	101
306	2025-02-25 18:46:18.553	2025-02-27 18:27:39.896237	\N	{"path":"http://cloud.andreyi96.beget.tech:9000/cms/c7b190264abed1f1d6285b9fb577110b.docx","type":"docs","name":"policy.docx","filename":"c7b190264abed1f1d6285b9fb577110b.docx","size":7525,"id":14,"createdAt":"2025-02-25T18:46:18.553Z","updatedAt":"2025-02-25T18:46:18.553Z","deletedAt":null,"isSystem":false}	ru-RU	102
358	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Какова средняя продолжительность доставки?	ru-RU	120
359	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	What is the average delivery time?	en-US	120
360	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	有哪些支付方式？	zh-CN	120
305	2025-02-25 18:46:18.553	2025-02-27 18:27:39.900933	\N	{"path":"http://cloud.andreyi96.beget.tech:9000/cms/c7b190264abed1f1d6285b9fb577110b.docx","type":"docs","name":"policy.docx","filename":"c7b190264abed1f1d6285b9fb577110b.docx","size":7525,"id":14,"createdAt":"2025-02-25T18:46:18.553Z","updatedAt":"2025-02-25T18:46:18.553Z","deletedAt":null,"isSystem":false}	en-US	102
307	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Пользовательское соглашение	ru-RU	103
308	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	User Agreement	en-US	103
309	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	用户协议	zh-CN	103
361	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N		ru-RU	121
310	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Пользовательское соглашение устанавливает  правила и условия использования нашего  веб-сайта и предоставляемых нами сервисов	ru-RU	104
311	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Our User Agreement sets out the rules and conditions for using our website and services. 	en-US	104
312	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	用户协议规定了使用我们网站和服务的规则和条件。	zh-CN	104
313	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Ознакомление с этим документом поможет вам  понять свои права и обязанности при  взаимодействии с нашей компанией  Прочитать пользовательское соглашение. 	ru-RU	105
314	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	阅读该文件将帮助您了解与我们公司互动时的权利和义务。	zh-CN	105
315	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Reviewing this document will help you understand your rights and obligations when interacting with our company.	en-US	105
362	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N		en-US	121
363	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N		zh-CN	121
366	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	平均交货时间是多少？	zh-CN	122
367	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N		ru-RU	123
368	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N		en-US	123
369	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N		zh-CN	123
370	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Что делать, если оборудование не работает корректно?	ru-RU	124
371	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	What to do if the equipment is not working properly?	en-US	124
372	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	如果设备无法正常工作怎么办？	zh-CN	124
373	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N		ru-RU	125
374	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N		en-US	125
375	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N		zh-CN	125
376	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Как заказать запасные части?	ru-RU	126
377	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	How to order spare parts?	en-US	126
378	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	如何订购备件？	zh-CN	126
379	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N		ru-RU	127
380	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N		en-US	127
381	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N		zh-CN	127
382	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Предоставляете ли вы услуги по установке и наладке оборудования?	ru-RU	128
383	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Do you provide installation and commissioning services?	en-US	128
384	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	是否提供设备安装和调试服务？	zh-CN	128
385	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Да, наши специалисты могут провести установку и пуско-наладочные работы на вашем объекте.	ru-RU	129
386	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Yes, our specialists can perform installation and commissioning work at your site.	en-US	129
387	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	是的，我们的专家可以在您的现场完成安装和调试工作。	zh-CN	129
388	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	СЛУЖБА ПОДДЕРЖКИ	ru-RU	130
389	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	SUPPORT SERVICE:	en-US	130
390	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	客户支持服务：	zh-CN	130
391	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	+86-5432-2755 (ext. 804)	ru-RU	131
392	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	+86-21-5432-2755 (ext. 804)	en-US	131
393	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	+86-21-5432-2755 (ext. 804)	zh-CN	131
394	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	support@inter-sa.com	en-US	132
395	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	support@inter-sa.com	zh-CN	132
396	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	support@inter-sa.com	ru-RU	132
475	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N		ru-RU	159
316	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Общие положения: сфера действия  соглашения, определения основных терминов;Права и обязанности пользователей: правила  поведения на сайте, ответственность за  предоставляемую информацию;Права и обязанности компании: наши  обязательства перед пользователями, право  на изменение контента и условий;Интеллектуальная собственность:  правила использования материалов,  размещенных на сайте;Ограничение ответственности: условия, при  которых компания не несет ответственности  за определенные действия или события;Порядок разрешения споров: механизмы  урегулирования возможных разногласий;Изменения в соглашении: процедура внесения  изменений и уведомления пользователей;Применимое законодательство: указание  юрисдикции и применимых законов	ru-RU	106
317	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	General Provisions: Scope of the agreement, definitions of key terms.;User Rights and Responsibilities: Website behavior rules and accountability for provided information.;Company Rights and Responsibilities: Our commitments to users, including the right to modify content and terms.;Intellectual Property: Guidelines for using materials published on the website.;Liability Disclaimer: Conditions under which the company is not responsible for certain actions or events.;Dispute Resolution: Mechanisms for resolving potential disagreements.;Agreement Modifications: Procedures for making changes and notifying users.;Applicable Law: Jurisdiction and governing laws.	en-US	106
318	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	一般规定： 协议的适用范围，基本术语的定义。;用户的权利和义务： 网站行为规则和对提供信息的责任。;公司的权利和义务： 我们对用户的承诺，以及修改内容和条款的权利。;知识产权： 网站上发布的材料使用规则。;责任限制： 公司不对某些行为或事件承担责任的条件。;争议解决程序： 解决潜在分歧的机制。;协议变更： 修改程序和通知用户的方式。;适用法律： 指定的司法管辖权和适用法律。	zh-CN	106
319	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	{"path":"http://cloud.andreyi96.beget.tech:9000/cms/b1aae3847de1572488f5aaf03066b64e.docx","type":"docs","name":"policy.docx","filename":"b1aae3847de1572488f5aaf03066b64e.docx","size":7525,"id":15,"createdAt":"2025-02-25T18:46:18.553Z","updatedAt":"2025-02-25T18:46:18.553Z","deletedAt":null,"isSystem":false}	zh-CN	107
320	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	{"path":"http://cloud.andreyi96.beget.tech:9000/cms/b1aae3847de1572488f5aaf03066b64e.docx","type":"docs","name":"policy.docx","filename":"b1aae3847de1572488f5aaf03066b64e.docx","size":7525,"id":15,"createdAt":"2025-02-25T18:46:18.553Z","updatedAt":"2025-02-25T18:46:18.553Z","deletedAt":null,"isSystem":false}	en-US	107
321	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	{"path":"http://cloud.andreyi96.beget.tech:9000/cms/b1aae3847de1572488f5aaf03066b64e.docx","type":"docs","name":"policy.docx","filename":"b1aae3847de1572488f5aaf03066b64e.docx","size":7525,"id":15,"createdAt":"2025-02-25T18:46:18.553Z","updatedAt":"2025-02-25T18:46:18.553Z","deletedAt":null,"isSystem":false}	ru-RU	107
175	2025-02-25 18:46:18.553	2025-02-27 18:33:12.220039	\N	<p>Понедельник - Пятница: 9:00 - 18:00</p><p>Суббота: 10:00 - 16:00</p><p>Воскресенье: выходной</p>	ru-RU	59
176	2025-02-25 18:46:18.553	2025-02-27 18:33:12.229619	\N	<p>Monday – Friday: 9:00 AM – 6:00 PM</p><p>Saturday: 10:00 AM – 4:00 PM</p><p>Sunday: Closed</p>	en-US	59
177	2025-02-25 18:46:18.553	2025-02-27 18:33:12.2344	\N	<p>周一 - 周五：9:00 - 18:00</p><p>周六：10:00 - 16:00</p><p>周日：休息</p>	zh-CN	59
322	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Как сделать заказ?	ru-RU	108
323	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	How to place an order?	en-US	108
324	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	如何下订单？	zh-CN	108
325	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Вы можете оформить заказ, связавшись с нашим отделом продаж по телефону +86-21-5432-2755 (ext. 813) или отправив запрос на sales@inter-sa.com	ru-RU	109
326	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	You can place an order by contacting our sales department at:	en-US	109
327	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	您可以通过电话 +86-21-5432-2755 (ext. 813) 联系销售部门，或发送邮件至 sales@inter-sa.com。	zh-CN	109
328	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Какие способы оплаты доступны?	ru-RU	110
329	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	What payment methods are available?	en-US	110
330	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	有哪些支付方式？	zh-CN	110
331	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N		ru-RU	111
332	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N		en-US	111
333	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N		zh-CN	111
334	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	123	ru-RU	112
335	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	123	en-US	112
336	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	123	zh-CN	112
337	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N		ru-RU	113
338	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N		en-US	113
339	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N		zh-CN	113
340	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Какие способы оплаты доступны?	ru-RU	114
341	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	What payment methods are available?	en-US	114
342	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	有哪些支付方式？	zh-CN	114
343	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N		ru-RU	115
344	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N		en-US	115
345	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N		zh-CN	115
346	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Как сделать заказ?	ru-RU	116
347	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	How to place an order?	en-US	116
348	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	如何下订单？	zh-CN	116
349	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Вы можете оформить заказ, связавшись с нашим отделом продаж по телефону +86-21-5432-2755 (ext. 813) или отправив запрос на sales@inter-sa.com	ru-RU	117
350	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	You can place an order by contacting our sales department at: Phone: +86-21-5432-2755 (ext. 813) Email: sales@inter-sa.com	en-US	117
351	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	您可以通过电话 +86-21-5432-2755 (ext. 813) 联系销售部门，或发送邮件至 sales@inter-sa.com。	zh-CN	117
352	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Какие способы оплаты доступны?	ru-RU	118
353	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	What payment methods are available?	en-US	118
354	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	有哪些支付方式？	zh-CN	118
355	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N		ru-RU	119
356	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N		en-US	119
397	2025-02-25 18:46:18.553	2025-02-27 18:53:28.842308	\N		ru-RU	133
398	2025-02-25 18:46:18.553	2025-02-27 18:53:28.848151	\N		en-US	133
399	2025-02-25 18:46:18.553	2025-02-27 18:53:28.852615	\N		zh-CN	133
400	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	ОТДЕЛ ЗАПАСНЫХ ЧАСТЕЙ	ru-RU	134
401	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	SPARE PARTS DEPARTMENT:	en-US	134
402	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	备件部门：	zh-CN	134
403	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N		ru-RU	135
404	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N		en-US	135
405	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N		zh-CN	135
406	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	parts@inter-sa.com	en-US	136
407	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	parts@inter-sa.com	zh-CN	136
408	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	parts@inter-sa.com	ru-RU	136
409	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N		ru-RU	137
410	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N		en-US	137
411	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N		zh-CN	137
412	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	ОБЩИЕ ВОПРОСЫ	ru-RU	138
413	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	GENERAL INQUIRIES:	en-US	138
414	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	一般咨询：	zh-CN	138
415	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N		ru-RU	139
416	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N		en-US	139
417	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N		zh-CN	139
418	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	info@inter-sa.com	en-US	140
419	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	info@inter-sa.com	zh-CN	140
420	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	info@inter-sa.com	ru-RU	140
421	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N		ru-RU	141
422	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N		en-US	141
423	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N		zh-CN	141
424	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	АДРЕС ГЛАВНОГО ОФИСА	ru-RU	142
425	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	MAIN OFFICE ADDRESS:	en-US	142
426	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	总部地址：	zh-CN	142
427	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N		ru-RU	143
428	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N		en-US	143
429	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N		zh-CN	143
430	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N		en-US	144
431	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N		zh-CN	144
432	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N		ru-RU	144
433	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Китай, г. Шанхай, район Миньхан, улица Синьцзюньхуань, дом 115, корпус 1, офисы 503-505	ru-RU	145
434	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	China, Shanghai, Minhang District, Xinjunhuan Street, Building 115, Unit 1, Offices 503–505	en-US	145
435	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	中国上海市闵行区新骏环路115号1号楼503-505办公室	zh-CN	145
436	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	partners@inter-sa.com	ru-RU	146
437	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	partners@inter-sa.com	en-US	146
438	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	partners@inter-sa.com	zh-CN	146
439	2025-02-25 18:46:18.553	2025-02-27 19:02:03.250791	\N		ru-RU	147
441	2025-02-25 18:46:18.553	2025-02-27 19:02:03.254775	\N		en-US	147
440	2025-02-25 18:46:18.553	2025-02-27 19:02:03.257478	\N		zh-CN	147
442	2025-02-25 18:46:18.553	2025-02-27 19:02:03.259943	\N		ru-RU	148
443	2025-02-25 18:46:18.553	2025-02-27 19:02:03.263012	\N		en-US	148
444	2025-02-25 18:46:18.553	2025-02-27 19:02:03.265556	\N		zh-CN	148
445	2025-02-25 18:46:18.553	2025-02-27 19:02:03.26771	\N		ru-RU	149
446	2025-02-25 18:46:18.553	2025-02-27 19:02:03.270091	\N		en-US	149
447	2025-02-25 18:46:18.553	2025-02-27 19:02:03.272917	\N		zh-CN	149
450	2025-02-25 18:46:18.553	2025-02-27 19:02:03.275387	\N	E-MAIL	ru-RU	150
448	2025-02-25 18:46:18.553	2025-02-27 19:02:03.278301	\N	EMAIL	en-US	150
449	2025-02-25 18:46:18.553	2025-02-27 19:02:03.283265	\N	电子邮件	zh-CN	150
451	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N		ru-RU	151
452	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N		en-US	151
453	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N		zh-CN	151
454	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	8+6-21-5432-2755 (ext. 818)	ru-RU	152
455	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	+86-21-5432-2755 (ext. 818)	zh-CN	152
456	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	+86-21-5432-2755 (ext. 818)	en-US	152
457	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N		ru-RU	153
458	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N		en-US	153
459	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N		zh-CN	153
460	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N		ru-RU	154
461	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N		en-US	154
462	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N		zh-CN	154
463	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	PHONE	en-US	155
464	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	电话	zh-CN	155
465	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	ТЕЛЕФОН	ru-RU	155
466	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N		ru-RU	156
467	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N		en-US	156
468	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N		zh-CN	156
469	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N		ru-RU	157
470	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N		zh-CN	157
471	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N		en-US	157
472	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Китай, г. Шанхай, район Миньхан, улица Синьцзюньхуань, дом 115, корпус 1, офисы 503-505	ru-RU	158
473	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	China, Shanghai, Minhang District, Xinjunhuan Street, Building 115, Unit 1, Offices 503–505	en-US	158
474	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	中国上海市闵行区辛军环路115号，1栋503-505室	zh-CN	158
476	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N		en-US	159
477	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N		zh-CN	159
478	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	MAIN OFFICE ADDRESS	en-US	160
479	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	总部地址	zh-CN	160
480	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	АДРЕС ГЛАВНОГО ОФИСА	ru-RU	160
481	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N		ru-RU	161
482	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N		en-US	161
483	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N		zh-CN	161
484	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N		ru-RU	162
485	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N		zh-CN	162
486	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N		en-US	162
487	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N		ru-RU	163
488	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N		en-US	163
489	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N		zh-CN	163
490	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Дмитрий Александрович Гаврилов. Директор по развитию бизнеса	ru-RU	164
491	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Dmitry Alexandrovich Gavrilov Business Development Director	en-US	164
492	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Dmitry Alexandrovich Gavrilov 开发总监	zh-CN	164
493	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	CONTACT PERSON	en-US	165
494	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	联系人	zh-CN	165
495	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	КОНТАКТНОЕ ЛИЦО	ru-RU	165
496	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Директор по продажам	ru-RU	166
497	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	销售总监	zh-CN	166
498	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Sales Director	en-US	166
499	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Shanghai, China	en-US	167
500	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Шанхай, Китай	ru-RU	167
501	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	中国上海	zh-CN	167
502	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Навыки стратегического мышления и  лидерства;Опыт работы на руководящей позиции  в продажах не менее 5 лет;Высшее образование в области маркетинга,  экономики или управления;Знание английского и/или китайского языков  на высоком уровне	ru-RU	168
503	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Strategic thinking and leadership skills;At least 5 years of experience in a managerial sales position;A degree in marketing, economics, or management;Proficiency in English and/or Chinese at a high level	en-US	168
504	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	战略思维与领导能力;至少5年销售管理职位经验;市场营销、经济或管理领域的高等学历;英语和/或汉语高级水平	zh-CN	168
505	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Разработка и реализация стратегии продаж;Управление командой менеджеров по  продажам;Установление и поддержание отношений с  ключевыми клиентами;Анализ рынка и поиск новых возможностей  для развития бизнеса	ru-RU	169
506	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Developing and implementing sales strategies;Managing the sales team;Building and maintaining relationships with key clients;Market analysis and identifying new business opportunities	en-US	169
507	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	制定并实施销售战略;管理销售团队;与关键客户建立并维护关系;市场分析与寻找业务发展新机会	zh-CN	169
508	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Конкурентоспособная заработная плата;Бонусы по результатам работы;Социальный пакет и медицинская страховка;Возможности для профессионального роста	ru-RU	170
509	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Competitive salary;Performance-based bonuses;Social benefits and medical insurance;Opportunities for professional growth	en-US	170
510	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	具有竞争力的薪资;绩效奖金;社会保障与医疗保险;职业发展机会	zh-CN	170
511	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Инженер-механик	ru-RU	171
512	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	机械工程师	zh-CN	171
513	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Mechanical Engineer	en-US	171
514	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Blagoveshchensk, Russia	en-US	172
515	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Благовещенск, Россия	ru-RU	172
516	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	俄罗斯布拉戈维申斯克	zh-CN	172
517	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Высшее техническое образование  (инженер-механик);Опыт работы в сфере машиностроения от 3  лет;Уверенное владение САПР (CAD) программами;Знание английского или китайского языка  будет преимуществом	ru-RU	173
518	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Higher technical education (Mechanical Engineer);At least 3 years of experience in mechanical engineering;Proficiency in CAD software;Knowledge of English or Chinese is an advantage	en-US	173
519	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	工程师学位（机械方向）;至少3年机械制造行业工作经验;熟练掌握CAD软件;英语或汉语能力将是优势	zh-CN	173
520	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Разработка и проектирование промышленного  оборудования;Подготовка технической документации;Взаимодействие с производственным отделом  и контролем качества;Участие в пуско-наладочных работах	ru-RU	174
521	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Designing and developing industrial equipment;Preparing technical documentation;Collaborating with the production department and quality control;Participating in commissioning work	en-US	174
522	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	工业设备的设计与开发;编制技术文档;与生产部门及质量控制部门协作;参与调试与安装工作	zh-CN	174
523	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Достойная заработная плата;Обучение и повышение квалификации;Социальный пакет;Работа в международной команде	ru-RU	175
524	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Competitive salary;Training and skill development;Social benefits;Work in an international team	en-US	175
525	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	优厚的薪资待遇;培训与技能提升机会;社会保障;国际化团队合作	zh-CN	175
526	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Инженер-механик	ru-RU	176
527	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	机械工程师	zh-CN	176
528	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Mechanical Engineer	en-US	176
531	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	俄罗斯布拉戈维申斯克	zh-CN	177
529	2025-02-25 18:46:18.553	2025-02-27 19:15:41.509269	\N	Blagoveshchensk, Russia	en-US	177
589	2025-02-25 18:46:18.553	2025-02-27 19:24:33.946315	\N	812	ru-RU	197
530	2025-02-25 18:46:18.553	2025-02-27 19:15:41.505908	\N	Благовещенск, Россия	ru-RU	177
578	2025-02-25 18:46:18.553	2025-02-27 19:24:33.922136	\N	HR DEPARTMENT CONTACT INFORMATION	en-US	193
584	2025-02-25 18:46:18.553	2025-02-27 19:24:33.939207	\N	hr@inter-sa.com	zh-CN	195
587	2025-02-25 18:46:18.553	2025-02-27 19:24:33.941718	\N	China, Shanghai, Minhang District, Xinjunhuan Street, Building 115, Unit 1, Offices 503–505	en-US	196
588	2025-02-25 18:46:18.553	2025-02-27 19:24:33.94417	\N	中国上海市闵行区新骏环路115号1号楼503-505室	zh-CN	196
591	2025-02-25 18:46:18.553	2025-02-27 19:24:33.948592	\N	812	en-US	197
590	2025-02-25 18:46:18.553	2025-02-27 19:24:33.95136	\N	812	zh-CN	197
594	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	公司新闻	zh-CN	198
595	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Будьте в курсе последних событий и новостей ншей компании 	ru-RU	199
596	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	了解我们公司最新的动态和新闻	zh-CN	199
597	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Stay informed about the latest events and news from our company.	en-US	199
598	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	СОЦИАЛЬНЫЕ СЕТИ	ru-RU	200
599	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	SOCIAL MEDIA	en-US	200
600	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	社交媒体	zh-CN	200
601	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Следите за нами в социальных сетях, чтобы получать оперативные обновления и участвовать в обсуждения	ru-RU	201
602	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Follow us on social media to receive updates and participate in discussions promptly.	en-US	201
603	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	通过社交媒体关注我们，获取最新动态并参与讨论。	zh-CN	201
604	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	SA INTERNATIONAL	ru-RU	202
605	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	SA INTERNATIONAL	en-US	202
606	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	上海亚际机电有限公司	zh-CN	202
607	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	— ВАШ ИСТОЧНИК АКТУАЛЬНОЙ ИНФОРМАЦИИ И ЭКСПЕРТНЫХ ЗНАНИЙ В СФЕРЕ ПРОМЫШЛЕННОСТИ И ТЕХНОЛОГИЙ	ru-RU	203
608	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Your source for the latest information and expert knowledge in the field of industry and technology.	en-US	203
609	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	—— 您获取工业与技术领域最新信息和专业知识的来源	zh-CN	203
610	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	+86-21-5432-2755	ru-RU	204
611	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	+86-21-5432-2755	en-US	204
612	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	+86-21-5432-2755	zh-CN	204
613	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	China, Shanghai, Minhang District, Xinjunhuan Street, Building 115, Unit 1, Offices 503–505	en-US	205
614	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Китай, г. Шанхай, район Миньхан, улица Синьцзюньхуань, дом 115, корпус 1, офисы 503-50	ru-RU	205
615	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	中国上海市闵行区新骏环路115号1号楼503-505办公室	zh-CN	205
616	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	info@inter-sa.com	ru-RU	206
617	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	info@inter-sa.com	en-US	206
532	2025-02-25 18:46:18.553	2025-02-27 19:17:59.386691	\N	Высшее техническое образование  (инженер-механик)	ru-RU	178
533	2025-02-25 18:46:18.553	2025-02-27 19:17:59.390478	\N	Higher technical education (Mechanical Engineer)	en-US	178
534	2025-02-25 18:46:18.553	2025-02-27 19:17:59.392848	\N	工程师学位（机械方向）	zh-CN	178
535	2025-02-25 18:46:18.553	2025-02-27 19:17:59.39582	\N	Разработка и проектирование промышленного  оборудования	ru-RU	179
536	2025-02-25 18:46:18.553	2025-02-27 19:17:59.39833	\N	Designing and developing industrial equipment	en-US	179
537	2025-02-25 18:46:18.553	2025-02-27 19:17:59.401733	\N	工业设备的设计与开发	zh-CN	179
538	2025-02-25 18:46:18.553	2025-02-27 19:17:59.404271	\N	Достойная заработная плата	ru-RU	180
539	2025-02-25 18:46:18.553	2025-02-27 19:17:59.406539	\N	Competitive salary	en-US	180
540	2025-02-25 18:46:18.553	2025-02-27 19:17:59.409372	\N	优厚的薪资待遇	zh-CN	180
541	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	 МАРИНА СМИРНОВА	ru-RU	181
542	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Marina Smirnova	en-US	181
543	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Marina Smirnova	zh-CN	181
544	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Менеджер по работе с клиентами	ru-RU	182
545	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Client Relations Manager	en-US	182
546	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	客户经理	zh-CN	182
547	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	"When I joined SA International two years ago, I couldn't imagine how quickly I would grow professionally. The company provides all the opportunities for learning and development. I work with clients from different countries, which constantly broadens my horizons and enriches my experience."	en-US	183
548	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	“当我两年前加入上海亚际机电有限公司时，我没有想到自己会如此迅速地实现职业发展。公司提供了全面的学习和成长机会。我与来自不同国家的客户合作，这不断拓宽了我的视野，带来了丰富的经验。”	zh-CN	183
549	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	"Когда я присоединилась к SA International два года назад, я и не предполагала, насколько быстро смогу вырасти профессионально. Компания предоставляет все возможности для обучения и развития. Я работаю с клиентами из разных стран, что позволяет постоянно расширять свой кругозор и приобретать новый опыт."	ru-RU	183
618	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	info@inter-sa.com	zh-CN	206
619	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	СТАТЬИ И АНАЛИТИКА	ru-RU	207
620	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	ARTICLES AND ANALYTICS	en-US	207
621	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	文章与分析	zh-CN	207
622	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Мы делимся своим опытом и экспертными знаниями, публикуя статьи и аналитические материалы по актуальным темам промышленности и технологий	ru-RU	208
623	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	我们分享我们的经验和专业知识，发布与工业和技术相关的文章和分析材料	zh-CN	208
624	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	We share our expertise and knowledge through articles and analytical materials on current industry and technology topics.	en-US	208
625	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	ПРЕСС-РЕЛИЗЫ 	ru-RU	209
626	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	PRESS RELEASES	en-US	209
627	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	新闻稿	zh-CN	209
628	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	上海亚际机电有限公司的官方声明与公告	zh-CN	210
629	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Официальные заявления и анонсы SA internetional	ru-RU	210
550	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	{"path":"http://cloud.andreyi96.beget.tech:9000/cms/2dfb3ccd6eb74468f92b424f33049bc0.png","type":"images","name":"linkedin-sales-solutions-NpyF7rjqmq4-unsplash 1.png","filename":"2dfb3ccd6eb74468f92b424f33049bc0.png","size":361705,"id":16,"createdAt":"2025-02-25T18:46:18.553Z","updatedAt":"2025-02-25T18:46:18.553Z","deletedAt":null,"isSystem":false}	ru-RU	184
551	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	{"path":"http://cloud.andreyi96.beget.tech:9000/cms/2dfb3ccd6eb74468f92b424f33049bc0.png","type":"images","name":"linkedin-sales-solutions-NpyF7rjqmq4-unsplash 1.png","filename":"2dfb3ccd6eb74468f92b424f33049bc0.png","size":361705,"id":16,"createdAt":"2025-02-25T18:46:18.553Z","updatedAt":"2025-02-25T18:46:18.553Z","deletedAt":null,"isSystem":false}	en-US	184
552	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	{"path":"http://cloud.andreyi96.beget.tech:9000/cms/2dfb3ccd6eb74468f92b424f33049bc0.png","type":"images","name":"linkedin-sales-solutions-NpyF7rjqmq4-unsplash 1.png","filename":"2dfb3ccd6eb74468f92b424f33049bc0.png","size":361705,"id":16,"createdAt":"2025-02-25T18:46:18.553Z","updatedAt":"2025-02-25T18:46:18.553Z","deletedAt":null,"isSystem":false}	zh-CN	184
553	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	ИВАН КОВАЛЕВ	ru-RU	185
554	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Ivan Kovalev	en-US	185
555	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Ivan Kovalev	zh-CN	185
556	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Инженер по автоматизации	ru-RU	186
557	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Automation Engineer	en-US	186
558	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	自动化工程师	zh-CN	186
559	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	"Working at SA International is a constant challenge and an opportunity to participate in cutting-edge projects. I especially enjoyed working on the project to implement artificial intelligence in production processes. A team of professionals and supportive leadership make this job truly exciting."	en-US	187
560	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	“在上海亚际机电有限公司工作是一种持续的挑战，也是参与前沿项目的机会。我尤其喜欢参与人工智能在生产流程中的应用项目。专业团队和管理层的支持使这里的工作真正令人兴奋。”	zh-CN	187
561	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	"Работа в SA International - это постоянный вызов и возможность участвовать в передовых проектах. Особенно интересно было работать над проектом по внедрению искусственного интеллекта в производственные процессы. Команда профессионалов и поддержка руководства делают работу здесь по-настоящему увлекательной."	ru-RU	187
562	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	{"path":"http://cloud.andreyi96.beget.tech:9000/cms/d499660c915e40db3f45c14d5da2db02.png","type":"images","name":"jonas-kakaroto-KIPqvvTOC1s-unsplash.png","filename":"d499660c915e40db3f45c14d5da2db02.png","size":391276,"id":17,"createdAt":"2025-02-25T18:46:18.553Z","updatedAt":"2025-02-25T18:46:18.553Z","deletedAt":null,"isSystem":false}	ru-RU	188
563	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	{"path":"http://cloud.andreyi96.beget.tech:9000/cms/d499660c915e40db3f45c14d5da2db02.png","type":"images","name":"jonas-kakaroto-KIPqvvTOC1s-unsplash.png","filename":"d499660c915e40db3f45c14d5da2db02.png","size":391276,"id":17,"createdAt":"2025-02-25T18:46:18.553Z","updatedAt":"2025-02-25T18:46:18.553Z","deletedAt":null,"isSystem":false}	en-US	188
564	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	{"path":"http://cloud.andreyi96.beget.tech:9000/cms/d499660c915e40db3f45c14d5da2db02.png","type":"images","name":"jonas-kakaroto-KIPqvvTOC1s-unsplash.png","filename":"d499660c915e40db3f45c14d5da2db02.png","size":391276,"id":17,"createdAt":"2025-02-25T18:46:18.553Z","updatedAt":"2025-02-25T18:46:18.553Z","deletedAt":null,"isSystem":false}	zh-CN	188
565	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	ЛЮ ЧЭНЬ	ru-RU	189
566	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Liu Chen	en-US	189
567	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Liu Chen	zh-CN	189
568	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Специалист по логистике	ru-RU	190
569	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Logistics Specialist	en-US	190
570	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	物流专家	zh-CN	190
571	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	"SA International gave me the opportunity to realize my potential in international logistics. Initiative and striving for excellence are highly valued here. I am proud to be part of a company that is actively growing and conquering new markets."	en-US	191
572	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	“上海亚际机电有限公司为我提供了在国际物流领域实现自我的机会。这里重视主动性和追求卓越。我为自己是这家积极发展、开拓新市场的公司的成员而自豪。”	zh-CN	191
573	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	"SA International дала мне возможность реализовать себя в международной логистике. здесь ценят инициативу и стремление к совершенству. Я горжусь тем, что являюсь частью компании, которая активно развивается и покоряет новые рынки."	ru-RU	191
574	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	{"path":"http://cloud.andreyi96.beget.tech:9000/cms/670973da319cf9784fc8aa7623dd77f3.png","type":"images","name":"linkedin-sales-solutions-pAtA8xe_iVM-unsplash 1.png","filename":"670973da319cf9784fc8aa7623dd77f3.png","size":348752,"id":18,"createdAt":"2025-02-25T18:46:18.553Z","updatedAt":"2025-02-25T18:46:18.553Z","deletedAt":null,"isSystem":false}	ru-RU	192
575	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	{"path":"http://cloud.andreyi96.beget.tech:9000/cms/670973da319cf9784fc8aa7623dd77f3.png","type":"images","name":"linkedin-sales-solutions-pAtA8xe_iVM-unsplash 1.png","filename":"670973da319cf9784fc8aa7623dd77f3.png","size":348752,"id":18,"createdAt":"2025-02-25T18:46:18.553Z","updatedAt":"2025-02-25T18:46:18.553Z","deletedAt":null,"isSystem":false}	en-US	192
576	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	{"path":"http://cloud.andreyi96.beget.tech:9000/cms/670973da319cf9784fc8aa7623dd77f3.png","type":"images","name":"linkedin-sales-solutions-pAtA8xe_iVM-unsplash 1.png","filename":"670973da319cf9784fc8aa7623dd77f3.png","size":348752,"id":18,"createdAt":"2025-02-25T18:46:18.553Z","updatedAt":"2025-02-25T18:46:18.553Z","deletedAt":null,"isSystem":false}	zh-CN	192
577	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	КОНТАКТНАЯ ИНФОРМАЦИЯ ОТДЕЛА КАДРОВ	ru-RU	193
579	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N		zh-CN	193
583	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	hr@inter-sa.com	ru-RU	195
586	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Китай, г. Шанхай, район Миньхан, улица Синьцзюньхуань, дом 115, корпус 1, офисы 503-505	ru-RU	196
580	2025-02-25 18:46:18.553	2025-02-27 19:24:33.927959	\N	+86-21-5432-2755	ru-RU	194
581	2025-02-25 18:46:18.553	2025-02-27 19:24:33.93174	\N	+86-21-5432-2755	en-US	194
582	2025-02-25 18:46:18.553	2025-02-27 19:24:33.934463	\N	+86-21-5432-2755	zh-CN	194
585	2025-02-25 18:46:18.553	2025-02-27 19:24:33.936745	\N	hr@inter-sa.com	en-US	195
592	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	НОВОСТИ КОМПАНИИ 	ru-RU	198
593	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	COMPANY NEWS	en-US	198
630	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Official announcements and statements from SA International.	en-US	210
631	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	info@inter-sa.com	ru-RU	211
632	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	info@inter-sa.com	en-US	211
633	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	info@inter-sa.com	zh-CN	211
634	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	+86-5432-2755	ru-RU	212
635	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	+86-5432-2755	en-US	212
636	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	+86-5432-2755	zh-CN	212
637	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Китай, г. Шанхай, район Миньхан, улица Синьцзюньхуань, дом 115. корпус 1, офисы 503-505	ru-RU	213
638	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	China, Shanghai, Minhang District, Xinjunhuan Street, Building 115, Unit 1, Offices 503–505	en-US	213
639	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	中国上海市闵行区新骏环路115号1号楼503-505办公室	zh-CN	213
640	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	info@inter-sa.com	ru-RU	214
641	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	info@inter-sa.com	en-US	214
642	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	info@inter-sa.com	zh-CN	214
643	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	+86-5432-2755	ru-RU	215
644	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	+86-5432-2755	en-US	215
645	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	+86-5432-2755	zh-CN	215
646	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Китай, г. Шанхай, район Миньхан, улица Синьцзюньхуань, дом 115.	ru-RU	216
647	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	中国上海市闵行区新骏环路115号1号楼503-505办公室	zh-CN	216
648	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	China, Shanghai, Minhang District, Xinjunhuan Street, Building 115, Unit 1, Offices 503–505	en-US	216
61	2025-02-25 18:46:18.553	2025-02-28 05:54:10.849054	\N	Создание бартерной биржи 	ru-RU	21
64	2025-02-25 18:46:18.553	2025-02-28 05:54:10.868792	\N	Совмесно с ведущими компаниями мы инвестировали в  содание инновационной бартерной биржи, которая позволит  предприятиям эффективно обмениваться товарами и услугами	ru-RU	22
649	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Строительство завода роботов-манипуляторов в россии	ru-RU	217
650	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Construction of a Robot Manipulator Factory in Russia	en-US	217
651	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	在俄罗斯建设机器人手臂工厂	zh-CN	217
652	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Мы начинаем строительство завода по производству  работизированных рук в России, стремясь к полной  локатизации производства к 2028 году и развитию  промышленного потенциала региона. 	ru-RU	218
653	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	我们正在启动机器人手臂制造厂的建设， 目标是在2028年实现生产的全面本地化， 并推动该地区的工业潜力发展。	zh-CN	218
654	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	We are launching the construction of a factory for robotic arms in Russia, aiming for full production localization by 2028 and contributing to the region's industrial potential.	en-US	218
\.


--
-- Data for Name: pages_iblock_records_sections_pages_iblock_section; Type: TABLE DATA; Schema: public; Owner: postgress
--

COPY public.pages_iblock_records_sections_pages_iblock_section ("pagesIblockRecordsId", "pagesIblockSectionId") FROM stdin;
25	2
26	1
27	2
28	1
29	1
30	1
31	1
32	1
33	2
34	2
35	2
\.


--
-- Data for Name: pages_iblock_section; Type: TABLE DATA; Schema: public; Owner: postgress
--

COPY public.pages_iblock_section (id, "createdAt", "updatedAt", "deletedAt", "iblockId") FROM stdin;
1	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	11
2	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	11
\.


--
-- Data for Name: pages_iblock_section_value; Type: TABLE DATA; Schema: public; Owner: postgress
--

COPY public.pages_iblock_section_value (id, "createdAt", "updatedAt", "deletedAt", value, lang, "sectionId") FROM stdin;
1	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Общие вопросы	ru-RU	1
2	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	General Questions	en-US	1
3	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	一般问题	zh-CN	1
4	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Технические вопросы	ru-RU	2
5	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Technical Questions	en-US	2
6	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	技术问题	zh-CN	2
\.


--
-- Data for Name: pages_params; Type: TABLE DATA; Schema: public; Owner: postgress
--

COPY public.pages_params (id, "createdAt", "updatedAt", "deletedAt", name, slug, type, "isFilter", "pagesId") FROM stdin;
1	2025-02-25 20:29:19.765	2025-02-25 20:29:19.765	\N	Изоображение	image	image	f	8
2	2025-02-25 20:32:16.022	2025-02-25 20:32:16.022	\N	Изоображение	image	image	f	10
3	2025-02-25 20:37:32.165	2025-02-25 20:37:32.165	\N	Описание	description	textarea	f	11
4	2025-02-25 20:37:49.788	2025-02-25 20:37:49.788	\N	Технические характеристики	technical	textarea	f	11
5	2025-02-25 20:38:02.632	2025-02-25 20:38:02.632	\N	Сферы применения	application	textarea	f	11
6	2025-02-25 20:38:16.463	2025-02-25 20:38:16.463	\N	Преимущества сотрудничества	advantages	editor	f	11
7	2025-02-25 20:38:32.348	2025-02-25 20:38:32.348	\N	Изоображение	image	image	f	11
8	2025-02-25 20:40:30.498	2025-02-25 20:40:30.498	\N	Описание	description	textarea	f	12
9	2025-02-25 20:40:45.14	2025-02-25 20:40:45.14	\N	Технические характеристики	technical	textarea	f	12
10	2025-02-25 20:41:00.065	2025-02-25 20:41:00.065	\N	Сферы применения	application	textarea	f	12
11	2025-02-25 20:41:13.815	2025-02-25 20:41:13.815	\N	Преимущества сотрудничества	advantages	editor	f	12
12	2025-02-25 20:41:29.27	2025-02-25 20:41:29.27	\N	Изоображение	image	image	f	12
\.


--
-- Data for Name: pages_params_field; Type: TABLE DATA; Schema: public; Owner: postgress
--

COPY public.pages_params_field (id, "createdAt", "updatedAt", "deletedAt", "paramsId", "recordId") FROM stdin;
1	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	1	1
2	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	1	2
3	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	1	3
4	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	2	9
5	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	2	10
6	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	2	11
7	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	8	12
8	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	9	12
9	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	10	12
10	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	11	12
11	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	12	12
12	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	8	13
13	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	9	13
14	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	10	13
15	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	11	13
16	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	12	13
17	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	8	14
18	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	9	14
19	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	10	14
20	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	11	14
21	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	12	14
22	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	8	15
23	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	9	15
24	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	10	15
25	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	11	15
26	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	12	15
27	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	8	16
28	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	9	16
29	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	10	16
30	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	11	16
31	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	12	16
32	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	8	17
33	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	9	17
34	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	10	17
35	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	11	17
36	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	12	17
37	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	8	18
38	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	9	18
39	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	10	18
40	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	11	18
41	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	12	18
42	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	8	19
43	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	9	19
44	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	10	19
45	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	11	19
46	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	12	19
47	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	3	20
48	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	4	20
49	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	5	20
50	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	6	20
51	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	7	20
52	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	8	21
53	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	9	21
54	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	10	21
55	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	11	21
56	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	12	21
57	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	3	22
58	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	4	22
59	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	5	22
60	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	6	22
61	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	7	22
62	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	3	23
63	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	4	23
64	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	5	23
65	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	6	23
66	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	7	23
67	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	3	24
68	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	4	24
69	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	5	24
70	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	6	24
71	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	7	24
72	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	3	25
73	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	4	25
74	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	5	25
75	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	6	25
76	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	7	25
77	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	3	26
78	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	4	26
79	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	5	26
80	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	6	26
81	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	7	26
82	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	3	27
83	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	4	27
84	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	5	27
85	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	6	27
86	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	7	27
87	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	3	28
88	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	4	28
89	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	5	28
90	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	6	28
91	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	7	28
\.


--
-- Data for Name: pages_params_field_value; Type: TABLE DATA; Schema: public; Owner: postgress
--

COPY public.pages_params_field_value (id, "createdAt", "updatedAt", "deletedAt", value, lang, "pagesParamsFieldId") FROM stdin;
1	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Экскаваторы, бульдозеры, грейдеры, башенные и мобильные краны, генераторы, компрессоры, сварочные аппараты, перфораторы \n	ru-RU	7
4	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	{"path":"http://cloud.andreyi96.beget.tech:9000/cms/13cc7bf22590c668a7f641ecf4754915.png","type":"images","name":"pngwing.com (2) 1.png","filename":"13cc7bf22590c668a7f641ecf4754915.png","size":515224,"id":20,"createdAt":"2025-02-25T18:46:18.553Z","updatedAt":"2025-02-25T18:46:18.553Z","deletedAt":null,"isSystem":false}	ru-RU	11
5	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	挖掘机、推土机、平地机、塔式和移动式起重机、发电机、压缩机、焊接机、电锤\n	zh-CN	7
6	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Excavators, bulldozers, graders, tower and mobile cranes, generators, compressors, welding machines, jackhammers\n	en-US	7
7	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	{"path":"http://cloud.andreyi96.beget.tech:9000/cms/13cc7bf22590c668a7f641ecf4754915.png","type":"images","name":"pngwing.com (2) 1.png","filename":"13cc7bf22590c668a7f641ecf4754915.png","size":515224,"id":20,"createdAt":"2025-02-25T18:46:18.553Z","updatedAt":"2025-02-25T18:46:18.553Z","deletedAt":null,"isSystem":false}	en-US	11
8	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	{"path":"http://cloud.andreyi96.beget.tech:9000/cms/13cc7bf22590c668a7f641ecf4754915.png","type":"images","name":"pngwing.com (2) 1.png","filename":"13cc7bf22590c668a7f641ecf4754915.png","size":515224,"id":20,"createdAt":"2025-02-25T18:46:18.553Z","updatedAt":"2025-02-25T18:46:18.553Z","deletedAt":null,"isSystem":false}	zh-CN	11
9	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Высокая производительность, энергоэффективность, простота в обслуживании\n	ru-RU	8
10	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	High performance, energy efficiency, ease of maintenance\n	en-US	8
11	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	民用和工业建筑、住宅综合楼建设、基础设施项目\n	zh-CN	9
12	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	高生产率、节能、易于维护\n	zh-CN	8
13	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Гражданское и промышленное строительство, возведение жилых комплексов, инфраструктурные проекты\n	ru-RU	9
15	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Civil and industrial construction, residential complex construction, infrastructure projects\n	en-US	9
16	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Асфальтовые заводы, дорожные катки, фрезы, распределители битума\n	ru-RU	12
18	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	沥青厂、压路机、铣刨机、沥青洒布车\n	zh-CN	12
20	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Construction and repair of roads, bridges, tunnels\n	en-US	14
21	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Reliability, long service life, compliance with international standards\n	en-US	13
22	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	{"path":"http://cloud.andreyi96.beget.tech:9000/cms/b6e6290768a0bc8f834ea19efe2445d7.png","type":"images","name":"pngwing.com (3) 1.png","filename":"b6e6290768a0bc8f834ea19efe2445d7.png","size":434233,"id":21,"createdAt":"2025-02-25T18:46:18.553Z","updatedAt":"2025-02-25T18:46:18.553Z","deletedAt":null,"isSystem":false}	ru-RU	16
23	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Надежность, длительный срок службы, соответствие международным стандартам\n	ru-RU	13
24	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Asphalt plants, road rollers, milling machines, bitumen distributors\n	en-US	12
25	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	可靠性、长使用寿命、符合国际标准\n	zh-CN	13
26	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Строительство и ремонт дорог, мостов, туннелей\n	ru-RU	14
27	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	{"path":"http://cloud.andreyi96.beget.tech:9000/cms/b6e6290768a0bc8f834ea19efe2445d7.png","type":"images","name":"pngwing.com (3) 1.png","filename":"b6e6290768a0bc8f834ea19efe2445d7.png","size":434233,"id":21,"createdAt":"2025-02-25T18:46:18.553Z","updatedAt":"2025-02-25T18:46:18.553Z","deletedAt":null,"isSystem":false}	en-US	16
28	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	{"path":"http://cloud.andreyi96.beget.tech:9000/cms/b6e6290768a0bc8f834ea19efe2445d7.png","type":"images","name":"pngwing.com (3) 1.png","filename":"b6e6290768a0bc8f834ea19efe2445d7.png","size":434233,"id":21,"createdAt":"2025-02-25T18:46:18.553Z","updatedAt":"2025-02-25T18:46:18.553Z","deletedAt":null,"isSystem":false}	zh-CN	16
30	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	道路、桥梁、隧道的建设和维修\n	zh-CN	14
31	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Плавильные печи, прокатные станы, оборудование для обработки металла, системы охлаждения\n	ru-RU	17
33	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Melting furnaces, rolling mills, metal processing equipment, cooling systems\n	en-US	17
34	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	熔炉、轧机、金属加工设备、冷却系统\n	zh-CN	17
35	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	High performance, process automation, energy efficiency\n	en-US	18
3	2025-02-25 18:46:18.553	2025-02-27 20:14:31.498428	\N	<div>民用和工业建筑、住宅综合楼建设、基础设施项目</div><div><ul><li>制造商的质量保证</li><li>技术支持和售后服务</li><li>为每个项目量身定制的解决方案</li></ul></div>	zh-CN	10
2	2025-02-25 18:46:18.553	2025-02-27 20:14:31.502621	\N	<div>Civil and industrial construction, residential complex construction, infrastructure projects</div><div><ul><li>Manufacturer's quality guarantee</li><li>Technical support and maintenance service</li><li>Individual approach to each project</li></ul></div>	en-US	10
29	2025-02-25 18:46:18.553	2025-02-27 20:15:45.316378	\N	<div>Комплексные решения "под ключ"</div><div><ul><li>Обучение персонала работе с оборудованием</li><li>Гибкие условия оплаты и доставки</li></ul></div>	ru-RU	15
19	2025-02-25 18:46:18.553	2025-02-27 20:15:45.326111	\N	<div>“交钥匙”综合解决方案</div><div><ul><li>设备操作人员培训</li><li>灵活的付款和交付条件</li></ul></div>	zh-CN	15
17	2025-02-25 18:46:18.553	2025-02-27 20:15:45.327497	\N	<div>Turnkey comprehensive solutions</div><div><ul><li>Personnel training for equipment operation</li><li>Flexible payment and delivery terms</li></ul></div>	en-US	15
36	2025-02-25 18:46:18.553	2025-02-27 20:16:14.978316	\N	<div><ul><li>项目各阶段的技术支持</li><li>现有设备升级的可能性</li><li>生产流程优化</li></ul></div>	zh-CN	20
32	2025-02-25 18:46:18.553	2025-02-27 20:16:14.979233	\N	<div><ul><li>Technical support at all stages of the project</li><li>Possibility of upgrading existing equipment</li><li>Optimization of production processes</li></ul></div>	en-US	20
37	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Высокая производительность, автоматизация процессов, энергоэффективность\n	ru-RU	18
38	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	{"path":"http://cloud.andreyi96.beget.tech:9000/cms/f515b0ab97eef8699c697910f4a38175.png","type":"images","name":"pngwing.com (4) 1.png","filename":"f515b0ab97eef8699c697910f4a38175.png","size":367598,"id":22,"createdAt":"2025-02-25T18:46:18.553Z","updatedAt":"2025-02-25T18:46:18.553Z","deletedAt":null,"isSystem":false}	ru-RU	21
39	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	{"path":"http://cloud.andreyi96.beget.tech:9000/cms/f515b0ab97eef8699c697910f4a38175.png","type":"images","name":"pngwing.com (4) 1.png","filename":"f515b0ab97eef8699c697910f4a38175.png","size":367598,"id":22,"createdAt":"2025-02-25T18:46:18.553Z","updatedAt":"2025-02-25T18:46:18.553Z","deletedAt":null,"isSystem":false}	en-US	21
40	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	{"path":"http://cloud.andreyi96.beget.tech:9000/cms/f515b0ab97eef8699c697910f4a38175.png","type":"images","name":"pngwing.com (4) 1.png","filename":"f515b0ab97eef8699c697910f4a38175.png","size":367598,"id":22,"createdAt":"2025-02-25T18:46:18.553Z","updatedAt":"2025-02-25T18:46:18.553Z","deletedAt":null,"isSystem":false}	zh-CN	21
41	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	高生产率、自动化流程、节能\n	zh-CN	18
42	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	冶金工厂、金属结构生产企业\n	zh-CN	19
43	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Metallurgical plants, enterprises producing metal structures\n	en-US	19
45	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Металлургические заводы, предприятия по производству металлоконструкций\n	ru-RU	19
46	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Дробильные установки, грохоты, конвейерные системы, обогатительное оборудование\n	ru-RU	22
47	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Crushing plants, screens, conveyor systems, beneficiation equipment\n	en-US	22
50	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Durability, reliability, adaptability to challenging operating conditions\n	en-US	23
51	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	破碎设备、筛分机、输送系统、选矿设备\n	zh-CN	22
52	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Прочность, надежность, адаптация к сложным условиям эксплуатации\n	ru-RU	23
53	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Extraction of ore and non-ore materials, coal, minerals\n	en-US	24
54	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	坚固性、可靠性、适应复杂操作条件\n	zh-CN	23
55	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Добыча рудных и нерудных материалов, угля, полезных ископаемых\n	ru-RU	24
56	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	矿石和非矿石材料、煤炭、矿物的开采\n	zh-CN	24
57	2025-02-25 18:46:18.553	2025-02-27 20:06:19.045535	\N	<div><ul><li>Индивидуальные решения под специфические задачи</li><li>Обучение и тренинги для персонала</li><li>Круглосуточная техническая поддержка</li><li>Запрос коммерческого предложения</li></ul></div>	ru-RU	25
58	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	{"path":"http://cloud.andreyi96.beget.tech:9000/cms/ca88ad1cd612627c383985ad09eccd58.png","type":"images","name":"pngwing.com (4) 1.png","filename":"ca88ad1cd612627c383985ad09eccd58.png","size":390548,"id":23,"createdAt":"2025-02-25T18:46:18.553Z","updatedAt":"2025-02-25T18:46:18.553Z","deletedAt":null,"isSystem":false}	en-US	26
48	2025-02-25 18:46:18.553	2025-02-27 20:06:19.06249	\N	<div><ul><li>Customized solutions for specific tasks</li><li>Training and workshops for personnel</li><li>24/7 technical support</li><li>Request a commercial offer</li></ul></div>	en-US	25
59	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	{"path":"http://cloud.andreyi96.beget.tech:9000/cms/ca88ad1cd612627c383985ad09eccd58.png","type":"images","name":"pngwing.com (4) 1.png","filename":"ca88ad1cd612627c383985ad09eccd58.png","size":390548,"id":23,"createdAt":"2025-02-25T18:46:18.553Z","updatedAt":"2025-02-25T18:46:18.553Z","deletedAt":null,"isSystem":false}	ru-RU	26
60	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	{"path":"http://cloud.andreyi96.beget.tech:9000/cms/ca88ad1cd612627c383985ad09eccd58.png","type":"images","name":"pngwing.com (4) 1.png","filename":"ca88ad1cd612627c383985ad09eccd58.png","size":390548,"id":23,"createdAt":"2025-02-25T18:46:18.553Z","updatedAt":"2025-02-25T18:46:18.553Z","deletedAt":null,"isSystem":false}	zh-CN	26
49	2025-02-25 18:46:18.553	2025-02-27 20:06:19.06421	\N	<div><ul><li>针对特定任务的个性化解决方案</li><li>员工培训</li><li>全天候技术支持</li><li>请求商业报价</li></ul></div>	zh-CN	25
61	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Реакторы, сепараторы, насосы, теплообменники, системы фильтрации\n	ru-RU	27
62	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	<div><ul><li>Technical consultations from industry experts</li><li>Equipment adaptation to customer requirements</li><li>Warranty and post-warranty service</li><li>Request a commercial offer</li></ul></div>	en-US	30
63	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	<div><ul><li>来自行业专家的技术咨询</li><li>根据客户需求定制设备</li><li>保修及售后维护</li><li>请求商业报价</li></ul></div>	zh-CN	30
64	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	{"path":"http://cloud.andreyi96.beget.tech:9000/cms/a7f6d68ddd390c561737fbd60c5ecd9b.png","type":"images","name":"pngwing.com (4) 1.png","filename":"a7f6d68ddd390c561737fbd60c5ecd9b.png","size":384798,"id":24,"createdAt":"2025-02-25T18:46:18.553Z","updatedAt":"2025-02-25T18:46:18.553Z","deletedAt":null,"isSystem":false}	ru-RU	31
65	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	{"path":"http://cloud.andreyi96.beget.tech:9000/cms/a7f6d68ddd390c561737fbd60c5ecd9b.png","type":"images","name":"pngwing.com (4) 1.png","filename":"a7f6d68ddd390c561737fbd60c5ecd9b.png","size":384798,"id":24,"createdAt":"2025-02-25T18:46:18.553Z","updatedAt":"2025-02-25T18:46:18.553Z","deletedAt":null,"isSystem":false}	en-US	31
66	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	反应器、分离器、泵、热交换器、过滤系统\n	zh-CN	27
67	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Reactors, separators, pumps, heat exchangers, filtration systems\n	en-US	27
68	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Химическая стойкость, надежность, соответствие международным стандартам\n	ru-RU	28
69	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Chemical resistance, reliability, compliance with international standards\n	en-US	28
70	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	化学稳定性、可靠性、符合国际标准\n	zh-CN	28
71	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	{"path":"http://cloud.andreyi96.beget.tech:9000/cms/a7f6d68ddd390c561737fbd60c5ecd9b.png","type":"images","name":"pngwing.com (4) 1.png","filename":"a7f6d68ddd390c561737fbd60c5ecd9b.png","size":384798,"id":24,"createdAt":"2025-02-25T18:46:18.553Z","updatedAt":"2025-02-25T18:46:18.553Z","deletedAt":null,"isSystem":false}	zh-CN	31
44	2025-02-25 18:46:18.553	2025-02-27 20:16:14.968374	\N	<div><ul><li>Техническая поддержка на всех этапах проекта</li><li>Возможность модернизации существующего оборудования</li><li>Оптимизация производственных процессов</li></ul></div>	ru-RU	20
72	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	化学试剂生产、石油化工、制药\n	zh-CN	29
74	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	<div><ul><li>Технические консультации от экспертов отрасли</li><li>Адаптация оборудования под требования клиента</li><li>Гарантийное и постгарантийное обслуживание</li><li>Запрос коммерческого предложения</li></ul></div>	ru-RU	30
100	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	<div><ul><li>Гарантия от производителя</li><li>Наличие запасных частей и расходных материалов</li><li>Сервисное обслуживание и ремонт</li><li>Запрос коммерческого предложения</li></ul></div>	ru-RU	40
141	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	混凝土搅拌站、搅拌机、混凝土搅拌车、混凝土泵、混凝土布料机、振动板、深层振动器、抹平机、研磨机\n	zh-CN	52
170	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Assistance in entering international markets, export of equipment and technologies from China to other countries\n	en-US	82
173	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	<ul><li>In-depth knowledge of international markets and requirements</li><li>Assistance in certification and product adaptation</li><li>Full logistics support and customs clearance</li></ul>	en-US	85
176	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Assistance for foreign companies entering the Chinese market, including the import of equipment and technologies into China\n	en-US	87
75	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Production of chemical reagents, petrochemicals, pharmaceuticals\n	en-US	29
101	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	仓储物流、生产、建筑、购物中心\n	zh-CN	39
142	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Высокая производительность, надежность, точность дозирования компонентов\n	ru-RU	53
171	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	协助进入国际市场，将设备和技术从中国出口到其他国家。\n	zh-CN	82
174	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	<ul><li>深入了解国际市场及其要求</li><li>协助产品认证和适应性调整</li><li>全面的物流支持和海关清关</li></ul>	zh-CN	85
177	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	协助外国公司进入中国市场，包括将设备和技术进口到中国。\n	zh-CN	87
179	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	<div><ul><li>Knowledge of local legislation and regulatory requirements</li><li>Support in marketing and product promotion</li><li>Search for reliable partners and customers</li><li>Request a Consultation</li></ul></div>	en-US	90
76	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Линии для производства пищевых продуктов, упаковочные машины, стерилизаторы, пастеризаторы\n	ru-RU	32
77	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	<div><ul><li>Custom design of production lines</li><li>Personnel training and turnkey launch</li><li>Ongoing support and technology updates</li><li>Request a commercial offer</li></ul></div>	en-US	35
78	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	<div><ul><li>个性化设计的生产线</li><li>员工培训和“交钥匙”启动</li><li>持续的技术支持与更新</li><li>请求商业报价</li></ul></div>	zh-CN	35
102	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Складская логистика, производство, строительство, торговые центры\n	ru-RU	39
143	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	高生产率、可靠性、精确的成分计量\n	zh-CN	53
172	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	<ul><li>Глубокое знание международных рынков и требований</li><li>Помощь в сертификации и адаптации продукции</li><li>Полное логистическое сопровождение и таможенное оформление</li></ul>	ru-RU	85
175	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Помощь иностранным компаниям в выходе на китайский рынок, включая импорт оборудования и технологий в Китай\n	ru-RU	87
180	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	<div><ul><li>熟悉当地法律法规和监管要求</li><li>提供市场营销和产品推广支持</li><li>寻找可靠的合作伙伴和客户</li><li>请求咨询</li></ul></div>	zh-CN	90
181	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	{"path":"http://cloud.andreyi96.beget.tech:9000/cms/f441ff437d92d423c3a5c0693f5f668e.png","type":"images","name":"pngwing.com (4) 1.png","filename":"f441ff437d92d423c3a5c0693f5f668e.png","size":302874,"id":30,"createdAt":"2025-02-25T18:46:18.553Z","updatedAt":"2025-02-25T18:46:18.553Z","deletedAt":null,"isSystem":false}	ru-RU	36
79	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Food production lines, packaging machines, sterilizers, pasteurizers\n\n	en-US	32
103	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Ленточные, роликовые, модульные конвейеры различных конфигураций\n	ru-RU	42
104	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	<div><ul><li>Custom project tailored to your needs</li><li>Installation and commissioning</li><li>Warranty and post-warranty service</li><li>Request a commercial offer</li></ul></div>	en-US	45
105	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	<div><ul><li>针对您的需求定制的个性化项目</li><li>安装与调试服务</li><li>保修及售后维护</li><li>请求商业报价</li></ul></div>	zh-CN	45
106	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	{"path":"http://cloud.andreyi96.beget.tech:9000/cms/8805f1491762fe56012cb99fa2840b4d.png","type":"images","name":"pngwing.com (4) 1.png","filename":"8805f1491762fe56012cb99fa2840b4d.png","size":184414,"id":27,"createdAt":"2025-02-25T18:46:18.553Z","updatedAt":"2025-02-25T18:46:18.553Z","deletedAt":null,"isSystem":false}	ru-RU	46
108	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	{"path":"http://cloud.andreyi96.beget.tech:9000/cms/8805f1491762fe56012cb99fa2840b4d.png","type":"images","name":"pngwing.com (4) 1.png","filename":"8805f1491762fe56012cb99fa2840b4d.png","size":184414,"id":27,"createdAt":"2025-02-25T18:46:18.553Z","updatedAt":"2025-02-25T18:46:18.553Z","deletedAt":null,"isSystem":false}	en-US	46
109	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	{"path":"http://cloud.andreyi96.beget.tech:9000/cms/8805f1491762fe56012cb99fa2840b4d.png","type":"images","name":"pngwing.com (4) 1.png","filename":"8805f1491762fe56012cb99fa2840b4d.png","size":184414,"id":27,"createdAt":"2025-02-25T18:46:18.553Z","updatedAt":"2025-02-25T18:46:18.553Z","deletedAt":null,"isSystem":false}	zh-CN	46
144	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	High performance, reliability, precise component dosing\n	en-US	53
182	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	{"path":"http://cloud.andreyi96.beget.tech:9000/cms/f441ff437d92d423c3a5c0693f5f668e.png","type":"images","name":"pngwing.com (4) 1.png","filename":"f441ff437d92d423c3a5c0693f5f668e.png","size":302874,"id":30,"createdAt":"2025-02-25T18:46:18.553Z","updatedAt":"2025-02-25T18:46:18.553Z","deletedAt":null,"isSystem":false}	en-US	36
80	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	食品生产线、包装机、杀菌器、巴氏杀菌器\n	zh-CN	32
107	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	各种配置的皮带式、滚轴式和模块化输送机\n	zh-CN	42
145	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Строительные компании, предприятия по производству строительных материалов\n	ru-RU	54
183	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	{"path":"http://cloud.andreyi96.beget.tech:9000/cms/f441ff437d92d423c3a5c0693f5f668e.png","type":"images","name":"pngwing.com (4) 1.png","filename":"f441ff437d92d423c3a5c0693f5f668e.png","size":302874,"id":30,"createdAt":"2025-02-25T18:46:18.553Z","updatedAt":"2025-02-25T18:46:18.553Z","deletedAt":null,"isSystem":false}	zh-CN	36
81	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Compliance with sanitary standards, automation, energy efficiency\n	en-US	33
110	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Belt, roller, modular conveyors in various configurations\n	en-US	42
146	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	<div><ul><li>Полный цикл производства оборудования</li><li>Адаптация под специфические требования проекта</li><li>Техническая поддержка и обучение персонала</li><li>Запрос коммерческого предложения</li></ul></div>	ru-RU	55
82	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	符合卫生标准、自动化、节能\n	zh-CN	33
111	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Производственные линии, складские комплексы, горнодобывающая и перерабатывающая промышленность\n	ru-RU	44
147	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	建筑公司、建筑材料生产企业\n	zh-CN	54
83	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Соответствие санитарным нормам, автоматизация, энергоэффективность\n	ru-RU	33
112	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	坚固的结构，根据客户需求定制，多种涂层和材料选择\n	zh-CN	43
148	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Подбор оптимального оборудования на основе анализа ваших потребностей и особенностей производства\n	ru-RU	57
153	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	<ul><li>Time and resource savings</li><li>Access to a wide database of verified suppliers</li><li>Independent expert evaluation and recommendations</li></ul>	en-US	60
84	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Beverage, confectionery, meat, and dairy products production\n	en-US	34
113	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Прочная конструкция, адаптация к требованиям клиента, различные типы покрытий и материалов\n	ru-RU	43
149	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Selection of optimal equipment based on an analysis of your needs and production specifics\n	en-US	57
85	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	<div><ul><li>Индивидуальный дизайн производственных линий</li><li>Обучение персонала и запуск "под ключ"</li><li>Постоянная поддержка и обновление технологий</li><li>Запрос коммерческого предложения</li></ul></div>	ru-RU	35
114	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Robust construction, customization to client requirements, various types of coatings and materials\n	en-US	43
150	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	根据对您的需求和生产特点的分析，选择最佳设备。\n	zh-CN	57
152	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	<ul><li>节省时间和资源</li><li>访问广泛的经过验证的供应商数据库</li><li>独立的专家评估和建议</li></ul>	zh-CN	60
86	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Производство напитков, кондитерских изделий, мясных и молочных продуктов\n	ru-RU	34
115	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Production lines, warehouse complexes, mining and processing industries\n	en-US	44
151	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	<ul><li>Экономия времени и ресурсов</li><li>Доступ к широкой базе проверенных поставщиков</li><li>Независимая экспертная оценка и рекомендации</li></ul>	ru-RU	60
87	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	饮料、糖果、肉类和乳制品生产\n	zh-CN	34
116	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	<div><ul><li>Индивидуальный проект под ваши задачи</li><li>Монтаж и пуско-наладочные работы</li><li>Гарантийное и постгарантийное обслуживание</li><li>Запрос коммерческого предложения</li></ul></div>	ru-RU	45
155	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	将现代技术（包括人工智能和自动化）整合到现有的生产流程中。\n	zh-CN	67
157	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	<ul><li>提高效率和生产力</li><li>降低成本并优化资源</li><li>提高产品和服务质量</li></ul>	zh-CN	70
14	2025-02-25 18:46:18.553	2025-02-27 20:14:31.480515	\N	<div>Гражданское и промышленное строительство, возведение жилых комплексов, инфраструктурные проекты</div><div><ul><li>Гарантия качества от производителя</li><li>Техническая поддержка и сервисное обслуживание</li><li>Индивидуальный подход к каждому проекту</li></ul></div>	ru-RU	10
117	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	生产线、仓储中心、采矿和加工行业\n	zh-CN	44
156	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Integration of modern technologies, including artificial intelligence and automation, into existing production processes\n	en-US	67
88	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Электрические и дизельные погрузчики с грузоподъемностью от 1 до 10 тонн\n	ru-RU	37
89	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	<div><ul><li>Manufacturer's warranty</li><li>Availability of spare parts and consumables</li><li>Service maintenance and repair</li><li>Request a commercial offer</li></ul></div>	en-US	40
90	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	<div><ul><li>制造商提供的保修</li><li>备件和耗材供应充足</li><li>售后服务与维修</li><li>请求商业报价</li></ul></div>	zh-CN	40
93	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	{"path":"http://cloud.andreyi96.beget.tech:9000/cms/f02bf4de3aa35d4b1616c0112a33754f.png","type":"images","name":"pngwing.com (4) 1.png","filename":"f02bf4de3aa35d4b1616c0112a33754f.png","size":291995,"id":26,"createdAt":"2025-02-25T18:46:18.553Z","updatedAt":"2025-02-25T18:46:18.553Z","deletedAt":null,"isSystem":false}	ru-RU	41
118	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Разработка концепции, проектирование, подбор и поставка оборудования, монтаж, пуско-наладочные работы, обучение персонала\n	ru-RU	47
123	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Integration of modern technologies, process automation, compliance with international and safety standards\n	en-US	48
126	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	食品工业、冶金、化工、建材生产、包装\n	zh-CN	49
128	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	<ul><li>A single contractor for all project stages</li><li>Cost and implementation time optimization</li><li>Quality assurance and adherence to deadlines</li></ul>	en-US	50
132	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	{"path":"http://cloud.andreyi96.beget.tech:9000/cms/e0e7839836114b51b5fee8a9b05d6dda.png","type":"images","name":"pngwing.com (4) 1.png","filename":"e0e7839836114b51b5fee8a9b05d6dda.png","size":367918,"id":28,"createdAt":"2025-02-25T18:46:18.553Z","updatedAt":"2025-02-25T18:46:18.553Z","deletedAt":null,"isSystem":false}	zh-CN	51
154	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Интеграция современных технологий, включая искусственный интеллект и автоматизацию, в существующие производственные процессы\n	ru-RU	67
159	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	<ul><li>Increased efficiency and productivity</li><li>Cost reduction and resource optimization</li><li>Improved product and service quality</li></ul>	en-US	70
91	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	载重量从1吨到10吨的电动和柴油叉车\n	zh-CN	37
95	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	{"path":"http://cloud.andreyi96.beget.tech:9000/cms/f02bf4de3aa35d4b1616c0112a33754f.png","type":"images","name":"pngwing.com (4) 1.png","filename":"f02bf4de3aa35d4b1616c0112a33754f.png","size":291995,"id":26,"createdAt":"2025-02-25T18:46:18.553Z","updatedAt":"2025-02-25T18:46:18.553Z","deletedAt":null,"isSystem":false}	en-US	41
119	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Concept development, design, equipment selection and supply, installation, commissioning, personnel training\n	en-US	47
124	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Пищевая промышленность, металлургия, химическая промышленность, производство строительных материалов, упаковка\n	ru-RU	49
129	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	<ul><li>项目各阶段的单一承包商</li><li>优化成本和实施时间</li><li>质量保证和按时交付</li></ul>	zh-CN	50
130	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	{"path":"http://cloud.andreyi96.beget.tech:9000/cms/e0e7839836114b51b5fee8a9b05d6dda.png","type":"images","name":"pngwing.com (4) 1.png","filename":"e0e7839836114b51b5fee8a9b05d6dda.png","size":367918,"id":28,"createdAt":"2025-02-25T18:46:18.553Z","updatedAt":"2025-02-25T18:46:18.553Z","deletedAt":null,"isSystem":false}	en-US	51
158	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	<ul><li>Повышение эффективности и производительности</li><li>Снижение издержек и оптимизация ресурсов</li><li>Улучшение качества продукции и услуг</li></ul>	ru-RU	70
92	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Electric and diesel forklifts with lifting capacities from 1 to 10 tons\n	en-US	37
96	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	{"path":"http://cloud.andreyi96.beget.tech:9000/cms/f02bf4de3aa35d4b1616c0112a33754f.png","type":"images","name":"pngwing.com (4) 1.png","filename":"f02bf4de3aa35d4b1616c0112a33754f.png","size":291995,"id":26,"createdAt":"2025-02-25T18:46:18.553Z","updatedAt":"2025-02-25T18:46:18.553Z","deletedAt":null,"isSystem":false}	zh-CN	41
120	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	概念开发、设计、设备选型与供应、安装、调试、员工培训\n	zh-CN	47
121	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	现代技术的整合、流程自动化、符合国际质量和安全标准\n	zh-CN	48
127	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	<div><ul><li>Единый подрядчик на всех этапах проекта</li><li>Оптимизация затрат и сроков реализации</li><li>Гарантия качества и соблюдение сроков</li></ul></div><div><br></div>	ru-RU	50
160	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Анализ текущих процессов, выявление узких мест и разработка стратегий по их улучшению и оптимизации\n	ru-RU	72
167	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	We provide export and import services for equipment and technologies, ensuring effective interaction between companies from different countries.\n	en-US	77
94	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Высокая маневренность, прочность конструкции, эргономичный дизайн кабины\n	ru-RU	38
122	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Интеграция современных технологий, автоматизация процессов, соответствие международным стандартам качества и безопасности\n	ru-RU	48
125	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Food industry, metallurgy, chemical industry, construction materials production, packaging\n	en-US	49
131	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	{"path":"http://cloud.andreyi96.beget.tech:9000/cms/e0e7839836114b51b5fee8a9b05d6dda.png","type":"images","name":"pngwing.com (4) 1.png","filename":"e0e7839836114b51b5fee8a9b05d6dda.png","size":367918,"id":28,"createdAt":"2025-02-25T18:46:18.553Z","updatedAt":"2025-02-25T18:46:18.553Z","deletedAt":null,"isSystem":false}	ru-RU	51
161	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	分析当前流程，识别瓶颈并制定改进和优化策略。\n	zh-CN	72
165	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	<div><ul><li>提高劳动生产率</li><li>缩短生产周期时间</li><li>改善质量管理</li><li>请求咨询</li></ul></div>	zh-CN	75
168	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	我们提供设备和技术的进出口服务，确保不同国家公司之间的有效合作。\n	zh-CN	77
97	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	高机动性、坚固的结构、符合人体工程学的驾驶室设计\n	zh-CN	38
133	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Бетонные заводы, бетоносмесители, автобетоносмесители, бетононасосы, бетоноукладчики, виброплиты, глубинные вибраторы, затирочные машины, шлифовальные машины\n	ru-RU	52
134	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	<div><ul><li>Full-cycle equipment production</li><li>Customization to specific project requirements</li><li>Technical support and personnel training</li><li>Request a commercial offer</li></ul></div>	en-US	55
135	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	<div><ul><li>设备生产的全流程服务</li><li>根据项目的特定要求进行调整</li><li>技术支持与员工培训</li><li>请求商业报价</li></ul></div>	zh-CN	55
136	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	{"path":"http://cloud.andreyi96.beget.tech:9000/cms/eaa8a1b674a3f981c838e9ff2e609c82.png","type":"images","name":"pngwing.com (4) 1.png","filename":"eaa8a1b674a3f981c838e9ff2e609c82.png","size":354639,"id":29,"createdAt":"2025-02-25T18:46:18.553Z","updatedAt":"2025-02-25T18:46:18.553Z","deletedAt":null,"isSystem":false}	ru-RU	56
137	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	{"path":"http://cloud.andreyi96.beget.tech:9000/cms/eaa8a1b674a3f981c838e9ff2e609c82.png","type":"images","name":"pngwing.com (4) 1.png","filename":"eaa8a1b674a3f981c838e9ff2e609c82.png","size":354639,"id":29,"createdAt":"2025-02-25T18:46:18.553Z","updatedAt":"2025-02-25T18:46:18.553Z","deletedAt":null,"isSystem":false}	en-US	56
138	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	{"path":"http://cloud.andreyi96.beget.tech:9000/cms/eaa8a1b674a3f981c838e9ff2e609c82.png","type":"images","name":"pngwing.com (4) 1.png","filename":"eaa8a1b674a3f981c838e9ff2e609c82.png","size":354639,"id":29,"createdAt":"2025-02-25T18:46:18.553Z","updatedAt":"2025-02-25T18:46:18.553Z","deletedAt":null,"isSystem":false}	zh-CN	56
162	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Analysis of current processes, identification of bottlenecks, and development of strategies for their improvement and optimization\n	en-US	72
164	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	<div><ul><li>Increased labor productivity</li><li>Reduced production cycle time</li><li>Improved quality management</li><li>Request a Consultation</li></ul></div>	en-US	75
98	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	High maneuverability, robust construction, ergonomic cabin design\n	en-US	38
139	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Concrete plants, concrete mixers, truck mixers, concrete pumps, concrete placers, vibratory plates, deep vibrators, trowel machines, grinding machines\n	en-US	52
163	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	<div><ul><li>Повышение производительности труда</li><li>Сокращение времени цикла производства</li><li>Улучшение управления качеством</li><li>Запрос консультации</li></ul></div>	ru-RU	75
166	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Мы оказываем услуги по экспорту и импорту оборудования и технологий, обеспечивая эффективное взаимодействие между компаниями из разных стран.\n	ru-RU	77
99	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Warehouse logistics, manufacturing, construction, shopping malls\n	en-US	39
140	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Construction companies, enterprises producing building materials\n	en-US	54
169	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Содействие в выходе на международные рынки, экспорт оборудования и технологий из Китая в другие страны\n	ru-RU	82
178	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	<div><ul><li>Знание местного законодательства и регуляторных требований</li><li>Поддержка в маркетинге и продвижении продукции</li><li>Поиск надежных партнеров и клиентов</li><li>Запрос консультации</li></ul></div>	ru-RU	90
73	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Производство химических реагентов, нефтехимия, фармацевтика\n	ru-RU	29
\.


--
-- Data for Name: pages_sections; Type: TABLE DATA; Schema: public; Owner: postgress
--

COPY public.pages_sections (id, "createdAt", "updatedAt", "deletedAt", "pagesId") FROM stdin;
1	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	11
2	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	11
\.


--
-- Data for Name: pages_sections_description_value; Type: TABLE DATA; Schema: public; Owner: postgress
--

COPY public.pages_sections_description_value (id, "createdAt", "updatedAt", "deletedAt", value, lang, "sectionId") FROM stdin;
1	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	我们提供全面的解决方案，打造完全适应您业务需求的生产线。	zh-CN	1
2	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Предлагаем комплексные решения по созданию производственных линий, полностью адаптированных под ваши бизнес-задачи	ru-RU	1
3	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	We offer comprehensive solutions for creating production lines fully adapted to your business needs.\n	en-US	1
4	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Наша команда экспертов готова предоставить профессиональные консультации и разработать инновационные решения для вашего бизнеса.	ru-RU	2
5	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	我们的专家团队随时准备为您提供专业咨询，并为您的业务开发创新解决方案	zh-CN	2
6	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Our team of experts is ready to provide professional consultations and develop innovative solutions for your business	en-US	2
\.


--
-- Data for Name: pages_sections_title_value; Type: TABLE DATA; Schema: public; Owner: postgress
--

COPY public.pages_sections_title_value (id, "createdAt", "updatedAt", "deletedAt", value, lang, "sectionId") FROM stdin;
1	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Производственные линии под ключ	ru-RU	1
2	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Turnkey Production Lines	en-US	1
3	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	交钥匙生产线	zh-CN	1
4	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Консалтинг и разработка технологий	ru-RU	2
5	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	咨询与技术开发	zh-CN	2
6	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Consulting and Technology Development	en-US	2
\.


--
-- Data for Name: pages_seo; Type: TABLE DATA; Schema: public; Owner: postgress
--

COPY public.pages_seo (id, "createdAt", "updatedAt", "deletedAt") FROM stdin;
1	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N
2	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N
3	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N
4	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N
5	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N
6	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N
7	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N
8	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N
9	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N
10	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N
\.


--
-- Data for Name: pages_seo_params; Type: TABLE DATA; Schema: public; Owner: postgress
--

COPY public.pages_seo_params (id, "createdAt", "updatedAt", "deletedAt", content, lang, "fieldType", "pagesSeoId") FROM stdin;
1	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Главная	ru-RU	title	1
2	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Home	en-US	keywords	1
3	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	家	zh-CN	title	1
4	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Главная	ru-RU	description	1
5	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Главная	ru-RU	keywords	1
6	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Home	en-US	title	1
7	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Home	en-US	description	1
8	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	家	zh-CN	keywords	1
9	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	家	zh-CN	description	1
10	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	О компании	ru-RU	description	2
11	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	О компании	ru-RU	title	2
12	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	About Us	en-US	title	2
13	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	О компании	ru-RU	keywords	2
14	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	About Us	en-US	keywords	2
15	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	About Us	en-US	description	2
16	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	关于我们	zh-CN	keywords	2
17	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	关于我们	zh-CN	description	2
18	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	关于我们	zh-CN	title	2
19	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Контакты	ru-RU	keywords	3
20	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Контакты	ru-RU	title	3
21	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Contacts	en-US	title	3
22	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Контакты	ru-RU	description	3
23	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Contacts	en-US	description	3
24	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Contacts	en-US	keywords	3
26	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	联络人	zh-CN	title	3
25	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	联络人	zh-CN	keywords	3
27	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	联络人	zh-CN	description	3
28	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Политика конфиденциальности	ru-RU	keywords	4
29	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Политика конфиденциальности	ru-RU	title	4
30	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Privacy Policy	en-US	description	4
31	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Политика конфиденциальности	ru-RU	description	4
32	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	隐私政策	zh-CN	title	4
33	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Privacy Policy	en-US	keywords	4
34	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	隐私政策	zh-CN	description	4
35	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	隐私政策	zh-CN	keywords	4
36	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Privacy Policy	en-US	title	4
37	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Клиенты	ru-RU	title	5
38	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Сlients	en-US	description	5
39	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Клиенты	ru-RU	description	5
40	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Клиенты	ru-RU	keywords	5
41	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	客户群	zh-CN	title	5
42	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Сlients	en-US	title	5
43	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Сlients	en-US	keywords	5
44	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	客户群	zh-CN	keywords	5
45	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	客户群	zh-CN	description	5
46	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Партнерам	ru-RU	description	6
47	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Партнерам	ru-RU	title	6
48	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Партнерам	ru-RU	keywords	6
49	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	合作伙伴	zh-CN	description	6
50	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Partners	en-US	title	6
51	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Partners	en-US	description	6
52	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	合作伙伴	zh-CN	title	6
53	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	合作伙伴	zh-CN	keywords	6
54	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Partners	en-US	keywords	6
55	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Карьера	ru-RU	description	7
56	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Карьера	ru-RU	keywords	7
58	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Карьера	ru-RU	title	7
57	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Career	en-US	title	7
59	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Career	en-US	keywords	7
60	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	职业生涯	zh-CN	title	7
61	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Career	en-US	description	7
62	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	职业生涯	zh-CN	description	7
63	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	职业生涯	zh-CN	keywords	7
64	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	News	en-US	title	8
65	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Новости	ru-RU	title	8
66	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Новости	ru-RU	keywords	8
67	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	News	en-US	keywords	8
68	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	新闻	zh-CN	keywords	8
69	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Новости	ru-RU	description	8
71	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	新闻	zh-CN	description	8
70	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	News	en-US	description	8
72	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	新闻	zh-CN	title	8
73	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Services	en-US	description	9
74	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Услуги	ru-RU	keywords	9
75	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	服务	zh-CN	description	9
76	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Услуги	ru-RU	description	9
77	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Услуги	ru-RU	title	9
78	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Services	en-US	title	9
79	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Services	en-US	keywords	9
80	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	服务	zh-CN	title	9
81	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	服务	zh-CN	keywords	9
84	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Продукты	ru-RU	keywords	10
82	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Products	en-US	description	10
85	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Продукты	ru-RU	description	10
83	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Products	en-US	title	10
86	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Продукты	ru-RU	title	10
87	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Products	en-US	keywords	10
88	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	产品中心	zh-CN	title	10
89	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	产品中心	zh-CN	description	10
90	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	产品中心	zh-CN	keywords	10
\.


--
-- Data for Name: records; Type: TABLE DATA; Schema: public; Owner: postgress
--

COPY public.records (id, "createdAt", "updatedAt", "deletedAt", "countView", "titleId", "descriptionId", "pagesId", "authorId", "seoId") FROM stdin;
1	2025-02-27 19:26:24.223	2025-02-27 19:26:24.223	\N	0	1	1	8	\N	1
2	2025-02-27 19:28:15.651	2025-02-27 19:28:15.651	\N	0	2	2	8	\N	2
3	2025-02-27 19:28:50.929	2025-02-27 19:28:50.929	\N	0	3	3	8	\N	3
4	2025-02-27 19:39:27.619	2025-02-27 19:39:27.619	\N	0	4	4	9	\N	4
5	2025-02-27 19:40:09.047	2025-02-27 19:40:09.047	\N	0	5	5	9	\N	5
6	2025-02-27 19:40:52.861	2025-02-27 19:40:52.861	\N	0	6	6	9	\N	6
7	2025-02-27 19:41:22.579	2025-02-27 19:41:22.579	\N	0	7	7	9	\N	7
8	2025-02-27 19:41:48.911	2025-02-27 19:41:48.911	\N	0	8	8	9	\N	8
9	2025-02-27 19:43:17.693	2025-02-27 19:43:17.693	\N	0	9	9	10	\N	9
10	2025-02-27 19:43:51.247	2025-02-27 19:43:51.247	\N	0	10	10	10	\N	10
11	2025-02-27 19:44:28.395	2025-02-27 19:44:28.395	\N	0	11	11	10	\N	11
12	2025-02-27 19:52:25.533	2025-02-27 19:52:25.533	\N	0	12	12	12	\N	12
13	2025-02-27 19:58:37.498	2025-02-27 19:58:37.498	\N	0	13	13	12	\N	13
14	2025-02-27 20:01:15.442	2025-02-27 20:01:15.442	\N	0	14	14	12	\N	14
15	2025-02-27 20:03:20.177	2025-02-27 20:03:20.177	\N	0	15	15	12	\N	15
16	2025-02-27 20:06:22.407	2025-02-27 20:06:22.407	\N	0	16	16	12	\N	16
17	2025-02-27 20:10:18.534	2025-02-27 20:10:18.534	\N	0	17	17	12	\N	17
18	2025-02-27 20:17:02.164	2025-02-27 20:17:02.164	\N	0	18	18	12	\N	18
19	2025-02-27 20:19:21.842	2025-02-27 20:19:21.842	\N	0	19	19	12	\N	19
20	2025-02-27 20:17:16.427	2025-02-27 20:17:16.427	\N	0	20	20	11	\N	20
21	2025-02-27 20:21:31.907	2025-02-27 20:21:31.907	\N	0	21	21	12	\N	21
22	2025-02-27 20:22:09.007	2025-02-27 20:22:09.007	\N	0	22	22	11	\N	22
23	2025-02-27 20:24:55.366	2025-02-27 20:26:46.4945	2025-02-27 20:26:46.4945	0	23	23	11	\N	23
24	2025-02-27 20:24:42.167	2025-02-27 20:24:42.167	\N	0	24	24	11	\N	24
25	2025-02-27 20:26:49.732	2025-02-27 20:26:49.732	\N	0	25	25	11	\N	25
26	2025-02-27 20:27:05.936	2025-02-27 20:27:05.936	\N	0	26	26	11	\N	26
27	2025-02-27 20:28:27.684	2025-02-27 20:28:27.684	\N	0	27	27	11	\N	27
28	2025-02-27 20:28:27.523	2025-02-27 20:28:27.523	\N	0	28	28	11	\N	28
\.


--
-- Data for Name: records_description; Type: TABLE DATA; Schema: public; Owner: postgress
--

COPY public.records_description (id, "createdAt", "updatedAt", "deletedAt") FROM stdin;
1	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N
2	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N
3	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N
4	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N
5	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N
6	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N
7	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N
8	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N
9	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N
10	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N
11	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N
12	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N
13	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N
14	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N
15	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N
16	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N
17	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N
18	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N
19	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N
20	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N
21	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N
22	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N
23	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N
24	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N
25	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N
26	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N
27	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N
28	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N
\.


--
-- Data for Name: records_description_value; Type: TABLE DATA; Schema: public; Owner: postgress
--

COPY public.records_description_value (id, "createdAt", "updatedAt", "deletedAt", value, lang, "recordDescriptionId") FROM stdin;
1	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	В рамках Восточного экономического форума, проходившего во Владивостоке, SA International подписала стратегическое соглашение с правительством Российской Федерации о строительстве завода по производству портового оборудования. Этот проект станет важным шагом в развитии инфраструктуры российских портов и укреплении экономического сотрудничества между Китаем и Россией.	ru-RU	1
2	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	During the Eastern Economic Forum held in Vladivostok, SA International signed a strategic agreement with the Russian Federation government to construct a plant for port equipment manufacturing. This project will be a significant step in developing the infrastructure of Russian ports and strengthening economic cooperation between China and Russia.	en-US	1
3	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	在东方经济论坛（VEF）期间，上海亚际机电有限公司与俄罗斯联邦政府签署了关于建设港口设备制造厂的战略协议。该项目将成为推动俄罗斯港口基础设施发展的重要一步，并进一步加强中俄经济合作。	zh-CN	1
4	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	В связи с возникающими трудностями вмеждународных платежах между Россией иКитаем, SA International провела серию семинаров и встреч с представителями банков и финансовых организаций. Мы представили альтернативные решения и механизмы для обеспечения бесперебойных финансовых операций и поддержки наших клиентов в текущих условиях.	ru-RU	2
5	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Amid difficulties in international payments between Russia and China, SA International held a series of seminars and meetings with representatives of banks and financial organizations. We introduced alternative solutions and mechanisms to ensure smooth financial operations and support our clients in current conditions.	en-US	2
6	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	由于中俄国际支付中遇到的困难，上海亚际机电有限公司举行了一系列研讨会与银行和金融机构的代表会晤。我们提出了替代解决方案和机制，以确保国际支付的顺畅进行，并为我们的客户提供支持。	zh-CN	2
7	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	SA International объявляет о создании SALogistics, специализированного подразделения в составе SIBC Group, которое будет отвечать за все аспекты логистики. Новая компания предоставит полный спектр логистических услуг, включая транспортировку, складирование, таможенное оформление и управление цепочками поставок, что позволит нашим клиентам получить комплексное обслуживание "под ключ".	ru-RU	3
8	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	SA International announces the creation of SA Logistics, a specialized division within SIBC Group, responsible for all aspects of logistics. The new company will provide a full range of logistics services, including transportation, warehousing, customs clearance, and supply chain management, offering our clients comprehensive turnkey services.<br>	en-US	3
9	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	上海亚际机电有限公司宣布成立上海亚际物流有限公司，作为 SIBC集团的一个专业部门，负责处理所有物流方面的事务。新公司将提供全面的物流服务，包括运输、仓储、海关清关和供应链管理，确保为我们的客户提供一站式服务。	zh-CN	3
10	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N		ru-RU	4
11	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N		en-US	4
12	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N		zh-CN	4
13	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N		ru-RU	5
14	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N		en-US	5
15	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N		zh-CN	5
16	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N		ru-RU	6
17	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N		en-US	6
18	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N		zh-CN	6
19	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N		en-US	7
20	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N		zh-CN	7
21	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N		ru-RU	7
22	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N		ru-RU	8
23	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N		en-US	8
24	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N		zh-CN	8
25	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Официальное заявление о подписании соглашения о строительстве завода по производству портового оборудования в России.	ru-RU	9
26	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	An official statement on signing an agreement for constructing a plant for port equipment manufacturing in Russia.	en-US	9
27	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	在东方经济论坛（VEF）上，关于建设港口设备制造厂的协议正式签署。	zh-CN	9
28	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	SA International объявляет о создании нового логистического подразделения, призванного улучшить качество и эффективность логистических услуг для наших клиентов.	ru-RU	10
29	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	An official statement on signing an agreement for constructing a plant for port equipment manufacturing in Russia.	en-US	10
30	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	上海亚际机电有限公司宣布成立新的物流部门，旨在提高我们的客户物流服务的质量和效率。	zh-CN	10
31	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	An official announcement of the start of construction for a robotic manipulator manufacturing plant aimed at developing industrial automation in the region.	en-US	11
32	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Официальный анонс начала строительства завода по производству роботизированных манипуляторов, направленного на развитие промышленной автоматизации в регионе	ru-RU	11
33	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	宣布在俄罗斯启动机器人操控器制造厂建设，推动地区工业自动化发展。	zh-CN	11
34	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	We provide reliable and modern construction equipment necessary for the successful execution of projects of any complexity.<br>	en-US	12
36	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	我们提供可靠且现代化的建筑设备，这些设备对于成功完成任何复杂项目的必要条件。<br>	zh-CN	12
35	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	<span data-metadata="<!--(figmeta)eyJmaWxlS2V5IjoiSlVQN0dKcTNNRWFTRUU3UVJERHBEWiIsInBhc3RlSUQiOjcwNzk0ODE0NywiZGF0YVR5cGUiOiJzY2VuZSJ9Cg==(/figmeta)-->"></span><span data-buffer="<!--(figma)ZmlnLWtpd2lQAAAAbloAALW9CZxsSVXgHffmUlWv3tL7xr6723Q3i7u5VVW+l1vnzarXzThWZ1XeepW8rMw0b9br95gNERERERERERERERERERERERERERERERERERnGYRjGYRjGYZjvf07EXbJeNfr9vt/Xv351I06cOHHixIkTJ07EvfnWXDOMov6FsHdlGhpz89l2vbUd9ErdnuG/Vrta265slFrrtYCstxnUupm8r9i1VpV0Lqivt0oNUvmgd2+jRqKgie2gJrSKiquUt4Nz9c52t9Zol6TmUqvdq6/dux1stDcb1e3Nznq3VJX6yy65XW23JL8S57u1tW4t2AB0IqjUWrVtwJ2N7bs3a917Aa5mgd1apyHAk9X62hrPU5VGvdbqbZe7tF4pBcLb6QxvZ9ubXfpRE87OBL1urdS0JeSvcXnb42vrrV6tW6r06lt0slGHMSsayq7r1irtVqtWobMZZmIOrz++OOb1BuWHVrbrrUq31oTfUoNSVweMG3Vk4Ku3GaSt3lS6PIwYlntIGyHklXZ3GV5A8F3dbreUvNHM+W69J5W81mQQdvb7UQgarZV62neQmu0tTXrnh+PBcHyhezgSnFa79ZRat02BaVe1XChY/bmTwhogU21XNoVvkl6l1NoqBaT89W57s0Mit9YtNQUvX263G7VSa7vdQZS9ersFsLBFJ9tdUkV6KM+lRl3JLtcajXonkOQK4ujRb9W0E93a+maj1N3utBv3riuRVZpqVWtVEVuCd7JXu0dYOsVwVQRwOri3WW6L1p6pt2ispVDGuV45J6K6NtgodWrb5+u9jW1X9zo3Csrg9RUZh3KjXTlH7obz9eq6avuN0GpKT29q1qr1EombN+rrGw3+SfEtAQRsZ291yW2E3W2UpNHbzpeCjfp2j5bJPWir1K2Xysr/g3su8RBNbFeQB7mHxihurj2M7ukMengpCOoBA7oN5famlD3iaq2tNVTFKHxkQki46VII8FHNdnVTW320xV+ngNxjbK7bPk/msUzITrsVKFVl4nEqmkq7CdhS/yqR4Han1JOZ+9VanBH61yigUS93SzpHvlbza3Vt+es0QydqIvWvL3c3dfp/Q7PUKq3TPSZmvbUO5Bt73VIrWGt3m2RurzSD7W69kozd45lhouBC5I5gvz8Nzw/n+73w8tyq70ODuzdL3RqlBsk6TfMY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(/figma)-->"></span><span style="white-space-collapse: preserve;">Мы предоставляем надежное и современное строительное оборудование, необходимое для успешного выполнения проектов любой сложности</span>	ru-RU	12
37	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Мы предлагаем оборудование для дорожного строительства и ремонта,соответствующее высоким стандартам качества	ru-RU	13
38	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	We offer equipment for road construction and repair that meets high quality standards.<br>	en-US	13
39	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	我们提供符合高质量标准的道路建设和维修设备。<br>	zh-CN	13
40	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	我们为冶金工业提供高科技设备。<br>	zh-CN	14
41	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	We supply high-tech equipment for the metallurgical industry.<br>	en-US	14
42	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Поставляем высокотехнологичное оборудование дляметаллургической промышленности	ru-RU	14
43	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Предоставляем оборудование для эффективной и безопасной добычи полезных ископаемых<br>	ru-RU	15
44	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	We provide equipment for efficient and safe extraction of minerals.<br>	en-US	15
45	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	我们提供用于高效且安全开采矿物的设备。<br>	zh-CN	15
46	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	We supply equipment for the chemical industry that meets strict safety and efficiency requirements.<br>	en-US	16
47	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Поставляем оборудование для химической промышленности, отвечающее строгим требованиям безопасности и эффективности<br>	ru-RU	16
48	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	我们为化工行业提供符合严格的安全性和效率要求的设备。<br>	zh-CN	16
49	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Предлагаем современные решения для пищевой промышленности, обеспечивающие высокое качество и безопасность продукции<br>	ru-RU	17
50	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	我们为食品工业提供现代化的解决方案，确保产品的高质量和安全性。<br>	zh-CN	17
51	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	We offer modern solutions for the food industry, ensuring high quality and product safety.<br>	en-US	17
52	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Производим надежные и функциональные вилочные погрузчики для различных сфер применения<br>	ru-RU	18
53	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	We manufacture reliable and functional forklifts for various applications.<br>	en-US	18
54	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	我们生产适用于各种用途的可靠且功能强大的叉车。<br>	zh-CN	18
55	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	We produce conveyor systems for efficient material transportation.<br>	en-US	19
56	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Производим конвейерные системы для эффективной транспортировки материалов<br>	ru-RU	19
57	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	我们生产用于高效运输材料的输送系统。<br>	zh-CN	19
58	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Предлагаем комплексные решения по созданию производственных линий, полностью адаптированных под ваши бизнес-задачи<br>	ru-RU	20
59	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	我们提供全面的解决方案，打造完全适应您业务需求的生产线。<br>	zh-CN	20
60	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	We offer comprehensive solutions for creating production lines fully adapted to your business needs.<br>	en-US	20
61	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	We manufacture equipment for concrete production and transportation.<br>	en-US	21
62	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Производим оборудование для производства и транспортировки бетона<br>	ru-RU	21
63	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	我们生产用于混凝土生产和运输的设备。<br>	zh-CN	21
64	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N		ru-RU	22
65	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N		en-US	22
66	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N		zh-CN	22
67	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	<br>	ru-RU	23
68	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	<br>	en-US	23
69	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N		zh-CN	23
70	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N		ru-RU	24
71	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N		en-US	24
72	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N		zh-CN	24
73	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N		en-US	25
74	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N		ru-RU	25
75	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N		zh-CN	25
76	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N		ru-RU	26
77	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N		zh-CN	26
78	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N		en-US	26
79	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N		ru-RU	27
80	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N		en-US	27
81	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N		zh-CN	27
82	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N		ru-RU	28
83	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N		zh-CN	28
84	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N		en-US	28
\.


--
-- Data for Name: records_sections_pages_sections; Type: TABLE DATA; Schema: public; Owner: postgress
--

COPY public.records_sections_pages_sections ("recordsId", "pagesSectionsId") FROM stdin;
20	1
22	2
23	2
24	2
27	2
25	2
28	2
\.


--
-- Data for Name: records_seo; Type: TABLE DATA; Schema: public; Owner: postgress
--

COPY public.records_seo (id, "createdAt", "updatedAt", "deletedAt") FROM stdin;
1	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N
2	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N
3	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N
4	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N
5	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N
6	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N
7	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N
8	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N
9	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N
10	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N
11	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N
12	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N
13	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N
14	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N
15	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N
16	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N
17	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N
18	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N
19	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N
20	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N
21	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N
22	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N
23	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N
24	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N
25	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N
26	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N
27	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N
28	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N
\.


--
-- Data for Name: records_seo_params; Type: TABLE DATA; Schema: public; Owner: postgress
--

COPY public.records_seo_params (id, "createdAt", "updatedAt", "deletedAt", content, lang, "fieldType", "recordSeoId") FROM stdin;
\.


--
-- Data for Name: records_title; Type: TABLE DATA; Schema: public; Owner: postgress
--

COPY public.records_title (id, "createdAt", "updatedAt", "deletedAt") FROM stdin;
1	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N
2	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N
3	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N
4	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N
5	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N
6	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N
7	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N
8	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N
9	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N
10	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N
11	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N
12	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N
13	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N
14	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N
15	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N
16	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N
17	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N
18	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N
19	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N
20	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N
21	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N
22	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N
23	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N
24	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N
25	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N
26	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N
27	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N
28	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N
\.


--
-- Data for Name: records_title_value; Type: TABLE DATA; Schema: public; Owner: postgress
--

COPY public.records_title_value (id, "createdAt", "updatedAt", "deletedAt", value, lang, "recordTitleId") FROM stdin;
1	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	УЧАСТИЕ SA INTERNATIONAL HA ВОСТОЧНОМ ЭКОНОМИЧЕСКОМ	ru-RU	1
2	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	上海亚际机电有限公司参加东方经济论坛（VEF）	zh-CN	1
3	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	PARTICIPATION OF SA INTERNATIONAL IN THE EASTERN ECONOMIC FORUM (EEF)	en-US	1
4	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	ПРОБЛЕМЫ С ПЛАТЕЖАМИ ИЗ РОССИИ В КИТАЙ И АЛЬТЕРНАТИВНЫЕ ПОДХОДЫ	ru-RU	2
5	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	关于从俄罗斯向中国支付的困难及替代方法	zh-CN	2
6	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	CHALLENGES IN PAYMENTS FROM RUSSIA TO CHINA AND ALTERNATIVE APPROACHES	en-US	2
7	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	ЗАПУСК SA LOGISTICS - НОВОГО ПОДРАЗДЕЛЕНИЯ SIBC GROUP	ru-RU	3
8	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	上海亚际物流有限公司启动 —— SIBC集团新部门	zh-CN	3
9	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	LAUNCH OF SA LOGISTICS - A NEW DIVISION OF SIBC GROUP	en-US	3
10	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	РЕШЕНИЕ ПРОБЛЕМ МЕЖДУНАРОДНЫХ ПЛАТЕЖЕЙ: ОПЫТ SA INTERNATIONAL	ru-RU	4
11	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	SOLVING INTERNATIONAL PAYMENT ISSUES: THE EXPERIENCE OF SA INTERNATIONAL	en-US	4
12	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	国际支付问题解决方案：上海亚际机电有限公司的经验	zh-CN	4
13	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	ОБЗОР ТЕКУЩИХ ВЫЗОВОВ В СФЕРЕ МЕЖДУНАРОДНЫХ ФИНАНСОВЫХ ОПЕРАЦИЙ МЕЖДУ РОССИЕЙ И КИТАЕМ И ПРЕДСТАВЛЕНИЕ ЭФФЕКТИВНЫХ АЛЬТЕРНАТИВНЫХ ПОДХОДОВ	ru-RU	5
14	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	OVERVIEW OF CURRENT CHALLENGES IN INTERNATIONAL FINANCIAL OPERATIONS BETWEEN RUSSIA AND CHINA AND PRESENTING EFFECTIVE ALTERNATIVE APPROACHES	en-US	5
15	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	俄罗斯与中国之间的国际金融操作现状及有效替代方案	zh-CN	5
16	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	ТЕНДЕНЦИИ В ЛОГИСТИКЕ: СОЗДАНИЕ SA LOGISTICS	ru-RU	6
17	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	LOGISTICS TRENDS: THE CREATION OF SA LOGISTICS	en-US	6
18	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	俄罗斯与中国之间的国际金融操作现状及有效替代方案	zh-CN	6
19	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	РАЗВИТИЕ ПОРТОВОЙ ИНФРАСТРУКТУРЫ В РОССИИ	ru-RU	7
20	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	俄罗斯港口基础设施的发展	zh-CN	7
21	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	PORT INFRASTRUCTURE DEVELOPMENT IN RUSSIA	en-US	7
22	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	ЗНАЧЕНИЕ СТРОИТЕЛЬСТВА ЗАВОДА ПОРТОВОГО ОБОРУДОВАНИЯ ДЛЯ ЭКОНОМИКИ РОССИИ И УКРЕПЛЕНИЯ МЕЖДУНАРОДНОГО СОТРУДНИЧЕСТВА	ru-RU	8
23	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	THE IMPORTANCE OF BUILDING A PORT EQUIPMENT PLANT FOR RUSSIA’S ECONOMY AND STRENGTHENING INTERNATIONAL COOPERATION	en-US	8
24	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	建设港口设备制造厂对俄罗斯经济和加强国际合作的意义	zh-CN	8
25	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	SA INTERNATIONAL ПОДПИСЫВАЕТ СОГЛАШЕНИЕ С ПРАВИТЕЛЬСТВОМ РФ НА ВЭФ	ru-RU	9
26	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	SA INTERNATIONAL SIGNS AGREEMENT WITH THE RUSSIAN GOVERNMENT AT EEF	en-US	9
27	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	上海亚际机电有限公司签署与俄罗斯政府的协议	zh-CN	9
28	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	ОФИЦИАЛЬНЫЙ ЗАПУСК SA LOGISTICS	ru-RU	10
29	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	上海亚际物流有限公司正式启动	zh-CN	10
30	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	SA INTERNATIONAL SIGNS AGREEMENT WITH THE RUSSIAN GOVERNMENT AT EEF	en-US	10
31	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	СТАРТ ПРОЕКТА ПО ПРОИЗВОДСТВУ РОБОТОВ-МАНИПУЛЯТОРОВ В РОССИИ	ru-RU	11
32	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	机器人操控器生产项目启动	zh-CN	11
33	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	LAUNCH OF THE ROBOT MANIPULATOR MANUFACTURING PROJECT IN RUSSIA	en-US	11
36	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	建筑设备	zh-CN	12
39	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	公路设备	zh-CN	13
41	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	冶金设备	zh-CN	14
43	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Горнодобывающее оборудование	ru-RU	15
44	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Mining Equipment	en-US	15
45	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	采矿设备	zh-CN	15
46	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Химическое оборудование	ru-RU	16
47	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Chemical Equipment	en-US	16
48	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	化工设备	zh-CN	16
49	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Пищевое оборудование	ru-RU	17
50	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Food Equipment	en-US	17
51	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	食品设备	zh-CN	17
52	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Вилочные погрузчики	ru-RU	18
53	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Forklifts	en-US	18
54	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	叉车	zh-CN	18
55	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Конвейерные ленты	ru-RU	19
56	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Conveyor Belts	en-US	19
57	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	输送带	zh-CN	19
58	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Производственные линии под ключ	ru-RU	20
59	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Turnkey Production Lines	en-US	20
60	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	交钥匙生产线	zh-CN	20
61	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Бетонное оборудование	ru-RU	21
62	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	混凝土设备	zh-CN	21
63	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Concrete Equipment	en-US	21
64	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Услуги по выбору оборудования	ru-RU	22
65	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	设备选型服务	zh-CN	22
66	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Equipment Selection Services	en-US	22
67	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Оптимизация производственных процессов	ru-RU	23
68	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Optimization of Production Processes	en-US	23
40	2025-02-25 18:46:18.553	2025-02-28 06:24:05.52579	\N	Металлургическое оборудование 	ru-RU	14
37	2025-02-25 18:46:18.553	2025-02-28 06:21:40.728087	\N	Дорожное оборудование	ru-RU	13
38	2025-02-25 18:46:18.553	2025-02-28 06:21:40.7341	\N	Road equipment	en-US	13
35	2025-02-25 18:46:18.553	2025-02-28 06:21:48.298557	\N	Construction equipment	en-US	12
42	2025-02-25 18:46:18.553	2025-02-28 06:24:05.535094	\N	Metaлlurgical equipment	en-US	14
69	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	生产流程优化	zh-CN	23
70	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Внедрение инновационных технологий	ru-RU	24
71	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Implementation of Innovative Technologies	en-US	24
72	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	创新技术的实施	zh-CN	24
73	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Оптимизация производственных процессов	ru-RU	25
74	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Optimization of Production Processes	en-US	25
75	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	生产流程优化	zh-CN	25
76	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Международная торговля	ru-RU	26
77	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	International Trade	en-US	26
78	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	国际贸易	zh-CN	26
79	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Экспорт оборудования и технологий	ru-RU	27
80	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	设备与技术出口	zh-CN	27
81	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Export of Equipment and Technologies	en-US	27
82	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Импорт в Китай	ru-RU	28
83	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	进口到中国	zh-CN	28
84	2025-02-25 18:46:18.553	2025-02-25 18:46:18.553	\N	Import into China	en-US	28
34	2025-02-25 18:46:18.553	2025-02-28 06:21:16.03768	\N	Строительное оборудование 	ru-RU	12
\.


--
-- Data for Name: reference_book; Type: TABLE DATA; Schema: public; Owner: postgress
--

COPY public.reference_book (id, "createdAt", "updatedAt", "deletedAt", name, slug) FROM stdin;
\.


--
-- Data for Name: reference_book_attributes; Type: TABLE DATA; Schema: public; Owner: postgress
--

COPY public.reference_book_attributes (id, "createdAt", "updatedAt", "deletedAt", name, slug, type, "referenceBookId") FROM stdin;
\.


--
-- Data for Name: reference_book_instances; Type: TABLE DATA; Schema: public; Owner: postgress
--

COPY public.reference_book_instances (id, "createdAt", "updatedAt", "deletedAt", "referenceBookId") FROM stdin;
\.


--
-- Data for Name: reference_book_instances_value; Type: TABLE DATA; Schema: public; Owner: postgress
--

COPY public.reference_book_instances_value (id, "createdAt", "updatedAt", "deletedAt", value, "valueJson", "instanceId", "attributeId") FROM stdin;
\.


--
-- Data for Name: settings; Type: TABLE DATA; Schema: public; Owner: postgress
--

COPY public.settings (id, "createdAt", "updatedAt", "deletedAt", title, description, vk, facebook, viber, whatsapp, telegram, discord, "linkedIn", instagram, phone, email, "urlBitrix", "amoClientId", "amoClientSecret", "amoDomain", "amoBearer") FROM stdin;
1	2025-02-25 19:21:00.998	2025-02-25 19:44:45.678785	\N	Interco	Interco	https://vk.com/				https://web.telegram.org/k/	https://discord.com/	https://careers.linkedin.cn/	https://www.instagram.com/	+7 (800) 000 - 00 00	info@inter-sa.com					
\.


--
-- Data for Name: settings-contacts; Type: TABLE DATA; Schema: public; Owner: postgress
--

COPY public."settings-contacts" (id, "createdAt", "updatedAt", "deletedAt", content, description, "isPhone", "emailId", "phoneId") FROM stdin;
\.


--
-- Data for Name: settings_menu; Type: TABLE DATA; Schema: public; Owner: postgress
--

COPY public.settings_menu (id, "createdAt", "updatedAt", "deletedAt", title, slug) FROM stdin;
\.


--
-- Data for Name: settings_menu_item; Type: TABLE DATA; Schema: public; Owner: postgress
--

COPY public.settings_menu_item (id, "createdAt", "updatedAt", "deletedAt", title, hash, "order", mpath, "menuId", "pagesId", "parentId") FROM stdin;
\.


--
-- Data for Name: user; Type: TABLE DATA; Schema: public; Owner: postgress
--

COPY public."user" (id, "createdAt", "updatedAt", "deletedAt", "isActive", "lastName", "firstName", "middleName", email, password, role) FROM stdin;
1	2025-02-25 19:21:00.998	2025-02-25 19:21:00.998	\N	t	Яковлев	Андрей	Сергеевич	ya.andreyi96@yandex.ru	$2b$10$FosxRAzmJoWNGGuKlbDjJO.CuLvCYwNK75zPIm.UmNhGCB5Zh0Egi	admin
\.


--
-- Data for Name: users_comments_like; Type: TABLE DATA; Schema: public; Owner: postgress
--

COPY public.users_comments_like ("pagesCommentsId", "userId") FROM stdin;
\.


--
-- Name: amo_custom_fields_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgress
--

SELECT pg_catalog.setval('public.amo_custom_fields_id_seq', 1, false);


--
-- Name: auth-confirm_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgress
--

SELECT pg_catalog.setval('public."auth-confirm_id_seq"', 1, false);


--
-- Name: callback_field_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgress
--

SELECT pg_catalog.setval('public.callback_field_id_seq', 1, false);


--
-- Name: callback_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgress
--

SELECT pg_catalog.setval('public.callback_id_seq', 1, false);


--
-- Name: callback_instances_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgress
--

SELECT pg_catalog.setval('public.callback_instances_id_seq', 1, false);


--
-- Name: callback_instances_value_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgress
--

SELECT pg_catalog.setval('public.callback_instances_value_id_seq', 1, false);


--
-- Name: library_files_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgress
--

SELECT pg_catalog.setval('public.library_files_id_seq', 30, true);


--
-- Name: migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgress
--

SELECT pg_catalog.setval('public.migrations_id_seq', 1, true);


--
-- Name: pages-comments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgress
--

SELECT pg_catalog.setval('public."pages-comments_id_seq"', 1, false);


--
-- Name: pages-components_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgress
--

SELECT pg_catalog.setval('public."pages-components_id_seq"', 1, false);


--
-- Name: pages_iblock_fields_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgress
--

SELECT pg_catalog.setval('public.pages_iblock_fields_id_seq', 84, true);


--
-- Name: pages_iblock_fields_label_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgress
--

SELECT pg_catalog.setval('public.pages_iblock_fields_label_id_seq', 252, true);


--
-- Name: pages_iblock_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgress
--

SELECT pg_catalog.setval('public.pages_iblock_id_seq', 23, true);


--
-- Name: pages_iblock_records_field_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgress
--

SELECT pg_catalog.setval('public.pages_iblock_records_field_id_seq', 218, true);


--
-- Name: pages_iblock_records_field_value_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgress
--

SELECT pg_catalog.setval('public.pages_iblock_records_field_value_id_seq', 654, true);


--
-- Name: pages_iblock_records_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgress
--

SELECT pg_catalog.setval('public.pages_iblock_records_id_seq', 58, true);


--
-- Name: pages_iblock_section_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgress
--

SELECT pg_catalog.setval('public.pages_iblock_section_id_seq', 2, true);


--
-- Name: pages_iblock_section_value_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgress
--

SELECT pg_catalog.setval('public.pages_iblock_section_value_id_seq', 6, true);


--
-- Name: pages_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgress
--

SELECT pg_catalog.setval('public.pages_id_seq', 12, true);


--
-- Name: pages_params_field_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgress
--

SELECT pg_catalog.setval('public.pages_params_field_id_seq', 91, true);


--
-- Name: pages_params_field_value_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgress
--

SELECT pg_catalog.setval('public.pages_params_field_value_id_seq', 183, true);


--
-- Name: pages_params_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgress
--

SELECT pg_catalog.setval('public.pages_params_id_seq', 12, true);


--
-- Name: pages_sections_description_value_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgress
--

SELECT pg_catalog.setval('public.pages_sections_description_value_id_seq', 6, true);


--
-- Name: pages_sections_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgress
--

SELECT pg_catalog.setval('public.pages_sections_id_seq', 2, true);


--
-- Name: pages_sections_title_value_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgress
--

SELECT pg_catalog.setval('public.pages_sections_title_value_id_seq', 6, true);


--
-- Name: pages_seo_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgress
--

SELECT pg_catalog.setval('public.pages_seo_id_seq', 10, true);


--
-- Name: pages_seo_params_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgress
--

SELECT pg_catalog.setval('public.pages_seo_params_id_seq', 90, true);


--
-- Name: records_description_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgress
--

SELECT pg_catalog.setval('public.records_description_id_seq', 28, true);


--
-- Name: records_description_value_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgress
--

SELECT pg_catalog.setval('public.records_description_value_id_seq', 84, true);


--
-- Name: records_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgress
--

SELECT pg_catalog.setval('public.records_id_seq', 28, true);


--
-- Name: records_seo_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgress
--

SELECT pg_catalog.setval('public.records_seo_id_seq', 28, true);


--
-- Name: records_seo_params_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgress
--

SELECT pg_catalog.setval('public.records_seo_params_id_seq', 1, false);


--
-- Name: records_title_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgress
--

SELECT pg_catalog.setval('public.records_title_id_seq', 28, true);


--
-- Name: records_title_value_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgress
--

SELECT pg_catalog.setval('public.records_title_value_id_seq', 84, true);


--
-- Name: reference_book_attributes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgress
--

SELECT pg_catalog.setval('public.reference_book_attributes_id_seq', 1, false);


--
-- Name: reference_book_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgress
--

SELECT pg_catalog.setval('public.reference_book_id_seq', 1, false);


--
-- Name: reference_book_instances_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgress
--

SELECT pg_catalog.setval('public.reference_book_instances_id_seq', 1, false);


--
-- Name: reference_book_instances_value_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgress
--

SELECT pg_catalog.setval('public.reference_book_instances_value_id_seq', 1, false);


--
-- Name: settings-contacts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgress
--

SELECT pg_catalog.setval('public."settings-contacts_id_seq"', 1, false);


--
-- Name: settings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgress
--

SELECT pg_catalog.setval('public.settings_id_seq', 1, true);


--
-- Name: settings_menu_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgress
--

SELECT pg_catalog.setval('public.settings_menu_id_seq', 1, false);


--
-- Name: settings_menu_item_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgress
--

SELECT pg_catalog.setval('public.settings_menu_item_id_seq', 1, false);


--
-- Name: user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgress
--

SELECT pg_catalog.setval('public.user_id_seq', 1, true);


--
-- Name: auth-confirm PK_0302013ded81b86ef26554ef475; Type: CONSTRAINT; Schema: public; Owner: postgress
--

ALTER TABLE ONLY public."auth-confirm"
    ADD CONSTRAINT "PK_0302013ded81b86ef26554ef475" PRIMARY KEY (id, uuid);


--
-- Name: settings PK_0669fe20e252eb692bf4d344975; Type: CONSTRAINT; Schema: public; Owner: postgress
--

ALTER TABLE ONLY public.settings
    ADD CONSTRAINT "PK_0669fe20e252eb692bf4d344975" PRIMARY KEY (id);


--
-- Name: pages_iblock_section_value PK_0a2f2d4c7086efb44458284e778; Type: CONSTRAINT; Schema: public; Owner: postgress
--

ALTER TABLE ONLY public.pages_iblock_section_value
    ADD CONSTRAINT "PK_0a2f2d4c7086efb44458284e778" PRIMARY KEY (id);


--
-- Name: records_description PK_10d93e0da254803a07c18aa19dd; Type: CONSTRAINT; Schema: public; Owner: postgress
--

ALTER TABLE ONLY public.records_description
    ADD CONSTRAINT "PK_10d93e0da254803a07c18aa19dd" PRIMARY KEY (id);


--
-- Name: records PK_188149422ee2454660abf1d5ee5; Type: CONSTRAINT; Schema: public; Owner: postgress
--

ALTER TABLE ONLY public.records
    ADD CONSTRAINT "PK_188149422ee2454660abf1d5ee5" PRIMARY KEY (id);


--
-- Name: reference_book PK_18e7d4038ac6f83249ba35baf63; Type: CONSTRAINT; Schema: public; Owner: postgress
--

ALTER TABLE ONLY public.reference_book
    ADD CONSTRAINT "PK_18e7d4038ac6f83249ba35baf63" PRIMARY KEY (id);


--
-- Name: callback_field PK_1b338762b5bb2fb54b5efc2603e; Type: CONSTRAINT; Schema: public; Owner: postgress
--

ALTER TABLE ONLY public.callback_field
    ADD CONSTRAINT "PK_1b338762b5bb2fb54b5efc2603e" PRIMARY KEY (id);


--
-- Name: users_comments_like PK_1bcb4b63e735ea92636c42d68ad; Type: CONSTRAINT; Schema: public; Owner: postgress
--

ALTER TABLE ONLY public.users_comments_like
    ADD CONSTRAINT "PK_1bcb4b63e735ea92636c42d68ad" PRIMARY KEY ("pagesCommentsId", "userId");


--
-- Name: pages_iblock_records_field_value PK_1e8099f640b25eb69875b5cac34; Type: CONSTRAINT; Schema: public; Owner: postgress
--

ALTER TABLE ONLY public.pages_iblock_records_field_value
    ADD CONSTRAINT "PK_1e8099f640b25eb69875b5cac34" PRIMARY KEY (id);


--
-- Name: pages_iblock_section PK_1ec64f9522097554d372e30015d; Type: CONSTRAINT; Schema: public; Owner: postgress
--

ALTER TABLE ONLY public.pages_iblock_section
    ADD CONSTRAINT "PK_1ec64f9522097554d372e30015d" PRIMARY KEY (id);


--
-- Name: library_files PK_23c28486f5385fca7a0b557f910; Type: CONSTRAINT; Schema: public; Owner: postgress
--

ALTER TABLE ONLY public.library_files
    ADD CONSTRAINT "PK_23c28486f5385fca7a0b557f910" PRIMARY KEY (id);


--
-- Name: pages_params_field_value PK_27ec26e5cb664f94dc1f035d45d; Type: CONSTRAINT; Schema: public; Owner: postgress
--

ALTER TABLE ONLY public.pages_params_field_value
    ADD CONSTRAINT "PK_27ec26e5cb664f94dc1f035d45d" PRIMARY KEY (id);


--
-- Name: records_title PK_29a71191545007258f8b186f4a7; Type: CONSTRAINT; Schema: public; Owner: postgress
--

ALTER TABLE ONLY public.records_title
    ADD CONSTRAINT "PK_29a71191545007258f8b186f4a7" PRIMARY KEY (id);


--
-- Name: callback PK_3120f6061b840c2605321da3947; Type: CONSTRAINT; Schema: public; Owner: postgress
--

ALTER TABLE ONLY public.callback
    ADD CONSTRAINT "PK_3120f6061b840c2605321da3947" PRIMARY KEY (id);


--
-- Name: pages_sections_description_value PK_34c23cca366c9064d2a33b1292c; Type: CONSTRAINT; Schema: public; Owner: postgress
--

ALTER TABLE ONLY public.pages_sections_description_value
    ADD CONSTRAINT "PK_34c23cca366c9064d2a33b1292c" PRIMARY KEY (id);


--
-- Name: pages_seo PK_3c9a1e22921f011629a98a50bcc; Type: CONSTRAINT; Schema: public; Owner: postgress
--

ALTER TABLE ONLY public.pages_seo
    ADD CONSTRAINT "PK_3c9a1e22921f011629a98a50bcc" PRIMARY KEY (id);


--
-- Name: pages_iblock_fields_label PK_550bab3bdf9ebb94a1ff787b214; Type: CONSTRAINT; Schema: public; Owner: postgress
--

ALTER TABLE ONLY public.pages_iblock_fields_label
    ADD CONSTRAINT "PK_550bab3bdf9ebb94a1ff787b214" PRIMARY KEY (id);


--
-- Name: pages_iblock PK_5510dbca6afcd98fee2fad2eb7f; Type: CONSTRAINT; Schema: public; Owner: postgress
--

ALTER TABLE ONLY public.pages_iblock
    ADD CONSTRAINT "PK_5510dbca6afcd98fee2fad2eb7f" PRIMARY KEY (id);


--
-- Name: pages_params PK_61558e5b9f6c57acf151ab7bd2b; Type: CONSTRAINT; Schema: public; Owner: postgress
--

ALTER TABLE ONLY public.pages_params
    ADD CONSTRAINT "PK_61558e5b9f6c57acf151ab7bd2b" PRIMARY KEY (id);


--
-- Name: reference_book_attributes PK_64a1d13a5cffe2bd3585a05b037; Type: CONSTRAINT; Schema: public; Owner: postgress
--

ALTER TABLE ONLY public.reference_book_attributes
    ADD CONSTRAINT "PK_64a1d13a5cffe2bd3585a05b037" PRIMARY KEY (id);


--
-- Name: pages_params_field PK_671a6993b20eff8aa4b6d0d2724; Type: CONSTRAINT; Schema: public; Owner: postgress
--

ALTER TABLE ONLY public.pages_params_field
    ADD CONSTRAINT "PK_671a6993b20eff8aa4b6d0d2724" PRIMARY KEY (id);


--
-- Name: amo_custom_fields PK_715cf8ed3ea681a677ab5c7b82c; Type: CONSTRAINT; Schema: public; Owner: postgress
--

ALTER TABLE ONLY public.amo_custom_fields
    ADD CONSTRAINT "PK_715cf8ed3ea681a677ab5c7b82c" PRIMARY KEY (id);


--
-- Name: settings_menu_item PK_8656070d632a256909b4b23d456; Type: CONSTRAINT; Schema: public; Owner: postgress
--

ALTER TABLE ONLY public.settings_menu_item
    ADD CONSTRAINT "PK_8656070d632a256909b4b23d456" PRIMARY KEY (id);


--
-- Name: callback_instances_value PK_87e7dd5c2a589525181b6162dda; Type: CONSTRAINT; Schema: public; Owner: postgress
--

ALTER TABLE ONLY public.callback_instances_value
    ADD CONSTRAINT "PK_87e7dd5c2a589525181b6162dda" PRIMARY KEY (id);


--
-- Name: migrations PK_8c82d7f526340ab734260ea46be; Type: CONSTRAINT; Schema: public; Owner: postgress
--

ALTER TABLE ONLY public.migrations
    ADD CONSTRAINT "PK_8c82d7f526340ab734260ea46be" PRIMARY KEY (id);


--
-- Name: pages PK_8f21ed625aa34c8391d636b7d3b; Type: CONSTRAINT; Schema: public; Owner: postgress
--

ALTER TABLE ONLY public.pages
    ADD CONSTRAINT "PK_8f21ed625aa34c8391d636b7d3b" PRIMARY KEY (id);


--
-- Name: records_seo PK_8fdbfa9dec79b858c082393ffcb; Type: CONSTRAINT; Schema: public; Owner: postgress
--

ALTER TABLE ONLY public.records_seo
    ADD CONSTRAINT "PK_8fdbfa9dec79b858c082393ffcb" PRIMARY KEY (id);


--
-- Name: pages_iblock_records_sections_pages_iblock_section PK_906e8c5fd253990a7311a2e39ed; Type: CONSTRAINT; Schema: public; Owner: postgress
--

ALTER TABLE ONLY public.pages_iblock_records_sections_pages_iblock_section
    ADD CONSTRAINT "PK_906e8c5fd253990a7311a2e39ed" PRIMARY KEY ("pagesIblockRecordsId", "pagesIblockSectionId");


--
-- Name: pages_iblock_records_field PK_933cc9b1b8634b10bb82cd0b2df; Type: CONSTRAINT; Schema: public; Owner: postgress
--

ALTER TABLE ONLY public.pages_iblock_records_field
    ADD CONSTRAINT "PK_933cc9b1b8634b10bb82cd0b2df" PRIMARY KEY (id);


--
-- Name: pages_iblock_records PK_a172545fb26a8290f02c3b9e064; Type: CONSTRAINT; Schema: public; Owner: postgress
--

ALTER TABLE ONLY public.pages_iblock_records
    ADD CONSTRAINT "PK_a172545fb26a8290f02c3b9e064" PRIMARY KEY (id);


--
-- Name: pages_sections_title_value PK_a2baa08eeef049e79971b31a9a0; Type: CONSTRAINT; Schema: public; Owner: postgress
--

ALTER TABLE ONLY public.pages_sections_title_value
    ADD CONSTRAINT "PK_a2baa08eeef049e79971b31a9a0" PRIMARY KEY (id);


--
-- Name: reference_book_instances_value PK_a60b6dbd7dc285610721c8e0d1b; Type: CONSTRAINT; Schema: public; Owner: postgress
--

ALTER TABLE ONLY public.reference_book_instances_value
    ADD CONSTRAINT "PK_a60b6dbd7dc285610721c8e0d1b" PRIMARY KEY (id);


--
-- Name: callback_instances PK_b6ffbe12380b59fa96b2b2b8843; Type: CONSTRAINT; Schema: public; Owner: postgress
--

ALTER TABLE ONLY public.callback_instances
    ADD CONSTRAINT "PK_b6ffbe12380b59fa96b2b2b8843" PRIMARY KEY (id);


--
-- Name: records_seo_params PK_bacdca37f5b71b05ac80ab3ca12; Type: CONSTRAINT; Schema: public; Owner: postgress
--

ALTER TABLE ONLY public.records_seo_params
    ADD CONSTRAINT "PK_bacdca37f5b71b05ac80ab3ca12" PRIMARY KEY (id);


--
-- Name: pages-comments PK_bb7aa821e7839f43b46d83070b6; Type: CONSTRAINT; Schema: public; Owner: postgress
--

ALTER TABLE ONLY public."pages-comments"
    ADD CONSTRAINT "PK_bb7aa821e7839f43b46d83070b6" PRIMARY KEY (id);


--
-- Name: settings-contacts PK_bd85d9cf5847a5d982b9d933d86; Type: CONSTRAINT; Schema: public; Owner: postgress
--

ALTER TABLE ONLY public."settings-contacts"
    ADD CONSTRAINT "PK_bd85d9cf5847a5d982b9d933d86" PRIMARY KEY (id);


--
-- Name: reference_book_instances PK_c0835b5c84fd07195adac5b8abd; Type: CONSTRAINT; Schema: public; Owner: postgress
--

ALTER TABLE ONLY public.reference_book_instances
    ADD CONSTRAINT "PK_c0835b5c84fd07195adac5b8abd" PRIMARY KEY (id);


--
-- Name: user PK_cace4a159ff9f2512dd42373760; Type: CONSTRAINT; Schema: public; Owner: postgress
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT "PK_cace4a159ff9f2512dd42373760" PRIMARY KEY (id);


--
-- Name: pages_sections PK_e5e45301d05b0d552ff5990d0a0; Type: CONSTRAINT; Schema: public; Owner: postgress
--

ALTER TABLE ONLY public.pages_sections
    ADD CONSTRAINT "PK_e5e45301d05b0d552ff5990d0a0" PRIMARY KEY (id);


--
-- Name: pages_seo_params PK_e8dd1b4fdafa610adcca5bf84c3; Type: CONSTRAINT; Schema: public; Owner: postgress
--

ALTER TABLE ONLY public.pages_seo_params
    ADD CONSTRAINT "PK_e8dd1b4fdafa610adcca5bf84c3" PRIMARY KEY (id);


--
-- Name: records_title_value PK_eb84deec53569be83341a56b7bb; Type: CONSTRAINT; Schema: public; Owner: postgress
--

ALTER TABLE ONLY public.records_title_value
    ADD CONSTRAINT "PK_eb84deec53569be83341a56b7bb" PRIMARY KEY (id);


--
-- Name: records_sections_pages_sections PK_f021a3b1c8a7b996698fb04b0bb; Type: CONSTRAINT; Schema: public; Owner: postgress
--

ALTER TABLE ONLY public.records_sections_pages_sections
    ADD CONSTRAINT "PK_f021a3b1c8a7b996698fb04b0bb" PRIMARY KEY ("recordsId", "pagesSectionsId");


--
-- Name: pages_iblock_fields PK_f21023738aad31b8f43845d3d35; Type: CONSTRAINT; Schema: public; Owner: postgress
--

ALTER TABLE ONLY public.pages_iblock_fields
    ADD CONSTRAINT "PK_f21023738aad31b8f43845d3d35" PRIMARY KEY (id);


--
-- Name: pages-components PK_f974e55e02452b8cee3b03fdafa; Type: CONSTRAINT; Schema: public; Owner: postgress
--

ALTER TABLE ONLY public."pages-components"
    ADD CONSTRAINT "PK_f974e55e02452b8cee3b03fdafa" PRIMARY KEY (id);


--
-- Name: settings_menu PK_fd3bebc7d7b006af8b6c75842d5; Type: CONSTRAINT; Schema: public; Owner: postgress
--

ALTER TABLE ONLY public.settings_menu
    ADD CONSTRAINT "PK_fd3bebc7d7b006af8b6c75842d5" PRIMARY KEY (id);


--
-- Name: records_description_value PK_ff78d512547f3469833b269c97c; Type: CONSTRAINT; Schema: public; Owner: postgress
--

ALTER TABLE ONLY public.records_description_value
    ADD CONSTRAINT "PK_ff78d512547f3469833b269c97c" PRIMARY KEY (id);


--
-- Name: records REL_0b294cd175a264787d609315ba; Type: CONSTRAINT; Schema: public; Owner: postgress
--

ALTER TABLE ONLY public.records
    ADD CONSTRAINT "REL_0b294cd175a264787d609315ba" UNIQUE ("descriptionId");


--
-- Name: records REL_67fe1339b944fb02568867554b; Type: CONSTRAINT; Schema: public; Owner: postgress
--

ALTER TABLE ONLY public.records
    ADD CONSTRAINT "REL_67fe1339b944fb02568867554b" UNIQUE ("seoId");


--
-- Name: pages REL_a5f09c91bfe53121be839fd575; Type: CONSTRAINT; Schema: public; Owner: postgress
--

ALTER TABLE ONLY public.pages
    ADD CONSTRAINT "REL_a5f09c91bfe53121be839fd575" UNIQUE ("seoId");


--
-- Name: records REL_e818af141fb00405011ff5ee1e; Type: CONSTRAINT; Schema: public; Owner: postgress
--

ALTER TABLE ONLY public.records
    ADD CONSTRAINT "REL_e818af141fb00405011ff5ee1e" UNIQUE ("titleId");


--
-- Name: IDX_00c890d8787b39924577c17693; Type: INDEX; Schema: public; Owner: postgress
--

CREATE INDEX "IDX_00c890d8787b39924577c17693" ON public.pages_iblock_records_sections_pages_iblock_section USING btree ("pagesIblockRecordsId");


--
-- Name: IDX_03146727e4ec451f4d6569fe17; Type: INDEX; Schema: public; Owner: postgress
--

CREATE INDEX "IDX_03146727e4ec451f4d6569fe17" ON public.pages_iblock_records_sections_pages_iblock_section USING btree ("pagesIblockSectionId");


--
-- Name: IDX_146347ac8247c1f560194c0046; Type: INDEX; Schema: public; Owner: postgress
--

CREATE INDEX "IDX_146347ac8247c1f560194c0046" ON public.users_comments_like USING btree ("userId");


--
-- Name: IDX_6b3e0c5f255dc2934f4e08bf11; Type: INDEX; Schema: public; Owner: postgress
--

CREATE INDEX "IDX_6b3e0c5f255dc2934f4e08bf11" ON public.users_comments_like USING btree ("pagesCommentsId");


--
-- Name: IDX_8b16cf6a8d2cd77c4e5c900e78; Type: INDEX; Schema: public; Owner: postgress
--

CREATE INDEX "IDX_8b16cf6a8d2cd77c4e5c900e78" ON public.records_sections_pages_sections USING btree ("recordsId");


--
-- Name: IDX_e60081aaa73c87282096ff7d02; Type: INDEX; Schema: public; Owner: postgress
--

CREATE INDEX "IDX_e60081aaa73c87282096ff7d02" ON public.records_sections_pages_sections USING btree ("pagesSectionsId");


--
-- Name: pages_iblock_records_sections_pages_iblock_section FK_00c890d8787b39924577c17693b; Type: FK CONSTRAINT; Schema: public; Owner: postgress
--

ALTER TABLE ONLY public.pages_iblock_records_sections_pages_iblock_section
    ADD CONSTRAINT "FK_00c890d8787b39924577c17693b" FOREIGN KEY ("pagesIblockRecordsId") REFERENCES public.pages_iblock_records(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: pages_iblock_records_sections_pages_iblock_section FK_03146727e4ec451f4d6569fe178; Type: FK CONSTRAINT; Schema: public; Owner: postgress
--

ALTER TABLE ONLY public.pages_iblock_records_sections_pages_iblock_section
    ADD CONSTRAINT "FK_03146727e4ec451f4d6569fe178" FOREIGN KEY ("pagesIblockSectionId") REFERENCES public.pages_iblock_section(id);


--
-- Name: reference_book_attributes FK_07a2b8f8cc0b98e673bdf2b4744; Type: FK CONSTRAINT; Schema: public; Owner: postgress
--

ALTER TABLE ONLY public.reference_book_attributes
    ADD CONSTRAINT "FK_07a2b8f8cc0b98e673bdf2b4744" FOREIGN KEY ("referenceBookId") REFERENCES public.reference_book(id);


--
-- Name: settings_menu_item FK_08220f7645a0e6e5e73ebf825bb; Type: FK CONSTRAINT; Schema: public; Owner: postgress
--

ALTER TABLE ONLY public.settings_menu_item
    ADD CONSTRAINT "FK_08220f7645a0e6e5e73ebf825bb" FOREIGN KEY ("parentId") REFERENCES public.settings_menu_item(id);


--
-- Name: records FK_0b294cd175a264787d609315ba5; Type: FK CONSTRAINT; Schema: public; Owner: postgress
--

ALTER TABLE ONLY public.records
    ADD CONSTRAINT "FK_0b294cd175a264787d609315ba5" FOREIGN KEY ("descriptionId") REFERENCES public.records_description(id);


--
-- Name: records FK_0cec391de59aa39be0eff0c4754; Type: FK CONSTRAINT; Schema: public; Owner: postgress
--

ALTER TABLE ONLY public.records
    ADD CONSTRAINT "FK_0cec391de59aa39be0eff0c4754" FOREIGN KEY ("pagesId") REFERENCES public.pages(id);


--
-- Name: records_seo_params FK_0e55c273815033b03161025773c; Type: FK CONSTRAINT; Schema: public; Owner: postgress
--

ALTER TABLE ONLY public.records_seo_params
    ADD CONSTRAINT "FK_0e55c273815033b03161025773c" FOREIGN KEY ("recordSeoId") REFERENCES public.records_seo(id);


--
-- Name: users_comments_like FK_146347ac8247c1f560194c00465; Type: FK CONSTRAINT; Schema: public; Owner: postgress
--

ALTER TABLE ONLY public.users_comments_like
    ADD CONSTRAINT "FK_146347ac8247c1f560194c00465" FOREIGN KEY ("userId") REFERENCES public."user"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: pages_params_field_value FK_17cd61295a0eeaa3fd030861652; Type: FK CONSTRAINT; Schema: public; Owner: postgress
--

ALTER TABLE ONLY public.pages_params_field_value
    ADD CONSTRAINT "FK_17cd61295a0eeaa3fd030861652" FOREIGN KEY ("pagesParamsFieldId") REFERENCES public.pages_params_field(id);


--
-- Name: pages_sections_description_value FK_1a83673d9038871d40167cee5eb; Type: FK CONSTRAINT; Schema: public; Owner: postgress
--

ALTER TABLE ONLY public.pages_sections_description_value
    ADD CONSTRAINT "FK_1a83673d9038871d40167cee5eb" FOREIGN KEY ("sectionId") REFERENCES public.pages_sections(id);


--
-- Name: pages_params_field FK_1dad757c0e0f6e8e8c24c487058; Type: FK CONSTRAINT; Schema: public; Owner: postgress
--

ALTER TABLE ONLY public.pages_params_field
    ADD CONSTRAINT "FK_1dad757c0e0f6e8e8c24c487058" FOREIGN KEY ("paramsId") REFERENCES public.pages_params(id);


--
-- Name: records_description_value FK_233e9ab819ebd34d6023136a49f; Type: FK CONSTRAINT; Schema: public; Owner: postgress
--

ALTER TABLE ONLY public.records_description_value
    ADD CONSTRAINT "FK_233e9ab819ebd34d6023136a49f" FOREIGN KEY ("recordDescriptionId") REFERENCES public.records_description(id);


--
-- Name: pages_iblock_fields FK_286592815ea93247dec6e525026; Type: FK CONSTRAINT; Schema: public; Owner: postgress
--

ALTER TABLE ONLY public.pages_iblock_fields
    ADD CONSTRAINT "FK_286592815ea93247dec6e525026" FOREIGN KEY ("iblockId") REFERENCES public.pages_iblock(id);


--
-- Name: callback_instances FK_36e626ed1c64f96ce117ae4402f; Type: FK CONSTRAINT; Schema: public; Owner: postgress
--

ALTER TABLE ONLY public.callback_instances
    ADD CONSTRAINT "FK_36e626ed1c64f96ce117ae4402f" FOREIGN KEY ("callbackId") REFERENCES public.callback(id);


--
-- Name: records FK_447389c0c9dcc190dc22a379e81; Type: FK CONSTRAINT; Schema: public; Owner: postgress
--

ALTER TABLE ONLY public.records
    ADD CONSTRAINT "FK_447389c0c9dcc190dc22a379e81" FOREIGN KEY ("authorId") REFERENCES public."user"(id);


--
-- Name: pages-comments FK_44cba60a41f892b3d3af00d335c; Type: FK CONSTRAINT; Schema: public; Owner: postgress
--

ALTER TABLE ONLY public."pages-comments"
    ADD CONSTRAINT "FK_44cba60a41f892b3d3af00d335c" FOREIGN KEY ("parentId") REFERENCES public."pages-comments"(id);


--
-- Name: pages-comments FK_48b1feb57fba8d9913b26cc9ea1; Type: FK CONSTRAINT; Schema: public; Owner: postgress
--

ALTER TABLE ONLY public."pages-comments"
    ADD CONSTRAINT "FK_48b1feb57fba8d9913b26cc9ea1" FOREIGN KEY ("recordsId") REFERENCES public.records(id);


--
-- Name: pages_params_field FK_4b3b4870b43caf984a5ff22139a; Type: FK CONSTRAINT; Schema: public; Owner: postgress
--

ALTER TABLE ONLY public.pages_params_field
    ADD CONSTRAINT "FK_4b3b4870b43caf984a5ff22139a" FOREIGN KEY ("recordId") REFERENCES public.records(id);


--
-- Name: pages_iblock_records_field_value FK_4f1a7deb7b7f84a540dfc7e6019; Type: FK CONSTRAINT; Schema: public; Owner: postgress
--

ALTER TABLE ONLY public.pages_iblock_records_field_value
    ADD CONSTRAINT "FK_4f1a7deb7b7f84a540dfc7e6019" FOREIGN KEY ("recordFieldId") REFERENCES public.pages_iblock_records_field(id);


--
-- Name: reference_book_instances_value FK_57d597dd4836afdc5f298c59f81; Type: FK CONSTRAINT; Schema: public; Owner: postgress
--

ALTER TABLE ONLY public.reference_book_instances_value
    ADD CONSTRAINT "FK_57d597dd4836afdc5f298c59f81" FOREIGN KEY ("attributeId") REFERENCES public.reference_book_attributes(id);


--
-- Name: settings-contacts FK_58e7cd4fb92406dd078459ef407; Type: FK CONSTRAINT; Schema: public; Owner: postgress
--

ALTER TABLE ONLY public."settings-contacts"
    ADD CONSTRAINT "FK_58e7cd4fb92406dd078459ef407" FOREIGN KEY ("emailId") REFERENCES public.settings(id);


--
-- Name: pages_iblock_section_value FK_59bb77f411f7c3be37ff26667ed; Type: FK CONSTRAINT; Schema: public; Owner: postgress
--

ALTER TABLE ONLY public.pages_iblock_section_value
    ADD CONSTRAINT "FK_59bb77f411f7c3be37ff26667ed" FOREIGN KEY ("sectionId") REFERENCES public.pages_iblock_section(id);


--
-- Name: records FK_67fe1339b944fb02568867554bf; Type: FK CONSTRAINT; Schema: public; Owner: postgress
--

ALTER TABLE ONLY public.records
    ADD CONSTRAINT "FK_67fe1339b944fb02568867554bf" FOREIGN KEY ("seoId") REFERENCES public.records_seo(id);


--
-- Name: users_comments_like FK_6b3e0c5f255dc2934f4e08bf110; Type: FK CONSTRAINT; Schema: public; Owner: postgress
--

ALTER TABLE ONLY public.users_comments_like
    ADD CONSTRAINT "FK_6b3e0c5f255dc2934f4e08bf110" FOREIGN KEY ("pagesCommentsId") REFERENCES public."pages-comments"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: settings-contacts FK_73972c5106d5e1b9911c9cd67e3; Type: FK CONSTRAINT; Schema: public; Owner: postgress
--

ALTER TABLE ONLY public."settings-contacts"
    ADD CONSTRAINT "FK_73972c5106d5e1b9911c9cd67e3" FOREIGN KEY ("phoneId") REFERENCES public.settings(id);


--
-- Name: records_title_value FK_846313cd8a383414fbbc7a972fc; Type: FK CONSTRAINT; Schema: public; Owner: postgress
--

ALTER TABLE ONLY public.records_title_value
    ADD CONSTRAINT "FK_846313cd8a383414fbbc7a972fc" FOREIGN KEY ("recordTitleId") REFERENCES public.records_title(id);


--
-- Name: records_sections_pages_sections FK_8b16cf6a8d2cd77c4e5c900e787; Type: FK CONSTRAINT; Schema: public; Owner: postgress
--

ALTER TABLE ONLY public.records_sections_pages_sections
    ADD CONSTRAINT "FK_8b16cf6a8d2cd77c4e5c900e787" FOREIGN KEY ("recordsId") REFERENCES public.records(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: reference_book_instances FK_990cdbc304e6a407b3a4ebb9c95; Type: FK CONSTRAINT; Schema: public; Owner: postgress
--

ALTER TABLE ONLY public.reference_book_instances
    ADD CONSTRAINT "FK_990cdbc304e6a407b3a4ebb9c95" FOREIGN KEY ("referenceBookId") REFERENCES public.reference_book(id);


--
-- Name: pages_iblock FK_9ff9ce259ae047c9e72ca14b154; Type: FK CONSTRAINT; Schema: public; Owner: postgress
--

ALTER TABLE ONLY public.pages_iblock
    ADD CONSTRAINT "FK_9ff9ce259ae047c9e72ca14b154" FOREIGN KEY ("pageId") REFERENCES public.pages(id);


--
-- Name: pages FK_a5f09c91bfe53121be839fd5754; Type: FK CONSTRAINT; Schema: public; Owner: postgress
--

ALTER TABLE ONLY public.pages
    ADD CONSTRAINT "FK_a5f09c91bfe53121be839fd5754" FOREIGN KEY ("seoId") REFERENCES public.pages_seo(id);


--
-- Name: pages_iblock_fields_label FK_a979481317c46275274d317e314; Type: FK CONSTRAINT; Schema: public; Owner: postgress
--

ALTER TABLE ONLY public.pages_iblock_fields_label
    ADD CONSTRAINT "FK_a979481317c46275274d317e314" FOREIGN KEY ("fieldId") REFERENCES public.pages_iblock_fields(id);


--
-- Name: pages_iblock_records FK_ac05c90b7748d12564a17aa946f; Type: FK CONSTRAINT; Schema: public; Owner: postgress
--

ALTER TABLE ONLY public.pages_iblock_records
    ADD CONSTRAINT "FK_ac05c90b7748d12564a17aa946f" FOREIGN KEY ("iblockId") REFERENCES public.pages_iblock(id);


--
-- Name: settings_menu_item FK_bc7149e0b6c462ea0a78e25fcde; Type: FK CONSTRAINT; Schema: public; Owner: postgress
--

ALTER TABLE ONLY public.settings_menu_item
    ADD CONSTRAINT "FK_bc7149e0b6c462ea0a78e25fcde" FOREIGN KEY ("menuId") REFERENCES public.settings_menu(id);


--
-- Name: library_files FK_bd27818610bfceabf7bbcdf494c; Type: FK CONSTRAINT; Schema: public; Owner: postgress
--

ALTER TABLE ONLY public.library_files
    ADD CONSTRAINT "FK_bd27818610bfceabf7bbcdf494c" FOREIGN KEY ("parentId") REFERENCES public.library_files(id);


--
-- Name: auth-confirm FK_c1b9f162da24fa4cb098170b8cc; Type: FK CONSTRAINT; Schema: public; Owner: postgress
--

ALTER TABLE ONLY public."auth-confirm"
    ADD CONSTRAINT "FK_c1b9f162da24fa4cb098170b8cc" FOREIGN KEY ("userId") REFERENCES public."user"(id);


--
-- Name: callback_field FK_ce5cebd05d199adf25f0a183db8; Type: FK CONSTRAINT; Schema: public; Owner: postgress
--

ALTER TABLE ONLY public.callback_field
    ADD CONSTRAINT "FK_ce5cebd05d199adf25f0a183db8" FOREIGN KEY ("callbackId") REFERENCES public.callback(id);


--
-- Name: pages_params FK_d1470054f3bad349990679c249b; Type: FK CONSTRAINT; Schema: public; Owner: postgress
--

ALTER TABLE ONLY public.pages_params
    ADD CONSTRAINT "FK_d1470054f3bad349990679c249b" FOREIGN KEY ("pagesId") REFERENCES public.pages(id);


--
-- Name: settings_menu_item FK_d2eb1a13366bb09677b8f8b9a94; Type: FK CONSTRAINT; Schema: public; Owner: postgress
--

ALTER TABLE ONLY public.settings_menu_item
    ADD CONSTRAINT "FK_d2eb1a13366bb09677b8f8b9a94" FOREIGN KEY ("pagesId") REFERENCES public.pages(id);


--
-- Name: pages_seo_params FK_d6d341a3d07869e14b4c55853a7; Type: FK CONSTRAINT; Schema: public; Owner: postgress
--

ALTER TABLE ONLY public.pages_seo_params
    ADD CONSTRAINT "FK_d6d341a3d07869e14b4c55853a7" FOREIGN KEY ("pagesSeoId") REFERENCES public.pages_seo(id);


--
-- Name: callback_instances_value FK_d9da9581c93d2f601fd5e0945a6; Type: FK CONSTRAINT; Schema: public; Owner: postgress
--

ALTER TABLE ONLY public.callback_instances_value
    ADD CONSTRAINT "FK_d9da9581c93d2f601fd5e0945a6" FOREIGN KEY ("instanceId") REFERENCES public.callback_instances(id);


--
-- Name: pages_iblock_section FK_dacc6f7003e51056134cb17b68f; Type: FK CONSTRAINT; Schema: public; Owner: postgress
--

ALTER TABLE ONLY public.pages_iblock_section
    ADD CONSTRAINT "FK_dacc6f7003e51056134cb17b68f" FOREIGN KEY ("iblockId") REFERENCES public.pages_iblock(id);


--
-- Name: pages_sections FK_e1c5792780a5472be4825966d94; Type: FK CONSTRAINT; Schema: public; Owner: postgress
--

ALTER TABLE ONLY public.pages_sections
    ADD CONSTRAINT "FK_e1c5792780a5472be4825966d94" FOREIGN KEY ("pagesId") REFERENCES public.pages(id);


--
-- Name: pages-components FK_e2cecde5138675709548651bdc3; Type: FK CONSTRAINT; Schema: public; Owner: postgress
--

ALTER TABLE ONLY public."pages-components"
    ADD CONSTRAINT "FK_e2cecde5138675709548651bdc3" FOREIGN KEY ("pagesId") REFERENCES public.pages(id);


--
-- Name: pages_iblock_records_field FK_e5dc88e85ea29c8192c9ea6fb7e; Type: FK CONSTRAINT; Schema: public; Owner: postgress
--

ALTER TABLE ONLY public.pages_iblock_records_field
    ADD CONSTRAINT "FK_e5dc88e85ea29c8192c9ea6fb7e" FOREIGN KEY ("recordId") REFERENCES public.pages_iblock_records(id);


--
-- Name: records_sections_pages_sections FK_e60081aaa73c87282096ff7d027; Type: FK CONSTRAINT; Schema: public; Owner: postgress
--

ALTER TABLE ONLY public.records_sections_pages_sections
    ADD CONSTRAINT "FK_e60081aaa73c87282096ff7d027" FOREIGN KEY ("pagesSectionsId") REFERENCES public.pages_sections(id);


--
-- Name: records FK_e818af141fb00405011ff5ee1ef; Type: FK CONSTRAINT; Schema: public; Owner: postgress
--

ALTER TABLE ONLY public.records
    ADD CONSTRAINT "FK_e818af141fb00405011ff5ee1ef" FOREIGN KEY ("titleId") REFERENCES public.records_title(id);


--
-- Name: pages-comments FK_f18adbc5cfd113a69abd01f731b; Type: FK CONSTRAINT; Schema: public; Owner: postgress
--

ALTER TABLE ONLY public."pages-comments"
    ADD CONSTRAINT "FK_f18adbc5cfd113a69abd01f731b" FOREIGN KEY ("userId") REFERENCES public."user"(id);


--
-- Name: callback_instances_value FK_f3d100f2b66fffb5d021ce77232; Type: FK CONSTRAINT; Schema: public; Owner: postgress
--

ALTER TABLE ONLY public.callback_instances_value
    ADD CONSTRAINT "FK_f3d100f2b66fffb5d021ce77232" FOREIGN KEY ("fieldId") REFERENCES public.callback_field(id);


--
-- Name: pages_sections_title_value FK_f528e26b260dd3549b3d12d351b; Type: FK CONSTRAINT; Schema: public; Owner: postgress
--

ALTER TABLE ONLY public.pages_sections_title_value
    ADD CONSTRAINT "FK_f528e26b260dd3549b3d12d351b" FOREIGN KEY ("sectionId") REFERENCES public.pages_sections(id);


--
-- Name: reference_book_instances_value FK_f7cae818770360f5ba9232c030f; Type: FK CONSTRAINT; Schema: public; Owner: postgress
--

ALTER TABLE ONLY public.reference_book_instances_value
    ADD CONSTRAINT "FK_f7cae818770360f5ba9232c030f" FOREIGN KEY ("instanceId") REFERENCES public.reference_book_instances(id);


--
-- Name: pages_iblock_records_field FK_f929fe9c470a6478598aa51e2a1; Type: FK CONSTRAINT; Schema: public; Owner: postgress
--

ALTER TABLE ONLY public.pages_iblock_records_field
    ADD CONSTRAINT "FK_f929fe9c470a6478598aa51e2a1" FOREIGN KEY ("fieldId") REFERENCES public.pages_iblock_fields(id);


--
-- PostgreSQL database dump complete
--

