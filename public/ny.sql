-- 
-- Created by SQL::Translator::Producer::PostgreSQL
-- Created on Sun Apr 27 15:29:11 2014
-- 
--
-- Table: phpbb_acl_groups
--
CREATE TABLE "phpbb_acl_groups" (
  "group_id" integer DEFAULT 0 NOT NULL,
  "forum_id" integer DEFAULT 0 NOT NULL,
  "auth_option_id" integer DEFAULT 0 NOT NULL,
  "auth_role_id" integer DEFAULT 0 NOT NULL,
  "auth_setting" smallint DEFAULT 0 NOT NULL
);
CREATE INDEX "group_id" on "phpbb_acl_groups" ("group_id");
CREATE INDEX "auth_opt_id" on "phpbb_acl_groups" ("auth_option_id");
CREATE INDEX "auth_role_id" on "phpbb_acl_groups" ("auth_role_id");

--
-- Table: phpbb_acl_options
--
CREATE TABLE "phpbb_acl_options" (
  "auth_option_id" serial NOT NULL,
  "auth_option" character varying(50) DEFAULT '' NOT NULL,
  "is_global" smallint DEFAULT 0 NOT NULL,
  "is_local" smallint DEFAULT 0 NOT NULL,
  "founder_only" smallint DEFAULT 0 NOT NULL,
  PRIMARY KEY ("auth_option_id"),
  CONSTRAINT "auth_option" UNIQUE ("auth_option")
);

--
-- Table: phpbb_acl_roles
--
CREATE TABLE "phpbb_acl_roles" (
  "role_id" serial NOT NULL,
  "role_name" character varying(255) DEFAULT '' NOT NULL,
  "role_description" text NOT NULL,
  "role_type" character varying(10) DEFAULT '' NOT NULL,
  "role_order" smallint DEFAULT 0 NOT NULL,
  PRIMARY KEY ("role_id")
);
CREATE INDEX "role_type" on "phpbb_acl_roles" ("role_type");
CREATE INDEX "role_order" on "phpbb_acl_roles" ("role_order");

--
-- Table: phpbb_acl_roles_data
--
CREATE TABLE "phpbb_acl_roles_data" (
  "role_id" integer DEFAULT 0 NOT NULL,
  "auth_option_id" integer DEFAULT 0 NOT NULL,
  "auth_setting" smallint DEFAULT 0 NOT NULL,
  PRIMARY KEY ("role_id", "auth_option_id")
);
CREATE INDEX "ath_op_id" on "phpbb_acl_roles_data" ("auth_option_id");

--
-- Table: phpbb_acl_users
--
CREATE TABLE "phpbb_acl_users" (
  "user_id" integer DEFAULT 0 NOT NULL,
  "forum_id" integer DEFAULT 0 NOT NULL,
  "auth_option_id" integer DEFAULT 0 NOT NULL,
  "auth_role_id" integer DEFAULT 0 NOT NULL,
  "auth_setting" smallint DEFAULT 0 NOT NULL
);
CREATE INDEX "user_id" on "phpbb_acl_users" ("user_id");
CREATE INDEX "auth_option_id" on "phpbb_acl_users" ("auth_option_id");
CREATE INDEX "auth_role_id" on "phpbb_acl_users" ("auth_role_id");

--
-- Table: phpbb_attachments
--
CREATE TABLE "phpbb_attachments" (
  "attach_id" serial NOT NULL,
  "post_msg_id" integer DEFAULT 0 NOT NULL,
  "topic_id" integer DEFAULT 0 NOT NULL,
  "in_message" smallint DEFAULT 0 NOT NULL,
  "poster_id" integer DEFAULT 0 NOT NULL,
  "is_orphan" smallint DEFAULT 1 NOT NULL,
  "physical_filename" character varying(255) DEFAULT '' NOT NULL,
  "real_filename" character varying(255) DEFAULT '' NOT NULL,
  "download_count" integer DEFAULT 0 NOT NULL,
  "attach_comment" text NOT NULL,
  "extension" character varying(100) DEFAULT '' NOT NULL,
  "mimetype" character varying(100) DEFAULT '' NOT NULL,
  "filesize" bigint DEFAULT 0 NOT NULL,
  "filetime" bigint DEFAULT 0 NOT NULL,
  "thumbnail" smallint DEFAULT 0 NOT NULL,
  PRIMARY KEY ("attach_id")
);
CREATE INDEX "filetime" on "phpbb_attachments" ("filetime");
CREATE INDEX "post_msg_id" on "phpbb_attachments" ("post_msg_id");
CREATE INDEX "topic_id" on "phpbb_attachments" ("topic_id");
CREATE INDEX "poster_id" on "phpbb_attachments" ("poster_id");
CREATE INDEX "is_orphan" on "phpbb_attachments" ("is_orphan");

--
-- Table: phpbb_banlist
--
CREATE TABLE "phpbb_banlist" (
  "ban_id" serial NOT NULL,
  "ban_userid" integer DEFAULT 0 NOT NULL,
  "ban_ip" character varying(40) DEFAULT '' NOT NULL,
  "ban_email" character varying(100) DEFAULT '' NOT NULL,
  "ban_start" bigint DEFAULT 0 NOT NULL,
  "ban_end" bigint DEFAULT 0 NOT NULL,
  "ban_exclude" smallint DEFAULT 0 NOT NULL,
  "ban_reason" character varying(255) DEFAULT '' NOT NULL,
  "ban_give_reason" character varying(255) DEFAULT '' NOT NULL,
  PRIMARY KEY ("ban_id")
);
CREATE INDEX "ban_end" on "phpbb_banlist" ("ban_end");
CREATE INDEX "ban_user" on "phpbb_banlist" ("ban_userid", "ban_exclude");
CREATE INDEX "ban_email" on "phpbb_banlist" ("ban_email", "ban_exclude");
CREATE INDEX "ban_ip" on "phpbb_banlist" ("ban_ip", "ban_exclude");

--
-- Table: phpbb_bbcodes
--
CREATE TABLE "phpbb_bbcodes" (
  "bbcode_id" smallint DEFAULT 0 NOT NULL,
  "bbcode_tag" character varying(16) DEFAULT '' NOT NULL,
  "bbcode_helpline" character varying(255) DEFAULT '' NOT NULL,
  "display_on_posting" smallint DEFAULT 0 NOT NULL,
  "bbcode_match" text NOT NULL,
  "bbcode_tpl" text NOT NULL,
  "first_pass_match" text NOT NULL,
  "first_pass_replace" text NOT NULL,
  "second_pass_match" text NOT NULL,
  "second_pass_replace" text NOT NULL,
  PRIMARY KEY ("bbcode_id")
);
CREATE INDEX "display_on_post" on "phpbb_bbcodes" ("display_on_posting");

--
-- Table: phpbb_bookmarks
--
CREATE TABLE "phpbb_bookmarks" (
  "topic_id" integer DEFAULT 0 NOT NULL,
  "user_id" integer DEFAULT 0 NOT NULL,
  PRIMARY KEY ("topic_id", "user_id")
);

