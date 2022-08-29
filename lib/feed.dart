import 'package:flutter/material.dart';
import 'package:instagram/post.dart';
import 'package:instagram/story.dart';
class FeedPage extends StatefulWidget {
  static final String id="feed_page";

  @override
  State<FeedPage> createState() => _FeedPageState();
}

class _FeedPageState extends State<FeedPage> {
  List<Story> _stories = [
    Story("assets/images/user_1.jpeg","Jasmin"),
    Story("assets/images/user_3.jpeg","Lavina"),
    Story("assets/images/user_2.jpeg","Sylvester"),
    Story("assets/images/user_4.jpeg","Anna"),
    Story("assets/images/user_5.jpeg","Katya"),
  ];
  List<Post> _posties=[
  Post(
      userName:"Brianne",
      userImage:"assets/images/user_1.jpeg",
  postImage:"assets/images/story_1.jpeg",
  caption:"Consequatur nihil aliquid omnis consequatur.",
      ),
    Post(
      userName:"Henri",
      userImage:"assets/images/user_2.jpeg",
  postImage:"assets/images/story_2.jpeg",
  caption:"Consequatur nihil aliquid omnis consequatur.",
      ),
    Post(
      userName:"Jenni",
      userImage:"assets/images/user_3.jpeg",
  postImage:"assets/images/story_3.jpeg",
  caption:"Consequatur nihil aliquid omnis consequatur.",
      ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
     body: SingleChildScrollView(
       child: Column(
         children: [
           Divider(),
           // stories and watch all
           Container(
             margin: EdgeInsets.symmetric(horizontal: 20),
             child: Row(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: [
                 Text("Stories",style: TextStyle(color: Colors.grey,fontSize: 14),),
                 Text("Watch All",style: TextStyle(color: Colors.grey,fontSize: 14),),
               ],
             ),
           ),
           //stories
           Container(
             width: MediaQuery.of(context).size.width,
             margin: EdgeInsets.symmetric(vertical: 10),
             height: 110,
             child:  ListView(
               scrollDirection: Axis.horizontal,
               shrinkWrap: true,
               children: _stories.map((story) {
                 return _itemOfStory(story);
               }).toList().cast<Widget>(),
             ),
           ),
           // post
           Container(
             width: MediaQuery.of(context).size.width,
             height: 3000,
             child: ListView.builder(
               physics: NeverScrollableScrollPhysics(),
               itemCount: _posties.length,
               itemBuilder: (ctx, i){
                 return _itemOfPost(_posties[i]);

               },
             ),
           ),
         ],
       ),
     ),
    );
  }

  Widget _itemOfStory(Story story){
    return Column(
      children: [
        Container(
        margin: EdgeInsets.symmetric(horizontal: 15),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(70),
            border: Border.all(
              width: 3,
              color: Color(0xFF8e44ad),
            ),
          ),
          padding: EdgeInsets.all(2),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(70),
            child: Image(
              image: AssetImage(story.image),
              height: 70,
              width: 70,
              fit: BoxFit.cover,
            ),
          ),
        ),
        SizedBox(height: 10,),
        Text(story.name),
      ],
    );
  }
  Widget _itemOfPost(Post post){
    return Container(
      width: MediaQuery.of(context).size.width,
      color: Colors.black,
      child: Column(
        children: [
          //#header
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // header
                Row(
                  children: [
                    // aylamna rasm
                    ClipRRect(
                      borderRadius:BorderRadius.circular(40),
                      child: Image(
                        image: AssetImage(post.userImage),
                        width: 40,
                        height: 40,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(width: 10,),
                    // ismi
                    Text(post.userName,style: TextStyle(color: Colors.white),),
                  ],
                ),
                IconButton(
                  icon: Icon(Icons.more_horiz,color: Colors.white,),
                  onPressed: (){},
                ),
              ],
            ),
          ),
          FadeInImage(
            width: MediaQuery.of(context).size.width,
            image: AssetImage(post.postImage),
            placeholder: AssetImage("assets/images/placeholder.png"),
            fit: BoxFit.cover,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.heart_broken_rounded,color: Colors.white,),
                    onPressed: (){},
                  ),
                  IconButton(
                    icon: Icon(Icons.mode_comment_rounded,color: Colors.white,),
                    onPressed: (){},
                  ),
                  IconButton(
                    icon: Icon(Icons.send,color: Colors.white,),
                    onPressed: (){},
                  ),
                ],
              ),
              IconButton(
                onPressed: (){},
                icon: Icon(Icons.bookmark,color: Colors.white,),
              ),
            ],
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.symmetric(horizontal: 14),
            child: RichText(
              softWrap: true,
              overflow: TextOverflow.visible,
              text: TextSpan(
                children:[
                  TextSpan(
                    text: "Liked by",
                    style: TextStyle(color: Colors.white),
                  ),
                  TextSpan(
                    text: "Jony,",
                    style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),
                  ),
                  TextSpan(
                    text: "Linda,",
                    style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),
                  ),
                  TextSpan(
                    text: "Alisa,",
                    style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),
                  ),
                  TextSpan(
                    text: "and",
                    style: TextStyle(color: Colors.white),
                  ),
                  TextSpan(
                    text: "1263 others",
                    style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),
                  ),
                ]
              ),

            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.symmetric(horizontal: 14,vertical: 5),
            child: RichText(
              softWrap: true,
              overflow: TextOverflow.visible,
              text: TextSpan(
                children:[
                  TextSpan(
                    text: "${post.userName}",
                    style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),
                  ),TextSpan(
                    text: "${post.caption}",
                    style: TextStyle(color: Colors.white,),
                  ),
                ]
              ),

            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 14),
            alignment: Alignment.topLeft,
            child: Text("Febuary 2020",textAlign: TextAlign.start,style: TextStyle(color: Colors.grey),),


          ),
        ],
      ),
    );
  }
}

