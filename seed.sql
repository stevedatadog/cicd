--
-- PostgreSQL database dump
--

-- Dumped from database version 13.1
-- Dumped by pg_dump version 13.1

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
-- Name: access; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.access (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    repo_id bigint NOT NULL,
    mode bigint NOT NULL
);


ALTER TABLE public.access OWNER TO postgres;

--
-- Name: access_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.access_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.access_id_seq OWNER TO postgres;

--
-- Name: access_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.access_id_seq OWNED BY public.access.id;


--
-- Name: access_token; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.access_token (
    id bigint NOT NULL,
    uid bigint,
    name text,
    sha1 character varying(40),
    created_unix bigint,
    updated_unix bigint
);


ALTER TABLE public.access_token OWNER TO postgres;

--
-- Name: access_token_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.access_token_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.access_token_id_seq OWNER TO postgres;

--
-- Name: access_token_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.access_token_id_seq OWNED BY public.access_token.id;


--
-- Name: action; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.action (
    id bigint NOT NULL,
    user_id bigint,
    op_type integer,
    act_user_id bigint,
    act_user_name character varying(255),
    repo_id bigint,
    repo_user_name character varying(255),
    repo_name character varying(255),
    ref_name character varying(255),
    is_private boolean DEFAULT false NOT NULL,
    content text,
    created_unix bigint
);


ALTER TABLE public.action OWNER TO postgres;

--
-- Name: action_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.action_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.action_id_seq OWNER TO postgres;

--
-- Name: action_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.action_id_seq OWNED BY public.action.id;


--
-- Name: attachment; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.attachment (
    id bigint NOT NULL,
    uuid uuid,
    issue_id bigint,
    comment_id bigint,
    release_id bigint,
    name character varying(255),
    created_unix bigint
);


ALTER TABLE public.attachment OWNER TO postgres;

--
-- Name: attachment_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.attachment_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.attachment_id_seq OWNER TO postgres;

--
-- Name: attachment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.attachment_id_seq OWNED BY public.attachment.id;


--
-- Name: collaboration; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.collaboration (
    id bigint NOT NULL,
    repo_id bigint NOT NULL,
    user_id bigint NOT NULL,
    mode integer DEFAULT 2 NOT NULL
);


ALTER TABLE public.collaboration OWNER TO postgres;

--
-- Name: collaboration_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.collaboration_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.collaboration_id_seq OWNER TO postgres;

--
-- Name: collaboration_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.collaboration_id_seq OWNED BY public.collaboration.id;


--
-- Name: comment; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.comment (
    id bigint NOT NULL,
    type integer,
    poster_id bigint,
    issue_id bigint,
    commit_id bigint,
    line bigint,
    content text,
    created_unix bigint,
    updated_unix bigint,
    commit_sha character varying(40)
);


ALTER TABLE public.comment OWNER TO postgres;

--
-- Name: comment_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.comment_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.comment_id_seq OWNER TO postgres;

--
-- Name: comment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.comment_id_seq OWNED BY public.comment.id;


--
-- Name: deploy_key; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.deploy_key (
    id bigint NOT NULL,
    key_id bigint,
    repo_id bigint,
    name character varying(255),
    fingerprint character varying(255),
    created_unix bigint,
    updated_unix bigint
);


ALTER TABLE public.deploy_key OWNER TO postgres;

--
-- Name: deploy_key_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.deploy_key_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.deploy_key_id_seq OWNER TO postgres;

--
-- Name: deploy_key_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.deploy_key_id_seq OWNED BY public.deploy_key.id;


--
-- Name: email_address; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.email_address (
    id bigint NOT NULL,
    uid bigint NOT NULL,
    email character varying(255) NOT NULL,
    is_activated boolean
);


ALTER TABLE public.email_address OWNER TO postgres;

--
-- Name: email_address_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.email_address_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.email_address_id_seq OWNER TO postgres;

--
-- Name: email_address_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.email_address_id_seq OWNED BY public.email_address.id;


--
-- Name: follow; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.follow (
    id bigint NOT NULL,
    user_id bigint,
    follow_id bigint
);


ALTER TABLE public.follow OWNER TO postgres;

--
-- Name: follow_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.follow_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.follow_id_seq OWNER TO postgres;

--
-- Name: follow_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.follow_id_seq OWNED BY public.follow.id;


--
-- Name: hook_task; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.hook_task (
    id bigint NOT NULL,
    repo_id bigint,
    hook_id bigint,
    uuid character varying(255),
    type integer,
    url text,
    signature text,
    payload_content text,
    content_type integer,
    event_type character varying(255),
    is_ssl boolean,
    is_delivered boolean,
    delivered bigint,
    is_succeed boolean,
    request_content text,
    response_content text
);


ALTER TABLE public.hook_task OWNER TO postgres;

--
-- Name: hook_task_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.hook_task_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.hook_task_id_seq OWNER TO postgres;

--
-- Name: hook_task_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.hook_task_id_seq OWNED BY public.hook_task.id;


--
-- Name: issue; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.issue (
    id bigint NOT NULL,
    repo_id bigint,
    index bigint,
    poster_id bigint,
    name character varying(255),
    content text,
    milestone_id bigint,
    priority integer,
    assignee_id bigint,
    is_closed boolean,
    is_pull boolean,
    num_comments integer,
    deadline_unix bigint,
    created_unix bigint,
    updated_unix bigint
);


ALTER TABLE public.issue OWNER TO postgres;

--
-- Name: issue_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.issue_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.issue_id_seq OWNER TO postgres;

--
-- Name: issue_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.issue_id_seq OWNED BY public.issue.id;


--
-- Name: issue_label; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.issue_label (
    id bigint NOT NULL,
    issue_id bigint,
    label_id bigint
);


ALTER TABLE public.issue_label OWNER TO postgres;

--
-- Name: issue_label_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.issue_label_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.issue_label_id_seq OWNER TO postgres;

--
-- Name: issue_label_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.issue_label_id_seq OWNED BY public.issue_label.id;


--
-- Name: issue_user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.issue_user (
    id bigint NOT NULL,
    uid bigint,
    issue_id bigint,
    repo_id bigint,
    milestone_id bigint,
    is_read boolean,
    is_assigned boolean,
    is_mentioned boolean,
    is_poster boolean,
    is_closed boolean
);


ALTER TABLE public.issue_user OWNER TO postgres;

--
-- Name: issue_user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.issue_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.issue_user_id_seq OWNER TO postgres;

--
-- Name: issue_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.issue_user_id_seq OWNED BY public.issue_user.id;


--
-- Name: label; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.label (
    id bigint NOT NULL,
    repo_id bigint,
    name character varying(255),
    color character varying(7),
    num_issues integer,
    num_closed_issues integer
);


ALTER TABLE public.label OWNER TO postgres;

--
-- Name: label_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.label_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.label_id_seq OWNER TO postgres;

--
-- Name: label_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.label_id_seq OWNED BY public.label.id;


--
-- Name: lfs_object; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.lfs_object (
    repo_id bigint NOT NULL,
    oid text NOT NULL,
    size bigint NOT NULL,
    storage text NOT NULL,
    created_at timestamp with time zone NOT NULL
);


ALTER TABLE public.lfs_object OWNER TO postgres;

--
-- Name: login_source; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.login_source (
    id bigint NOT NULL,
    type bigint,
    name text,
    is_actived boolean NOT NULL,
    is_default boolean,
    cfg text,
    created_unix bigint,
    updated_unix bigint
);


ALTER TABLE public.login_source OWNER TO postgres;

--
-- Name: login_source_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.login_source_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.login_source_id_seq OWNER TO postgres;

--
-- Name: login_source_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.login_source_id_seq OWNED BY public.login_source.id;


--
-- Name: milestone; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.milestone (
    id bigint NOT NULL,
    repo_id bigint,
    name character varying(255),
    content text,
    is_closed boolean,
    num_issues integer,
    num_closed_issues integer,
    completeness integer,
    deadline_unix bigint,
    closed_date_unix bigint
);


ALTER TABLE public.milestone OWNER TO postgres;

--
-- Name: milestone_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.milestone_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.milestone_id_seq OWNER TO postgres;

--
-- Name: milestone_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.milestone_id_seq OWNED BY public.milestone.id;


--
-- Name: mirror; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.mirror (
    id bigint NOT NULL,
    repo_id bigint,
    "interval" integer,
    enable_prune boolean DEFAULT true NOT NULL,
    updated_unix bigint,
    next_update_unix bigint
);


ALTER TABLE public.mirror OWNER TO postgres;

--
-- Name: mirror_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.mirror_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.mirror_id_seq OWNER TO postgres;

--
-- Name: mirror_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.mirror_id_seq OWNED BY public.mirror.id;


--
-- Name: notice; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.notice (
    id bigint NOT NULL,
    type integer,
    description text,
    created_unix bigint
);


ALTER TABLE public.notice OWNER TO postgres;

--
-- Name: notice_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.notice_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.notice_id_seq OWNER TO postgres;

--
-- Name: notice_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.notice_id_seq OWNED BY public.notice.id;


--
-- Name: org_user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.org_user (
    id bigint NOT NULL,
    uid bigint,
    org_id bigint,
    is_public boolean,
    is_owner boolean,
    num_teams integer
);


ALTER TABLE public.org_user OWNER TO postgres;

--
-- Name: org_user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.org_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.org_user_id_seq OWNER TO postgres;

--
-- Name: org_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.org_user_id_seq OWNED BY public.org_user.id;


--
-- Name: protect_branch; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.protect_branch (
    id bigint NOT NULL,
    repo_id bigint,
    name character varying(255),
    protected boolean,
    require_pull_request boolean,
    enable_whitelist boolean,
    whitelist_user_i_ds text,
    whitelist_team_i_ds text
);


ALTER TABLE public.protect_branch OWNER TO postgres;

--
-- Name: protect_branch_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.protect_branch_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.protect_branch_id_seq OWNER TO postgres;

--
-- Name: protect_branch_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.protect_branch_id_seq OWNED BY public.protect_branch.id;


--
-- Name: protect_branch_whitelist; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.protect_branch_whitelist (
    id bigint NOT NULL,
    protect_branch_id bigint,
    repo_id bigint,
    name character varying(255),
    user_id bigint
);


ALTER TABLE public.protect_branch_whitelist OWNER TO postgres;

--
-- Name: protect_branch_whitelist_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.protect_branch_whitelist_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.protect_branch_whitelist_id_seq OWNER TO postgres;

--
-- Name: protect_branch_whitelist_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.protect_branch_whitelist_id_seq OWNED BY public.protect_branch_whitelist.id;


--
-- Name: public_key; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.public_key (
    id bigint NOT NULL,
    owner_id bigint NOT NULL,
    name character varying(255) NOT NULL,
    fingerprint character varying(255) NOT NULL,
    content text NOT NULL,
    mode integer DEFAULT 2 NOT NULL,
    type integer DEFAULT 1 NOT NULL,
    created_unix bigint,
    updated_unix bigint
);


ALTER TABLE public.public_key OWNER TO postgres;

--
-- Name: public_key_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.public_key_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.public_key_id_seq OWNER TO postgres;

--
-- Name: public_key_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.public_key_id_seq OWNED BY public.public_key.id;


--
-- Name: pull_request; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pull_request (
    id bigint NOT NULL,
    type integer,
    status integer,
    issue_id bigint,
    index bigint,
    head_repo_id bigint,
    base_repo_id bigint,
    head_user_name character varying(255),
    head_branch character varying(255),
    base_branch character varying(255),
    merge_base character varying(40),
    has_merged boolean,
    merged_commit_id character varying(40),
    merger_id bigint,
    merged_unix bigint
);


ALTER TABLE public.pull_request OWNER TO postgres;

--
-- Name: pull_request_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.pull_request_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.pull_request_id_seq OWNER TO postgres;

--
-- Name: pull_request_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.pull_request_id_seq OWNED BY public.pull_request.id;


--
-- Name: release; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.release (
    id bigint NOT NULL,
    repo_id bigint,
    publisher_id bigint,
    tag_name character varying(255),
    lower_tag_name character varying(255),
    target character varying(255),
    title character varying(255),
    sha1 character varying(40),
    num_commits bigint,
    note text,
    is_draft boolean DEFAULT false NOT NULL,
    is_prerelease boolean,
    created_unix bigint
);


ALTER TABLE public.release OWNER TO postgres;

--
-- Name: release_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.release_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.release_id_seq OWNER TO postgres;

--
-- Name: release_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.release_id_seq OWNED BY public.release.id;


--
-- Name: repository; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.repository (
    id bigint NOT NULL,
    owner_id bigint,
    lower_name character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    description character varying(512),
    website character varying(255),
    default_branch character varying(255),
    size bigint DEFAULT 0 NOT NULL,
    use_custom_avatar boolean,
    num_watches integer,
    num_stars integer,
    num_forks integer,
    num_issues integer,
    num_closed_issues integer,
    num_pulls integer,
    num_closed_pulls integer,
    num_milestones integer DEFAULT 0 NOT NULL,
    num_closed_milestones integer DEFAULT 0 NOT NULL,
    is_private boolean,
    is_unlisted boolean DEFAULT false NOT NULL,
    is_bare boolean,
    is_mirror boolean,
    enable_wiki boolean DEFAULT true NOT NULL,
    allow_public_wiki boolean,
    enable_external_wiki boolean,
    external_wiki_url character varying(255),
    enable_issues boolean DEFAULT true NOT NULL,
    allow_public_issues boolean,
    enable_external_tracker boolean,
    external_tracker_url character varying(255),
    external_tracker_format character varying(255),
    external_tracker_style character varying(255),
    enable_pulls boolean DEFAULT true NOT NULL,
    pulls_ignore_whitespace boolean DEFAULT false NOT NULL,
    pulls_allow_rebase boolean DEFAULT false NOT NULL,
    is_fork boolean DEFAULT false NOT NULL,
    fork_id bigint,
    created_unix bigint,
    updated_unix bigint
);


ALTER TABLE public.repository OWNER TO postgres;

--
-- Name: repository_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.repository_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.repository_id_seq OWNER TO postgres;

--
-- Name: repository_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.repository_id_seq OWNED BY public.repository.id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.star (
    id bigint NOT NULL,
    uid bigint,
    repo_id bigint
);


ALTER TABLE public.star OWNER TO postgres;

--
-- Name: star_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.star_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_id_seq OWNER TO postgres;

--
-- Name: star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.star_id_seq OWNED BY public.star.id;


--
-- Name: team; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.team (
    id bigint NOT NULL,
    org_id bigint,
    lower_name character varying(255),
    name character varying(255),
    description character varying(255),
    authorize integer,
    num_repos integer,
    num_members integer
);


ALTER TABLE public.team OWNER TO postgres;

--
-- Name: team_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.team_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.team_id_seq OWNER TO postgres;

--
-- Name: team_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.team_id_seq OWNED BY public.team.id;


--
-- Name: team_repo; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.team_repo (
    id bigint NOT NULL,
    org_id bigint,
    team_id bigint,
    repo_id bigint
);


ALTER TABLE public.team_repo OWNER TO postgres;

--
-- Name: team_repo_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.team_repo_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.team_repo_id_seq OWNER TO postgres;

--
-- Name: team_repo_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.team_repo_id_seq OWNED BY public.team_repo.id;


--
-- Name: team_user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.team_user (
    id bigint NOT NULL,
    org_id bigint,
    team_id bigint,
    uid bigint
);


ALTER TABLE public.team_user OWNER TO postgres;

--
-- Name: team_user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.team_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.team_user_id_seq OWNER TO postgres;

--
-- Name: team_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.team_user_id_seq OWNED BY public.team_user.id;


--
-- Name: two_factor; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.two_factor (
    id bigint NOT NULL,
    user_id bigint,
    secret character varying(255),
    created_unix bigint
);


ALTER TABLE public.two_factor OWNER TO postgres;

--
-- Name: two_factor_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.two_factor_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.two_factor_id_seq OWNER TO postgres;

--
-- Name: two_factor_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.two_factor_id_seq OWNED BY public.two_factor.id;


--
-- Name: two_factor_recovery_code; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.two_factor_recovery_code (
    id bigint NOT NULL,
    user_id bigint,
    code character varying(11),
    is_used boolean
);


ALTER TABLE public.two_factor_recovery_code OWNER TO postgres;

--
-- Name: two_factor_recovery_code_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.two_factor_recovery_code_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.two_factor_recovery_code_id_seq OWNER TO postgres;

--
-- Name: two_factor_recovery_code_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.two_factor_recovery_code_id_seq OWNED BY public.two_factor_recovery_code.id;


--
-- Name: upload; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.upload (
    id bigint NOT NULL,
    uuid uuid,
    name character varying(255)
);


ALTER TABLE public.upload OWNER TO postgres;

--
-- Name: upload_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.upload_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.upload_id_seq OWNER TO postgres;

--
-- Name: upload_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.upload_id_seq OWNED BY public.upload.id;


--
-- Name: user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."user" (
    id bigint NOT NULL,
    lower_name character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    full_name character varying(255),
    email character varying(255) NOT NULL,
    passwd character varying(255) NOT NULL,
    login_source bigint DEFAULT 0 NOT NULL,
    login_name character varying(255),
    type integer,
    location character varying(255),
    website character varying(255),
    rands character varying(10),
    salt character varying(10),
    created_unix bigint,
    updated_unix bigint,
    last_repo_visibility boolean,
    max_repo_creation integer DEFAULT '-1'::integer NOT NULL,
    is_active boolean,
    is_admin boolean,
    allow_git_hook boolean,
    allow_import_local boolean,
    prohibit_login boolean,
    avatar character varying(2048) NOT NULL,
    avatar_email character varying(255) NOT NULL,
    use_custom_avatar boolean,
    num_followers integer,
    num_following integer DEFAULT 0 NOT NULL,
    num_stars integer,
    num_repos integer,
    description character varying(255),
    num_teams integer,
    num_members integer
);


ALTER TABLE public."user" OWNER TO postgres;

--
-- Name: user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.user_id_seq
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
-- Name: version; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.version (
    id bigint NOT NULL,
    version bigint
);


ALTER TABLE public.version OWNER TO postgres;

--
-- Name: version_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.version_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.version_id_seq OWNER TO postgres;

--
-- Name: version_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.version_id_seq OWNED BY public.version.id;


--
-- Name: watch; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.watch (
    id bigint NOT NULL,
    user_id bigint,
    repo_id bigint
);


ALTER TABLE public.watch OWNER TO postgres;

--
-- Name: watch_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.watch_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.watch_id_seq OWNER TO postgres;

--
-- Name: watch_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.watch_id_seq OWNED BY public.watch.id;


--
-- Name: webhook; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.webhook (
    id bigint NOT NULL,
    repo_id bigint,
    org_id bigint,
    url text,
    content_type integer,
    secret text,
    events text,
    is_ssl boolean,
    is_active boolean,
    hook_task_type integer,
    meta text,
    last_status integer,
    created_unix bigint,
    updated_unix bigint
);


ALTER TABLE public.webhook OWNER TO postgres;

