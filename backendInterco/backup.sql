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
-- Name: pages_sections_value_lang_enum; Type: TYPE; Schema: public; Owner: postgress
--

CREATE TYPE public.pages_sections_value_lang_enum AS ENUM (
    'ru-RU',
    'en-US',
    'zh-CN'
);


ALTER TYPE public.pages_sections_value_lang_enum OWNER TO postgress;

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
    "createdAt" timestamp without time zone DEFAULT '2025-02-25 12:04:45.436'::timestamp without time zone NOT NULL,
    "updatedAt" timestamp without time zone DEFAULT '2025-02-25 12:04:45.436'::timestamp without time zone NOT NULL,
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
    "createdAt" timestamp without time zone DEFAULT '2025-02-25 12:04:45.436'::timestamp without time zone NOT NULL,
    "updatedAt" timestamp without time zone DEFAULT '2025-02-25 12:04:45.436'::timestamp without time zone NOT NULL,
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
    "createdAt" timestamp without time zone DEFAULT '2025-02-25 12:04:45.436'::timestamp without time zone NOT NULL,
    "updatedAt" timestamp without time zone DEFAULT '2025-02-25 12:04:45.436'::timestamp without time zone NOT NULL,
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
    "createdAt" timestamp without time zone DEFAULT '2025-02-25 12:04:45.436'::timestamp without time zone NOT NULL,
    "updatedAt" timestamp without time zone DEFAULT '2025-02-25 12:04:45.436'::timestamp without time zone NOT NULL,
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
    "createdAt" timestamp without time zone DEFAULT '2025-02-25 12:04:45.436'::timestamp without time zone NOT NULL,
    "updatedAt" timestamp without time zone DEFAULT '2025-02-25 12:04:45.436'::timestamp without time zone NOT NULL,
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
    "createdAt" timestamp without time zone DEFAULT '2025-02-25 12:04:45.436'::timestamp without time zone NOT NULL,
    "updatedAt" timestamp without time zone DEFAULT '2025-02-25 12:04:45.436'::timestamp without time zone NOT NULL,
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
    "createdAt" timestamp without time zone DEFAULT '2025-02-25 12:04:45.436'::timestamp without time zone NOT NULL,
    "updatedAt" timestamp without time zone DEFAULT '2025-02-25 12:04:45.436'::timestamp without time zone NOT NULL,
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
-- Name: pages; Type: TABLE; Schema: public; Owner: postgress
--

CREATE TABLE public.pages (
    id integer NOT NULL,
    "createdAt" timestamp without time zone DEFAULT '2025-02-25 12:04:45.436'::timestamp without time zone NOT NULL,
    "updatedAt" timestamp without time zone DEFAULT '2025-02-25 12:04:45.436'::timestamp without time zone NOT NULL,
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
    "createdAt" timestamp without time zone DEFAULT '2025-02-25 12:04:45.436'::timestamp without time zone NOT NULL,
    "updatedAt" timestamp without time zone DEFAULT '2025-02-25 12:04:45.436'::timestamp without time zone NOT NULL,
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
    "createdAt" timestamp without time zone DEFAULT '2025-02-25 12:04:45.436'::timestamp without time zone NOT NULL,
    "updatedAt" timestamp without time zone DEFAULT '2025-02-25 12:04:45.436'::timestamp without time zone NOT NULL,
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
    "createdAt" timestamp without time zone DEFAULT '2025-02-25 12:04:45.436'::timestamp without time zone NOT NULL,
    "updatedAt" timestamp without time zone DEFAULT '2025-02-25 12:04:45.436'::timestamp without time zone NOT NULL,
    "deletedAt" timestamp without time zone,
    name character varying(1024) NOT NULL,
    slug character varying(1024) NOT NULL,
    "pageId" integer,
    attributes json
);


ALTER TABLE public.pages_iblock OWNER TO postgress;

--
-- Name: pages_iblock_fields; Type: TABLE; Schema: public; Owner: postgress
--

CREATE TABLE public.pages_iblock_fields (
    id integer NOT NULL,
    "createdAt" timestamp without time zone DEFAULT '2025-02-25 12:04:45.436'::timestamp without time zone NOT NULL,
    "updatedAt" timestamp without time zone DEFAULT '2025-02-25 12:04:45.436'::timestamp without time zone NOT NULL,
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
    "createdAt" timestamp without time zone DEFAULT '2025-02-25 12:04:45.436'::timestamp without time zone NOT NULL,
    "updatedAt" timestamp without time zone DEFAULT '2025-02-25 12:04:45.436'::timestamp without time zone NOT NULL,
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
-- Name: pages_iblock_fields_records; Type: TABLE; Schema: public; Owner: postgress
--

CREATE TABLE public.pages_iblock_fields_records (
    id integer NOT NULL,
    "createdAt" timestamp without time zone DEFAULT '2025-02-05 11:19:39.965'::timestamp without time zone NOT NULL,
    "updatedAt" timestamp without time zone DEFAULT '2025-02-05 11:19:39.965'::timestamp without time zone NOT NULL,
    "deletedAt" timestamp without time zone
);


ALTER TABLE public.pages_iblock_fields_records OWNER TO postgress;

--
-- Name: pages_iblock_fields_records_id_seq; Type: SEQUENCE; Schema: public; Owner: postgress
--

CREATE SEQUENCE public.pages_iblock_fields_records_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.pages_iblock_fields_records_id_seq OWNER TO postgress;

--
-- Name: pages_iblock_fields_records_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgress
--

ALTER SEQUENCE public.pages_iblock_fields_records_id_seq OWNED BY public.pages_iblock_fields_records.id;


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
    "createdAt" timestamp without time zone DEFAULT '2025-02-25 12:04:45.436'::timestamp without time zone NOT NULL,
    "updatedAt" timestamp without time zone DEFAULT '2025-02-25 12:04:45.436'::timestamp without time zone NOT NULL,
    "deletedAt" timestamp without time zone,
    "iblockId" integer,
    sort integer DEFAULT 0
);


ALTER TABLE public.pages_iblock_records OWNER TO postgress;

--
-- Name: pages_iblock_records_field; Type: TABLE; Schema: public; Owner: postgress
--

