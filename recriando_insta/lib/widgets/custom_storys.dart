import 'package:flutter/material.dart';
import 'package:recriando_insta/object/photo_person.dart';

class CustomStorys extends StatelessWidget {
  List<PhotoPerson> _photoPerson = [
    PhotoPerson(
      "https://scontent.fccm8-1.fna.fbcdn.net/v/t1.0-9/17201379_1001327859997162"
          "_8554383318038380163_n.jpg?_nc_cat=108&_nc_sid=09cbfe&_nc_ohc=CI8b8mE"
          "kxhoAX-Vw_2c&_nc_ht=scontent.fccm8-1.fna&oh=fe08e2ff04b1c099b58dca03d"
          "ae5e81b&oe=5F9C7D40",
      "Luciano",
    ),
    PhotoPerson(
      "https://scontent.fccm8-1.fna.fbcdn.net/v/t1.0-9/15826212_695227363972379"
          "_5480394411723923366_n.jpg?_nc_cat=106&_nc_sid=09cbfe&_nc_ohc=PaL7jh"
          "NxvtEAX-PiTx-&_nc_ht=scontent.fccm8-1.fna&oh=916a98c52bb5474775ddf87"
          "bafb4791e&oe=5F9A6ADD",
      "Kemeli",
    ),
    PhotoPerson(
        "https://scontent.fccm8-1.fna.fbcdn.net/v/t1.0-9/27540980_190587501688"
            "717_3410593966041695615_n.jpg?_nc_cat=101&_nc_sid=09cbfe&_nc_ohc="
            "1KvvCVV0ogAAX82DYgi&_nc_ht=scontent.fccm8-1.fna&oh=c3827dd5d18125"
            "af994222a736cb1565&oe=5F9C4CAD",
        "Maria"),
    PhotoPerson("https://scontent.fccm8-1.fna.fbcdn.net/v/t31.0-8/22712609_12614214"
        "50629838_8265042894882815015_o.jpg?_nc_cat=102&_nc_sid=09cbfe&_nc_ohc"
        "=tM39Ip7gfkAAX_nyC1O&_nc_ht=scontent.fccm8-1.fna&oh=42cc41e8cef7756"
        "dff8d9e5a0c9dd284&oe=5F9C764D", "Bruna"),
    PhotoPerson("https://scontent.fccm8-1.fna.fbcdn.net/v/t1.0-9/65393343_"
        "2760964550585900_1983801598240882688_n.jpg?_nc_cat=108&_nc_sid="
        "09cbfe&_nc_ohc=2dm-BWSdTlwAX8o8Nrx&_nc_ht=scontent.fccm8-1.fna&oh="
        "e5ecc6e634d59409a84a2fc20f2907d1&oe=5F9B2D91","Luiz"),
    PhotoPerson(
        "https://images.pexels.com/photos/2801603/pexels-photo-2801603.jpeg?"
            "auto=compress&cs=tinysrgb&dpr=2&h=650&w=940","Aylla"),
    PhotoPerson("https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?"
        "auto=compress&cs=tinysrgb&dpr=2&h=650&w=940","Marcio"),
    PhotoPerson("https://images.pexels.com/photos/736716/pexels-"
        "photo-736716.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500", "Rodrigo"),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 8),
      width: MediaQuery.of(context).size.width,
      height: 120,
      child: ListView(
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          children: _photoPerson.map((story) {
            return Column(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                    border: Border.all(
                      width: 2,
                      color: Colors.purple,
                    ),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(40),
                    child: Image(
                      image: NetworkImage(story.image),
                      width: 70,
                      height: 70,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: Text(story.name),
                ),
              ],
            );
          }).toList()),
    );
  }
}