--
-- Name: webhook_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.webhook_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.webhook_id_seq OWNER TO postgres;

--
-- Name: webhook_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.webhook_id_seq OWNED BY public.webhook.id;


--
-- Name: access id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.access ALTER COLUMN id SET DEFAULT nextval('public.access_id_seq'::regclass);


--
-- Name: access_token id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.access_token ALTER COLUMN id SET DEFAULT nextval('public.access_token_id_seq'::regclass);


--
-- Name: action id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.action ALTER COLUMN id SET DEFAULT nextval('public.action_id_seq'::regclass);


--
-- Name: attachment id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.attachment ALTER COLUMN id SET DEFAULT nextval('public.attachment_id_seq'::regclass);


--
-- Name: collaboration id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.collaboration ALTER COLUMN id SET DEFAULT nextval('public.collaboration_id_seq'::regclass);


--
-- Name: comment id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comment ALTER COLUMN id SET DEFAULT nextval('public.comment_id_seq'::regclass);


--
-- Name: deploy_key id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.deploy_key ALTER COLUMN id SET DEFAULT nextval('public.deploy_key_id_seq'::regclass);


--
-- Name: email_address id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.email_address ALTER COLUMN id SET DEFAULT nextval('public.email_address_id_seq'::regclass);


--
-- Name: follow id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.follow ALTER COLUMN id SET DEFAULT nextval('public.follow_id_seq'::regclass);


--
-- Name: hook_task id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.hook_task ALTER COLUMN id SET DEFAULT nextval('public.hook_task_id_seq'::regclass);


--
-- Name: issue id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.issue ALTER COLUMN id SET DEFAULT nextval('public.issue_id_seq'::regclass);


--
-- Name: issue_label id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.issue_label ALTER COLUMN id SET DEFAULT nextval('public.issue_label_id_seq'::regclass);


--
-- Name: issue_user id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.issue_user ALTER COLUMN id SET DEFAULT nextval('public.issue_user_id_seq'::regclass);


--
-- Name: label id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.label ALTER COLUMN id SET DEFAULT nextval('public.label_id_seq'::regclass);


--
-- Name: login_source id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.login_source ALTER COLUMN id SET DEFAULT nextval('public.login_source_id_seq'::regclass);


--
-- Name: milestone id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.milestone ALTER COLUMN id SET DEFAULT nextval('public.milestone_id_seq'::regclass);


--
-- Name: mirror id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mirror ALTER COLUMN id SET DEFAULT nextval('public.mirror_id_seq'::regclass);


--
-- Name: notice id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.notice ALTER COLUMN id SET DEFAULT nextval('public.notice_id_seq'::regclass);


--
-- Name: org_user id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.org_user ALTER COLUMN id SET DEFAULT nextval('public.org_user_id_seq'::regclass);


--
-- Name: protect_branch id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.protect_branch ALTER COLUMN id SET DEFAULT nextval('public.protect_branch_id_seq'::regclass);


--
-- Name: protect_branch_whitelist id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.protect_branch_whitelist ALTER COLUMN id SET DEFAULT nextval('public.protect_branch_whitelist_id_seq'::regclass);


--
-- Name: public_key id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.public_key ALTER COLUMN id SET DEFAULT nextval('public.public_key_id_seq'::regclass);


--
-- Name: pull_request id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pull_request ALTER COLUMN id SET DEFAULT nextval('public.pull_request_id_seq'::regclass);


--
-- Name: release id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.release ALTER COLUMN id SET DEFAULT nextval('public.release_id_seq'::regclass);


--
-- Name: repository id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.repository ALTER COLUMN id SET DEFAULT nextval('public.repository_id_seq'::regclass);


--
-- Name: star id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.star ALTER COLUMN id SET DEFAULT nextval('public.star_id_seq'::regclass);


--
-- Name: team id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.team ALTER COLUMN id SET DEFAULT nextval('public.team_id_seq'::regclass);


--
-- Name: team_repo id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.team_repo ALTER COLUMN id SET DEFAULT nextval('public.team_repo_id_seq'::regclass);


--
-- Name: team_user id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.team_user ALTER COLUMN id SET DEFAULT nextval('public.team_user_id_seq'::regclass);


--
-- Name: two_factor id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.two_factor ALTER COLUMN id SET DEFAULT nextval('public.two_factor_id_seq'::regclass);


--
-- Name: two_factor_recovery_code id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.two_factor_recovery_code ALTER COLUMN id SET DEFAULT nextval('public.two_factor_recovery_code_id_seq'::regclass);


--
-- Name: upload id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.upload ALTER COLUMN id SET DEFAULT nextval('public.upload_id_seq'::regclass);


--
-- Name: user id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."user" ALTER COLUMN id SET DEFAULT nextval('public.user_id_seq'::regclass);


--
-- Name: version id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.version ALTER COLUMN id SET DEFAULT nextval('public.version_id_seq'::regclass);


--
-- Name: watch id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.watch ALTER COLUMN id SET DEFAULT nextval('public.watch_id_seq'::regclass);


--
-- Name: webhook id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.webhook ALTER COLUMN id SET DEFAULT nextval('public.webhook_id_seq'::regclass);


--
-- Data for Name: access; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.access (id, user_id, repo_id, mode) FROM stdin;
\.


--
-- Data for Name: access_token; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.access_token (id, uid, name, sha1, created_unix, updated_unix) FROM stdin;
1	1	drone	75f0080ba8555a5ccead433e90cdd7f8d4b8e9c2	1606075597	1606855549
\.


--
-- Data for Name: action; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.action (id, user_id, op_type, act_user_id, act_user_name, repo_id, repo_user_name, repo_name, ref_name, is_private, content, created_unix) FROM stdin;
1	1	1	1	labuser	1	labuser	advertisements		f		1606075325
2	1	16	1	labuser	1	labuser	advertisements	master	f	{"Len":1,"Commits":[{"Sha1":"aae668002982de3bd8be0335d405bdb34f4b883f","Message":"Initial commit\\n","AuthorEmail":"asciimo@gmail.com","AuthorName":"asciimo","CommitterEmail":"asciimo@gmail.com","CommitterName":"asciimo","Timestamp":"2020-11-24T00:43:22Z"}],"CompareURL":""}	1606178624
3	1	5	1	labuser	1	labuser	advertisements	master	f	{"Len":1,"Commits":[{"Sha1":"aae668002982de3bd8be0335d405bdb34f4b883f","Message":"Initial commit\\n","AuthorEmail":"asciimo@gmail.com","AuthorName":"asciimo","CommitterEmail":"asciimo@gmail.com","CommitterName":"asciimo","Timestamp":"2020-11-24T00:43:22Z"}],"CompareURL":""}	1606178624
4	1	5	1	labuser	1	labuser	advertisements	master	f	{"Len":1,"Commits":[{"Sha1":"4d591178c2cdf9fcd145ba598052e8de02fbcdef","Message":"Added tests\\n","AuthorEmail":"asciimo@gmail.com","AuthorName":"asciimo","CommitterEmail":"asciimo@gmail.com","CommitterName":"asciimo","Timestamp":"2020-11-25T01:09:45Z"}],"CompareURL":"labuser/advertisements/compare/aae668002982de3bd8be0335d405bdb34f4b883f...4d591178c2cdf9fcd145ba598052e8de02fbcdef"}	1606266601
5	1	5	1	labuser	1	labuser	advertisements	master	f	{"Len":1,"Commits":[{"Sha1":"7dd3e46aa73047f8e528f97169be162242d58c48","Message":"fixed yaml file\\n","AuthorEmail":"asciimo@gmail.com","AuthorName":"Stephen Calnan","CommitterEmail":"asciimo@gmail.com","CommitterName":"Stephen Calnan","Timestamp":"2020-11-25T19:44:01Z"}],"CompareURL":"labuser/advertisements/compare/4d591178c2cdf9fcd145ba598052e8de02fbcdef...7dd3e46aa73047f8e528f97169be162242d58c48"}	1606333453
6	1	5	1	labuser	1	labuser	advertisements	master	f	{"Len":1,"Commits":[{"Sha1":"e1300f3a277a7a09d858d24ca95eb966ed98c39f","Message":"Added tests\\n","AuthorEmail":"asciimo@gmail.com","AuthorName":"Stephen Calnan","CommitterEmail":"asciimo@gmail.com","CommitterName":"Stephen Calnan","Timestamp":"2020-11-25T20:11:16Z"}],"CompareURL":"labuser/advertisements/compare/7dd3e46aa73047f8e528f97169be162242d58c48...e1300f3a277a7a09d858d24ca95eb966ed98c39f"}	1606335661
7	1	5	1	labuser	1	labuser	advertisements	master	f	{"Len":1,"Commits":[{"Sha1":"d5466367e9fc5d64288025b8d17bb069ee489c6c","Message":"Fixed requirements.txt in drone file\\n","AuthorEmail":"asciimo@gmail.com","AuthorName":"Stephen Calnan","CommitterEmail":"asciimo@gmail.com","CommitterName":"Stephen Calnan","Timestamp":"2020-11-25T20:22:49Z"}],"CompareURL":"labuser/advertisements/compare/e1300f3a277a7a09d858d24ca95eb966ed98c39f...d5466367e9fc5d64288025b8d17bb069ee489c6c"}	1606335786
8	1	5	1	labuser	1	labuser	advertisements	master	f	{"Len":1,"Commits":[{"Sha1":"5d7cec558e70dab88bcf6fd4fe5c6f231752686e","Message":"added docker plugin to drone file\\n","AuthorEmail":"asciimo@gmail.com","AuthorName":"asciimo","CommitterEmail":"asciimo@gmail.com","CommitterName":"asciimo","Timestamp":"2020-11-25T23:03:50Z"}],"CompareURL":"labuser/advertisements/compare/d5466367e9fc5d64288025b8d17bb069ee489c6c...5d7cec558e70dab88bcf6fd4fe5c6f231752686e"}	1606345439
9	1	5	1	labuser	1	labuser	advertisements	master	f	{"Len":1,"Commits":[{"Sha1":"365356d730335364f8752c1131d947ab8e9583c3","Message":"Fixed docker registry url\\n","AuthorEmail":"asciimo@gmail.com","AuthorName":"asciimo","CommitterEmail":"asciimo@gmail.com","CommitterName":"asciimo","Timestamp":"2020-11-25T23:42:06Z"}],"CompareURL":"labuser/advertisements/compare/5d7cec558e70dab88bcf6fd4fe5c6f231752686e...365356d730335364f8752c1131d947ab8e9583c3"}	1606347737
10	1	5	1	labuser	1	labuser	advertisements	master	f	{"Len":1,"Commits":[{"Sha1":"90e3a07b4b886c9b56caef4cfc02e8a09dcdcc44","Message":"tweaked drone file\\n","AuthorEmail":"asciimo@gmail.com","AuthorName":"asciimo","CommitterEmail":"asciimo@gmail.com","CommitterName":"asciimo","Timestamp":"2020-11-26T00:00:16Z"}],"CompareURL":"labuser/advertisements/compare/365356d730335364f8752c1131d947ab8e9583c3...90e3a07b4b886c9b56caef4cfc02e8a09dcdcc44"}	1606348826
11	1	5	1	labuser	1	labuser	advertisements	master	f	{"Len":1,"Commits":[{"Sha1":"0b24f735f492d58b68fc6755f520b016a1b1d09f","Message":"More drone file fuckery\\n","AuthorEmail":"asciimo@gmail.com","AuthorName":"asciimo","CommitterEmail":"asciimo@gmail.com","CommitterName":"asciimo","Timestamp":"2020-11-26T00:31:15Z"}],"CompareURL":"labuser/advertisements/compare/90e3a07b4b886c9b56caef4cfc02e8a09dcdcc44...0b24f735f492d58b68fc6755f520b016a1b1d09f"}	1606350688
12	1	5	1	labuser	1	labuser	advertisements	master	f	{"Len":1,"Commits":[{"Sha1":"ac04c50d6d8c621543b85e65070a0d091a71c64c","Message":"Goes on and on\\n","AuthorEmail":"asciimo@gmail.com","AuthorName":"asciimo","CommitterEmail":"asciimo@gmail.com","CommitterName":"asciimo","Timestamp":"2020-11-26T00:38:13Z"}],"CompareURL":"labuser/advertisements/compare/0b24f735f492d58b68fc6755f520b016a1b1d09f...ac04c50d6d8c621543b85e65070a0d091a71c64c"}	1606351108
13	1	5	1	labuser	1	labuser	advertisements	master	f	{"Len":1,"Commits":[{"Sha1":"0bcb215ed685f8ed3b5a823824e9e368dd462db8","Message":"... on and on\\n","AuthorEmail":"asciimo@gmail.com","AuthorName":"asciimo","CommitterEmail":"asciimo@gmail.com","CommitterName":"asciimo","Timestamp":"2020-11-26T00:41:05Z"}],"CompareURL":"labuser/advertisements/compare/ac04c50d6d8c621543b85e65070a0d091a71c64c...0bcb215ed685f8ed3b5a823824e9e368dd462db8"}	1606351272
14	1	5	1	labuser	1	labuser	advertisements	master	f	{"Len":1,"Commits":[{"Sha1":"7d57fa1e424f5a007436871e8a2ae33e67f3c993","Message":"etc etc etc\\n","AuthorEmail":"asciimo@gmail.com","AuthorName":"asciimo","CommitterEmail":"asciimo@gmail.com","CommitterName":"asciimo","Timestamp":"2020-11-26T00:56:03Z"}],"CompareURL":"labuser/advertisements/compare/0bcb215ed685f8ed3b5a823824e9e368dd462db8...7d57fa1e424f5a007436871e8a2ae33e67f3c993"}	1606352172
15	1	5	1	labuser	1	labuser	advertisements	master	f	{"Len":1,"Commits":[{"Sha1":"0253fc330204ffa30032737d4a9e5db95280f016","Message":"etc etc etc\\n","AuthorEmail":"asciimo@gmail.com","AuthorName":"asciimo","CommitterEmail":"asciimo@gmail.com","CommitterName":"asciimo","Timestamp":"2020-11-26T00:59:40Z"}],"CompareURL":"labuser/advertisements/compare/7d57fa1e424f5a007436871e8a2ae33e67f3c993...0253fc330204ffa30032737d4a9e5db95280f016"}	1606352388
16	1	5	1	labuser	1	labuser	advertisements	master	f	{"Len":1,"Commits":[{"Sha1":"d1007b940094e1411041ea2a617c9d779ba8244a","Message":"Made insecure\\n","AuthorEmail":"asciimo@gmail.com","AuthorName":"asciimo","CommitterEmail":"asciimo@gmail.com","CommitterName":"asciimo","Timestamp":"2020-11-26T02:01:59Z"}],"CompareURL":"labuser/advertisements/compare/0253fc330204ffa30032737d4a9e5db95280f016...d1007b940094e1411041ea2a617c9d779ba8244a"}	1606356128
17	1	5	1	labuser	1	labuser	advertisements	master	f	{"Len":1,"Commits":[{"Sha1":"00f7dce2c44dd91fd35762ac2b94a0c15605c88c","Message":"more experiments\\n","AuthorEmail":"asciimo@gmail.com","AuthorName":"asciimo","CommitterEmail":"asciimo@gmail.com","CommitterName":"asciimo","Timestamp":"2020-11-26T02:04:15Z"}],"CompareURL":"labuser/advertisements/compare/d1007b940094e1411041ea2a617c9d779ba8244a...00f7dce2c44dd91fd35762ac2b94a0c15605c88c"}	1606356261
18	1	5	1	labuser	1	labuser	advertisements	master	f	{"Len":1,"Commits":[{"Sha1":"73a943f9f4af1a7b12535ba4de5227bbcc91d135","Message":"added comment\\n","AuthorEmail":"asciimo@gmail.com","AuthorName":"Stephen Calnan","CommitterEmail":"asciimo@gmail.com","CommitterName":"Stephen Calnan","Timestamp":"2020-11-30T20:41:05Z"}],"CompareURL":"labuser/advertisements/compare/00f7dce2c44dd91fd35762ac2b94a0c15605c88c...73a943f9f4af1a7b12535ba4de5227bbcc91d135"}	1606768882
19	1	5	1	labuser	1	labuser	advertisements	master	f	{"Len":1,"Commits":[{"Sha1":"de3e4976f3daf3b535af982d2a3c421b41e3dbc3","Message":"drone file adjustments\\n","AuthorEmail":"asciimo@gmail.com","AuthorName":"asciimo","CommitterEmail":"asciimo@gmail.com","CommitterName":"asciimo","Timestamp":"2020-12-01T19:56:48Z"}],"CompareURL":"labuser/advertisements/compare/73a943f9f4af1a7b12535ba4de5227bbcc91d135...de3e4976f3daf3b535af982d2a3c421b41e3dbc3"}	1606852618
20	1	5	1	labuser	1	labuser	advertisements	master	f	{"Len":1,"Commits":[{"Sha1":"c8233fcf5578ecc973adb0ef1f5b12864519a616","Message":"more drone file tweaks\\n","AuthorEmail":"asciimo@gmail.com","AuthorName":"asciimo","CommitterEmail":"asciimo@gmail.com","CommitterName":"asciimo","Timestamp":"2020-12-01T20:29:38Z"}],"CompareURL":"labuser/advertisements/compare/de3e4976f3daf3b535af982d2a3c421b41e3dbc3...c8233fcf5578ecc973adb0ef1f5b12864519a616"}	1606854587
\.


--
-- Data for Name: attachment; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.attachment (id, uuid, issue_id, comment_id, release_id, name, created_unix) FROM stdin;
\.


--
-- Data for Name: collaboration; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.collaboration (id, repo_id, user_id, mode) FROM stdin;
\.


--
-- Data for Name: comment; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.comment (id, type, poster_id, issue_id, commit_id, line, content, created_unix, updated_unix, commit_sha) FROM stdin;
\.


--
-- Data for Name: deploy_key; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.deploy_key (id, key_id, repo_id, name, fingerprint, created_unix, updated_unix) FROM stdin;
\.


--
-- Data for Name: email_address; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.email_address (id, uid, email, is_activated) FROM stdin;
\.


--
-- Data for Name: follow; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.follow (id, user_id, follow_id) FROM stdin;
\.


