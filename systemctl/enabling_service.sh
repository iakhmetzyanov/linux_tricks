#!/bin/bash
systemctl disable route
systemctl enable route
vsystemctl daemon-reload
systemctl status route.service
systemctl start route