CREATE TABLE public.pages_iblock_records_field (
    id integer NOT NULL,
    "createdAt" timestamp without time zone DEFAULT '2025-02-25 12:04:45.436'::timestamp without time zone NOT NULL,
    "updatedAt" timestamp without time zone DEFAULT '2025-02-25 12:04:45.436'::timestamp without time zone NOT NULL,
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
    "createdAt" timestamp without time zone DEFAULT '2025-02-25 12:04:45.436'::timestamp without time zone NOT NULL,
    "updatedAt" timestamp without time zone DEFAULT '2025-02-25 12:04:45.436'::timestamp without time zone NOT NULL,
    "deletedAt" timestamp without time zone,
    "recordFieldId" integer,
    lang public.pages_iblock_records_field_value_lang_enum NOT NULL,
    value character varying NOT NULL
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
    "createdAt" timestamp without time zone DEFAULT '2025-02-25 12:04:45.436'::timestamp without time zone NOT NULL,
    "updatedAt" timestamp without time zone DEFAULT '2025-02-25 12:04:45.436'::timestamp without time zone NOT NULL,
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
    "createdAt" timestamp without time zone DEFAULT '2025-02-25 12:04:45.436'::timestamp without time zone NOT NULL,
    "updatedAt" timestamp without time zone DEFAULT '2025-02-25 12:04:45.436'::timestamp without time zone NOT NULL,
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
    "createdAt" timestamp without time zone DEFAULT '2025-02-25 12:04:45.436'::timestamp without time zone NOT NULL,
    "updatedAt" timestamp without time zone DEFAULT '2025-02-25 12:04:45.436'::timestamp without time zone NOT NULL,
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
    "createdAt" timestamp without time zone DEFAULT '2025-02-25 12:04:45.436'::timestamp without time zone NOT NULL,
    "updatedAt" timestamp without time zone DEFAULT '2025-02-25 12:04:45.436'::timestamp without time zone NOT NULL,
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
    "createdAt" timestamp without time zone DEFAULT '2025-02-25 12:04:45.436'::timestamp without time zone NOT NULL,
    "updatedAt" timestamp without time zone DEFAULT '2025-02-25 12:04:45.436'::timestamp without time zone NOT NULL,
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
-- Name: pages_params_value; Type: TABLE; Schema: public; Owner: postgress
--

CREATE TABLE public.pages_params_value (
    id integer NOT NULL,
    "createdAt" timestamp without time zone DEFAULT '2025-02-20 12:57:18.033'::timestamp without time zone NOT NULL,
    "updatedAt" timestamp without time zone DEFAULT '2025-02-20 12:57:18.033'::timestamp without time zone NOT NULL,
    "deletedAt" timestamp without time zone,
    value character varying,
    "valueJson" json,
    "paramsId" integer,
    "recordId" integer
);


ALTER TABLE public.pages_params_value OWNER TO postgress;

--
-- Name: pages_params_value_id_seq; Type: SEQUENCE; Schema: public; Owner: postgress
--

CREATE SEQUENCE public.pages_params_value_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.pages_params_value_id_seq OWNER TO postgress;

--
-- Name: pages_params_value_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgress
--

ALTER SEQUENCE public.pages_params_value_id_seq OWNED BY public.pages_params_value.id;


--
-- Name: pages_sections; Type: TABLE; Schema: public; Owner: postgress
--

CREATE TABLE public.pages_sections (
    id integer NOT NULL,
    "createdAt" timestamp without time zone DEFAULT '2025-02-25 12:04:45.436'::timestamp without time zone NOT NULL,
    "updatedAt" timestamp without time zone DEFAULT '2025-02-25 12:04:45.436'::timestamp without time zone NOT NULL,
    "deletedAt" timestamp without time zone,
    "pagesId" integer
);


ALTER TABLE public.pages_sections OWNER TO postgress;

--
-- Name: pages_sections_description_value; Type: TABLE; Schema: public; Owner: postgress
--

CREATE TABLE public.pages_sections_description_value (
    id integer NOT NULL,
    "createdAt" timestamp without time zone DEFAULT '2025-02-25 12:04:45.436'::timestamp without time zone NOT NULL,
    "updatedAt" timestamp without time zone DEFAULT '2025-02-25 12:04:45.436'::timestamp without time zone NOT NULL,
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
    "createdAt" timestamp without time zone DEFAULT '2025-02-25 12:04:45.436'::timestamp without time zone NOT NULL,
    "updatedAt" timestamp without time zone DEFAULT '2025-02-25 12:04:45.436'::timestamp without time zone NOT NULL,
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
-- Name: pages_sections_value; Type: TABLE; Schema: public; Owner: postgress
--

CREATE TABLE public.pages_sections_value (
    id integer NOT NULL,
    "createdAt" timestamp without time zone DEFAULT '2025-02-23 11:53:11.021'::timestamp without time zone NOT NULL,
    "updatedAt" timestamp without time zone DEFAULT '2025-02-23 11:53:11.021'::timestamp without time zone NOT NULL,
    "deletedAt" timestamp without time zone,
    value character varying NOT NULL,
    lang public.pages_sections_value_lang_enum NOT NULL,
    "sectionId" integer
);


ALTER TABLE public.pages_sections_value OWNER TO postgress;

--
-- Name: pages_sections_value_id_seq; Type: SEQUENCE; Schema: public; Owner: postgress
--

CREATE SEQUENCE public.pages_sections_value_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.pages_sections_value_id_seq OWNER TO postgress;

--
-- Name: pages_sections_value_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgress
--

ALTER SEQUENCE public.pages_sections_value_id_seq OWNED BY public.pages_sections_value.id;


--
-- Name: pages_seo; Type: TABLE; Schema: public; Owner: postgress
--

CREATE TABLE public.pages_seo (
    id integer NOT NULL,
    "createdAt" timestamp without time zone DEFAULT '2025-02-25 12:04:45.436'::timestamp without time zone NOT NULL,
    "updatedAt" timestamp without time zone DEFAULT '2025-02-25 12:04:45.436'::timestamp without time zone NOT NULL,
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
    "createdAt" timestamp without time zone DEFAULT '2025-02-25 12:04:45.436'::timestamp without time zone NOT NULL,
    "updatedAt" timestamp without time zone DEFAULT '2025-02-25 12:04:45.436'::timestamp without time zone NOT NULL,
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
    "createdAt" timestamp without time zone DEFAULT '2025-02-25 12:04:45.436'::timestamp without time zone NOT NULL,
    "updatedAt" timestamp without time zone DEFAULT '2025-02-25 12:04:45.436'::timestamp without time zone NOT NULL,
    "deletedAt" timestamp without time zone,
    "countView" integer DEFAULT 0 NOT NULL,
    "pagesId" integer,
    "authorId" integer,
    "titleId" integer,
    "seoId" integer,
    "descriptionId" integer
);


ALTER TABLE public.records OWNER TO postgress;

--
-- Name: records_description; Type: TABLE; Schema: public; Owner: postgress
--

CREATE TABLE public.records_description (
    id integer NOT NULL,
    "createdAt" timestamp without time zone DEFAULT '2025-02-25 12:04:45.436'::timestamp without time zone NOT NULL,
    "updatedAt" timestamp without time zone DEFAULT '2025-02-25 12:04:45.436'::timestamp without time zone NOT NULL,
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
    "createdAt" timestamp without time zone DEFAULT '2025-02-25 12:04:45.436'::timestamp without time zone NOT NULL,
    "updatedAt" timestamp without time zone DEFAULT '2025-02-25 12:04:45.436'::timestamp without time zone NOT NULL,
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
    "createdAt" timestamp without time zone DEFAULT '2025-02-25 12:04:45.436'::timestamp without time zone NOT NULL,
    "updatedAt" timestamp without time zone DEFAULT '2025-02-25 12:04:45.436'::timestamp without time zone NOT NULL,
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
    "createdAt" timestamp without time zone DEFAULT '2025-02-25 12:04:45.436'::timestamp without time zone NOT NULL,
    "updatedAt" timestamp without time zone DEFAULT '2025-02-25 12:04:45.436'::timestamp without time zone NOT NULL,
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
    "createdAt" timestamp without time zone DEFAULT '2025-02-25 12:04:45.436'::timestamp without time zone NOT NULL,
    "updatedAt" timestamp without time zone DEFAULT '2025-02-25 12:04:45.436'::timestamp without time zone NOT NULL,
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
    "createdAt" timestamp without time zone DEFAULT '2025-02-25 12:04:45.436'::timestamp without time zone NOT NULL,
    "updatedAt" timestamp without time zone DEFAULT '2025-02-25 12:04:45.436'::timestamp without time zone NOT NULL,
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
    "createdAt" timestamp without time zone DEFAULT '2025-02-25 12:04:45.436'::timestamp without time zone NOT NULL,
    "updatedAt" timestamp without time zone DEFAULT '2025-02-25 12:04:45.436'::timestamp without time zone NOT NULL,
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
    "createdAt" timestamp without time zone DEFAULT '2025-02-25 12:04:45.436'::timestamp without time zone NOT NULL,
    "updatedAt" timestamp without time zone DEFAULT '2025-02-25 12:04:45.436'::timestamp without time zone NOT NULL,
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
    "createdAt" timestamp without time zone DEFAULT '2025-02-25 12:04:45.436'::timestamp without time zone NOT NULL,
    "updatedAt" timestamp without time zone DEFAULT '2025-02-25 12:04:45.436'::timestamp without time zone NOT NULL,
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
    "createdAt" timestamp without time zone DEFAULT '2025-02-25 12:04:45.436'::timestamp without time zone NOT NULL,
    "updatedAt" timestamp without time zone DEFAULT '2025-02-25 12:04:45.436'::timestamp without time zone NOT NULL,
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
    "createdAt" timestamp without time zone DEFAULT '2025-02-25 12:04:45.436'::timestamp without time zone NOT NULL,
    "updatedAt" timestamp without time zone DEFAULT '2025-02-25 12:04:45.436'::timestamp without time zone NOT NULL,
    "deletedAt" timestamp without time zone,
    title character varying(1024) NOT NULL,
    description character varying(1024),
    vk character varying(1024),
    facebook character varying(1024),
    viber character varying(1024),
    whatsapp character varying(1024),
    telegram character varying(1024),
    phone character varying(1024),
    email character varying(1024),
    "urlBitrix" character varying DEFAULT ''::character varying,
    "amoClientId" character varying DEFAULT ''::character varying,
    "amoClientSecret" character varying DEFAULT ''::character varying,
    "amoDomain" character varying DEFAULT ''::character varying,
    "amoBearer" character varying DEFAULT ''::character varying,
    discord character varying(1024),
    "linkedIn" character varying(1024),
    instagram character varying(1024)
);


ALTER TABLE public.settings OWNER TO postgress;

--
-- Name: settings-contacts; Type: TABLE; Schema: public; Owner: postgress
--

CREATE TABLE public."settings-contacts" (
    id integer NOT NULL,
    "createdAt" timestamp without time zone DEFAULT '2025-02-25 12:04:45.436'::timestamp without time zone NOT NULL,
    "updatedAt" timestamp without time zone DEFAULT '2025-02-25 12:04:45.436'::timestamp without time zone NOT NULL,
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
    "createdAt" timestamp without time zone DEFAULT '2025-02-25 12:04:45.436'::timestamp without time zone NOT NULL,
    "updatedAt" timestamp without time zone DEFAULT '2025-02-25 12:04:45.436'::timestamp without time zone NOT NULL,
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
    "createdAt" timestamp without time zone DEFAULT '2025-02-25 12:04:45.436'::timestamp without time zone NOT NULL,
    "updatedAt" timestamp without time zone DEFAULT '2025-02-25 12:04:45.436'::timestamp without time zone NOT NULL,
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
    "createdAt" timestamp without time zone DEFAULT '2025-02-25 12:04:45.436'::timestamp without time zone NOT NULL,
    "updatedAt" timestamp without time zone DEFAULT '2025-02-25 12:04:45.436'::timestamp without time zone NOT NULL,
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
-- Name: pages_iblock_fields_records id; Type: DEFAULT; Schema: public; Owner: postgress
--

ALTER TABLE ONLY public.pages_iblock_fields_records ALTER COLUMN id SET DEFAULT nextval('public.pages_iblock_fields_records_id_seq'::regclass);


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
-- Name: pages_params_value id; Type: DEFAULT; Schema: public; Owner: postgress
--

ALTER TABLE ONLY public.pages_params_value ALTER COLUMN id SET DEFAULT nextval('public.pages_params_value_id_seq'::regclass);


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
-- Name: pages_sections_value id; Type: DEFAULT; Schema: public; Owner: postgress
--

ALTER TABLE ONLY public.pages_sections_value ALTER COLUMN id SET DEFAULT nextval('public.pages_sections_value_id_seq'::regclass);


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
4	2025-02-07 21:00:07.449	2025-02-07 21:02:59.54787	2025-02-07 21:02:59.54787		images	direction-sllide3.png	26bc21726c8e463d4617f944db7606ac.png	572060	f	\N
3	2025-02-07 21:00:07.449	2025-02-07 21:15:30.625301	2025-02-07 21:15:30.625301		images	direction-sllide3.png	9d6c9f011d2ab9a7203d75a5f694e6af.png	572060	f	\N
5	2025-02-07 21:00:07.449	2025-02-07 21:15:30.625301	2025-02-07 21:15:30.625301		images	direction-sllide3.png	a037571959cb19d85c87d02f0730b93f.png	572060	f	\N
6	2025-02-07 21:00:07.449	2025-02-07 21:15:30.625301	2025-02-07 21:15:30.625301		images	direction-sllide3.png	5eb461c3ae8bc8726e6f2e895974a7d6.png	572060	f	\N
7	2025-02-07 21:00:07.449	2025-02-07 21:15:30.625301	2025-02-07 21:15:30.625301		images	direction-sllide3.png	d2ef049eac0f1784a372bac967ee9b6b.png	572060	f	\N
8	2025-02-07 21:00:07.449	2025-02-07 21:15:30.625301	2025-02-07 21:15:30.625301		images	direction-sllide3.png	1d7c992f4da67cabecd5516940a173a6.png	572060	f	\N
11	2025-02-07 21:39:35.328	2025-02-07 21:53:42.712326	2025-02-07 21:53:42.712326		images	direction-sllide3.png	e8ba87faf28897f9217749f3ab058c7e.png	572060	f	\N
12	2025-02-07 21:43:47.097	2025-02-07 21:55:43.212592	2025-02-07 21:55:43.212592		images	direction-sllide3.png	b4530f51058556c985d62ab302c993dc.png	572060	f	\N
13	2025-02-07 21:43:47.097	2025-02-07 21:56:10.269315	2025-02-07 21:56:10.269315		images	direction-sllide3.png	353c2d9cf1bdca7a1086ba9baedd5a3c.png	572060	f	\N
10	2025-02-07 21:00:07.449	2025-02-07 21:56:26.352384	2025-02-07 21:56:26.352384		images	direction-sllide3.png	6e272edeee6a4c4a4f42e5b46a844208.png	572060	f	\N
9	2025-02-07 21:00:07.449	2025-02-07 21:56:31.441629	2025-02-07 21:56:31.441629		images	direction-sllide3.png	ccd46878193742e2badb90fdb1c8a32b.png	572060	f	\N
14	2025-02-07 21:43:47.097	2025-02-07 21:57:41.300476	2025-02-07 21:57:41.300476		images	direction-sllide3.png	03ff216f3b724c8d492f3e767dc9adf0.png	572060	f	\N
15	2025-02-07 21:43:47.097	2025-02-07 21:59:22.461421	2025-02-07 21:59:22.461421		images	direction-sllide3.png	5f24535fdc704b6ef6371df0535922ce.png	572060	f	\N
16	2025-02-07 21:43:47.097	2025-02-07 22:00:24.385428	2025-02-07 22:00:24.385428		images	direction-sllide3.png	da79f60d6d44a20d1948ca3e24c9a61b.png	572060	f	\N
17	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N		images	direction-sllide1.png	184c4dd28c52993c0f575905f9107138.png	477111	f	\N
18	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N		images	direction-sllide3.png	8ac0289ed87ec875111e220894c7d510.png	572060	f	\N
19	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N		images	direction-sllide3.png	fee30b83dabf20a4de8bd54ed7b681eb.png	572060	f	\N
20	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N		images	direction-sllide4.png	0f7d9c2df4ab36205a8549da11643e97.png	383186	f	\N
21	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N		images	direction-sllide5.png	1c0b7cdd15533106c4b5af3f70b9e8c9.png	483775	f	\N
22	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N		images	direction-sllide1 (1).png	5f444d616b1246ff642347834993248c.png	477111	f	\N
23	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N		images	employee1.png	e9328a420e4b6e837068792ae736ee4e.png	311628	f	\N
24	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N		images	employee2.png	1f326340add2ab34f6d84fc374f2349f.png	331924	f	\N
25	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N		images	employee3.png	33087b1bfaf3c4f22d15884a7603d16a.png	293021	f	\N
26	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N		images	employee2.png	df51f069abaaeef886b214e9b8fb2ddf.png	331924	f	\N
27	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N		images	employee3.png	c85a6640a65a2a7d074132d399e08dd3.png	293021	f	\N
28	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N		docs	ÐÐ´Ð¼Ð¸Ð½ Ð¿Ð°Ð½ÐµÐ»Ñ.docx	c175b3d6a6639d91d951d4186b5f5020.docx	127336	f	\N
29	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N		docs	ÐÐ´Ð¼Ð¸Ð½ Ð¿Ð°Ð½ÐµÐ»Ñ.docx	5918bdb0f5f1a72df4bd1893c652e9fc.docx	127336	f	\N
30	2025-02-08 15:06:16.218	2025-02-08 15:06:16.218	\N		images	daulet-turubayev-RAwn1QFwfss-unsplash.png	cab52bf32fee7ed01f30ab99032e0cd7.png	207506	f	\N
31	2025-02-08 15:06:16.218	2025-02-08 15:06:16.218	\N		images	daulet-turubayev-RAwn1QFwfss-unsplash.png	20fad2e49476c37616017254693f6f31.png	207506	f	\N
32	2025-02-08 15:06:16.218	2025-02-08 15:06:16.218	\N		images	daulet-turubayev-RAwn1QFwfss-unsplash.png	af2aafa78713bac2c359bb96efda090f.png	207506	f	\N
33	2025-02-08 15:17:40.567	2025-02-08 15:17:40.567	\N		images	daulet-turubayev-RAwn1QFwfss-unsplash.png	bf768fcf2dcb1b830b18b730ad6f24a7.png	207506	f	\N
34	2025-02-21 11:48:01.126	2025-02-21 11:48:01.126	\N		images	daulet-turubayev-RAwn1QFwfss-unsplash.png	6845b1482d1d009535fc9a69c201270b.png	207506	f	\N
35	2025-02-21 11:48:01.126	2025-02-21 12:14:21.23599	2025-02-21 12:14:21.23599		images	daulet-turubayev-RAwn1QFwfss-unsplash.png	37cc9beb9e7bdb9e59737571289d2436.png	207506	f	\N
36	2025-02-21 11:48:01.126	2025-02-21 12:14:54.409588	2025-02-21 12:14:54.409588		images	daulet-turubayev-RAwn1QFwfss-unsplash.png	87b16a3eecf9ef38d17d2e98b7c1cb6c.png	207506	f	\N
37	2025-02-21 11:48:01.126	2025-02-21 12:15:32.862159	2025-02-21 12:15:32.862159		images	daulet-turubayev-RAwn1QFwfss-unsplash.png	b635f145ee3866b8c931734e24998af6.png	207506	f	\N
38	2025-02-21 18:05:26.145	2025-02-21 18:05:26.146	\N		images	daulet-turubayev-RAwn1QFwfss-unsplash.png	060546e642504b43c8d68d149702cc91.png	207506	f	\N
39	2025-02-21 18:16:30.149	2025-02-21 18:16:30.149	\N		images	daulet-turubayev-RAwn1QFwfss-unsplash.png	6d16c9bdf7f50200a9a9e09eee333310.png	207506	f	\N
40	2025-02-21 18:16:30.149	2025-02-21 18:16:30.149	\N		images	daulet-turubayev-RAwn1QFwfss-unsplash.png	6ce1687bb241c5391cd4479795fa4a4a.png	207506	f	\N
41	2025-02-21 18:21:16.057	2025-02-21 18:21:16.057	\N		images	daulet-turubayev-RAwn1QFwfss-unsplash.png	3416cf05174c5019811406e3e62ed967.png	207506	f	\N
42	2025-02-21 18:21:16.057	2025-02-21 18:21:16.057	\N		images	daulet-turubayev-RAwn1QFwfss-unsplash.png	d0754fea50ff1b286264760ef2132d11.png	207506	f	\N
43	2025-02-21 18:21:16.057	2025-02-21 18:24:10.006475	2025-02-21 18:24:10.006475		images	daulet-turubayev-RAwn1QFwfss-unsplash.png	9a432343f4f9157da818f2f5f4171189.png	207506	f	\N
44	2025-02-21 18:21:16.057	2025-02-21 18:21:16.057	\N		images	daulet-turubayev-RAwn1QFwfss-unsplash.png	89efbaf0d2b7e540d2c040adc1f549bf.png	207506	f	\N
45	2025-02-21 18:21:16.057	2025-02-21 18:26:54.888709	2025-02-21 18:26:54.888709		images	daulet-turubayev-RAwn1QFwfss-unsplash.png	e425f70ac3c29d7a2c67683be39aaaa5.png	207506	f	\N
46	2025-02-21 18:21:16.057	2025-02-21 18:21:16.057	\N		images	daulet-turubayev-RAwn1QFwfss-unsplash.png	87e723c8e804dd49bd8ee96ecf634013.png	207506	f	\N
47	2025-02-21 18:21:16.057	2025-02-21 18:39:57.88055	2025-02-21 18:39:57.88055		images	daulet-turubayev-RAwn1QFwfss-unsplash.png	c1e00f6b80562eaf06828a5005bbfb8b.png	207506	f	\N
48	2025-02-21 20:49:50.236	2025-02-21 20:49:50.237	\N		images	daulet-turubayev-RAwn1QFwfss-unsplash.png	7219259062fb1a6271ce94f588f579b9.png	207506	f	\N
50	2025-02-24 08:07:25.591	2025-02-24 08:07:25.592	\N		images	pngwing.com (2) 1.png	be8e2c016341cf9f77ad0341d0daed6d.png	515224	f	\N
49	2025-02-24 08:07:25.591	2025-02-25 07:29:20.129243	2025-02-25 07:29:20.129243		images	pngwing.com (4) 1.png	b749acbf881d96070c311efed3b0a16b.png	367918	f	\N
51	2025-02-25 07:28:44.604	2025-02-25 07:28:44.604	\N		images	pngwing.com (4) 1.png	f7685ef0a882cb5dde13e64f222336e4.png	367918	f	\N
\.


--
-- Data for Name: pages; Type: TABLE DATA; Schema: public; Owner: postgress
--

COPY public.pages (id, "createdAt", "updatedAt", "deletedAt", name, description, slug, type, "pagePath", "seoId") FROM stdin;
1	2025-02-06 19:49:13.614	2025-02-06 19:52:21.643785	\N	Главная		home	Landing	""	1
2	2025-02-06 20:16:54.119	2025-02-06 20:17:33.339925	\N	О компании		about	Landing	""	2
3	2025-02-06 20:18:02.496	2025-02-06 20:18:26.285481	\N	Контакты		contacts	Landing	""	3
4	2025-02-06 20:18:48.748	2025-02-06 20:19:21.879482	\N	Политика конфиденциальности		policy	Landing	""	4
5	2025-02-06 20:19:41.606	2025-02-06 20:20:02.283774	\N	Клиенты		clients	Landing	""	5
6	2025-02-06 20:20:35.866	2025-02-06 20:20:58.248598	\N	Партнерам		partners	Landing	""	6
7	2025-02-06 20:21:17.268	2025-02-06 20:21:46.086179	\N	Карьера		career	Landing	""	7
8	2025-02-19 07:38:13.197	2025-02-19 07:38:41.954787	\N	Новости		news	blog	""	8
9	2025-02-22 15:16:53.13	2025-02-22 15:16:53.13	\N	Статьи и аналитика		articles-analytics	blog	""	\N
10	2025-02-22 15:24:13.311	2025-02-22 15:24:13.311	\N	Пресс-релизы		press-release	blog	""	\N
11	2025-02-23 09:45:03.483	2025-02-23 09:45:03.483	\N	Услуги		service	blog	""	\N
12	2025-02-24 08:45:02.416	2025-02-24 08:45:02.416	\N	Продукты		products	blog	""	\N
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

COPY public.pages_iblock (id, "createdAt", "updatedAt", "deletedAt", name, slug, "pageId", attributes) FROM stdin;
1	2025-02-06 19:48:01.55	2025-02-19 19:49:08.088509	2025-02-19 19:49:08.088509	Преимущества 	advantages	1	[{"type":"text","name":"title","fields":{"ru-RU":"Заголовок","en-US":"Title","zh-CN":"Title"},"field":{"ru-RU":"Заголовок","en-US":"Title","zh-CN":"Title"}},{"type":"images","name":"image","fields":{"ru-RU":{"path":"http://localhost:9000/cms/af2aafa78713bac2c359bb96efda090f.png","type":"images","name":"daulet-turubayev-RAwn1QFwfss-unsplash.png","filename":"af2aafa78713bac2c359bb96efda090f.png","size":207506,"deletedAt":null,"id":32,"createdAt":"2025-02-08T15:06:16.218Z","updatedAt":"2025-02-08T15:06:16.218Z","isSystem":false},"en-US":{"path":"http://localhost:9000/cms/af2aafa78713bac2c359bb96efda090f.png","type":"images","name":"daulet-turubayev-RAwn1QFwfss-unsplash.png","filename":"af2aafa78713bac2c359bb96efda090f.png","size":207506,"deletedAt":null,"id":32,"createdAt":"2025-02-08T15:06:16.218Z","updatedAt":"2025-02-08T15:06:16.218Z","isSystem":false},"zh-CN":{"path":"http://localhost:9000/cms/af2aafa78713bac2c359bb96efda090f.png","type":"images","name":"daulet-turubayev-RAwn1QFwfss-unsplash.png","filename":"af2aafa78713bac2c359bb96efda090f.png","size":207506,"deletedAt":null,"id":32,"createdAt":"2025-02-08T15:06:16.218Z","updatedAt":"2025-02-08T15:06:16.218Z","isSystem":false}}}]
2	2025-02-07 07:00:23.031	2025-02-07 07:00:23.032	\N	Наши направления деятельности	home-direction	1	\N
4	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	Контакты	home-contacts	1	\N
5	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	Актуальные вакансии	job-openings	7	\N
7	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	Контакты	career-contcats	7	\N
8	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	Часто задаваемые вопросы (FAQ)	faq	5	\N
9	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	Контакты	clients-contacts	5	\N
10	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	Основные контакты	main-contacts	3	\N
11	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	Социальные сети	social	3	\N
12	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	Общие контакты	common-contacts	3	\N
13	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	О компании	about-company	2	\N
14	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	Ключевые вехи	key-milestones	2	\N
15	2025-02-07 21:43:47.097	2025-02-08 10:26:53.084676	\N	Команда	command	2	\N
16	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	Контакты	partners-contact	6	\N
17	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	Документы	documents	4	\N
3	2025-02-07 21:43:47.097	2025-02-08 15:19:27.344401	\N	Стратегические проекты	stratagy-project	1	[{"type":"text","name":"title","fields":{"ru-RU":"Стратегические проекты","en-US":"Strategic projects","zh-CN":"策略性项目"},"field":{"ru-RU":"Стратегические проекты","en-US":"Strategic projects","zh-CN":"策略性项目"}},{"type":"images","name":"image","fields":{"ru-RU":{"path":"http://localhost:9000/cms/bf768fcf2dcb1b830b18b730ad6f24a7.png","type":"images","name":"daulet-turubayev-RAwn1QFwfss-unsplash.png","filename":"bf768fcf2dcb1b830b18b730ad6f24a7.png","size":207506,"deletedAt":null,"id":33,"createdAt":"2025-02-08T15:17:40.567Z","updatedAt":"2025-02-08T15:17:40.567Z","isSystem":false},"en-US":{"path":"http://localhost:9000/cms/bf768fcf2dcb1b830b18b730ad6f24a7.png","type":"images","name":"daulet-turubayev-RAwn1QFwfss-unsplash.png","filename":"bf768fcf2dcb1b830b18b730ad6f24a7.png","size":207506,"deletedAt":null,"id":33,"createdAt":"2025-02-08T15:17:40.567Z","updatedAt":"2025-02-08T15:17:40.567Z","isSystem":false},"zh-CN":{"path":"http://localhost:9000/cms/bf768fcf2dcb1b830b18b730ad6f24a7.png","type":"images","name":"daulet-turubayev-RAwn1QFwfss-unsplash.png","filename":"bf768fcf2dcb1b830b18b730ad6f24a7.png","size":207506,"deletedAt":null,"id":33,"createdAt":"2025-02-08T15:17:40.567Z","updatedAt":"2025-02-08T15:17:40.567Z","isSystem":false}}}]
6	2025-02-07 21:43:47.097	2025-02-08 15:21:43.530809	\N	Истории сотрудников	career-employee	7	[{"type":"text","name":"title","fields":{"ru-RU":"Истории сотрудников","en-US":"Employee stories","zh-CN":"员工故事"},"field":{"ru-RU":"Истории сотрудников","en-US":"Employee stories","zh-CN":"员工故事"}},{"type":"textarea","name":"description","fields":{"ru-RU":"Познакомьтесь с историями успеха наших сотрудников, которые уже стали частью команды SA International","en-US":"Get to know the success stories of our employees who have already become part of the SA International team.","zh-CN":"了解我们已经成为SA国际团队一员的员工的成功故事。"},"field":{"ru-RU":"Познакомьтесь с историями успеха наших сотрудников, которые уже стали частью команды SA International","en-US":"Get to know the success stories of our employees who have already become part of the SA International team.","zh-CN":"了解我们已经成为SA国际团队一员的员工的成功故事。"}}]
18	2025-02-21 19:46:23.824	2025-02-21 19:46:23.824	\N	Шапка новостей	header-news	8	\N
19	2025-02-21 20:49:50.236	2025-02-21 20:49:50.237	\N	Шапка	header-articles-analytics	9	\N
20	2025-02-21 20:49:50.236	2025-02-21 20:49:50.237	\N	Шапка	header-press-release	10	\N
21	2025-02-21 20:49:50.236	2025-02-21 20:49:50.237	\N	Социальные сети	news-socail	8	\N
22	2025-02-21 20:49:50.236	2025-02-21 20:49:50.237	\N	Контакты	news-contacts	8	\N
24	2025-02-24 08:07:25.591	2025-02-24 08:07:25.592	\N	Контакты	service-contacts	11	\N
23	2025-02-24 08:07:25.591	2025-02-24 08:56:12.427824	\N	Контакты	products-contacts	12	\N
\.


--
-- Data for Name: pages_iblock_fields; Type: TABLE DATA; Schema: public; Owner: postgress
--

COPY public.pages_iblock_fields (id, "createdAt", "updatedAt", "deletedAt", name, slug, type, "iblockId") FROM stdin;
1	2025-02-06 19:48:01.55	2025-02-06 19:48:01.55	\N	Заголовок	title	text	1
2	2025-02-06 19:48:01.55	2025-02-06 20:11:38.031107	\N	Описание	description	text	1
3	2025-02-07 07:00:23.031	2025-02-07 07:00:23.032	\N	Заголовок	title	text	2
4	2025-02-07 07:00:23.031	2025-02-07 07:00:23.032	\N	Список	list	array	2
5	2025-02-07 07:00:23.031	2025-02-07 07:00:23.032	\N	Ссылка	link	text	2
6	2025-02-07 20:39:33.302	2025-02-07 20:39:33.302	\N	Изоображение	image	image	2
7	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	Заголовок	title	text	3
8	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	Описание	description	text	3
9	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	Заголовок	title	text	4
10	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	Описание	description	text	4
11	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	Телефон	phone	text	4
12	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	Email	email	text	4
13	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	Название	title	text	5
14	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	Местоположение	location	text	5
15	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	Требования	requirements	array	5
16	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	Обязанности	responsibilities	array	5
17	2025-02-07 21:43:47.097	2025-02-08 08:43:25.269244	\N	Условия	conditions	array	5
18	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	ФИО	fio	text	6
19	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	Должность	post	text	6
20	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	Описание	description	text	6
21	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	Изоображение	image	image	6
22	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	Заголовок	title	text	7
23	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	Телефон	phone	text	7
24	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	Email	email	text	7
25	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	Описание	description	text	7
26	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	Доб. к телефону	code-phone	text	7
27	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	Вопрос	question	text	8
28	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	Описание	description	text	8
29	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	Заголовок	title	text	9
30	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	Телефон	phone	text	9
31	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	Email	email	text	9
32	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	Адрес	address	text	9
33	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	Адрес	address	text	10
34	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	Ссылка	link	text	10
35	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	Общий телефон	general-phone	text	10
36	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	Телефон отдела продаж	department-phone	text	10
37	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	Телефон технической поддержки	technical-phone	text	10
38	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	Общий email	general-email	text	10
39	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	Email отдела продаж	department-email	text	10
40	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	Email технической поддержки	technical-email	text	10
43	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	Заголовок	title	text	11
44	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	Описание	description	text	11
45	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	Instagram	instagram	text	11
46	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	Discord	discord	text	11
47	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	VK	vk	text	11
48	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	LinkedIn	linkedin	text	11
49	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	Email для общих вопросов	general-email	text	12
50	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	Email для партнеров	partners-email	text	12
51	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	Email для клиентов	clients-email	text	12
52	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	Email для прессы	press-emal	text	12
54	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	Заголовок	title	text	13
55	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	Описание	description	text	13
56	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	Год	year	text	14
57	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	Описание	description	text	14
58	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	ФИО	fio	text	15
59	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	Должность	post	text	15
60	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	Описание	description	text	15
61	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	Изоображение	image	image	15
62	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	E-mail	email	text	16
63	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	Телефон	phone	text	16
64	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	Адрес главного офиса	address	text	16
65	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	Контактное лицо	user	text	16
66	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	Заголовок	title	text	17
67	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	Описание1	description1	text	17
68	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	Описание2	description2	text	17
70	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	Файл	file	image	17
69	2025-02-07 21:43:47.097	2025-02-08 10:44:48.778195	\N	Список	list	array	17
41	2025-02-07 21:43:47.097	2025-02-17 11:45:33.979565	\N	Время работы	time-job	editor	10
71	2025-02-18 20:04:44.607	2025-02-18 20:04:44.607	\N	Заголовок	title	text	16
42	2025-02-07 21:43:47.097	2025-02-19 07:10:31.967941	\N	Заголовок	title	text	10
53	2025-02-07 21:43:47.097	2025-02-19 07:30:50.534184	\N	Время работы	workin	editor	12
72	2025-02-21 19:46:23.824	2025-02-21 19:46:23.824	\N	Заголовок	title	text	18
73	2025-02-21 19:46:23.824	2025-02-21 19:46:23.824	\N	Описание	description	text	18
74	2025-02-21 20:49:50.236	2025-02-21 20:49:50.237	\N	Заголовок	title	text	19
75	2025-02-21 20:49:50.236	2025-02-21 20:49:50.237	\N	Описание	description	text	19
76	2025-02-21 20:49:50.236	2025-02-21 20:49:50.237	\N	Заголовок	title	text	20
77	2025-02-21 20:49:50.236	2025-02-21 20:49:50.237	\N	Описание	description	text	20
78	2025-02-21 20:49:50.236	2025-02-21 20:49:50.237	\N	Заголовок	title	text	21
79	2025-02-21 20:49:50.236	2025-02-21 20:49:50.237	\N	Описание	description	text	21
80	2025-02-21 20:49:50.236	2025-02-21 20:49:50.237	\N	Заголовок	title	text	22
81	2025-02-21 20:49:50.236	2025-02-21 20:49:50.237	\N	Описание	description	text	22
82	2025-02-21 20:49:50.236	2025-02-21 20:49:50.237	\N	Адрес	address	text	22
83	2025-02-21 20:49:50.236	2025-02-21 20:49:50.237	\N	Телефон	phone	text	22
84	2025-02-21 20:49:50.236	2025-02-21 20:49:50.237	\N	E-mail	email	text	22
85	2025-02-24 08:07:25.591	2025-02-24 08:07:25.592	\N	Email	email	text	23
86	2025-02-24 08:07:25.591	2025-02-24 08:07:25.592	\N	Телефон	phone	text	23
87	2025-02-24 08:07:25.591	2025-02-24 08:07:25.592	\N	Адрес	address	text	23
88	2025-02-24 08:07:25.591	2025-02-24 08:07:25.592	\N	Email	email	text	24
89	2025-02-24 08:07:25.591	2025-02-24 08:07:25.592	\N	Телефон	phone	text	24
90	2025-02-24 08:07:25.591	2025-02-24 08:07:25.592	\N	Адрес	address	text	24
\.


--
-- Data for Name: pages_iblock_fields_label; Type: TABLE DATA; Schema: public; Owner: postgress
--

COPY public.pages_iblock_fields_label (id, "createdAt", "updatedAt", "deletedAt", value, lang, "fieldId") FROM stdin;
1	2025-02-06 19:48:01.55	2025-02-06 19:48:01.55	\N	Заголовок	ru-RU	1
2	2025-02-06 19:48:01.55	2025-02-06 19:48:01.55	\N	Title	en-US	1
3	2025-02-06 19:48:01.55	2025-02-06 19:48:01.55	\N	Title	zh-CN	1
5	2025-02-06 19:48:01.55	2025-02-06 19:48:01.55	\N	Description	en-US	2
6	2025-02-06 19:48:01.55	2025-02-06 19:48:01.55	\N	Description	zh-CN	2
4	2025-02-06 19:48:01.55	2025-02-06 20:11:38.036076	\N	Описание	ru-RU	2
7	2025-02-07 07:00:23.031	2025-02-07 07:00:23.032	\N	Title	ru-RU	3
8	2025-02-07 07:00:23.031	2025-02-07 07:00:23.032	\N	Title	en-US	3
9	2025-02-07 07:00:23.031	2025-02-07 07:00:23.032	\N	Title	zh-CN	3
10	2025-02-07 07:00:23.031	2025-02-07 07:00:23.032	\N	Список	ru-RU	4
11	2025-02-07 07:00:23.031	2025-02-07 07:00:23.032	\N	List	en-US	4
12	2025-02-07 07:00:23.031	2025-02-07 07:00:23.032	\N	List	zh-CN	4
13	2025-02-07 07:00:23.031	2025-02-07 07:00:23.032	\N	Ссылка	ru-RU	5
14	2025-02-07 07:00:23.031	2025-02-07 07:00:23.032	\N	Link	en-US	5
15	2025-02-07 07:00:23.031	2025-02-07 07:00:23.032	\N	Link	zh-CN	5
16	2025-02-07 20:39:33.302	2025-02-07 20:39:33.302	\N	Изоображение	ru-RU	6
17	2025-02-07 20:39:33.302	2025-02-07 20:39:33.302	\N	Image	en-US	6
18	2025-02-07 20:39:33.302	2025-02-07 20:39:33.302	\N	Image	zh-CN	6
19	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	Заголовок	ru-RU	7
20	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	Title	en-US	7
21	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	Title	zh-CN	7
22	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	Описание	ru-RU	8
23	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	Description	en-US	8
24	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	Description	zh-CN	8
25	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	Заголовок	ru-RU	9
26	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	Title	zh-CN	9
27	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	Title	en-US	9
28	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	Описание	ru-RU	10
29	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	Description	zh-CN	10
30	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	Description	en-US	10
31	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	Телефон	ru-RU	11
32	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	Phone	en-US	11
33	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	Phone	zh-CN	11
34	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	Email	ru-RU	12
35	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	Email	en-US	12
36	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	Email	zh-CN	12
37	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	Название	ru-RU	13
38	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	Title	zh-CN	13
39	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	Title	en-US	13
40	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	Местоположение	ru-RU	14
41	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	Location	en-US	14
42	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	地点	zh-CN	14
43	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	Требования	ru-RU	15
44	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	Requirements	en-US	15
45	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	要求	zh-CN	15
46	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	Обязанности	ru-RU	16
47	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	Responsibilities	en-US	16
48	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	职责	zh-CN	16
49	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	Условия	ru-RU	17
50	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	条件	zh-CN	17
51	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	Conditions	en-US	17
52	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	ФИО	ru-RU	18
53	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	FIO	en-US	18
54	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	FIO	zh-CN	18
55	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	Post	en-US	19
56	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	Должность	ru-RU	19
57	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	Post	zh-CN	19
58	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	Описание	ru-RU	20
59	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	Description	en-US	20
60	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	Description	zh-CN	20
61	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	Изоображение	ru-RU	21
62	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	Image	en-US	21
63	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	Image	zh-CN	21
64	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	Заголовок	ru-RU	22
65	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	Title	zh-CN	22
66	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	Title	en-US	22
67	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	Телефон	ru-RU	23
68	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	Phone	en-US	23
69	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	Phone	zh-CN	23
70	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	Email	ru-RU	24
71	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	Email	en-US	24
72	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	Email	zh-CN	24
73	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	Описание	ru-RU	25
74	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	Description	en-US	25
75	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	Description	zh-CN	25
76	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	Code Phone	en-US	26
77	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	Доб. к телефону	ru-RU	26
78	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	Code Phone	zh-CN	26
79	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	Вопрос	ru-RU	27
80	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	Question	zh-CN	27
81	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	Question	en-US	27
82	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	Описание	ru-RU	28
83	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	Description	en-US	28
84	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	Description	zh-CN	28
85	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	Заголовок	ru-RU	29
86	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	Title	en-US	29
87	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	Title	zh-CN	29
88	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	Телефон	ru-RU	30
89	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	Phone	en-US	30
90	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	Phone	zh-CN	30
91	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	Email	ru-RU	31
92	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	Email	en-US	31
93	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	Email	zh-CN	31
94	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	Адрес	ru-RU	32
95	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	Address	en-US	32
96	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	Address	zh-CN	32
97	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	Адрес	ru-RU	33
98	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	Address	en-US	33
99	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	地址	zh-CN	33
100	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	Посмотреть на карте Baidu Maps (https://map.baidu.com/)	ru-RU	34
101	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	View on the Baidu Maps map (https://map.baidu.com /)	en-US	34
102	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	在百度地图上查看（https://map.baidu.com /)	zh-CN	34
103	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	Общий	ru-RU	35
104	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	General	en-US	35
105	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	一般事务	zh-CN	35
106	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	Отдел продаж:	ru-RU	36
107	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	Sales Department	en-US	36
111	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	技术支持:	zh-CN	37
113	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	General	en-US	38
117	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	销售部	zh-CN	39
120	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	技术支持:	zh-CN	40
123	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	工作时间	zh-CN	41
108	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	销售部	zh-CN	36
109	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	Техническая поддержка:	ru-RU	37
114	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	一般事务	zh-CN	38
118	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	Техническая поддержка:	ru-RU	40
110	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	Technical support:	en-US	37
112	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	Общий	ru-RU	38
115	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	Отдел продаж:	ru-RU	39
116	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	Sales Department	en-US	39
119	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	Technical support:	en-US	40
121	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	Время работы	ru-RU	41
122	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	Working hours	en-US	41
124	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	Заголовок	ru-RU	42
125	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	Title	zh-CN	42
126	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	Title	en-US	42
127	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	Заголовок	ru-RU	43
128	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	Title	zh-CN	43
129	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	Title	en-US	43
130	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	Описание	ru-RU	44
131	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	Description	en-US	44
132	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	Description	zh-CN	44
133	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	Instagram	ru-RU	45
134	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	Instagram	en-US	45
135	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	Instagram	zh-CN	45
136	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	Discord	ru-RU	46
137	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	Discord	en-US	46
138	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	Discord	zh-CN	46
139	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	VK	ru-RU	47
140	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	VK	en-US	47
141	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	VK	zh-CN	47
142	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	LinkedIn	ru-RU	48
143	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	LinkedIn	en-US	48
144	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	LinkedIn	zh-CN	48
145	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	Email для общих вопросов	ru-RU	49
146	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	Email for General Inquiries	en-US	49
147	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	一般问题邮箱	zh-CN	49
148	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	Email для партнеров	ru-RU	50
149	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	Email for Partners	en-US	50
150	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	合作伙伴邮箱	zh-CN	50
151	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	Email для клиентов	ru-RU	51
152	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	客户邮箱	zh-CN	51
153	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	Email for Clients	en-US	51
154	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	Email для прессы	ru-RU	52
155	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	Email for Press	en-US	52
156	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	新闻邮箱	zh-CN	52
157	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	Время работы	ru-RU	53
158	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	Working hours	en-US	53
159	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	工作时间	zh-CN	53
160	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	Заголовок	ru-RU	54
161	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	Title	en-US	54
162	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	Title	zh-CN	54
163	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	Описание	ru-RU	55
164	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	Description	en-US	55
165	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	Description	zh-CN	55
166	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	Год	ru-RU	56
167	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	Year	en-US	56
168	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	Year	zh-CN	56
169	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	Описание	ru-RU	57
170	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	Description	en-US	57
171	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	Description	zh-CN	57
172	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	ФИО	ru-RU	58
173	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	FIO	en-US	58
174	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	FIO	zh-CN	58
175	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	Должность	ru-RU	59
176	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	Post	en-US	59
177	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	Post	zh-CN	59
178	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	Описание	ru-RU	60
179	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	Description	en-US	60
180	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	Description	zh-CN	60
181	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	Изоображение	ru-RU	61
182	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	Image	en-US	61
183	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	Image	zh-CN	61
184	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	E-mail	ru-RU	62
185	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	電子郵件	zh-CN	62
186	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	E-mail	en-US	62
187	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	Телефон	ru-RU	63
188	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	Phone	en-US	63
189	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	電話	zh-CN	63
190	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	Адрес главного офиса	ru-RU	64
191	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	Main office address	en-US	64
192	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	总部地址	zh-CN	64
193	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	Контактное лицо	ru-RU	65
194	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	Contact person	en-US	65
195	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	联系人	zh-CN	65
196	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	Заголовок	ru-RU	66
197	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	Title	zh-CN	66
198	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	Title	en-US	66
199	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	Описание1	ru-RU	67
200	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	Description1	en-US	67
201	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	Description1	zh-CN	67
202	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	Описание2	ru-RU	68
203	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	Description2	en-US	68
204	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	Description2	zh-CN	68
205	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	Список	ru-RU	69
206	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	List	en-US	69
207	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	List	zh-CN	69
208	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	Файл	ru-RU	70
209	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	File	en-US	70
210	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	File	zh-CN	70
211	2025-02-18 20:04:44.607	2025-02-18 20:04:44.607	\N	Заголовок	ru-RU	71
212	2025-02-18 20:04:44.607	2025-02-18 20:04:44.607	\N	Title	en-US	71
213	2025-02-18 20:04:44.607	2025-02-18 20:04:44.607	\N	Title	zh-CN	71
214	2025-02-21 19:46:23.824	2025-02-21 19:46:23.824	\N	Заголовок	ru-RU	72
215	2025-02-21 19:46:23.824	2025-02-21 19:46:23.824	\N	Title	zh-CN	72
216	2025-02-21 19:46:23.824	2025-02-21 19:46:23.824	\N	Title	en-US	72
217	2025-02-21 19:46:23.824	2025-02-21 19:46:23.824	\N	Описание	ru-RU	73
218	2025-02-21 19:46:23.824	2025-02-21 19:46:23.824	\N	Description	en-US	73
219	2025-02-21 19:46:23.824	2025-02-21 19:46:23.824	\N	Description	zh-CN	73
220	2025-02-21 20:49:50.236	2025-02-21 20:49:50.237	\N	Заголовок	ru-RU	74
221	2025-02-21 20:49:50.236	2025-02-21 20:49:50.237	\N	Title	zh-CN	74
222	2025-02-21 20:49:50.236	2025-02-21 20:49:50.237	\N	Title	en-US	74
223	2025-02-21 20:49:50.236	2025-02-21 20:49:50.237	\N	Описание	ru-RU	75
225	2025-02-21 20:49:50.236	2025-02-21 20:49:50.237	\N	Description	zh-CN	75
226	2025-02-21 20:49:50.236	2025-02-21 20:49:50.237	\N	Заголовок	ru-RU	76
253	2025-02-24 08:07:25.591	2025-02-24 08:07:25.592	\N	Email	ru-RU	85
258	2025-02-24 08:07:25.591	2025-02-24 08:07:25.592	\N	phone	zh-CN	86
260	2025-02-24 08:07:25.591	2025-02-24 08:07:25.592	\N	address	en-US	87
227	2025-02-21 20:49:50.236	2025-02-21 20:49:50.237	\N	Title	en-US	76
231	2025-02-21 20:49:50.236	2025-02-21 20:49:50.237	\N	Description	zh-CN	77
254	2025-02-24 08:07:25.591	2025-02-24 08:07:25.592	\N	Email	en-US	85
257	2025-02-24 08:07:25.591	2025-02-24 08:07:25.592	\N	phone	en-US	86
261	2025-02-24 08:07:25.591	2025-02-24 08:07:25.592	\N	address	zh-CN	87
228	2025-02-21 20:49:50.236	2025-02-21 20:49:50.237	\N	Title	zh-CN	76
230	2025-02-21 20:49:50.236	2025-02-21 20:49:50.237	\N	Description	en-US	77
255	2025-02-24 08:07:25.591	2025-02-24 08:07:25.592	\N	Email	zh-CN	85
229	2025-02-21 20:49:50.236	2025-02-21 20:49:50.237	\N	Описание	ru-RU	77
256	2025-02-24 08:07:25.591	2025-02-24 08:07:25.592	\N	Телефон	ru-RU	86
232	2025-02-21 20:49:50.236	2025-02-21 20:49:50.237	\N	Заголовок	ru-RU	78
259	2025-02-24 08:07:25.591	2025-02-24 08:07:25.592	\N	Адрес	ru-RU	87
233	2025-02-21 20:49:50.236	2025-02-21 20:49:50.237	\N	Title	en-US	78
237	2025-02-21 20:49:50.236	2025-02-21 20:49:50.237	\N	Description	zh-CN	79
262	2025-02-24 08:07:25.591	2025-02-24 08:07:25.592	\N	Email	ru-RU	88
267	2025-02-24 08:07:25.591	2025-02-24 08:07:25.592	\N	Phone	zh-CN	89
269	2025-02-24 08:07:25.591	2025-02-24 08:07:25.592	\N	Address	en-US	90
234	2025-02-21 20:49:50.236	2025-02-21 20:49:50.237	\N	Title	zh-CN	78
236	2025-02-21 20:49:50.236	2025-02-21 20:49:50.237	\N	Description	en-US	79
263	2025-02-24 08:07:25.591	2025-02-24 08:07:25.592	\N	Email	en-US	88
266	2025-02-24 08:07:25.591	2025-02-24 08:07:25.592	\N	Phone	en-US	89
270	2025-02-24 08:07:25.591	2025-02-24 08:07:25.592	\N	Address	zh-CN	90
235	2025-02-21 20:49:50.236	2025-02-21 20:49:50.237	\N	Описание	ru-RU	79
264	2025-02-24 08:07:25.591	2025-02-24 08:07:25.592	\N	Email	zh-CN	88
238	2025-02-21 20:49:50.236	2025-02-21 20:49:50.237	\N	Заголовок	ru-RU	80
242	2025-02-21 20:49:50.236	2025-02-21 20:49:50.237	\N	Description	en-US	81
247	2025-02-21 20:49:50.236	2025-02-21 20:49:50.237	\N	Телефон	ru-RU	83
265	2025-02-24 08:07:25.591	2025-02-24 08:07:25.592	\N	Телефон	ru-RU	89
239	2025-02-21 20:49:50.236	2025-02-21 20:49:50.237	\N	Title	en-US	80
268	2025-02-24 08:07:25.591	2025-02-24 08:07:25.592	\N	Адрес	ru-RU	90
240	2025-02-21 20:49:50.236	2025-02-21 20:49:50.237	\N	Title	zh-CN	80
241	2025-02-21 20:49:50.236	2025-02-21 20:49:50.237	\N	Описание	ru-RU	81
246	2025-02-21 20:49:50.236	2025-02-21 20:49:50.237	\N	Address	zh-CN	82
248	2025-02-21 20:49:50.236	2025-02-21 20:49:50.237	\N	Phone	en-US	83
251	2025-02-21 20:49:50.236	2025-02-21 20:49:50.237	\N	E-mail	en-US	84
243	2025-02-21 20:49:50.236	2025-02-21 20:49:50.237	\N	Description	zh-CN	81
245	2025-02-21 20:49:50.236	2025-02-21 20:49:50.237	\N	Address	en-US	82
249	2025-02-21 20:49:50.236	2025-02-21 20:49:50.237	\N	Phone	zh-CN	83
252	2025-02-21 20:49:50.236	2025-02-21 20:49:50.237	\N	E-mail	zh-CN	84
244	2025-02-21 20:49:50.236	2025-02-21 20:49:50.237	\N	Адрес	ru-RU	82
250	2025-02-21 20:49:50.236	2025-02-21 20:49:50.237	\N	E-mail	ru-RU	84
224	2025-02-21 20:49:50.236	2025-02-21 20:49:50.237	\N	Description	en-US	75
\.


--
-- Data for Name: pages_iblock_fields_records; Type: TABLE DATA; Schema: public; Owner: postgress
--

COPY public.pages_iblock_fields_records (id, "createdAt", "updatedAt", "deletedAt") FROM stdin;
\.


--
-- Data for Name: pages_iblock_records; Type: TABLE DATA; Schema: public; Owner: postgress
--

COPY public.pages_iblock_records (id, "createdAt", "updatedAt", "deletedAt", "iblockId", sort) FROM stdin;
1	2025-02-06 20:11:07.928	2025-02-06 20:11:07.928	\N	1	0
2	2025-02-07 20:05:15.353	2025-02-07 20:05:15.353	\N	2	0
3	2025-02-07 20:05:15.353	2025-02-07 20:05:15.353	\N	2	1
4	2025-02-07 21:43:47.097	2025-02-08 08:21:59.294193	\N	2	2
5	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	2	3
6	2025-02-07 21:43:47.097	2025-02-08 08:25:15.847266	\N	2	4
7	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	3	0
8	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	3	0
9	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	4	0
10	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	5	0
11	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	6	0
12	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	6	1
13	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	6	3
14	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	7	0
15	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	8	0
16	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	8	1
17	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	8	2
18	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	8	3
19	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	8	4
20	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	8	5
21	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	9	0
22	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	9	1
23	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	9	0
24	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	9	0
25	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	10	0
27	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	10	2
26	2025-02-07 21:43:47.097	2025-02-08 10:02:46.321104	\N	10	1
28	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	10	3
29	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	11	0
30	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	12	0
31	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	13	0
32	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	14	0
33	2025-02-07 21:43:47.097	2025-02-08 10:23:18.118826	\N	14	1
34	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	14	2
35	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	14	3
36	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	14	4
37	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	15	0
38	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	15	1
39	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	15	3
40	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	16	0
41	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	17	0
42	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	17	1
46	2025-02-18 20:04:44.607	2025-02-18 20:40:49.989304	2025-02-18 20:40:49.989304	16	1
45	2025-02-18 20:04:44.607	2025-02-18 20:40:52.931314	2025-02-18 20:40:52.931314	16	1
44	2025-02-18 20:04:44.607	2025-02-18 20:40:55.830193	2025-02-18 20:40:55.830193	16	0
43	2025-02-18 20:04:44.607	2025-02-18 20:41:03.574554	\N	16	1
47	2025-02-18 20:41:43.531	2025-02-18 20:42:17.209564	2025-02-18 20:42:17.209564	16	1
48	2025-02-18 20:42:13.262	2025-02-18 20:42:13.262	\N	16	2
49	2025-02-18 20:42:13.262	2025-02-18 20:42:13.262	\N	16	3
50	2025-02-21 19:46:23.824	2025-02-21 19:46:23.824	\N	18	0
51	2025-02-21 20:49:50.236	2025-02-21 20:49:50.237	\N	19	0
52	2025-02-21 20:49:50.236	2025-02-21 20:49:50.237	\N	21	0
53	2025-02-21 20:49:50.236	2025-02-21 20:49:50.237	\N	22	0
54	2025-02-22 15:40:16.305	2025-02-22 15:40:16.305	\N	20	0
55	2025-02-24 08:07:25.591	2025-02-24 08:07:25.592	\N	23	0
56	2025-02-24 08:07:25.591	2025-02-24 08:07:25.592	\N	24	0
\.


--
-- Data for Name: pages_iblock_records_field; Type: TABLE DATA; Schema: public; Owner: postgress
--

COPY public.pages_iblock_records_field (id, "createdAt", "updatedAt", "deletedAt", "recordId", "fieldId") FROM stdin;
1	2025-02-06 20:11:07.928	2025-02-06 20:11:07.928	\N	1	1
2	2025-02-06 20:11:07.928	2025-02-06 20:11:07.928	\N	1	2
3	2025-02-07 20:05:15.353	2025-02-07 20:05:15.353	\N	2	3
4	2025-02-07 20:05:15.353	2025-02-07 20:05:15.353	\N	2	4
5	2025-02-07 20:05:15.353	2025-02-07 20:05:15.353	\N	2	5
6	2025-02-07 20:05:15.353	2025-02-07 20:05:15.353	\N	3	3
7	2025-02-07 20:05:15.353	2025-02-07 20:05:15.353	\N	3	4
8	2025-02-07 20:05:15.353	2025-02-07 20:05:15.353	\N	3	5
9	2025-02-07 21:39:35.328	2025-02-07 21:39:35.328	\N	3	6
10	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	2	6
11	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	4	3
12	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	4	4
13	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	4	5
14	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	4	6
15	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	5	3
16	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	5	4
17	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	5	5
18	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	5	6
19	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	6	3
20	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	6	4
21	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	6	5
22	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	6	6
23	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	7	7
24	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	7	8
25	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	8	7
26	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	8	8
27	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	9	9
28	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	9	10
29	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	9	11
30	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	9	12
31	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	10	13
32	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	10	14
33	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	10	15
34	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	10	16
35	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	10	17
36	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	11	18
37	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	11	19
38	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	11	20
39	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	11	21
40	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	12	18
41	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	12	19
42	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	12	20
43	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	12	21
44	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	13	18
45	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	13	19
46	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	13	20
47	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	13	21
48	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	14	22
49	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	14	23
50	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	14	24
51	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	14	25
52	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	14	26
53	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	15	27
54	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	15	28
55	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	16	27
56	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	16	28
57	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	17	27
58	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	17	28
59	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	18	27
60	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	18	28
61	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	19	27
62	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	19	28
63	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	20	27
64	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	20	28
65	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	21	29
66	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	21	30
67	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	21	31
68	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	21	32
69	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	22	29
70	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	22	30
71	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	22	31
72	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	22	32
73	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	23	29
74	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	23	30
75	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	23	31
76	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	23	32
77	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	24	29
78	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	24	30
79	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	24	31
80	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	24	32
81	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	25	33
82	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	25	34
83	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	25	35
84	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	25	36
85	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	25	37
86	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	25	38
87	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	25	39
88	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	25	40
89	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	25	41
90	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	25	42
91	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	26	33
92	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	26	34
93	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	26	35
94	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	26	36
95	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	26	37
96	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	26	38
97	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	26	39
98	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	26	40
99	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	26	41
100	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	26	42
101	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	27	33
102	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	27	34
103	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	27	35
104	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	27	36
105	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	27	37
106	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	27	38
107	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	27	39
108	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	27	40
109	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	27	41
110	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	27	42
111	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	28	33
112	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	28	34
113	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	28	35
114	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	28	36
115	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	28	37
116	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	28	38
117	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	28	39
118	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	28	40
119	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	28	41
120	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	28	42
121	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	29	43
122	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	29	44
123	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	29	45
124	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	29	46
125	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	29	47
126	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	29	48
127	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	30	49
128	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	30	50
129	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	30	51
130	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	30	52
131	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	30	53
132	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	31	54
133	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	31	55
134	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	32	56
135	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	32	57
136	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	33	56
137	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	33	57
138	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	34	56
139	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	34	57
140	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	35	56
141	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	35	57
142	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	36	56
143	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	36	57
144	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	37	58
145	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	37	59
146	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	37	60
147	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	37	61
148	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	38	58
149	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	38	59
150	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	38	60
151	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	38	61
152	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	39	58
153	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	39	59
154	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	39	60
155	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	39	61
156	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	40	62
157	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	40	63
158	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	40	64
159	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	40	65
160	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	41	66
161	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	41	67
162	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	41	68
163	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	41	69
164	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	41	70
165	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	42	66
166	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	42	67
167	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	42	68
168	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	42	69
169	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	42	70
170	2025-02-18 20:04:44.607	2025-02-18 20:04:44.607	\N	43	62
171	2025-02-18 20:04:44.607	2025-02-18 20:04:44.607	\N	43	63
172	2025-02-18 20:04:44.607	2025-02-18 20:04:44.607	\N	43	64
173	2025-02-18 20:04:44.607	2025-02-18 20:04:44.607	\N	43	65
174	2025-02-18 20:04:44.607	2025-02-18 20:04:44.607	\N	43	71
175	2025-02-18 20:04:44.607	2025-02-18 20:04:44.607	\N	44	62
176	2025-02-18 20:04:44.607	2025-02-18 20:04:44.607	\N	44	63
177	2025-02-18 20:04:44.607	2025-02-18 20:04:44.607	\N	44	64
178	2025-02-18 20:04:44.607	2025-02-18 20:04:44.607	\N	44	65
179	2025-02-18 20:04:44.607	2025-02-18 20:04:44.607	\N	44	71
180	2025-02-18 20:04:44.607	2025-02-18 20:04:44.607	\N	45	62
181	2025-02-18 20:04:44.607	2025-02-18 20:04:44.607	\N	45	63
182	2025-02-18 20:04:44.607	2025-02-18 20:04:44.607	\N	45	64
183	2025-02-18 20:04:44.607	2025-02-18 20:04:44.607	\N	45	65
184	2025-02-18 20:04:44.607	2025-02-18 20:04:44.607	\N	45	71
185	2025-02-18 20:04:44.607	2025-02-18 20:04:44.607	\N	46	62
186	2025-02-18 20:04:44.607	2025-02-18 20:04:44.607	\N	46	63
187	2025-02-18 20:04:44.607	2025-02-18 20:04:44.607	\N	46	64
188	2025-02-18 20:04:44.607	2025-02-18 20:04:44.607	\N	46	65
189	2025-02-18 20:04:44.607	2025-02-18 20:04:44.607	\N	46	71
190	2025-02-18 20:41:43.531	2025-02-18 20:41:43.531	\N	47	62
191	2025-02-18 20:41:43.531	2025-02-18 20:41:43.531	\N	47	63
192	2025-02-18 20:41:43.531	2025-02-18 20:41:43.531	\N	47	64
193	2025-02-18 20:41:43.531	2025-02-18 20:41:43.531	\N	47	65
194	2025-02-18 20:41:43.531	2025-02-18 20:41:43.531	\N	47	71
195	2025-02-18 20:42:13.262	2025-02-18 20:42:13.262	\N	48	62
196	2025-02-18 20:42:13.262	2025-02-18 20:42:13.262	\N	48	63
197	2025-02-18 20:42:13.262	2025-02-18 20:42:13.262	\N	48	64
198	2025-02-18 20:42:13.262	2025-02-18 20:42:13.262	\N	48	65
199	2025-02-18 20:42:13.262	2025-02-18 20:42:13.262	\N	48	71
200	2025-02-18 20:42:13.262	2025-02-18 20:42:13.262	\N	40	71
201	2025-02-18 20:42:13.262	2025-02-18 20:42:13.262	\N	49	62
202	2025-02-18 20:42:13.262	2025-02-18 20:42:13.262	\N	49	63
203	2025-02-18 20:42:13.262	2025-02-18 20:42:13.262	\N	49	64
204	2025-02-18 20:42:13.262	2025-02-18 20:42:13.262	\N	49	65
205	2025-02-18 20:42:13.262	2025-02-18 20:42:13.262	\N	49	71
206	2025-02-21 19:46:23.824	2025-02-21 19:46:23.824	\N	50	72
207	2025-02-21 19:46:23.824	2025-02-21 19:46:23.824	\N	50	73
208	2025-02-21 20:49:50.236	2025-02-21 20:49:50.237	\N	51	74
209	2025-02-21 20:49:50.236	2025-02-21 20:49:50.237	\N	51	75
210	2025-02-21 20:49:50.236	2025-02-21 20:49:50.237	\N	52	78
211	2025-02-21 20:49:50.236	2025-02-21 20:49:50.237	\N	52	79
212	2025-02-21 20:49:50.236	2025-02-21 20:49:50.237	\N	53	80
213	2025-02-21 20:49:50.236	2025-02-21 20:49:50.237	\N	53	81
214	2025-02-21 20:49:50.236	2025-02-21 20:49:50.237	\N	53	82
215	2025-02-21 20:49:50.236	2025-02-21 20:49:50.237	\N	53	83
216	2025-02-21 20:49:50.236	2025-02-21 20:49:50.237	\N	53	84
217	2025-02-22 15:40:16.305	2025-02-22 15:40:16.305	\N	54	76
218	2025-02-22 15:40:16.305	2025-02-22 15:40:16.305	\N	54	77
219	2025-02-24 08:07:25.591	2025-02-24 08:07:25.592	\N	55	85
220	2025-02-24 08:07:25.591	2025-02-24 08:07:25.592	\N	55	86
221	2025-02-24 08:07:25.591	2025-02-24 08:07:25.592	\N	55	87
222	2025-02-24 08:07:25.591	2025-02-24 08:07:25.592	\N	56	88
223	2025-02-24 08:07:25.591	2025-02-24 08:07:25.592	\N	56	89
224	2025-02-24 08:07:25.591	2025-02-24 08:07:25.592	\N	56	90
\.


--
-- Data for Name: pages_iblock_records_field_value; Type: TABLE DATA; Schema: public; Owner: postgress
--

COPY public.pages_iblock_records_field_value (id, "createdAt", "updatedAt", "deletedAt", "recordFieldId", lang, value) FROM stdin;
1	2025-02-06 20:11:07.928	2025-02-06 20:11:07.928	\N	1	ru-RU	1. Комплексные решения
2	2025-02-06 20:11:07.928	2025-02-06 20:11:07.928	\N	1	en-US	1. Comprehensive Solutions
3	2025-02-06 20:11:07.928	2025-02-06 20:11:07.928	\N	1	zh-CN	1. 全面解决方案
4	2025-02-06 20:11:07.928	2025-02-06 20:11:07.928	\N	2	ru-RU	Мы предлагаем полный спектр услуг — от разработки концепции до запуска и обслуживания оборудования.
5	2025-02-06 20:11:07.928	2025-02-06 20:11:07.928	\N	2	en-US	We offer a full range of services—from concept development to equipment launch and maintenance.
6	2025-02-06 20:11:07.928	2025-02-06 20:11:07.928	\N	2	zh-CN	我们提供从概念设计到设备启动与维护的全套服务。
7	2025-02-07 20:05:15.353	2025-02-07 20:05:15.353	\N	3	ru-RU	Дорожное оборудование
8	2025-02-07 20:05:15.353	2025-02-07 20:05:15.353	\N	3	en-US	Road equipment
9	2025-02-07 20:05:15.353	2025-02-07 20:05:15.353	\N	3	zh-CN	道路设备
10	2025-02-07 20:05:15.353	2025-02-07 20:05:15.353	\N	4	ru-RU	Асфальтовые заводы;Дорожные катки;Фрезы
11	2025-02-07 20:05:15.353	2025-02-07 20:05:15.353	\N	4	en-US	Asphalt plants;Road rinks;Milling cutters
12	2025-02-07 20:05:15.353	2025-02-07 20:05:15.353	\N	4	zh-CN	沥青厂;道路溜冰场;铣刀/铣刀
13	2025-02-07 20:05:15.353	2025-02-07 20:35:24.918348	\N	5	ru-RU	/home
14	2025-02-07 20:05:15.353	2025-02-07 20:35:24.92518	\N	5	en-US	/home
15	2025-02-07 20:05:15.353	2025-02-07 20:35:24.927349	\N	5	zh-CN	/home
16	2025-02-07 20:05:15.353	2025-02-07 20:05:15.353	\N	6	ru-RU	Металлургическое оборудование
17	2025-02-07 20:05:15.353	2025-02-07 20:05:15.353	\N	6	en-US	Metallurgical equipment
18	2025-02-07 20:05:15.353	2025-02-07 20:05:15.353	\N	6	zh-CN	冶金设备
19	2025-02-07 20:05:15.353	2025-02-07 20:05:15.353	\N	7	ru-RU	Плавильные печи;Прокатные станы;Обрабатывающие центры
20	2025-02-07 20:05:15.353	2025-02-07 20:05:15.353	\N	7	en-US	Melting furnaces;Rolling mills;Processing centers
21	2025-02-07 20:05:15.353	2025-02-07 20:05:15.353	\N	7	zh-CN	熔炼炉;轧机;加工中心
22	2025-02-07 20:05:15.353	2025-02-07 20:05:15.353	\N	8	ru-RU	/
23	2025-02-07 20:05:15.353	2025-02-07 20:05:15.353	\N	8	en-US	/
24	2025-02-07 20:05:15.353	2025-02-07 20:05:15.353	\N	8	zh-CN	/
25	2025-02-07 21:39:35.328	2025-02-08 08:10:09.314806	\N	9	ru-RU	{"path":"http://localhost:9000/cms/fee30b83dabf20a4de8bd54ed7b681eb.png","type":"images","name":"direction-sllide3.png","filename":"fee30b83dabf20a4de8bd54ed7b681eb.png","size":572060,"deletedAt":null,"id":19,"createdAt":"2025-02-07T21:43:47.097Z","updatedAt":"2025-02-07T21:43:47.097Z","isSystem":false}
26	2025-02-07 21:39:35.328	2025-02-08 08:10:09.320278	\N	9	en-US	{"path":"http://localhost:9000/cms/fee30b83dabf20a4de8bd54ed7b681eb.png","type":"images","name":"direction-sllide3.png","filename":"fee30b83dabf20a4de8bd54ed7b681eb.png","size":572060,"deletedAt":null,"id":19,"createdAt":"2025-02-07T21:43:47.097Z","updatedAt":"2025-02-07T21:43:47.097Z","isSystem":false}
27	2025-02-07 21:39:35.328	2025-02-08 08:10:09.323309	\N	9	zh-CN	{"path":"http://localhost:9000/cms/fee30b83dabf20a4de8bd54ed7b681eb.png","type":"images","name":"direction-sllide3.png","filename":"fee30b83dabf20a4de8bd54ed7b681eb.png","size":572060,"deletedAt":null,"id":19,"createdAt":"2025-02-07T21:43:47.097Z","updatedAt":"2025-02-07T21:43:47.097Z","isSystem":false}
31	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	11	ru-RU	Горнодобывающее оборудование
32	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	11	en-US	Mining equipment
33	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	11	zh-CN	采矿设备
34	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	12	ru-RU	Дробильные установки;Конвейерные системы;Обогатительное оборудование
35	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	12	en-US	Crushing plants;Conveyor systems;Processing equipment
36	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	12	zh-CN	破碎设备;输送系统;加工设备
37	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	13	ru-RU	/
38	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	13	en-US	/
39	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	13	zh-CN	/
42	2025-02-07 21:43:47.097	2025-02-08 08:21:59.301595	\N	14	zh-CN	{"path":"http://localhost:9000/cms/0f7d9c2df4ab36205a8549da11643e97.png","type":"images","name":"direction-sllide4.png","filename":"0f7d9c2df4ab36205a8549da11643e97.png","size":383186,"deletedAt":null,"id":20,"createdAt":"2025-02-07T21:43:47.097Z","updatedAt":"2025-02-07T21:43:47.097Z","isSystem":false}
43	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	15	ru-RU	Пищевое оборудование
44	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	15	en-US	Food processing equipment
28	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	10	ru-RU	{"path":"http://localhost:9000/cms/184c4dd28c52993c0f575905f9107138.png","type":"images","name":"direction-sllide1.png","filename":"184c4dd28c52993c0f575905f9107138.png","size":477111,"deletedAt":null,"id":17,"createdAt":"2025-02-07T21:43:47.097Z","updatedAt":"2025-02-07T21:43:47.097Z","isSystem":false}
29	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	10	en-US	{"path":"http://localhost:9000/cms/184c4dd28c52993c0f575905f9107138.png","type":"images","name":"direction-sllide1.png","filename":"184c4dd28c52993c0f575905f9107138.png","size":477111,"deletedAt":null,"id":17,"createdAt":"2025-02-07T21:43:47.097Z","updatedAt":"2025-02-07T21:43:47.097Z","isSystem":false}
30	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	10	zh-CN	{"path":"http://localhost:9000/cms/184c4dd28c52993c0f575905f9107138.png","type":"images","name":"direction-sllide1.png","filename":"184c4dd28c52993c0f575905f9107138.png","size":477111,"deletedAt":null,"id":17,"createdAt":"2025-02-07T21:43:47.097Z","updatedAt":"2025-02-07T21:43:47.097Z","isSystem":false}
40	2025-02-07 21:43:47.097	2025-02-08 08:21:59.297339	\N	14	ru-RU	{"path":"http://localhost:9000/cms/0f7d9c2df4ab36205a8549da11643e97.png","type":"images","name":"direction-sllide4.png","filename":"0f7d9c2df4ab36205a8549da11643e97.png","size":383186,"deletedAt":null,"id":20,"createdAt":"2025-02-07T21:43:47.097Z","updatedAt":"2025-02-07T21:43:47.097Z","isSystem":false}
41	2025-02-07 21:43:47.097	2025-02-08 08:21:59.299562	\N	14	en-US	{"path":"http://localhost:9000/cms/0f7d9c2df4ab36205a8549da11643e97.png","type":"images","name":"direction-sllide4.png","filename":"0f7d9c2df4ab36205a8549da11643e97.png","size":383186,"deletedAt":null,"id":20,"createdAt":"2025-02-07T21:43:47.097Z","updatedAt":"2025-02-07T21:43:47.097Z","isSystem":false}
45	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	15	zh-CN	食品加工设备
46	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	16	ru-RU	Линии для производства пищевых продуктов;Упаковочные машины
47	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	16	en-US	Food production lines;Packaging machines
48	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	16	zh-CN	食品生产线;包装机
49	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	17	ru-RU	/
50	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	17	en-US	/
51	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	17	zh-CN	/
268	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	90	ru-RU	Шанхай (Главный офис)
269	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	90	zh-CN	上海（总部）
270	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	90	en-US	Shanghai (Main Office)
358	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	120	ru-RU	Благовещенск
52	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	18	ru-RU	{"path":"http://localhost:9000/cms/1c0b7cdd15533106c4b5af3f70b9e8c9.png","type":"images","name":"direction-sllide5.png","filename":"1c0b7cdd15533106c4b5af3f70b9e8c9.png","size":483775,"deletedAt":null,"id":21,"createdAt":"2025-02-07T21:43:47.097Z","updatedAt":"2025-02-07T21:43:47.097Z","isSystem":false}
53	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	18	en-US	{"path":"http://localhost:9000/cms/1c0b7cdd15533106c4b5af3f70b9e8c9.png","type":"images","name":"direction-sllide5.png","filename":"1c0b7cdd15533106c4b5af3f70b9e8c9.png","size":483775,"deletedAt":null,"id":21,"createdAt":"2025-02-07T21:43:47.097Z","updatedAt":"2025-02-07T21:43:47.097Z","isSystem":false}
54	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	18	zh-CN	{"path":"http://localhost:9000/cms/1c0b7cdd15533106c4b5af3f70b9e8c9.png","type":"images","name":"direction-sllide5.png","filename":"1c0b7cdd15533106c4b5af3f70b9e8c9.png","size":483775,"deletedAt":null,"id":21,"createdAt":"2025-02-07T21:43:47.097Z","updatedAt":"2025-02-07T21:43:47.097Z","isSystem":false}
55	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	19	ru-RU	Строительное оборудование
56	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	19	en-US	Construction Equipment
57	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	19	zh-CN	建筑设备
58	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	20	ru-RU	Бетонные заводы;Смесительные системы;Бетоносмесители
59	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	20	en-US	Concrete Plants;Mixing Systems;Concrete Mixers
60	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	20	zh-CN	混凝土搅拌站;混合系统;混凝土搅拌机
61	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	21	ru-RU	/
62	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	21	en-US	/
63	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	21	zh-CN	/
64	2025-02-07 21:43:47.097	2025-02-08 08:25:15.850283	\N	22	ru-RU	{"path":"http://localhost:9000/cms/5f444d616b1246ff642347834993248c.png","type":"images","name":"direction-sllide1 (1).png","filename":"5f444d616b1246ff642347834993248c.png","size":477111,"deletedAt":null,"id":22,"createdAt":"2025-02-07T21:43:47.097Z","updatedAt":"2025-02-07T21:43:47.097Z","isSystem":false}
65	2025-02-07 21:43:47.097	2025-02-08 08:25:15.856125	\N	22	en-US	{"path":"http://localhost:9000/cms/5f444d616b1246ff642347834993248c.png","type":"images","name":"direction-sllide1 (1).png","filename":"5f444d616b1246ff642347834993248c.png","size":477111,"deletedAt":null,"id":22,"createdAt":"2025-02-07T21:43:47.097Z","updatedAt":"2025-02-07T21:43:47.097Z","isSystem":false}
66	2025-02-07 21:43:47.097	2025-02-08 08:25:15.858773	\N	22	zh-CN	{"path":"http://localhost:9000/cms/5f444d616b1246ff642347834993248c.png","type":"images","name":"direction-sllide1 (1).png","filename":"5f444d616b1246ff642347834993248c.png","size":477111,"deletedAt":null,"id":22,"createdAt":"2025-02-07T21:43:47.097Z","updatedAt":"2025-02-07T21:43:47.097Z","isSystem":false}
67	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	23	ru-RU	Создание бартерной биржи
68	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	23	en-US	Creation of a Barter Exchange
69	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	23	zh-CN	建立易货交易平台
70	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	24	ru-RU	Совместно с ведущими компаниями мы инвестировали в создание инновационной бартерной биржи, которая позволит предприятиям эффективно обмениваться товарами и услугами.
71	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	24	en-US	Together with leading companies, we have invested in developing an innovative barter exchange, enabling businesses to efficiently trade goods and services.
72	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	24	zh-CN	与领先企业合作，我们投资开发创新的易货交易平台，使企业能够高效交换商品与服务。
73	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	25	ru-RU	Строительство завода роботов-манипуляторов в России
74	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	25	en-US	Construction of a Robot Manipulator Factory in Russia
75	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	25	zh-CN	在俄罗斯建设机器人手臂工厂
76	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	26	ru-RU	Мы начинаем строительство завода по производству роботизированных рук в России, стремясь к полной локализации производства к 2028 году и развитию промышленного потенциала региона.
77	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	26	en-US	We are launching the construction of a factory for robotic arms in Russia, aiming for full production localization by 2028 and contributing to the region's industrial potential.
78	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	26	zh-CN	我们正在启动机器人手臂制造厂的建设，目标是在2028年实现生产的全面本地化，并推动该地区的工业潜力发展。
79	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	27	ru-RU	SA International
80	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	27	zh-CN	SA International
81	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	27	en-US	SA International
82	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	28	ru-RU	— Ваш проводник в мире инновационных промышленных решений
83	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	28	zh-CN	-您的创新工业解决方案引导者
84	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	28	en-US	— Your Guide to Innovative Industrial Solutions
85	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	29	ru-RU	+86-21-5432-2755
86	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	29	en-US	+86-21-5432-2755
87	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	29	zh-CN	+86-21-5432-2755
88	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	30	ru-RU	info@inter-sa.com
89	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	30	en-US	info@inter-sa.com
90	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	30	zh-CN	info@inter-sa.com
91	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	31	ru-RU	Директор по продажам
92	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	31	zh-CN	销售总监
93	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	31	en-US	Sales Director
94	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	32	ru-RU	Шанхай, Китай
95	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	32	en-US	Shanghai, China
96	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	32	zh-CN	中国上海
97	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	33	ru-RU	 - Навыки стратегического мышления и лидерства; - Опыт работы на руководящей позиции в продажах не менее 5 лет; - Высшее образование в области маркетинга, экономики или управления; - Знание английского и/или китайского языков на высоком уровне
98	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	33	en-US	- Strategic thinking and leadership skills;- At least 5 years of experience in a sales management position;- Higher education in marketing, economics or management;- High level knowledge of English and/or Chinese languages
99	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	33	zh-CN	-战略思维和领导能力;-5年以上销售管理工作经验;-市场营销，经济或管理的高等教育;-高水平的英语和/或中文知识
603	2025-02-18 20:04:44.607	2025-02-18 20:04:44.607	\N	189	zh-CN	电话
100	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	34	ru-RU	 - Разработка и реализация стратегии продаж; - Управление командой менеджеров по продажам; - Установление и поддержание отношений с ключевыми клиентами; - Анализ рынка и поиск новых возможностей для развития бизнеса
101	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	34	en-US	- Development and implementation of a sales strategy;- Managing a team of sales managers;- Establishing and maintaining relationships with key clients;- Market analysis and search for new business development opportunities
102	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	34	zh-CN	-制定和实施销售策略;-管理销售经理团队;-与主要客户建立及维持关系;-市场分析及寻找新的业务发展机会
103	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	35	ru-RU	 - Конкурентоспособная заработная плата; - Бонусы по результатам работы; - Социальный пакет и медицинская страховка; - Возможности для профессионального роста
104	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	35	zh-CN	-有竞争力的薪酬;-基于工作成果的奖金;-社会福利及医疗保险;-专业成长的机会
105	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	35	en-US	- Competitive salary;- Bonuses based on work results;- Social package and medical insurance;- Opportunities for professional growth
106	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	36	ru-RU	Марина Смирнова 
107	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	36	en-US	Marina Smirnova
108	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	36	zh-CN	玛丽娜*斯米尔诺娃
109	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	37	en-US	Account Manager
110	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	37	ru-RU	Менеджер по работе с клиентами
111	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	37	zh-CN	客户经理
112	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	38	ru-RU	Когда я присоединилась к SA International два года назад, я и не предполагала, насколько быстро смогу вырасти профессионально. Компания предоставляет все возможности для обучения и развития. Я работаю с клиентами из разных стран, что позволяет постоянно расширять свой кругозор и приобретать новый опыт.
113	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	38	en-US	When I joined SA International two years ago, I had no idea how quickly I would be able to grow professionally. The company provides all the opportunities for training and development. I work with clients from different countries, which allows me to constantly expand my horizons and gain new experience.
114	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	38	zh-CN	当我两年前加入SA International时，我不知道我能以多快的速度专业成长。 公司提供所有培训和发展的机会。 我与来自不同国家的客户合作，这使我能够不断拓展视野并获得新的经验。
115	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	39	ru-RU	{"path":"http://localhost:9000/cms/e9328a420e4b6e837068792ae736ee4e.png","type":"images","name":"employee1.png","filename":"e9328a420e4b6e837068792ae736ee4e.png","size":311628,"deletedAt":null,"id":23,"createdAt":"2025-02-07T21:43:47.097Z","updatedAt":"2025-02-07T21:43:47.097Z","isSystem":false}
116	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	39	en-US	{"path":"http://localhost:9000/cms/e9328a420e4b6e837068792ae736ee4e.png","type":"images","name":"employee1.png","filename":"e9328a420e4b6e837068792ae736ee4e.png","size":311628,"deletedAt":null,"id":23,"createdAt":"2025-02-07T21:43:47.097Z","updatedAt":"2025-02-07T21:43:47.097Z","isSystem":false}
117	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	39	zh-CN	{"path":"http://localhost:9000/cms/e9328a420e4b6e837068792ae736ee4e.png","type":"images","name":"employee1.png","filename":"e9328a420e4b6e837068792ae736ee4e.png","size":311628,"deletedAt":null,"id":23,"createdAt":"2025-02-07T21:43:47.097Z","updatedAt":"2025-02-07T21:43:47.097Z","isSystem":false}
118	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	40	ru-RU	Иван Ковалев
119	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	40	en-US	Ivan Kovalev
120	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	40	zh-CN	伊万*科瓦廖夫
121	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	41	en-US	Automation Engineer
122	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	41	ru-RU	Инженер по автоматизации
123	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	41	zh-CN	自动化工程师
124	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	42	ru-RU	Работа в SA International — это постоянный вызов и возможность участвовать в передовых проектах. Особенно интересно было работать над проектом по внедрению искусственного интеллекта в производственные процессы. Команда профессионалов и поддержка руководства делают работу здесь по-настоящему увлекательной.
125	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	42	en-US	Working at SA International is a constant challenge and an opportunity to participate in cutting—edge projects. It was especially interesting to work on a project to introduce artificial intelligence into production processes. The professional team and management support make the work here really exciting.
126	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	42	zh-CN	在SA International工作是一个持续的挑战，也是参与尖端项目的机会。 参与一个将人工智能引入生产过程的项目尤其有趣。 专业的团队和管理支持使这里的工作非常令人兴奋。
127	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	43	ru-RU	{"path":"http://localhost:9000/cms/1f326340add2ab34f6d84fc374f2349f.png","type":"images","name":"employee2.png","filename":"1f326340add2ab34f6d84fc374f2349f.png","size":331924,"deletedAt":null,"id":24,"createdAt":"2025-02-07T21:43:47.097Z","updatedAt":"2025-02-07T21:43:47.097Z","isSystem":false}
128	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	43	en-US	{"path":"http://localhost:9000/cms/1f326340add2ab34f6d84fc374f2349f.png","type":"images","name":"employee2.png","filename":"1f326340add2ab34f6d84fc374f2349f.png","size":331924,"deletedAt":null,"id":24,"createdAt":"2025-02-07T21:43:47.097Z","updatedAt":"2025-02-07T21:43:47.097Z","isSystem":false}
129	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	43	zh-CN	{"path":"http://localhost:9000/cms/1f326340add2ab34f6d84fc374f2349f.png","type":"images","name":"employee2.png","filename":"1f326340add2ab34f6d84fc374f2349f.png","size":331924,"deletedAt":null,"id":24,"createdAt":"2025-02-07T21:43:47.097Z","updatedAt":"2025-02-07T21:43:47.097Z","isSystem":false}
130	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	44	ru-RU	Лю Чэнь
131	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	44	en-US	Liu Chen
132	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	44	zh-CN	刘晨
133	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	45	en-US	Logistics Specialist
134	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	45	ru-RU	Специалист по логистике
135	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	45	zh-CN	物流专家
356	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	119	en-US	Monday – Friday: 9:00 – 18:00 Saturday: 10:00 – 16:00 Sunday: closed
136	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	46	ru-RU	SA International дала мне возможность реализовать себя в международной логистике. Здесь ценят инициативу и стремление к совершенству. Я горжусь тем, что являюсь частью компании, которая активно развивается и покоряет новые рынки.
137	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	46	en-US	SA International gave me the opportunity to realize myself in international logistics. Initiative and striving for excellence are appreciated here. I am proud to be a part of a company that is actively developing and conquering new markets.
138	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	46	zh-CN	SA International让我有机会在国际物流中实现自己。 这里赞赏主动性和追求卓越. 我很自豪能成为一家积极开发和征服新市场的公司的一员。
139	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	47	ru-RU	{"path":"http://localhost:9000/cms/33087b1bfaf3c4f22d15884a7603d16a.png","type":"images","name":"employee3.png","filename":"33087b1bfaf3c4f22d15884a7603d16a.png","size":293021,"deletedAt":null,"id":25,"createdAt":"2025-02-07T21:43:47.097Z","updatedAt":"2025-02-07T21:43:47.097Z","isSystem":false}
140	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	47	en-US	{"path":"http://localhost:9000/cms/33087b1bfaf3c4f22d15884a7603d16a.png","type":"images","name":"employee3.png","filename":"33087b1bfaf3c4f22d15884a7603d16a.png","size":293021,"deletedAt":null,"id":25,"createdAt":"2025-02-07T21:43:47.097Z","updatedAt":"2025-02-07T21:43:47.097Z","isSystem":false}
141	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	47	zh-CN	{"path":"http://localhost:9000/cms/33087b1bfaf3c4f22d15884a7603d16a.png","type":"images","name":"employee3.png","filename":"33087b1bfaf3c4f22d15884a7603d16a.png","size":293021,"deletedAt":null,"id":25,"createdAt":"2025-02-07T21:43:47.097Z","updatedAt":"2025-02-07T21:43:47.097Z","isSystem":false}
142	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	48	ru-RU	Контактная информация отдела кадров
143	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	48	zh-CN	人力资源部联系信息
144	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	48	en-US	HR DEPARTMENT CONTACT INFORMATION
145	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	49	ru-RU	+86-21-5432-2755
146	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	49	en-US	+86-21-5432-2755
147	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	49	zh-CN	+86-21-5432-2755
148	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	50	ru-RU	hr@inter-sa.com
149	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	50	en-US	hr@inter-sa.com
150	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	50	zh-CN	hr@inter-sa.com
151	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	51	ru-RU	Китай, г. Шанхай, район Миньхан, улица Синьцзюньхуань, дом 115, корпус 1, офисы 503-505
152	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	51	en-US	China, Shanghai, Minhang District, 115 Xinjunhuan Street, Building 1, offices 503-505
153	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	51	zh-CN	中国上海市闵行区新俊环街115号1楼503-505办公室
154	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	52	en-US	812
155	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	52	ru-RU	812
156	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	52	zh-CN	812
157	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	53	ru-RU	Как сделать заказ?
158	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	53	zh-CN	如何下订单？
159	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	53	en-US	How do I place an order?
160	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	54	ru-RU	Вы можете оформить заказ, связавшись с нашим отделом продаж по телефону +86-21-5432-2755 (ext. 813) или отправив запрос на sales@inter-sa.com
161	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	54	en-US	You can place an order by contacting our sales department at +86-21-5432-2755 (ext. 813) or by sending a request to sales@inter-sa.com
162	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	54	zh-CN	您可以致电+86-21-5432-2755（分机）与我们的销售部联系。 813)或通过向sales@inter-sa.com
163	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	55	ru-RU	Какие способы оплаты доступны?
164	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	55	zh-CN	有哪些付款方式？
165	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	55	en-US	What payment methods are available?
166	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	56	ru-RU	Вы можете оформить заказ, связавшись с нашим отделом продаж по телефону +86-21-5432-2755 (ext. 813) или отправив запрос на sales@inter-sa.com
167	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	56	en-US	You can place an order by contacting our sales department at +86-21-5432-2755 (ext. 813) or by sending a request to sales@inter-sa.com
168	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	56	zh-CN	您可以致电+86-21-5432-2755（分机）与我们的销售部联系。 813)或通过向sales@inter-sa.com
169	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	57	ru-RU	Какова средняя продолжительность доставки?
170	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	57	zh-CN	平均交货时间是多少?
171	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	57	en-US	What is the average delivery time?
172	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	58	ru-RU	Вы можете оформить заказ, связавшись с нашим отделом продаж по телефону +86-21-5432-2755 (ext. 813) или отправив запрос на sales@inter-sa.com
173	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	58	en-US	You can place an order by contacting our sales department at +86-21-5432-2755 (ext. 813) or by sending a request to sales@inter-sa.com
174	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	58	zh-CN	您可以致电+86-21-5432-2755（分机）与我们的销售部联系。 813)或通过向sales@inter-sa.com
175	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	59	ru-RU	Что делать, если оборудование не работает корректно?
176	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	59	zh-CN	如果硬件无法正常工作，我该怎么办？
177	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	59	en-US	What should I do if the hardware is not working correctly?
178	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	60	ru-RU	Вы можете оформить заказ, связавшись с нашим отделом продаж по телефону +86-21-5432-2755 (ext. 813) или отправив запрос на sales@inter-sa.com
179	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	60	en-US	You can place an order by contacting our sales department at +86-21-5432-2755 (ext. 813) or by sending a request to sales@inter-sa.com
180	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	60	zh-CN	您可以致电+86-21-5432-2755（分机）与我们的销售部联系。 813)或通过向sales@inter-sa.com
181	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	61	ru-RU	Как заказать запасные части?
182	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	61	zh-CN	如何订购备件？
183	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	61	en-US	How do I order spare parts?
604	2025-02-18 20:41:43.531	2025-02-18 20:41:43.531	\N	190	ru-RU	
605	2025-02-18 20:41:43.531	2025-02-18 20:41:43.531	\N	190	zh-CN	
606	2025-02-18 20:41:43.531	2025-02-18 20:41:43.531	\N	190	en-US	
184	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	62	ru-RU	Вы можете оформить заказ, связавшись с нашим отделом продаж по телефону +86-21-5432-2755 (ext. 813) или отправив запрос на sales@inter-sa.com
185	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	62	en-US	You can place an order by contacting our sales department at +86-21-5432-2755 (ext. 813) or by sending a request to sales@inter-sa.com
186	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	62	zh-CN	您可以致电+86-21-5432-2755（分机）与我们的销售部联系。 813)或通过向sales@inter-sa.com
187	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	63	ru-RU	Предоставляете ли вы услуги по установке и наладке оборудования?
188	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	63	zh-CN	你们提供设备安装和调整服务吗?
189	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	63	en-US	Do you provide equipment installation and adjustment services?
190	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	64	ru-RU	Вы можете оформить заказ, связавшись с нашим отделом продаж по телефону +86-21-5432-2755 (ext. 813) или отправив запрос на sales@inter-sa.com
191	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	64	en-US	You can place an order by contacting our sales department at +86-21-5432-2755 (ext. 813) or by sending a request to sales@inter-sa.com
192	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	64	zh-CN	您可以致电+86-21-5432-2755（分机）与我们的销售部联系。 813)或通过向sales@inter-sa.com
193	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	65	ru-RU	Служба поддержки
194	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	65	en-US	Support Service
195	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	65	zh-CN	客户支持服务：
196	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	66	ru-RU	+86-5432-2755
197	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	66	en-US	+86-5432-2755
198	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	66	zh-CN	+86-5432-2755
199	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	67	ru-RU	support@inter-sa.com
200	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	67	en-US	support@inter-sa.com
201	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	67	zh-CN	support@inter-sa.com
202	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	68	ru-RU	
203	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	68	en-US	
204	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	68	zh-CN	
205	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	69	ru-RU	Отдел запасных частей
208	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	70	ru-RU	
209	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	70	en-US	
210	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	70	zh-CN	
211	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	71	ru-RU	parts@inter-sa.com
212	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	71	en-US	parts@inter-sa.com
213	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	71	zh-CN	parts@inter-sa.com
214	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	72	ru-RU	
215	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	72	en-US	
216	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	72	zh-CN	
206	2025-02-07 21:43:47.097	2025-02-08 09:32:43.378314	\N	69	en-US	Spare Parts Department
207	2025-02-07 21:43:47.097	2025-02-08 09:32:43.384906	\N	69	zh-CN	备件部门：
217	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	73	ru-RU	Общие вопросы
218	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	73	en-US	General ibquiries
219	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	73	zh-CN	一般咨询：
220	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	74	ru-RU	
221	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	74	en-US	
222	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	74	zh-CN	
223	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	75	ru-RU	info@inter-sa.com
224	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	75	en-US	info@inter-sa.com
225	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	75	zh-CN	info@inter-sa.com
226	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	76	ru-RU	
227	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	76	en-US	
228	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	76	zh-CN	
229	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	77	ru-RU	Адрес главного офиса
230	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	77	en-US	Main office address
231	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	77	zh-CN	总部地址：
232	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	78	ru-RU	
233	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	78	en-US	
234	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	78	zh-CN	
235	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	79	ru-RU	
236	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	79	en-US	
237	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	79	zh-CN	
238	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	80	ru-RU	Китай, г. Шанхай, район Миньхан, улица Синьцзюньхуань, дом 115, корпус 1, офисы 503-505
239	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	80	en-US	China, Shanghai, Minhang District, 115 Xinjunhuan Street, Building 1, offices 503-505
240	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	80	zh-CN	中国上海市闵行区新俊环街115号1楼503-505办公室
241	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	81	ru-RU	Китай, г. Шанхай, район Миньхан, улица Синьцзюньхуань, дом 115, корпус 1, офисы 503-505
242	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	81	en-US	China, Shanghai, Minhang District, 115 Xinjunhuan Street, Building 1, offices 503-505
243	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	81	zh-CN	中国上海市闵行区新俊环街115号1楼503-505办公室
244	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	82	ru-RU	/
245	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	82	en-US	/
246	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	82	zh-CN	/
247	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	83	ru-RU	+86 (021) 5432 2755
248	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	83	en-US	+86 (021) 5432 2755
249	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	83	zh-CN	+86 (021) 5432 2755
250	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	84	ru-RU	+86 (021) 5432 2755
251	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	84	en-US	+86 (021) 5432 2755
252	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	84	zh-CN	+86 (021) 5432 2755
253	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	85	ru-RU	+86 (021) 5432 2755
254	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	85	en-US	+86 (021) 5432 2755
255	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	85	zh-CN	+86 (021) 5432 2755
256	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	86	ru-RU	info@inter-sa.com
257	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	86	en-US	info@inter-sa.com
258	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	86	zh-CN	info@inter-sa.com
259	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	87	ru-RU	sales@inter-sa.com
260	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	87	en-US	sales@inter-sa.com
261	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	87	zh-CN	sales@inter-sa.com
262	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	88	ru-RU	 support@inter-sa.com
263	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	88	en-US	 support@inter-sa.com
264	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	88	zh-CN	 support@inter-sa.com
357	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	119	zh-CN	星期一至五:9:00-18:00 星期六:10:00-16:00 星期日:休息
271	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	91	ru-RU	Китай, г. Шанхай, район Миньхан, улица Синьцзюньхуань, дом 115, корпус 1, офисы 503-505
272	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	91	en-US	China, Shanghai, Minhang District, 115 Xinjunhuan Street, Building 1, offices 503-505
273	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	91	zh-CN	中国上海市闵行区新俊环街115号1楼503-505办公室
274	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	92	ru-RU	/
275	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	92	en-US	/
276	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	92	zh-CN	/
277	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	93	ru-RU	+86 (021) 5432 2755
278	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	93	en-US	+86 (021) 5432 2755
279	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	93	zh-CN	+86 (021) 5432 2755
280	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	94	ru-RU	+86 (021) 5432 2755
281	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	94	en-US	+86 (021) 5432 2755
282	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	94	zh-CN	+86 (021) 5432 2755
283	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	95	ru-RU	+86 (021) 5432 2755
284	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	95	en-US	+86 (021) 5432 2755
285	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	95	zh-CN	+86 (021) 5432 2755
286	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	96	ru-RU	info@inter-sa.com
287	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	96	en-US	info@inter-sa.com
288	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	96	zh-CN	info@inter-sa.com
289	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	97	ru-RU	sales@inter-sa.com
290	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	97	en-US	sales@inter-sa.com
291	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	97	zh-CN	sales@inter-sa.com
292	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	98	ru-RU	 support@inter-sa.com
293	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	98	en-US	 support@inter-sa.com
294	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	98	zh-CN	 support@inter-sa.com
295	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	99	ru-RU	Понедельник – Пятница: 9:00 – 18:00 Суббота: 10:00 – 16:00 Воскресенье: выходной
296	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	99	en-US	Monday – Friday: 9:00 – 18:00 Saturday: 10:00 – 16:00 Sunday: closed
297	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	99	zh-CN	星期一至五:9:00-18:00 星期六:10:00-16:00 星期日:休息
298	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	100	ru-RU	ИУ
299	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	100	zh-CN	义乌 
300	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	100	en-US	YIWU
301	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	101	ru-RU	Китай, г. Шанхай, район Миньхан, улица Синьцзюньхуань, дом 115, корпус 1, офисы 503-505
302	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	101	en-US	China, Shanghai, Minhang District, 115 Xinjunhuan Street, Building 1, offices 503-505
303	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	101	zh-CN	中国上海市闵行区新俊环街115号1楼503-505办公室
304	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	102	ru-RU	/
305	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	102	en-US	/
306	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	102	zh-CN	/
307	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	103	ru-RU	+86 (021) 5432 2755
308	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	103	en-US	+86 (021) 5432 2755
309	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	103	zh-CN	+86 (021) 5432 2755
310	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	104	ru-RU	+86 (021) 5432 2755
311	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	104	en-US	+86 (021) 5432 2755
312	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	104	zh-CN	+86 (021) 5432 2755
313	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	105	ru-RU	+86 (021) 5432 2755
314	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	105	en-US	+86 (021) 5432 2755
315	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	105	zh-CN	+86 (021) 5432 2755
316	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	106	ru-RU	info@inter-sa.com
317	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	106	en-US	info@inter-sa.com
318	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	106	zh-CN	info@inter-sa.com
319	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	107	ru-RU	sales@inter-sa.com
320	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	107	en-US	sales@inter-sa.com
321	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	107	zh-CN	sales@inter-sa.com
322	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	108	ru-RU	 support@inter-sa.com
323	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	108	en-US	 support@inter-sa.com
324	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	108	zh-CN	 support@inter-sa.com
325	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	109	ru-RU	Понедельник – Пятница: 9:00 – 18:00 Суббота: 10:00 – 16:00 Воскресенье: выходной
326	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	109	en-US	Monday – Friday: 9:00 – 18:00 Saturday: 10:00 – 16:00 Sunday: closed
327	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	109	zh-CN	星期一至五:9:00-18:00 星期六:10:00-16:00 星期日:休息
328	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	110	ru-RU	Гонконг
329	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	110	zh-CN	Hong Kong
330	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	110	en-US	香港
331	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	111	ru-RU	Китай, г. Шанхай, район Миньхан, улица Синьцзюньхуань, дом 115, корпус 1, офисы 503-505
332	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	111	en-US	China, Shanghai, Minhang District, 115 Xinjunhuan Street, Building 1, offices 503-505
333	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	111	zh-CN	中国上海市闵行区新俊环街115号1楼503-505办公室
334	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	112	ru-RU	/
335	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	112	en-US	/
336	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	112	zh-CN	/
337	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	113	ru-RU	+86 (021) 5432 2755
338	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	113	en-US	+86 (021) 5432 2755
339	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	113	zh-CN	+86 (021) 5432 2755
340	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	114	ru-RU	+86 (021) 5432 2755
341	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	114	en-US	+86 (021) 5432 2755
342	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	114	zh-CN	+86 (021) 5432 2755
343	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	115	ru-RU	+86 (021) 5432 2755
344	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	115	en-US	+86 (021) 5432 2755
345	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	115	zh-CN	+86 (021) 5432 2755
346	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	116	ru-RU	info@inter-sa.com
347	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	116	en-US	info@inter-sa.com
348	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	116	zh-CN	info@inter-sa.com
349	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	117	ru-RU	sales@inter-sa.com
350	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	117	en-US	sales@inter-sa.com
351	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	117	zh-CN	sales@inter-sa.com
352	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	118	ru-RU	 support@inter-sa.com
353	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	118	en-US	 support@inter-sa.com
354	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	118	zh-CN	 support@inter-sa.com
355	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	119	ru-RU	Понедельник – Пятница: 9:00 – 18:00 Суббота: 10:00 – 16:00 Воскресенье: выходной
359	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	120	zh-CN	布拉戈维申斯克
360	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	120	en-US	Blagoveshchensk
361	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	121	ru-RU	Социальные сети
362	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	121	zh-CN	社交网络
363	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	121	en-US	Social network
364	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	122	ru-RU	Следите за нами в социальных сетях, чтобы получать оперативные обновления и участвовать в обсуждения
365	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	122	en-US	Follow us on social media to receive live updates and participate in discussions.
366	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	122	zh-CN	在社交媒体上关注我们，以接收实时更新并参与讨论。
367	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	123	ru-RU	/
368	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	123	en-US	/
369	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	123	zh-CN	/
370	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	124	ru-RU	/
371	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	124	en-US	/
372	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	124	zh-CN	/
373	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	125	ru-RU	/
374	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	125	en-US	/
375	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	125	zh-CN	/
376	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	126	ru-RU	/
377	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	126	en-US	/
378	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	126	zh-CN	/
379	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	127	ru-RU	info@inter-sa.com
380	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	127	en-US	info@inter-sa.com
381	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	127	zh-CN	info@inter-sa.com
382	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	128	ru-RU	partners@inter-sa.com
383	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	128	en-US	partners@inter-sa.com
384	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	128	zh-CN	partners@inter-sa.com
385	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	129	ru-RU	support@inter-sa.com
386	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	129	zh-CN	support@inter-sa.com
387	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	129	en-US	support@inter-sa.com
388	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	130	ru-RU	press@inter-sa.com
389	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	130	en-US	press@inter-sa.com
390	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	130	zh-CN	press@inter-sa.com
394	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	132	ru-RU	История компании
395	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	132	en-US	Company History
396	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	132	zh-CN	公司历史
397	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	133	ru-RU	Основанная в 2020 году, компания SA International (上海亚际机电有限公司) начала свой путь как часть SIBC Group, фокусируясь на предоставлении консалтинговых услуг и подборе промышленного оборудования для различных отраслей. Наша цель с самого начала заключалась в том, чтобы стать надежным партнером для предприятий по всему миру, предлагая инновационные решения и высокий уровень сервиса.
398	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	133	en-US	Founded in 2020, SA International (上海亚际机电有限公司) began its journey as part of SIBC Group, focusing on providing consulting services and selecting industrial equipment for various industries. From the very start, our goal has been to become a reliable partner for businesses worldwide, offering innovative solutions and high-quality service.
399	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	133	zh-CN	上海亚际机电有限公司成立于2020年，起初作为SIBC集团的一部分，专注于为各行业提供咨询服务和工业设备选型。自公司成立以来，我们的目标是成为全球企业的可靠合作伙伴，提供创新解决方案和高质量服务。
400	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	134	ru-RU	2020
401	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	134	en-US	2020
402	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	134	zh-CN	2020
403	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	135	ru-RU	Основание SA International в составе SIBC Group в Шанхае. Открытие первого зарубежного офиса в Благовещенске, Россия, что позволило нам укрепить позиции на рынке СНГ.
404	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	135	en-US	Founding of SA International as part of SIBC Group in Shanghai. The opening of the first foreign office in Blagoveshchensk, Russia, allowed us to strengthen our position in the CIS market.
405	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	135	zh-CN	成立SA国际作为SIBC集团在上海的一部分. 在俄罗斯布拉戈维申斯克开设的第一家外国办事处使我们能够加强我们在独联体市场的地位。
406	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	136	ru-RU	2021
407	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	136	en-US	2021
408	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	136	zh-CN	2021
409	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	137	ru-RU	Запуск собственного производства вилочных погрузчиков и конвейерных лент, расширение продуктовой линейки.
410	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	137	en-US	Launch of own production of forklifts and conveyor belts, expansion of the product line.
411	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	137	zh-CN	推出自己生产的叉车和输送带,扩大生产线.
412	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	138	ru-RU	2022
413	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	138	en-US	2022
414	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	138	zh-CN	2022
415	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	139	ru-RU	Начало внедрения инновационных технологий с использованием искусственного интеллекта в производственные процессы.
416	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	139	en-US	The beginning of the introduction of innovative technologies using artificial intelligence in production processes.
417	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	139	zh-CN	在生产过程中引入使用人工智能的创新技术的开始。
418	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	140	ru-RU	2023
419	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	140	en-US	2023
420	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	140	zh-CN	2023
466	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	156	ru-RU	partners@inter-sa.com
467	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	156	zh-CN	partners@inter-sa.com
468	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	156	en-US	partners@inter-sa.com
393	2025-02-07 21:43:47.097	2025-02-19 07:31:36.971527	\N	131	zh-CN	星期一至五:9:00-18:00&nbsp;<div>星期六:10–00-16:00(只限总办事处)&nbsp;</div><div>星期日:休息</div>
421	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	141	ru-RU	Участие в Восточном Экономическом Форуме. Подписание договоров с правительством Российской Федерации о строительстве завода по производству портового оборудования.
422	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	141	en-US	Participation in the Eastern Economic Forum. Signing of agreements with the Government of the Russian Federation on the construction of a plant for the production of port equipment.
423	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	141	zh-CN	参加东方经济论坛。 与俄罗斯联邦政府签署关于建造港口设备生产工厂的协议。
424	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	142	ru-RU	2024
425	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	142	en-US	2024
426	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	142	zh-CN	2024
427	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	143	ru-RU	Создание бартерной биржи совместно с партнерами, инвестиции в размере 5 млн юаней для развития проекта. Подготовка к строительству завода по производству роботизированных рук в России с целью полной локализации производства к 2028 году. Расширение международного присутствия, планирование открытия офисов в Москве и Крыму, увеличение штата сотрудников до 50 человек. Открытие офисов в Гонконге и Иу.
428	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	143	en-US	Creation of a barter exchange together with partners, investments in the amount of 5 million yuan for the development of the project. Preparations for the construction of a plant for the production of robotic arms in Russia with the aim of fully localizing production by 2028. Expanding its international presence, planning the opening of offices in Moscow and Crimea, and increasing its staff to 50 people. Opening of offices in Hong Kong and Yiwu.
429	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	143	zh-CN	与合作伙伴一起创建易货交换，投资金额为500万元，用于项目的开发。 准备在俄罗斯建造一个生产机器人手臂的工厂，目的是到2028年完全本地化生产。 扩大其国际存在，计划在莫斯科和克里米亚开设办事处，并将其员工增加到50人。 在香港和义乌开设办事处。
430	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	144	ru-RU	Куроедов Евгений
431	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	144	en-US	Kuroedov Evgeny
432	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	144	zh-CN	黑田东彦叶夫根尼
433	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	145	ru-RU	Генеральный директор
434	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	145	en-US	General manager
435	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	145	zh-CN	总经理
436	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	146	ru-RU	Более 10 лет опыта в управлении международными проектами и стратегическом развитии
437	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	146	en-US	More than 10 years of experience in international project management and strategic development
438	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	146	zh-CN	超过10年的国际项目管理和战略发展经验
439	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	147	ru-RU	{"path":"http://localhost:9000/cms/df51f069abaaeef886b214e9b8fb2ddf.png","type":"images","name":"employee2.png","filename":"df51f069abaaeef886b214e9b8fb2ddf.png","size":331924,"deletedAt":null,"id":26,"createdAt":"2025-02-07T21:43:47.097Z","updatedAt":"2025-02-07T21:43:47.097Z","isSystem":false}
440	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	147	en-US	{"path":"http://localhost:9000/cms/df51f069abaaeef886b214e9b8fb2ddf.png","type":"images","name":"employee2.png","filename":"df51f069abaaeef886b214e9b8fb2ddf.png","size":331924,"deletedAt":null,"id":26,"createdAt":"2025-02-07T21:43:47.097Z","updatedAt":"2025-02-07T21:43:47.097Z","isSystem":false}
441	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	147	zh-CN	{"path":"http://localhost:9000/cms/df51f069abaaeef886b214e9b8fb2ddf.png","type":"images","name":"employee2.png","filename":"df51f069abaaeef886b214e9b8fb2ddf.png","size":331924,"deletedAt":null,"id":26,"createdAt":"2025-02-07T21:43:47.097Z","updatedAt":"2025-02-07T21:43:47.097Z","isSystem":false}
442	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	148	ru-RU	Дудник Игорь
443	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	148	en-US	Igor Dudnik
444	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	148	zh-CN	伊戈尔*杜德尼克
445	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	149	ru-RU	Операционный директор
446	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	149	en-US	Chief Operating Officer
447	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	149	zh-CN	总营运主任
448	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	150	ru-RU	Эксперт в области инновационных технологий с опытом работы в ведущих мировых компаниях
449	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	150	en-US	An expert in the field of innovative technologies with experience in leading global companies
450	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	150	zh-CN	创新技术领域的专家，在全球领先的公司有经验
451	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	151	ru-RU	{"path":"http://localhost:9000/cms/c85a6640a65a2a7d074132d399e08dd3.png","type":"images","name":"employee3.png","filename":"c85a6640a65a2a7d074132d399e08dd3.png","size":293021,"deletedAt":null,"id":27,"createdAt":"2025-02-07T21:43:47.097Z","updatedAt":"2025-02-07T21:43:47.097Z","isSystem":false}
452	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	151	en-US	{"path":"http://localhost:9000/cms/c85a6640a65a2a7d074132d399e08dd3.png","type":"images","name":"employee3.png","filename":"c85a6640a65a2a7d074132d399e08dd3.png","size":293021,"deletedAt":null,"id":27,"createdAt":"2025-02-07T21:43:47.097Z","updatedAt":"2025-02-07T21:43:47.097Z","isSystem":false}
453	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	151	zh-CN	{"path":"http://localhost:9000/cms/c85a6640a65a2a7d074132d399e08dd3.png","type":"images","name":"employee3.png","filename":"c85a6640a65a2a7d074132d399e08dd3.png","size":293021,"deletedAt":null,"id":27,"createdAt":"2025-02-07T21:43:47.097Z","updatedAt":"2025-02-07T21:43:47.097Z","isSystem":false}
454	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	152	ru-RU	Гаврилов Дмитрий
455	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	152	en-US	Gavrilov Dmitry
456	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	152	zh-CN	加夫里洛夫德米特里
457	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	153	ru-RU	Директор по развитию бизнеса
458	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	153	en-US	Director of Business Development
459	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	153	zh-CN	业务发展总监
460	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	154	ru-RU	Специалист по международным рынкам и построению эффективных партнерских отношений
461	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	154	en-US	Specialist in international markets and building effective partnerships
462	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	154	zh-CN	国际市场专家，建立有效的伙伴关系
463	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	155	ru-RU	
464	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	155	en-US	
465	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	155	zh-CN	
478	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	160	ru-RU	Политика конфиденциальности
479	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	160	zh-CN	隐私政策
480	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	160	en-US	Privacy Policy
481	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	161	ru-RU	Политика конфиденциальности описывает, какие данные мы собираем, как мы их используем, храним и защищаем
482	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	161	en-US	Our Privacy Policy explains what data we collect, how we use, store, and protect it.
483	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	161	zh-CN	隐私政策描述了我们收集哪些数据、如何使用、存储以及保护这些数据。
484	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	162	ru-RU	Мы стремимся обеспечить безопасность вашей персональной информации и соблюдать все применимые законы и нормативные акты в области защиты данных
485	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	162	en-US	We are committed to safeguarding your personal information and adhering to all applicable data protection laws and regulations.
486	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	162	zh-CN	我们致力于确保您的个人信息安全，并遵守所有适用的数据保护法律和法规。
493	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	\N	zh-CN	信息收集和使用：我们在您访问网站或使用服务时收集哪些数据及其用途。;Cookie 和类似技术：我们如何使用 Cookie 改善网站的使用体验。;向第三方传递数据：我们在何种条件下会将您的数据传递给合作伙伴和服务商。;数据安全：保护您的信息免遭未经授权访问的措施。;用户权利：如何管理、更新或删除您的数据。;政策变更：我们如何通知您隐私政策的变更。;联系信息：如何就隐私相关问题与我们联系。
494	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	\N	en-US	Information Collection and Use: Details on the data we collect when you visit our website or use our services, and the purposes for which it is collected.;Cookies and Similar Technologies: How we use cookies to enhance your browsing experience.;Data Sharing with Third Parties: Conditions under which we may share your data with partners and service providers.;Data Security: Measures taken to protect your information from unauthorized access;User Rights: How you can manage, update, or delete your personal data.;Policy Updates: How we will notify you of changes to our Privacy Policy.;Contact Information: How to reach us for questions related to privacy.
495	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	\N	ru-RU	Сбор и использование информации: какие данные мы собираем при посещении нашего сайта или использовании услуг, и с какой целью;Файлы cookie и аналогичные технологии: как мы используем файлы cookie для улучшения работы сайта;Передача данных третьим лицам: условия, при которых мы можем передавать ваши данные партнерам или сервисам;Безопасность данных: меры, предпринимаемые для защиты вашей информации от несанкционированного доступа;Права пользователей: как вы можете управлять своими данными, обновлять или удалять их;Изменения в политике: как мы будем информировать вас об изменениях в нашей Политике конфиденциальности;Контактная информация: как связаться с нами по вопросам, связанным с конфиденциальностью
491	2025-02-07 21:43:47.097	2025-02-18 19:15:51.083099	\N	164	en-US	{"path":"http://localhost:9000/cms/c175b3d6a6639d91d951d4186b5f5020.docx","type":"docs","name":"ÐÐ´Ð¼Ð¸Ð½ Ð¿Ð°Ð½ÐµÐ»Ñ.docx","filename":"c175b3d6a6639d91d951d4186b5f5020.docx","size":127336,"deletedAt":null,"id":28,"createdAt":"2025-02-07T21:43:47.097Z","updatedAt":"2025-02-07T21:43:47.097Z","isSystem":false}
490	2025-02-07 21:43:47.097	2025-02-18 19:15:51.089874	\N	164	ru-RU	{"path":"http://localhost:9000/cms/c175b3d6a6639d91d951d4186b5f5020.docx","type":"docs","name":"ÐÐ´Ð¼Ð¸Ð½ Ð¿Ð°Ð½ÐµÐ»Ñ.docx","filename":"c175b3d6a6639d91d951d4186b5f5020.docx","size":127336,"deletedAt":null,"id":28,"createdAt":"2025-02-07T21:43:47.097Z","updatedAt":"2025-02-07T21:43:47.097Z","isSystem":false}
587	2025-02-18 20:04:44.607	2025-02-18 20:04:44.607	\N	184	en-US	Phone
496	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	165	ru-RU	Пользовательское соглашение
499	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	166	ru-RU	Пользовательское соглашение устанавливает правила и условия использования нашего веб-сайта и предоставляемых нами сервисов
500	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	166	en-US	Our User Agreement sets out the rules and conditions for using our website and services. Reviewing this document will help you understand your rights and obligations when interacting with our company.
501	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	166	zh-CN	用户协议 用户协议规定了使用我们网站和服务的规则和条件。阅读该文件将帮助您了解与我们公司互动时的权利和义务
497	2025-02-07 21:43:47.097	2025-02-18 14:03:12.116567	\N	165	zh-CN	用户协议
498	2025-02-07 21:43:47.097	2025-02-18 14:03:12.128377	\N	165	en-US	Our User Agreement
492	2025-02-07 21:43:47.097	2025-02-18 19:15:51.076167	\N	164	zh-CN	{"path":"http://localhost:9000/cms/c175b3d6a6639d91d951d4186b5f5020.docx","type":"docs","name":"ÐÐ´Ð¼Ð¸Ð½ Ð¿Ð°Ð½ÐµÐ»Ñ.docx","filename":"c175b3d6a6639d91d951d4186b5f5020.docx","size":127336,"deletedAt":null,"id":28,"createdAt":"2025-02-07T21:43:47.097Z","updatedAt":"2025-02-07T21:43:47.097Z","isSystem":false}
588	2025-02-18 20:04:44.607	2025-02-18 20:04:44.607	\N	184	zh-CN	电话
589	2025-02-18 20:04:44.607	2025-02-18 20:04:44.607	\N	185	ru-RU	
590	2025-02-18 20:04:44.607	2025-02-18 20:04:44.607	\N	185	zh-CN	
591	2025-02-18 20:04:44.607	2025-02-18 20:04:44.607	\N	185	en-US	
592	2025-02-18 20:04:44.607	2025-02-18 20:04:44.607	\N	186	ru-RU	+86-5432-2755
470	2025-02-07 21:43:47.097	2025-02-18 20:45:10.481777	\N	157	en-US	
471	2025-02-07 21:43:47.097	2025-02-18 20:45:10.484908	\N	157	zh-CN	
472	2025-02-07 21:43:47.097	2025-02-18 20:45:10.487626	\N	158	ru-RU	
473	2025-02-07 21:43:47.097	2025-02-18 20:45:10.491391	\N	158	en-US	
474	2025-02-07 21:43:47.097	2025-02-18 20:45:10.495308	\N	158	zh-CN	
475	2025-02-07 21:43:47.097	2025-02-18 20:45:10.498407	\N	159	ru-RU	
476	2025-02-07 21:43:47.097	2025-02-18 20:45:10.501192	\N	159	en-US	
477	2025-02-07 21:43:47.097	2025-02-18 20:45:10.503892	\N	159	zh-CN	
502	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	167	ru-RU	Ознакомление с этим документом поможет вам понять свои права и обязанности при взаимодействии с нашей компанией
503	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	167	en-US	Reading this document will help you understand your rights and obligations when interacting with our company
504	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	167	zh-CN	阅读本文档将帮助您了解您在与我们公司互动时的权利和义务
511	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	\N	ru-RU	Общие положения: сфера действия соглашения, определения основных терминов;Права и обязанности пользователей: правила поведения на сайте, ответственность за предоставляемую информацию;Права и обязанности компании: наши обязательства перед пользователями, право на изменение контента и условий;Интеллектуальная собственность: правила использования материалов, размещенных на сайте;Ограничение ответственности: условия, при которых компания не несет ответственности за определенные действия или события;Порядок разрешения споров: механизмы урегулирования возможных разногласий;Изменения в соглашении: процедура внесения изменений и уведомления пользователей;Применимое законодательство: указание юрисдикции и применимых законов
512	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	\N	en-US	General Provisions: Scope of the agreement, definitions of key terms.;User Rights and Responsibilities: Website behavior rules and accountability for provided information.;Company Rights and Responsibilities: Our commitments to users, including the right to modify content and terms.;Intellectual Property: Guidelines for using materials published on the website.;Liability Disclaimer: Conditions under which the company is not responsible for certain actions or events.;Dispute Resolution: Mechanisms for resolving potential disagreements.;Agreement Modifications: Procedures for making changes and notifying users.;Applicable Law: Jurisdiction and governing laws.
513	2025-02-07 21:43:47.097	2025-02-07 21:43:47.097	\N	\N	zh-CN	一般规定： 协议的适用范围，基本术语的定义。;用户的权利和义务： 网站行为规则和对提供信息的责任。;公司的权利和义务： 我们对用户的承诺，以及修改内容和条款的权利。;知识产权： 网站上发布的材料使用规则。;责任限制： 公司不对某些行为或事件承担责任的条件。;争议解决程序： 解决潜在分歧的机制。;争议解决程序： 解决潜在分歧的机制。;适用法律： 指定的司法管辖权和适用法律。
520	2025-02-18 12:54:07.504	2025-02-18 12:54:07.504	\N	\N	ru-RU	test
521	2025-02-18 12:54:07.504	2025-02-18 12:54:07.504	\N	\N	en-US	{""}
517	2025-02-18 12:54:07.504	2025-02-18 12:54:07.504	\N	\N	ru-RU	 
265	2025-02-07 21:43:47.097	2025-02-17 11:49:05.537461	\N	89	ru-RU	Понедельник – Пятница: 9:00 – 18:00&nbsp;<div>Суббота: 10:00 – 16:00&nbsp;</div><div>Воскресенье: выходной</div>
266	2025-02-07 21:43:47.097	2025-02-17 11:49:05.539144	\N	89	en-US	Monday – Friday: 9:00 – 18:00&nbsp;<div>Saturday: 10:00 – 16:00&nbsp;</div><div>Sunday: closed</div>
267	2025-02-07 21:43:47.097	2025-02-17 11:49:13.20128	\N	89	zh-CN	星期一至五:9:00-18:00&nbsp;<div>星期六:10:00-16:00</div><div>星期日:休息</div>
509	2025-02-07 21:43:47.097	2025-02-18 19:18:55.28737	\N	169	en-US	{"path":"http://localhost:9000/cms/5918bdb0f5f1a72df4bd1893c652e9fc.docx","type":"docs","name":"ÐÐ´Ð¼Ð¸Ð½ Ð¿Ð°Ð½ÐµÐ»Ñ.docx","filename":"5918bdb0f5f1a72df4bd1893c652e9fc.docx","size":127336,"deletedAt":null,"id":29,"createdAt":"2025-02-07T21:43:47.097Z","updatedAt":"2025-02-07T21:43:47.097Z","isSystem":false}
510	2025-02-07 21:43:47.097	2025-02-18 19:18:55.290499	\N	169	zh-CN	{"path":"http://localhost:9000/cms/5918bdb0f5f1a72df4bd1893c652e9fc.docx","type":"docs","name":"ÐÐ´Ð¼Ð¸Ð½ Ð¿Ð°Ð½ÐµÐ»Ñ.docx","filename":"5918bdb0f5f1a72df4bd1893c652e9fc.docx","size":127336,"deletedAt":null,"id":29,"createdAt":"2025-02-07T21:43:47.097Z","updatedAt":"2025-02-07T21:43:47.097Z","isSystem":false}
593	2025-02-18 20:04:44.607	2025-02-18 20:04:44.607	\N	186	en-US	+86-5432-2755
518	2025-02-18 12:54:07.504	2025-02-18 12:54:07.504	\N	\N	en-US	 
522	2025-02-18 12:54:07.504	2025-02-18 12:54:07.504	\N	\N	zh-CN	{""}
594	2025-02-18 20:04:44.607	2025-02-18 20:04:44.607	\N	186	zh-CN	+86-5432-2755
514	2025-02-18 12:54:07.504	2025-02-18 12:54:07.504	\N	\N	ru-RU	 
515	2025-02-18 12:54:07.504	2025-02-18 12:54:07.504	\N	\N	en-US	 
516	2025-02-18 12:54:07.504	2025-02-18 12:54:07.504	\N	\N	zh-CN	 
538	2025-02-18 14:14:20.414	2025-02-18 14:14:20.414	\N	\N	ru-RU	test
519	2025-02-18 12:54:07.504	2025-02-18 12:54:07.504	\N	\N	zh-CN	 
535	2025-02-18 14:10:01.824	2025-02-18 14:10:01.824	\N	\N	ru-RU	test
526	2025-02-18 12:54:07.504	2025-02-18 12:54:07.504	\N	\N	ru-RU	test
527	2025-02-18 12:54:07.504	2025-02-18 12:54:07.504	\N	\N	en-US	test
529	2025-02-18 12:54:07.504	2025-02-18 12:54:07.504	\N	\N	ru-RU	test;test1
523	2025-02-18 12:54:07.504	2025-02-18 12:54:07.504	\N	\N	ru-RU	test
524	2025-02-18 12:54:07.504	2025-02-18 12:54:07.504	\N	\N	en-US	test
525	2025-02-18 12:54:07.504	2025-02-18 12:54:07.504	\N	\N	zh-CN	test
532	2025-02-18 12:54:07.504	2025-02-18 12:54:07.504	\N	\N	ru-RU	test
528	2025-02-18 12:54:07.504	2025-02-18 12:54:07.504	\N	\N	zh-CN	test
539	2025-02-18 14:14:20.414	2025-02-18 14:14:20.414	\N	\N	en-US	test
530	2025-02-18 12:54:07.504	2025-02-18 12:54:07.504	\N	\N	en-US	test;test1
531	2025-02-18 12:54:07.504	2025-02-18 12:54:07.504	\N	\N	zh-CN	test;test1
595	2025-02-18 20:04:44.607	2025-02-18 20:04:44.607	\N	187	ru-RU	
533	2025-02-18 12:54:07.504	2025-02-18 12:54:07.504	\N	\N	en-US	test
534	2025-02-18 12:54:07.504	2025-02-18 12:54:07.504	\N	\N	zh-CN	test
536	2025-02-18 14:10:01.824	2025-02-18 14:10:01.824	\N	\N	en-US	test
537	2025-02-18 14:10:01.824	2025-02-18 14:10:01.824	\N	\N	zh-CN	test
541	2025-02-18 14:14:53.994	2025-02-18 14:14:53.994	\N	\N	ru-RU	test
540	2025-02-18 14:14:20.414	2025-02-18 14:14:20.414	\N	\N	zh-CN	test
596	2025-02-18 20:04:44.607	2025-02-18 20:04:44.607	\N	187	en-US	
542	2025-02-18 14:14:53.994	2025-02-18 14:14:53.994	\N	\N	en-US	test
543	2025-02-18 14:14:53.994	2025-02-18 14:14:53.994	\N	\N	zh-CN	tset
506	2025-02-07 21:43:47.097	2025-02-18 19:18:55.272127	\N	168	en-US	General Provisions: Scope of the agreement, definitions of key terms.;User Rights and Responsibilities: Website behavior rules and accountability for provided information.;Company Rights and Responsibilities: Our commitments to users, including the right to modify content and terms.;Intellectual Property: Guidelines for using materials published on the website.;Liability Disclaimer: Conditions under which the company is not responsible for certain actions or events.;Dispute Resolution: Mechanisms for resolving potential disagreements.;Agreement Modifications: Procedures for making changes and notifying users.;Applicable Law: Jurisdiction and governing laws.
597	2025-02-18 20:04:44.607	2025-02-18 20:04:44.607	\N	187	zh-CN	
598	2025-02-18 20:04:44.607	2025-02-18 20:04:44.607	\N	188	ru-RU	
599	2025-02-18 20:04:44.607	2025-02-18 20:04:44.607	\N	188	en-US	
600	2025-02-18 20:04:44.607	2025-02-18 20:04:44.607	\N	188	zh-CN	
601	2025-02-18 20:04:44.607	2025-02-18 20:04:44.607	\N	189	ru-RU	Телефон
602	2025-02-18 20:04:44.607	2025-02-18 20:04:44.607	\N	189	en-US	Phone
487	2025-02-07 21:43:47.097	2025-02-18 19:15:51.057817	\N	163	ru-RU	Сбор и использование информации: какие данные мы собираем при посещении нашего сайта или использовании услуг, и с какой целью;Файлы cookie и аналогичные технологии: как мы используем файлы cookie для улучшения работы сайта;Передача данных третьим лицам: условия, при которых мы можем передавать ваши данные партнерам или сервисам;Безопасность данных: меры, предпринимаемые для защиты вашей информации от несанкционированного доступа;Права пользователей: как вы можете управлять своими данными, обновлять или удалять их;Изменения в политике: как мы будем информировать вас об изменениях в нашей Политике конфиденциальности;Контактная информация: как связаться с нами по вопросам, связанным с конфиденциальностью
488	2025-02-07 21:43:47.097	2025-02-18 19:15:51.06497	\N	163	en-US	Information Collection and Use: Details on the data we collect when you visit our website or use our services, and the purposes for which it is collected.;Cookies and Similar Technologies: How we use cookies to enhance your browsing experience.;Data Sharing with Third Parties: Conditions under which we may share your data with partners and service providers.;Data Security: Measures taken to protect your information from unauthorized access;User Rights: How you can manage, update, or delete your personal data.;Policy Updates: How we will notify you of changes to our Privacy Policy.;Contact Information: How to reach us for questions related to privacy.
489	2025-02-07 21:43:47.097	2025-02-18 19:15:51.07033	\N	163	zh-CN	信息收集和使用：我们在您访问网站或使用服务时收集哪些数据及其用途。;Cookie 和类似技术：我们如何使用 Cookie 改善网站的使用体验。;向第三方传递数据：我们在何种条件下会将您的数据传递给合作伙伴和服务商。;数据安全：保护您的信息免遭未经授权访问的措施。;用户权利：如何管理、更新或删除您的数据。;政策变更：我们如何通知您隐私政策的变更。;联系信息：如何就隐私相关问题与我们联系。
507	2025-02-07 21:43:47.097	2025-02-18 19:18:55.276329	\N	168	zh-CN	一般规定： 协议的适用范围，基本术语的定义。;用户的权利和义务： 网站行为规则和对提供信息的责任。;公司的权利和义务： 我们对用户的承诺，以及修改内容和条款的权利。;知识产权： 网站上发布的材料使用规则。;责任限制： 公司不对某些行为或事件承担责任的条件。;争议解决程序： 解决潜在分歧的机制。;协议变更： 修改程序和通知用户的方式。;适用法律： 指定的司法管辖权和适用法律。
505	2025-02-07 21:43:47.097	2025-02-18 19:18:55.279876	\N	168	ru-RU	Общие положения: сфера действия соглашения, определения основных терминов;Права и обязанности пользователей: правила поведения на сайте, ответственность за предоставляемую информацию;Права и обязанности компании: наши обязательства перед пользователями, право на изменение контента и условий;Интеллектуальная собственность: правила использования материалов, размещенных на сайте;Ограничение ответственности: условия, при которых компания не несет ответственности за определенные действия или события;Порядок разрешения споров: механизмы урегулирования возможных разногласий;Изменения в соглашении: процедура внесения изменений и уведомления пользователей;Применимое законодательство: указание юрисдикции и применимых законов
508	2025-02-07 21:43:47.097	2025-02-18 19:18:55.284012	\N	169	ru-RU	{"path":"http://localhost:9000/cms/5918bdb0f5f1a72df4bd1893c652e9fc.docx","type":"docs","name":"ÐÐ´Ð¼Ð¸Ð½ Ð¿Ð°Ð½ÐµÐ»Ñ.docx","filename":"5918bdb0f5f1a72df4bd1893c652e9fc.docx","size":127336,"deletedAt":null,"id":29,"createdAt":"2025-02-07T21:43:47.097Z","updatedAt":"2025-02-07T21:43:47.097Z","isSystem":false}
544	2025-02-18 20:04:44.607	2025-02-18 20:04:44.607	\N	170	ru-RU	
545	2025-02-18 20:04:44.607	2025-02-18 20:04:44.607	\N	170	zh-CN	
546	2025-02-18 20:04:44.607	2025-02-18 20:04:44.607	\N	170	en-US	
547	2025-02-18 20:04:44.607	2025-02-18 20:04:44.607	\N	171	ru-RU	+86-5432-2755
548	2025-02-18 20:04:44.607	2025-02-18 20:04:44.607	\N	171	en-US	+86-5432-2755
549	2025-02-18 20:04:44.607	2025-02-18 20:04:44.607	\N	171	zh-CN	+86-5432-2755
550	2025-02-18 20:04:44.607	2025-02-18 20:04:44.607	\N	172	ru-RU	
551	2025-02-18 20:04:44.607	2025-02-18 20:04:44.607	\N	172	en-US	
552	2025-02-18 20:04:44.607	2025-02-18 20:04:44.607	\N	172	zh-CN	
553	2025-02-18 20:04:44.607	2025-02-18 20:04:44.607	\N	173	ru-RU	
554	2025-02-18 20:04:44.607	2025-02-18 20:04:44.607	\N	173	en-US	
555	2025-02-18 20:04:44.607	2025-02-18 20:04:44.607	\N	173	zh-CN	
556	2025-02-18 20:04:44.607	2025-02-18 20:04:44.607	\N	174	ru-RU	Телефон
557	2025-02-18 20:04:44.607	2025-02-18 20:04:44.607	\N	174	en-US	Phone
558	2025-02-18 20:04:44.607	2025-02-18 20:04:44.607	\N	174	zh-CN	电话
559	2025-02-18 20:04:44.607	2025-02-18 20:04:44.607	\N	175	ru-RU	
560	2025-02-18 20:04:44.607	2025-02-18 20:04:44.607	\N	175	zh-CN	
561	2025-02-18 20:04:44.607	2025-02-18 20:04:44.607	\N	175	en-US	
562	2025-02-18 20:04:44.607	2025-02-18 20:04:44.607	\N	176	ru-RU	+86-5432-2755
563	2025-02-18 20:04:44.607	2025-02-18 20:04:44.607	\N	176	en-US	+86-5432-2755
564	2025-02-18 20:04:44.607	2025-02-18 20:04:44.607	\N	176	zh-CN	+86-5432-2755
565	2025-02-18 20:04:44.607	2025-02-18 20:04:44.607	\N	177	ru-RU	
566	2025-02-18 20:04:44.607	2025-02-18 20:04:44.607	\N	177	en-US	
567	2025-02-18 20:04:44.607	2025-02-18 20:04:44.607	\N	177	zh-CN	
568	2025-02-18 20:04:44.607	2025-02-18 20:04:44.607	\N	178	ru-RU	
569	2025-02-18 20:04:44.607	2025-02-18 20:04:44.607	\N	178	en-US	
570	2025-02-18 20:04:44.607	2025-02-18 20:04:44.607	\N	178	zh-CN	
571	2025-02-18 20:04:44.607	2025-02-18 20:04:44.607	\N	179	ru-RU	Телефон
572	2025-02-18 20:04:44.607	2025-02-18 20:04:44.607	\N	179	en-US	Phone
573	2025-02-18 20:04:44.607	2025-02-18 20:04:44.607	\N	179	zh-CN	电话
574	2025-02-18 20:04:44.607	2025-02-18 20:04:44.607	\N	180	ru-RU	
575	2025-02-18 20:04:44.607	2025-02-18 20:04:44.607	\N	180	zh-CN	
576	2025-02-18 20:04:44.607	2025-02-18 20:04:44.607	\N	180	en-US	
577	2025-02-18 20:04:44.607	2025-02-18 20:04:44.607	\N	181	ru-RU	+86-5432-2755
578	2025-02-18 20:04:44.607	2025-02-18 20:04:44.607	\N	181	en-US	+86-5432-2755
579	2025-02-18 20:04:44.607	2025-02-18 20:04:44.607	\N	181	zh-CN	+86-5432-2755
580	2025-02-18 20:04:44.607	2025-02-18 20:04:44.607	\N	182	ru-RU	
581	2025-02-18 20:04:44.607	2025-02-18 20:04:44.607	\N	182	en-US	
582	2025-02-18 20:04:44.607	2025-02-18 20:04:44.607	\N	182	zh-CN	
583	2025-02-18 20:04:44.607	2025-02-18 20:04:44.607	\N	183	ru-RU	
584	2025-02-18 20:04:44.607	2025-02-18 20:04:44.607	\N	183	en-US	
585	2025-02-18 20:04:44.607	2025-02-18 20:04:44.607	\N	183	zh-CN	
586	2025-02-18 20:04:44.607	2025-02-18 20:04:44.607	\N	184	ru-RU	Телефон
607	2025-02-18 20:41:43.531	2025-02-18 20:41:43.531	\N	191	ru-RU	+86-5432-2755
608	2025-02-18 20:41:43.531	2025-02-18 20:41:43.531	\N	191	en-US	+86-5432-2755
609	2025-02-18 20:41:43.531	2025-02-18 20:41:43.531	\N	191	zh-CN	+86-5432-2755
610	2025-02-18 20:41:43.531	2025-02-18 20:41:43.531	\N	192	ru-RU	
611	2025-02-18 20:41:43.531	2025-02-18 20:41:43.531	\N	192	en-US	
612	2025-02-18 20:41:43.531	2025-02-18 20:41:43.531	\N	192	zh-CN	
613	2025-02-18 20:41:43.531	2025-02-18 20:41:43.531	\N	193	ru-RU	
614	2025-02-18 20:41:43.531	2025-02-18 20:41:43.531	\N	193	en-US	
615	2025-02-18 20:41:43.531	2025-02-18 20:41:43.531	\N	193	zh-CN	
616	2025-02-18 20:41:43.531	2025-02-18 20:41:43.531	\N	194	ru-RU	Телефон
617	2025-02-18 20:41:43.531	2025-02-18 20:41:43.531	\N	194	en-US	Phone
618	2025-02-18 20:41:43.531	2025-02-18 20:41:43.531	\N	194	zh-CN	电话
619	2025-02-18 20:42:13.262	2025-02-18 20:42:13.262	\N	195	ru-RU	
620	2025-02-18 20:42:13.262	2025-02-18 20:42:13.262	\N	195	zh-CN	
621	2025-02-18 20:42:13.262	2025-02-18 20:42:13.262	\N	195	en-US	
622	2025-02-18 20:42:13.262	2025-02-18 20:42:13.262	\N	196	ru-RU	
623	2025-02-18 20:42:13.262	2025-02-18 20:42:13.262	\N	196	en-US	
624	2025-02-18 20:42:13.262	2025-02-18 20:42:13.262	\N	196	zh-CN	
625	2025-02-18 20:42:13.262	2025-02-18 20:42:13.262	\N	197	ru-RU	Китай, г. Шанхай, район Миньхан, улица Синьцзюньхуань, дом 115, корпус 1, офисы 503-505
626	2025-02-18 20:42:13.262	2025-02-18 20:42:13.262	\N	197	en-US	China, Shanghai, Minhang District, 115 Xinjunhuan Street, Building 1, offices 503-505
627	2025-02-18 20:42:13.262	2025-02-18 20:42:13.262	\N	197	zh-CN	中国上海市闵行区新俊环街115号1楼503-505办公室
628	2025-02-18 20:42:13.262	2025-02-18 20:42:13.262	\N	198	ru-RU	
629	2025-02-18 20:42:13.262	2025-02-18 20:42:13.262	\N	198	en-US	
630	2025-02-18 20:42:13.262	2025-02-18 20:42:13.262	\N	198	zh-CN	
631	2025-02-18 20:42:13.262	2025-02-18 20:42:13.262	\N	199	ru-RU	Адрес главного офиса
632	2025-02-18 20:42:13.262	2025-02-18 20:42:13.262	\N	199	en-US	Main office address
633	2025-02-18 20:42:13.262	2025-02-18 20:42:13.262	\N	199	zh-CN	总部地址：
469	2025-02-07 21:43:47.097	2025-02-18 20:45:10.4712	\N	157	ru-RU	
634	2025-02-18 20:42:13.262	2025-02-18 20:42:13.262	\N	200	ru-RU	E-mail
635	2025-02-18 20:42:13.262	2025-02-18 20:42:13.262	\N	200	en-US	E-mail
636	2025-02-18 20:42:13.262	2025-02-18 20:42:13.262	\N	200	zh-CN	E-mail
637	2025-02-18 20:42:13.262	2025-02-18 20:42:13.262	\N	201	ru-RU	
638	2025-02-18 20:42:13.262	2025-02-18 20:42:13.262	\N	201	zh-CN	
639	2025-02-18 20:42:13.262	2025-02-18 20:42:13.262	\N	201	en-US	
640	2025-02-18 20:42:13.262	2025-02-18 20:42:13.262	\N	202	ru-RU	
641	2025-02-18 20:42:13.262	2025-02-18 20:42:13.262	\N	202	en-US	
642	2025-02-18 20:42:13.262	2025-02-18 20:42:13.262	\N	202	zh-CN	
643	2025-02-18 20:42:13.262	2025-02-18 20:42:13.262	\N	203	ru-RU	
644	2025-02-18 20:42:13.262	2025-02-18 20:42:13.262	\N	203	en-US	
645	2025-02-18 20:42:13.262	2025-02-18 20:42:13.262	\N	203	zh-CN	
646	2025-02-18 20:42:13.262	2025-02-18 20:42:13.262	\N	204	ru-RU	Дмитрий Александрович Гаврилов, Директор по развитию бизнеса
647	2025-02-18 20:42:13.262	2025-02-18 20:42:13.262	\N	204	en-US	Dmitry Alexandrovich Gavrilov, Director of Business Development
648	2025-02-18 20:42:13.262	2025-02-18 20:42:13.262	\N	204	zh-CN	Dmitry Alexandrovich Gavrilov，业务发展总监
649	2025-02-18 20:42:13.262	2025-02-18 20:42:13.262	\N	205	ru-RU	Адрес главного офиса
650	2025-02-18 20:42:13.262	2025-02-18 20:42:13.262	\N	205	en-US	Main office address
651	2025-02-18 20:42:13.262	2025-02-18 20:42:13.262	\N	205	zh-CN	总部地址：
391	2025-02-07 21:43:47.097	2025-02-19 07:31:36.963989	\N	131	ru-RU	Понедельник – Пятница: 9:00 – 18:00&nbsp;<div>Суббота: 10:00 – 16:00 (только главный офис)&nbsp;</div><div>Воскресенье: выходной</div>
392	2025-02-07 21:43:47.097	2025-02-19 07:31:36.967628	\N	131	en-US	Monday – Friday: 9:00 – 18:00&nbsp;<div>Saturday: 10:00 – 16:00 (main office only)&nbsp;</div><div>Sunday: closed</div>
652	2025-02-21 19:46:23.824	2025-02-21 19:46:23.824	\N	206	ru-RU	Новости компании
653	2025-02-21 19:46:23.824	2025-02-21 19:46:23.824	\N	206	zh-CN	公司新闻
654	2025-02-21 19:46:23.824	2025-02-21 19:46:23.824	\N	206	en-US	Company News
655	2025-02-21 19:46:23.824	2025-02-21 19:46:23.824	\N	207	ru-RU	Будьте в курсе последних событий и новостей нашей компании.
656	2025-02-21 19:46:23.824	2025-02-21 19:46:23.824	\N	207	en-US	Keep up to date with the latest events and news of our company.
657	2025-02-21 19:46:23.824	2025-02-21 19:46:23.824	\N	207	zh-CN	随时了解我们公司的最新事件和消息.
658	2025-02-21 20:49:50.236	2025-02-21 20:49:50.237	\N	208	ru-RU	Статьи и аналитика
659	2025-02-21 20:49:50.236	2025-02-21 20:49:50.237	\N	208	zh-CN	文章和分析
660	2025-02-21 20:49:50.236	2025-02-21 20:49:50.237	\N	208	en-US	Articles and analytics
661	2025-02-21 20:49:50.236	2025-02-21 20:49:50.237	\N	209	ru-RU	Мы делимся своим опытом и экспертными знаниями, публикуя статьи и аналитические материалы по актуальным темам промышленности и технологий.
662	2025-02-21 20:49:50.236	2025-02-21 20:49:50.237	\N	209	en-US	We share our experience and expertise by publishing articles and analytical materials on current topics in industry and technology.
663	2025-02-21 20:49:50.236	2025-02-21 20:49:50.237	\N	209	zh-CN	我们通过发表关于当前工业和技术主题的文章和分析材料来分享我们的经验和专业知识。
664	2025-02-21 20:49:50.236	2025-02-21 20:49:50.237	\N	210	ru-RU	Социальные сети
665	2025-02-21 20:49:50.236	2025-02-21 20:49:50.237	\N	210	en-US	Social network
666	2025-02-21 20:49:50.236	2025-02-21 20:49:50.237	\N	210	zh-CN	社交网络
667	2025-02-21 20:49:50.236	2025-02-21 20:49:50.237	\N	211	ru-RU	Следите за нами в социальных сетях, чтобы получать оперативные обновления и участвовать в обсуждениях
668	2025-02-21 20:49:50.236	2025-02-21 20:49:50.237	\N	211	en-US	Follow us on social media to receive live updates and participate in discussions.
669	2025-02-21 20:49:50.236	2025-02-21 20:49:50.237	\N	211	zh-CN	在社交媒体上关注我们，以接收实时更新并参与讨论。
670	2025-02-21 20:49:50.236	2025-02-21 20:49:50.237	\N	212	ru-RU	SA International
671	2025-02-21 20:49:50.236	2025-02-21 20:49:50.237	\N	212	en-US	SA International
672	2025-02-21 20:49:50.236	2025-02-21 20:49:50.237	\N	212	zh-CN	SA International
673	2025-02-21 20:49:50.236	2025-02-21 20:49:50.237	\N	213	ru-RU	 — ваш источник актуальной информации и экспертных знаний в сфере промышленности и технологий
674	2025-02-21 20:49:50.236	2025-02-21 20:49:50.237	\N	213	en-US	— your source of relevant information and expertise in the field of industry and technology
675	2025-02-21 20:49:50.236	2025-02-21 20:49:50.237	\N	213	zh-CN	—您在工业和技术领域的相关信息和专业知识的来源
676	2025-02-21 20:49:50.236	2025-02-21 20:49:50.237	\N	214	ru-RU	Китай, г. Шанхай, район Миньхан, улица Синьцзюньхуань, дом 115, корпус 1, офисы 503-505
677	2025-02-21 20:49:50.236	2025-02-21 20:49:50.237	\N	214	en-US	China, Shanghai, Minhang District, 115 Xinjunhuan Street, Building 1, offices 503-505
678	2025-02-21 20:49:50.236	2025-02-21 20:49:50.237	\N	214	zh-CN	中国上海市闵行区新俊环街115号1楼503-505办公室
679	2025-02-21 20:49:50.236	2025-02-21 20:49:50.237	\N	215	ru-RU	+86-21-5432-2755
680	2025-02-21 20:49:50.236	2025-02-21 20:49:50.237	\N	215	en-US	+86-21-5432-2755
681	2025-02-21 20:49:50.236	2025-02-21 20:49:50.237	\N	215	zh-CN	+86-21-5432-2755
682	2025-02-21 20:49:50.236	2025-02-21 20:49:50.237	\N	216	ru-RU	info@inter-sa.com
683	2025-02-21 20:49:50.236	2025-02-21 20:49:50.237	\N	216	en-US	info@inter-sa.com
684	2025-02-21 20:49:50.236	2025-02-21 20:49:50.237	\N	216	zh-CN	info@inter-sa.com
685	2025-02-22 15:40:16.305	2025-02-22 15:40:16.305	\N	217	ru-RU	Пресс-релизы
686	2025-02-22 15:40:16.305	2025-02-22 15:40:16.305	\N	217	en-US	Press releases
687	2025-02-22 15:40:16.305	2025-02-22 15:40:16.305	\N	217	zh-CN	新闻公报
688	2025-02-22 15:40:16.305	2025-02-22 15:40:16.305	\N	218	ru-RU	Официальные заявления и анонсы компании SA International
689	2025-02-22 15:40:16.305	2025-02-22 15:40:16.305	\N	218	en-US	Official statements and announcements of SA International
690	2025-02-22 15:40:16.305	2025-02-22 15:40:16.305	\N	218	zh-CN	SA国际官方声明及公告
691	2025-02-24 08:07:25.591	2025-02-24 08:07:25.592	\N	219	ru-RU	info@inter-sa.com
692	2025-02-24 08:07:25.591	2025-02-24 08:07:25.592	\N	219	en-US	info@inter-sa.com
693	2025-02-24 08:07:25.591	2025-02-24 08:07:25.592	\N	219	zh-CN	info@inter-sa.com
694	2025-02-24 08:07:25.591	2025-02-24 08:07:25.592	\N	220	ru-RU	+86-21-5432-2755
695	2025-02-24 08:07:25.591	2025-02-24 08:07:25.592	\N	220	en-US	+86-21-5432-2755
696	2025-02-24 08:07:25.591	2025-02-24 08:07:25.592	\N	220	zh-CN	+86-21-5432-2755
697	2025-02-24 08:07:25.591	2025-02-24 08:07:25.592	\N	221	ru-RU	Китай, г. Шанхай, район Миньхан, улица Синьцзюньхуань, дом 115, корпус 1, офисы 503-505
698	2025-02-24 08:07:25.591	2025-02-24 08:07:25.592	\N	221	en-US	China, Shanghai, Minhang District, Xinjunhuan Street, Building 115, Unit 1, Offices 503–505
699	2025-02-24 08:07:25.591	2025-02-24 08:07:25.592	\N	221	zh-CN	总部地址 中国上海市闵行区新骏环路115号1号楼503-505办公室
700	2025-02-24 08:07:25.591	2025-02-24 08:07:25.592	\N	222	ru-RU	info@inter-sa.com
701	2025-02-24 08:07:25.591	2025-02-24 08:07:25.592	\N	222	en-US	info@inter-sa.com
702	2025-02-24 08:07:25.591	2025-02-24 08:07:25.592	\N	222	zh-CN	info@inter-sa.com
703	2025-02-24 08:07:25.591	2025-02-24 08:07:25.592	\N	223	ru-RU	+86-21-5432-2755
704	2025-02-24 08:07:25.591	2025-02-24 08:07:25.592	\N	223	en-US	+86-21-5432-2755
705	2025-02-24 08:07:25.591	2025-02-24 08:07:25.592	\N	223	zh-CN	+86-21-5432-2755
706	2025-02-24 08:07:25.591	2025-02-24 08:07:25.592	\N	224	ru-RU	Китай, г. Шанхай, район Миньхан, улица Синьцзюньхуань, дом 115, корпус 1, офисы 503-505
707	2025-02-24 08:07:25.591	2025-02-24 08:07:25.592	\N	224	en-US	China, Shanghai, Minhang District, Xinjunhuan Street, Building 115, Unit 1, Offices 503–505
708	2025-02-24 08:07:25.591	2025-02-24 08:07:25.592	\N	224	zh-CN	总部地址 中国上海市闵行区新骏环路115号1号楼503-505办公室
\.


