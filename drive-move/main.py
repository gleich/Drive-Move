import argparse
import os


def main():
    """Main function for the program
    """
    execPath = os.getcwd()
    parser = argparse.ArgumentParser(
        description="Quickly move any file on your computer to a drive")
    parser.add_argument("-ld", "--listdrives",
                        action="store_true", help="List all of drives")
