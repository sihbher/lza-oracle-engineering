variable "database_server_count" {
  description = "The number of database servers"
  default     = 1
}

variable "vm_name" {
  description = "The name of the Oracle VM"
}

# variable "resource_group" {
#   description = "Details of the resource group"
#   default     = {}
# }


variable "created_resource_group_name"{
  description = "Created resource group name"
}

variable "location" {
  description = "The location of the resource"
  
}



variable "database" {
  description = "Details of the database node"
  default = {
    use_DHCP = true
    authentication = {
      type = "key"
    }
  }
}

# variable "nic_id" {
#   description = "value of the nic id"
# }

variable "subscription_id" {
  description = "Subscription ID"
}

variable "assign_subscription_permissions" {
  description = "Assign permissions on the subscription"
  type        = bool
}

variable "aad_system_assigned_identity" {
  description = "AAD system assigned identity"
  type        = bool
}

variable "skip_service_principal_aad_check" {
  description = "If the principal_id is a newly provisioned `Service Principal` set this value to true to skip the Azure Active Directory check which may fail due to replication lag."
  default     = true
}

variable "storage_account_id" {
  description = "Storage account ID used for diagnostics"
  type        = string
  default     = null
}

variable "storage_account_sas_token" {
  description = "Storage account SAS token used for diagnostics"
  type        = string
  default     = null
}

variable "log_analytics_workspace_id" {
  description = "Log Analytics workspace ID"
  type        = string
  default     = null
}

variable "eventhub_authorization_rule_id" {
  description = "ID of an Event Hub authorization rule"
  type        = string
  default     = null
}

variable "partner_solution_id" {
  description = "Value of the partner solution ID"
  default     = null
}

variable "is_diagnostic_settings_enabled" {
  description = "Whether diagnostic settings are enabled"
  default     = false
}

variable "diagnostic_target" {
  description = "The destination type of the diagnostic settings"
  default     = "Log_Analytics_Workspace"
  validation {
    condition     = contains(["Log_Analytics_Workspace", "Storage_Account", "Event_Hubs", "Partner_Solutions"], var.diagnostic_target)
    error_message = "Allowed values are Log_Analytics_Workspace, Storage_Account, Event_Hubs, Partner_Solutions"
  }
}

variable "role_assignments" {
  description = "Role assignments"
  default     = {}
}

variable "vm_locks" {
  type = object({
    name = optional(string, "")
    type = optional(string, "CanNotDelete")
  })
  default = {}
  validation {
    condition     = contains(["CanNotDelete", "ReadOnly"], var.vm_locks.type)
    error_message = "Lock type must be one of: CanNotDelete, ReadOnly."
  }
}
variable "tags" {
  description = "Tags to be added to the resources"
  default     = {}
}

variable "vm_sku" {
  description = "The SKU of the virtual machine"
  default     = "Standard_D4s_v3"
}

variable "vm_source_image_reference" {
  description = "The source image reference of the virtual machine"
  default = {
    publisher = "Oracle"
    offer     = "Oracle-Linux"
    sku       = "79-gen2"
    version   = "7.9.36"
  }
}

variable "vm_os_disk" {
  description = "Details of the OS disk"
  default = {
    name                   = "osdisk"
    caching                = "ReadWrite"
    storage_account_type   = "Premium_LRS"
    disk_encryption_set_id = null
    disk_size_gb           = 128
  }
}

variable "availability_zone" {
  description = "The availability zones of the resource"
  default     = null
}


variable "enable_telemetry" {
  type        = bool
  default     = false
  description = <<DESCRIPTION
This variable controls whether or not telemetry is enabled for the module.
For more information see https://aka.ms/avm/telemetryinfo.
If it is set to false, then no telemetry will be collected.
DESCRIPTION
}


variable "is_data_guard" {
  description = "Whether Data Guard is enabled"
  default     = false
}


###Variables for creating NICs
variable "use_secondary_ips" {
  description = "Defines if secondary IPs are used for the SAP Systems virtual machines"
  default     = false
}

variable "database_nic_ips" {
  description = "If provided, the database tier virtual machines will be configured using the specified IPs"
  default     = [""]
}

variable "database_nic_secondary_ips" {
  description = "If provided, the database tier virtual machines will be configured using the specified IPs as secondary IPs"
  default     = [""]
}

variable "db_subnet" {
  description = "Details of the database subnet"
  default     = {}
}

variable "deployer"{ 
  description = "Details of the deployer"
  default     = {}
}

variable "key_vault_id" {
  description = "The ID of the key vault"
  default     = null
  
}

variable "sid_username" {
  description = "SDU username"
}

variable "public_key" {
  description = "Public key used for authentication in ssh-rsa format"
}
