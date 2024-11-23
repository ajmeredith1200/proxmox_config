terraform {
    required_providers {
      proxmox = {
        source  = "telmate/proxmox"
        version = "3.0.1-rc4"
      }
    }
  }

provider "proxmox" {
    pm_api_url    = "https://192.168.0.19:8006/api2/json"
    pm_debug      = true
    pm_log_enable = true
    pm_log_file   = "terraform-plugin-proxmox.log"
    pm_log_levels = {
      _default    = "debug"
      _capturelog = ""
    }
  }

  resource "proxmox_vm_qemu" "ubuntu-server" {
      name        = "ubuntu-server"
      target_node = "proxmox"

      disks {
        ide {
          ide2 {
            cdrom {
              iso = "ubuntu-24.04.1-live-server-amd64.iso"
            }
          }
        }
      }
    }