--
-- Table: phpbb_bots
--
CREATE TABLE "phpbb_bots" (
  "bot_id" serial NOT NULL,
  "bot_active" smallint DEFAULT 1 NOT NULL,
  "bot_name" character varying(255) DEFAULT '' NOT NULL,
  "user_id" integer DEFAULT 0 NOT NULL,
  "bot_agent" character varying(255) DEFAULT '' NOT NULL,
  "bot_ip" character varying(255) DEFAULT '' NOT NULL,
  PRIMARY KEY ("bot_id")
);
CREATE INDEX "bot_active" on "phpbb_bots" ("bot_active");

--
-- Table: phpbb_config
--
CREATE TABLE "phpbb_config" (
  "config_name" character varying(255) DEFAULT '' NOT NULL,
  "config_value" character varying(255) DEFAULT '' NOT NULL,
  "is_dynamic" smallint DEFAULT 0 NOT NULL,
  PRIMARY KEY ("config_name")
);
CREATE INDEX "is_dynamic" on "phpbb_config" ("is_dynamic");

--
-- Table: phpbb_confirm
--
CREATE TABLE "phpbb_confirm" (
  "confirm_id" character(32) DEFAULT '' NOT NULL,
  "session_id" character(32) DEFAULT '' NOT NULL,
  "confirm_type" smallint DEFAULT 0 NOT NULL,
  "code" character varying(8) DEFAULT '' NOT NULL,
  "seed" integer DEFAULT 0 NOT NULL,
  "attempts" integer DEFAULT 0 NOT NULL,
  PRIMARY KEY ("session_id", "confirm_id")
);
CREATE INDEX "confirm_type" on "phpbb_confirm" ("confirm_type");

--
-- Table: phpbb_disallow
--
CREATE TABLE "phpbb_disallow" (
  "disallow_id" serial NOT NULL,
  "disallow_username" character varying(255) DEFAULT '' NOT NULL,
  PRIMARY KEY ("disallow_id")
);

--
-- Table: phpbb_drafts
--
CREATE TABLE "phpbb_drafts" (
  "draft_id" serial NOT NULL,
  "user_id" integer DEFAULT 0 NOT NULL,
  "topic_id" integer DEFAULT 0 NOT NULL,
  "forum_id" integer DEFAULT 0 NOT NULL,
  "save_time" bigint DEFAULT 0 NOT NULL,
  "draft_subject" character varying(255) DEFAULT '' NOT NULL,
  "draft_message" text NOT NULL,
  PRIMARY KEY ("draft_id")
);
CREATE INDEX "save_time" on "phpbb_drafts" ("save_time");

--
-- Table: phpbb_extensions
--
CREATE TABLE "phpbb_extensions" (
  "extension_id" serial NOT NULL,
  "group_id" integer DEFAULT 0 NOT NULL,
  "extension" character varying(100) DEFAULT '' NOT NULL,
  PRIMARY KEY ("extension_id")
);

--
-- Table: phpbb_extension_groups
--
CREATE TABLE "phpbb_extension_groups" (
  "group_id" serial NOT NULL,
  "group_name" character varying(255) DEFAULT '' NOT NULL,
  "cat_id" smallint DEFAULT 0 NOT NULL,
  "allow_group" smallint DEFAULT 0 NOT NULL,
  "download_mode" smallint DEFAULT 1 NOT NULL,
  "upload_icon" character varying(255) DEFAULT '' NOT NULL,
  "max_filesize" bigint DEFAULT 0 NOT NULL,
  "allowed_forums" text NOT NULL,
  "allow_in_pm" smallint DEFAULT 0 NOT NULL,
  PRIMARY KEY ("group_id")
);

--
-- Table: phpbb_forums
--
CREATE TABLE "phpbb_forums" (
  "forum_id" serial NOT NULL,
  "parent_id" integer DEFAULT 0 NOT NULL,
  "left_id" integer DEFAULT 0 NOT NULL,
  "right_id" integer DEFAULT 0 NOT NULL,
  "forum_parents" text NOT NULL,
  "forum_name" character varying(255) DEFAULT '' NOT NULL,
  "forum_desc" text NOT NULL,
  "forum_desc_bitfield" character varying(255) DEFAULT '' NOT NULL,
  "forum_desc_options" bigint DEFAULT 7 NOT NULL,
  "forum_desc_uid" character varying(8) DEFAULT '' NOT NULL,
  "forum_link" character varying(255) DEFAULT '' NOT NULL,
  "forum_password" character varying(40) DEFAULT '' NOT NULL,
  "forum_style" integer DEFAULT 0 NOT NULL,
  "forum_image" character varying(255) DEFAULT '' NOT NULL,
  "forum_rules" text NOT NULL,
  "forum_rules_link" character varying(255) DEFAULT '' NOT NULL,
  "forum_rules_bitfield" character varying(255) DEFAULT '' NOT NULL,
  "forum_rules_options" bigint DEFAULT 7 NOT NULL,
  "forum_rules_uid" character varying(8) DEFAULT '' NOT NULL,
  "forum_topics_per_page" smallint DEFAULT 0 NOT NULL,
  "forum_type" smallint DEFAULT 0 NOT NULL,
  "forum_status" smallint DEFAULT 0 NOT NULL,
  "forum_posts" integer DEFAULT 0 NOT NULL,
  "forum_topics" integer DEFAULT 0 NOT NULL,
  "forum_topics_real" integer DEFAULT 0 NOT NULL,
  "forum_last_post_id" integer DEFAULT 0 NOT NULL,
  "forum_last_poster_id" integer DEFAULT 0 NOT NULL,
  "forum_last_post_subject" character varying(255) DEFAULT '' NOT NULL,
  "forum_last_post_time" bigint DEFAULT 0 NOT NULL,
  "forum_last_poster_name" character varying(255) DEFAULT '' NOT NULL,
  "forum_last_poster_colour" character varying(6) DEFAULT '' NOT NULL,
  "forum_flags" smallint DEFAULT 32 NOT NULL,
  "forum_options" bigint DEFAULT 0 NOT NULL,
  "display_subforum_list" smallint DEFAULT 1 NOT NULL,
  "display_on_index" smallint DEFAULT 1 NOT NULL,
  "enable_indexing" smallint DEFAULT 1 NOT NULL,
  "enable_icons" smallint DEFAULT 1 NOT NULL,
  "enable_prune" smallint DEFAULT 0 NOT NULL,
  "prune_next" bigint DEFAULT 0 NOT NULL,
  "prune_days" integer DEFAULT 0 NOT NULL,
  "prune_viewed" integer DEFAULT 0 NOT NULL,
  "prune_freq" integer DEFAULT 0 NOT NULL,
  PRIMARY KEY ("forum_id")
);
CREATE INDEX "left_right_id" on "phpbb_forums" ("left_id", "right_id");
CREATE INDEX "forum_lastpost_id" on "phpbb_forums" ("forum_last_post_id");

