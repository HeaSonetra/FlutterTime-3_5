import 'dart:ffi';

import 'package:flutter/material.dart';

class Productmodel {
  final int id;
  final String name;
  final String image;
  final double price;
  bool favorite;
  int star;

  Productmodel({
    required this.id,
    required this.name,
    required this.image,

    required this.price,
    required this.favorite,
    required this.star,
  });
}

List<Productmodel> listProduct = [
  Productmodel(
    id: 1,
    name: 'Shoe Outfit',
    image: 'asset/image/shoe1_pre.png',
    price: 99.99,
    favorite: false,
    star: 3,
  ),
  Productmodel(
    id: 2,
    name: 'Shoe Outfit',
    image: 'asset/image/shoe1_pre.png',
    price: 99.99,
    favorite: false,
    star: 4,
  ),
  Productmodel(
    id: 2,
    name: 'Shoe Outfit',
    image: 'asset/image/shoe1_pre.png',
    price: 99.99,
    favorite: false,
    star: 5,
  ),
  Productmodel(
    id: 2,
    name: 'Shoe Outfit',
    image: 'asset/image/shoe1_pre.png',
    price: 99.99,
    favorite: false,
    star: 5,
  ),
  Productmodel(
    id: 2,
    name: 'Shoe Outfit',
    image: 'asset/image/shoe1_pre.png',
    price: 99.99,
    favorite: false,
    star: 5,
  ),
  Productmodel(
    id: 2,
    name: 'Shoe Outfit',
    image: 'asset/image/shoe1_pre.png',
    price: 99.99,
    favorite: false,
    star: 5,
  ),
  Productmodel(
    id: 2,
    name: 'Shoe Outfit',
    image: 'asset/image/shoe1_pre.png',
    price: 99.99,
    favorite: false,
    star: 5,
  ),
];