--
-- Data for Name: pages_iblock_records_sections_pages_iblock_section; Type: TABLE DATA; Schema: public; Owner: postgress
--

COPY public.pages_iblock_records_sections_pages_iblock_section ("pagesIblockRecordsId", "pagesIblockSectionId") FROM stdin;
15	3
16	3
17	3
18	4
19	4
20	4
\.


--
-- Data for Name: pages_iblock_section; Type: TABLE DATA; Schema: public; Owner: postgress
--

COPY public.pages_iblock_section (id, "createdAt", "updatedAt", "deletedAt", "iblockId") FROM stdin;
1	2025-02-17 07:56:30.912	2025-02-17 09:04:46.502461	\N	\N
2	2025-02-17 07:56:30.912	2025-02-17 10:59:19.22978	\N	\N
3	2025-02-17 10:58:23.052	2025-02-17 10:58:23.052	\N	8
4	2025-02-17 10:58:23.052	2025-02-17 10:58:23.052	\N	8
\.


--
-- Data for Name: pages_iblock_section_value; Type: TABLE DATA; Schema: public; Owner: postgress
--

COPY public.pages_iblock_section_value (id, "createdAt", "updatedAt", "deletedAt", value, lang, "sectionId") FROM stdin;
1	2025-02-17 07:56:30.912	2025-02-17 07:56:30.912	\N	testRU	ru-RU	1
2	2025-02-17 07:56:30.912	2025-02-17 07:56:30.912	\N	testEn	en-US	1
3	2025-02-17 07:56:30.912	2025-02-17 07:56:30.912	\N	tsetCH	zh-CN	1
4	2025-02-17 07:56:30.912	2025-02-17 08:50:09.465191	\N	testEn	en-US	\N
5	2025-02-17 07:56:30.912	2025-02-17 08:50:09.468865	\N	tsetCH	zh-CN	\N
7	2025-02-17 07:56:30.912	2025-02-17 07:56:30.912	\N	testEN	en-US	2
8	2025-02-17 07:56:30.912	2025-02-17 07:56:30.912	\N	testCH	zh-CN	2
9	2025-02-17 07:56:30.912	2025-02-17 09:05:04.266886	\N	testEN	en-US	\N
10	2025-02-17 07:56:30.912	2025-02-17 09:05:04.269923	\N	testCH	zh-CN	\N
6	2025-02-17 07:56:30.912	2025-02-17 10:23:28.834685	\N	testRu111	ru-RU	2
11	2025-02-17 10:58:23.052	2025-02-17 10:58:23.052	\N	Общие вопросы	ru-RU	3
12	2025-02-17 10:58:23.052	2025-02-17 10:58:23.052	\N	General Questions	en-US	3
13	2025-02-17 10:58:23.052	2025-02-17 10:58:23.052	\N	一般问题	zh-CN	3
14	2025-02-17 10:58:23.052	2025-02-17 10:58:23.052	\N	Технические вопросы	ru-RU	4
15	2025-02-17 10:58:23.052	2025-02-17 10:58:23.052	\N	Technical Questions	en-US	4
16	2025-02-17 10:58:23.052	2025-02-17 10:58:23.052	\N	技术问题	zh-CN	4
\.