--
-- Data for Name: hook_task; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.hook_task (id, repo_id, hook_id, uuid, type, url, signature, payload_content, content_type, event_type, is_ssl, is_delivered, delivered, is_succeed, request_content, response_content) FROM stdin;
1	1	1	61e229af-e81b-4dc0-8735-9d95bf09f51c	1	http://drone-server/hook	3561a27865a580abc6d757874da3ee046475fb7bbd73fa2f6eb3e1ea37c0ecd7	{\n  "ref": "master",\n  "ref_type": "branch",\n  "sha": "",\n  "default_branch": "master",\n  "repository": {\n    "id": 1,\n    "owner": {\n      "id": 1,\n      "username": "labuser",\n      "login": "labuser",\n      "full_name": "",\n      "email": "labuser@example.com",\n      "avatar_url": "https://secure.gravatar.com/avatar/fbdecbdeaa8816382d76cf909295b38a?d=identicon"\n    },\n    "name": "advertisements",\n    "full_name": "labuser/advertisements",\n    "description": "",\n    "private": false,\n    "fork": false,\n    "parent": null,\n    "empty": false,\n    "mirror": false,\n    "size": 12288,\n    "html_url": "http://docker-host:8300/labuser/advertisements",\n    "ssh_url": "git@localhost:labuser/advertisements.git",\n    "clone_url": "http://docker-host:8300/labuser/advertisements.git",\n    "website": "",\n    "stars_count": 0,\n    "forks_count": 0,\n    "watchers_count": 1,\n    "open_issues_count": 0,\n    "default_branch": "master",\n    "created_at": "2020-11-22T20:02:05Z",\n    "updated_at": "2020-11-22T20:02:05Z"\n  },\n  "sender": {\n    "id": 1,\n    "username": "labuser",\n    "login": "labuser",\n    "full_name": "",\n    "email": "labuser@example.com",\n    "avatar_url": "https://secure.gravatar.com/avatar/fbdecbdeaa8816382d76cf909295b38a?d=identicon"\n  }\n}	1	create	f	t	1606178624845401294	t	{"headers":{"Content-Type":"application/json","X-Github-Delivery":"61e229af-e81b-4dc0-8735-9d95bf09f51c","X-Github-Event":"create","X-Gogs-Delivery":"61e229af-e81b-4dc0-8735-9d95bf09f51c","X-Gogs-Signature":"3561a27865a580abc6d757874da3ee046475fb7bbd73fa2f6eb3e1ea37c0ecd7","X-Gogs-Event":"create"}}	{"status":200,"headers":{"Cache-Control":"no-cache, no-store, must-revalidate, private, max-age=0","Expires":"Thu, 01 Jan 1970 00:00:00 UTC","Pragma":"no-cache","X-Accel-Expires":"0","X-Frame-Options":"DENY","X-Xss-Protection":"1; mode=block","Date":"Tue, 24 Nov 2020 00:43:44 GMT","Content-Length":"0"},"body":""}
2	1	1	49c938f2-b6c1-46d2-8d98-f85fe1cb727f	1	http://drone-server/hook	c529e27fcf291b002d5d87f5376a9ab4ed435a5a0ae50113e0f8375008d39ded	{\n  "ref": "refs/heads/master",\n  "before": "0000000000000000000000000000000000000000",\n  "after": "aae668002982de3bd8be0335d405bdb34f4b883f",\n  "compare_url": "",\n  "commits": [\n    {\n      "id": "aae668002982de3bd8be0335d405bdb34f4b883f",\n      "message": "Initial commit\\n",\n      "url": "http://docker-host:8300/labuser/advertisements/commit/aae668002982de3bd8be0335d405bdb34f4b883f",\n      "author": {\n        "name": "asciimo",\n        "email": "asciimo@gmail.com",\n        "username": ""\n      },\n      "committer": {\n        "name": "asciimo",\n        "email": "asciimo@gmail.com",\n        "username": ""\n      },\n      "added": [\n        "main.py"\n      ],\n      "removed": null,\n      "modified": null,\n      "timestamp": "2020-11-24T00:43:22Z"\n    }\n  ],\n  "repository": {\n    "id": 1,\n    "owner": {\n      "id": 1,\n      "username": "labuser",\n      "login": "labuser",\n      "full_name": "",\n      "email": "labuser@example.com",\n      "avatar_url": "https://secure.gravatar.com/avatar/fbdecbdeaa8816382d76cf909295b38a?d=identicon"\n    },\n    "name": "advertisements",\n    "full_name": "labuser/advertisements",\n    "description": "",\n    "private": false,\n    "fork": false,\n    "parent": null,\n    "empty": false,\n    "mirror": false,\n    "size": 12288,\n    "html_url": "http://docker-host:8300/labuser/advertisements",\n    "ssh_url": "git@localhost:labuser/advertisements.git",\n    "clone_url": "http://docker-host:8300/labuser/advertisements.git",\n    "website": "",\n    "stars_count": 0,\n    "forks_count": 0,\n    "watchers_count": 1,\n    "open_issues_count": 0,\n    "default_branch": "master",\n    "created_at": "2020-11-22T20:02:05Z",\n    "updated_at": "2020-11-22T20:02:05Z"\n  },\n  "pusher": {\n    "id": 1,\n    "username": "labuser",\n    "login": "labuser",\n    "full_name": "",\n    "email": "labuser@example.com",\n    "avatar_url": "https://secure.gravatar.com/avatar/fbdecbdeaa8816382d76cf909295b38a?d=identicon"\n  },\n  "sender": {\n    "id": 1,\n    "username": "labuser",\n    "login": "labuser",\n    "full_name": "",\n    "email": "labuser@example.com",\n    "avatar_url": "https://secure.gravatar.com/avatar/fbdecbdeaa8816382d76cf909295b38a?d=identicon"\n  }\n}	1	push	f	t	1606178640000024089	f	{"headers":{"Content-Type":"application/json","X-Github-Delivery":"49c938f2-b6c1-46d2-8d98-f85fe1cb727f","X-Github-Event":"push","X-Gogs-Delivery":"49c938f2-b6c1-46d2-8d98-f85fe1cb727f","X-Gogs-Signature":"c529e27fcf291b002d5d87f5376a9ab4ed435a5a0ae50113e0f8375008d39ded","X-Gogs-Event":"push"}}	{"status":0,"headers":{},"body":"Delivery: Post \\"http://drone-server/hook\\": read tcp 172.21.0.6:53186-\\u003e172.21.0.3:80: i/o timeout"}
3	1	1	fff76635-655c-42cb-8d32-b839e44c2ad4	1	http://drone-server/hook	cf65d1768c8cc3473a5375ef87bf93f1487d6a2f4afda4b74badd596692681c3	{\n  "ref": "refs/heads/master",\n  "before": "aae668002982de3bd8be0335d405bdb34f4b883f",\n  "after": "4d591178c2cdf9fcd145ba598052e8de02fbcdef",\n  "compare_url": "http://docker-host:8300/labuser/advertisements/compare/aae668002982de3bd8be0335d405bdb34f4b883f...4d591178c2cdf9fcd145ba598052e8de02fbcdef",\n  "commits": [\n    {\n      "id": "4d591178c2cdf9fcd145ba598052e8de02fbcdef",\n      "message": "Added tests\\n",\n      "url": "http://docker-host:8300/labuser/advertisements/commit/4d591178c2cdf9fcd145ba598052e8de02fbcdef",\n      "author": {\n        "name": "asciimo",\n        "email": "asciimo@gmail.com",\n        "username": ""\n      },\n      "committer": {\n        "name": "asciimo",\n        "email": "asciimo@gmail.com",\n        "username": ""\n      },\n      "added": [\n        ".drone.yml",\n        "Dockerfile",\n        "test_main.py"\n      ],\n      "removed": null,\n      "modified": [\n        "main.py"\n      ],\n      "timestamp": "2020-11-25T01:09:45Z"\n    }\n  ],\n  "repository": {\n    "id": 1,\n    "owner": {\n      "id": 1,\n      "username": "labuser",\n      "login": "labuser",\n      "full_name": "",\n      "email": "labuser@example.com",\n      "avatar_url": "https://secure.gravatar.com/avatar/fbdecbdeaa8816382d76cf909295b38a?d=identicon"\n    },\n    "name": "advertisements",\n    "full_name": "labuser/advertisements",\n    "description": "",\n    "private": false,\n    "fork": false,\n    "parent": null,\n    "empty": false,\n    "mirror": false,\n    "size": 36864,\n    "html_url": "http://docker-host:8300/labuser/advertisements",\n    "ssh_url": "git@localhost:labuser/advertisements.git",\n    "clone_url": "http://docker-host:8300/labuser/advertisements.git",\n    "website": "",\n    "stars_count": 0,\n    "forks_count": 0,\n    "watchers_count": 1,\n    "open_issues_count": 0,\n    "default_branch": "master",\n    "created_at": "2020-11-22T20:02:05Z",\n    "updated_at": "2020-11-22T20:02:05Z"\n  },\n  "pusher": {\n    "id": 1,\n    "username": "labuser",\n    "login": "labuser",\n    "full_name": "",\n    "email": "labuser@example.com",\n    "avatar_url": "https://secure.gravatar.com/avatar/fbdecbdeaa8816382d76cf909295b38a?d=identicon"\n  },\n  "sender": {\n    "id": 1,\n    "username": "labuser",\n    "login": "labuser",\n    "full_name": "",\n    "email": "labuser@example.com",\n    "avatar_url": "https://secure.gravatar.com/avatar/fbdecbdeaa8816382d76cf909295b38a?d=identicon"\n  }\n}	1	push	f	t	1606266602294953505	t	{"headers":{"X-Github-Delivery":"fff76635-655c-42cb-8d32-b839e44c2ad4","X-Github-Event":"push","X-Gogs-Delivery":"fff76635-655c-42cb-8d32-b839e44c2ad4","X-Gogs-Signature":"cf65d1768c8cc3473a5375ef87bf93f1487d6a2f4afda4b74badd596692681c3","X-Gogs-Event":"push","Content-Type":"application/json"}}	{"status":200,"headers":{"Content-Type":"application/json","X-Xss-Protection":"1; mode=block","Expires":"Thu, 01 Jan 1970 00:00:00 UTC","Pragma":"no-cache","X-Accel-Expires":"0","Cache-Control":"no-cache, no-store, must-revalidate, private, max-age=0","Content-Length":"781","X-Frame-Options":"DENY","Date":"Wed, 25 Nov 2020 01:10:02 GMT"},"body":"{\\"id\\":1,\\"repo_id\\":1,\\"trigger\\":\\"\\",\\"number\\":1,\\"status\\":\\"error\\",\\"error\\":\\"yaml: line 1: mapping values are not allowed in this context\\",\\"event\\":\\"push\\",\\"action\\":\\"\\",\\"link\\":\\"http://docker-host:8300/labuser/advertisements/compare/aae668002982de3bd8be0335d405bdb34f4b883f...4d591178c2cdf9fcd145ba598052e8de02fbcdef\\",\\"timestamp\\":0,\\"message\\":\\"Added tests\\\\n\\",\\"before\\":\\"\\",\\"after\\":\\"4d591178c2cdf9fcd145ba598052e8de02fbcdef\\",\\"ref\\":\\"refs/heads/master\\",\\"source_repo\\":\\"\\",\\"source\\":\\"master\\",\\"target\\":\\"master\\",\\"author_login\\":\\"\\",\\"author_name\\":\\"asciimo\\",\\"author_email\\":\\"asciimo@gmail.com\\",\\"author_avatar\\":\\"https://secure.gravatar.com/avatar/fbdecbdeaa8816382d76cf909295b38a?d=identicon\\",\\"sender\\":\\"labuser\\",\\"started\\":1606266601,\\"finished\\":1606266601,\\"created\\":1606266601,\\"updated\\":1606266601,\\"version\\":1}\\n"}
4	1	1	b31d72f9-afb8-4bfd-be4a-b866fe2d6887	1	http://drone-server/hook	9ccd07a349a6fbcf9ee97e627d42b26584daaa2755d130b04b1283853bf00eac	{\n  "ref": "refs/heads/master",\n  "before": "4d591178c2cdf9fcd145ba598052e8de02fbcdef",\n  "after": "7dd3e46aa73047f8e528f97169be162242d58c48",\n  "compare_url": "http://docker-host:8300/labuser/advertisements/compare/4d591178c2cdf9fcd145ba598052e8de02fbcdef...7dd3e46aa73047f8e528f97169be162242d58c48",\n  "commits": [\n    {\n      "id": "7dd3e46aa73047f8e528f97169be162242d58c48",\n      "message": "fixed yaml file\\n",\n      "url": "http://docker-host:8300/labuser/advertisements/commit/7dd3e46aa73047f8e528f97169be162242d58c48",\n      "author": {\n        "name": "Stephen Calnan",\n        "email": "asciimo@gmail.com",\n        "username": ""\n      },\n      "committer": {\n        "name": "Stephen Calnan",\n        "email": "asciimo@gmail.com",\n        "username": ""\n      },\n      "added": null,\n      "removed": null,\n      "modified": [\n        ".drone.yml"\n      ],\n      "timestamp": "2020-11-25T19:44:01Z"\n    }\n  ],\n  "repository": {\n    "id": 1,\n    "owner": {\n      "id": 1,\n      "username": "labuser",\n      "login": "labuser",\n      "full_name": "",\n      "email": "labuser@example.com",\n      "avatar_url": "https://secure.gravatar.com/avatar/fbdecbdeaa8816382d76cf909295b38a?d=identicon"\n    },\n    "name": "advertisements",\n    "full_name": "labuser/advertisements",\n    "description": "",\n    "private": false,\n    "fork": false,\n    "parent": null,\n    "empty": false,\n    "mirror": false,\n    "size": 49152,\n    "html_url": "http://docker-host:8300/labuser/advertisements",\n    "ssh_url": "git@localhost:labuser/advertisements.git",\n    "clone_url": "http://docker-host:8300/labuser/advertisements.git",\n    "website": "",\n    "stars_count": 0,\n    "forks_count": 0,\n    "watchers_count": 1,\n    "open_issues_count": 0,\n    "default_branch": "master",\n    "created_at": "2020-11-22T20:02:05Z",\n    "updated_at": "2020-11-22T20:02:05Z"\n  },\n  "pusher": {\n    "id": 1,\n    "username": "labuser",\n    "login": "labuser",\n    "full_name": "",\n    "email": "labuser@example.com",\n    "avatar_url": "https://secure.gravatar.com/avatar/fbdecbdeaa8816382d76cf909295b38a?d=identicon"\n  },\n  "sender": {\n    "id": 1,\n    "username": "labuser",\n    "login": "labuser",\n    "full_name": "",\n    "email": "labuser@example.com",\n    "avatar_url": "https://secure.gravatar.com/avatar/fbdecbdeaa8816382d76cf909295b38a?d=identicon"\n  }\n}	1	push	f	t	1606333454597788129	t	{"headers":{"X-Github-Delivery":"b31d72f9-afb8-4bfd-be4a-b866fe2d6887","X-Github-Event":"push","X-Gogs-Delivery":"b31d72f9-afb8-4bfd-be4a-b866fe2d6887","X-Gogs-Signature":"9ccd07a349a6fbcf9ee97e627d42b26584daaa2755d130b04b1283853bf00eac","X-Gogs-Event":"push","Content-Type":"application/json"}}	{"status":200,"headers":{"Content-Type":"application/json","X-Accel-Expires":"0","X-Xss-Protection":"1; mode=block","Content-Length":"710","Pragma":"no-cache","X-Frame-Options":"DENY","Date":"Wed, 25 Nov 2020 19:44:14 GMT","Cache-Control":"no-cache, no-store, must-revalidate, private, max-age=0","Expires":"Thu, 01 Jan 1970 00:00:00 UTC"},"body":"{\\"id\\":2,\\"repo_id\\":1,\\"trigger\\":\\"@hook\\",\\"number\\":2,\\"status\\":\\"pending\\",\\"event\\":\\"push\\",\\"action\\":\\"\\",\\"link\\":\\"http://docker-host:8300/labuser/advertisements/compare/4d591178c2cdf9fcd145ba598052e8de02fbcdef...7dd3e46aa73047f8e528f97169be162242d58c48\\",\\"timestamp\\":0,\\"message\\":\\"fixed yaml file\\\\n\\",\\"before\\":\\"\\",\\"after\\":\\"7dd3e46aa73047f8e528f97169be162242d58c48\\",\\"ref\\":\\"refs/heads/master\\",\\"source_repo\\":\\"\\",\\"source\\":\\"master\\",\\"target\\":\\"master\\",\\"author_login\\":\\"\\",\\"author_name\\":\\"Stephen Calnan\\",\\"author_email\\":\\"asciimo@gmail.com\\",\\"author_avatar\\":\\"https://secure.gravatar.com/avatar/fbdecbdeaa8816382d76cf909295b38a?d=identicon\\",\\"sender\\":\\"labuser\\",\\"started\\":0,\\"finished\\":0,\\"created\\":1606333453,\\"updated\\":1606333453,\\"version\\":1}\\n"}
5	1	1	8275ce0d-860a-4682-b224-6cd649d66101	1	http://drone-server/hook	8aab746d5fdb405dd411f1e39aaf26e333d9978085d71635f0368f2bbb7881e6	{\n  "ref": "refs/heads/master",\n  "before": "7dd3e46aa73047f8e528f97169be162242d58c48",\n  "after": "e1300f3a277a7a09d858d24ca95eb966ed98c39f",\n  "compare_url": "http://docker-host:8300/labuser/advertisements/compare/7dd3e46aa73047f8e528f97169be162242d58c48...e1300f3a277a7a09d858d24ca95eb966ed98c39f",\n  "commits": [\n    {\n      "id": "e1300f3a277a7a09d858d24ca95eb966ed98c39f",\n      "message": "Added tests\\n",\n      "url": "http://docker-host:8300/labuser/advertisements/commit/e1300f3a277a7a09d858d24ca95eb966ed98c39f",\n      "author": {\n        "name": "Stephen Calnan",\n        "email": "asciimo@gmail.com",\n        "username": ""\n      },\n      "committer": {\n        "name": "Stephen Calnan",\n        "email": "asciimo@gmail.com",\n        "username": ""\n      },\n      "added": [\n        ".gitignore",\n        "requirements.txt"\n      ],\n      "removed": null,\n      "modified": [\n        "test_main.py"\n      ],\n      "timestamp": "2020-11-25T20:11:16Z"\n    }\n  ],\n  "repository": {\n    "id": 1,\n    "owner": {\n      "id": 1,\n      "username": "labuser",\n      "login": "labuser",\n      "full_name": "",\n      "email": "labuser@example.com",\n      "avatar_url": "https://secure.gravatar.com/avatar/fbdecbdeaa8816382d76cf909295b38a?d=identicon"\n    },\n    "name": "advertisements",\n    "full_name": "labuser/advertisements",\n    "description": "",\n    "private": false,\n    "fork": false,\n    "parent": null,\n    "empty": false,\n    "mirror": false,\n    "size": 69632,\n    "html_url": "http://docker-host:8300/labuser/advertisements",\n    "ssh_url": "git@localhost:labuser/advertisements.git",\n    "clone_url": "http://docker-host:8300/labuser/advertisements.git",\n    "website": "",\n    "stars_count": 0,\n    "forks_count": 0,\n    "watchers_count": 1,\n    "open_issues_count": 0,\n    "default_branch": "master",\n    "created_at": "2020-11-22T20:02:05Z",\n    "updated_at": "2020-11-22T20:02:05Z"\n  },\n  "pusher": {\n    "id": 1,\n    "username": "labuser",\n    "login": "labuser",\n    "full_name": "",\n    "email": "labuser@example.com",\n    "avatar_url": "https://secure.gravatar.com/avatar/fbdecbdeaa8816382d76cf909295b38a?d=identicon"\n  },\n  "sender": {\n    "id": 1,\n    "username": "labuser",\n    "login": "labuser",\n    "full_name": "",\n    "email": "labuser@example.com",\n    "avatar_url": "https://secure.gravatar.com/avatar/fbdecbdeaa8816382d76cf909295b38a?d=identicon"\n  }\n}	1	push	f	t	1606335662947277844	t	{"headers":{"X-Github-Delivery":"8275ce0d-860a-4682-b224-6cd649d66101","X-Github-Event":"push","X-Gogs-Delivery":"8275ce0d-860a-4682-b224-6cd649d66101","X-Gogs-Signature":"8aab746d5fdb405dd411f1e39aaf26e333d9978085d71635f0368f2bbb7881e6","X-Gogs-Event":"push","Content-Type":"application/json"}}	{"status":200,"headers":{"Pragma":"no-cache","X-Xss-Protection":"1; mode=block","Date":"Wed, 25 Nov 2020 20:21:02 GMT","Expires":"Thu, 01 Jan 1970 00:00:00 UTC","Cache-Control":"no-cache, no-store, must-revalidate, private, max-age=0","X-Frame-Options":"DENY","Content-Length":"706","Content-Type":"application/json","X-Accel-Expires":"0"},"body":"{\\"id\\":3,\\"repo_id\\":1,\\"trigger\\":\\"@hook\\",\\"number\\":3,\\"status\\":\\"pending\\",\\"event\\":\\"push\\",\\"action\\":\\"\\",\\"link\\":\\"http://docker-host:8300/labuser/advertisements/compare/7dd3e46aa73047f8e528f97169be162242d58c48...e1300f3a277a7a09d858d24ca95eb966ed98c39f\\",\\"timestamp\\":0,\\"message\\":\\"Added tests\\\\n\\",\\"before\\":\\"\\",\\"after\\":\\"e1300f3a277a7a09d858d24ca95eb966ed98c39f\\",\\"ref\\":\\"refs/heads/master\\",\\"source_repo\\":\\"\\",\\"source\\":\\"master\\",\\"target\\":\\"master\\",\\"author_login\\":\\"\\",\\"author_name\\":\\"Stephen Calnan\\",\\"author_email\\":\\"asciimo@gmail.com\\",\\"author_avatar\\":\\"https://secure.gravatar.com/avatar/fbdecbdeaa8816382d76cf909295b38a?d=identicon\\",\\"sender\\":\\"labuser\\",\\"started\\":0,\\"finished\\":0,\\"created\\":1606335662,\\"updated\\":1606335662,\\"version\\":1}\\n"}
6	1	1	2ad6bb2c-9ffd-4351-be9c-4486d0b01e4a	1	http://drone-server/hook	c16869b3d90584e3d4374ea8a15f4606310c85facaceeaeea550db1791515d12	{\n  "ref": "refs/heads/master",\n  "before": "e1300f3a277a7a09d858d24ca95eb966ed98c39f",\n  "after": "d5466367e9fc5d64288025b8d17bb069ee489c6c",\n  "compare_url": "http://docker-host:8300/labuser/advertisements/compare/e1300f3a277a7a09d858d24ca95eb966ed98c39f...d5466367e9fc5d64288025b8d17bb069ee489c6c",\n  "commits": [\n    {\n      "id": "d5466367e9fc5d64288025b8d17bb069ee489c6c",\n      "message": "Fixed requirements.txt in drone file\\n",\n      "url": "http://docker-host:8300/labuser/advertisements/commit/d5466367e9fc5d64288025b8d17bb069ee489c6c",\n      "author": {\n        "name": "Stephen Calnan",\n        "email": "asciimo@gmail.com",\n        "username": ""\n      },\n      "committer": {\n        "name": "Stephen Calnan",\n        "email": "asciimo@gmail.com",\n        "username": ""\n      },\n      "added": null,\n      "removed": null,\n      "modified": [\n        ".drone.yml"\n      ],\n      "timestamp": "2020-11-25T20:22:49Z"\n    }\n  ],\n  "repository": {\n    "id": 1,\n    "owner": {\n      "id": 1,\n      "username": "labuser",\n      "login": "labuser",\n      "full_name": "",\n      "email": "labuser@example.com",\n      "avatar_url": "https://secure.gravatar.com/avatar/fbdecbdeaa8816382d76cf909295b38a?d=identicon"\n    },\n    "name": "advertisements",\n    "full_name": "labuser/advertisements",\n    "description": "",\n    "private": false,\n    "fork": false,\n    "parent": null,\n    "empty": false,\n    "mirror": false,\n    "size": 81920,\n    "html_url": "http://docker-host:8300/labuser/advertisements",\n    "ssh_url": "git@localhost:labuser/advertisements.git",\n    "clone_url": "http://docker-host:8300/labuser/advertisements.git",\n    "website": "",\n    "stars_count": 0,\n    "forks_count": 0,\n    "watchers_count": 1,\n    "open_issues_count": 0,\n    "default_branch": "master",\n    "created_at": "2020-11-22T20:02:05Z",\n    "updated_at": "2020-11-22T20:02:05Z"\n  },\n  "pusher": {\n    "id": 1,\n    "username": "labuser",\n    "login": "labuser",\n    "full_name": "",\n    "email": "labuser@example.com",\n    "avatar_url": "https://secure.gravatar.com/avatar/fbdecbdeaa8816382d76cf909295b38a?d=identicon"\n  },\n  "sender": {\n    "id": 1,\n    "username": "labuser",\n    "login": "labuser",\n    "full_name": "",\n    "email": "labuser@example.com",\n    "avatar_url": "https://secure.gravatar.com/avatar/fbdecbdeaa8816382d76cf909295b38a?d=identicon"\n  }\n}	1	push	f	t	1606335787839091535	t	{"headers":{"X-Gogs-Delivery":"2ad6bb2c-9ffd-4351-be9c-4486d0b01e4a","X-Gogs-Signature":"c16869b3d90584e3d4374ea8a15f4606310c85facaceeaeea550db1791515d12","X-Gogs-Event":"push","Content-Type":"application/json","X-Github-Delivery":"2ad6bb2c-9ffd-4351-be9c-4486d0b01e4a","X-Github-Event":"push"}}	{"status":200,"headers":{"Expires":"Thu, 01 Jan 1970 00:00:00 UTC","Pragma":"no-cache","Date":"Wed, 25 Nov 2020 20:23:07 GMT","X-Xss-Protection":"1; mode=block","Content-Type":"application/json","X-Frame-Options":"DENY","Content-Length":"731","Cache-Control":"no-cache, no-store, must-revalidate, private, max-age=0","X-Accel-Expires":"0"},"body":"{\\"id\\":4,\\"repo_id\\":1,\\"trigger\\":\\"@hook\\",\\"number\\":4,\\"status\\":\\"pending\\",\\"event\\":\\"push\\",\\"action\\":\\"\\",\\"link\\":\\"http://docker-host:8300/labuser/advertisements/compare/e1300f3a277a7a09d858d24ca95eb966ed98c39f...d5466367e9fc5d64288025b8d17bb069ee489c6c\\",\\"timestamp\\":0,\\"message\\":\\"Fixed requirements.txt in drone file\\\\n\\",\\"before\\":\\"\\",\\"after\\":\\"d5466367e9fc5d64288025b8d17bb069ee489c6c\\",\\"ref\\":\\"refs/heads/master\\",\\"source_repo\\":\\"\\",\\"source\\":\\"master\\",\\"target\\":\\"master\\",\\"author_login\\":\\"\\",\\"author_name\\":\\"Stephen Calnan\\",\\"author_email\\":\\"asciimo@gmail.com\\",\\"author_avatar\\":\\"https://secure.gravatar.com/avatar/fbdecbdeaa8816382d76cf909295b38a?d=identicon\\",\\"sender\\":\\"labuser\\",\\"started\\":0,\\"finished\\":0,\\"created\\":1606335787,\\"updated\\":1606335787,\\"version\\":1}\\n"}
7	1	1	eb22484c-2e36-48a5-b7f4-8b4215a21b85	1	http://drone-server/hook	709ae12d84a292cee1f5ff18f8e06742886e33724fdeff54a57f4de1420877c0	{\n  "ref": "refs/heads/master",\n  "before": "d5466367e9fc5d64288025b8d17bb069ee489c6c",\n  "after": "5d7cec558e70dab88bcf6fd4fe5c6f231752686e",\n  "compare_url": "http://docker-host:8300/labuser/advertisements/compare/d5466367e9fc5d64288025b8d17bb069ee489c6c...5d7cec558e70dab88bcf6fd4fe5c6f231752686e",\n  "commits": [\n    {\n      "id": "5d7cec558e70dab88bcf6fd4fe5c6f231752686e",\n      "message": "added docker plugin to drone file\\n",\n      "url": "http://docker-host:8300/labuser/advertisements/commit/5d7cec558e70dab88bcf6fd4fe5c6f231752686e",\n      "author": {\n        "name": "asciimo",\n        "email": "asciimo@gmail.com",\n        "username": ""\n      },\n      "committer": {\n        "name": "asciimo",\n        "email": "asciimo@gmail.com",\n        "username": ""\n      },\n      "added": null,\n      "removed": null,\n      "modified": [\n        ".drone.yml"\n      ],\n      "timestamp": "2020-11-25T23:03:50Z"\n    }\n  ],\n  "repository": {\n    "id": 1,\n    "owner": {\n      "id": 1,\n      "username": "labuser",\n      "login": "labuser",\n      "full_name": "",\n      "email": "labuser@example.com",\n      "avatar_url": "https://secure.gravatar.com/avatar/fbdecbdeaa8816382d76cf909295b38a?d=identicon"\n    },\n    "name": "advertisements",\n    "full_name": "labuser/advertisements",\n    "description": "",\n    "private": false,\n    "fork": false,\n    "parent": null,\n    "empty": false,\n    "mirror": false,\n    "size": 94208,\n    "html_url": "http://docker-host:8300/labuser/advertisements",\n    "ssh_url": "git@localhost:labuser/advertisements.git",\n    "clone_url": "http://docker-host:8300/labuser/advertisements.git",\n    "website": "",\n    "stars_count": 0,\n    "forks_count": 0,\n    "watchers_count": 1,\n    "open_issues_count": 0,\n    "default_branch": "master",\n    "created_at": "2020-11-22T20:02:05Z",\n    "updated_at": "2020-11-22T20:02:05Z"\n  },\n  "pusher": {\n    "id": 1,\n    "username": "labuser",\n    "login": "labuser",\n    "full_name": "",\n    "email": "labuser@example.com",\n    "avatar_url": "https://secure.gravatar.com/avatar/fbdecbdeaa8816382d76cf909295b38a?d=identicon"\n  },\n  "sender": {\n    "id": 1,\n    "username": "labuser",\n    "login": "labuser",\n    "full_name": "",\n    "email": "labuser@example.com",\n    "avatar_url": "https://secure.gravatar.com/avatar/fbdecbdeaa8816382d76cf909295b38a?d=identicon"\n  }\n}	1	push	f	t	1606345440800768599	t	{"headers":{"X-Gogs-Delivery":"eb22484c-2e36-48a5-b7f4-8b4215a21b85","X-Gogs-Signature":"709ae12d84a292cee1f5ff18f8e06742886e33724fdeff54a57f4de1420877c0","X-Gogs-Event":"push","Content-Type":"application/json","X-Github-Delivery":"eb22484c-2e36-48a5-b7f4-8b4215a21b85","X-Github-Event":"push"}}	{"status":200,"headers":{"Cache-Control":"no-cache, no-store, must-revalidate, private, max-age=0","X-Xss-Protection":"1; mode=block","Date":"Wed, 25 Nov 2020 23:04:00 GMT","Content-Type":"application/json","X-Accel-Expires":"0","Pragma":"no-cache","X-Frame-Options":"DENY","Content-Length":"721","Expires":"Thu, 01 Jan 1970 00:00:00 UTC"},"body":"{\\"id\\":5,\\"repo_id\\":1,\\"trigger\\":\\"@hook\\",\\"number\\":5,\\"status\\":\\"pending\\",\\"event\\":\\"push\\",\\"action\\":\\"\\",\\"link\\":\\"http://docker-host:8300/labuser/advertisements/compare/d5466367e9fc5d64288025b8d17bb069ee489c6c...5d7cec558e70dab88bcf6fd4fe5c6f231752686e\\",\\"timestamp\\":0,\\"message\\":\\"added docker plugin to drone file\\\\n\\",\\"before\\":\\"\\",\\"after\\":\\"5d7cec558e70dab88bcf6fd4fe5c6f231752686e\\",\\"ref\\":\\"refs/heads/master\\",\\"source_repo\\":\\"\\",\\"source\\":\\"master\\",\\"target\\":\\"master\\",\\"author_login\\":\\"\\",\\"author_name\\":\\"asciimo\\",\\"author_email\\":\\"asciimo@gmail.com\\",\\"author_avatar\\":\\"https://secure.gravatar.com/avatar/fbdecbdeaa8816382d76cf909295b38a?d=identicon\\",\\"sender\\":\\"labuser\\",\\"started\\":0,\\"finished\\":0,\\"created\\":1606345440,\\"updated\\":1606345440,\\"version\\":1}\\n"}
8	1	1	5081163a-01a7-4a5e-beb4-690908450514	1	http://drone-server/hook	dfac3be600b5f8f1d85e2fb2c8d7e1df619b12a02cda422350bdc738ee89abfa	{\n  "ref": "refs/heads/master",\n  "before": "5d7cec558e70dab88bcf6fd4fe5c6f231752686e",\n  "after": "365356d730335364f8752c1131d947ab8e9583c3",\n  "compare_url": "http://docker-host:8300/labuser/advertisements/compare/5d7cec558e70dab88bcf6fd4fe5c6f231752686e...365356d730335364f8752c1131d947ab8e9583c3",\n  "commits": [\n    {\n      "id": "365356d730335364f8752c1131d947ab8e9583c3",\n      "message": "Fixed docker registry url\\n",\n      "url": "http://docker-host:8300/labuser/advertisements/commit/365356d730335364f8752c1131d947ab8e9583c3",\n      "author": {\n        "name": "asciimo",\n        "email": "asciimo@gmail.com",\n        "username": ""\n      },\n      "committer": {\n        "name": "asciimo",\n        "email": "asciimo@gmail.com",\n        "username": ""\n      },\n      "added": null,\n      "removed": null,\n      "modified": [\n        ".drone.yml"\n      ],\n      "timestamp": "2020-11-25T23:42:06Z"\n    }\n  ],\n  "repository": {\n    "id": 1,\n    "owner": {\n      "id": 1,\n      "username": "labuser",\n      "login": "labuser",\n      "full_name": "",\n      "email": "labuser@example.com",\n      "avatar_url": "https://secure.gravatar.com/avatar/fbdecbdeaa8816382d76cf909295b38a?d=identicon"\n    },\n    "name": "advertisements",\n    "full_name": "labuser/advertisements",\n    "description": "",\n    "private": false,\n    "fork": false,\n    "parent": null,\n    "empty": false,\n    "mirror": false,\n    "size": 106496,\n    "html_url": "http://docker-host:8300/labuser/advertisements",\n    "ssh_url": "git@localhost:labuser/advertisements.git",\n    "clone_url": "http://docker-host:8300/labuser/advertisements.git",\n    "website": "",\n    "stars_count": 0,\n    "forks_count": 0,\n    "watchers_count": 1,\n    "open_issues_count": 0,\n    "default_branch": "master",\n    "created_at": "2020-11-22T20:02:05Z",\n    "updated_at": "2020-11-22T20:02:05Z"\n  },\n  "pusher": {\n    "id": 1,\n    "username": "labuser",\n    "login": "labuser",\n    "full_name": "",\n    "email": "labuser@example.com",\n    "avatar_url": "https://secure.gravatar.com/avatar/fbdecbdeaa8816382d76cf909295b38a?d=identicon"\n  },\n  "sender": {\n    "id": 1,\n    "username": "labuser",\n    "login": "labuser",\n    "full_name": "",\n    "email": "labuser@example.com",\n    "avatar_url": "https://secure.gravatar.com/avatar/fbdecbdeaa8816382d76cf909295b38a?d=identicon"\n  }\n}	1	push	f	t	1606347738484755470	t	{"headers":{"X-Github-Delivery":"5081163a-01a7-4a5e-beb4-690908450514","X-Github-Event":"push","X-Gogs-Delivery":"5081163a-01a7-4a5e-beb4-690908450514","X-Gogs-Signature":"dfac3be600b5f8f1d85e2fb2c8d7e1df619b12a02cda422350bdc738ee89abfa","X-Gogs-Event":"push","Content-Type":"application/json"}}	{"status":200,"headers":{"Content-Type":"application/json","Pragma":"no-cache","Date":"Wed, 25 Nov 2020 23:42:18 GMT","Expires":"Thu, 01 Jan 1970 00:00:00 UTC","X-Accel-Expires":"0","X-Frame-Options":"DENY","X-Xss-Protection":"1; mode=block","Cache-Control":"no-cache, no-store, must-revalidate, private, max-age=0","Content-Length":"713"},"body":"{\\"id\\":6,\\"repo_id\\":1,\\"trigger\\":\\"@hook\\",\\"number\\":6,\\"status\\":\\"pending\\",\\"event\\":\\"push\\",\\"action\\":\\"\\",\\"link\\":\\"http://docker-host:8300/labuser/advertisements/compare/5d7cec558e70dab88bcf6fd4fe5c6f231752686e...365356d730335364f8752c1131d947ab8e9583c3\\",\\"timestamp\\":0,\\"message\\":\\"Fixed docker registry url\\\\n\\",\\"before\\":\\"\\",\\"after\\":\\"365356d730335364f8752c1131d947ab8e9583c3\\",\\"ref\\":\\"refs/heads/master\\",\\"source_repo\\":\\"\\",\\"source\\":\\"master\\",\\"target\\":\\"master\\",\\"author_login\\":\\"\\",\\"author_name\\":\\"asciimo\\",\\"author_email\\":\\"asciimo@gmail.com\\",\\"author_avatar\\":\\"https://secure.gravatar.com/avatar/fbdecbdeaa8816382d76cf909295b38a?d=identicon\\",\\"sender\\":\\"labuser\\",\\"started\\":0,\\"finished\\":0,\\"created\\":1606347737,\\"updated\\":1606347737,\\"version\\":1}\\n"}
9	1	1	88ce6a58-83b2-48fa-8307-5870e5e72c4e	1	http://drone-server/hook	f6b964cc87c97983a168abdb3f1ef136009ebfe94ec71c44224d6f5ef0d3b244	{\n  "ref": "refs/heads/master",\n  "before": "365356d730335364f8752c1131d947ab8e9583c3",\n  "after": "90e3a07b4b886c9b56caef4cfc02e8a09dcdcc44",\n  "compare_url": "http://docker-host:8300/labuser/advertisements/compare/365356d730335364f8752c1131d947ab8e9583c3...90e3a07b4b886c9b56caef4cfc02e8a09dcdcc44",\n  "commits": [\n    {\n      "id": "90e3a07b4b886c9b56caef4cfc02e8a09dcdcc44",\n      "message": "tweaked drone file\\n",\n      "url": "http://docker-host:8300/labuser/advertisements/commit/90e3a07b4b886c9b56caef4cfc02e8a09dcdcc44",\n      "author": {\n        "name": "asciimo",\n        "email": "asciimo@gmail.com",\n        "username": ""\n      },\n      "committer": {\n        "name": "asciimo",\n        "email": "asciimo@gmail.com",\n        "username": ""\n      },\n      "added": null,\n      "removed": null,\n      "modified": [\n        ".drone.yml"\n      ],\n      "timestamp": "2020-11-26T00:00:16Z"\n    }\n  ],\n  "repository": {\n    "id": 1,\n    "owner": {\n      "id": 1,\n      "username": "labuser",\n      "login": "labuser",\n      "full_name": "",\n      "email": "labuser@example.com",\n      "avatar_url": "https://secure.gravatar.com/avatar/fbdecbdeaa8816382d76cf909295b38a?d=identicon"\n    },\n    "name": "advertisements",\n    "full_name": "labuser/advertisements",\n    "description": "",\n    "private": false,\n    "fork": false,\n    "parent": null,\n    "empty": false,\n    "mirror": false,\n    "size": 118784,\n    "html_url": "http://docker-host:8300/labuser/advertisements",\n    "ssh_url": "git@localhost:labuser/advertisements.git",\n    "clone_url": "http://docker-host:8300/labuser/advertisements.git",\n    "website": "",\n    "stars_count": 0,\n    "forks_count": 0,\n    "watchers_count": 1,\n    "open_issues_count": 0,\n    "default_branch": "master",\n    "created_at": "2020-11-22T20:02:05Z",\n    "updated_at": "2020-11-22T20:02:05Z"\n  },\n  "pusher": {\n    "id": 1,\n    "username": "labuser",\n    "login": "labuser",\n    "full_name": "",\n    "email": "labuser@example.com",\n    "avatar_url": "https://secure.gravatar.com/avatar/fbdecbdeaa8816382d76cf909295b38a?d=identicon"\n  },\n  "sender": {\n    "id": 1,\n    "username": "labuser",\n    "login": "labuser",\n    "full_name": "",\n    "email": "labuser@example.com",\n    "avatar_url": "https://secure.gravatar.com/avatar/fbdecbdeaa8816382d76cf909295b38a?d=identicon"\n  }\n}	1	push	f	t	1606348828641676180	t	{"headers":{"X-Gogs-Event":"push","Content-Type":"application/json","X-Github-Delivery":"88ce6a58-83b2-48fa-8307-5870e5e72c4e","X-Github-Event":"push","X-Gogs-Delivery":"88ce6a58-83b2-48fa-8307-5870e5e72c4e","X-Gogs-Signature":"f6b964cc87c97983a168abdb3f1ef136009ebfe94ec71c44224d6f5ef0d3b244"}}	{"status":200,"headers":{"Date":"Thu, 26 Nov 2020 00:00:28 GMT","Cache-Control":"no-cache, no-store, must-revalidate, private, max-age=0","Pragma":"no-cache","X-Xss-Protection":"1; mode=block","Expires":"Thu, 01 Jan 1970 00:00:00 UTC","X-Accel-Expires":"0","Content-Length":"706","X-Frame-Options":"DENY","Content-Type":"application/json"},"body":"{\\"id\\":7,\\"repo_id\\":1,\\"trigger\\":\\"@hook\\",\\"number\\":7,\\"status\\":\\"pending\\",\\"event\\":\\"push\\",\\"action\\":\\"\\",\\"link\\":\\"http://docker-host:8300/labuser/advertisements/compare/365356d730335364f8752c1131d947ab8e9583c3...90e3a07b4b886c9b56caef4cfc02e8a09dcdcc44\\",\\"timestamp\\":0,\\"message\\":\\"tweaked drone file\\\\n\\",\\"before\\":\\"\\",\\"after\\":\\"90e3a07b4b886c9b56caef4cfc02e8a09dcdcc44\\",\\"ref\\":\\"refs/heads/master\\",\\"source_repo\\":\\"\\",\\"source\\":\\"master\\",\\"target\\":\\"master\\",\\"author_login\\":\\"\\",\\"author_name\\":\\"asciimo\\",\\"author_email\\":\\"asciimo@gmail.com\\",\\"author_avatar\\":\\"https://secure.gravatar.com/avatar/fbdecbdeaa8816382d76cf909295b38a?d=identicon\\",\\"sender\\":\\"labuser\\",\\"started\\":0,\\"finished\\":0,\\"created\\":1606348827,\\"updated\\":1606348827,\\"version\\":1}\\n"}
10	1	1	8da31ad0-f0a8-45e5-931c-df49bde77dd1	1	http://drone-server/hook	7ca5ba8cb36e74fd16addf38514217910901281baf057970d59434d5f9279b8a	{\n  "ref": "refs/heads/master",\n  "before": "90e3a07b4b886c9b56caef4cfc02e8a09dcdcc44",\n  "after": "0b24f735f492d58b68fc6755f520b016a1b1d09f",\n  "compare_url": "http://docker-host:8300/labuser/advertisements/compare/90e3a07b4b886c9b56caef4cfc02e8a09dcdcc44...0b24f735f492d58b68fc6755f520b016a1b1d09f",\n  "commits": [\n    {\n      "id": "0b24f735f492d58b68fc6755f520b016a1b1d09f",\n      "message": "More drone file fuckery\\n",\n      "url": "http://docker-host:8300/labuser/advertisements/commit/0b24f735f492d58b68fc6755f520b016a1b1d09f",\n      "author": {\n        "name": "asciimo",\n        "email": "asciimo@gmail.com",\n        "username": ""\n      },\n      "committer": {\n        "name": "asciimo",\n        "email": "asciimo@gmail.com",\n        "username": ""\n      },\n      "added": null,\n      "removed": null,\n      "modified": [\n        ".drone.yml"\n      ],\n      "timestamp": "2020-11-26T00:31:15Z"\n    }\n  ],\n  "repository": {\n    "id": 1,\n    "owner": {\n      "id": 1,\n      "username": "labuser",\n      "login": "labuser",\n      "full_name": "",\n      "email": "labuser@example.com",\n      "avatar_url": "https://secure.gravatar.com/avatar/fbdecbdeaa8816382d76cf909295b38a?d=identicon"\n    },\n    "name": "advertisements",\n    "full_name": "labuser/advertisements",\n    "description": "",\n    "private": false,\n    "fork": false,\n    "parent": null,\n    "empty": false,\n    "mirror": false,\n    "size": 131072,\n    "html_url": "http://docker-host:8300/labuser/advertisements",\n    "ssh_url": "git@localhost:labuser/advertisements.git",\n    "clone_url": "http://docker-host:8300/labuser/advertisements.git",\n    "website": "",\n    "stars_count": 0,\n    "forks_count": 0,\n    "watchers_count": 1,\n    "open_issues_count": 0,\n    "default_branch": "master",\n    "created_at": "2020-11-22T20:02:05Z",\n    "updated_at": "2020-11-22T20:02:05Z"\n  },\n  "pusher": {\n    "id": 1,\n    "username": "labuser",\n    "login": "labuser",\n    "full_name": "",\n    "email": "labuser@example.com",\n    "avatar_url": "https://secure.gravatar.com/avatar/fbdecbdeaa8816382d76cf909295b38a?d=identicon"\n  },\n  "sender": {\n    "id": 1,\n    "username": "labuser",\n    "login": "labuser",\n    "full_name": "",\n    "email": "labuser@example.com",\n    "avatar_url": "https://secure.gravatar.com/avatar/fbdecbdeaa8816382d76cf909295b38a?d=identicon"\n  }\n}	1	push	f	t	1606350689458464411	t	{"headers":{"X-Github-Delivery":"8da31ad0-f0a8-45e5-931c-df49bde77dd1","X-Github-Event":"push","X-Gogs-Delivery":"8da31ad0-f0a8-45e5-931c-df49bde77dd1","X-Gogs-Signature":"7ca5ba8cb36e74fd16addf38514217910901281baf057970d59434d5f9279b8a","X-Gogs-Event":"push","Content-Type":"application/json"}}	{"status":200,"headers":{"Content-Length":"711","Pragma":"no-cache","X-Xss-Protection":"1; mode=block","Expires":"Thu, 01 Jan 1970 00:00:00 UTC","X-Accel-Expires":"0","Date":"Thu, 26 Nov 2020 00:31:29 GMT","Cache-Control":"no-cache, no-store, must-revalidate, private, max-age=0","Content-Type":"application/json","X-Frame-Options":"DENY"},"body":"{\\"id\\":8,\\"repo_id\\":1,\\"trigger\\":\\"@hook\\",\\"number\\":8,\\"status\\":\\"pending\\",\\"event\\":\\"push\\",\\"action\\":\\"\\",\\"link\\":\\"http://docker-host:8300/labuser/advertisements/compare/90e3a07b4b886c9b56caef4cfc02e8a09dcdcc44...0b24f735f492d58b68fc6755f520b016a1b1d09f\\",\\"timestamp\\":0,\\"message\\":\\"More drone file fuckery\\\\n\\",\\"before\\":\\"\\",\\"after\\":\\"0b24f735f492d58b68fc6755f520b016a1b1d09f\\",\\"ref\\":\\"refs/heads/master\\",\\"source_repo\\":\\"\\",\\"source\\":\\"master\\",\\"target\\":\\"master\\",\\"author_login\\":\\"\\",\\"author_name\\":\\"asciimo\\",\\"author_email\\":\\"asciimo@gmail.com\\",\\"author_avatar\\":\\"https://secure.gravatar.com/avatar/fbdecbdeaa8816382d76cf909295b38a?d=identicon\\",\\"sender\\":\\"labuser\\",\\"started\\":0,\\"finished\\":0,\\"created\\":1606350688,\\"updated\\":1606350688,\\"version\\":1}\\n"}
11	1	1	658ec9ca-8998-4485-a9f5-3ecffe86c160	1	http://drone-server/hook	f57ae26123de372760e56f3ef905fe4577cfcb5921717e57dd02282453dc0dcd	{\n  "ref": "refs/heads/master",\n  "before": "0b24f735f492d58b68fc6755f520b016a1b1d09f",\n  "after": "ac04c50d6d8c621543b85e65070a0d091a71c64c",\n  "compare_url": "http://docker-host:8300/labuser/advertisements/compare/0b24f735f492d58b68fc6755f520b016a1b1d09f...ac04c50d6d8c621543b85e65070a0d091a71c64c",\n  "commits": [\n    {\n      "id": "ac04c50d6d8c621543b85e65070a0d091a71c64c",\n      "message": "Goes on and on\\n",\n      "url": "http://docker-host:8300/labuser/advertisements/commit/ac04c50d6d8c621543b85e65070a0d091a71c64c",\n      "author": {\n        "name": "asciimo",\n        "email": "asciimo@gmail.com",\n        "username": ""\n      },\n      "committer": {\n        "name": "asciimo",\n        "email": "asciimo@gmail.com",\n        "username": ""\n      },\n      "added": null,\n      "removed": null,\n      "modified": [\n        ".drone.yml"\n      ],\n      "timestamp": "2020-11-26T00:38:13Z"\n    }\n  ],\n  "repository": {\n    "id": 1,\n    "owner": {\n      "id": 1,\n      "username": "labuser",\n      "login": "labuser",\n      "full_name": "",\n      "email": "labuser@example.com",\n      "avatar_url": "https://secure.gravatar.com/avatar/fbdecbdeaa8816382d76cf909295b38a?d=identicon"\n    },\n    "name": "advertisements",\n    "full_name": "labuser/advertisements",\n    "description": "",\n    "private": false,\n    "fork": false,\n    "parent": null,\n    "empty": false,\n    "mirror": false,\n    "size": 143360,\n    "html_url": "http://docker-host:8300/labuser/advertisements",\n    "ssh_url": "git@localhost:labuser/advertisements.git",\n    "clone_url": "http://docker-host:8300/labuser/advertisements.git",\n    "website": "",\n    "stars_count": 0,\n    "forks_count": 0,\n    "watchers_count": 1,\n    "open_issues_count": 0,\n    "default_branch": "master",\n    "created_at": "2020-11-22T20:02:05Z",\n    "updated_at": "2020-11-22T20:02:05Z"\n  },\n  "pusher": {\n    "id": 1,\n    "username": "labuser",\n    "login": "labuser",\n    "full_name": "",\n    "email": "labuser@example.com",\n    "avatar_url": "https://secure.gravatar.com/avatar/fbdecbdeaa8816382d76cf909295b38a?d=identicon"\n  },\n  "sender": {\n    "id": 1,\n    "username": "labuser",\n    "login": "labuser",\n    "full_name": "",\n    "email": "labuser@example.com",\n    "avatar_url": "https://secure.gravatar.com/avatar/fbdecbdeaa8816382d76cf909295b38a?d=identicon"\n  }\n}	1	push	f	t	1606351109285476294	t	{"headers":{"X-Gogs-Event":"push","Content-Type":"application/json","X-Github-Delivery":"658ec9ca-8998-4485-a9f5-3ecffe86c160","X-Github-Event":"push","X-Gogs-Delivery":"658ec9ca-8998-4485-a9f5-3ecffe86c160","X-Gogs-Signature":"f57ae26123de372760e56f3ef905fe4577cfcb5921717e57dd02282453dc0dcd"}}	{"status":200,"headers":{"X-Frame-Options":"DENY","Content-Type":"application/json","Cache-Control":"no-cache, no-store, must-revalidate, private, max-age=0","X-Xss-Protection":"1; mode=block","X-Accel-Expires":"0","Expires":"Thu, 01 Jan 1970 00:00:00 UTC","Pragma":"no-cache","Content-Length":"702","Date":"Thu, 26 Nov 2020 00:38:29 GMT"},"body":"{\\"id\\":9,\\"repo_id\\":1,\\"trigger\\":\\"@hook\\",\\"number\\":9,\\"status\\":\\"pending\\",\\"event\\":\\"push\\",\\"action\\":\\"\\",\\"link\\":\\"http://docker-host:8300/labuser/advertisements/compare/0b24f735f492d58b68fc6755f520b016a1b1d09f...ac04c50d6d8c621543b85e65070a0d091a71c64c\\",\\"timestamp\\":0,\\"message\\":\\"Goes on and on\\\\n\\",\\"before\\":\\"\\",\\"after\\":\\"ac04c50d6d8c621543b85e65070a0d091a71c64c\\",\\"ref\\":\\"refs/heads/master\\",\\"source_repo\\":\\"\\",\\"source\\":\\"master\\",\\"target\\":\\"master\\",\\"author_login\\":\\"\\",\\"author_name\\":\\"asciimo\\",\\"author_email\\":\\"asciimo@gmail.com\\",\\"author_avatar\\":\\"https://secure.gravatar.com/avatar/fbdecbdeaa8816382d76cf909295b38a?d=identicon\\",\\"sender\\":\\"labuser\\",\\"started\\":0,\\"finished\\":0,\\"created\\":1606351108,\\"updated\\":1606351108,\\"version\\":1}\\n"}
12	1	1	828c590d-4d3a-434b-bee9-ad177f382fb1	1	http://drone-server/hook	fdc92d3c2276c446c2c7a0609d7fc2a5a9cda7a1a1b3587d115b9b09369eb105	{\n  "ref": "refs/heads/master",\n  "before": "ac04c50d6d8c621543b85e65070a0d091a71c64c",\n  "after": "0bcb215ed685f8ed3b5a823824e9e368dd462db8",\n  "compare_url": "http://docker-host:8300/labuser/advertisements/compare/ac04c50d6d8c621543b85e65070a0d091a71c64c...0bcb215ed685f8ed3b5a823824e9e368dd462db8",\n  "commits": [\n    {\n      "id": "0bcb215ed685f8ed3b5a823824e9e368dd462db8",\n      "message": "... on and on\\n",\n      "url": "http://docker-host:8300/labuser/advertisements/commit/0bcb215ed685f8ed3b5a823824e9e368dd462db8",\n      "author": {\n        "name": "asciimo",\n        "email": "asciimo@gmail.com",\n        "username": ""\n      },\n      "committer": {\n        "name": "asciimo",\n        "email": "asciimo@gmail.com",\n        "username": ""\n      },\n      "added": null,\n      "removed": null,\n      "modified": [\n        ".drone.yml"\n      ],\n      "timestamp": "2020-11-26T00:41:05Z"\n    }\n  ],\n  "repository": {\n    "id": 1,\n    "owner": {\n      "id": 1,\n      "username": "labuser",\n      "login": "labuser",\n      "full_name": "",\n      "email": "labuser@example.com",\n      "avatar_url": "https://secure.gravatar.com/avatar/fbdecbdeaa8816382d76cf909295b38a?d=identicon"\n    },\n    "name": "advertisements",\n    "full_name": "labuser/advertisements",\n    "description": "",\n    "private": false,\n    "fork": false,\n    "parent": null,\n    "empty": false,\n    "mirror": false,\n    "size": 155648,\n    "html_url": "http://docker-host:8300/labuser/advertisements",\n    "ssh_url": "git@localhost:labuser/advertisements.git",\n    "clone_url": "http://docker-host:8300/labuser/advertisements.git",\n    "website": "",\n    "stars_count": 0,\n    "forks_count": 0,\n    "watchers_count": 1,\n    "open_issues_count": 0,\n    "default_branch": "master",\n    "created_at": "2020-11-22T20:02:05Z",\n    "updated_at": "2020-11-22T20:02:05Z"\n  },\n  "pusher": {\n    "id": 1,\n    "username": "labuser",\n    "login": "labuser",\n    "full_name": "",\n    "email": "labuser@example.com",\n    "avatar_url": "https://secure.gravatar.com/avatar/fbdecbdeaa8816382d76cf909295b38a?d=identicon"\n  },\n  "sender": {\n    "id": 1,\n    "username": "labuser",\n    "login": "labuser",\n    "full_name": "",\n    "email": "labuser@example.com",\n    "avatar_url": "https://secure.gravatar.com/avatar/fbdecbdeaa8816382d76cf909295b38a?d=identicon"\n  }\n}	1	push	f	t	1606351274049590416	t	{"headers":{"X-Gogs-Event":"push","Content-Type":"application/json","X-Github-Delivery":"828c590d-4d3a-434b-bee9-ad177f382fb1","X-Github-Event":"push","X-Gogs-Delivery":"828c590d-4d3a-434b-bee9-ad177f382fb1","X-Gogs-Signature":"fdc92d3c2276c446c2c7a0609d7fc2a5a9cda7a1a1b3587d115b9b09369eb105"}}	{"status":200,"headers":{"X-Frame-Options":"DENY","X-Xss-Protection":"1; mode=block","Cache-Control":"no-cache, no-store, must-revalidate, private, max-age=0","Pragma":"no-cache","Content-Type":"application/json","Content-Length":"703","Expires":"Thu, 01 Jan 1970 00:00:00 UTC","X-Accel-Expires":"0","Date":"Thu, 26 Nov 2020 00:41:14 GMT"},"body":"{\\"id\\":10,\\"repo_id\\":1,\\"trigger\\":\\"@hook\\",\\"number\\":10,\\"status\\":\\"pending\\",\\"event\\":\\"push\\",\\"action\\":\\"\\",\\"link\\":\\"http://docker-host:8300/labuser/advertisements/compare/ac04c50d6d8c621543b85e65070a0d091a71c64c...0bcb215ed685f8ed3b5a823824e9e368dd462db8\\",\\"timestamp\\":0,\\"message\\":\\"... on and on\\\\n\\",\\"before\\":\\"\\",\\"after\\":\\"0bcb215ed685f8ed3b5a823824e9e368dd462db8\\",\\"ref\\":\\"refs/heads/master\\",\\"source_repo\\":\\"\\",\\"source\\":\\"master\\",\\"target\\":\\"master\\",\\"author_login\\":\\"\\",\\"author_name\\":\\"asciimo\\",\\"author_email\\":\\"asciimo@gmail.com\\",\\"author_avatar\\":\\"https://secure.gravatar.com/avatar/fbdecbdeaa8816382d76cf909295b38a?d=identicon\\",\\"sender\\":\\"labuser\\",\\"started\\":0,\\"finished\\":0,\\"created\\":1606351273,\\"updated\\":1606351273,\\"version\\":1}\\n"}
13	1	1	a7cec9b0-a5fa-45d8-be60-586b23403015	1	http://drone-server/hook	5543a5b0ca7cc20b558b6641dfe18bb07b995457b2bbf1538bd5230768f3890d	{\n  "ref": "refs/heads/master",\n  "before": "0bcb215ed685f8ed3b5a823824e9e368dd462db8",\n  "after": "7d57fa1e424f5a007436871e8a2ae33e67f3c993",\n  "compare_url": "http://docker-host:8300/labuser/advertisements/compare/0bcb215ed685f8ed3b5a823824e9e368dd462db8...7d57fa1e424f5a007436871e8a2ae33e67f3c993",\n  "commits": [\n    {\n      "id": "7d57fa1e424f5a007436871e8a2ae33e67f3c993",\n      "message": "etc etc etc\\n",\n      "url": "http://docker-host:8300/labuser/advertisements/commit/7d57fa1e424f5a007436871e8a2ae33e67f3c993",\n      "author": {\n        "name": "asciimo",\n        "email": "asciimo@gmail.com",\n        "username": ""\n      },\n      "committer": {\n        "name": "asciimo",\n        "email": "asciimo@gmail.com",\n        "username": ""\n      },\n      "added": null,\n      "removed": null,\n      "modified": [\n        ".drone.yml"\n      ],\n      "timestamp": "2020-11-26T00:56:03Z"\n    }\n  ],\n  "repository": {\n    "id": 1,\n    "owner": {\n      "id": 1,\n      "username": "labuser",\n      "login": "labuser",\n      "full_name": "",\n      "email": "labuser@example.com",\n      "avatar_url": "https://secure.gravatar.com/avatar/fbdecbdeaa8816382d76cf909295b38a?d=identicon"\n    },\n    "name": "advertisements",\n    "full_name": "labuser/advertisements",\n    "description": "",\n    "private": false,\n    "fork": false,\n    "parent": null,\n    "empty": false,\n    "mirror": false,\n    "size": 167936,\n    "html_url": "http://docker-host:8300/labuser/advertisements",\n    "ssh_url": "git@localhost:labuser/advertisements.git",\n    "clone_url": "http://docker-host:8300/labuser/advertisements.git",\n    "website": "",\n    "stars_count": 0,\n    "forks_count": 0,\n    "watchers_count": 1,\n    "open_issues_count": 0,\n    "default_branch": "master",\n    "created_at": "2020-11-22T20:02:05Z",\n    "updated_at": "2020-11-22T20:02:05Z"\n  },\n  "pusher": {\n    "id": 1,\n    "username": "labuser",\n    "login": "labuser",\n    "full_name": "",\n    "email": "labuser@example.com",\n    "avatar_url": "https://secure.gravatar.com/avatar/fbdecbdeaa8816382d76cf909295b38a?d=identicon"\n  },\n  "sender": {\n    "id": 1,\n    "username": "labuser",\n    "login": "labuser",\n    "full_name": "",\n    "email": "labuser@example.com",\n    "avatar_url": "https://secure.gravatar.com/avatar/fbdecbdeaa8816382d76cf909295b38a?d=identicon"\n  }\n}	1	push	f	t	1606352173589800837	t	{"headers":{"X-Gogs-Signature":"5543a5b0ca7cc20b558b6641dfe18bb07b995457b2bbf1538bd5230768f3890d","X-Gogs-Event":"push","Content-Type":"application/json","X-Github-Delivery":"a7cec9b0-a5fa-45d8-be60-586b23403015","X-Github-Event":"push","X-Gogs-Delivery":"a7cec9b0-a5fa-45d8-be60-586b23403015"}}	{"status":200,"headers":{"Content-Type":"application/json","Expires":"Thu, 01 Jan 1970 00:00:00 UTC","Pragma":"no-cache","X-Xss-Protection":"1; mode=block","Cache-Control":"no-cache, no-store, must-revalidate, private, max-age=0","Date":"Thu, 26 Nov 2020 00:56:13 GMT","X-Frame-Options":"DENY","Content-Length":"701","X-Accel-Expires":"0"},"body":"{\\"id\\":11,\\"repo_id\\":1,\\"trigger\\":\\"@hook\\",\\"number\\":11,\\"status\\":\\"pending\\",\\"event\\":\\"push\\",\\"action\\":\\"\\",\\"link\\":\\"http://docker-host:8300/labuser/advertisements/compare/0bcb215ed685f8ed3b5a823824e9e368dd462db8...7d57fa1e424f5a007436871e8a2ae33e67f3c993\\",\\"timestamp\\":0,\\"message\\":\\"etc etc etc\\\\n\\",\\"before\\":\\"\\",\\"after\\":\\"7d57fa1e424f5a007436871e8a2ae33e67f3c993\\",\\"ref\\":\\"refs/heads/master\\",\\"source_repo\\":\\"\\",\\"source\\":\\"master\\",\\"target\\":\\"master\\",\\"author_login\\":\\"\\",\\"author_name\\":\\"asciimo\\",\\"author_email\\":\\"asciimo@gmail.com\\",\\"author_avatar\\":\\"https://secure.gravatar.com/avatar/fbdecbdeaa8816382d76cf909295b38a?d=identicon\\",\\"sender\\":\\"labuser\\",\\"started\\":0,\\"finished\\":0,\\"created\\":1606352172,\\"updated\\":1606352172,\\"version\\":1}\\n"}
14	1	1	5faa28c8-a40c-4aaf-96bb-da11ab530ff8	1	http://drone-server/hook	074601c5b7b45e0973c38f45677b20b3562216277aafa4ee85fd7d7328fe3c43	{\n  "ref": "refs/heads/master",\n  "before": "7d57fa1e424f5a007436871e8a2ae33e67f3c993",\n  "after": "0253fc330204ffa30032737d4a9e5db95280f016",\n  "compare_url": "http://docker-host:8300/labuser/advertisements/compare/7d57fa1e424f5a007436871e8a2ae33e67f3c993...0253fc330204ffa30032737d4a9e5db95280f016",\n  "commits": [\n    {\n      "id": "0253fc330204ffa30032737d4a9e5db95280f016",\n      "message": "etc etc etc\\n",\n      "url": "http://docker-host:8300/labuser/advertisements/commit/0253fc330204ffa30032737d4a9e5db95280f016",\n      "author": {\n        "name": "asciimo",\n        "email": "asciimo@gmail.com",\n        "username": ""\n      },\n      "committer": {\n        "name": "asciimo",\n        "email": "asciimo@gmail.com",\n        "username": ""\n      },\n      "added": null,\n      "removed": null,\n      "modified": [\n        ".drone.yml"\n      ],\n      "timestamp": "2020-11-26T00:59:40Z"\n    }\n  ],\n  "repository": {\n    "id": 1,\n    "owner": {\n      "id": 1,\n      "username": "labuser",\n      "login": "labuser",\n      "full_name": "",\n      "email": "labuser@example.com",\n      "avatar_url": "https://secure.gravatar.com/avatar/fbdecbdeaa8816382d76cf909295b38a?d=identicon"\n    },\n    "name": "advertisements",\n    "full_name": "labuser/advertisements",\n    "description": "",\n    "private": false,\n    "fork": false,\n    "parent": null,\n    "empty": false,\n    "mirror": false,\n    "size": 180224,\n    "html_url": "http://docker-host:8300/labuser/advertisements",\n    "ssh_url": "git@localhost:labuser/advertisements.git",\n    "clone_url": "http://docker-host:8300/labuser/advertisements.git",\n    "website": "",\n    "stars_count": 0,\n    "forks_count": 0,\n    "watchers_count": 1,\n    "open_issues_count": 0,\n    "default_branch": "master",\n    "created_at": "2020-11-22T20:02:05Z",\n    "updated_at": "2020-11-22T20:02:05Z"\n  },\n  "pusher": {\n    "id": 1,\n    "username": "labuser",\n    "login": "labuser",\n    "full_name": "",\n    "email": "labuser@example.com",\n    "avatar_url": "https://secure.gravatar.com/avatar/fbdecbdeaa8816382d76cf909295b38a?d=identicon"\n  },\n  "sender": {\n    "id": 1,\n    "username": "labuser",\n    "login": "labuser",\n    "full_name": "",\n    "email": "labuser@example.com",\n    "avatar_url": "https://secure.gravatar.com/avatar/fbdecbdeaa8816382d76cf909295b38a?d=identicon"\n  }\n}	1	push	f	t	1606352389548216015	t	{"headers":{"Content-Type":"application/json","X-Github-Delivery":"5faa28c8-a40c-4aaf-96bb-da11ab530ff8","X-Github-Event":"push","X-Gogs-Delivery":"5faa28c8-a40c-4aaf-96bb-da11ab530ff8","X-Gogs-Signature":"074601c5b7b45e0973c38f45677b20b3562216277aafa4ee85fd7d7328fe3c43","X-Gogs-Event":"push"}}	{"status":200,"headers":{"Content-Type":"application/json","X-Xss-Protection":"1; mode=block","Cache-Control":"no-cache, no-store, must-revalidate, private, max-age=0","Pragma":"no-cache","Content-Length":"701","X-Frame-Options":"DENY","Date":"Thu, 26 Nov 2020 00:59:49 GMT","Expires":"Thu, 01 Jan 1970 00:00:00 UTC","X-Accel-Expires":"0"},"body":"{\\"id\\":12,\\"repo_id\\":1,\\"trigger\\":\\"@hook\\",\\"number\\":12,\\"status\\":\\"pending\\",\\"event\\":\\"push\\",\\"action\\":\\"\\",\\"link\\":\\"http://docker-host:8300/labuser/advertisements/compare/7d57fa1e424f5a007436871e8a2ae33e67f3c993...0253fc330204ffa30032737d4a9e5db95280f016\\",\\"timestamp\\":0,\\"message\\":\\"etc etc etc\\\\n\\",\\"before\\":\\"\\",\\"after\\":\\"0253fc330204ffa30032737d4a9e5db95280f016\\",\\"ref\\":\\"refs/heads/master\\",\\"source_repo\\":\\"\\",\\"source\\":\\"master\\",\\"target\\":\\"master\\",\\"author_login\\":\\"\\",\\"author_name\\":\\"asciimo\\",\\"author_email\\":\\"asciimo@gmail.com\\",\\"author_avatar\\":\\"https://secure.gravatar.com/avatar/fbdecbdeaa8816382d76cf909295b38a?d=identicon\\",\\"sender\\":\\"labuser\\",\\"started\\":0,\\"finished\\":0,\\"created\\":1606352388,\\"updated\\":1606352388,\\"version\\":1}\\n"}
15	1	1	6393249d-29ce-4c2f-bfb8-ce1a3d946afa	1	http://drone-server/hook	b35b0d235b2456bbfa7658f3474d27d2f60954d087f42d272975f24addee67d8	{\n  "ref": "refs/heads/master",\n  "before": "0253fc330204ffa30032737d4a9e5db95280f016",\n  "after": "d1007b940094e1411041ea2a617c9d779ba8244a",\n  "compare_url": "http://docker-host:8300/labuser/advertisements/compare/0253fc330204ffa30032737d4a9e5db95280f016...d1007b940094e1411041ea2a617c9d779ba8244a",\n  "commits": [\n    {\n      "id": "d1007b940094e1411041ea2a617c9d779ba8244a",\n      "message": "Made insecure\\n",\n      "url": "http://docker-host:8300/labuser/advertisements/commit/d1007b940094e1411041ea2a617c9d779ba8244a",\n      "author": {\n        "name": "asciimo",\n        "email": "asciimo@gmail.com",\n        "username": ""\n      },\n      "committer": {\n        "name": "asciimo",\n        "email": "asciimo@gmail.com",\n        "username": ""\n      },\n      "added": null,\n      "removed": null,\n      "modified": [\n        ".drone.yml"\n      ],\n      "timestamp": "2020-11-26T02:01:59Z"\n    }\n  ],\n  "repository": {\n    "id": 1,\n    "owner": {\n      "id": 1,\n      "username": "labuser",\n      "login": "labuser",\n      "full_name": "",\n      "email": "labuser@example.com",\n      "avatar_url": "https://secure.gravatar.com/avatar/fbdecbdeaa8816382d76cf909295b38a?d=identicon"\n    },\n    "name": "advertisements",\n    "full_name": "labuser/advertisements",\n    "description": "",\n    "private": false,\n    "fork": false,\n    "parent": null,\n    "empty": false,\n    "mirror": false,\n    "size": 192512,\n    "html_url": "http://docker-host:8300/labuser/advertisements",\n    "ssh_url": "git@localhost:labuser/advertisements.git",\n    "clone_url": "http://docker-host:8300/labuser/advertisements.git",\n    "website": "",\n    "stars_count": 0,\n    "forks_count": 0,\n    "watchers_count": 1,\n    "open_issues_count": 0,\n    "default_branch": "master",\n    "created_at": "2020-11-22T20:02:05Z",\n    "updated_at": "2020-11-22T20:02:05Z"\n  },\n  "pusher": {\n    "id": 1,\n    "username": "labuser",\n    "login": "labuser",\n    "full_name": "",\n    "email": "labuser@example.com",\n    "avatar_url": "https://secure.gravatar.com/avatar/fbdecbdeaa8816382d76cf909295b38a?d=identicon"\n  },\n  "sender": {\n    "id": 1,\n    "username": "labuser",\n    "login": "labuser",\n    "full_name": "",\n    "email": "labuser@example.com",\n    "avatar_url": "https://secure.gravatar.com/avatar/fbdecbdeaa8816382d76cf909295b38a?d=identicon"\n  }\n}	1	push	f	t	1606356129776346886	t	{"headers":{"X-Gogs-Event":"push","Content-Type":"application/json","X-Github-Delivery":"6393249d-29ce-4c2f-bfb8-ce1a3d946afa","X-Github-Event":"push","X-Gogs-Delivery":"6393249d-29ce-4c2f-bfb8-ce1a3d946afa","X-Gogs-Signature":"b35b0d235b2456bbfa7658f3474d27d2f60954d087f42d272975f24addee67d8"}}	{"status":200,"headers":{"Content-Length":"703","Pragma":"no-cache","Date":"Thu, 26 Nov 2020 02:02:09 GMT","X-Accel-Expires":"0","Expires":"Thu, 01 Jan 1970 00:00:00 UTC","X-Xss-Protection":"1; mode=block","X-Frame-Options":"DENY","Cache-Control":"no-cache, no-store, must-revalidate, private, max-age=0","Content-Type":"application/json"},"body":"{\\"id\\":13,\\"repo_id\\":1,\\"trigger\\":\\"@hook\\",\\"number\\":13,\\"status\\":\\"pending\\",\\"event\\":\\"push\\",\\"action\\":\\"\\",\\"link\\":\\"http://docker-host:8300/labuser/advertisements/compare/0253fc330204ffa30032737d4a9e5db95280f016...d1007b940094e1411041ea2a617c9d779ba8244a\\",\\"timestamp\\":0,\\"message\\":\\"Made insecure\\\\n\\",\\"before\\":\\"\\",\\"after\\":\\"d1007b940094e1411041ea2a617c9d779ba8244a\\",\\"ref\\":\\"refs/heads/master\\",\\"source_repo\\":\\"\\",\\"source\\":\\"master\\",\\"target\\":\\"master\\",\\"author_login\\":\\"\\",\\"author_name\\":\\"asciimo\\",\\"author_email\\":\\"asciimo@gmail.com\\",\\"author_avatar\\":\\"https://secure.gravatar.com/avatar/fbdecbdeaa8816382d76cf909295b38a?d=identicon\\",\\"sender\\":\\"labuser\\",\\"started\\":0,\\"finished\\":0,\\"created\\":1606356129,\\"updated\\":1606356129,\\"version\\":1}\\n"}
16	1	1	f8dff22a-97f4-40b4-92d9-95862144334b	1	http://drone-server/hook	da37c3a30f61dbd837ef4726029edc61af1a36a68f897f8870ff77920e4eb99f	{\n  "ref": "refs/heads/master",\n  "before": "d1007b940094e1411041ea2a617c9d779ba8244a",\n  "after": "00f7dce2c44dd91fd35762ac2b94a0c15605c88c",\n  "compare_url": "http://docker-host:8300/labuser/advertisements/compare/d1007b940094e1411041ea2a617c9d779ba8244a...00f7dce2c44dd91fd35762ac2b94a0c15605c88c",\n  "commits": [\n    {\n      "id": "00f7dce2c44dd91fd35762ac2b94a0c15605c88c",\n      "message": "more experiments\\n",\n      "url": "http://docker-host:8300/labuser/advertisements/commit/00f7dce2c44dd91fd35762ac2b94a0c15605c88c",\n      "author": {\n        "name": "asciimo",\n        "email": "asciimo@gmail.com",\n        "username": ""\n      },\n      "committer": {\n        "name": "asciimo",\n        "email": "asciimo@gmail.com",\n        "username": ""\n      },\n      "added": null,\n      "removed": null,\n      "modified": [\n        ".drone.yml"\n      ],\n      "timestamp": "2020-11-26T02:04:15Z"\n    }\n  ],\n  "repository": {\n    "id": 1,\n    "owner": {\n      "id": 1,\n      "username": "labuser",\n      "login": "labuser",\n      "full_name": "",\n      "email": "labuser@example.com",\n      "avatar_url": "https://secure.gravatar.com/avatar/fbdecbdeaa8816382d76cf909295b38a?d=identicon"\n    },\n    "name": "advertisements",\n    "full_name": "labuser/advertisements",\n    "description": "",\n    "private": false,\n    "fork": false,\n    "parent": null,\n    "empty": false,\n    "mirror": false,\n    "size": 204800,\n    "html_url": "http://docker-host:8300/labuser/advertisements",\n    "ssh_url": "git@localhost:labuser/advertisements.git",\n    "clone_url": "http://docker-host:8300/labuser/advertisements.git",\n    "website": "",\n    "stars_count": 0,\n    "forks_count": 0,\n    "watchers_count": 1,\n    "open_issues_count": 0,\n    "default_branch": "master",\n    "created_at": "2020-11-22T20:02:05Z",\n    "updated_at": "2020-11-22T20:02:05Z"\n  },\n  "pusher": {\n    "id": 1,\n    "username": "labuser",\n    "login": "labuser",\n    "full_name": "",\n    "email": "labuser@example.com",\n    "avatar_url": "https://secure.gravatar.com/avatar/fbdecbdeaa8816382d76cf909295b38a?d=identicon"\n  },\n  "sender": {\n    "id": 1,\n    "username": "labuser",\n    "login": "labuser",\n    "full_name": "",\n    "email": "labuser@example.com",\n    "avatar_url": "https://secure.gravatar.com/avatar/fbdecbdeaa8816382d76cf909295b38a?d=identicon"\n  }\n}	1	push	f	t	1606356262615309237	t	{"headers":{"X-Github-Event":"push","X-Gogs-Delivery":"f8dff22a-97f4-40b4-92d9-95862144334b","X-Gogs-Signature":"da37c3a30f61dbd837ef4726029edc61af1a36a68f897f8870ff77920e4eb99f","X-Gogs-Event":"push","Content-Type":"application/json","X-Github-Delivery":"f8dff22a-97f4-40b4-92d9-95862144334b"}}	{"status":200,"headers":{"X-Frame-Options":"DENY","Content-Length":"706","Cache-Control":"no-cache, no-store, must-revalidate, private, max-age=0","Expires":"Thu, 01 Jan 1970 00:00:00 UTC","Date":"Thu, 26 Nov 2020 02:04:22 GMT","Pragma":"no-cache","X-Accel-Expires":"0","Content-Type":"application/json","X-Xss-Protection":"1; mode=block"},"body":"{\\"id\\":14,\\"repo_id\\":1,\\"trigger\\":\\"@hook\\",\\"number\\":14,\\"status\\":\\"pending\\",\\"event\\":\\"push\\",\\"action\\":\\"\\",\\"link\\":\\"http://docker-host:8300/labuser/advertisements/compare/d1007b940094e1411041ea2a617c9d779ba8244a...00f7dce2c44dd91fd35762ac2b94a0c15605c88c\\",\\"timestamp\\":0,\\"message\\":\\"more experiments\\\\n\\",\\"before\\":\\"\\",\\"after\\":\\"00f7dce2c44dd91fd35762ac2b94a0c15605c88c\\",\\"ref\\":\\"refs/heads/master\\",\\"source_repo\\":\\"\\",\\"source\\":\\"master\\",\\"target\\":\\"master\\",\\"author_login\\":\\"\\",\\"author_name\\":\\"asciimo\\",\\"author_email\\":\\"asciimo@gmail.com\\",\\"author_avatar\\":\\"https://secure.gravatar.com/avatar/fbdecbdeaa8816382d76cf909295b38a?d=identicon\\",\\"sender\\":\\"labuser\\",\\"started\\":0,\\"finished\\":0,\\"created\\":1606356261,\\"updated\\":1606356261,\\"version\\":1}\\n"}
17	1	1	0f992c2b-c5cf-4612-b966-a33643a65efd	1	http://drone-server/hook	2f5ee3d13b00d41e4dcb2a7aaacda4b9e7940a171efe7b870fec9fec01679d68	{\n  "ref": "refs/heads/master",\n  "before": "00f7dce2c44dd91fd35762ac2b94a0c15605c88c",\n  "after": "73a943f9f4af1a7b12535ba4de5227bbcc91d135",\n  "compare_url": "http://docker-host:8300/labuser/advertisements/compare/00f7dce2c44dd91fd35762ac2b94a0c15605c88c...73a943f9f4af1a7b12535ba4de5227bbcc91d135",\n  "commits": [\n    {\n      "id": "73a943f9f4af1a7b12535ba4de5227bbcc91d135",\n      "message": "added comment\\n",\n      "url": "http://docker-host:8300/labuser/advertisements/commit/73a943f9f4af1a7b12535ba4de5227bbcc91d135",\n      "author": {\n        "name": "Stephen Calnan",\n        "email": "asciimo@gmail.com",\n        "username": ""\n      },\n      "committer": {\n        "name": "Stephen Calnan",\n        "email": "asciimo@gmail.com",\n        "username": ""\n      },\n      "added": null,\n      "removed": null,\n      "modified": [\n        ".drone.yml"\n      ],\n      "timestamp": "2020-11-30T20:41:05Z"\n    }\n  ],\n  "repository": {\n    "id": 1,\n    "owner": {\n      "id": 1,\n      "username": "labuser",\n      "login": "labuser",\n      "full_name": "",\n      "email": "labuser@example.com",\n      "avatar_url": "https://secure.gravatar.com/avatar/fbdecbdeaa8816382d76cf909295b38a?d=identicon"\n    },\n    "name": "advertisements",\n    "full_name": "labuser/advertisements",\n    "description": "",\n    "private": false,\n    "fork": false,\n    "parent": null,\n    "empty": false,\n    "mirror": false,\n    "size": 217088,\n    "html_url": "http://docker-host:8300/labuser/advertisements",\n    "ssh_url": "git@localhost:labuser/advertisements.git",\n    "clone_url": "http://docker-host:8300/labuser/advertisements.git",\n    "website": "",\n    "stars_count": 0,\n    "forks_count": 0,\n    "watchers_count": 1,\n    "open_issues_count": 0,\n    "default_branch": "master",\n    "created_at": "2020-11-22T20:02:05Z",\n    "updated_at": "2020-11-22T20:02:05Z"\n  },\n  "pusher": {\n    "id": 1,\n    "username": "labuser",\n    "login": "labuser",\n    "full_name": "",\n    "email": "labuser@example.com",\n    "avatar_url": "https://secure.gravatar.com/avatar/fbdecbdeaa8816382d76cf909295b38a?d=identicon"\n  },\n  "sender": {\n    "id": 1,\n    "username": "labuser",\n    "login": "labuser",\n    "full_name": "",\n    "email": "labuser@example.com",\n    "avatar_url": "https://secure.gravatar.com/avatar/fbdecbdeaa8816382d76cf909295b38a?d=identicon"\n  }\n}	1	push	f	t	1606768883518428106	t	{"headers":{"X-Gogs-Delivery":"0f992c2b-c5cf-4612-b966-a33643a65efd","X-Gogs-Signature":"2f5ee3d13b00d41e4dcb2a7aaacda4b9e7940a171efe7b870fec9fec01679d68","X-Gogs-Event":"push","Content-Type":"application/json","X-Github-Delivery":"0f992c2b-c5cf-4612-b966-a33643a65efd","X-Github-Event":"push"}}	{"status":200,"headers":{"X-Accel-Expires":"0","X-Frame-Options":"DENY","Content-Type":"application/json","X-Xss-Protection":"1; mode=block","Date":"Mon, 30 Nov 2020 20:41:23 GMT","Content-Length":"710","Expires":"Thu, 01 Jan 1970 00:00:00 UTC","Pragma":"no-cache","Cache-Control":"no-cache, no-store, must-revalidate, private, max-age=0"},"body":"{\\"id\\":15,\\"repo_id\\":1,\\"trigger\\":\\"@hook\\",\\"number\\":15,\\"status\\":\\"pending\\",\\"event\\":\\"push\\",\\"action\\":\\"\\",\\"link\\":\\"http://docker-host:8300/labuser/advertisements/compare/00f7dce2c44dd91fd35762ac2b94a0c15605c88c...73a943f9f4af1a7b12535ba4de5227bbcc91d135\\",\\"timestamp\\":0,\\"message\\":\\"added comment\\\\n\\",\\"before\\":\\"\\",\\"after\\":\\"73a943f9f4af1a7b12535ba4de5227bbcc91d135\\",\\"ref\\":\\"refs/heads/master\\",\\"source_repo\\":\\"\\",\\"source\\":\\"master\\",\\"target\\":\\"master\\",\\"author_login\\":\\"\\",\\"author_name\\":\\"Stephen Calnan\\",\\"author_email\\":\\"asciimo@gmail.com\\",\\"author_avatar\\":\\"https://secure.gravatar.com/avatar/fbdecbdeaa8816382d76cf909295b38a?d=identicon\\",\\"sender\\":\\"labuser\\",\\"started\\":0,\\"finished\\":0,\\"created\\":1606768882,\\"updated\\":1606768882,\\"version\\":1}\\n"}
18	1	1	e9ed60ab-1812-4563-9e94-35973a2e0a90	1	http://drone-server/hook	3f7477c0f4a9a07b4d448dc45e71101290751a01f2ae290c612606cedaa58759	{\n  "ref": "refs/heads/master",\n  "before": "73a943f9f4af1a7b12535ba4de5227bbcc91d135",\n  "after": "de3e4976f3daf3b535af982d2a3c421b41e3dbc3",\n  "compare_url": "http://docker-host:8300/labuser/advertisements/compare/73a943f9f4af1a7b12535ba4de5227bbcc91d135...de3e4976f3daf3b535af982d2a3c421b41e3dbc3",\n  "commits": [\n    {\n      "id": "de3e4976f3daf3b535af982d2a3c421b41e3dbc3",\n      "message": "drone file adjustments\\n",\n      "url": "http://docker-host:8300/labuser/advertisements/commit/de3e4976f3daf3b535af982d2a3c421b41e3dbc3",\n      "author": {\n        "name": "asciimo",\n        "email": "asciimo@gmail.com",\n        "username": ""\n      },\n      "committer": {\n        "name": "asciimo",\n        "email": "asciimo@gmail.com",\n        "username": ""\n      },\n      "added": null,\n      "removed": null,\n      "modified": [\n        ".drone.yml"\n      ],\n      "timestamp": "2020-12-01T19:56:48Z"\n    }\n  ],\n  "repository": {\n    "id": 1,\n    "owner": {\n      "id": 1,\n      "username": "labuser",\n      "login": "labuser",\n      "full_name": "",\n      "email": "labuser@example.com",\n      "avatar_url": "https://secure.gravatar.com/avatar/fbdecbdeaa8816382d76cf909295b38a?d=identicon"\n    },\n    "name": "advertisements",\n    "full_name": "labuser/advertisements",\n    "description": "",\n    "private": false,\n    "fork": false,\n    "parent": null,\n    "empty": false,\n    "mirror": false,\n    "size": 229376,\n    "html_url": "http://docker-host:8300/labuser/advertisements",\n    "ssh_url": "git@localhost:labuser/advertisements.git",\n    "clone_url": "http://docker-host:8300/labuser/advertisements.git",\n    "website": "",\n    "stars_count": 0,\n    "forks_count": 0,\n    "watchers_count": 1,\n    "open_issues_count": 0,\n    "default_branch": "master",\n    "created_at": "2020-11-22T20:02:05Z",\n    "updated_at": "2020-11-22T20:02:05Z"\n  },\n  "pusher": {\n    "id": 1,\n    "username": "labuser",\n    "login": "labuser",\n    "full_name": "",\n    "email": "labuser@example.com",\n    "avatar_url": "https://secure.gravatar.com/avatar/fbdecbdeaa8816382d76cf909295b38a?d=identicon"\n  },\n  "sender": {\n    "id": 1,\n    "username": "labuser",\n    "login": "labuser",\n    "full_name": "",\n    "email": "labuser@example.com",\n    "avatar_url": "https://secure.gravatar.com/avatar/fbdecbdeaa8816382d76cf909295b38a?d=identicon"\n  }\n}	1	push	f	t	1606852621537903950	t	{"headers":{"X-Gogs-Delivery":"e9ed60ab-1812-4563-9e94-35973a2e0a90","X-Gogs-Signature":"3f7477c0f4a9a07b4d448dc45e71101290751a01f2ae290c612606cedaa58759","X-Gogs-Event":"push","Content-Type":"application/json","X-Github-Delivery":"e9ed60ab-1812-4563-9e94-35973a2e0a90","X-Github-Event":"push"}}	{"status":200,"headers":{"Pragma":"no-cache","Date":"Tue, 01 Dec 2020 19:57:01 GMT","Content-Type":"application/json","X-Frame-Options":"DENY","Content-Length":"712","Cache-Control":"no-cache, no-store, must-revalidate, private, max-age=0","Expires":"Thu, 01 Jan 1970 00:00:00 UTC","X-Accel-Expires":"0","X-Xss-Protection":"1; mode=block"},"body":"{\\"id\\":16,\\"repo_id\\":1,\\"trigger\\":\\"@hook\\",\\"number\\":16,\\"status\\":\\"pending\\",\\"event\\":\\"push\\",\\"action\\":\\"\\",\\"link\\":\\"http://docker-host:8300/labuser/advertisements/compare/73a943f9f4af1a7b12535ba4de5227bbcc91d135...de3e4976f3daf3b535af982d2a3c421b41e3dbc3\\",\\"timestamp\\":0,\\"message\\":\\"drone file adjustments\\\\n\\",\\"before\\":\\"\\",\\"after\\":\\"de3e4976f3daf3b535af982d2a3c421b41e3dbc3\\",\\"ref\\":\\"refs/heads/master\\",\\"source_repo\\":\\"\\",\\"source\\":\\"master\\",\\"target\\":\\"master\\",\\"author_login\\":\\"\\",\\"author_name\\":\\"asciimo\\",\\"author_email\\":\\"asciimo@gmail.com\\",\\"author_avatar\\":\\"https://secure.gravatar.com/avatar/fbdecbdeaa8816382d76cf909295b38a?d=identicon\\",\\"sender\\":\\"labuser\\",\\"started\\":0,\\"finished\\":0,\\"created\\":1606852619,\\"updated\\":1606852619,\\"version\\":1}\\n"}
19	1	1	82fdea03-7f3c-4c8c-80d0-6f7b747935e1	1	http://drone-server/hook	6411fb5d8903080020c1d84ceb6276cfd925395e48f75b74963b65da01712aaf	{\n  "ref": "refs/heads/master",\n  "before": "de3e4976f3daf3b535af982d2a3c421b41e3dbc3",\n  "after": "c8233fcf5578ecc973adb0ef1f5b12864519a616",\n  "compare_url": "http://docker-host:8300/labuser/advertisements/compare/de3e4976f3daf3b535af982d2a3c421b41e3dbc3...c8233fcf5578ecc973adb0ef1f5b12864519a616",\n  "commits": [\n    {\n      "id": "c8233fcf5578ecc973adb0ef1f5b12864519a616",\n      "message": "more drone file tweaks\\n",\n      "url": "http://docker-host:8300/labuser/advertisements/commit/c8233fcf5578ecc973adb0ef1f5b12864519a616",\n      "author": {\n        "name": "asciimo",\n        "email": "asciimo@gmail.com",\n        "username": ""\n      },\n      "committer": {\n        "name": "asciimo",\n        "email": "asciimo@gmail.com",\n        "username": ""\n      },\n      "added": null,\n      "removed": null,\n      "modified": [\n        ".drone.yml"\n      ],\n      "timestamp": "2020-12-01T20:29:38Z"\n    }\n  ],\n  "repository": {\n    "id": 1,\n    "owner": {\n      "id": 1,\n      "username": "labuser",\n      "login": "labuser",\n      "full_name": "",\n      "email": "labuser@example.com",\n      "avatar_url": "https://secure.gravatar.com/avatar/fbdecbdeaa8816382d76cf909295b38a?d=identicon"\n    },\n    "name": "advertisements",\n    "full_name": "labuser/advertisements",\n    "description": "",\n    "private": false,\n    "fork": false,\n    "parent": null,\n    "empty": false,\n    "mirror": false,\n    "size": 241664,\n    "html_url": "http://docker-host:8300/labuser/advertisements",\n    "ssh_url": "git@localhost:labuser/advertisements.git",\n    "clone_url": "http://docker-host:8300/labuser/advertisements.git",\n    "website": "",\n    "stars_count": 0,\n    "forks_count": 0,\n    "watchers_count": 1,\n    "open_issues_count": 0,\n    "default_branch": "master",\n    "created_at": "2020-11-22T20:02:05Z",\n    "updated_at": "2020-11-22T20:02:05Z"\n  },\n  "pusher": {\n    "id": 1,\n    "username": "labuser",\n    "login": "labuser",\n    "full_name": "",\n    "email": "labuser@example.com",\n    "avatar_url": "https://secure.gravatar.com/avatar/fbdecbdeaa8816382d76cf909295b38a?d=identicon"\n  },\n  "sender": {\n    "id": 1,\n    "username": "labuser",\n    "login": "labuser",\n    "full_name": "",\n    "email": "labuser@example.com",\n    "avatar_url": "https://secure.gravatar.com/avatar/fbdecbdeaa8816382d76cf909295b38a?d=identicon"\n  }\n}	1	push	f	t	1606854588417513725	t	{"headers":{"X-Gogs-Signature":"6411fb5d8903080020c1d84ceb6276cfd925395e48f75b74963b65da01712aaf","X-Gogs-Event":"push","Content-Type":"application/json","X-Github-Delivery":"82fdea03-7f3c-4c8c-80d0-6f7b747935e1","X-Github-Event":"push","X-Gogs-Delivery":"82fdea03-7f3c-4c8c-80d0-6f7b747935e1"}}	{"status":200,"headers":{"X-Xss-Protection":"1; mode=block","Pragma":"no-cache","Expires":"Thu, 01 Jan 1970 00:00:00 UTC","X-Frame-Options":"DENY","Date":"Tue, 01 Dec 2020 20:29:48 GMT","Content-Type":"application/json","Content-Length":"712","Cache-Control":"no-cache, no-store, must-revalidate, private, max-age=0","X-Accel-Expires":"0"},"body":"{\\"id\\":17,\\"repo_id\\":1,\\"trigger\\":\\"@hook\\",\\"number\\":17,\\"status\\":\\"pending\\",\\"event\\":\\"push\\",\\"action\\":\\"\\",\\"link\\":\\"http://docker-host:8300/labuser/advertisements/compare/de3e4976f3daf3b535af982d2a3c421b41e3dbc3...c8233fcf5578ecc973adb0ef1f5b12864519a616\\",\\"timestamp\\":0,\\"message\\":\\"more drone file tweaks\\\\n\\",\\"before\\":\\"\\",\\"after\\":\\"c8233fcf5578ecc973adb0ef1f5b12864519a616\\",\\"ref\\":\\"refs/heads/master\\",\\"source_repo\\":\\"\\",\\"source\\":\\"master\\",\\"target\\":\\"master\\",\\"author_login\\":\\"\\",\\"author_name\\":\\"asciimo\\",\\"author_email\\":\\"asciimo@gmail.com\\",\\"author_avatar\\":\\"https://secure.gravatar.com/avatar/fbdecbdeaa8816382d76cf909295b38a?d=identicon\\",\\"sender\\":\\"labuser\\",\\"started\\":0,\\"finished\\":0,\\"created\\":1606854587,\\"updated\\":1606854587,\\"version\\":1}\\n"}
\.


