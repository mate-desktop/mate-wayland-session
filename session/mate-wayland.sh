#!/bin/sh



create_initial_config()
    {
    mkdir -p /home/luke/.config/mate

    #Find any existing wayfire.ini file
    if [ -e  /home/$USER/.config/wayfire.ini ]; then
        #User has configured wayfire, use their file and existing customizations
        cp /home/$USER/.config/wayfire.ini /home/$USER/.config/mate/wayfire.ini
    else
        #User has not configured wayfire. Look for the default .ini file where the package manager put it 
        cp /usr/share/doc/wayfire/examples/wayfire.ini /home/$USER/.config/mate/wayfire.ini
    fi

    #Add mate-wayland-components.sh to wayfire startup programs
    grep "mate-wayland-components" /home/$USER/.config/mate/wayfire.ini

    if [ $? -ne 0  ]; then
        sed -i '/autostart]/a mate = mate-wayland-components.sh' /home/$USER/.config/mate/wayfire.ini
        #do not start wayfire's default shell if installed
        sed -i 's/autostart_wf_shell = true.*/autostart_wf_shell = false/' /home/$USER/.config/mate/wayfire.ini
    fi

    return 0
    }

add_mate_components()

    {
    if [ -e  /home/$USER/.config/mate/wayfire.ini ]; then
        #If we have already configured wayfire for MATE we are good to go
        return 0
    else
        #create ~/config/mate/wayfire.ini and include mate components in it
        create_initial_config
    return 0
    fi
    }

add_mate_components

#Start the compositor
wayfire -c /home/$USER/.config/mate/wayfire.ini