--
-- Data for Name: pages_params; Type: TABLE DATA; Schema: public; Owner: postgress
--

COPY public.pages_params (id, "createdAt", "updatedAt", "deletedAt", name, slug, type, "isFilter", "pagesId") FROM stdin;
1	2025-02-19 20:35:34.83	2025-02-19 20:35:34.83	\N	Изоображение	image	image	f	8
2	2025-02-20 13:50:21.358	2025-02-21 18:12:51.812078	2025-02-21 18:12:51.812078	test	test	text	f	8
3	2025-02-22 15:25:34.196	2025-02-22 15:25:34.196	\N	Изоображение	image	image	f	10
4	2025-02-24 08:08:12.432	2025-02-24 08:08:12.432	\N	Описание	description	textarea	f	11
5	2025-02-24 08:08:51.811	2025-02-24 08:08:51.811	\N	Технические характеристики	technical	textarea	f	11
6	2025-02-24 08:09:38.961	2025-02-24 08:09:38.961	\N	Сферы применения	application	textarea	f	11
8	2025-02-24 08:38:57.583	2025-02-24 08:38:57.584	\N	Изоображение	image	image	f	11
9	2025-02-24 08:45:21.839	2025-02-24 08:45:21.839	\N	Описание	description	textarea	f	12
10	2025-02-24 08:47:16.143	2025-02-24 08:47:16.143	\N	Технические характеристики	technical	textarea	f	12
11	2025-02-24 08:47:24.257	2025-02-24 08:47:24.257	\N	Сферы применения	application	textarea	f	12
7	2025-02-24 08:10:27.543	2025-02-24 08:47:49.628033	\N	Преимущества сотрудничества	advantages	editor	f	11
12	2025-02-24 08:47:54.92	2025-02-24 08:47:54.92	\N	Преимущества сотрудничества	advantages	editor	f	12
13	2025-02-24 08:48:10.833	2025-02-24 08:48:10.833	\N	Изоображение	image	image	f	12
\.


