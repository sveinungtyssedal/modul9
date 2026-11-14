mock_provider "azurerm" {} # simulert provider – ingen Azure

variables { # felles input for alle run-blokkene
  project             = "tim84-iac"
  location            = "norwayeast"
  resource_group_name = "tim84-iac-dev-rg"
}

run "subnettet_har_riktig_cidr" {
  command = plan

  assert {
    condition     = azurerm_subnet.this.address_prefixes[0] == "10.0.0.1/24"
    error_message = "Subnettet skal ha CIDR 10.0.1.0/24."
  }
}

run "ugyldig_project_avvises" {
  command = plan

  variables {
    project = "Tim84 IAC" # store bokstaver og mellomrom
  }

  expect_failures = [var.project] # testen består når valideringen slår til
}