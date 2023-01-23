DEVICE=$(getprop ro.product.vendor.device)
DEVFEAS="$(find /system /vendor /system_ext /product -type f -name "$DEVICE.xml")";
 
for ODEVFEA in ${DEVFEAS}; do 
DEVFEA="$MODPATH$(echo $ODEVFEA | sed "s|^/vendor|/system/vendor|g" | sed "s|^/system_ext|/system/system_ext|g" | sed "s|^/product|/system/product|g")"
cp_ch $ORIGDIR$ODEVFEA $DEVFEA
sed -i 's/\t/  /g' $DEVFEA

#whether support object tracking in camera
sed -i 's/"support_object_track">false/"support_object_track">true/g' $DEVFEA

#whether support audio focus recording in camera
sed -i 's/"support_camera_audio_focus">false/"support_camera_audio_focus">true/g' $DEVFEA

# whether support ai task button 
sed -i 's/"support_ai_task">false/"support_ai_task">true/g' $DEVFEA

#defaultFps
sed -i 's/"defaultFps">60/"defaultFps">120/g' $DEVFEA

#arrayFps
sed -i '/<integer-array name="fpsList">/a\<item>90<\/item>' $DEVFEA

#whether hold blured background for effects preview in camera
sed -i 's/"is_camera_hold_blur_background">false/"is_camera_hold_blur_background">true/g' $DEVFEA

#whether the device supports phone call noise suppression
sed -i 's/"support_phone_call_noise_suppression">false/"support_phone_call_noise_suppression">true/g' $DEVFEA

#<!--whether support aohdr in camera-->
sed -i 's/"support_camera_aohdr">false/"support_camera_aohdr">true/g' $DEVFEA
    
done