--
-- Data for Name: pages_params_field; Type: TABLE DATA; Schema: public; Owner: postgress
--

COPY public.pages_params_field (id, "createdAt", "updatedAt", "deletedAt", "paramsId", "recordId") FROM stdin;
1	2025-02-21 12:54:10.908	2025-02-21 12:54:10.908	\N	1	6
2	2025-02-21 12:54:10.908	2025-02-21 12:54:10.908	\N	2	6
3	2025-02-21 12:56:00.592	2025-02-21 12:56:00.592	\N	1	7
4	2025-02-21 12:56:00.592	2025-02-21 12:56:00.592	\N	2	7
5	2025-02-21 18:21:16.057	2025-02-21 18:21:16.057	\N	1	8
6	2025-02-21 20:49:50.236	2025-02-21 20:49:50.237	\N	3	11
7	2025-02-21 20:49:50.236	2025-02-21 20:49:50.237	\N	3	12
8	2025-02-24 08:07:25.591	2025-02-24 08:07:25.592	\N	4	13
9	2025-02-24 08:07:25.591	2025-02-24 08:07:25.592	\N	5	13
10	2025-02-24 08:07:25.591	2025-02-24 08:07:25.592	\N	6	13
11	2025-02-24 08:07:25.591	2025-02-24 08:07:25.592	\N	7	13
12	2025-02-24 08:07:25.591	2025-02-24 08:07:25.592	\N	8	13
13	2025-02-24 08:07:25.591	2025-02-24 08:07:25.592	\N	4	14
14	2025-02-24 08:07:25.591	2025-02-24 08:07:25.592	\N	5	14
15	2025-02-24 08:07:25.591	2025-02-24 08:07:25.592	\N	6	14
16	2025-02-24 08:07:25.591	2025-02-24 08:07:25.592	\N	7	14
17	2025-02-24 08:07:25.591	2025-02-24 08:07:25.592	\N	8	14
18	2025-02-24 08:07:25.591	2025-02-24 08:07:25.592	\N	9	15
19	2025-02-24 08:07:25.591	2025-02-24 08:07:25.592	\N	10	15
20	2025-02-24 08:07:25.591	2025-02-24 08:07:25.592	\N	11	15
21	2025-02-24 08:07:25.591	2025-02-24 08:07:25.592	\N	12	15
22	2025-02-24 08:07:25.591	2025-02-24 08:07:25.592	\N	13	15
23	2025-02-25 06:31:22.261	2025-02-25 06:31:22.261	\N	4	16
24	2025-02-25 06:31:22.261	2025-02-25 06:31:22.261	\N	5	16
25	2025-02-25 06:31:22.261	2025-02-25 06:31:22.261	\N	6	16
26	2025-02-25 06:31:22.261	2025-02-25 06:31:22.261	\N	7	16
27	2025-02-25 06:31:22.261	2025-02-25 06:31:22.261	\N	8	16
\.


