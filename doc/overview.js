x = {
  name: "root",
  description: "{hash}",
  children: [
    {
      name: "continuation_end_timestamp",
      decription: "$timestamp"
    }, 
    {
      name: "conversation_state",
      description: "[array of hashes]",
      children: [
        {
          name: "conversation_id",
          description: "{hash}",
          children: [
            {
              name: "id",
              description: "$text"
            }
          ]
        },
        {
          name: "response_header",
          description: "{hash}",
          children: [
            {
              name: "status",
              description: '$text -> ["OK"]'
            },
            {
              name: "debug_url",
              description: '$text -> ""'
            },
            {
              name: "request_trace_id",
              description: "$text"
            },
            {
              name: "current_server_time",
              description: "$timestamp"
            }
          ]
        }, 
        {
          name: "conversation_state",
          description: "{hash}",
          children: [
            {
              name: "conversation_id",
              description: "{hash}",
              children: [
                {
                  name: "id",
                  description: "$text"
                }
              ]
            }, 
            {
              name: "conversation",
              description: "{hash}",
              children: [
                {
                  name: "id",
                  description: "{hash}",
                  children: [
                    {
                      name: "id",
                      description: "$text"
                    }
                  ]
                }, 
                {
                  name: "type",
                  description: '$text -> ["STICKY_ONE_TO_ONE", "GROUP"]'
                },
                {
                  name: "self_conversation_state",
                  description: "{hash}",
                  children: [
                    {
                      name: "self_read_state", 
                      description: '{hash}', 
                      children: [
                        {
                          name: "participant_id", 
                          description: '{hash}', 
                          children: [
                            {
                              name: "gaia_id", 
                              description: '$number -> external g+ number'
                            },
                            {
                              name: "chat_id", 
                              desccription: '$number -> private'
                            }
                          ]
                        },
                        {
                          name: "latest_read_timestamp", 
                          description: '$timestamp'
                        }
                      ]
                    },
                    {
                      name: "status", 
                      description: '$text -> ["ACTIVE"]'
                    },
                    {
                      name: "notification_level", 
                      description: '$text -> ["RING", "QUIET"]'
                    },
                    {
                      name: "view", 
                      description: '$text -> ["INBOX_VIEW", "ARCHIEVED_VIEW"]'
                    },
                    {
                      name: "inviter_id", 
                      description: '{hash}',
                      children: [
                        {
                          name: "gaia_id", 
                          description: '$number -> external g+ number'
                        },
                        {
                          name: "chat_id", 
                          description: '$number -> private'
                        }
                      ]
                    },
                    {
                      name: "invite_timestamp", 
                      description: '$timestamp'
                    },
                    {
                      name: "sort_timestamp", 
                      description: '$timestamp'
                    },
                    {
                      name: "active_timestamp", 
                      description: '$timestamp'
                    },
                    {
                      name: "delivery_medium_option",
                      description: '[array of hashes]',
                      children: [
                        {
                          name: "delivery_medium", 
                          description: '{hash}',
                          children: [
                            {
                              name: "medium_type", 
                              description: '$text -> ["BABEL_MEDIUM"]'
                            }
                          ]
                        },
                        {
                          name: "current_default",
                          description: '$bool' 
                        }
                      ]
                    }
                  ]
                },
                {
                  name: "read_state", 
                  description: '[array of hashes]', 
                  children: [
                    {
                      name: "participant_id", 
                      description: '{hash}', 
                      children: [
                        {
                          name: "gaia_id", 
                          description: '$number -> external g+ number'
                        },
                        {
                          name: "chat_id", 
                          description: '$number -> private'
                        }
                      ]
                    },
                    {
                      name: "last_read_timestamp", 
                      description: '$timestamp -> zero?'
                    }
                  ]
                },
                {
                  name: "has_active_hangout", 
                  description: '$bool'
                },
                {
                  name: "otr_status", 
                  description: '$text -> ["ON_THE_RECORD"]'
                },
                {
                  name: "otr_toggle", 
                  description: '$text -> ["ENABLED"]'
                },
                {
                name: "current_participant", description: '[arary of hashes]', 
                  children: [
                    {
                      name: "gaia_id", 
                      description: '$number -> external g+ number'
                    },
                    {
                      name: "chat_id", 
                      description: '$number -> private'
                    }
                  ]
                },
                {
                  name: "participant_data", 
                  description: '[array of hashes]',
                  children: [
                    {
                      name: "id", description: '{hash}',
                      children: [
                        {
                          name: "gaia_id", 
                          description: '$number -> external g+ number'
                        },
                        {
                          name: "chat_id", 
                          description: '$number -> private'
                        }
                      ]
                    },
                    {
                      name: "fallback_name", 
                      description: '$text'
                    },
                    {
                      name: "invitation_status", 
                      description: '$text -> ["ACCEPTED_INVITATION", "PENDING_INVITATION"]'
                    },
                    {
                      name: "participant_type", 
                      description: '$text -> ["GAIA"]'
                    },
                    {
                      name: "new_invitation_status", 
                      description: '$text -> ["ACCEPTED_INVITATION", "PENDING_INVITATION"]'
                    }
                  ]
                },
                {
                  name: "fork_on_external_invite", 
                  description: '$bool'
                },
                {
                  name: "network_type", 
                  description: '$text -> ["BABEL"]'
                },
                {
                  name: "force_history_state", 
                  description: '$text -> ["FORCE_HISTORY_UNKNOWN", "NO_FORCE"]'
                }
              ]
            },
            {
              name: "event",
              description: "[array of hashes]",
              children: [
                {
                  name: "conversation_id", 
                  description: '{hash}', 
                  children: [
                    {
                      name: "id", 
                      description: '$text'
                    }
                  ]
                },
                {
                  name: "sender_id", 
                  description: '{hash}',
                  children: [
                    {
                      name: "gaia_id", 
                      description: '$number -> external g+ number'
                    },
                    {
                      name: "chat_id", 
                      description: '$number -> private'
                    }
                  ]
                },
                {
                  name: "timestamp", 
                  description: '$timestamp'
                },
                {
                  name: "self_event_state", 
                  description: '{hash}', 
                  children: [
                    {
                      name: "user_id", 
                      description: '{hash}', 
                      children: [
                        {
                          name: "gaia_id", 
                          description: '$number -> external g+ number'
                        },
                        {
                          name: "chat_id", 
                          description: '$number -> private'
                        }
                      ]
                    },
                    {
                      name: "client_generated_id", 
                      description: '$text'
                    },
                    {
                      name: "notification_level", 
                      description: '$text -> ["RING", "QUIET"]'
                    }
                  ]
                },
                {
                  name: "chat_message", 
                  description: '{hash}', 
                  children: [
                    {
                      name: "message_content", 
                      description: '{hash}', 
                      children: [
                        {
                          name: "segment", 
                          description: '[array of hashes]',
                          children: [
                            {
                              name: "type", 
                              description: '$text -> ["TEXT", "LINE_BREAK", "LINK"]'
                            },
                            {
                              name: "text", 
                              description: '$text'
                            }
                          ]
                        }
                      ]
                    }
                  ]
                },
                {
                  name: "event_id", 
                  description: '$text'
                },
                {
                  name: "advances_sort_timestamp", 
                  description: '$bool'
                },
                {
                  name: "event_otr", 
                  description: '$text -> "ON_THE_RECORD"'
                },
                {
                  name: "delivery_medium", 
                  description: '{hash}', 
                  children: [
                    {
                      name: "medium_type", 
                      description: '$text -> ["BABEL_MEDIUM"]'
                    }
                  ]
                },
                {
                  name: "event_type", 
                  description: '$text -> ["REGULAR_CHAT_MESSAGE", "ADD_USER", "HANGOUT_EVENT", "REMOVE_USER"]'
                },
                {
                  name: "event_version", 
                  description: '$timestamp'
                }
              ]
            }
          ]
        }
      ]
    }
  ]
}