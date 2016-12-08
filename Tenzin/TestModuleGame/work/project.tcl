set projDir "C:/Users/HanWei/Dropbox/SUTDNotes/ISTD1/CompStruct/WoofComputerStructures/Tenzin/TestModuleGame/work/planAhead"
set projName "TestModuleGame"
set topName top
set device xc6slx9-2tqg144
if {[file exists "$projDir/$projName"]} { file delete -force "$projDir/$projName" }
create_project $projName "$projDir/$projName" -part $device
set_property design_mode RTL [get_filesets sources_1]
set verilogSources [list "C:/Users/HanWei/Dropbox/SUTDNotes/ISTD1/CompStruct/WoofComputerStructures/Tenzin/TestModuleGame/work/verilog/mojo_top_0.v" "C:/Users/HanWei/Dropbox/SUTDNotes/ISTD1/CompStruct/WoofComputerStructures/Tenzin/TestModuleGame/work/verilog/reset_conditioner_1.v" "C:/Users/HanWei/Dropbox/SUTDNotes/ISTD1/CompStruct/WoofComputerStructures/Tenzin/TestModuleGame/work/verilog/controller_2.v" "C:/Users/HanWei/Dropbox/SUTDNotes/ISTD1/CompStruct/WoofComputerStructures/Tenzin/TestModuleGame/work/verilog/move_3.v" "C:/Users/HanWei/Dropbox/SUTDNotes/ISTD1/CompStruct/WoofComputerStructures/Tenzin/TestModuleGame/work/verilog/map_4.v" "C:/Users/HanWei/Dropbox/SUTDNotes/ISTD1/CompStruct/WoofComputerStructures/Tenzin/TestModuleGame/work/verilog/convertToDisplay_5.v" "C:/Users/HanWei/Dropbox/SUTDNotes/ISTD1/CompStruct/WoofComputerStructures/Tenzin/TestModuleGame/work/verilog/checkWin_6.v" "C:/Users/HanWei/Dropbox/SUTDNotes/ISTD1/CompStruct/WoofComputerStructures/Tenzin/TestModuleGame/work/verilog/toDisplay_7.v" "C:/Users/HanWei/Dropbox/SUTDNotes/ISTD1/CompStruct/WoofComputerStructures/Tenzin/TestModuleGame/work/verilog/collision_8.v" "C:/Users/HanWei/Dropbox/SUTDNotes/ISTD1/CompStruct/WoofComputerStructures/Tenzin/TestModuleGame/work/verilog/checkUpDown_9.v" "C:/Users/HanWei/Dropbox/SUTDNotes/ISTD1/CompStruct/WoofComputerStructures/Tenzin/TestModuleGame/work/verilog/checkLeftRight_10.v"]
import_files -fileset [get_filesets sources_1] -force -norecurse $verilogSources
set ucfSources [list "C:/Users/HanWei/Dropbox/SUTDNotes/ISTD1/CompStruct/WoofComputerStructures/Tenzin/TestModuleGame/constraint/matrix.ucf" "C:/Program\ Files/Mojo\ IDE/library/components/io_shield.ucf" "C:/Program\ Files/Mojo\ IDE/library/components/mojo.ucf"]
import_files -fileset [get_filesets constrs_1] -force -norecurse $ucfSources
set_property -name {steps.bitgen.args.More Options} -value {-g Binary:Yes -g Compress} -objects [get_runs impl_1]
set_property steps.map.args.mt on [get_runs impl_1]
set_property steps.map.args.pr b [get_runs impl_1]
set_property steps.par.args.mt on [get_runs impl_1]
update_compile_order -fileset sources_1
launch_runs -runs synth_1
wait_on_run synth_1
launch_runs -runs impl_1
wait_on_run impl_1
launch_runs impl_1 -to_step Bitgen
wait_on_run impl_1