--
-- Data for Name: pages_params_field_value; Type: TABLE DATA; Schema: public; Owner: postgress
--

COPY public.pages_params_field_value (id, "createdAt", "updatedAt", "deletedAt", value, lang, "pagesParamsFieldId") FROM stdin;
1	2025-02-21 12:54:10.908	2025-02-21 12:54:10.908	\N	ENG	en-US	2
3	2025-02-21 12:54:10.908	2025-02-21 12:54:10.908	\N	CH	zh-CN	2
2	2025-02-21 12:54:10.908	2025-02-21 12:55:24.032946	\N	Русский 111	ru-RU	2
4	2025-02-21 12:56:00.592	2025-02-21 12:56:00.592	\N	Новая новость	ru-RU	4
5	2025-02-21 12:56:00.592	2025-02-21 12:56:00.592	\N	Новая новость	en-US	4
6	2025-02-21 12:56:00.592	2025-02-21 12:56:00.592	\N	Новая новость	zh-CN	4
7	2025-02-21 18:21:16.057	2025-02-21 18:21:16.057	\N	{"path":"http://localhost:9000/cms/87e723c8e804dd49bd8ee96ecf634013.png","type":"images","name":"daulet-turubayev-RAwn1QFwfss-unsplash.png","filename":"87e723c8e804dd49bd8ee96ecf634013.png","size":207506,"deletedAt":null,"id":46,"createdAt":"2025-02-21T18:21:16.057Z","updatedAt":"2025-02-21T18:21:16.057Z","isSystem":false}	ru-RU	1
8	2025-02-21 18:21:16.057	2025-02-21 18:21:16.057	\N	{"path":"http://localhost:9000/cms/87e723c8e804dd49bd8ee96ecf634013.png","type":"images","name":"daulet-turubayev-RAwn1QFwfss-unsplash.png","filename":"87e723c8e804dd49bd8ee96ecf634013.png","size":207506,"deletedAt":null,"id":46,"createdAt":"2025-02-21T18:21:16.057Z","updatedAt":"2025-02-21T18:21:16.057Z","isSystem":false}	zh-CN	1
9	2025-02-21 18:21:16.057	2025-02-21 18:21:16.057	\N	{"path":"http://localhost:9000/cms/87e723c8e804dd49bd8ee96ecf634013.png","type":"images","name":"daulet-turubayev-RAwn1QFwfss-unsplash.png","filename":"87e723c8e804dd49bd8ee96ecf634013.png","size":207506,"deletedAt":null,"id":46,"createdAt":"2025-02-21T18:21:16.057Z","updatedAt":"2025-02-21T18:21:16.057Z","isSystem":false}	en-US	1
10	2025-02-21 20:49:50.236	2025-02-21 20:49:50.237	\N	{"path":"http://localhost:9000/cms/7219259062fb1a6271ce94f588f579b9.png","type":"images","name":"daulet-turubayev-RAwn1QFwfss-unsplash.png","filename":"7219259062fb1a6271ce94f588f579b9.png","size":207506,"deletedAt":null,"id":48,"createdAt":"2025-02-21T20:49:50.236Z","updatedAt":"2025-02-21T20:49:50.237Z","isSystem":false}	ru-RU	6
11	2025-02-21 20:49:50.236	2025-02-21 20:49:50.237	\N	{"path":"http://localhost:9000/cms/7219259062fb1a6271ce94f588f579b9.png","type":"images","name":"daulet-turubayev-RAwn1QFwfss-unsplash.png","filename":"7219259062fb1a6271ce94f588f579b9.png","size":207506,"deletedAt":null,"id":48,"createdAt":"2025-02-21T20:49:50.236Z","updatedAt":"2025-02-21T20:49:50.237Z","isSystem":false}	en-US	6
12	2025-02-21 20:49:50.236	2025-02-21 20:49:50.237	\N	{"path":"http://localhost:9000/cms/7219259062fb1a6271ce94f588f579b9.png","type":"images","name":"daulet-turubayev-RAwn1QFwfss-unsplash.png","filename":"7219259062fb1a6271ce94f588f579b9.png","size":207506,"deletedAt":null,"id":48,"createdAt":"2025-02-21T20:49:50.236Z","updatedAt":"2025-02-21T20:49:50.237Z","isSystem":false}	zh-CN	6
13	2025-02-24 08:07:25.591	2025-02-24 08:07:25.592	\N	Разработка концепции, проектирование, подбор и поставка оборудования, монтаж, пуско-наладочные работы, обучение персонала	ru-RU	8
14	2025-02-24 08:07:25.591	2025-02-24 08:07:25.592	\N	Concept development, design, equipment selection and supply, installation, commissioning, personnel training\n	en-US	8
15	2025-02-24 08:07:25.591	2025-02-24 08:07:25.592	\N	现代技术的整合、流程自动化、符合国际质量和安全标准\n	zh-CN	9
16	2025-02-24 08:07:25.591	2025-02-24 08:07:25.592	\N	食品工业、冶金、化工、建材生产、包装\n	zh-CN	10
17	2025-02-24 08:07:25.591	2025-02-24 08:07:25.592	\N	Integration of modern technologies, process automation, compliance with international quality and safety standards\n	en-US	9
18	2025-02-24 08:07:25.591	2025-02-24 08:07:25.592	\N	Пищевая промышленность, металлургия, химическая промышленность, производство строительных материалов, упаковка\n	ru-RU	10
19	2025-02-24 08:07:25.591	2025-02-24 08:07:25.592	\N	Интеграция современных технологий, автоматизация процессов, соответствие международным стандартам качества и безопасности\n	ru-RU	9
20	2025-02-24 08:07:25.591	2025-02-24 08:07:25.592	\N	Food industry, metallurgy, chemical industry, construction materials production, packaging\n	en-US	10
21	2025-02-24 08:07:25.591	2025-02-24 08:07:25.592	\N	概念开发、设计、设备选型与供应、安装、调试、员工培训	zh-CN	8
22	2025-02-24 08:07:25.591	2025-02-24 08:07:25.592	\N	<ul><li>Единый подрядчик на всех этапах проекта</li><li>Оптимизация затрат и сроков реализации</li><li>Гарантия качества и соблюдение сроков</li><li>Запрос коммерческого предложения</li></ul>	ru-RU	11
23	2025-02-24 08:07:25.591	2025-02-24 08:07:25.592	\N	<ul><li>A single contractor for all project stages</li><li>Cost and implementation time optimization</li><li>Quality assurance and adherence to deadlines</li><li>Request a Commercial Offer</li></ul>	en-US	11
24	2025-02-24 08:07:25.591	2025-02-24 08:07:25.592	\N	<ul><li>项目各阶段的单一承包商</li><li>优化成本和实施时间</li><li>质量保证和按时交付</li><li>请求商业报价</li></ul>	zh-CN	11
28	2025-02-24 08:07:25.591	2025-02-24 08:07:25.592	\N	Подбор оптимального оборудования на основе анализа ваших потребностей и особенностей производства	ru-RU	13
29	2025-02-24 08:07:25.591	2025-02-24 08:07:25.592	\N	Selection of optimal equipment based on an analysis of your needs and production specifics\n	en-US	13
30	2025-02-24 08:07:25.591	2025-02-24 08:07:25.592	\N	根据对您的需求和生产特点的分析，选择最佳设备。\n	zh-CN	13
31	2025-02-24 08:07:25.591	2025-02-24 08:07:25.592	\N	<ul><li>Экономия времени и ресурсов</li><li>Доступ к широкой базе проверенных поставщиков</li><li>Независимая экспертная оценка и рекомендации</li></ul>	ru-RU	16
32	2025-02-24 08:07:25.591	2025-02-24 08:07:25.592	\N	<ul><li>Time and resource savings</li><li>Access to a wide database of verified suppliers</li><li>Independent expert evaluation and recommendations</li></ul>	en-US	16
33	2025-02-24 08:07:25.591	2025-02-24 08:07:25.592	\N	<ul><li>节省时间和资源</li><li>访问广泛的经过验证的供应商数据库</li><li>独立的专家评估和建议</li></ul>	zh-CN	16
27	2025-02-24 08:07:25.591	2025-02-25 07:29:43.030027	\N	{"path":"http://localhost:9000/cms/f7685ef0a882cb5dde13e64f222336e4.png","type":"images","name":"pngwing.com (4) 1.png","filename":"f7685ef0a882cb5dde13e64f222336e4.png","size":367918,"deletedAt":null,"id":51,"createdAt":"2025-02-25T07:28:44.604Z","updatedAt":"2025-02-25T07:28:44.604Z","isSystem":false}	zh-CN	12
34	2025-02-24 08:07:25.591	2025-02-24 08:07:25.592	\N	Экскаваторы, бульдозеры, грейдеры, башенные и мобильные краны, генераторы, компрессоры, сварочные аппараты, перфораторы 	ru-RU	18
35	2025-02-24 08:07:25.591	2025-02-24 08:07:25.592	\N	<ul><li>Manufacturer's quality guarantee</li><li>Technical support and maintenance service</li><li>&nbsp;Individual approach to each project</li></ul>	en-US	21
36	2025-02-24 08:07:25.591	2025-02-24 08:07:25.592	\N	Excavators, bulldozers, graders, tower and mobile cranes, generators, compressors, welding machines, jackhammers\n	en-US	18
37	2025-02-24 08:07:25.591	2025-02-24 08:07:25.592	\N	Высокая производительность, энергоэффективность, простота в обслуживании\n	ru-RU	19
38	2025-02-24 08:07:25.591	2025-02-24 08:07:25.592	\N	挖掘机、推土机、平地机、塔式和移动式起重机、发电机、压缩机、焊接机、电锤\n	zh-CN	18
39	2025-02-24 08:07:25.591	2025-02-24 08:07:25.592	\N	High performance, energy efficiency, ease of maintenance\n	en-US	19
40	2025-02-24 08:07:25.591	2025-02-24 08:07:25.592	\N	Гражданское и промышленное строительство, возведение жилых комплексов, инфраструктурные проекты\n	ru-RU	20
41	2025-02-24 08:07:25.591	2025-02-24 08:07:25.592	\N	<ul><li>制造商的质量保证</li><li>技术支持和售后服务</li><li>为每个项目量身定制的解决方案</li></ul>	zh-CN	21
42	2025-02-24 08:07:25.591	2025-02-24 08:07:25.592	\N	高生产率、节能、易于维护\n	zh-CN	19
43	2025-02-24 08:07:25.591	2025-02-24 08:07:25.592	\N	Civil and industrial construction, residential complex construction, infrastructure projects\n	en-US	20
44	2025-02-24 08:07:25.591	2025-02-24 08:07:25.592	\N	民用和工业建筑、住宅综合楼建设、基础设施项目\n	zh-CN	20
45	2025-02-24 08:07:25.591	2025-02-24 08:07:25.592	\N	<ul><li>Гарантия качества от производителя</li><li>Техническая поддержка и сервисное обслуживание</li><li>Индивидуальный подход к каждому проекту</li></ul>	ru-RU	21
46	2025-02-24 08:07:25.591	2025-02-24 08:07:25.592	\N	{"path":"http://localhost:9000/cms/be8e2c016341cf9f77ad0341d0daed6d.png","type":"images","name":"pngwing.com (2) 1.png","filename":"be8e2c016341cf9f77ad0341d0daed6d.png","size":515224,"deletedAt":null,"id":50,"createdAt":"2025-02-24T08:07:25.591Z","updatedAt":"2025-02-24T08:07:25.592Z","isSystem":false}	en-US	22
47	2025-02-24 08:07:25.591	2025-02-24 08:07:25.592	\N	{"path":"http://localhost:9000/cms/be8e2c016341cf9f77ad0341d0daed6d.png","type":"images","name":"pngwing.com (2) 1.png","filename":"be8e2c016341cf9f77ad0341d0daed6d.png","size":515224,"deletedAt":null,"id":50,"createdAt":"2025-02-24T08:07:25.591Z","updatedAt":"2025-02-24T08:07:25.592Z","isSystem":false}	zh-CN	22
48	2025-02-24 08:07:25.591	2025-02-24 08:07:25.592	\N	{"path":"http://localhost:9000/cms/be8e2c016341cf9f77ad0341d0daed6d.png","type":"images","name":"pngwing.com (2) 1.png","filename":"be8e2c016341cf9f77ad0341d0daed6d.png","size":515224,"deletedAt":null,"id":50,"createdAt":"2025-02-24T08:07:25.591Z","updatedAt":"2025-02-24T08:07:25.592Z","isSystem":false}	ru-RU	22
49	2025-02-25 06:31:22.261	2025-02-25 06:31:22.261	\N	Интеграция современных технологий, включая искусственный интеллект и автоматизацию, в существующие производственные процессы\n	ru-RU	23
50	2025-02-25 06:31:22.261	2025-02-25 06:31:22.261	\N	Integration of modern technologies, including artificial intelligence and automation, into existing production processes\n	en-US	23
51	2025-02-25 06:31:22.261	2025-02-25 06:31:22.261	\N	将现代技术（包括人工智能和自动化）整合到现有的生产流程中。\n	zh-CN	23
52	2025-02-25 06:31:22.261	2025-02-25 06:31:22.261	\N	<ul><li>Повышение эффективности и производительности</li><li>Снижение издержек и оптимизация ресурсов</li><li>Улучшение качества продукции и услуг</li></ul>	ru-RU	26
53	2025-02-25 06:31:22.261	2025-02-25 06:31:22.261	\N	<ul><li>提高效率和生产力</li><li>降低成本并优化资源</li><li>提高产品和服务质量</li></ul>	zh-CN	26
54	2025-02-25 06:31:22.261	2025-02-25 06:31:22.261	\N	<ul><li>Increased efficiency and productivity</li><li>Cost reduction and resource optimization</li><li>Improved product and service quality</li></ul>	en-US	26
25	2025-02-24 08:07:25.591	2025-02-25 07:29:43.023002	\N	{"path":"http://localhost:9000/cms/f7685ef0a882cb5dde13e64f222336e4.png","type":"images","name":"pngwing.com (4) 1.png","filename":"f7685ef0a882cb5dde13e64f222336e4.png","size":367918,"deletedAt":null,"id":51,"createdAt":"2025-02-25T07:28:44.604Z","updatedAt":"2025-02-25T07:28:44.604Z","isSystem":false}	ru-RU	12
26	2025-02-24 08:07:25.591	2025-02-25 07:29:43.030772	\N	{"path":"http://localhost:9000/cms/f7685ef0a882cb5dde13e64f222336e4.png","type":"images","name":"pngwing.com (4) 1.png","filename":"f7685ef0a882cb5dde13e64f222336e4.png","size":367918,"deletedAt":null,"id":51,"createdAt":"2025-02-25T07:28:44.604Z","updatedAt":"2025-02-25T07:28:44.604Z","isSystem":false}	en-US	12
\.


