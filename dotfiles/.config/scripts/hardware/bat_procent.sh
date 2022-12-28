Charging_status() {
  bat_proc_acpi_charging_status=`acpi | grep "Battery 0" | awk '{print $3}'| sed 's/[^a-zA-Z0-9%]//g'`

  bat_proc_acpi_bat_status=`acpi | grep "Battery 0" | awk '{print $3}' | sed 's/[^a-zA-Z0-9%]//g'`
  bat_proc_acpi_percent=`acpi | grep "Battery 0" | awk '{print $4}' | sed 's/[^a-zA-Z0-9%]//g'`
  bat_proc_acpi_remaining=`acpi | grep "Battery 0" | awk '{print $5" "$6" "$7}'`

  if [[ $bat_proc_acpi_charging_status = 'Discharging' ]]; then
    echo $bat_proc_acpi_percent $bat_proc_acpi_bat_status $bat_proc_acpi_remaining
  elif [[ $bat_proc_acpi_charging_status = 'Full' ]]; then
    echo $bat_proc_acpi_percent $bat_proc_acpi_bat_status
  else
    echo $bat_proc_acpi_percent $bat_proc_acpi_bat_status $bat_proc_acpi_remaining
  fi 
}

Charging_status
