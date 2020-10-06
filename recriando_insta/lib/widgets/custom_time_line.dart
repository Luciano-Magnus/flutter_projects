import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:recriando_insta/object/photo_person.dart';
import 'package:recriando_insta/object/post.dart';

class CustomTimeLine extends StatefulWidget {
  @override
  _CustomTimeLineState createState() => _CustomTimeLineState();
}

class _CustomTimeLineState extends State<CustomTimeLine> {
  List<Post> _post = [
    Post(
        "https://scontent.fccm8-1.fna.fbcdn.net/v/t1.0-9/15826212_695227363972379"
            "_5480394411723923366_n.jpg?_nc_cat=106&_nc_sid=09cbfe&_nc_ohc=PaL7jh"
            "NxvtEAX-PiTx-&_nc_ht=scontent.fccm8-1.fna&oh=916a98c52bb5474775ddf87"
            "bafb4791e&oe=5F9A6ADD",
        "Kemeli",
        "https://scontent.fccm8-1.fna.fbcdn.net/v/t1.0-0/p206x206/10"
            "628345_489619731199811_8697994026721041440_n.jpg?_nc_cat=103&_nc_"
            "sid=da31f3&_nc_ohc=9hWHx1GvVrkAX-qLmXr&_nc_ht=scontent.fccm8-1.fna"
            "&tp=6&oh=b4312541b5cedb7eee80c4d10968e1c9&oe=5F9BAC53",
        "Adicionando descrição"),
    Post("https://scontent.fccm8-1.fna.fbcdn.net/v/t31.0-8/22712609_12614214"
        "50629838_8265042894882815015_o.jpg?_nc_cat=102&_nc_sid=09cbfe&_nc_ohc"
        "=tM39Ip7gfkAAX_nyC1O&_nc_ht=scontent.fccm8-1.fna&oh=42cc41e8cef7756"
        "dff8d9e5a0c9dd284&oe=5F9C764D", "Bruna", "https://scontent.fccm8-1."
        "fna.fbcdn.net/v/t1.0-0/c0.2.206.206a/p206x206/61420922_194617625882"
        "1017_1019439813742297088_o.jpg?_nc_cat=100&_nc_sid=da31f3&_nc_ohc=wL"
        "o4DRkSzV0AX9Xdat6&_nc_ht=scontent.fccm8-1.fna&_nc_tp=27&oh=fc6e49a849"
        "fb3858d205cc5cc278dbca&oe=5F9D6748", "Eu sei que às vezes pego no pé, "
        "te dou bronca e chamo sua atenção. Mas é porque te amo...")
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 8),
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: _post.length,
        itemBuilder: (context, i) {
          return Container(
            margin: EdgeInsets.only(left: 4.0, right: 4.0),
            color: Colors.white,
            child: Column(
              children: [
                Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(40),
                      child: Image.network(
                        _post[i].userPhoto,
                        width: 40,
                        height: 40,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 4.0),
                      child: Text(_post[i].userName),
                    ),
                    Expanded(child: SizedBox()),
                    IconButton(
                      icon: Icon(
                        SimpleLineIcons.options,
                        size: 16,
                      ),
                      onPressed: () {},
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: FadeInImage(
                    image: NetworkImage(
                      _post[i].postImage,
                    ),
                    placeholder:  AssetImage(
                      "assets/img/placeholder_img.jpg"
                    ),
                  ),
                ),
                Row(
                  children: [
                    IconButton(
                      icon: Icon(FontAwesome.heart_o),
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: Icon(FontAwesome.comment_o),
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: Icon(FontAwesome.send_o),
                      onPressed: () {},
                    ),
                    Expanded(child: SizedBox()),
                    IconButton(
                      icon: Icon(FontAwesome.bookmark_o),
                      onPressed: () {},
                    ),
                  ],
                ),
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: RichText(
                          text: TextSpan(children: [
                            TextSpan(
                                text: "curtido por",
                                style: TextStyle(color: Colors.black)),
                            TextSpan(
                                text: " Luciano_Magnus",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black)),
                            TextSpan(
                                text: " e",
                                style: TextStyle(color: Colors.black)),
                            TextSpan(
                                text: " outras pessoas \n" + _post[i].userName,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black)),
                            TextSpan(
                                text: " " + _post[i].caption,
                                style: TextStyle(color: Colors.black)),
                          ]),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  alignment: AlignmentDirectional.topStart,
                    margin: EdgeInsets.only(left: 8),
                    child: Text("há 5 horas", style: TextStyle(fontSize: 10, color: Colors.grey),),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