--
-- Data for Name: pages_params_value; Type: TABLE DATA; Schema: public; Owner: postgress
--

COPY public.pages_params_value (id, "createdAt", "updatedAt", "deletedAt", value, "valueJson", "paramsId", "recordId") FROM stdin;
\.


--
-- Data for Name: pages_sections; Type: TABLE DATA; Schema: public; Owner: postgress
--

COPY public.pages_sections (id, "createdAt", "updatedAt", "deletedAt", "pagesId") FROM stdin;
2	2025-02-23 12:02:24.518	2025-02-23 12:02:24.518	\N	11
3	2025-02-24 08:07:25.591	2025-02-24 08:07:25.592	\N	11
\.


--
-- Data for Name: pages_sections_description_value; Type: TABLE DATA; Schema: public; Owner: postgress
--

COPY public.pages_sections_description_value (id, "createdAt", "updatedAt", "deletedAt", value, lang, "sectionId") FROM stdin;
2	2025-02-23 12:02:24.518	2025-02-24 08:41:03.028233	\N	We offer comprehensive solutions for creating production lines fully adapted to your business needs.	en-US	2
1	2025-02-23 12:02:24.518	2025-02-24 08:41:03.028432	\N	Предлагаем комплексные решения по созданию производственных линий, полностью адаптированных под ваши бизнес-задачи	ru-RU	2
3	2025-02-23 12:02:24.518	2025-02-24 08:41:03.029164	\N	我们提供全面的解决方案，打造完全适应您业务需求的生产线。	zh-CN	2
4	2025-02-24 08:07:25.591	2025-02-24 08:07:25.592	\N	Наша команда экспертов готова предоставить профессиональные консультации и разработать инновационные решения для вашего бизнеса.	ru-RU	3
5	2025-02-24 08:07:25.591	2025-02-24 08:07:25.592	\N	我们的专家团队随时准备为您提供专业咨询，并为您的业务开发创新解决方案	zh-CN	3
6	2025-02-24 08:07:25.591	2025-02-24 08:07:25.592	\N	Our team of experts is ready to provide professional consultations and develop innovative solutions for your business	en-US	3
\.


--
-- Data for Name: pages_sections_title_value; Type: TABLE DATA; Schema: public; Owner: postgress
--

COPY public.pages_sections_title_value (id, "createdAt", "updatedAt", "deletedAt", value, lang, "sectionId") FROM stdin;
1	2025-02-23 12:02:24.518	2025-02-24 08:41:03.019084	\N	Производственные линии под ключ	ru-RU	2
3	2025-02-23 12:02:24.518	2025-02-24 08:41:03.024247	\N	交钥匙生产线	zh-CN	2
2	2025-02-23 12:02:24.518	2025-02-24 08:41:03.025838	\N	Turnkey Production Lines	en-US	2
4	2025-02-24 08:07:25.591	2025-02-24 08:07:25.592	\N	Консалтинг и разработка технологий	ru-RU	3
5	2025-02-24 08:07:25.591	2025-02-24 08:07:25.592	\N	Consulting and Technology Development	en-US	3
6	2025-02-24 08:07:25.591	2025-02-24 08:07:25.592	\N	咨询与技术开发	zh-CN	3
\.


--
-- Data for Name: pages_sections_value; Type: TABLE DATA; Schema: public; Owner: postgress
--

COPY public.pages_sections_value (id, "createdAt", "updatedAt", "deletedAt", value, lang, "sectionId") FROM stdin;
\.


--
-- Data for Name: pages_seo; Type: TABLE DATA; Schema: public; Owner: postgress
--

COPY public.pages_seo (id, "createdAt", "updatedAt", "deletedAt") FROM stdin;
1	2025-02-06 19:48:01.55	2025-02-06 19:48:01.55	\N
2	2025-02-06 20:11:07.928	2025-02-06 20:11:07.928	\N
3	2025-02-06 20:11:07.928	2025-02-06 20:11:07.928	\N
4	2025-02-06 20:11:07.928	2025-02-06 20:11:07.928	\N
5	2025-02-06 20:11:07.928	2025-02-06 20:11:07.928	\N
6	2025-02-06 20:11:07.928	2025-02-06 20:11:07.928	\N
7	2025-02-06 20:11:07.928	2025-02-06 20:11:07.928	\N
8	2025-02-19 06:24:29.897	2025-02-19 06:24:29.897	\N
\.


--
-- Data for Name: pages_seo_params; Type: TABLE DATA; Schema: public; Owner: postgress
--

COPY public.pages_seo_params (id, "createdAt", "updatedAt", "deletedAt", content, lang, "fieldType", "pagesSeoId") FROM stdin;
1	2025-02-06 19:48:01.55	2025-02-06 19:48:01.55	\N	Home	en-US	description	1
2	2025-02-06 19:48:01.55	2025-02-06 19:48:01.55	\N	Home	en-US	title	1
3	2025-02-06 19:48:01.55	2025-02-06 19:48:01.55	\N	Главная	ru-RU	description	1
4	2025-02-06 19:48:01.55	2025-02-06 19:48:01.55	\N	Главная	ru-RU	title	1
5	2025-02-06 19:48:01.55	2025-02-06 19:48:01.55	\N	Home	en-US	keywords	1
6	2025-02-06 19:48:01.55	2025-02-06 19:48:01.55	\N	HomeCH	zh-CN	description	1
7	2025-02-06 19:48:01.55	2025-02-06 19:48:01.55	\N	HomeCH	zh-CN	title	1
8	2025-02-06 19:48:01.55	2025-02-06 19:48:01.55	\N	Главная	ru-RU	keywords	1
9	2025-02-06 19:48:01.55	2025-02-06 19:48:01.55	\N	HomeCH	zh-CN	keywords	1
10	2025-02-06 20:11:07.928	2025-02-06 20:11:07.928	\N	About Us	en-US	description	2
11	2025-02-06 20:11:07.928	2025-02-06 20:11:07.928	\N	О компании	ru-RU	description	2
12	2025-02-06 20:11:07.928	2025-02-06 20:11:07.928	\N	About Us	en-US	title	2
13	2025-02-06 20:11:07.928	2025-02-06 20:11:07.928	\N	О компании	ru-RU	title	2
14	2025-02-06 20:11:07.928	2025-02-06 20:11:07.928	\N	About Us	zh-CN	title	2
15	2025-02-06 20:11:07.928	2025-02-06 20:11:07.928	\N	About Us	zh-CN	description	2
16	2025-02-06 20:11:07.928	2025-02-06 20:11:07.928	\N	About Us	zh-CN	keywords	2
17	2025-02-06 20:11:07.928	2025-02-06 20:11:07.928	\N	О компании	ru-RU	keywords	2
18	2025-02-06 20:11:07.928	2025-02-06 20:11:07.928	\N	About Us	en-US	keywords	2
19	2025-02-06 20:11:07.928	2025-02-06 20:11:07.928	\N	Контакты	ru-RU	description	3
20	2025-02-06 20:11:07.928	2025-02-06 20:11:07.928	\N	Контакты	ru-RU	title	3
21	2025-02-06 20:11:07.928	2025-02-06 20:11:07.928	\N	Сontacts	en-US	title	3
22	2025-02-06 20:11:07.928	2025-02-06 20:11:07.928	\N	Сontacts	zh-CN	description	3
23	2025-02-06 20:11:07.928	2025-02-06 20:11:07.928	\N	Сontacts	en-US	keywords	3
24	2025-02-06 20:11:07.928	2025-02-06 20:11:07.928	\N	Сontacts	en-US	description	3
25	2025-02-06 20:11:07.928	2025-02-06 20:11:07.928	\N	Контакты	ru-RU	keywords	3
26	2025-02-06 20:11:07.928	2025-02-06 20:11:07.928	\N	Сontacts	zh-CN	title	3
27	2025-02-06 20:11:07.928	2025-02-06 20:11:07.928	\N	Сontacts	zh-CN	keywords	3
28	2025-02-06 20:11:07.928	2025-02-06 20:11:07.928	\N	Политика конфиденциальности	ru-RU	keywords	4
29	2025-02-06 20:11:07.928	2025-02-06 20:11:07.928	\N	Policy	zh-CN	description	4
30	2025-02-06 20:11:07.928	2025-02-06 20:11:07.928	\N	Policy	en-US	title	4
31	2025-02-06 20:11:07.928	2025-02-06 20:11:07.928	\N	Policy	en-US	description	4
32	2025-02-06 20:11:07.928	2025-02-06 20:11:07.928	\N	Политика конфиденциальности	ru-RU	description	4
33	2025-02-06 20:11:07.928	2025-02-06 20:11:07.928	\N	Policy	en-US	keywords	4
34	2025-02-06 20:11:07.928	2025-02-06 20:11:07.928	\N	Политика конфиденциальности	ru-RU	title	4
35	2025-02-06 20:11:07.928	2025-02-06 20:11:07.928	\N	Policy	zh-CN	keywords	4
36	2025-02-06 20:11:07.928	2025-02-06 20:11:07.928	\N	Policy	zh-CN	title	4
37	2025-02-06 20:11:07.928	2025-02-06 20:11:07.928	\N	Клиенты	ru-RU	description	5
38	2025-02-06 20:11:07.928	2025-02-06 20:11:07.928	\N	Клиенты	ru-RU	title	5
39	2025-02-06 20:11:07.928	2025-02-06 20:11:07.928	\N	Клиенты	ru-RU	keywords	5
40	2025-02-06 20:11:07.928	2025-02-06 20:11:07.928	\N	Сlients	en-US	description	5
41	2025-02-06 20:11:07.928	2025-02-06 20:11:07.928	\N	Сlients	zh-CN	description	5
42	2025-02-06 20:11:07.928	2025-02-06 20:11:07.928	\N	Сlients	en-US	title	5
43	2025-02-06 20:11:07.928	2025-02-06 20:11:07.928	\N	Сlients	zh-CN	title	5
44	2025-02-06 20:11:07.928	2025-02-06 20:11:07.928	\N	Сlients	en-US	keywords	5
45	2025-02-06 20:11:07.928	2025-02-06 20:11:07.928	\N	Сlients	zh-CN	keywords	5
46	2025-02-06 20:11:07.928	2025-02-06 20:11:07.928	\N	Partners	zh-CN	description	6
47	2025-02-06 20:11:07.928	2025-02-06 20:11:07.928	\N	Partners	en-US	title	6
48	2025-02-06 20:11:07.928	2025-02-06 20:11:07.928	\N	Партнерам	ru-RU	description	6
49	2025-02-06 20:11:07.928	2025-02-06 20:11:07.928	\N	Partners	en-US	keywords	6
50	2025-02-06 20:11:07.928	2025-02-06 20:11:07.928	\N	Partners	zh-CN	keywords	6
51	2025-02-06 20:11:07.928	2025-02-06 20:11:07.928	\N	Partners	en-US	description	6
52	2025-02-06 20:11:07.928	2025-02-06 20:11:07.928	\N	Партнерам	ru-RU	keywords	6
53	2025-02-06 20:11:07.928	2025-02-06 20:11:07.928	\N	Партнерам	ru-RU	title	6
54	2025-02-06 20:11:07.928	2025-02-06 20:11:07.928	\N	Partners	zh-CN	title	6
55	2025-02-06 20:11:07.928	2025-02-06 20:11:07.928	\N	Карьера	ru-RU	title	7
56	2025-02-06 20:11:07.928	2025-02-06 20:11:07.928	\N	Career	en-US	description	7
57	2025-02-06 20:11:07.928	2025-02-06 20:11:07.928	\N	Карьера	ru-RU	description	7
58	2025-02-06 20:11:07.928	2025-02-06 20:11:07.928	\N	Career	zh-CN	title	7
59	2025-02-06 20:11:07.928	2025-02-06 20:11:07.928	\N	Карьера	ru-RU	keywords	7
60	2025-02-06 20:11:07.928	2025-02-06 20:11:07.928	\N	Career	zh-CN	keywords	7
61	2025-02-06 20:11:07.928	2025-02-06 20:11:07.928	\N	Career	zh-CN	description	7
62	2025-02-06 20:11:07.928	2025-02-06 20:11:07.928	\N	Career	en-US	title	7
63	2025-02-06 20:11:07.928	2025-02-06 20:11:07.928	\N	Career	en-US	keywords	7
64	2025-02-19 06:24:29.897	2025-02-19 06:24:29.897	\N	News	en-US	title	8
65	2025-02-19 06:24:29.897	2025-02-19 06:24:29.897	\N	Новости	ru-RU	description	8
66	2025-02-19 06:24:29.897	2025-02-19 06:24:29.897	\N	Новости	ru-RU	keywords	8
67	2025-02-19 06:24:29.897	2025-02-19 06:24:29.897	\N	News	zh-CN	description	8
68	2025-02-19 06:24:29.897	2025-02-19 06:24:29.897	\N	Новости	ru-RU	title	8
69	2025-02-19 06:24:29.897	2025-02-19 06:24:29.897	\N	News	en-US	description	8
70	2025-02-19 06:24:29.897	2025-02-19 06:24:29.897	\N	News	zh-CN	title	8
71	2025-02-19 06:24:29.897	2025-02-19 06:24:29.897	\N	News	en-US	keywords	8
72	2025-02-19 06:24:29.897	2025-02-19 06:24:29.897	\N	News	zh-CN	keywords	8
\.


--
-- Data for Name: records; Type: TABLE DATA; Schema: public; Owner: postgress
--

COPY public.records (id, "createdAt", "updatedAt", "deletedAt", "countView", "pagesId", "authorId", "titleId", "seoId", "descriptionId") FROM stdin;
1	2025-02-20 11:37:37.755	2025-02-20 11:38:26.859701	2025-02-20 11:38:26.859701	0	8	\N	1	\N	1
2	2025-02-20 11:38:28.578	2025-02-20 11:38:59.93677	2025-02-20 11:38:59.93677	0	8	\N	2	\N	2
3	2025-02-20 11:39:10.712	2025-02-20 11:47:48.719961	2025-02-20 11:47:48.719961	0	8	\N	3	\N	3
4	2025-02-20 11:47:49.804	2025-02-20 11:55:31.310094	2025-02-20 11:55:31.310094	0	8	\N	4	\N	4
5	2025-02-20 11:49:27.746	2025-02-20 11:55:33.805698	2025-02-20 11:55:33.805698	0	8	\N	5	1	5
6	2025-02-20 11:56:25.095	2025-02-20 12:05:36.426341	\N	0	8	\N	6	2	6
7	2025-02-21 12:56:40.907	2025-02-21 18:27:47.296747	2025-02-21 18:27:47.296747	0	8	\N	7	3	7
8	2025-02-21 18:40:13.283	2025-02-21 18:40:13.283	\N	0	8	\N	8	4	8
9	2025-02-22 15:21:29.23	2025-02-22 15:21:29.23	\N	0	9	\N	9	5	9
10	2025-02-22 15:21:54.692	2025-02-22 15:21:54.692	\N	0	9	\N	10	6	10
11	2025-02-22 15:27:47.866	2025-02-22 15:27:47.866	\N	0	10	\N	11	7	11
12	2025-02-22 15:29:39.836	2025-02-22 15:29:39.836	\N	0	10	\N	12	8	12
13	2025-02-24 07:51:17.758	2025-02-24 07:51:17.758	\N	0	11	\N	16	12	16
14	2025-02-24 08:42:01.983	2025-02-24 08:42:01.983	\N	0	11	\N	17	13	17
15	2025-02-24 08:48:23.164	2025-02-24 08:48:23.164	\N	0	12	\N	18	14	18
16	2025-02-25 07:09:33.888	2025-02-25 07:09:33.888	\N	0	11	\N	19	15	19
\.


--
-- Data for Name: records_description; Type: TABLE DATA; Schema: public; Owner: postgress
--

COPY public.records_description (id, "createdAt", "updatedAt", "deletedAt") FROM stdin;
1	2025-02-20 11:36:57.323	2025-02-20 11:36:57.323	\N
2	2025-02-20 11:38:14.743	2025-02-20 11:38:14.743	\N
3	2025-02-20 11:38:14.743	2025-02-20 11:38:14.743	\N
4	2025-02-20 11:46:23.95	2025-02-20 11:46:23.951	\N
5	2025-02-20 11:46:23.95	2025-02-20 11:46:23.951	\N
6	2025-02-20 11:55:23.454	2025-02-20 11:55:23.454	\N
7	2025-02-21 12:56:00.592	2025-02-21 12:56:00.592	\N
8	2025-02-21 18:21:16.057	2025-02-21 18:21:16.057	\N
9	2025-02-21 20:49:50.236	2025-02-21 20:49:50.237	\N
10	2025-02-21 20:49:50.236	2025-02-21 20:49:50.237	\N
11	2025-02-21 20:49:50.236	2025-02-21 20:49:50.237	\N
12	2025-02-21 20:49:50.236	2025-02-21 20:49:50.237	\N
13	2025-02-24 06:54:52.143	2025-02-24 06:54:52.143	\N
14	2025-02-24 06:54:52.143	2025-02-24 06:54:52.143	\N
15	2025-02-24 07:51:14.311	2025-02-24 07:51:14.311	\N
16	2025-02-24 07:54:55.55	2025-02-24 07:54:55.55	\N
17	2025-02-24 08:07:25.591	2025-02-24 08:07:25.592	\N
18	2025-02-24 08:07:25.591	2025-02-24 08:07:25.592	\N
19	2025-02-25 06:31:22.261	2025-02-25 06:31:22.261	\N
\.


--
-- Data for Name: records_description_value; Type: TABLE DATA; Schema: public; Owner: postgress
--

COPY public.records_description_value (id, "createdAt", "updatedAt", "deletedAt", value, lang, "recordDescriptionId") FROM stdin;
1	2025-02-20 11:36:57.323	2025-02-20 11:36:57.323	\N	test	ru-RU	1
3	2025-02-20 11:36:57.323	2025-02-20 11:36:57.323	\N	test	zh-CN	1
53	2025-02-24 08:07:25.591	2025-02-24 20:39:53.746531	\N	Мы предоставляем надежное и современное строительное оборудование, необходимое для успешного выполнения проектов любой сложности	ru-RU	18
4	2025-02-20 11:38:14.743	2025-02-20 11:38:14.743	\N	test	ru-RU	2
54	2025-02-24 08:07:25.591	2025-02-24 20:39:11.642047	\N	我们提供可靠且现代化的建筑设备，这些设备对于成功完成任何复杂项目的必要条件。	zh-CN	18
5	2025-02-20 11:38:14.743	2025-02-20 11:38:14.743	\N	test	en-US	2
6	2025-02-20 11:38:14.743	2025-02-20 11:38:14.743	\N	test	zh-CN	2
7	2025-02-20 11:38:14.743	2025-02-20 11:38:14.743	\N	<span data-metadata="<!--(figmeta)eyJmaWxlS2V5IjoiSlVQN0dKcTNNRWFTRUU3UVJERHBEWiIsInBhc3RlSUQiOjE2NTI4NzQ1MjIsImRhdGFUeXBlIjoic2NlbmUifQo=(/figmeta)-->"></span>В рамках Восточного экономического форума, проходившего во Владивостоке, SA International подписала стратегическое соглашение с правительством Российской Федерации о строительстве завода по производству портового оборудования. Этот проект станет важным шагом в развитии инфраструктуры российских портов и укреплении экономического сотрудничества между Китаем и Россией.	ru-RU	3
19	2025-02-21 12:56:00.592	2025-02-21 12:56:00.592	\N	Новая новость	en-US	7
23	2025-02-21 18:21:16.057	2025-02-21 18:21:16.057	\N	Due to the emerging difficulties in international payments between Russia and China, SA International held a series of seminars and meetings with representatives of banks and financial organizations. We have presented alternative solutions and mechanisms to ensure uninterrupted financial transactions and support our clients in the current environment.	en-US	8
37	2025-02-24 06:54:52.143	2025-02-24 06:54:52.143	\N		ru-RU	13
55	2025-02-25 06:31:22.261	2025-02-25 06:31:22.261	\N		ru-RU	19
8	2025-02-20 11:38:14.743	2025-02-20 11:38:14.743	\N	<span data-metadata="<!--(figmeta)eyJmaWxlS2V5IjoiSlVQN0dKcTNNRWFTRUU3UVJERHBEWiIsInBhc3RlSUQiOjE2NTI4NzQ1MjIsImRhdGFUeXBlIjoic2NlbmUifQo=(/figmeta)-->"></span><span style="white-space-collapse: preserve;">В рамках Восточного экономического форума, проходившего во Владивостоке, SA International подписала стратегическое соглашение с правительством Российской Федерации о строительстве завода по производству портового оборудования. Этот проект станет важным шагом в развитии инфраструктуры российских портов и укреплении экономического сотрудничества между Китаем и Россией.</span>	en-US	3
20	2025-02-21 12:56:00.592	2025-02-21 12:56:00.592	\N	Новая новость	ru-RU	7
24	2025-02-21 18:21:16.057	2025-02-21 18:21:16.057	\N	由于俄罗斯和中国之间的国际支付出现困难，SA International与银行和金融组织的代表举行了一系列研讨会和会议。 我们已经提出了替代的解决方案和机制，以确保不间断的金融交易和支持我们的客户在当前的环境。	zh-CN	8
38	2025-02-24 06:54:52.143	2025-02-24 06:54:52.143	\N		en-US	13
56	2025-02-25 06:31:22.261	2025-02-25 06:31:22.261	\N		en-US	19
9	2025-02-20 11:38:14.743	2025-02-20 11:38:14.743	\N	<span data-metadata="<!--(figmeta)eyJmaWxlS2V5IjoiSlVQN0dKcTNNRWFTRUU3UVJERHBEWiIsInBhc3RlSUQiOjE2NTI4NzQ1MjIsImRhdGFUeXBlIjoic2NlbmUifQo=(/figmeta)-->"></span><span style="white-space-collapse: preserve;">В рамках Восточного экономического форума, проходившего во Владивостоке, SA International подписала стратегическое соглашение с правительством Российской Федерации о строительстве завода по производству портового оборудования. Этот проект станет важным шагом в развитии инфраструктуры российских портов и укреплении экономического сотрудничества между Китаем и Россией.</span>	zh-CN	3
21	2025-02-21 12:56:00.592	2025-02-21 12:56:00.592	\N	Новая новость	zh-CN	7
22	2025-02-21 18:21:16.057	2025-02-21 19:47:37.722514	\N	В связи с возникающими трудностями в международных платежах между Россией и Китаем, SA International провела серию семинаров и встреч с представителями банков и финансовых организаций. Мы представили альтернативные решения и механизмы для обеспечения бесперебойных финансовых операций и поддержки наших клиентов в текущих условиях.	ru-RU	8
39	2025-02-24 06:54:52.143	2025-02-24 06:54:52.143	\N		zh-CN	13
57	2025-02-25 06:31:22.261	2025-02-25 06:31:22.261	\N		zh-CN	19
10	2025-02-20 11:46:23.95	2025-02-20 11:46:23.951	\N	tset1	ru-RU	4
25	2025-02-21 20:49:50.236	2025-02-21 20:49:50.237	\N		ru-RU	9
40	2025-02-24 06:54:52.143	2025-02-24 06:54:52.143	\N		ru-RU	14
11	2025-02-20 11:46:23.95	2025-02-20 11:46:23.951	\N	tset1	en-US	4
26	2025-02-21 20:49:50.236	2025-02-21 20:49:50.237	\N		en-US	9
41	2025-02-24 06:54:52.143	2025-02-24 06:54:52.143	\N		en-US	14
12	2025-02-20 11:46:23.95	2025-02-20 11:46:23.951	\N	tset1	zh-CN	4
27	2025-02-21 20:49:50.236	2025-02-21 20:49:50.237	\N		zh-CN	9
42	2025-02-24 06:54:52.143	2025-02-24 06:54:52.143	\N		zh-CN	14
13	2025-02-20 11:46:23.95	2025-02-20 11:46:23.951	\N	Новость 2	ru-RU	5
28	2025-02-21 20:49:50.236	2025-02-21 20:49:50.237	\N		en-US	10
43	2025-02-24 07:51:14.311	2025-02-24 07:51:14.311	\N		ru-RU	15
14	2025-02-20 11:46:23.95	2025-02-20 11:46:23.951	\N	Новость 2	en-US	5
29	2025-02-21 20:49:50.236	2025-02-21 20:49:50.237	\N		ru-RU	10
44	2025-02-24 07:51:14.311	2025-02-24 07:51:14.311	\N		zh-CN	15
15	2025-02-20 11:46:23.95	2025-02-20 11:46:23.951	\N	Новость 2	zh-CN	5
30	2025-02-21 20:49:50.236	2025-02-21 20:49:50.237	\N		zh-CN	10
45	2025-02-24 07:51:14.311	2025-02-24 07:51:14.311	\N		en-US	15
16	2025-02-20 11:55:23.454	2025-02-20 12:25:23.408431	\N	В рамках Восточного экономического форума, проходившего во Владивостоке, SA International подписала стратегическое соглашение с правительством Российской Федерации о строительстве завода по производству портового оборудования. Этот проект станет важным шагом в развитии инфраструктуры российских портов и укреплении экономического сотрудничества между Китаем и Россией.	ru-RU	6
31	2025-02-21 20:49:50.236	2025-02-21 20:49:50.237	\N	<div>Официальное заявление о подписании соглашения о строительстве завода по производству портового оборудования в России.</div><div><br></div>	ru-RU	11
46	2025-02-24 07:54:55.55	2025-02-24 08:21:21.870102	\N	<div>We offer comprehensive solutions for creating production lines fully adapted to your business needs.</div>	ru-RU	16
17	2025-02-20 11:55:23.454	2025-02-21 18:12:23.349095	\N	As part of the Eastern Economic Forum held in Vladivostok, SA International signed a strategic agreement with the Government of the Russian Federation on the construction of a plant for the production of port equipment. This project will be an important step in developing the infrastructure of Russian ports and strengthening economic cooperation between China and Russia.	en-US	6
32	2025-02-21 20:49:50.236	2025-02-21 20:49:50.237	\N	An official statement on the signing of an agreement on the construction of a plant for the production of port equipment in Russia.	en-US	11
47	2025-02-24 07:54:55.55	2025-02-24 08:21:21.871891	\N	<div>We offer comprehensive solutions for creating production lines fully adapted to your business needs.</div>	en-US	16
18	2025-02-20 11:55:23.454	2025-02-21 18:12:23.35045	\N	作为在符拉迪沃斯托克举行的东部经济论坛的一部分，SA International与俄罗斯联邦政府签署了一项关于建设港口设备生产工厂的战略协议。 该项目将是发展俄罗斯港口基础设施和加强中俄经济合作的重要一步。	zh-CN	6
33	2025-02-21 20:49:50.236	2025-02-21 20:49:50.237	\N	关于签署关于在俄罗斯建造港口设备生产工厂的协议的正式声明。	zh-CN	11
48	2025-02-24 07:54:55.55	2025-02-24 08:21:21.87175	\N	<div>我们提供全面的解决方案，打造完全适应您业务需求的生产线。</div><div><br></div>	zh-CN	16
34	2025-02-21 20:49:50.236	2025-02-21 20:49:50.237	\N	SA International объявляет о создании нового логистического подразделения, призванного улучшить качество и эффективность логистических услуг для наших клиентов.	ru-RU	12
49	2025-02-24 08:07:25.591	2025-02-24 08:07:25.592	\N		ru-RU	17
35	2025-02-21 20:49:50.236	2025-02-21 20:49:50.237	\N	SA International announces the creation of a new logistics division dedicated to improving the quality and efficiency of logistics services for our customers.	en-US	12
50	2025-02-24 08:07:25.591	2025-02-24 08:07:25.592	\N		zh-CN	17
36	2025-02-21 20:49:50.236	2025-02-21 20:49:50.237	\N	SA International宣布成立一个新的物流部门，致力于为我们的客户提高物流服务的质量和效率。	zh-CN	12
51	2025-02-24 08:07:25.591	2025-02-24 08:07:25.592	\N		en-US	17
52	2025-02-24 08:07:25.591	2025-02-24 20:39:11.641479	\N	We provide reliable and modern construction equipment necessary for the successful execution of projects of any complexity.&nbsp;	en-US	18
2	2025-02-20 11:36:57.323	2025-02-20 11:36:57.323	\N	test	en-US	1
\.


