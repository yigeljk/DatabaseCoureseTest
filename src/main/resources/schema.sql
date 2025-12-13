--
-- PostgreSQL database dump
--

-- Dumped from database version 15.13 (Debian 15.13-1.pgdg120+1)
-- Dumped by pg_dump version 15.13 (Debian 15.13-1.pgdg120+1)

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
-- Name: grade_category; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.grade_category AS ENUM (
    '主观题',
    '客观题',
    '半开放'
    );


ALTER TYPE public.grade_category OWNER TO postgres;

--
-- Name: homework_category; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.homework_category AS ENUM (
    '客观题',
    '半开放',
    '主观'
    );


ALTER TYPE public.homework_category OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: admin; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.admin (
                              id integer NOT NULL,
                              user_id integer NOT NULL,
                              name character varying(255),
                              phone character varying(255),
                              email character varying(255)
);


ALTER TABLE public.admin OWNER TO postgres;

--
-- Name: admin_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.admin_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.admin_id_seq OWNER TO postgres;

--
-- Name: admin_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.admin_id_seq OWNED BY public.admin.id;


--
-- Name: admin_menu; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.admin_menu (
                                   id integer NOT NULL,
                                   path character varying(64),
                                   name character varying(64),
                                   name_zh character varying(64),
                                   icon_cls character varying(64),
                                   component character varying(64),
                                   parent_id integer
);


ALTER TABLE public.admin_menu OWNER TO postgres;

--
-- Name: admin_menu_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.admin_menu_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.admin_menu_id_seq OWNER TO postgres;

--
-- Name: admin_menu_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.admin_menu_id_seq OWNED BY public.admin_menu.id;


--
-- Name: admin_permission; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.admin_permission (
                                         id integer NOT NULL,
                                         name character varying(100),
                                         desc_ character varying(100),
                                         url character varying(100)
);


ALTER TABLE public.admin_permission OWNER TO postgres;

--
-- Name: admin_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.admin_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.admin_permission_id_seq OWNER TO postgres;

--
-- Name: admin_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.admin_permission_id_seq OWNED BY public.admin_permission.id;


--
-- Name: admin_role; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.admin_role (
                                   id integer NOT NULL,
                                   name character varying(100),
                                   name_zh character varying(100),
                                   enabled boolean
);


ALTER TABLE public.admin_role OWNER TO postgres;

--
-- Name: admin_role_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.admin_role_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.admin_role_id_seq OWNER TO postgres;

--
-- Name: admin_role_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.admin_role_id_seq OWNED BY public.admin_role.id;


--
-- Name: admin_role_menu; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.admin_role_menu (
                                        id integer NOT NULL,
                                        rid integer,
                                        mid integer
);


ALTER TABLE public.admin_role_menu OWNER TO postgres;

--
-- Name: admin_role_menu_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.admin_role_menu_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.admin_role_menu_id_seq OWNER TO postgres;

--
-- Name: admin_role_menu_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.admin_role_menu_id_seq OWNED BY public.admin_role_menu.id;


--
-- Name: admin_role_permission; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.admin_role_permission (
                                              id integer NOT NULL,
                                              rid integer,
                                              pid integer
);


ALTER TABLE public.admin_role_permission OWNER TO postgres;

--
-- Name: admin_role_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.admin_role_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.admin_role_permission_id_seq OWNER TO postgres;

--
-- Name: admin_role_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.admin_role_permission_id_seq OWNED BY public.admin_role_permission.id;


--
-- Name: admin_user_role; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.admin_user_role (
                                        id integer NOT NULL,
                                        uid integer,
                                        rid integer
);


ALTER TABLE public.admin_user_role OWNER TO postgres;

--
-- Name: admin_user_role_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.admin_user_role_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.admin_user_role_id_seq OWNER TO postgres;

--
-- Name: admin_user_role_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.admin_user_role_id_seq OWNED BY public.admin_user_role.id;