--
-- Data for Name: issue; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.issue (id, repo_id, index, poster_id, name, content, milestone_id, priority, assignee_id, is_closed, is_pull, num_comments, deadline_unix, created_unix, updated_unix) FROM stdin;
\.


--
-- Data for Name: issue_label; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.issue_label (id, issue_id, label_id) FROM stdin;
\.


--
-- Data for Name: issue_user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.issue_user (id, uid, issue_id, repo_id, milestone_id, is_read, is_assigned, is_mentioned, is_poster, is_closed) FROM stdin;
\.


--
-- Data for Name: label; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.label (id, repo_id, name, color, num_issues, num_closed_issues) FROM stdin;
\.


--
-- Data for Name: lfs_object; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.lfs_object (repo_id, oid, size, storage, created_at) FROM stdin;
\.


--
-- Data for Name: login_source; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.login_source (id, type, name, is_actived, is_default, cfg, created_unix, updated_unix) FROM stdin;
\.


--
-- Data for Name: milestone; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.milestone (id, repo_id, name, content, is_closed, num_issues, num_closed_issues, completeness, deadline_unix, closed_date_unix) FROM stdin;
\.


--
-- Data for Name: mirror; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.mirror (id, repo_id, "interval", enable_prune, updated_unix, next_update_unix) FROM stdin;
\.


