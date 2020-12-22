#!/bin/python


import optparse
import os
import subprocess


# Found code snippet online for char_range
# Closed browser before I got URL...If I find, will update this!
def char_range(c1, c2):
    """Generates the characters from `c1` to `c2`, inclusive."""
    for c in xrange(ord(c1), ord(c2)+1):
        yield chr(c)
def disk_counter(disk_letter):
    """Function to convert between disk letters and their corresponding alphabet position.
    For example, /dev/sda -> disk 00

    Also, for the first 10 numbers {0,9}, we pad a leading 0 so that everything is two
    digits.
    """
    #ASCII_OFFSET = 96      # ASCII Offset to get a=1, but we want our first mounted disk to be 00 (so b=0)
                            # since /dev/sda = boot drive

    ASCII_OFFSET = 98
    disk_number = ord(disk_letter)-ASCII_OFFSET

    if disk_number < 10:
        full_disk_number = "0" + str(disk_number)
    else:
        full_disk_number = str(disk_number)

    return full_disk_number
def check_fstab(device_id):
    """Check /etc/fstab for string entry"""


    # Found code snippet online (closed browser before I got URL)...if I find, will update this!
    fstab_file = file('/etc/fstab')
    found = False
    for line in fstab_file:
        if device_id in line:
            return True
    return False
def format_drive(linux_device_file, linux_partition_file):
    mkfs_options = " "

    print linux_partition_file


    if options.format_disks is True:

        if options.mkfs_fs == "xfs":
            if options.verbosity > 0:
                print "setting force options for xfs formatting"
            mkfs_options = " -f"


        if not os.path.exists(linux_partition_file):
            if options.verbosity > 0:
                print "[ " + linux_device_file + " ] Creating parition on " + linux_device_file

            # Attempted to use this, but didn't work..Keeping here for possible future use.
            # subprocess.check_call(['parted', disk_file, '--script -- mklabel gpt mkpart primary 0% 100%'])
            os.system("parted " + linux_device_file + " --script -- mklabel gpt mkpart primary 0% 100%")

        if (os.system("file -sL " + linux_device_file + "* | grep -i " + options.mkfs_fs + " 1>/dev/null")) is not 0:
            if options.verbosity > 0:
                print "[ " + linux_device_file + " ] Disk has not been formatted...formatting " + options.mkfs_fs
            os.system("mkfs." + options.mkfs_fs + " " + linux_partition_file + " " + mkfs_options)

            if options.verbosity > 0:
                print "[ " + linux_device_file + " ] done"
    else:
        print "[ " + linux_device_file + " ] did not set option to format disks.  NO PARTITIONING or FORMATTING occured!"
def check_mount_point(mount_point):
    if os.path.exists(mount_point):
        if options.verbosity > 0:
            print mount_point + " does exist"
    else:
        if options.verbosity > 0:
            print mount_point + " does not exist"
        os.system("mkdir -p " + mount_point)
def mount_volumes():
    os.system("mount -a")



###########
#
# had more ideas for the option parsing, but not going to implement at present.
# for now, just run with -a (default) to check all drives and -v if you want to see more of what's going on
#
###########

parser = optparse.OptionParser()
parser.add_option('-a',
                  help="Runs in automatic mode (default)",
                  action="store_true",
                  default=False,
                  dest="auto_run")
parser.add_option('-s',
                  help="Starting disk letter.  Default is 'b'",
                  default='b',
                  dest="start_disk")
parser.add_option('-e',
                  help="Specify ending disk letter.  Default is 'z'",
                  default='z',
                  dest="end_disk")
parser.add_option('-f',
                  help="specify filesystem.  Default is xfs.  Valid values are:  xfs, ext3, ext4",
                  default='xfs',
                  dest="mkfs_fs")
parser.add_option('-F',
                  help="Format drives.  If set will format drives if not (or wrongly) formatted.  By default this is FALSE",
                  default=False,
                  action="store_true",
                  dest="format_disks")
parser.add_option('-r',
                  help="Run program.  This will loop through and do everything except formatting, see above.",
                  default=False,
                  action="store_true",
                  dest="run_program")
parser.add_option('-v',
                  action="count",
                  default=0,
                  dest="verbosity")
parser.add_option('-t',
                  action="store_true",
                  default=False,
                  dest="test_mode")
parser.add_option('-m',
                  action="store_true",
                  default=False,
                  dest="mount_volumes")


options, remainder = parser.parse_args()

parser.parse_args()


if __name__ == '__main__':
    if options.test_mode is True:
        print "*** TEST MODE ACTIVATED ***"
        exit(0)

    if options.auto_run is True:
        options.start_disk = 'b'
        options.end_disk = 'z'
        options.mkfs_fs = "xfs"
        options.run_program = True
        options.mount_volumes = True

    if options.run_program is True:
        for disk_letter in char_range(options.start_disk, options.end_disk):
            linux_device_file = "/dev/sd" + disk_letter
            linux_partition_file = linux_device_file + "1"


            # Checking if disk exists
            if os.path.exists(linux_device_file):
                if options.verbosity > 0:
                    print linux_device_file + " is a valid disk"


                # Check if partitioned and formatted
                format_drive(linux_device_file,linux_partition_file)

                # Check if mount point created
                check_mount_point("/data/" + disk_counter(disk_letter))

                # Check if in /etc/fstab
                if check_fstab(linux_partition_file):
                    if options.verbosity > 0:
                        print "found " + linux_device_file + " in /etc/fstab, no need to update!"
                else:
                    if options.verbosity > 0:
                        print "did not find " + linux_device_file + "1" + " in /etc/fstab; updating!"
                    with open("/etc/fstab", "a") as myfile:
                        myfile.write(linux_device_file + "1\t/data/" + disk_counter(disk_letter) + "\tauto\tdefaults,noatime,nodiratime\t0\t0\n")

        if options.mount_volumes is True:
            if options.verbosity > 0:
                print "auto-mounting volumes..."
            mount_volumes()

                # Done.
    else:
        print "Error:  Run was not specified.  Please see help (--help)"