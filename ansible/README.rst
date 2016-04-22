Ansible configuration for developer environment
==============================================

.. _directory_layout:

Directory Layout
````````````````

The top level of the directory would contain files and directories like so::

    production                # inventory file for production servers
    staging                   # inventory file for staging environment 

    group_vars/
       group1                 # here we assign variables to particular groups
       group2                 # ""
    host_vars/
       hostname1              # if systems need specific variables, put them here
       hostname2              # ""

    library/                  # if any custom modules, put them here (optional)
    filter_plugins/           # if any custom filter plugins, put them here (optional)

    site.yml                  # master playbook
    webservers.yml            # playbook for webserver tier
    dbservers.yml             # playbook for dbserver tier

    roles/
        common/               # this hierarchy represents a "role"
            tasks/            #
                main.yml      #  <-- tasks file can include smaller files if warranted
            handlers/         # 
                main.yml      #  <-- handlers file
            templates/        #  <-- files for use with the template resource
                ntp.conf.j2   #  <------- templates end in .j2
            files/            #
                bar.txt       #  <-- files for use with the copy resource
                foo.sh        #  <-- script files for use with the script resource
            vars/             #
                main.yml      #  <-- variables associated with this role
            defaults/         #
                main.yml      #  <-- default lower priority variables for this role
            meta/             #
                main.yml      #  <-- role dependencies

        webtier/              # same kind of structure as "common" was above, done for the webtier role
        monitoring/           # ""
        fooapp/               # "" 
