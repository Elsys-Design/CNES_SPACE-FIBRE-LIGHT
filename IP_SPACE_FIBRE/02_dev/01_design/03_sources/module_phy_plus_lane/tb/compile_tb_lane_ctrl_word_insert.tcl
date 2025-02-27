
echo "############# Create Libraries #############"
vlib phy_plus_lane_lib
echo "############# End create Libraries #############"

echo "############# Start compile Libraries #############"

echo "############# End compile Libraries #############"


echo "############# Start compile DESIGN #############"
vcom     -work phy_plus_lane_lib  ../../../04_packages/pkg_phy_plus_lane.vhd
vcom     -work phy_plus_lane_lib  ../lane_ctrl_word_insert.vhd
echo "############# End compile DESIGN #############"

echo "############# Start compile TB #############"
vcom     -work phy_plus_lane_lib  tb_lane_ctrl_word_insert.vhd
echo "############# End compile TB #############"