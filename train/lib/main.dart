import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(home: SimpleTrainingApp()));
}

class Sample {
  final String imageUrl;
  final String answer;
  Sample(this.imageUrl, this.answer);

  factory Sample.fromList(List<String> list) {
    return Sample(list[0], list[1]);
  }
}

class SimpleTrainingApp extends StatefulWidget {
  const SimpleTrainingApp({super.key});
  @override
  State<SimpleTrainingApp> createState() => _SimpleTrainingAppState();
}

const String appTitle = 'イメージ英単語トレーニング';

class _SimpleTrainingAppState extends State<SimpleTrainingApp> {
  // 画像＋英単語のシンプルなセット。画像はロイヤリティフリーのイラストを利用。
  // 追加したい単語があればこの配列にレコードを足すだけでOK。
  final List<List<String>> data = [
    [
      "https://images.unsplash.com/photo-1489515217757-5fd1be406fef?w=800", // 商品の箱
      "product（製品）",
    ],
    [
      "https://images.unsplash.com/photo-1494790108377-be9c29b29330?w=800", // 自信のある表情
      "self-confident（自信のある）",
    ],
    [
      "https://images.unsplash.com/photo-1504199367641-aba8151af406?w=800", // ジョギングで活動的
      "energetic（活動的な）",
    ],
    [
      "https://i.gzn.jp/img/2019/03/12/6-ways-to-be-more-optimistic/00.jpg", // 笑顔で楽観的
      "optimistic（楽観的な）",
    ],
    [
      "https://www.meikogijuku.jp/meiko-plus/202104_33_thumb.jpg", // 勉強している人
      "study（勉強する）",
    ],
    [
      "https://cdn-ak.f.st-hatena.com/images/fotolife/f/forReadercs/20240528/20240528104421.jpg", // チームワーク
      "cooperate（協力する）",
    ],
    [
      "https://evernew-product.net/upload/save_image/EKE656/esthumbs/EKE656-346.jpg", // ゴール
      "goal（目標）",
    ],
    [
      "https://courrier.jp/media/2017/09/30081030/ThinkstockPhotos-505175324-e1506694319732.jpg", // 幸せ
      "happy（幸せな）",
    ],
  ];

  late final List<Sample> _samples;
  int _index = 0;
  bool _showAnswer = false;

  @override
  void initState() {
    super.initState();
    _samples = data.map((e) => Sample.fromList(e)).toList();
    _samples.shuffle(Random());
  }

  void _onTap() {
    setState(() {
      if (_showAnswer) {
        _showAnswer = false;

        // 最後まで行ったら再シャッフルして先頭へ
        if (_index == _samples.length - 1) {
          _samples.shuffle(Random());
          _index = 0;
        } else {
          _index++;
        }
      } else {
        _showAnswer = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_samples.isEmpty) {
      return const Scaffold(body: Center(child: Text('データがありません')));
    }

    final sample = _samples[_index];

    return Scaffold(
      appBar: AppBar(title: const Text(appTitle)),
      body: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: _onTap,
        child: Stack(
          children: [
            // 画像を背景全面に表示
            Positioned.fill(
              child: Image.network(
                sample.imageUrl,
                fit: BoxFit.cover,
                loadingBuilder: (c, w, p) => p == null
                    ? w
                    : const Center(child: CircularProgressIndicator()),
                errorBuilder: (e1, e2, e3) =>
                    const Center(child: Text('画像を読み込めません')),
              ),
            ),

            // 下部に答えをオーバーレイ
            if (_showAnswer)
              Positioned(
                left: 16,
                right: 16,
                bottom: 32,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.65),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 20,
                  ),
                  child: Text(
                    sample.answer,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 0.5,
                    ),
                  ),
                ),
              ),

            // 右上：操作ヒント
            Positioned(
              top: 10,
              right: 10,
              child: _hint(_showAnswer ? 'タップで次へ' : 'タップで答え表示'),
            ),

            // 左上：進捗
            Positioned(
              top: 10,
              left: 10,
              child: _hint('${_index + 1}/${_samples.length}'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _hint(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.black45,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(text, style: const TextStyle(color: Colors.white)),
    );
  }
}
