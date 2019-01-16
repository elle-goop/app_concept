import 'package:flutter/widgets.dart';
import '../theme/theme.dart';
import '../model/book.dart';

String text = """
  Have you ever bought a lottery ticket? I admit, I’ve played a few times. You won’t be surprised to learn I never did win the big jackpot. Seeing winners on the evening news gives the false impression that anyone could win, but the odds of winning are long—very long.

  Rod Wolfe knows a thing or 2 about long odds. His friends call him “Lightning Rod” because he’s been struck by lightning not once, but twice. What are the chances? Well, you’re more likely to be the next Rod Wolfe than you are the next lottery winner.

  The software industry has a lot in common with the lottery. We see big winners in the news everyday—Facebook, Uber, Airbnb. Their success bolsters our ambitions of making the next big product. Our ambitions are big and we act fast hoping to beat competitors to the market.

  Software success hinges on a lottery-like collection of variables: the right product with the right features for the right audience in the right market. If you’re even a little bit off in your planning, you can end up wasting time and resources, and potentially put your company in a very difficult situation.
  """;

final List<Book> books = [
  Book(url: 'assets/images/bg-1.png',
      bookUrl: 'assets/epub/1_PrinciplesProductDesign.epub',
      title: 'Principles of Product Design',
      author: 'Aarron Walter',
      color: Palette.mainBlue,
      text: text,),

  Book(url: 'assets/images/bg-2.png',
      bookUrl: 'assets/epub/2_DesignThinkingHandbook.epub',
      title: 'Design Thinking Handbook',
      author: 'Eli Woolery',
      color: Palette.mainRed,
      text: text,),

  Book(url: 'assets/images/bg-3.png',
      bookUrl: 'assets/epub/3_DesignLeadershipHandbook.epub',
      title: 'Design Leadership Handbook',
      author: 'Aarron Walter and Eli Woolery',
      color: Palette.mainPurple,
      text: text,),
];