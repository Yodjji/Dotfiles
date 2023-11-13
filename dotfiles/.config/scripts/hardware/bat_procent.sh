Charging_status() {
  bat_proc_acpi_percent=`acpi | grep "Battery 0" | awk '{print $4}' | sed 's/[^a-zA-Z0-9%]//g'`
  bat_proc_acpi_charging_status=`acpi | grep "Battery 0" | awk '{print $3}'| sed 's/[^a-zA-Z0-9%]//g'`

  if [[ $bat_proc_acpi_charging_status == "Charging" ]]; then
    echo $bat_proc_acpi_percent "+"
  elif [[ $bat_proc_acpi_charging_status == "Discharging" ]]; then
    echo $bat_proc_acpi_percent "-"
  else
    echo $bat_proc_acpi_percent
  fi
}

Charging_status
