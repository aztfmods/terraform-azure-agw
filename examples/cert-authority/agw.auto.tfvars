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
      issuer    = "DigiCert"
    }
    app2 = {
      hostname  = "app2.com"
      bepoolips = []
      priority  = "20000"
      subject   = "cn=app2.pilot.org"
      issuer    = "DigiCert"
    }
  }
}
