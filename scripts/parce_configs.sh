#!/bin/bash
grep -v '^#'' $1 | grep -v -e '^$' | grep -v '^[[:blank:]]'