Stackalytics
============

Application Features
--------------------
Stackalytics is a service that automatically analyzes OpenStack
development activities and displays statistics on contribution. The features are:
 * Extraction of author information from git log, store it in the database;
 * Calculate metrics on number of lines changed (LOC) and commits;
 * Mapping authors to companies and launchpad ids;
 * Filter statistics by time, modules, companies, authors;
 * Extract blueprint and bug ids from commit messages;
 * Auto-update of database.

Docker version
--------------

This is a Docker version (forked by Łukasz Gryglicki lukaszgryglicki@o2.pl)
You need to provide Your own private SSH key in etc/id_rsa to allow gerrit communication.
This file must be recognized by gerrit - follow documentation how to upload Your SSH public key.
You need to paste Your public key in gerrit web interface, and also set correct username
in both web interface and etc/stackalytics.conf (ssh_username)

Run with Docker
---------------

1. To use Docker You need to build docker image (because there is no SSH key and SSH user name in `https://hub.docker.com/r/lukaszgryglicki/stackalytics/`
2. Set SSH username (ssh_username) in `etc/stackalytics.conf`, also make sure You uploaded Your public SSH key (`~/.ssh/id_rsa.pub`) to gerrit we interface
3. Put Your private SSH key (`~/.ssh/id_rsa`) in `etc/` (this image has no SSH keys, they're also skipped in git `.gitignore` and `.dockerignore`)
4. Run `./docker_build.sh` to build Your own image (You will need to adjust docker usernames etc.)
5. Take a look at all scripts starting with `docker_` (examine them before running to change docker user name etc).
6. When docker image is build, start `./docker_server.sh`
7. Start `./docker_ssh.sh`: user name is "stackalytics", password is "stackalytics"
8. Once logged in, try: `sudo bash` (use "stackalytics" password) and `cd /stackalytics`
9. To run analysis `./run_processor.sh`, to run dashboard: `./run_dashboard.sh`
10. Go to `localhost:18080 in Your browser` or use Your domain name or external IP (if You have one) instead of local host

Quickstart
----------

To run Stackalytics, you first need to create two kind of configuration files.
The one is default_data.json which shows which sources(git repo, ml, etc.) need
to be analyzed. Another is stackalytics.conf which shows basic configuration like
HTTP listening host and port, etc. Stackalytics repository contains the default
files of these configuration under etc/ directory. It would be useful to copy and
change them as you like.

#. You need to install Stackalytics. This is done with pip after you check out
   Stackalytics repository::

    $ git clone https://git.openstack.org/openstack/stackalytics
    $ cd stackalytics
    $ sudo pip install -r requirements.txt
    $ sudo python setup.py install

#. Install and run memcached DB::

    $ sudo apt-get install -y memcached
    $ memcached -u memcache -d

#. Analyze data which are specifed on default_data.json and store the data into memcached DB::

    $ stackalytics-processor

#. Start HTTP server of Stackalytics::

    $ stackalytics-dashboard

#. Users can access Stackalytics site on http://127.0.0.1:8080 as the default.


Project Info
------------

 * Web-site: http://stackalytics.com/
 * Source Code: https://git.openstack.org/cgit/openstack/stackalytics
 * Wiki: https://wiki.openstack.org/wiki/Stackalytics
 * Launchpad: https://launchpad.net/stackalytics
 * Blueprints: https://blueprints.launchpad.net/stackalytics
 * Bugs: https://bugs.launchpad.net/stackalytics
 * Code Reviews: https://review.openstack.org/#q,status:open+project:openstack/stackalytics,n,z
 * IRC: #openstack-stackalytics at freenode
