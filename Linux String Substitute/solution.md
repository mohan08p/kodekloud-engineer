#### Linux String Substitute

As already hint given in the problem statement, use sed to replace all occurances of Text to Submarine, we can use following command, 

    sed -i 's/Text/Submarine/g' /root/nautilus.xml

Once it is applied validate by searching Text keyword inside this xml file and if you do nt see any entry, which means it applied as expected.