--
-- Table: phpbb_forums_access
--
CREATE TABLE "phpbb_forums_access" (
  "forum_id" integer DEFAULT 0 NOT NULL,
  "user_id" integer DEFAULT 0 NOT NULL,
  "session_id" character(32) DEFAULT '' NOT NULL,
  PRIMARY KEY ("forum_id", "user_id", "session_id")
);

--
-- Table: phpbb_forums_track
--
CREATE TABLE "phpbb_forums_track" (
  "user_id" integer DEFAULT 0 NOT NULL,
  "forum_id" integer DEFAULT 0 NOT NULL,
  "mark_time" bigint DEFAULT 0 NOT NULL,
  PRIMARY KEY ("user_id", "forum_id")
);

--
-- Table: phpbb_forums_watch
--
CREATE TABLE "phpbb_forums_watch" (
  "forum_id" integer DEFAULT 0 NOT NULL,
  "user_id" integer DEFAULT 0 NOT NULL,
  "notify_status" smallint DEFAULT 0 NOT NULL
);
CREATE INDEX "forum_id" on "phpbb_forums_watch" ("forum_id");
CREATE INDEX "user_id" on "phpbb_forums_watch" ("user_id");
CREATE INDEX "notify_stat" on "phpbb_forums_watch" ("notify_status");

--
-- Table: phpbb_groups
--
CREATE TABLE "phpbb_groups" (
  "group_id" serial NOT NULL,
  "group_type" smallint DEFAULT 1 NOT NULL,
  "group_founder_manage" smallint DEFAULT 0 NOT NULL,
  "group_skip_auth" smallint DEFAULT 0 NOT NULL,
  "group_name" character varying(255) DEFAULT '' NOT NULL,
  "group_desc" text NOT NULL,
  "group_desc_bitfield" character varying(255) DEFAULT '' NOT NULL,
  "group_desc_options" bigint DEFAULT 7 NOT NULL,
  "group_desc_uid" character varying(8) DEFAULT '' NOT NULL,
  "group_display" smallint DEFAULT 0 NOT NULL,
  "group_avatar" character varying(255) DEFAULT '' NOT NULL,
  "group_avatar_type" smallint DEFAULT 0 NOT NULL,
  "group_avatar_width" smallint DEFAULT 0 NOT NULL,
  "group_avatar_height" smallint DEFAULT 0 NOT NULL,
  "group_rank" integer DEFAULT 0 NOT NULL,
  "group_colour" character varying(6) DEFAULT '' NOT NULL,
  "group_sig_chars" integer DEFAULT 0 NOT NULL,
  "group_receive_pm" smallint DEFAULT 0 NOT NULL,
  "group_message_limit" integer DEFAULT 0 NOT NULL,
  "group_max_recipients" integer DEFAULT 0 NOT NULL,
  "group_legend" smallint DEFAULT 1 NOT NULL,
  PRIMARY KEY ("group_id")
);
CREATE INDEX "group_legend_name" on "phpbb_groups" ("group_legend", "group_name");

--
-- Table: phpbb_icons
--
CREATE TABLE "phpbb_icons" (
  "icons_id" serial NOT NULL,
  "icons_url" character varying(255) DEFAULT '' NOT NULL,
  "icons_width" smallint DEFAULT 0 NOT NULL,
  "icons_height" smallint DEFAULT 0 NOT NULL,
  "icons_order" integer DEFAULT 0 NOT NULL,
  "display_on_posting" smallint DEFAULT 1 NOT NULL,
  PRIMARY KEY ("icons_id")
);
CREATE INDEX "display_on_posting" on "phpbb_icons" ("display_on_posting");

--
-- Table: phpbb_lang
--
CREATE TABLE "phpbb_lang" (
  "lang_id" serial NOT NULL,
  "lang_iso" character varying(30) DEFAULT '' NOT NULL,
  "lang_dir" character varying(30) DEFAULT '' NOT NULL,
  "lang_english_name" character varying(100) DEFAULT '' NOT NULL,
  "lang_local_name" character varying(255) DEFAULT '' NOT NULL,
  "lang_author" character varying(255) DEFAULT '' NOT NULL,
  PRIMARY KEY ("lang_id")
);
CREATE INDEX "lang_iso" on "phpbb_lang" ("lang_iso");

--
-- Table: phpbb_log
--
CREATE TABLE "phpbb_log" (
  "log_id" serial NOT NULL,
  "log_type" smallint DEFAULT 0 NOT NULL,
  "user_id" integer DEFAULT 0 NOT NULL,
  "forum_id" integer DEFAULT 0 NOT NULL,
  "topic_id" integer DEFAULT 0 NOT NULL,
  "reportee_id" integer DEFAULT 0 NOT NULL,
  "log_ip" character varying(40) DEFAULT '' NOT NULL,
  "log_time" bigint DEFAULT 0 NOT NULL,
  "log_operation" text NOT NULL,
  "log_data" text NOT NULL,
  PRIMARY KEY ("log_id")
);
CREATE INDEX "log_type" on "phpbb_log" ("log_type");
CREATE INDEX "forum_id" on "phpbb_log" ("forum_id");
CREATE INDEX "topic_id" on "phpbb_log" ("topic_id");
CREATE INDEX "reportee_id" on "phpbb_log" ("reportee_id");
CREATE INDEX "user_id" on "phpbb_log" ("user_id");

--
-- Table: phpbb_login_attempts
--
CREATE TABLE "phpbb_login_attempts" (
  "attempt_ip" character varying(40) DEFAULT '' NOT NULL,
  "attempt_browser" character varying(150) DEFAULT '' NOT NULL,
  "attempt_forwarded_for" character varying(255) DEFAULT '' NOT NULL,
  "attempt_time" bigint DEFAULT 0 NOT NULL,
  "user_id" integer DEFAULT 0 NOT NULL,
  "username" character varying(255) DEFAULT '0' NOT NULL,
  "username_clean" character varying(255) DEFAULT '0' NOT NULL
);
CREATE INDEX "att_ip" on "phpbb_login_attempts" ("attempt_ip", "attempt_time");
CREATE INDEX "att_for" on "phpbb_login_attempts" ("attempt_forwarded_for", "attempt_time");
CREATE INDEX "att_time" on "phpbb_login_attempts" ("attempt_time");
CREATE INDEX "user_id" on "phpbb_login_attempts" ("user_id");

--
-- Table: phpbb_moderator_cache
--
CREATE TABLE "phpbb_moderator_cache" (
  "forum_id" integer DEFAULT 0 NOT NULL,
  "user_id" integer DEFAULT 0 NOT NULL,
  "username" character varying(255) DEFAULT '' NOT NULL,
  "group_id" integer DEFAULT 0 NOT NULL,
  "group_name" character varying(255) DEFAULT '' NOT NULL,
  "display_on_index" smallint DEFAULT 1 NOT NULL
);
CREATE INDEX "disp_idx" on "phpbb_moderator_cache" ("display_on_index");
CREATE INDEX "forum_id" on "phpbb_moderator_cache" ("forum_id");