--
-- Data for Name: records_sections_pages_sections; Type: TABLE DATA; Schema: public; Owner: postgress
--

COPY public.records_sections_pages_sections ("recordsId", "pagesSectionsId") FROM stdin;
13	2
14	3
16	3
\.


--
-- Data for Name: records_seo; Type: TABLE DATA; Schema: public; Owner: postgress
--

COPY public.records_seo (id, "createdAt", "updatedAt", "deletedAt") FROM stdin;
1	2025-02-20 11:46:23.95	2025-02-20 11:46:23.951	\N
2	2025-02-20 11:55:23.454	2025-02-20 11:55:23.454	\N
3	2025-02-21 12:56:00.592	2025-02-21 12:56:00.592	\N
4	2025-02-21 18:21:16.057	2025-02-21 18:21:16.057	\N
5	2025-02-21 20:49:50.236	2025-02-21 20:49:50.237	\N
6	2025-02-21 20:49:50.236	2025-02-21 20:49:50.237	\N
7	2025-02-21 20:49:50.236	2025-02-21 20:49:50.237	\N
8	2025-02-21 20:49:50.236	2025-02-21 20:49:50.237	\N
9	2025-02-24 06:54:52.143	2025-02-24 06:54:52.143	\N
10	2025-02-24 06:54:52.143	2025-02-24 06:54:52.143	\N
11	2025-02-24 07:51:14.311	2025-02-24 07:51:14.311	\N
12	2025-02-24 07:54:55.55	2025-02-24 07:54:55.55	\N
13	2025-02-24 08:07:25.591	2025-02-24 08:07:25.592	\N
14	2025-02-24 08:07:25.591	2025-02-24 08:07:25.592	\N
15	2025-02-25 06:31:22.261	2025-02-25 06:31:22.261	\N
\.


--
-- Data for Name: records_seo_params; Type: TABLE DATA; Schema: public; Owner: postgress
--

COPY public.records_seo_params (id, "createdAt", "updatedAt", "deletedAt", content, lang, "fieldType", "recordSeoId") FROM stdin;
1	2025-02-20 11:46:23.95	2025-02-20 11:46:23.951	\N	Новость 2	ru-RU	title	1
2	2025-02-20 11:46:23.95	2025-02-20 11:46:23.951	\N	Новость 2 CH	zh-CN	title	1
3	2025-02-20 11:46:23.95	2025-02-20 11:46:23.951	\N	Новость 2	ru-RU	description	1
4	2025-02-20 11:46:23.95	2025-02-20 11:46:23.951	\N	Новость 2 EN	en-US	title	1
5	2025-02-20 11:46:23.95	2025-02-20 11:46:23.951	\N	Новость 2	ru-RU	keywords	1
6	2025-02-20 11:46:23.95	2025-02-20 11:46:23.951	\N	Новость 2 CH	zh-CN	description	1
7	2025-02-20 11:46:23.95	2025-02-20 11:46:23.951	\N	Новость 2 EN	en-US	keywords	1
8	2025-02-20 11:46:23.95	2025-02-20 11:46:23.951	\N	Новость 2 EN	en-US	description	1
9	2025-02-20 11:46:23.95	2025-02-20 11:46:23.951	\N	Новость 2 CH	zh-CN	keywords	1
10	2025-02-20 11:58:44.784	2025-02-20 11:58:44.784	\N	Новость 1  EN	en-US	description	\N
11	2025-02-20 11:58:44.784	2025-02-20 11:58:44.784	\N	Новость 1	ru-RU	description	\N
12	2025-02-20 11:58:44.784	2025-02-20 11:58:44.784	\N	Новость 1  EN	en-US	keywords	\N
13	2025-02-20 11:58:44.784	2025-02-20 11:58:44.784	\N	Новость 1  CH	zh-CN	title	\N
14	2025-02-20 11:58:44.784	2025-02-20 11:58:44.784	\N	Новость 1  EN	en-US	title	\N
15	2025-02-20 11:58:44.784	2025-02-20 11:58:44.784	\N	Новость 1	ru-RU	title	\N
16	2025-02-20 11:58:44.784	2025-02-20 11:58:44.784	\N	Новость 1  CH	zh-CN	description	\N
17	2025-02-20 11:58:44.784	2025-02-20 11:58:44.784	\N	Новость 1  CH	zh-CN	keywords	\N
18	2025-02-20 11:58:44.784	2025-02-20 11:58:44.784	\N	Новость 1	ru-RU	keywords	\N
19	2025-02-20 11:59:40.141	2025-02-20 11:59:40.141	\N	Новость 1	ru-RU	description	\N
20	2025-02-20 11:59:40.141	2025-02-20 11:59:40.141	\N	Новость 1	ru-RU	title	\N
21	2025-02-20 11:59:40.141	2025-02-20 11:59:40.141	\N	Новость 1	ru-RU	keywords	\N
22	2025-02-20 12:01:40.727	2025-02-20 12:01:40.727	\N	Новость 1	ru-RU	title	2
23	2025-02-20 12:01:40.727	2025-02-20 12:01:40.727	\N	Новость 1	ru-RU	keywords	2
24	2025-02-20 12:01:40.727	2025-02-20 12:01:40.727	\N	Новость 1	ru-RU	description	2
25	2025-02-20 12:01:40.727	2025-02-20 12:01:40.727	\N	Новость 1 EN	en-US	description	2
26	2025-02-20 12:01:40.727	2025-02-20 12:01:40.727	\N	Новость 1 EN	en-US	keywords	2
27	2025-02-20 12:01:40.727	2025-02-20 12:01:40.727	\N	Новость 1 EN	en-US	title	2
28	2025-02-20 12:01:40.727	2025-02-20 12:01:40.727	\N	Новость 1 CH	zh-CN	title	2
29	2025-02-20 12:01:40.727	2025-02-20 12:01:40.727	\N	Новость 1 CH	zh-CN	description	2
30	2025-02-20 12:01:40.727	2025-02-20 12:01:40.727	\N	Новость 1 CH	zh-CN	keywords	2
\.


--
-- Data for Name: records_title; Type: TABLE DATA; Schema: public; Owner: postgress
--

COPY public.records_title (id, "createdAt", "updatedAt", "deletedAt") FROM stdin;
1	2025-02-20 11:36:57.323	2025-02-20 11:36:57.323	\N
2	2025-02-20 11:38:14.743	2025-02-20 11:38:14.743	\N
3	2025-02-20 11:38:14.743	2025-02-20 11:38:14.743	\N
4	2025-02-20 11:46:23.95	2025-02-20 11:46:23.951	\N
5	2025-02-20 11:46:23.95	2025-02-20 11:46:23.951	\N
6	2025-02-20 11:55:23.454	2025-02-20 11:55:23.454	\N
7	2025-02-21 12:56:00.592	2025-02-21 12:56:00.592	\N
8	2025-02-21 18:21:16.057	2025-02-21 18:21:16.057	\N
9	2025-02-21 20:49:50.236	2025-02-21 20:49:50.237	\N
10	2025-02-21 20:49:50.236	2025-02-21 20:49:50.237	\N
11	2025-02-21 20:49:50.236	2025-02-21 20:49:50.237	\N
12	2025-02-21 20:49:50.236	2025-02-21 20:49:50.237	\N
13	2025-02-24 06:54:52.143	2025-02-24 06:54:52.143	\N
14	2025-02-24 06:54:52.143	2025-02-24 06:54:52.143	\N
15	2025-02-24 07:51:14.311	2025-02-24 07:51:14.311	\N
16	2025-02-24 07:54:55.55	2025-02-24 07:54:55.55	\N
17	2025-02-24 08:07:25.591	2025-02-24 08:07:25.592	\N
18	2025-02-24 08:07:25.591	2025-02-24 08:07:25.592	\N
19	2025-02-25 06:31:22.261	2025-02-25 06:31:22.261	\N
\.


--
-- Data for Name: records_title_value; Type: TABLE DATA; Schema: public; Owner: postgress
--

COPY public.records_title_value (id, "createdAt", "updatedAt", "deletedAt", value, lang, "recordTitleId") FROM stdin;
1	2025-02-20 11:36:57.323	2025-02-20 11:36:57.323	\N	test	ru-RU	1
3	2025-02-20 11:36:57.323	2025-02-20 11:36:57.323	\N	tse	zh-CN	1
53	2025-02-24 08:07:25.591	2025-02-24 08:07:25.592	\N	CONSTRUCTION EQUIPMENT	en-US	18
4	2025-02-20 11:38:14.743	2025-02-20 11:38:14.743	\N	test	ru-RU	2
54	2025-02-24 08:07:25.591	2025-02-24 08:07:25.592	\N	建筑设备	zh-CN	18
5	2025-02-20 11:38:14.743	2025-02-20 11:38:14.743	\N	test	en-US	2
6	2025-02-20 11:38:14.743	2025-02-20 11:38:14.743	\N	test	zh-CN	2
7	2025-02-20 11:38:14.743	2025-02-20 11:38:14.743	\N	Участие SA International на Восточном экономическом форуме (ВЭФ)	ru-RU	3
19	2025-02-21 12:56:00.592	2025-02-21 12:56:00.592	\N	Новая новость	ru-RU	7
22	2025-02-21 18:21:16.057	2025-02-21 18:21:16.057	\N	Проблемы с платежами из России в Китай и альтернативные подходы	ru-RU	8
37	2025-02-24 06:54:52.143	2025-02-24 06:54:52.143	\N	test	ru-RU	13
55	2025-02-25 06:31:22.261	2025-02-25 06:31:22.261	\N	Внедрение инновационных технологий	ru-RU	19
8	2025-02-20 11:38:14.743	2025-02-20 11:38:14.743	\N	Участие SA International на Восточном экономическом форуме (ВЭФ)	zh-CN	3
20	2025-02-21 12:56:00.592	2025-02-21 12:56:00.592	\N	Новая новость	en-US	7
23	2025-02-21 18:21:16.057	2025-02-21 18:21:16.057	\N	俄罗斯向中国付款的问题和替代方法	zh-CN	8
38	2025-02-24 06:54:52.143	2025-02-24 06:54:52.143	\N	test	zh-CN	13
56	2025-02-25 06:31:22.261	2025-02-25 06:31:22.261	\N	Implementation of Innovative Technologies	en-US	19
9	2025-02-20 11:38:14.743	2025-02-20 11:38:14.743	\N	Участие SA International на Восточном экономическом форуме (ВЭФ)	en-US	3
21	2025-02-21 12:56:00.592	2025-02-21 12:56:00.592	\N	Новая новость	zh-CN	7
24	2025-02-21 18:21:16.057	2025-02-21 18:21:16.057	\N	Problems with payments from Russia to China and alternative approaches	en-US	8
39	2025-02-24 06:54:52.143	2025-02-24 06:54:52.143	\N	test	en-US	13
57	2025-02-25 06:31:22.261	2025-02-25 06:31:22.261	\N	创新技术的实施	zh-CN	19
10	2025-02-20 11:46:23.95	2025-02-20 11:46:23.951	\N	tset1	ru-RU	4
25	2025-02-21 20:49:50.236	2025-02-21 20:49:50.237	\N	Решение проблем международных платежей: опыт SA International	ru-RU	9
40	2025-02-24 06:54:52.143	2025-02-24 06:54:52.143	\N	test	ru-RU	14
11	2025-02-20 11:46:23.95	2025-02-20 11:46:23.951	\N	tset1	zh-CN	4
26	2025-02-21 20:49:50.236	2025-02-21 20:49:50.237	\N	解决国际支付问题：SA国际的经验	zh-CN	9
41	2025-02-24 06:54:52.143	2025-02-24 06:54:52.143	\N	test	en-US	14
12	2025-02-20 11:46:23.95	2025-02-20 11:46:23.951	\N	tset1	en-US	4
27	2025-02-21 20:49:50.236	2025-02-21 20:49:50.237	\N	Solving problems of international payments: the experience of SA International	en-US	9
42	2025-02-24 06:54:52.143	2025-02-24 06:54:52.143	\N	tset	zh-CN	14
13	2025-02-20 11:46:23.95	2025-02-20 11:46:23.951	\N	Новость 2	en-US	5
28	2025-02-21 20:49:50.236	2025-02-21 20:49:50.237	\N	Обзор текущих вызовов в сфере международных финансовых операций между Россией и Китаем и представление эффективных альтернативных подходов	ru-RU	10
43	2025-02-24 07:51:14.311	2025-02-24 07:51:14.311	\N	test	ru-RU	15
14	2025-02-20 11:46:23.95	2025-02-20 11:46:23.951	\N	Новость 2	ru-RU	5
29	2025-02-21 20:49:50.236	2025-02-21 20:49:50.237	\N	俄罗斯和中国之间国际金融交易领域当前挑战的概述以及提出有效的替代方法	zh-CN	10
44	2025-02-24 07:51:14.311	2025-02-24 07:51:14.311	\N	test	en-US	15
15	2025-02-20 11:46:23.95	2025-02-20 11:46:23.951	\N	Новость 2	zh-CN	5
30	2025-02-21 20:49:50.236	2025-02-21 20:49:50.237	\N	An overview of current challenges in the field of international financial transactions between Russia and China and the presentation of effective alternative approaches	en-US	10
45	2025-02-24 07:51:14.311	2025-02-24 07:51:14.311	\N	tset	zh-CN	15
16	2025-02-20 11:55:23.454	2025-02-20 12:25:23.377442	\N	Участие SA International на Восточном экономическом форуме (ВЭФ)	ru-RU	6
31	2025-02-21 20:49:50.236	2025-02-21 20:49:50.237	\N	SA International подписывает соглашение с правительством РФ на ВЭФ	ru-RU	11
46	2025-02-24 07:54:55.55	2025-02-24 08:21:21.860163	\N	Производственные линии под ключ	ru-RU	16
17	2025-02-20 11:55:23.454	2025-02-21 18:12:23.345311	\N	SA International's participation in the Eastern Economic Forum (EEF)	en-US	6
32	2025-02-21 20:49:50.236	2025-02-21 20:49:50.237	\N	SA International signs agreement with the Government of the Russian Federation at the WEF	en-US	11
47	2025-02-24 07:54:55.55	2025-02-24 08:21:21.87049	\N	交钥匙生产线	zh-CN	16
18	2025-02-20 11:55:23.454	2025-02-21 18:12:23.344633	\N	SA国际参与东方经济论坛(EEF)	zh-CN	6
33	2025-02-21 20:49:50.236	2025-02-21 20:49:50.237	\N	SA国际在世界经济论坛与俄罗斯联邦政府签署协议	zh-CN	11
48	2025-02-24 07:54:55.55	2025-02-24 08:21:21.870776	\N	Turnkey Production Lines	en-US	16
34	2025-02-21 20:49:50.236	2025-02-21 20:49:50.237	\N	Официальный запуск SA Logistics	ru-RU	12
49	2025-02-24 08:07:25.591	2025-02-24 08:07:25.592	\N	Услуги по выбору оборудования	ru-RU	17
35	2025-02-21 20:49:50.236	2025-02-21 20:49:50.237	\N	The official launch of SA Logistics	en-US	12
50	2025-02-24 08:07:25.591	2025-02-24 08:07:25.592	\N	设备选型服务	zh-CN	17
36	2025-02-21 20:49:50.236	2025-02-21 20:49:50.237	\N	SA物流正式启动	zh-CN	12
51	2025-02-24 08:07:25.591	2025-02-24 08:07:25.592	\N	Equipment Selection Services	en-US	17
52	2025-02-24 08:07:25.591	2025-02-24 08:07:25.592	\N	СТРОИТЕЛЬНОЕ ОБОРУДОВАНИЕ 	ru-RU	18
2	2025-02-20 11:36:57.323	2025-02-20 11:36:57.323	\N	test	en-US	1
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

COPY public.settings (id, "createdAt", "updatedAt", "deletedAt", title, description, vk, facebook, viber, whatsapp, telegram, phone, email, "urlBitrix", "amoClientId", "amoClientSecret", "amoDomain", "amoBearer", discord, "linkedIn", instagram) FROM stdin;
1	2025-02-03 19:14:13.386	2025-02-22 20:03:38.30821	\N	Interco	Interco	https://vk.com/		https://vk.com/	https://vk.com/	https://web.telegram.org/k/	+7 (800) 000 - 00 00	info@inter-sa.com						https://discord.com/	https://careers.linkedin.cn/	https://www.instagram.com/
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
1	2025-02-03 19:14:13.386	2025-02-03 19:14:13.386	\N	t	Яковлев	Андрей	Сергеевич	ya.andreyi96@yandex.ru	$2b$10$D2iYjF4Mx.sng0Gl6p6oauSDQWuwSKFBzkb2AoEIW2lJJNHjn3pNW	admin
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

SELECT pg_catalog.setval('public.library_files_id_seq', 51, true);


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

SELECT pg_catalog.setval('public.pages_iblock_fields_id_seq', 90, true);


--
-- Name: pages_iblock_fields_label_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgress
--

SELECT pg_catalog.setval('public.pages_iblock_fields_label_id_seq', 270, true);


--
-- Name: pages_iblock_fields_records_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgress
--

SELECT pg_catalog.setval('public.pages_iblock_fields_records_id_seq', 1, false);


--
-- Name: pages_iblock_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgress
--

SELECT pg_catalog.setval('public.pages_iblock_id_seq', 24, true);


--
-- Name: pages_iblock_records_field_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgress
--

SELECT pg_catalog.setval('public.pages_iblock_records_field_id_seq', 224, true);


--
-- Name: pages_iblock_records_field_value_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgress
--

SELECT pg_catalog.setval('public.pages_iblock_records_field_value_id_seq', 708, true);


--
-- Name: pages_iblock_records_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgress
--

SELECT pg_catalog.setval('public.pages_iblock_records_id_seq', 56, true);


--
-- Name: pages_iblock_section_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgress
--

SELECT pg_catalog.setval('public.pages_iblock_section_id_seq', 4, true);


--
-- Name: pages_iblock_section_value_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgress
--

SELECT pg_catalog.setval('public.pages_iblock_section_value_id_seq', 16, true);


--
-- Name: pages_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgress
--

SELECT pg_catalog.setval('public.pages_id_seq', 12, true);


--
-- Name: pages_params_field_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgress
--

SELECT pg_catalog.setval('public.pages_params_field_id_seq', 27, true);


--
-- Name: pages_params_field_value_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgress
--

SELECT pg_catalog.setval('public.pages_params_field_value_id_seq', 54, true);


--
-- Name: pages_params_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgress
--

SELECT pg_catalog.setval('public.pages_params_id_seq', 13, true);


--
-- Name: pages_params_value_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgress
--

SELECT pg_catalog.setval('public.pages_params_value_id_seq', 1, false);


--
-- Name: pages_sections_description_value_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgress
--

SELECT pg_catalog.setval('public.pages_sections_description_value_id_seq', 6, true);


--
-- Name: pages_sections_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgress
--

SELECT pg_catalog.setval('public.pages_sections_id_seq', 3, true);


--
-- Name: pages_sections_title_value_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgress
--

SELECT pg_catalog.setval('public.pages_sections_title_value_id_seq', 6, true);


--
-- Name: pages_sections_value_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgress
--

SELECT pg_catalog.setval('public.pages_sections_value_id_seq', 3, true);


--
-- Name: pages_seo_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgress
--

SELECT pg_catalog.setval('public.pages_seo_id_seq', 8, true);


--
-- Name: pages_seo_params_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgress
--

SELECT pg_catalog.setval('public.pages_seo_params_id_seq', 72, true);


--
-- Name: records_description_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgress
--

SELECT pg_catalog.setval('public.records_description_id_seq', 19, true);


--
-- Name: records_description_value_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgress
--

SELECT pg_catalog.setval('public.records_description_value_id_seq', 57, true);


--
-- Name: records_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgress
--

SELECT pg_catalog.setval('public.records_id_seq', 16, true);


--
-- Name: records_seo_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgress
--

SELECT pg_catalog.setval('public.records_seo_id_seq', 15, true);


--
-- Name: records_seo_params_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgress
--

SELECT pg_catalog.setval('public.records_seo_params_id_seq', 30, true);


--
-- Name: records_title_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgress
--

SELECT pg_catalog.setval('public.records_title_id_seq', 19, true);


--
-- Name: records_title_value_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgress
--

SELECT pg_catalog.setval('public.records_title_value_id_seq', 57, true);


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
-- Name: pages_iblock_fields_records PK_2f1b29b4773b9cba807d41337ae; Type: CONSTRAINT; Schema: public; Owner: postgress
--

ALTER TABLE ONLY public.pages_iblock_fields_records
    ADD CONSTRAINT "PK_2f1b29b4773b9cba807d41337ae" PRIMARY KEY (id);


--
-- Name: callback PK_3120f6061b840c2605321da3947; Type: CONSTRAINT; Schema: public; Owner: postgress
--

ALTER TABLE ONLY public.callback
    ADD CONSTRAINT "PK_3120f6061b840c2605321da3947" PRIMARY KEY (id);


--
-- Name: pages_params_value PK_31f9ecdb1d5fde9da1c0858820c; Type: CONSTRAINT; Schema: public; Owner: postgress
--

ALTER TABLE ONLY public.pages_params_value
    ADD CONSTRAINT "PK_31f9ecdb1d5fde9da1c0858820c" PRIMARY KEY (id);


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
-- Name: pages_sections_value PK_8fe62e2de32b4714a4f1b76fedd; Type: CONSTRAINT; Schema: public; Owner: postgress
--

ALTER TABLE ONLY public.pages_sections_value
    ADD CONSTRAINT "PK_8fe62e2de32b4714a4f1b76fedd" PRIMARY KEY (id);


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
-- Name: records UQ_0b294cd175a264787d609315ba5; Type: CONSTRAINT; Schema: public; Owner: postgress
--

ALTER TABLE ONLY public.records
    ADD CONSTRAINT "UQ_0b294cd175a264787d609315ba5" UNIQUE ("descriptionId");


--
-- Name: records UQ_67fe1339b944fb02568867554bf; Type: CONSTRAINT; Schema: public; Owner: postgress
--

ALTER TABLE ONLY public.records
    ADD CONSTRAINT "UQ_67fe1339b944fb02568867554bf" UNIQUE ("seoId");


--
-- Name: pages UQ_a5f09c91bfe53121be839fd5754; Type: CONSTRAINT; Schema: public; Owner: postgress
--

ALTER TABLE ONLY public.pages
    ADD CONSTRAINT "UQ_a5f09c91bfe53121be839fd5754" UNIQUE ("seoId");


--
-- Name: records UQ_e818af141fb00405011ff5ee1ef; Type: CONSTRAINT; Schema: public; Owner: postgress
--

ALTER TABLE ONLY public.records
    ADD CONSTRAINT "UQ_e818af141fb00405011ff5ee1ef" UNIQUE ("titleId");


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
-- Name: pages_params_value FK_4bbad71088a1ac92f7a02b0ad9c; Type: FK CONSTRAINT; Schema: public; Owner: postgress
--

ALTER TABLE ONLY public.pages_params_value
    ADD CONSTRAINT "FK_4bbad71088a1ac92f7a02b0ad9c" FOREIGN KEY ("recordId") REFERENCES public.records(id);


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
-- Name: pages_params_value FK_733eb052add03e4e666e54fd6cb; Type: FK CONSTRAINT; Schema: public; Owner: postgress
--

ALTER TABLE ONLY public.pages_params_value
    ADD CONSTRAINT "FK_733eb052add03e4e666e54fd6cb" FOREIGN KEY ("paramsId") REFERENCES public.pages_params(id);


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
-- Name: pages_sections_value FK_afa2aabe8bdc8cb98f9ae84bada; Type: FK CONSTRAINT; Schema: public; Owner: postgress
--

ALTER TABLE ONLY public.pages_sections_value
    ADD CONSTRAINT "FK_afa2aabe8bdc8cb98f9ae84bada" FOREIGN KEY ("sectionId") REFERENCES public.pages_sections(id);


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