--
-- Name: book; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.book (
                             id integer NOT NULL,
                             cover character varying(255) DEFAULT ''::character varying,
                             title character varying(255) DEFAULT ''::character varying NOT NULL,
                             author character varying(255) DEFAULT ''::character varying,
                             date character varying(20) DEFAULT ''::character varying,
                             press character varying(255) DEFAULT ''::character varying,
                             abs character varying(255),
                             cid integer
);


ALTER TABLE public.book OWNER TO postgres;

--
-- Name: book_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.book_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.book_id_seq OWNER TO postgres;

--
-- Name: book_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.book_id_seq OWNED BY public.book.id;


--
-- Name: category; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.category (
                                 id integer NOT NULL,
                                 name character varying(255) NOT NULL
);


ALTER TABLE public.category OWNER TO postgres;

--
-- Name: grade; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.grade (
                              student_id integer NOT NULL,
                              homework_id integer NOT NULL,
                              score numeric(5,2),
                              completed boolean NOT NULL,
                              category public.grade_category NOT NULL,
                              homework_name character varying(255) NOT NULL,
                              description text,
                              cross_check boolean DEFAULT false
);


ALTER TABLE public.grade OWNER TO postgres;

--
-- Name: homework; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.homework (
                                 id integer NOT NULL,
                                 name character varying(255) NOT NULL,
                                 category public.homework_category NOT NULL
);


ALTER TABLE public.homework OWNER TO postgres;

--
-- Name: homework_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.homework_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.homework_id_seq OWNER TO postgres;

--
-- Name: homework_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.homework_id_seq OWNED BY public.homework.id;


--
-- Name: jotter_article; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.jotter_article (
                                       id integer NOT NULL,
                                       article_title character varying(255),
                                       article_content_html text,
                                       article_content_md text,
                                       article_abstract character varying(255),
                                       article_cover character varying(255),
                                       article_date timestamp without time zone
);


ALTER TABLE public.jotter_article OWNER TO postgres;

--
-- Name: jotter_article_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.jotter_article_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.jotter_article_id_seq OWNER TO postgres;

--
-- Name: jotter_article_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.jotter_article_id_seq OWNED BY public.jotter_article.id;


--
-- Name: student; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.student (
                                id integer NOT NULL,
                                user_id integer NOT NULL,
                                name character varying(255),
                                phone character varying(255),
                                email character varying(255)
);


ALTER TABLE public.student OWNER TO postgres;

--
-- Name: student_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.student_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.student_id_seq OWNER TO postgres;

--
-- Name: student_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.student_id_seq OWNED BY public.student.id;


--
-- Name: user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."user" (
                               id integer NOT NULL,
                               username character varying(255) NOT NULL,
                               password character varying(255),
                               salt character varying(255),
                               name character varying(255),
                               phone character varying(255),
                               email character varying(255),
                               enabled boolean
);


ALTER TABLE public."user" OWNER TO postgres;

--
-- Name: user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_id_seq OWNER TO postgres;

--
-- Name: user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.user_id_seq OWNED BY public."user".id;


--
-- Name: admin id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin ALTER COLUMN id SET DEFAULT nextval('public.admin_id_seq'::regclass);


--
-- Name: admin_menu id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin_menu ALTER COLUMN id SET DEFAULT nextval('public.admin_menu_id_seq'::regclass);


--
-- Name: admin_permission id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin_permission ALTER COLUMN id SET DEFAULT nextval('public.admin_permission_id_seq'::regclass);


--
-- Name: admin_role id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin_role ALTER COLUMN id SET DEFAULT nextval('public.admin_role_id_seq'::regclass);


--
-- Name: admin_role_menu id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin_role_menu ALTER COLUMN id SET DEFAULT nextval('public.admin_role_menu_id_seq'::regclass);


--
-- Name: admin_role_permission id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin_role_permission ALTER COLUMN id SET DEFAULT nextval('public.admin_role_permission_id_seq'::regclass);


--
-- Name: admin_user_role id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin_user_role ALTER COLUMN id SET DEFAULT nextval('public.admin_user_role_id_seq'::regclass);