--
-- Table: phpbb_modules
--
CREATE TABLE "phpbb_modules" (
  "module_id" serial NOT NULL,
  "module_enabled" smallint DEFAULT 1 NOT NULL,
  "module_display" smallint DEFAULT 1 NOT NULL,
  "module_basename" character varying(255) DEFAULT '' NOT NULL,
  "module_class" character varying(10) DEFAULT '' NOT NULL,
  "parent_id" integer DEFAULT 0 NOT NULL,
  "left_id" integer DEFAULT 0 NOT NULL,
  "right_id" integer DEFAULT 0 NOT NULL,
  "module_langname" character varying(255) DEFAULT '' NOT NULL,
  "module_mode" character varying(255) DEFAULT '' NOT NULL,
  "module_auth" character varying(255) DEFAULT '' NOT NULL,
  PRIMARY KEY ("module_id")
);
CREATE INDEX "left_right_id" on "phpbb_modules" ("left_id", "right_id");
CREATE INDEX "module_enabled" on "phpbb_modules" ("module_enabled");
CREATE INDEX "class_left_id" on "phpbb_modules" ("module_class", "left_id");

--
-- Table: phpbb_poll_options
--
CREATE TABLE "phpbb_poll_options" (
  "poll_option_id" smallint DEFAULT 0 NOT NULL,
  "topic_id" integer DEFAULT 0 NOT NULL,
  "poll_option_text" text NOT NULL,
  "poll_option_total" integer DEFAULT 0 NOT NULL
);
CREATE INDEX "poll_opt_id" on "phpbb_poll_options" ("poll_option_id");
CREATE INDEX "topic_id" on "phpbb_poll_options" ("topic_id");

--
-- Table: phpbb_poll_votes
--
CREATE TABLE "phpbb_poll_votes" (
  "topic_id" integer DEFAULT 0 NOT NULL,
  "poll_option_id" smallint DEFAULT 0 NOT NULL,
  "vote_user_id" integer DEFAULT 0 NOT NULL,
  "vote_user_ip" character varying(40) DEFAULT '' NOT NULL
);
CREATE INDEX "topic_id" on "phpbb_poll_votes" ("topic_id");
CREATE INDEX "vote_user_id" on "phpbb_poll_votes" ("vote_user_id");
CREATE INDEX "vote_user_ip" on "phpbb_poll_votes" ("vote_user_ip");

--
-- Table: phpbb_posts
--
CREATE TABLE "phpbb_posts" (
  "post_id" serial NOT NULL,
  "topic_id" integer DEFAULT 0 NOT NULL,
  "forum_id" integer DEFAULT 0 NOT NULL,
  "poster_id" integer DEFAULT 0 NOT NULL,
  "icon_id" integer DEFAULT 0 NOT NULL,
  "poster_ip" character varying(40) DEFAULT '' NOT NULL,
  "post_time" bigint DEFAULT 0 NOT NULL,
  "post_approved" smallint DEFAULT 1 NOT NULL,
  "post_reported" smallint DEFAULT 0 NOT NULL,
  "enable_bbcode" smallint DEFAULT 1 NOT NULL,
  "enable_smilies" smallint DEFAULT 1 NOT NULL,
  "enable_magic_url" smallint DEFAULT 1 NOT NULL,
  "enable_sig" smallint DEFAULT 1 NOT NULL,
  "post_username" character varying(255) DEFAULT '' NOT NULL,
  "post_subject" character varying(255) DEFAULT '' NOT NULL,
  "post_text" text NOT NULL,
  "post_checksum" character varying(32) DEFAULT '' NOT NULL,
  "post_attachment" smallint DEFAULT 0 NOT NULL,
  "bbcode_bitfield" character varying(255) DEFAULT '' NOT NULL,
  "bbcode_uid" character varying(8) DEFAULT '' NOT NULL,
  "post_postcount" smallint DEFAULT 1 NOT NULL,
  "post_edit_time" bigint DEFAULT 0 NOT NULL,
  "post_edit_reason" character varying(255) DEFAULT '' NOT NULL,
  "post_edit_user" integer DEFAULT 0 NOT NULL,
  "post_edit_count" smallint DEFAULT 0 NOT NULL,
  "post_edit_locked" smallint DEFAULT 0 NOT NULL,
  PRIMARY KEY ("post_id")
);
CREATE INDEX "forum_id" on "phpbb_posts" ("forum_id");
CREATE INDEX "topic_id" on "phpbb_posts" ("topic_id");
CREATE INDEX "poster_ip" on "phpbb_posts" ("poster_ip");
CREATE INDEX "poster_id" on "phpbb_posts" ("poster_id");
CREATE INDEX "post_approved" on "phpbb_posts" ("post_approved");
CREATE INDEX "post_username" on "phpbb_posts" ("post_username");
CREATE INDEX "tid_post_time" on "phpbb_posts" ("topic_id", "post_time");

--
-- Table: phpbb_privmsgs
--
CREATE TABLE "phpbb_privmsgs" (
  "msg_id" serial NOT NULL,
  "root_level" integer DEFAULT 0 NOT NULL,
  "author_id" integer DEFAULT 0 NOT NULL,
  "icon_id" integer DEFAULT 0 NOT NULL,
  "author_ip" character varying(40) DEFAULT '' NOT NULL,
  "message_time" bigint DEFAULT 0 NOT NULL,
  "enable_bbcode" smallint DEFAULT 1 NOT NULL,
  "enable_smilies" smallint DEFAULT 1 NOT NULL,
  "enable_magic_url" smallint DEFAULT 1 NOT NULL,
  "enable_sig" smallint DEFAULT 1 NOT NULL,
  "message_subject" character varying(255) DEFAULT '' NOT NULL,
  "message_text" text NOT NULL,
  "message_edit_reason" character varying(255) DEFAULT '' NOT NULL,
  "message_edit_user" integer DEFAULT 0 NOT NULL,
  "message_attachment" smallint DEFAULT 0 NOT NULL,
  "bbcode_bitfield" character varying(255) DEFAULT '' NOT NULL,
  "bbcode_uid" character varying(8) DEFAULT '' NOT NULL,
  "message_edit_time" bigint DEFAULT 0 NOT NULL,
  "message_edit_count" smallint DEFAULT 0 NOT NULL,
  "to_address" text NOT NULL,
  "bcc_address" text NOT NULL,
  "message_reported" smallint DEFAULT 0 NOT NULL,
  PRIMARY KEY ("msg_id")
);
CREATE INDEX "author_ip" on "phpbb_privmsgs" ("author_ip");
CREATE INDEX "message_time" on "phpbb_privmsgs" ("message_time");
CREATE INDEX "author_id" on "phpbb_privmsgs" ("author_id");
CREATE INDEX "root_level" on "phpbb_privmsgs" ("root_level");

