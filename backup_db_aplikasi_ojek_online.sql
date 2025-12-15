--
-- PostgreSQL database dump
--

-- Dumped from database version 15.5
-- Dumped by pg_dump version 15.5

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

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: admins; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.admins (
    id bigint NOT NULL,
    user_id bigint,
    name character varying(100)
);


ALTER TABLE public.admins OWNER TO postgres;

--
-- Name: admins_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.admins_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.admins_id_seq OWNER TO postgres;

--
-- Name: admins_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.admins_id_seq OWNED BY public.admins.id;


--
-- Name: customers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.customers (
    id bigint NOT NULL,
    user_id bigint,
    name character varying(100),
    phone character varying(20)
);


ALTER TABLE public.customers OWNER TO postgres;

--
-- Name: customers_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.customers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.customers_id_seq OWNER TO postgres;

--
-- Name: customers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.customers_id_seq OWNED BY public.customers.id;


--
-- Name: driver_ratings; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.driver_ratings (
    id bigint NOT NULL,
    order_id bigint,
    driver_id bigint,
    rating integer,
    comment text,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT driver_ratings_rating_check CHECK (((rating >= 1) AND (rating <= 5)))
);


ALTER TABLE public.driver_ratings OWNER TO postgres;

--
-- Name: driver_ratings_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.driver_ratings_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.driver_ratings_id_seq OWNER TO postgres;

--
-- Name: driver_ratings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.driver_ratings_id_seq OWNED BY public.driver_ratings.id;


--
-- Name: drivers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.drivers (
    id bigint NOT NULL,
    user_id bigint,
    vehicle_type character varying(50),
    plate_number character varying(20),
    is_available boolean DEFAULT true
);


ALTER TABLE public.drivers OWNER TO postgres;

--
-- Name: drivers_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.drivers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.drivers_id_seq OWNER TO postgres;

--
-- Name: drivers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.drivers_id_seq OWNED BY public.drivers.id;


--
-- Name: locations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.locations (
    id bigint NOT NULL,
    area_name character varying(100)
);


ALTER TABLE public.locations OWNER TO postgres;

--
-- Name: locations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.locations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.locations_id_seq OWNER TO postgres;

--
-- Name: locations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.locations_id_seq OWNED BY public.locations.id;


