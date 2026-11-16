{
  ...
}:

{
  services.meshcore-bot = {
    enable = true;
    webviewer = {
      enable = true;
      host = "0.0.0.0";
      port = 8080;
    };
    settings = {
      Connection = {
        connection_type = "tcp";
        serial_port = "/dev/ttyUSB0";
        ble_device_name = "";
        hostname = "0.0.0.0";
        tcp_port = "5060";
        timeout = 30;
        reconnect_max_retries = 0;
        reconnect_delay_seconds = 10;
        reconnect_max_delay_seconds = 60;
        radio_debug = false;
        radio_probe_interval_seconds = 300;
        radio_probe_fail_threshold = 3;
        radio_zombie_alert_enabled = false;
        radio_zombie_alert_email = "";
        radio_offline_threshold = 3;
        radio_offline_alert_enabled = false;
        radio_offline_alert_email = "";
        command_min_interval_ms = 30;
        channel_fetch_interval_ms = 300;
      };
      Bot = {
        bot_name = "ORD-COOK-WOLF-BOT";
        auto_update_device_name = true;
        rf_data_timeout = 15.0;
        message_correlation_timeout = 10.0;
        enable_enhanced_correlation = true;
        respond_to_mentions = "also";
        enabled = true;
        passive_mode = false;
        rate_limit_seconds = 10;
        scheduled_message_max_stagger_seconds = 1.5;
        scheduled_command_timeout_seconds = 30;
        bot_tx_rate_limit_seconds = 1.0;
        per_user_rate_limit_seconds = 10;
        per_user_rate_limit_enabled = true;
        tx_delay_ms = 250;
        dm_max_retries = 3;
        dm_max_flood_attempts = 2;
        dm_flood_after = 2;
        timezone = "America/Chicago";
        bot_latitude = 41.97682;
        bot_longitude = -87.90566;
        max_channels = 40;
        advert_interval_hours = 4;
        startup_advert = "flood";
        auto_manage_contacts = "device";
        service_restart_backoff_seconds = 300;
        send_timeout_seconds = 30;
        prefix_bytes = 3;
      };
      Admin = {
        enabled = false;
        port = 5001;
        token = [];
      };
      Channels = {
        monitor_channels = [ "bot" ];
        respond_to_dms = true;
        max_response_hops = 7;
      };
      Region_Warnings = {
        track_traffic = true;
        enabled = false;
        dry_run = true;
        delivery = "dm";
        min_unscoped_messages = 3;
        per_sender_cooldown_hours = 168;
        mesh_cooldown_minutes = 30;
        max_warnings_per_day = 6;
      };
      Banned_Users.banned_users = [];
      Localization = {
        language = "en";
        translation_path = "translations/";
        auto_detect_language = false;
      };
      Admin_ACL = {
        admin_pubkeys = [
          "0B84E765039948B5BAE90111EE83633F0141A62905DF2B7C8257E90631583970"
        ];
        admin_commands = [
          "repeater"
          "webviewer"
          "reload"
          "channelpause"
          "neighbors"
        ];
      };
      Plugin_Overrides = {};
      Service_Overrides = {};
      Companion_Purge = {
        companion_purge_enabled = false;
        companion_dm_threshold_days = 30;
        companion_advert_threshold_days = 30;
        companion_min_inactive_days = 30;
      };
      Keywords = {
        test = "Ack @[{sender}] | {path}";
        ping = "Pong!";
        pong = "Ping!";
      };
      Custom_Syntax = {};
      RandomLine = {};
      Scheduled_Messages = {};
      Schedule_Command = {
        enabled = true;
        dm_only = true;
      };
      Logging = {
        log_level = "INFO";
        colored_output = true;
        meshcore_log_level = "INFO";
        json_logging = false;
        log_max_bytes = 5242880;
        log_backup_count = 3;
      };
      External_Data = {
        short_url_website_service = "gd";
        short_url_website = "https://v.gd";
        short_url_website_api_key = "";
        weather_api_key = "";
        weather_update_interval = 3600;
        tide_api_key = "";
        tide_update_interval = 1800;
        n2yo_api_key = "";
        airnow_api_key = "";
        forecast_solar_api_key = "";
        repeater_prefix_api_url = "";
        repeater_prefix_cache_hours = 1;
      };
      Prefix_Command = {
        enabled = true;
        show_repeater_locations = true;
        use_reverse_geocoding = true;
        hide_source = false;
        prefix_heard_days = 7;
        prefix_free_days = 7;
        max_prefix_range = 200;
        prefix_best_enabled = true;
        prefix_best_min_edge_observations = 2;
        prefix_best_max_edge_age_days = 30;
        prefix_best_location_radius_km = 50;
        prefix_best_do_not_suggest = "";
        channels = [
          "#bot"
          "#test"
        ];
      };
      Weather = {
        weather_provider = "noaa";
        default_state = "IL";
        default_country = "US";
        use_bot_location_when_no_location = false;
        temperature_unit = "fahrenheit";
        wind_speed_unit = "mph";
        precipitation_unit = "inch";
        temperature_high_low_format = "{high_label}:{high}{units} {low_label}:{low}{units}";
        temperature_high_only_format = "{high_label}:{high}{units}";
        temperature_low_only_format = "{low_label}:{low}{units}";
        default_city = "Chicago, IL";
      };
      Solar_Config = {
        url_timeout = 10;
        use_zulu_time = false;
      };
      Aurora_Command = {
        enabled = true;
        default_lat = 41.97682;
        default_lon = -87.90566;
        channels = [ "#weather" ];
      };
      Rain_Command = {
        enabled = true;
        default_lat = 41.97682;
        default_lon = -87.90566;
        channels = [ "#weather" ];
      };
      Channels_List = {
        # General
        public = "8B4B705B080C0D943B1C80F6B3EF6B6D";
        chat = "D0BDD6D71538138ED979EEC00D98AD97";
        emergency = "E1AD578D25108E344808F30DFDAAF926";

        # Chicagoland
        chicago = "C1C289B131E5222370CBC2048445844B";
        chimesh = "869D8AE6F43E99F7EF463027F916F1FC";

        # Regional -> Suburbia
        suburbs = "428A0416C430927E63D01A5DA35839F0";
        northburbs = "8335AC4590C5E47EFC45D0F95A433416";
        nshore = "5E4DC642EC1C7567F58E8356201DE580";
        neburbs = "17F8D36FD0C91A6008288B4326B08926";
        nwburbs = "988239D85DAC1C5F3805976B4FAE1E17";
        westburbs = "61CF1C9E7FCCC2DF4704864CCF8FE306";
        southburbs = "58CA156A0B1DABD28E7BC6F20411438C";
        swburbs = "B9AA614333E2383A86ED37AD6526E709";
        seburbs = "2A9CACE768A60A58C08EE6F759D9C114";
        farwestburbs = "80CD1DBA03CD70AC219407D31350C6C2";
        farnorthburbs = "0D2351FE272DFF112E1C0980F813424D";
        farsouthburbs = "ACE50FC831BCCD92F26C1529E3ADC4D5";

        # Regional -> Counties
        cookcounty = "0325125FE35567CC44BACF6BED8747FB";
        dupagecounty = "AB5B36AE7C50BD90DD3E444EB4D547F8";
        lakecounty = "AA0D82401F5248F1402EFAB7CFA8743E";
        mchenrycounty = "C8B00C62315FEB971CACAC033EB6BFC4B";
        willcounty = "5AC5B043654B75EF16862C62BB583AC7";
        kanecounty = "35C830C021C8267CBCAF78328A71CA13";

        # Regional -> Citywide
        downtown = "31AAFFC36782C7761C8D93DD06686510";
        loop = "D41673EB4BAE7C3955EB55928783A515";
        southloop = "6ACB46B1E07EA6056AB5B4615212872B";
        westloop = "72A79D0A6E492381CE453F075DF3A629";
        northside = "B9053B9857296C9D1DFD5F965F377A5F";
        southside = "D340BF424024085C02A4F7BC685894D2";
        westside = "5127C8D00849A07CCFEC637D2B8240F3";
        farnorthside = "713AC0D13C5D4A3B23E81C2E67C8D061";
        northwestside = "9AC489FF2888FBC97C33D6306F051FED";
        southwestside = "58EEF26BA16E46FC2E6145D380DB595D";

        # Interests
        hamradio = "83C8B01997654265938DA8765CBC7DB9";
        jokes = "ABE610D61DEE508C0AC18793C36C41C3";
        weather = "88F502554FEE92A1625CFB311546E7CB";

        # Chicago Sports
        sports = "E8EE81F3ABBF105D9BA2D2D4BD94FE4A";
        cubs = "567F84D8CD91406E7D84F962DC810522";
        whitesox = "ADEB8F2EA5CCA1624BBEB684821DC846";
        bears = "E328BD6007F137D540491E0B98C0EF49";
        bulls = "1E223BD0935A1983832435B8B876F97D";
        blackhawks = "8F84F0A243AD2854C923D154D9C7FBE5";
        sky = "CAA8572648096DF8DE3FAAFB0677F04";

        # Topical
        traffic = "93C7E543CF5A2C658DC81E9A1655400C";
        events = "12535A3F2B86D9164F1D849FEB26EA5D";
        transit = "3C1EBFB8D64AFFBCB375E6F31C5FCC48";
        tech = "9D7B23A57DE521D424B41C130CC45BCE";

        # Utility & Testing
        bot = "EB50A1BCB3E4E5D7BF69A57C9DADA211";
        test = "9CD8FCF22A47333B591D96A2B848B73F";
        healthcheck = "3AE59C2CDA86744C75E68B3975A902AE";
        wardriving = "E3C26491E9CD321E3A6BE50D57D54ACF";
      };
      Sports_Command = {
        enabled = true;
        teams = [
          "cubs"
          "whitesox"
          "bears"
          "bulls"
          "blackhawks"
          "sky"
        ];
        channel_override = [
          "#cubs=cubs"
          "#whitesox=whitesox"
          "#bears=bears"
          "#bulls=bulls"
          "#blackhawks=blackhawks"
          "#sky=sky"
        ];
        api_timeout = 10;
        channels = [
          "#bot"
          "#sports"
        ];
      };
      Worldcup_Command = {
        enabled = true;
        api_timeout = 10;
        cache_ttl_minutes = 360;
        channels = [
          "#bot"
          "#sports"
        ];
      };
      Stats_Command = {
        enabled = true;
        data_retention_days = 7;
        auto_cleanup = true;
        collect_stats = true;
        track_all_messages = true;
        track_command_details = true;
        anonymize_users = false;
        channels = [ "#bot" ];
      };
      Data_Retention = {
        retention_delete_batch_size = 1000;
        retention_delete_pause_seconds = 0.1;
        packet_stream_retention_days = 3;
        daily_stats_retention_days = 90;
        observed_paths_retention_days = 90;
        purging_log_retention_days = 90;
        mesh_connections_retention_days = 7;
        neighbor_observations_retention_days = 365;
        region_warning_retention_days = 90;
      };
      Path_Command = {
        enabled = true;
        require_path_bytes_greater_or_equal_to = 0;
        require_path_bytes_failure_response = "";
        enable_p_shortcut = true;
        reply_prefix = "";
        minimum_path_bytes = 0;
        path_selection_preset = "balanced";
        proximity_method = "path";
        path_proximity_fallback = true;
        max_proximity_range = 200;
        max_repeater_age_days = 14;
        recency_weight = 0.4;
        recency_decay_half_life_hours = 24;
        graph_based_validation = true;
        min_edge_observations = 3;
        graph_edge_expiration_days = 7;
        graph_write_strategy = "batched";
        graph_batch_interval_seconds = 30;
        graph_batch_max_pending = 100;
        graph_use_bidirectional = true;
        graph_use_hop_position = true;
        graph_multi_hop_enabled = true;
        graph_multi_hop_max_hops = 2;
        graph_geographic_combined = false;
        graph_geographic_weight = 0.7;
        graph_confidence_override_threshold = 0.7;
        graph_distance_penalty_enabled = true;
        graph_max_reasonable_hop_distance_km = 50;
        graph_distance_penalty_strength = 0.3;
        graph_zero_hop_bonus = 0.4;
        graph_prefer_stored_keys = true;
        graph_final_hop_proximity_enabled = true;
        graph_final_hop_proximity_weight = 0.25;
        graph_final_hop_max_distance = 0;
        graph_final_hop_proximity_normalization_km = 200;
        graph_final_hop_very_close_threshold_km = 10;
        graph_final_hop_close_threshold_km = 30;
        graph_final_hop_max_proximity_weight = 0.6;
        graph_path_validation_max_bonus = 0.3;
        graph_path_validation_obs_divisor = 50.0;
        graph_startup_load_days = 0;
        graph_capture_enabled = true;
        star_bias_multiplier = 2.5;
        high_confidence_symbol = "🎯";
        medium_confidence_symbol = "📍";
        low_confidence_symbol = "❓";
        channels = [
          "#bot"
          "#test"
        ];
      };
      Joke_Command = {
        enabled = true;
        seasonal_jokes = true;
        long_jokes = false;
        channels = [ "#jokes" ];
      };
      DadJoke_Command = {
        enabled = true;
        long_jokes = false;
        channels = [ "#jokes" ];
      };
      Hacker_Command.enabled = false;
      Multitest_Command = {
        enabled = true;
        response_format = "@[{sender}] found {path_count} unique path(s):\\n{paths}";
        condense_paths = true;
        require_path_bytes_greater_or_equal_to = 0;
        require_path_bytes_failure_response = "";
        channels = [
          "#bot"
          "#test"
        ];
      };
      Greeter_Command = {
        enabled = false;
        greeting_message = "Welcome to the mesh, @[{sender}]!";
        channel_greetings = "";
        per_channel_greetings = false;
        include_mesh_info = true;
        mesh_info_format = "\n\nMesh Info: {total_contacts} contacts, {repeaters} repeaters, {recent_activity_24h} active in last 24h";
        rollout_days = 7;
        auto_backfill = false;
        backfill_lookback_days = 30;
        dead_air_delay_seconds = 0;
        defer_to_human_greeting = false;
        levenshtein_distance = 0;
      };
      Alert_Command = {
        enabled = true;
        max_distance_km = 20.0;
        max_incident_age_hours = 24.0;
        channels = [ "#weather" ];
      };
      Announcements_Command = {
        enabled = false;
        announcements_acl = "";
        default_announcement_channel = "Public";
        announcement_cooldown = 60;
        "announce.default" = "This is the default announcement.";
        "announce.bots" = "This is an announcement with the list of bots.";
        "announce.other" = "This is a different announcement on another topic.";
      };
      Airplanes_Command = {
        enabled = true;
        api_url = "https://api.adsb.lol/v2/";
        default_radius = 25;
        max_results = 3;
        url_timeout = 10;
        channels = [ "#bot" ];
      };
      Wx_Command = {
        enabled = true;
        temperature_unit = "fahrenheit";
        wind_speed_unit = "mph";
        channels = [ "#weather" ];
      };
      WebViewer_Command.enabled = true;
      Sun_Command = {
        enabled = true;
        channels = [ "#weather" ];
      };
      Solar_Command = {
        enabled = true;
        channels = [ "#weather" ];
      };
      Solarforecast_Command = {
        enabled = true;
        channels = [ "#weather" ];
      };
      Satpass_Command = {
        enabled = true;
        channels = [ "#bot" ];
      };
      Roll_Command = {
        enabled = true;
        channels = [ "#bot" ];
      };
      Repeater_Command.enabled = true;
      Ping_Command = {
        enabled = true;
        channels = [
          "#bot"
          "#test"
        ];
      };
      Version_Command = {
        enabled = true;
        channels = [
          "#bot"
          "#test"
        ];
      };
      Moon_Command = {
        enabled = true;
        channels = [ "#weather" ];
      };
      Magic8_Command = {
        enabled = true;
        channels = [ "#bot" ];
      };
      Hfcond_Command = {
        enabled = true;
        channels = [ "#bot" ];
      };
      Help_Command = {
        enabled = true;
        channels = [ "#bot" ];
      };
      Hello_Command = {
        enabled = true;
        include_sender = true;
        channels = [ "#bot" ];
      };
      Dice_Command = {
        enabled = true;
        channels = [ "#bot" ];
      };
      Contact_Command = {
        enabled = true;
        channels = [ "#bot" ];
      };
      Cmd_Command = {
        enabled = true;
        channels = [ "#bot" ];
      };
      Channels_Command = {
        enabled = true;
        channels = [ "#bot" ];
      };
      Catfact_Command = {
        enabled = true;
        channels = [ "#bot" ];
      };
      Aqi_Command = {
        enabled = true;
        channels = [ "#weather" ];
      };
      Advert_Command = {
        enabled = true;
        channels = [];
      };
      Neighbors_Command.enabled = true;
      Test_Command = {
        enabled = true;
        require_path_bytes_greater_or_equal_to = 0;
        require_path_bytes_failure_response = "";
        distance_unit = "auto";
        response_format = "Ack @[{sender}] | {path}";
        channels = [
          "#bot"
          "#test"
        ];
      };
      Trace_Command = {
        enabled = true;
        maximum_hops = 5;
        trace_mode = "one_byte";
        timeout_base_seconds = 1.0;
        timeout_per_hop_seconds = 0.5;
        trace_retry_count = 2;
        trace_retry_delay_seconds = 1.0;
        update_graph_one_byte = true;
        update_graph_two_byte = true;
        channels = [
          "#bot"
          "#test"
        ];
      };
      Feed_Manager = {
        feed_manager_enabled = false;
        default_check_interval_seconds = 300;
        max_items_per_check = 10;
        max_posts_per_check = 10;
        feed_request_timeout = 30;
        max_response_bytes = 2097152;
        max_parsed_items = 500;
        feed_user_agent = "MeshCoreBot/1.0 FeedManager";
        feed_rate_limit_seconds = 5.0;
        max_message_length = 130;
        default_output_format = "{emoji} {body|truncate:100} - {date}\n{link|truncate:50}";
        default_message_send_interval_seconds = 2.0;
        shorten_urls = false;
        allow_private_urls = false;
      };
      Feed_Command = {
        enabled = false;
        allow_private_urls = false;
      };
      PacketCapture = {
        enabled = false;
        output_file = "";
        verbose = false;
        debug = false;
        raw_duplicate_window = 2.0;
        rf_data_cache_timeout = 15.0;
        mqtt_enabled = true;
        mqtt_skip_unparseable_packets = true;
        advert_require_valid_signature = false;
        decode_payloads = false;
        include_decoded = false;
        decode_hashtag_channels = [];
        decode_channel_keys = [];
        decode_include_public = true;
        log_rotation = "off";
        log_max_bytes = "50MB";
        log_rotation_when = "midnight";
        log_backup_count = 5;
        neighbors_enabled = false;
        neighbors_interval_hours = 24;
        neighbors_discover_window = 60;
        neighbors_max = 32;
        neighbors_feed_mesh_graph = true;
        neighbors_collect_scopes = false;
        neighbors_command_timeout = 20;
        neighbors_scope_timeout = 0;
        neighbors_scope_min_timeout = 8;
        neighbors_scope_gap = 2.0;
        neighbors_cycle_timeout = 600;
        neighbors_self_scopes = [];
        owner_public_key = "";
        owner_email = "";
        private_key_path = "";
        auth_token_method = "device";
        iata = "XYZ";
        observer_name = "";
        mqtt1_enabled = true;
        mqtt1_server = "mqtt-us-v1.letsmesh.net";
        mqtt1_port = 443;
        mqtt1_transport = "websockets";
        mqtt1_use_tls = true;
        mqtt1_use_auth_token = true;
        mqtt1_token_audience = "mqtt-us-v1.letsmesh.net";
        mqtt1_topic_status = "meshcore/{IATA}/{PUBLIC_KEY}/status";
        mqtt1_topic_packets = "meshcore/{IATA}/{PUBLIC_KEY}/packets";
        mqtt1_websocket_path = "/mqtt";
        mqtt1_client_id = "";
        mqtt1_upload_packet_types = "";
        mqtt2_enabled = true;
        mqtt2_server = "mqtt-eu-v1.letsmesh.net";
        mqtt2_port = 443;
        mqtt2_transport = "websockets";
        mqtt2_use_tls = true;
        mqtt2_use_auth_token = true;
        mqtt2_token_audience = "mqtt-eu-v1.letsmesh.net";
        mqtt2_topic_status = "meshcore/{IATA}/{PUBLIC_KEY}/status";
        mqtt2_topic_packets = "meshcore/{IATA}/{PUBLIC_KEY}/packets";
        mqtt2_websocket_path = "/mqtt";
        mqtt2_client_id = "";
        mqtt2_upload_packet_types = "";
        stats_in_status_enabled = true;
        stats_refresh_interval = 300;
        jwt_ttl_seconds = 86400;
        jwt_renewal_interval = 86400;
        health_check_interval = 30;
        health_check_grace_period = 2;
      };
      MapUploader = {
        enabled = false;
        api_url = "https://map.meshcore.dev/api/v1/uploader/node";
        private_key_path = "";
        min_reupload_interval = 3600;
        verbose = false;
      };
      Weather_Service = {
        enabled = true;
        weather_alarm = "sunrise";
        my_position_lat = 41.97682;
        my_position_lon = -87.90566;
        weather_channel = [ "#weather" ];
        alerts_channel = [ "#weather" ];
        poll_weather_alerts_interval = 600000;
        rain_nowcast_enabled = true;
        poll_rain_nowcast_interval = 900000;
        rain_nowcast_lead_minutes = 60;
        rain_nowcast_renotify_minutes = 30;
        rain_nowcast_cache_seconds = 300;
        blitz_collection_interval = 600000;
      };
      MqttWeather.enabled = false;
      Earthquake_Service = {
        enabled = true;
        poll_interval = 60000;
        time_window_minutes = 10;
        min_magnitude = 3.0;
        minlatitude = 40.0;
        maxlatitude = 45.0;
        minlongitude = -90.0;
        maxlongitude = -85.0;
        send_link = true;
        channel = [
          "#weather"
          "#emergency"
        ];
      };
      Worldcup_Service = {
        enabled = false;
        poll_interval = 60000;
        live_poll_interval = 20000;
        idle_interval = 1800;
        announce_kickoff = true;
        announce_goals = true;
        announce_disallowed = true;
        announce_red_cards = true;
        announce_yellow_cards = false;
        announce_stoppage = true;
        announce_halftime = true;
        announce_fulltime = true;
        silence_mesh_output = false;
        use_fastcast = false;
        api_timeout = 10;
        channel = [
          "#bot"
          "#sports"
        ];
      };
      Rate_Limits = {};
      Webhook = {
        enabled = false;
        host = "127.0.0.1";
        port = 8765;
      };
      RepeaterPrefixCollision_Service = {
        enabled = false;
        notify_on_prefix_bytes = 1;
        heard_window_days = 30;
        prefix_free_days = 30;
        post_process_delay_seconds = 0.5;
        post_process_timeout_seconds = 15.0;
        include_prefix_free_hint = true;
        cooldown_minutes_per_prefix = 60;
        notify_external_on_all_new_repeaters = false;
        silence_mesh_output = false;
        channels = [ "#bot" ];
      };
      DiscordBridge = {
        enabled = false;
        avatar_style = "color";
      };
      TelegramBridge.enabled = false;
      DARC_MoWaS_Service.enabled = false;
    };
  };
}