--
-- Table: phpbb_privmsgs_folder
--
CREATE TABLE "phpbb_privmsgs_folder" (
  "folder_id" serial NOT NULL,
  "user_id" integer DEFAULT 0 NOT NULL,
  "folder_name" character varying(255) DEFAULT '' NOT NULL,
  "pm_count" integer DEFAULT 0 NOT NULL,
  PRIMARY KEY ("folder_id")
);
CREATE INDEX "user_id" on "phpbb_privmsgs_folder" ("user_id");

--
-- Table: phpbb_privmsgs_rules
--
CREATE TABLE "phpbb_privmsgs_rules" (
  "rule_id" serial NOT NULL,
  "user_id" integer DEFAULT 0 NOT NULL,
  "rule_check" integer DEFAULT 0 NOT NULL,
  "rule_connection" integer DEFAULT 0 NOT NULL,
  "rule_string" character varying(255) DEFAULT '' NOT NULL,
  "rule_user_id" integer DEFAULT 0 NOT NULL,
  "rule_group_id" integer DEFAULT 0 NOT NULL,
  "rule_action" integer DEFAULT 0 NOT NULL,
  "rule_folder_id" bigint DEFAULT 0 NOT NULL,
  PRIMARY KEY ("rule_id")
);
CREATE INDEX "user_id" on "phpbb_privmsgs_rules" ("user_id");

--
-- Table: phpbb_privmsgs_to
--
CREATE TABLE "phpbb_privmsgs_to" (
  "msg_id" integer DEFAULT 0 NOT NULL,
  "user_id" integer DEFAULT 0 NOT NULL,
  "author_id" integer DEFAULT 0 NOT NULL,
  "pm_deleted" smallint DEFAULT 0 NOT NULL,
  "pm_new" smallint DEFAULT 1 NOT NULL,
  "pm_unread" smallint DEFAULT 1 NOT NULL,
  "pm_replied" smallint DEFAULT 0 NOT NULL,
  "pm_marked" smallint DEFAULT 0 NOT NULL,
  "pm_forwarded" smallint DEFAULT 0 NOT NULL,
  "folder_id" bigint DEFAULT 0 NOT NULL
);
CREATE INDEX "msg_id" on "phpbb_privmsgs_to" ("msg_id");
CREATE INDEX "author_id" on "phpbb_privmsgs_to" ("author_id");
CREATE INDEX "usr_flder_id" on "phpbb_privmsgs_to" ("user_id", "folder_id");

--
-- Table: phpbb_profile_fields
--
CREATE TABLE "phpbb_profile_fields" (
  "field_id" serial NOT NULL,
  "field_name" character varying(255) DEFAULT '' NOT NULL,
  "field_type" smallint DEFAULT 0 NOT NULL,
  "field_ident" character varying(20) DEFAULT '' NOT NULL,
  "field_length" character varying(20) DEFAULT '' NOT NULL,
  "field_minlen" character varying(255) DEFAULT '' NOT NULL,
  "field_maxlen" character varying(255) DEFAULT '' NOT NULL,
  "field_novalue" character varying(255) DEFAULT '' NOT NULL,
  "field_default_value" character varying(255) DEFAULT '' NOT NULL,
  "field_validation" character varying(20) DEFAULT '' NOT NULL,
  "field_required" smallint DEFAULT 0 NOT NULL,
  "field_show_novalue" smallint DEFAULT 0 NOT NULL,
  "field_show_on_reg" smallint DEFAULT 0 NOT NULL,
  "field_show_on_vt" smallint DEFAULT 0 NOT NULL,
  "field_show_profile" smallint DEFAULT 0 NOT NULL,
  "field_hide" smallint DEFAULT 0 NOT NULL,
  "field_no_view" smallint DEFAULT 0 NOT NULL,
  "field_active" smallint DEFAULT 0 NOT NULL,
  "field_order" integer DEFAULT 0 NOT NULL,
  PRIMARY KEY ("field_id")
);
CREATE INDEX "fld_type" on "phpbb_profile_fields" ("field_type");
CREATE INDEX "fld_ordr" on "phpbb_profile_fields" ("field_order");

--
-- Table: phpbb_profile_fields_data
--
CREATE TABLE "phpbb_profile_fields_data" (
  "user_id" integer DEFAULT 0 NOT NULL,
  PRIMARY KEY ("user_id")
);

--
-- Table: phpbb_profile_fields_lang
--
CREATE TABLE "phpbb_profile_fields_lang" (
  "field_id" integer DEFAULT 0 NOT NULL,
  "lang_id" integer DEFAULT 0 NOT NULL,
  "option_id" integer DEFAULT 0 NOT NULL,
  "field_type" smallint DEFAULT 0 NOT NULL,
  "lang_value" character varying(255) DEFAULT '' NOT NULL,
  PRIMARY KEY ("field_id", "lang_id", "option_id")
);

--
-- Table: phpbb_profile_lang
--
CREATE TABLE "phpbb_profile_lang" (
  "field_id" integer DEFAULT 0 NOT NULL,
  "lang_id" integer DEFAULT 0 NOT NULL,
  "lang_name" character varying(255) DEFAULT '' NOT NULL,
  "lang_explain" text NOT NULL,
  "lang_default_value" character varying(255) DEFAULT '' NOT NULL,
  PRIMARY KEY ("field_id", "lang_id")
);

--
-- Table: phpbb_ranks
--
CREATE TABLE "phpbb_ranks" (
  "rank_id" serial NOT NULL,
  "rank_title" character varying(255) DEFAULT '' NOT NULL,
  "rank_min" integer DEFAULT 0 NOT NULL,
  "rank_special" smallint DEFAULT 0 NOT NULL,
  "rank_image" character varying(255) DEFAULT '' NOT NULL,
  PRIMARY KEY ("rank_id")
);

--
-- Table: phpbb_reports
--
CREATE TABLE "phpbb_reports" (
  "report_id" serial NOT NULL,
  "reason_id" smallint DEFAULT 0 NOT NULL,
  "post_id" integer DEFAULT 0 NOT NULL,
  "pm_id" integer DEFAULT 0 NOT NULL,
  "user_id" integer DEFAULT 0 NOT NULL,
  "user_notify" smallint DEFAULT 0 NOT NULL,
  "report_closed" smallint DEFAULT 0 NOT NULL,
  "report_time" bigint DEFAULT 0 NOT NULL,
  "report_text" text NOT NULL,
  PRIMARY KEY ("report_id")
);
CREATE INDEX "post_id" on "phpbb_reports" ("post_id");
CREATE INDEX "pm_id" on "phpbb_reports" ("pm_id");

--
-- Table: phpbb_reports_reasons
--
CREATE TABLE "phpbb_reports_reasons" (
  "reason_id" serial NOT NULL,
  "reason_title" character varying(255) DEFAULT '' NOT NULL,
  "reason_description" text NOT NULL,
  "reason_order" smallint DEFAULT 0 NOT NULL,
  PRIMARY KEY ("reason_id")
);

