
# PlanAhead Launch Script for Post-Synthesis pin planning, created by Project Navigator

create_project -name Leds -dir "D:/JavierJr/Documents/ISD/AgoDic20/ArquitecturaDeComputadoras/Lab/Projects/P09_Leds/Leds/planAhead_run_2" -part xc6slx16csg324-3
set_property design_mode GateLvl [get_property srcset [current_run -impl]]
set_property edif_top_file "D:/JavierJr/Documents/ISD/AgoDic20/ArquitecturaDeComputadoras/Lab/Projects/P09_Leds/Leds/Leds.ngc" [ get_property srcset [ current_run ] ]
add_files -norecurse { {D:/JavierJr/Documents/ISD/AgoDic20/ArquitecturaDeComputadoras/Lab/Projects/P09_Leds/Leds} }
set_param project.pinAheadLayout  yes
set_property target_constrs_file "Leds.ucf" [current_fileset -constrset]
add_files [list {Leds.ucf}] -fileset [get_property constrset [current_run]]
link_design