--
-- Data for Name: notice; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.notice (id, type, description, created_unix) FROM stdin;
\.


--
-- Data for Name: org_user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.org_user (id, uid, org_id, is_public, is_owner, num_teams) FROM stdin;
\.


--
-- Data for Name: protect_branch; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.protect_branch (id, repo_id, name, protected, require_pull_request, enable_whitelist, whitelist_user_i_ds, whitelist_team_i_ds) FROM stdin;
\.


--
-- Data for Name: protect_branch_whitelist; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.protect_branch_whitelist (id, protect_branch_id, repo_id, name, user_id) FROM stdin;
\.


--
-- Data for Name: public_key; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.public_key (id, owner_id, name, fingerprint, content, mode, type, created_unix, updated_unix) FROM stdin;
\.


--
-- Data for Name: pull_request; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.pull_request (id, type, status, issue_id, index, head_repo_id, base_repo_id, head_user_name, head_branch, base_branch, merge_base, has_merged, merged_commit_id, merger_id, merged_unix) FROM stdin;
\.


--
-- Data for Name: release; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.release (id, repo_id, publisher_id, tag_name, lower_tag_name, target, title, sha1, num_commits, note, is_draft, is_prerelease, created_unix) FROM stdin;
\.


--
-- Data for Name: repository; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.repository (id, owner_id, lower_name, name, description, website, default_branch, size, use_custom_avatar, num_watches, num_stars, num_forks, num_issues, num_closed_issues, num_pulls, num_closed_pulls, num_milestones, num_closed_milestones, is_private, is_unlisted, is_bare, is_mirror, enable_wiki, allow_public_wiki, enable_external_wiki, external_wiki_url, enable_issues, allow_public_issues, enable_external_tracker, external_tracker_url, external_tracker_format, external_tracker_style, enable_pulls, pulls_ignore_whitespace, pulls_allow_rebase, is_fork, fork_id, created_unix, updated_unix) FROM stdin;
1	1	advertisements	advertisements			master	241664	f	1	0	0	0	0	0	0	0	0	f	f	f	f	t	f	f		t	f	f			numeric	t	f	f	f	0	1606075325	1606075325
\.


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.star (id, uid, repo_id) FROM stdin;
\.


