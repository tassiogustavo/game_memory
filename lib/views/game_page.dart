import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:game_memory/constants.dart';
import 'package:game_memory/models/card_item.dart';
import 'package:game_memory/widgets/card_item.dart';
import 'package:game_memory/widgets/front_flip_card.dart';

class GamePage extends StatefulWidget {
  const GamePage({super.key});

  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  var cardKeys = <int, GlobalKey<FlipCardState>>{};
  Constants constants = Constants();

  List<CardItem> cards = [];

  List<String> imagesDuplicated = [];

  List<CardItem> flippedCards = [];

  void _onCardTap(CardItem item) {
    if (flippedCards.length < 2 && !flippedCards.contains(item)) {
      setState(() {
        item.cardState.currentState!.toggleCard();
        flippedCards.add(item);

        if (flippedCards.length == 2) {
          if (flippedCards[0].imagePath == flippedCards[1].imagePath) {
            flippedCards[0].cardState.currentState!.isFront = false;
            flippedCards[1].cardState.currentState!.isFront = false;

            if (cards
                .every((element) => !element.cardState.currentState!.isFront)) {
              constants.showDialogWinner(context);
            } else {
              //print('Ainda não!!!');
            }
            flippedCards.clear();
          } else {
            Future.delayed(const Duration(milliseconds: 1000), () {
              setState(() {
                flippedCards[0].cardState.currentState!.toggleCard();
                flippedCards[1].cardState.currentState!.toggleCard();
                flippedCards.clear();
              });
            });
          }
        }
      });
    }
  }

  void getCards() async {
    imagesDuplicated =
        constants.assetsImages.expand((element) => [element, element]).toList();
    imagesDuplicated.shuffle();

    for (int i = 0; i < imagesDuplicated.length; i++) {
      cardKeys.putIfAbsent(i, () => GlobalKey<FlipCardState>());

      cards.add(CardItem(
        id: i,
        imagePath: imagesDuplicated[i],
        cardState: cardKeys[i]!,
      ));
    }
  }

  @override
  void initState() {
    getCards();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'JOGO DA MEMÓRIA',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 100),
        child: GridView.builder(
          itemCount: cards.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 8),
          itemBuilder: (context, index) {
            return FlipCard(
              key: cardKeys[index],
              flipOnTouch: false,
              front: GestureDetector(
                onTap: () => _onCardTap(cards[index]),
                child: const FrontFlipCard(),
              ),
              back: CardItemImage(
                image: cards[index].imagePath,
              ),
            );
          },
        ),
      ),
    );
  }
}
