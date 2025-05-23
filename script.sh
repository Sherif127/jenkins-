#!/bin/bash

echo " Jenkins GitHub Script Started at: $(date)"
echo " System Info:"
echo "------------------------------------"
uname -a
echo "------------------------------------"
echo ""

echo " Memory Usage:"
free -h
echo ""

echo " Disk Usage:"
df -h
echo ""

echo " Network Interfaces:"
ip a
echo ""

echo " Top 5 running processes by memory:"
ps aux --sort=-%mem | head -n 6
echo ""

echo "✅ Script finished successfully at: $(date)"