--
-- Table: phpbb_search_results
--
CREATE TABLE "phpbb_search_results" (
  "search_key" character varying(32) DEFAULT '' NOT NULL,
  "search_time" bigint DEFAULT 0 NOT NULL,
  "search_keywords" text NOT NULL,
  "search_authors" text NOT NULL,
  PRIMARY KEY ("search_key")
);

--
-- Table: phpbb_search_wordlist
--
CREATE TABLE "phpbb_search_wordlist" (
  "word_id" serial NOT NULL,
  "word_text" character varying(255) DEFAULT '' NOT NULL,
  "word_common" smallint DEFAULT 0 NOT NULL,
  "word_count" integer DEFAULT 0 NOT NULL,
  PRIMARY KEY ("word_id"),
  CONSTRAINT "wrd_txt" UNIQUE ("word_text")
);
CREATE INDEX "wrd_cnt" on "phpbb_search_wordlist" ("word_count");

--
-- Table: phpbb_search_wordmatch
--
CREATE TABLE "phpbb_search_wordmatch" (
  "post_id" integer DEFAULT 0 NOT NULL,
  "word_id" integer DEFAULT 0 NOT NULL,
  "title_match" smallint DEFAULT 0 NOT NULL,
  CONSTRAINT "unq_mtch" UNIQUE ("word_id", "post_id", "title_match")
);
CREATE INDEX "word_id" on "phpbb_search_wordmatch" ("word_id");
CREATE INDEX "post_id" on "phpbb_search_wordmatch" ("post_id");

--
-- Table: phpbb_sessions
--
CREATE TABLE "phpbb_sessions" (
  "session_id" character(32) DEFAULT '' NOT NULL,
  "session_user_id" integer DEFAULT 0 NOT NULL,
  "session_forum_id" integer DEFAULT 0 NOT NULL,
  "session_last_visit" bigint DEFAULT 0 NOT NULL,
  "session_start" bigint DEFAULT 0 NOT NULL,
  "session_time" bigint DEFAULT 0 NOT NULL,
  "session_ip" character varying(40) DEFAULT '' NOT NULL,
  "session_browser" character varying(150) DEFAULT '' NOT NULL,
  "session_forwarded_for" character varying(255) DEFAULT '' NOT NULL,
  "session_page" character varying(255) DEFAULT '' NOT NULL,
  "session_viewonline" smallint DEFAULT 1 NOT NULL,
  "session_autologin" smallint DEFAULT 0 NOT NULL,
  "session_admin" smallint DEFAULT 0 NOT NULL,
  PRIMARY KEY ("session_id")
);
CREATE INDEX "session_time" on "phpbb_sessions" ("session_time");
CREATE INDEX "session_user_id" on "phpbb_sessions" ("session_user_id");
CREATE INDEX "session_fid" on "phpbb_sessions" ("session_forum_id");

--
-- Table: phpbb_sessions_keys
--
CREATE TABLE "phpbb_sessions_keys" (
  "key_id" character(32) DEFAULT '' NOT NULL,
  "user_id" integer DEFAULT 0 NOT NULL,
  "last_ip" character varying(40) DEFAULT '' NOT NULL,
  "last_login" bigint DEFAULT 0 NOT NULL,
  PRIMARY KEY ("key_id", "user_id")
);
CREATE INDEX "last_login" on "phpbb_sessions_keys" ("last_login");

--
-- Table: phpbb_sitelist
--
CREATE TABLE "phpbb_sitelist" (
  "site_id" serial NOT NULL,
  "site_ip" character varying(40) DEFAULT '' NOT NULL,
  "site_hostname" character varying(255) DEFAULT '' NOT NULL,
  "ip_exclude" smallint DEFAULT 0 NOT NULL,
  PRIMARY KEY ("site_id")
);

--
-- Table: phpbb_smilies
--
CREATE TABLE "phpbb_smilies" (
  "smiley_id" serial NOT NULL,
  "code" character varying(50) DEFAULT '' NOT NULL,
  "emotion" character varying(50) DEFAULT '' NOT NULL,
  "smiley_url" character varying(50) DEFAULT '' NOT NULL,
  "smiley_width" smallint DEFAULT 0 NOT NULL,
  "smiley_height" smallint DEFAULT 0 NOT NULL,
  "smiley_order" integer DEFAULT 0 NOT NULL,
  "display_on_posting" smallint DEFAULT 1 NOT NULL,
  PRIMARY KEY ("smiley_id")
);
CREATE INDEX "display_on_post" on "phpbb_smilies" ("display_on_posting");

--
-- Table: phpbb_styles
--
CREATE TABLE "phpbb_styles" (
  "style_id" serial NOT NULL,
  "style_name" character varying(255) DEFAULT '' NOT NULL,
  "style_copyright" character varying(255) DEFAULT '' NOT NULL,
  "style_active" smallint DEFAULT 1 NOT NULL,
  "template_id" integer DEFAULT 0 NOT NULL,
  "theme_id" integer DEFAULT 0 NOT NULL,
  "imageset_id" integer DEFAULT 0 NOT NULL,
  PRIMARY KEY ("style_id"),
  CONSTRAINT "style_name" UNIQUE ("style_name")
);
CREATE INDEX "template_id" on "phpbb_styles" ("template_id");
CREATE INDEX "theme_id" on "phpbb_styles" ("theme_id");
CREATE INDEX "imageset_id" on "phpbb_styles" ("imageset_id");

--
-- Table: phpbb_styles_imageset
--
CREATE TABLE "phpbb_styles_imageset" (
  "imageset_id" serial NOT NULL,
  "imageset_name" character varying(255) DEFAULT '' NOT NULL,
  "imageset_copyright" character varying(255) DEFAULT '' NOT NULL,
  "imageset_path" character varying(100) DEFAULT '' NOT NULL,
  PRIMARY KEY ("imageset_id"),
  CONSTRAINT "imgset_nm" UNIQUE ("imageset_name")
);

--
-- Table: phpbb_styles_imageset_data
--
CREATE TABLE "phpbb_styles_imageset_data" (
  "image_id" serial NOT NULL,
  "image_name" character varying(200) DEFAULT '' NOT NULL,
  "image_filename" character varying(200) DEFAULT '' NOT NULL,
  "image_lang" character varying(30) DEFAULT '' NOT NULL,
  "image_height" smallint DEFAULT 0 NOT NULL,
  "image_width" smallint DEFAULT 0 NOT NULL,
  "imageset_id" integer DEFAULT 0 NOT NULL,
  PRIMARY KEY ("image_id")
);
CREATE INDEX "i_d" on "phpbb_styles_imageset_data" ("imageset_id");

--
-- Table: phpbb_styles_template
--
CREATE TABLE "phpbb_styles_template" (
  "template_id" serial NOT NULL,
  "template_name" character varying(255) DEFAULT '' NOT NULL,
  "template_copyright" character varying(255) DEFAULT '' NOT NULL,
  "template_path" character varying(100) DEFAULT '' NOT NULL,
  "bbcode_bitfield" character varying(255) DEFAULT 'kNg=' NOT NULL,
  "template_storedb" smallint DEFAULT 0 NOT NULL,
  "template_inherits_id" smallint DEFAULT 0 NOT NULL,
  "template_inherit_path" character varying(255) DEFAULT '' NOT NULL,
  PRIMARY KEY ("template_id"),
  CONSTRAINT "tmplte_nm" UNIQUE ("template_name")
);