--
-- Name: login_logs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.login_logs (
    id bigint NOT NULL,
    user_id bigint,
    action character varying(10),
    action_time timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.login_logs OWNER TO postgres;

--
-- Name: login_logs_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.login_logs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.login_logs_id_seq OWNER TO postgres;

--
-- Name: login_logs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.login_logs_id_seq OWNED BY public.login_logs.id;


--
-- Name: order_status_logs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.order_status_logs (
    id bigint NOT NULL,
    order_id bigint,
    status character varying(30),
    changed_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.order_status_logs OWNER TO postgres;

--
-- Name: order_status_logs_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.order_status_logs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.order_status_logs_id_seq OWNER TO postgres;

--
-- Name: order_status_logs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.order_status_logs_id_seq OWNED BY public.order_status_logs.id;


--
-- Name: orders; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.orders (
    id bigint NOT NULL,
    customer_id bigint,
    driver_id bigint,
    pickup_location_id bigint,
    dropoff_location_id bigint,
    order_time timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    completed_at timestamp without time zone,
    fare numeric(10,2)
);


ALTER TABLE public.orders OWNER TO postgres;

--
-- Name: orders_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.orders_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.orders_id_seq OWNER TO postgres;

--
-- Name: orders_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.orders_id_seq OWNED BY public.orders.id;


--
-- Name: user_registrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_registrations (
    id bigint NOT NULL,
    user_id bigint,
    method character varying(30),
    status character varying(30),
    registered_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.user_registrations OWNER TO postgres;

--
-- Name: user_registrations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.user_registrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_registrations_id_seq OWNER TO postgres;

--
-- Name: user_registrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.user_registrations_id_seq OWNED BY public.user_registrations.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id bigint NOT NULL,
    email character varying(100) NOT NULL,
    password text NOT NULL,
    role character varying(20),
    is_active boolean DEFAULT true,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT users_role_check CHECK (((role)::text = ANY ((ARRAY['admin'::character varying, 'customer'::character varying, 'driver'::character varying])::text[])))
);


ALTER TABLE public.users OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: admins id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admins ALTER COLUMN id SET DEFAULT nextval('public.admins_id_seq'::regclass);


--
-- Name: customers id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customers ALTER COLUMN id SET DEFAULT nextval('public.customers_id_seq'::regclass);


--
-- Name: driver_ratings id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.driver_ratings ALTER COLUMN id SET DEFAULT nextval('public.driver_ratings_id_seq'::regclass);


--
-- Name: drivers id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.drivers ALTER COLUMN id SET DEFAULT nextval('public.drivers_id_seq'::regclass);


--
-- Name: locations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.locations ALTER COLUMN id SET DEFAULT nextval('public.locations_id_seq'::regclass);


--
-- Name: login_logs id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.login_logs ALTER COLUMN id SET DEFAULT nextval('public.login_logs_id_seq'::regclass);


--
-- Name: order_status_logs id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_status_logs ALTER COLUMN id SET DEFAULT nextval('public.order_status_logs_id_seq'::regclass);


--
-- Name: orders id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders ALTER COLUMN id SET DEFAULT nextval('public.orders_id_seq'::regclass);


--
-- Name: user_registrations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_registrations ALTER COLUMN id SET DEFAULT nextval('public.user_registrations_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: admins; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.admins (id, user_id, name) FROM stdin;
1	1	Admin Utama
2	2	Admin Operasional
\.


--
-- Data for Name: customers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.customers (id, user_id, name, phone) FROM stdin;
1	3	Andi	0811111111
2	4	Budi	0812222222
3	5	Citra	0813333333
4	6	Dewi	0814444444
5	7	Eka	0815555555
\.


--
-- Data for Name: driver_ratings; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.driver_ratings (id, order_id, driver_id, rating, comment, created_at) FROM stdin;
1	1	1	5	Sangat baik	2025-12-15 09:03:45.931532
2	2	2	4	Baik	2025-12-15 09:03:45.931532
3	3	3	5	Cepat	2025-12-15 09:03:45.931532
4	4	4	4	Aman	2025-12-15 09:03:45.931532
5	5	5	5	Ramah	2025-12-15 09:03:45.931532
6	6	2	4	Cukup	2025-12-15 09:03:45.931532
7	7	3	5	Mantap	2025-12-15 09:03:45.931532
8	8	4	3	Lumayan	2025-12-15 09:03:45.931532
9	9	5	4	Baik	2025-12-15 09:03:45.931532
10	10	1	5	Top	2025-12-15 09:03:45.931532
\.


--
-- Data for Name: drivers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.drivers (id, user_id, vehicle_type, plate_number, is_available) FROM stdin;
1	8	Motor	B 1234 AA	t
2	9	Motor	B 2345 BB	t
3	10	Mobil	B 3456 CC	t
4	11	Motor	B 4567 DD	t
5	12	Mobil	B 5678 EE	t
\.


--
-- Data for Name: locations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.locations (id, area_name) FROM stdin;
1	Jakarta Selatan
2	Jakarta Barat
3	Jakarta Timur
4	Jakarta Utara
5	Jakarta Pusat
6	Depok
7	Bekasi
8	Tangerang
9	Bogor
10	Bandung
\.


--
-- Data for Name: login_logs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.login_logs (id, user_id, action, action_time) FROM stdin;
1	3	login	2025-12-15 09:03:40.779223
2	3	logout	2025-12-15 09:03:40.779223
3	4	login	2025-12-15 09:03:40.779223
4	4	logout	2025-12-15 09:03:40.779223
5	5	login	2025-12-15 09:03:40.779223
6	6	login	2025-12-15 09:03:40.779223
7	7	login	2025-12-15 09:03:40.779223
8	8	login	2025-12-15 09:03:40.779223
9	9	login	2025-12-15 09:03:40.779223
10	10	login	2025-12-15 09:03:40.779223
\.


--
-- Data for Name: order_status_logs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.order_status_logs (id, order_id, status, changed_at) FROM stdin;
1	1	created	2025-12-15 09:03:32.975784
2	1	completed	2025-12-15 09:03:32.975784
3	2	created	2025-12-15 09:03:32.975784
4	2	completed	2025-12-15 09:03:32.975784
5	3	created	2025-12-15 09:03:32.975784
6	3	completed	2025-12-15 09:03:32.975784
7	4	created	2025-12-15 09:03:32.975784
8	4	completed	2025-12-15 09:03:32.975784
9	5	created	2025-12-15 09:03:32.975784
10	5	completed	2025-12-15 09:03:32.975784
\.


--
-- Data for Name: orders; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.orders (id, customer_id, driver_id, pickup_location_id, dropoff_location_id, order_time, completed_at, fare) FROM stdin;
1	1	1	1	2	2024-01-01 08:00:00	2024-01-01 08:30:00	25000.00
2	2	2	2	3	2024-01-02 09:00:00	2024-01-02 09:40:00	30000.00
3	3	3	3	4	2024-02-01 10:00:00	2024-02-01 10:25:00	20000.00
4	4	4	4	5	2024-02-05 11:00:00	2024-02-05 11:50:00	35000.00
5	5	5	5	6	2024-02-10 12:00:00	2024-02-10 12:45:00	40000.00
6	1	2	6	7	2024-03-01 13:00:00	2024-03-01 13:30:00	22000.00
7	2	3	7	8	2024-03-03 14:00:00	2024-03-03 14:40:00	28000.00
8	3	4	8	9	2024-03-05 15:00:00	2024-03-05 15:55:00	37000.00
9	4	5	9	10	2024-03-07 16:00:00	2024-03-07 16:35:00	26000.00
10	5	1	10	1	2024-03-10 17:00:00	2024-03-10 17:50:00	45000.00
\.


--
-- Data for Name: user_registrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.user_registrations (id, user_id, method, status, registered_at) FROM stdin;
1	1	email	success	2025-12-15 09:03:03.941448
2	2	email	success	2025-12-15 09:03:03.941448
3	3	google	success	2025-12-15 09:03:03.941448
4	4	email	success	2025-12-15 09:03:03.941448
5	5	facebook	success	2025-12-15 09:03:03.941448
6	6	email	success	2025-12-15 09:03:03.941448
7	7	email	success	2025-12-15 09:03:03.941448
8	8	email	success	2025-12-15 09:03:03.941448
9	9	email	success	2025-12-15 09:03:03.941448
10	10	email	success	2025-12-15 09:03:03.941448
11	11	email	success	2025-12-15 09:03:03.941448
12	12	email	success	2025-12-15 09:03:03.941448
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, email, password, role, is_active, created_at) FROM stdin;
1	admin1@lumoshive.com	hash1	admin	t	2025-12-15 09:02:58.809879
2	admin2@lumoshive.com	hash2	admin	t	2025-12-15 09:02:58.809879
3	cust1@mail.com	hash3	customer	t	2025-12-15 09:02:58.809879
4	cust2@mail.com	hash4	customer	t	2025-12-15 09:02:58.809879
5	cust3@mail.com	hash5	customer	t	2025-12-15 09:02:58.809879
6	cust4@mail.com	hash6	customer	t	2025-12-15 09:02:58.809879
7	cust5@mail.com	hash7	customer	t	2025-12-15 09:02:58.809879
8	driver1@mail.com	hash8	driver	t	2025-12-15 09:02:58.809879
9	driver2@mail.com	hash9	driver	t	2025-12-15 09:02:58.809879
10	driver3@mail.com	hash10	driver	t	2025-12-15 09:02:58.809879
11	driver4@mail.com	hash11	driver	t	2025-12-15 09:02:58.809879
12	driver5@mail.com	hash12	driver	t	2025-12-15 09:02:58.809879
\.


--
-- Name: admins_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.admins_id_seq', 2, true);


--
-- Name: customers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.customers_id_seq', 5, true);


--
-- Name: driver_ratings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.driver_ratings_id_seq', 10, true);


--
-- Name: drivers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.drivers_id_seq', 5, true);


--
-- Name: locations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.locations_id_seq', 10, true);


--
-- Name: login_logs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.login_logs_id_seq', 10, true);


--
-- Name: order_status_logs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.order_status_logs_id_seq', 10, true);


--
-- Name: orders_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.orders_id_seq', 10, true);


--
-- Name: user_registrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.user_registrations_id_seq', 12, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 12, true);


--
-- Name: admins admins_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_pkey PRIMARY KEY (id);


--
-- Name: customers customers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customers
    ADD CONSTRAINT customers_pkey PRIMARY KEY (id);


--
-- Name: driver_ratings driver_ratings_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.driver_ratings
    ADD CONSTRAINT driver_ratings_pkey PRIMARY KEY (id);


--
-- Name: drivers drivers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.drivers
    ADD CONSTRAINT drivers_pkey PRIMARY KEY (id);


--
-- Name: locations locations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.locations
    ADD CONSTRAINT locations_pkey PRIMARY KEY (id);


--
-- Name: login_logs login_logs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.login_logs
    ADD CONSTRAINT login_logs_pkey PRIMARY KEY (id);


--
-- Name: order_status_logs order_status_logs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_status_logs
    ADD CONSTRAINT order_status_logs_pkey PRIMARY KEY (id);


--
-- Name: orders orders_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (id);


--
-- Name: user_registrations user_registrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_registrations
    ADD CONSTRAINT user_registrations_pkey PRIMARY KEY (id);


--
-- Name: users users_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: admins admins_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: customers customers_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customers
    ADD CONSTRAINT customers_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: driver_ratings driver_ratings_driver_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.driver_ratings
    ADD CONSTRAINT driver_ratings_driver_id_fkey FOREIGN KEY (driver_id) REFERENCES public.drivers(id);


--
-- Name: driver_ratings driver_ratings_order_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.driver_ratings
    ADD CONSTRAINT driver_ratings_order_id_fkey FOREIGN KEY (order_id) REFERENCES public.orders(id);


--
-- Name: drivers drivers_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.drivers
    ADD CONSTRAINT drivers_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: login_logs login_logs_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.login_logs
    ADD CONSTRAINT login_logs_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: order_status_logs order_status_logs_order_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_status_logs
    ADD CONSTRAINT order_status_logs_order_id_fkey FOREIGN KEY (order_id) REFERENCES public.orders(id);


--
-- Name: orders orders_customer_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_customer_id_fkey FOREIGN KEY (customer_id) REFERENCES public.customers(id);


--
-- Name: orders orders_driver_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_driver_id_fkey FOREIGN KEY (driver_id) REFERENCES public.drivers(id);


--
-- Name: orders orders_dropoff_location_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_dropoff_location_id_fkey FOREIGN KEY (dropoff_location_id) REFERENCES public.locations(id);


--
-- Name: orders orders_pickup_location_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pickup_location_id_fkey FOREIGN KEY (pickup_location_id) REFERENCES public.locations(id);


--
-- Name: user_registrations user_registrations_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_registrations
    ADD CONSTRAINT user_registrations_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- PostgreSQL database dump complete
--

