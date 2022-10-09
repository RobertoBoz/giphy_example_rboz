import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_example_test/app/data/models/image_model.dart';
import 'package:flutter_example_test/app/modules/home/widgets/icon_custom_button.dart';

// todo imagen switch 
class ImageTile extends StatelessWidget {
  const ImageTile({
    super.key,
    required this.image,
    required this.vistaSolicitada,
  });

  final ImageGiphy image;  
  final bool vistaSolicitada;


  @override
  Widget build(BuildContext context) {
    
    return   Stack(
      children: [
        
        CachedNetworkImage(                
          imageUrl: image.url,
          height: vistaSolicitada ? image.height : null,
          width: vistaSolicitada ? null : null ,
          placeholder: (context, url) =>Image.asset( 
              'assets/placeholder.jpg',
              //fit: BoxFit.fill,          
              height: vistaSolicitada ? image.height  :image.height,
              width: vistaSolicitada ? null: image.widght,       
              fit: BoxFit.fill,       
              
            ),
          errorWidget: (context, url, error) => const Icon(Icons.error),        
          maxHeightDiskCache: image.height.toInt(),    
          fit: vistaSolicitada ? BoxFit.fill : null,    
        ),
        const Positioned(
          right: 10,
          bottom: 10,
          child: IconButtonCustom(),
        ),

        

      ],
    );

  }
}
