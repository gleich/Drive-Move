import argparse
import os
from platform import system


def get_drives():
    if system() == "Linux":
        pass
    elif system() == "Darwin":
        volumes = os.listdir("/Volumes")
        ignored_volumes = [
            "BOOTCAMP",
            "Recovery"
            "Macintosh HD",
            "com.apple.TimeMachine.localsnapshots"
        ]
        for ignored_volume in ignored_volumes:
            found = False
            for volume in volumes:
                if ignored_volume == volume:
                    found = True
            if found:
                volumes.remove(ignored_volume)
        return volumes
    else:
        print("Drive-Move doesn't support", system())
        exit()


def main():
    """Main function for the program
    """
    execPath = os.getcwd()
    parser = argparse.ArgumentParser(
        description="Quickly move any file on your computer to a drive")
    parser.add_argument("-ld", "--listdrives",
                        action="store_true", help="List all of drives")
    parser.add_argument("-mv", "--move",
                        action="store_true", help="Move a file to a drive\nfileName:driveName")
    args = parser.parse_args()
    if args.listdrives and args.move:
        pass


if __name__ == "__main__":
    print(get_drives())
