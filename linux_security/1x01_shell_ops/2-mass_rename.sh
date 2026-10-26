#!/bin/bash
ls "$1"/*.log | xargs -I {} mv {} {}.old