--
-- Name: book id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.book ALTER COLUMN id SET DEFAULT nextval('public.book_id_seq'::regclass);


--
-- Name: homework id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.homework ALTER COLUMN id SET DEFAULT nextval('public.homework_id_seq'::regclass);


--
-- Name: jotter_article id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.jotter_article ALTER COLUMN id SET DEFAULT nextval('public.jotter_article_id_seq'::regclass);


--
-- Name: student id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.student ALTER COLUMN id SET DEFAULT nextval('public.student_id_seq'::regclass);


--
-- Name: user id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."user" ALTER COLUMN id SET DEFAULT nextval('public.user_id_seq'::regclass);


--
-- Name: admin_menu admin_menu_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin_menu
    ADD CONSTRAINT admin_menu_pkey PRIMARY KEY (id);


--
-- Name: admin_permission admin_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin_permission
    ADD CONSTRAINT admin_permission_pkey PRIMARY KEY (id);


--
-- Name: admin admin_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin
    ADD CONSTRAINT admin_pkey PRIMARY KEY (id);


--
-- Name: admin_role_menu admin_role_menu_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin_role_menu
    ADD CONSTRAINT admin_role_menu_pkey PRIMARY KEY (id);


--
-- Name: admin_role_permission admin_role_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin_role_permission
    ADD CONSTRAINT admin_role_permission_pkey PRIMARY KEY (id);


--
-- Name: admin_role admin_role_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin_role
    ADD CONSTRAINT admin_role_pkey PRIMARY KEY (id);


--
-- Name: admin admin_user_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin
    ADD CONSTRAINT admin_user_id_key UNIQUE (user_id);


--
-- Name: admin_user_role admin_user_role_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin_user_role
    ADD CONSTRAINT admin_user_role_pkey PRIMARY KEY (id);


--
-- Name: book book_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.book
    ADD CONSTRAINT book_pkey PRIMARY KEY (id);


--
-- Name: category category_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.category
    ADD CONSTRAINT category_pkey PRIMARY KEY (id);


--
-- Name: grade grade_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.grade
    ADD CONSTRAINT grade_pkey PRIMARY KEY (student_id, homework_id);


--
-- Name: homework homework_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.homework
    ADD CONSTRAINT homework_pkey PRIMARY KEY (id);


--
-- Name: jotter_article jotter_article_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.jotter_article
    ADD CONSTRAINT jotter_article_pkey PRIMARY KEY (id);


--
-- Name: student student_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.student
    ADD CONSTRAINT student_pkey PRIMARY KEY (id);


--
-- Name: student student_user_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.student
    ADD CONSTRAINT student_user_id_key UNIQUE (user_id);


--
-- Name: user user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_pkey PRIMARY KEY (id);


--
-- Name: admin fk_admin_user; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin
    ADD CONSTRAINT fk_admin_user FOREIGN KEY (user_id) REFERENCES public."user"(id) ON DELETE CASCADE;


--
-- Name: admin_user_role fk_operator_role_role; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin_user_role
    ADD CONSTRAINT fk_operator_role_role FOREIGN KEY (rid) REFERENCES public.admin_role(id);


--
-- Name: admin_user_role fk_operator_role_user; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin_user_role
    ADD CONSTRAINT fk_operator_role_user FOREIGN KEY (uid) REFERENCES public."user"(id);


--
-- Name: admin_role_permission fk_role_permission_permission; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin_role_permission
    ADD CONSTRAINT fk_role_permission_permission FOREIGN KEY (pid) REFERENCES public.admin_permission(id);


--
-- Name: admin_role_permission fk_role_permission_role; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin_role_permission
    ADD CONSTRAINT fk_role_permission_role FOREIGN KEY (rid) REFERENCES public.admin_role(id);


--
-- Name: student fk_student_user; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.student
    ADD CONSTRAINT fk_student_user FOREIGN KEY (user_id) REFERENCES public."user"(id) ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