--
-- Data for Name: team; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.team (id, org_id, lower_name, name, description, authorize, num_repos, num_members) FROM stdin;
\.


--
-- Data for Name: team_repo; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.team_repo (id, org_id, team_id, repo_id) FROM stdin;
\.


--
-- Data for Name: team_user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.team_user (id, org_id, team_id, uid) FROM stdin;
\.


--
-- Data for Name: two_factor; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.two_factor (id, user_id, secret, created_unix) FROM stdin;
\.


--
-- Data for Name: two_factor_recovery_code; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.two_factor_recovery_code (id, user_id, code, is_used) FROM stdin;
\.


--
-- Data for Name: upload; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.upload (id, uuid, name) FROM stdin;
\.


--
-- Data for Name: user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."user" (id, lower_name, name, full_name, email, passwd, login_source, login_name, type, location, website, rands, salt, created_unix, updated_unix, last_repo_visibility, max_repo_creation, is_active, is_admin, allow_git_hook, allow_import_local, prohibit_login, avatar, avatar_email, use_custom_avatar, num_followers, num_following, num_stars, num_repos, description, num_teams, num_members) FROM stdin;
1	labuser	labuser		labuser@example.com	a6e0300c3ed5a417bb84f933df51ba9bb6a70e4b8b9330ecb6872d222c7ce078586749bb934fe09714eb7d71cf2f04880a5a	0		0			HLbES2Xp0Y	aBQEGyVk8c	1606074746	1606075325	f	-1	t	t	f	f	f	fbdecbdeaa8816382d76cf909295b38a	labuser@example.com	f	0	0	0	1		0	0
\.


