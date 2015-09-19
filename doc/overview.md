Data structure:
  root: {hash}
    continuation_end_timestamp: $timestamp
    conversation_state: [array of hashes]
      conversation_id: {hash}
        id: $text
      response_header: {hash}
        status: $text -> ["OK"]
        debug_url: $text -> ""
        request_trace_id: $text
        current_server_time: $timestamp
      conversation_state: {hash}
        conversation_id: {hash}
          id: $text
        conversation: {hash}
          id: {hash}
            id: $text
          type: $text -> ["STICKY_ONE_TO_ONE", "GROUP"]
          self_conversation_state: {hash}
            self_read_state: {hash}
              participant_id: {hash}
                gaia_id: $number -> external g+ number
                chat_id $number -> private
              latest_read_timestamp: $timestamp
            status: $text -> ["ACTIVE"]
            notification_level: $text -> ["RING", "QUIET"]
            view: $text -> ["INBOX_VIEW", "ARCHIEVED_VIEW"]
            inviter_id: {hash}
              gaia_id: $number -> external g+ number
              chat_id $number -> private
            invite_timestamp: $timestamp
            sort_timestamp: $timestamp
            active_timestamp: $timestamp
            delivery_medium_option: [array of hashes]
              delivery_medium: {hash}
                medium_type: $text -> ["BABEL_MEDIUM"]
              current_default: $bool
          read_state: [array of hashes]
            participant_id: {hash}
              gaia_id: $number -> external g+ number
              chat_id $number -> private
            last_read_timestamp: $timestamp -> zero?
          has_active_hangout: $bool
          otr_status: $text -> ["ON_THE_RECORD"]
          otr_toggle: $text -> ["ENABLED"]
          current_participant: [arary of hashes]
            gaia_id: $number -> external g+ number
            chat_id $number -> private
          participant_data: [array of hashes]
            id: {hash}
              gaia_id: $number -> external g+ number
              chat_id $number -> private
            fallback_name: $text
            invitation_status: $text -> ["ACCEPTED_INVITATION", "PENDING_INVITATION"]
            participant_type: $text -> ["GAIA"]
            new_invitation_status: $text -> ["ACCEPTED_INVITATION", "PENDING_INVITATION"]
          fork_on_external_invite: $bool
          network_type: $text -> ["BABEL"]
          force_history_state: $text -> ["FORCE_HISTORY_UNKNOWN", "NO_FORCE"]
        event: [array of hashes]
          conversation_id: {hash}
            id: $text
          sender_id: {hash}
            gaia_id: $number -> external g+ number
            chat_id $number -> private
          timestamp: $timestamp
          self_event_state: {hash}
            user_id: {hash}
              gaia_id: $number -> external g+ number
              chat_id $number -> private
            client_generated_id: $text
            notification_level: $text -> ["RING", "QUIET"]
          chat_message: {hash}
            message_content: {hash}
              segment: [array of hashes]
                type: $text -> ["TEXT", "LINE_BREAK", "LINK"]
                text: $text
          event_id: $text
          advances_sort_timestamp: $bool
          event_otr: $text -> "ON_THE_RECORD"
          delivery_medium: {hash}
            medium_type: $text -> ["BABEL_MEDIUM"]
          event_type: $text -> ["REGULAR_CHAT_MESSAGE", "ADD_USER", "HANGOUT_EVENT", "REMOVE_USER"]
          event_version: $timestamp