--
-- Table: phpbb_styles_template_data
--
CREATE TABLE "phpbb_styles_template_data" (
  "template_id" integer DEFAULT 0 NOT NULL,
  "template_filename" character varying(100) DEFAULT '' NOT NULL,
  "template_included" text NOT NULL,
  "template_mtime" bigint DEFAULT 0 NOT NULL,
  "template_data" text NOT NULL
);
CREATE INDEX "tid" on "phpbb_styles_template_data" ("template_id");
CREATE INDEX "tfn" on "phpbb_styles_template_data" ("template_filename");

--
-- Table: phpbb_styles_theme
--
CREATE TABLE "phpbb_styles_theme" (
  "theme_id" serial NOT NULL,
  "theme_name" character varying(255) DEFAULT '' NOT NULL,
  "theme_copyright" character varying(255) DEFAULT '' NOT NULL,
  "theme_path" character varying(100) DEFAULT '' NOT NULL,
  "theme_storedb" smallint DEFAULT 0 NOT NULL,
  "theme_mtime" bigint DEFAULT 0 NOT NULL,
  "theme_data" text NOT NULL,
  PRIMARY KEY ("theme_id"),
  CONSTRAINT "theme_name" UNIQUE ("theme_name")
);

--
-- Table: phpbb_topics
--
CREATE TABLE "phpbb_topics" (
  "topic_id" serial NOT NULL,
  "forum_id" integer DEFAULT 0 NOT NULL,
  "icon_id" integer DEFAULT 0 NOT NULL,
  "topic_attachment" smallint DEFAULT 0 NOT NULL,
  "topic_approved" smallint DEFAULT 1 NOT NULL,
  "topic_reported" smallint DEFAULT 0 NOT NULL,
  "topic_title" character varying(255) DEFAULT '' NOT NULL,
  "topic_poster" integer DEFAULT 0 NOT NULL,
  "topic_time" bigint DEFAULT 0 NOT NULL,
  "topic_time_limit" bigint DEFAULT 0 NOT NULL,
  "topic_views" integer DEFAULT 0 NOT NULL,
  "topic_replies" integer DEFAULT 0 NOT NULL,
  "topic_replies_real" integer DEFAULT 0 NOT NULL,
  "topic_status" smallint DEFAULT 0 NOT NULL,
  "topic_type" smallint DEFAULT 0 NOT NULL,
  "topic_first_post_id" integer DEFAULT 0 NOT NULL,
  "topic_first_poster_name" character varying(255) DEFAULT '' NOT NULL,
  "topic_first_poster_colour" character varying(6) DEFAULT '' NOT NULL,
  "topic_last_post_id" integer DEFAULT 0 NOT NULL,
  "topic_last_poster_id" integer DEFAULT 0 NOT NULL,
  "topic_last_poster_name" character varying(255) DEFAULT '' NOT NULL,
  "topic_last_poster_colour" character varying(6) DEFAULT '' NOT NULL,
  "topic_last_post_subject" character varying(255) DEFAULT '' NOT NULL,
  "topic_last_post_time" bigint DEFAULT 0 NOT NULL,
  "topic_last_view_time" bigint DEFAULT 0 NOT NULL,
  "topic_moved_id" integer DEFAULT 0 NOT NULL,
  "topic_bumped" smallint DEFAULT 0 NOT NULL,
  "topic_bumper" integer DEFAULT 0 NOT NULL,
  "poll_title" character varying(255) DEFAULT '' NOT NULL,
  "poll_start" bigint DEFAULT 0 NOT NULL,
  "poll_length" bigint DEFAULT 0 NOT NULL,
  "poll_max_options" smallint DEFAULT 1 NOT NULL,
  "poll_last_vote" bigint DEFAULT 0 NOT NULL,
  "poll_vote_change" smallint DEFAULT 0 NOT NULL,
  PRIMARY KEY ("topic_id")
);
CREATE INDEX "forum_id" on "phpbb_topics" ("forum_id");
CREATE INDEX "forum_id_type" on "phpbb_topics" ("forum_id", "topic_type");
CREATE INDEX "last_post_time" on "phpbb_topics" ("topic_last_post_time");
CREATE INDEX "topic_approved" on "phpbb_topics" ("topic_approved");
CREATE INDEX "forum_appr_last" on "phpbb_topics" ("forum_id", "topic_approved", "topic_last_post_id");
CREATE INDEX "fid_time_moved" on "phpbb_topics" ("forum_id", "topic_last_post_time", "topic_moved_id");

--
-- Table: phpbb_topics_posted
--
CREATE TABLE "phpbb_topics_posted" (
  "user_id" integer DEFAULT 0 NOT NULL,
  "topic_id" integer DEFAULT 0 NOT NULL,
  "topic_posted" smallint DEFAULT 0 NOT NULL,
  PRIMARY KEY ("user_id", "topic_id")
);

--
-- Table: phpbb_topics_track
--
CREATE TABLE "phpbb_topics_track" (
  "user_id" integer DEFAULT 0 NOT NULL,
  "topic_id" integer DEFAULT 0 NOT NULL,
  "forum_id" integer DEFAULT 0 NOT NULL,
  "mark_time" bigint DEFAULT 0 NOT NULL,
  PRIMARY KEY ("user_id", "topic_id")
);
CREATE INDEX "topic_id" on "phpbb_topics_track" ("topic_id");
CREATE INDEX "forum_id" on "phpbb_topics_track" ("forum_id");

--
-- Table: phpbb_topics_watch
--
CREATE TABLE "phpbb_topics_watch" (
  "topic_id" integer DEFAULT 0 NOT NULL,
  "user_id" integer DEFAULT 0 NOT NULL,
  "notify_status" smallint DEFAULT 0 NOT NULL
);
CREATE INDEX "topic_id" on "phpbb_topics_watch" ("topic_id");
CREATE INDEX "user_id" on "phpbb_topics_watch" ("user_id");
CREATE INDEX "notify_stat" on "phpbb_topics_watch" ("notify_status");