--
-- Data for Name: version; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.version (id, version) FROM stdin;
1	19
\.


--
-- Data for Name: watch; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.watch (id, user_id, repo_id) FROM stdin;
1	1	1
\.


--
-- Data for Name: webhook; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.webhook (id, repo_id, org_id, url, content_type, secret, events, is_ssl, is_active, hook_task_type, meta, last_status, created_unix, updated_unix) FROM stdin;
1	1	0	http://drone-server/hook	1	75uaJpa57KPoH4iAikYXsNpyEafWbxc6	{"push_only":false,"send_everything":false,"choose_events":true,"events":{"create":true,"delete":true,"fork":false,"push":true,"issues":false,"pull_request":true,"issue_comment":false,"release":false}}	f	t	1		1	1606075657	1606854588
\.


--
-- Name: access_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.access_id_seq', 1, false);


--
-- Name: access_token_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.access_token_id_seq', 1, true);


--
-- Name: action_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.action_id_seq', 20, true);


--
-- Name: attachment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.attachment_id_seq', 1, false);


--
-- Name: collaboration_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.collaboration_id_seq', 1, false);


--
-- Name: comment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.comment_id_seq', 1, false);


--
-- Name: deploy_key_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.deploy_key_id_seq', 1, false);


--
-- Name: email_address_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.email_address_id_seq', 1, false);


