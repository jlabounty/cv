images="g-2Logo.png cloak.png ostem.png"

for image in $images;
do
    echo "Resizing $image"
    # convert $image -gravity center -background white -extent 200x100% resized_${image}      
    convert $image -virtual-pixel white -set option:distort:viewport \
     "%[fx:max(w,h)]x%[fx:max(w,h)]-%[fx:max((h-w)/2,0)]-%[fx:max((w-h)/2,0)]" \
     -filter point -distort SRT 0  +repage resized_${image}      
    convert resized_${image} -resize 1000x500 resized_${image}
done
