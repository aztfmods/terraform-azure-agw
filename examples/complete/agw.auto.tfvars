agw = {
  config = {
    waf = {
      enable = true
      mode   = "Prevention"
    }
    capacity = {
      min = 1, max = 2
    }
  }

  applications = {
    # application app1
    app1 = {
      hostname  = "app1.com"
      bepoolips = []
      priority  = "10000"
      subject   = "cn=app1.pilot.org"
      issuer    = "self"
      rewrite_rule_sets = {
        set1 = {
          rules = {
            http_to_https_redirect = {
              rewriterulename     = "http_to_https_redirect"
              rewriterulesequence = 100
              conditions = {
                condition1 = {
                  variable = "var_request_uri"
                  pattern  = "HTTP"
                }
              }
              urls = {
                url1 = {
                  path         = "/api/health"
                  query_string = "verbose=true"
                }
              }
            }
            add_custom_request_header = {
              rewriterulename     = "add_custom_request_header"
              rewriterulesequence = 200
              request_header_configurations = {
                header1 = {
                  header_name  = "X-Custom-Header"
                  header_value = "CustomValue"
                }
              }
            }
            add_custom_response_header = {
              rewriterulename     = "add_custom_response_header"
              rewriterulesequence = 300
              response_header_configurations = {
                header1 = {
                  header_name  = "Strict-Transport-Security"
                  header_value = "max-age=31536000"
                }
              }
            }
            modify_request_url = {
              rewriterulename     = "modify_request_url"
              rewriterulesequence = 400
              conditions = {
                condition1 = {
                  variable = "var_request_uri"
                  pattern  = "/oldpath"
                }
              }
              urls = {
                url1 = {
                  path = "/newpath"
                }
              }
            }
          }
        }
      }
    }
    # application app2
    app2 = {
      hostname  = "app2.com"
      bepoolips = []
      priority  = "20000"
      subject   = "cn=app2.pilot.org"
      issuer    = "self"
    }
  }
}
