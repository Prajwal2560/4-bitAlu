# SP701 Constraints (xc7s100fgga484-2)

# CONFIG (required for SP701)
set_property BITSTREAM.CONFIG.SPI_BUSWIDTH 4 [current_design]
set_property CONFIG_VOLTAGE 3.3 [current_design]
set_property CFGBVS VCCO [current_design]

# Allow bitstream without specific pins assigned
set_property SEVERITY {Warning} [get_drc_checks UCIO-1]

# IOSTANDARD
set_property IOSTANDARD LVCMOS33 [get_ports *]