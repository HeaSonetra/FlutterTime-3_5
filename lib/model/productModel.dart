import 'package:flutter/material.dart';

class Productmodel {
  final int id;
  final String status;
  final Icon icon;
  final Image img;
  final double rate;
  final String name;
  final double dis;
  final double price;

  Productmodel({
    required this.id,
    required this.status,
    required this.icon,
    required this.img,
    required this.rate,
    required this.name,
    required this.dis,
    required this.price,
  });
}

List<Productmodel> listProduct = [
  Productmodel(
    id: 1,
    status: 'NoNo',
    icon: Icon(Icons.favorite),
    img: Image(image: AssetImage('assets/necklace.png')),
    rate: 1.5,
    name: 'Necklace out fit jjsd  fkjj dshjhds dsikvjc jicdsab dskjacb hasdcb',
    dis: 20,
    price: 100,
  ),
  Productmodel(
    id: 1,
    status: 'NoNo',
    icon: Icon(Icons.favorite),
    img: Image(image: AssetImage('assets/necklace.png')),
    rate: 1.5,
    name: 'Necklace out fit jjsd  fkjj dshjhds dsikvjc jicdsab dskjacb hasdcb',
    dis: 20,
    price: 100,
  ),
  Productmodel(
    id: 1,
    status: 'NoNo',
    icon: Icon(Icons.favorite),
    img: Image(image: AssetImage('assets/necklace.png')),
    rate: 1.5,
    name: 'Necklace out fit jjsd  fkjj dshjhds dsikvjc jicdsab dskjacb hasdcb',
    dis: 20,
    price: 100,
  ),
  Productmodel(
    id: 1,
    status: 'NoNo',
    icon: Icon(Icons.favorite),
    img: Image(image: AssetImage('assets/necklace.png')),
    rate: 1.5,
    name: 'Necklace out fit jjsd  fkjj dshjhds dsikvjc jicdsab dskjacb hasdcb',
    dis: 20,
    price: 100,
  ),
  Productmodel(
    id: 1,
    status: 'NoNo',
    icon: Icon(Icons.favorite),
    img: Image(image: AssetImage('assets/necklace.png')),
    rate: 1.5,
    name: 'Necklace out fit jjsd  fkjj dshjhds dsikvjc jicdsab dskjacb hasdcb',
    dis: 20,
    price: 100,
  ),
  Productmodel(
    id: 1,
    status: 'Sale',
    icon: Icon(Icons.favorite),
    img: Image(image: AssetImage('assets/necklace.png')),
    rate: 1.5,
    name: 'Necklace out fit',
    dis: 20,
    price: 100,
  ),
  Productmodel(
    id: 1,
    status: 'Sale',
    icon: Icon(Icons.favorite),
    img: Image(image: AssetImage('assets/necklace.png')),
    rate: 1.5,
    name: 'Necklace out fit',
    dis: 20,
    price: 100,
  ),
];