--
-- Name: follow_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.follow_id_seq', 1, false);


--
-- Name: hook_task_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.hook_task_id_seq', 19, true);


--
-- Name: issue_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.issue_id_seq', 1, false);


--
-- Name: issue_label_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.issue_label_id_seq', 1, false);


--
-- Name: issue_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.issue_user_id_seq', 1, false);


--
-- Name: label_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.label_id_seq', 1, false);


--
-- Name: login_source_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.login_source_id_seq', 1, false);


--
-- Name: milestone_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.milestone_id_seq', 1, false);


--
-- Name: mirror_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.mirror_id_seq', 1, false);


--
-- Name: notice_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.notice_id_seq', 1, false);


--
-- Name: org_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.org_user_id_seq', 1, false);


--
-- Name: protect_branch_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.protect_branch_id_seq', 1, false);


--
-- Name: protect_branch_whitelist_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.protect_branch_whitelist_id_seq', 1, false);


--
-- Name: public_key_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.public_key_id_seq', 1, false);


--
-- Name: pull_request_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.pull_request_id_seq', 1, false);


--
-- Name: release_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.release_id_seq', 1, false);


--
-- Name: repository_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.repository_id_seq', 1, true);


--
-- Name: star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.star_id_seq', 1, false);


--
-- Name: team_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.team_id_seq', 1, false);


--
-- Name: team_repo_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.team_repo_id_seq', 1, false);


--
-- Name: team_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.team_user_id_seq', 1, false);


--
-- Name: two_factor_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.two_factor_id_seq', 1, false);


--
-- Name: two_factor_recovery_code_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.two_factor_recovery_code_id_seq', 1, false);


--
-- Name: upload_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.upload_id_seq', 1, false);


--
-- Name: user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.user_id_seq', 1, true);


--
-- Name: version_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.version_id_seq', 1, true);


--
-- Name: watch_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.watch_id_seq', 1, true);


--
-- Name: webhook_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.webhook_id_seq', 1, true);


--
-- Name: access access_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.access
    ADD CONSTRAINT access_pkey PRIMARY KEY (id);


--
-- Name: access_token access_token_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.access_token
    ADD CONSTRAINT access_token_pkey PRIMARY KEY (id);


--
-- Name: access_token access_token_sha1_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.access_token
    ADD CONSTRAINT access_token_sha1_key UNIQUE (sha1);


--
-- Name: action action_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.action
    ADD CONSTRAINT action_pkey PRIMARY KEY (id);


--
-- Name: attachment attachment_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.attachment
    ADD CONSTRAINT attachment_pkey PRIMARY KEY (id);


--
-- Name: collaboration collaboration_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.collaboration
    ADD CONSTRAINT collaboration_pkey PRIMARY KEY (id);


--
-- Name: comment comment_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comment
    ADD CONSTRAINT comment_pkey PRIMARY KEY (id);


--
-- Name: deploy_key deploy_key_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.deploy_key
    ADD CONSTRAINT deploy_key_pkey PRIMARY KEY (id);


--
-- Name: email_address email_address_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.email_address
    ADD CONSTRAINT email_address_pkey PRIMARY KEY (id);


--
-- Name: follow follow_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.follow
    ADD CONSTRAINT follow_pkey PRIMARY KEY (id);


--
-- Name: hook_task hook_task_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.hook_task
    ADD CONSTRAINT hook_task_pkey PRIMARY KEY (id);


--
-- Name: issue_label issue_label_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.issue_label
    ADD CONSTRAINT issue_label_pkey PRIMARY KEY (id);


--
-- Name: issue issue_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.issue
    ADD CONSTRAINT issue_pkey PRIMARY KEY (id);


--
-- Name: issue_user issue_user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.issue_user
    ADD CONSTRAINT issue_user_pkey PRIMARY KEY (id);


--
-- Name: label label_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.label
    ADD CONSTRAINT label_pkey PRIMARY KEY (id);


--
-- Name: lfs_object lfs_object_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lfs_object
    ADD CONSTRAINT lfs_object_pkey PRIMARY KEY (repo_id, oid);


--
-- Name: login_source login_source_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.login_source
    ADD CONSTRAINT login_source_name_key UNIQUE (name);


--
-- Name: login_source login_source_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.login_source
    ADD CONSTRAINT login_source_pkey PRIMARY KEY (id);


--
-- Name: milestone milestone_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.milestone
    ADD CONSTRAINT milestone_pkey PRIMARY KEY (id);


--
-- Name: mirror mirror_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mirror
    ADD CONSTRAINT mirror_pkey PRIMARY KEY (id);


--
-- Name: notice notice_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.notice
    ADD CONSTRAINT notice_pkey PRIMARY KEY (id);


--
-- Name: org_user org_user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.org_user
    ADD CONSTRAINT org_user_pkey PRIMARY KEY (id);


--
-- Name: protect_branch protect_branch_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.protect_branch
    ADD CONSTRAINT protect_branch_pkey PRIMARY KEY (id);


--
-- Name: protect_branch_whitelist protect_branch_whitelist_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.protect_branch_whitelist
    ADD CONSTRAINT protect_branch_whitelist_pkey PRIMARY KEY (id);


--
-- Name: public_key public_key_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.public_key
    ADD CONSTRAINT public_key_pkey PRIMARY KEY (id);


--
-- Name: pull_request pull_request_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pull_request
    ADD CONSTRAINT pull_request_pkey PRIMARY KEY (id);


--
-- Name: release release_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.release
    ADD CONSTRAINT release_pkey PRIMARY KEY (id);


--
-- Name: repository repository_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.repository
    ADD CONSTRAINT repository_pkey PRIMARY KEY (id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (id);


--
-- Name: team team_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.team
    ADD CONSTRAINT team_pkey PRIMARY KEY (id);


--
-- Name: team_repo team_repo_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.team_repo
    ADD CONSTRAINT team_repo_pkey PRIMARY KEY (id);


--
-- Name: team_user team_user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.team_user
    ADD CONSTRAINT team_user_pkey PRIMARY KEY (id);


--
-- Name: two_factor two_factor_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.two_factor
    ADD CONSTRAINT two_factor_pkey PRIMARY KEY (id);


--
-- Name: two_factor_recovery_code two_factor_recovery_code_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.two_factor_recovery_code
    ADD CONSTRAINT two_factor_recovery_code_pkey PRIMARY KEY (id);


--
-- Name: upload upload_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.upload
    ADD CONSTRAINT upload_pkey PRIMARY KEY (id);


--
-- Name: user user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_pkey PRIMARY KEY (id);


--
-- Name: version version_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.version
    ADD CONSTRAINT version_pkey PRIMARY KEY (id);


--
-- Name: watch watch_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.watch
    ADD CONSTRAINT watch_pkey PRIMARY KEY (id);


--
-- Name: webhook webhook_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.webhook
    ADD CONSTRAINT webhook_pkey PRIMARY KEY (id);


--
-- Name: IDX_action_repo_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_action_repo_id" ON public.action USING btree (repo_id);


--
-- Name: IDX_attachment_issue_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_attachment_issue_id" ON public.attachment USING btree (issue_id);


--
-- Name: IDX_attachment_release_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_attachment_release_id" ON public.attachment USING btree (release_id);


--
-- Name: IDX_collaboration_repo_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_collaboration_repo_id" ON public.collaboration USING btree (repo_id);


--
-- Name: IDX_collaboration_user_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_collaboration_user_id" ON public.collaboration USING btree (user_id);


--
-- Name: IDX_comment_issue_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_comment_issue_id" ON public.comment USING btree (issue_id);


--
-- Name: IDX_deploy_key_key_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_deploy_key_key_id" ON public.deploy_key USING btree (key_id);


--
-- Name: IDX_deploy_key_repo_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_deploy_key_repo_id" ON public.deploy_key USING btree (repo_id);


--
-- Name: IDX_email_address_uid; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_email_address_uid" ON public.email_address USING btree (uid);


--
-- Name: IDX_hook_task_repo_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_hook_task_repo_id" ON public.hook_task USING btree (repo_id);


--
-- Name: IDX_issue_repo_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_issue_repo_id" ON public.issue USING btree (repo_id);


--
-- Name: IDX_issue_user_repo_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_issue_user_repo_id" ON public.issue_user USING btree (repo_id);


--
-- Name: IDX_issue_user_uid; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_issue_user_uid" ON public.issue_user USING btree (uid);


--
-- Name: IDX_label_repo_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_label_repo_id" ON public.label USING btree (repo_id);


--
-- Name: IDX_milestone_repo_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_milestone_repo_id" ON public.milestone USING btree (repo_id);


--
-- Name: IDX_org_user_org_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_org_user_org_id" ON public.org_user USING btree (org_id);


--
-- Name: IDX_org_user_uid; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_org_user_uid" ON public.org_user USING btree (uid);


--
-- Name: IDX_public_key_owner_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_public_key_owner_id" ON public.public_key USING btree (owner_id);


--
-- Name: IDX_pull_request_issue_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_pull_request_issue_id" ON public.pull_request USING btree (issue_id);


--
-- Name: IDX_repository_lower_name; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_repository_lower_name" ON public.repository USING btree (lower_name);


--
-- Name: IDX_repository_name; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_repository_name" ON public.repository USING btree (name);


--
-- Name: IDX_team_org_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_team_org_id" ON public.team USING btree (org_id);


--
-- Name: IDX_team_repo_org_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_team_repo_org_id" ON public.team_repo USING btree (org_id);


--
-- Name: IDX_team_user_org_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_team_user_org_id" ON public.team_user USING btree (org_id);


--
-- Name: UQE_attachment_uuid; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "UQE_attachment_uuid" ON public.attachment USING btree (uuid);


--
-- Name: UQE_collaboration_s; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "UQE_collaboration_s" ON public.collaboration USING btree (repo_id, user_id);


--
-- Name: UQE_deploy_key_s; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "UQE_deploy_key_s" ON public.deploy_key USING btree (key_id, repo_id);


--
-- Name: UQE_email_address_email; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "UQE_email_address_email" ON public.email_address USING btree (email);


--
-- Name: UQE_follow_follow; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "UQE_follow_follow" ON public.follow USING btree (user_id, follow_id);


--
-- Name: UQE_issue_label_s; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "UQE_issue_label_s" ON public.issue_label USING btree (issue_id, label_id);


--
-- Name: UQE_issue_repo_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "UQE_issue_repo_index" ON public.issue USING btree (repo_id, index);


--
-- Name: UQE_org_user_s; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "UQE_org_user_s" ON public.org_user USING btree (uid, org_id);


--
-- Name: UQE_protect_branch_protect_branch; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "UQE_protect_branch_protect_branch" ON public.protect_branch USING btree (repo_id, name);


--
-- Name: UQE_protect_branch_whitelist_protect_branch_whitelist; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "UQE_protect_branch_whitelist_protect_branch_whitelist" ON public.protect_branch_whitelist USING btree (repo_id, name, user_id);


--
-- Name: UQE_repository_s; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "UQE_repository_s" ON public.repository USING btree (owner_id, lower_name);


--
-- Name: UQE_star_s; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "UQE_star_s" ON public.star USING btree (uid, repo_id);


--
-- Name: UQE_team_repo_s; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "UQE_team_repo_s" ON public.team_repo USING btree (team_id, repo_id);


--
-- Name: UQE_team_user_s; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "UQE_team_user_s" ON public.team_user USING btree (team_id, uid);


--
-- Name: UQE_two_factor_user_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "UQE_two_factor_user_id" ON public.two_factor USING btree (user_id);


--
-- Name: UQE_upload_uuid; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "UQE_upload_uuid" ON public.upload USING btree (uuid);


--
-- Name: UQE_user_lower_name; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "UQE_user_lower_name" ON public."user" USING btree (lower_name);


--
-- Name: UQE_user_name; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "UQE_user_name" ON public."user" USING btree (name);


--
-- Name: UQE_watch_watch; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "UQE_watch_watch" ON public.watch USING btree (user_id, repo_id);


--
-- Name: access_user_repo_unique; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX access_user_repo_unique ON public.access USING btree (user_id, repo_id);


--
-- Name: idx_access_token_user_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_access_token_user_id ON public.access_token USING btree (uid);


--
-- PostgreSQL database dump complete
--