--
-- Table: phpbb_users
--
CREATE TABLE "phpbb_users" (
  "user_id" serial NOT NULL,
  "user_type" smallint DEFAULT 0 NOT NULL,
  "group_id" integer DEFAULT 3 NOT NULL,
  "user_permissions" text NOT NULL,
  "user_perm_from" integer DEFAULT 0 NOT NULL,
  "user_ip" character varying(40) DEFAULT '' NOT NULL,
  "user_regdate" bigint DEFAULT 0 NOT NULL,
  "username" character varying(255) DEFAULT '' NOT NULL,
  "username_clean" character varying(255) DEFAULT '' NOT NULL,
  "user_password" character varying(40) DEFAULT '' NOT NULL,
  "user_passchg" bigint DEFAULT 0 NOT NULL,
  "user_pass_convert" smallint DEFAULT 0 NOT NULL,
  "user_email" character varying(100) DEFAULT '' NOT NULL,
  "user_email_hash" bigint DEFAULT 0 NOT NULL,
  "user_birthday" character varying(10) DEFAULT '' NOT NULL,
  "user_lastvisit" bigint DEFAULT 0 NOT NULL,
  "user_lastmark" bigint DEFAULT 0 NOT NULL,
  "user_lastpost_time" bigint DEFAULT 0 NOT NULL,
  "user_lastpage" character varying(200) DEFAULT '' NOT NULL,
  "user_last_confirm_key" character varying(10) DEFAULT '' NOT NULL,
  "user_last_search" bigint DEFAULT 0 NOT NULL,
  "user_warnings" smallint DEFAULT 0 NOT NULL,
  "user_last_warning" bigint DEFAULT 0 NOT NULL,
  "user_login_attempts" smallint DEFAULT 0 NOT NULL,
  "user_inactive_reason" smallint DEFAULT 0 NOT NULL,
  "user_inactive_time" bigint DEFAULT 0 NOT NULL,
  "user_posts" integer DEFAULT 0 NOT NULL,
  "user_lang" character varying(30) DEFAULT '' NOT NULL,
  "user_timezone" numeric(5,2) DEFAULT 0.00 NOT NULL,
  "user_dst" smallint DEFAULT 0 NOT NULL,
  "user_dateformat" character varying(30) DEFAULT 'd M Y H:i' NOT NULL,
  "user_style" integer DEFAULT 0 NOT NULL,
  "user_rank" integer DEFAULT 0 NOT NULL,
  "user_colour" character varying(6) DEFAULT '' NOT NULL,
  "user_new_privmsg" smallint DEFAULT 0 NOT NULL,
  "user_unread_privmsg" smallint DEFAULT 0 NOT NULL,
  "user_last_privmsg" bigint DEFAULT 0 NOT NULL,
  "user_message_rules" smallint DEFAULT 0 NOT NULL,
  "user_full_folder" bigint DEFAULT -3 NOT NULL,
  "user_emailtime" bigint DEFAULT 0 NOT NULL,
  "user_topic_show_days" smallint DEFAULT 0 NOT NULL,
  "user_topic_sortby_type" character varying(1) DEFAULT 't' NOT NULL,
  "user_topic_sortby_dir" character varying(1) DEFAULT 'd' NOT NULL,
  "user_post_show_days" smallint DEFAULT 0 NOT NULL,
  "user_post_sortby_type" character varying(1) DEFAULT 't' NOT NULL,
  "user_post_sortby_dir" character varying(1) DEFAULT 'a' NOT NULL,
  "user_notify" smallint DEFAULT 0 NOT NULL,
  "user_notify_pm" smallint DEFAULT 1 NOT NULL,
  "user_notify_type" smallint DEFAULT 0 NOT NULL,
  "user_allow_pm" smallint DEFAULT 1 NOT NULL,
  "user_allow_viewonline" smallint DEFAULT 1 NOT NULL,
  "user_allow_viewemail" smallint DEFAULT 1 NOT NULL,
  "user_allow_massemail" smallint DEFAULT 1 NOT NULL,
  "user_options" bigint DEFAULT 230271 NOT NULL,
  "user_avatar" character varying(255) DEFAULT '' NOT NULL,
  "user_avatar_type" smallint DEFAULT 0 NOT NULL,
  "user_avatar_width" smallint DEFAULT 0 NOT NULL,
  "user_avatar_height" smallint DEFAULT 0 NOT NULL,
  "user_sig" text NOT NULL,
  "user_sig_bbcode_uid" character varying(8) DEFAULT '' NOT NULL,
  "user_sig_bbcode_bitfield" character varying(255) DEFAULT '' NOT NULL,
  "user_from" character varying(100) DEFAULT '' NOT NULL,
  "user_icq" character varying(15) DEFAULT '' NOT NULL,
  "user_aim" character varying(255) DEFAULT '' NOT NULL,
  "user_yim" character varying(255) DEFAULT '' NOT NULL,
  "user_msnm" character varying(255) DEFAULT '' NOT NULL,
  "user_jabber" character varying(255) DEFAULT '' NOT NULL,
  "user_website" character varying(200) DEFAULT '' NOT NULL,
  "user_occ" text NOT NULL,
  "user_interests" text NOT NULL,
  "user_actkey" character varying(32) DEFAULT '' NOT NULL,
  "user_newpasswd" character varying(40) DEFAULT '' NOT NULL,
  "user_form_salt" character varying(32) DEFAULT '' NOT NULL,
  "user_new" smallint DEFAULT 1 NOT NULL,
  "user_reminded" smallint DEFAULT 0 NOT NULL,
  "user_reminded_time" bigint DEFAULT 0 NOT NULL,
  PRIMARY KEY ("user_id"),
  CONSTRAINT "username_clean" UNIQUE ("username_clean")
);
CREATE INDEX "user_birthday" on "phpbb_users" ("user_birthday");
CREATE INDEX "user_email_hash" on "phpbb_users" ("user_email_hash");
CREATE INDEX "user_type" on "phpbb_users" ("user_type");

--
-- Table: phpbb_user_group
--
CREATE TABLE "phpbb_user_group" (
  "group_id" integer DEFAULT 0 NOT NULL,
  "user_id" integer DEFAULT 0 NOT NULL,
  "group_leader" smallint DEFAULT 0 NOT NULL,
  "user_pending" smallint DEFAULT 1 NOT NULL
);
CREATE INDEX "group_id" on "phpbb_user_group" ("group_id");
CREATE INDEX "user_id" on "phpbb_user_group" ("user_id");
CREATE INDEX "group_leader" on "phpbb_user_group" ("group_leader");

--
-- Table: phpbb_warnings
--
CREATE TABLE "phpbb_warnings" (
  "warning_id" serial NOT NULL,
  "user_id" integer DEFAULT 0 NOT NULL,
  "post_id" integer DEFAULT 0 NOT NULL,
  "log_id" integer DEFAULT 0 NOT NULL,
  "warning_time" bigint DEFAULT 0 NOT NULL,
  PRIMARY KEY ("warning_id")
);

--
-- Table: phpbb_words
--
CREATE TABLE "phpbb_words" (
  "word_id" serial NOT NULL,
  "word" character varying(255) DEFAULT '' NOT NULL,
  "replacement" character varying(255) DEFAULT '' NOT NULL,
  PRIMARY KEY ("word_id")
);

--
-- Table: phpbb_zebra
--
CREATE TABLE "phpbb_zebra" (
  "user_id" integer DEFAULT 0 NOT NULL,
  "zebra_id" integer DEFAULT 0 NOT NULL,
  "friend" smallint DEFAULT 0 NOT NULL,
  "foe" smallint DEFAULT 0 NOT NULL,
  PRIMARY KEY ("user_id", "zebra_id")
);

