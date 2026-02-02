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

const String appTitle = '鳥獣判別トレーニング';

class _SimpleTrainingAppState extends State<SimpleTrainingApp> {
  final List<List<String>> data = [
    [
      "https://raw.githubusercontent.com/kmc2400/hunting_exam/refs/heads/main/YBIADAcir8.jpg",
      "〇 マガモ",
    ],
    [
      "https://raw.githubusercontent.com/kmc2400/hunting_exam/refs/heads/main/GjoZKbqOPV.jpg",
      "〇 カルガモ",
    ],
    [
      "https://raw.githubusercontent.com/kmc2400/hunting_exam/refs/heads/main/spl8RSSXap.jpg",
      "〇 オナガガモ",
    ],
    [
      "https://raw.githubusercontent.com/kmc2400/hunting_exam/refs/heads/main/8pVyHmOxRg.jpg",
      "〇 ヒドリガモ",
    ],
    [
      "https://raw.githubusercontent.com/kmc2400/hunting_exam/refs/heads/main/50ohNhK8eO.jpg",
      "〇 ハシビロガモ",
    ],
    [
      "https://raw.githubusercontent.com/kmc2400/hunting_exam/refs/heads/main/NzrwKUFp3M.jpg",
      "〇 ヨシガモ",
    ],
    [
      "https://raw.githubusercontent.com/kmc2400/hunting_exam/refs/heads/main/xiv2bTYyoh.jpg",
      "〇 コガモ",
    ],
    [
      "https://raw.githubusercontent.com/kmc2400/hunting_exam/refs/heads/main/Ti8ry0sgsU.jpg",
      "〇 ホシハジロ",
    ],
    [
      "https://raw.githubusercontent.com/kmc2400/hunting_exam/refs/heads/main/8Rqm61mpEw.jpg",
      "〇 スズガモ",
    ],
    [
      "https://raw.githubusercontent.com/kmc2400/hunting_exam/refs/heads/main/l986c7jmS7.jpg",
      "〇 キンクロハジロ",
    ],
    [
      "https://raw.githubusercontent.com/kmc2400/hunting_exam/refs/heads/main/tHlnOyXiOJ.jpg",
      "〇 クロガモ",
    ],
    [
      "https://raw.githubusercontent.com/kmc2400/hunting_exam/refs/heads/main/mvn01q8fW3.jpg",
      "〇 ヤマシギ",
    ],
    [
      "https://raw.githubusercontent.com/kmc2400/hunting_exam/refs/heads/main/7NeHAWkedI.jpg",
      "〇 タシギ",
    ],
    [
      "https://raw.githubusercontent.com/kmc2400/hunting_exam/refs/heads/main/ndZxqAc3qj.jpg",
      "〇 カワウ",
    ],
    [
      "https://raw.githubusercontent.com/kmc2400/hunting_exam/refs/heads/main/jqMvcBuj04.jpg",
      "〇 エゾライチョウ",
    ],
    [
      "https://raw.githubusercontent.com/kmc2400/hunting_exam/refs/heads/main/2IUXXC5ggm.jpg",
      "〇 コジュケイ",
    ],
    [
      "https://raw.githubusercontent.com/kmc2400/hunting_exam/refs/heads/main/hrpFLa73Rl.jpg",
      "〇 ヤマドリ",
    ],
    [
      "https://raw.githubusercontent.com/kmc2400/hunting_exam/refs/heads/main/iYOgAGWiDn.jpg",
      "〇 キジバト",
    ],
    [
      "https://raw.githubusercontent.com/kmc2400/hunting_exam/refs/heads/main/PAuTzDU4Rz.jpg",
      "〇 キジ",
    ],
    [
      "https://raw.githubusercontent.com/kmc2400/hunting_exam/refs/heads/main/PgU3iMzf9K.jpg",
      "〇 ニュウナイスズメ",
    ],
    [
      "https://raw.githubusercontent.com/kmc2400/hunting_exam/refs/heads/main/W3gWJzzPz3.jpg",
      "〇 ヒヨドリ",
    ],
    [
      "https://raw.githubusercontent.com/kmc2400/hunting_exam/refs/heads/main/1MqYEmAa4f.jpg",
      "〇 スズメ",
    ],
    [
      "https://raw.githubusercontent.com/kmc2400/hunting_exam/refs/heads/main/2oBsMAdFrh.jpg",
      "〇 ムクドリ",
    ],
    [
      "https://raw.githubusercontent.com/kmc2400/hunting_exam/refs/heads/main/vfEy30rMv5.jpg",
      "〇 ミヤマガラス",
    ],
    [
      "https://raw.githubusercontent.com/kmc2400/hunting_exam/refs/heads/main/plM2SfDsHL.jpg",
      "〇 ハシブトガラス",
    ],
    [
      "https://raw.githubusercontent.com/kmc2400/hunting_exam/refs/heads/main/p708NUH8Nb.jpg",
      "〇 ハシボソガラス",
    ],
    [
      "https://raw.githubusercontent.com/kmc2400/hunting_exam/refs/heads/main/wU1zzBLtOs.jpg",
      "〇 ノウサギ・ユキウサギ",
    ],
    [
      "https://raw.githubusercontent.com/kmc2400/hunting_exam/refs/heads/main/6btvfSijiv.jpg",
      "〇 タイワンリス",
    ],
    [
      "https://raw.githubusercontent.com/kmc2400/hunting_exam/refs/heads/main/P0DGzAMDHI.jpg",
      "〇 シマリス",
    ],
    [
      "https://raw.githubusercontent.com/kmc2400/hunting_exam/refs/heads/main/w3fYetFJU2.jpg",
      "〇 ヌートリア",
    ],
    [
      "https://raw.githubusercontent.com/kmc2400/hunting_exam/refs/heads/main/NbGv7kf793.jpg",
      "〇 ヒグマ",
    ],
    [
      "https://raw.githubusercontent.com/kmc2400/hunting_exam/refs/heads/main/GW2oUdfXdM.jpg",
      "〇 ツキノワグマ",
    ],
    [
      "https://raw.githubusercontent.com/kmc2400/hunting_exam/refs/heads/main/xx1pn7zGiD.jpg",
      "〇 イノシシ",
    ],
    [
      "https://raw.githubusercontent.com/kmc2400/hunting_exam/refs/heads/main/UKh4X3u152.jpg",
      "〇 ニホンジカ",
    ],
    [
      "https://raw.githubusercontent.com/kmc2400/hunting_exam/refs/heads/main/3VBfHVYNUt.jpg",
      "〇 アライグマ",
    ],
    [
      "https://raw.githubusercontent.com/kmc2400/hunting_exam/refs/heads/main/4plsMuBMH4.jpg",
      "〇 キツネ",
    ],
    [
      "https://raw.githubusercontent.com/kmc2400/hunting_exam/refs/heads/main/HbdEpwpX2R.jpg",
      "〇 テン",
    ],
    [
      "https://raw.githubusercontent.com/kmc2400/hunting_exam/refs/heads/main/ebW8wf6RMT.jpg",
      "〇 イタチのオス",
    ],
    [
      "https://raw.githubusercontent.com/kmc2400/hunting_exam/refs/heads/main/kkbkz1xQdC.jpg",
      "〇 ミンク",
    ],
    [
      "https://raw.githubusercontent.com/kmc2400/hunting_exam/refs/heads/main/snPUBKCRGE.jpg",
      "〇 アナグマ",
    ],
    [
      "https://raw.githubusercontent.com/kmc2400/hunting_exam/refs/heads/main/rBGmVhd7tT.jpg",
      "〇 ハクビシン",
    ],
    [
      "https://raw.githubusercontent.com/kmc2400/hunting_exam/refs/heads/main/fbKPDx7CLS.jpg",
      "✕ 非狩猟鳥獣",
    ],
    [
      "https://raw.githubusercontent.com/kmc2400/hunting_exam/refs/heads/main/KyUZPXwZ1z.jpg",
      "✕ 非狩猟鳥獣",
    ],
    [
      "https://raw.githubusercontent.com/kmc2400/hunting_exam/refs/heads/main/dVkVwENDgK.jpg",
      "✕ 非狩猟鳥獣",
    ],
    [
      "https://raw.githubusercontent.com/kmc2400/hunting_exam/refs/heads/main/ahc6pEfrth.jpg",
      "✕ 非狩猟鳥獣",
    ],
    [
      "https://raw.githubusercontent.com/kmc2400/hunting_exam/refs/heads/main/0ZIOmcvaUr.jpg",
      "✕ 非狩猟鳥獣",
    ],
    [
      "https://raw.githubusercontent.com/kmc2400/hunting_exam/refs/heads/main/4RNmf5WOGE.jpg",
      "✕ 非狩猟鳥獣",
    ],
    [
      "https://raw.githubusercontent.com/kmc2400/hunting_exam/refs/heads/main/SaQQCepUJe.jpg",
      "✕ 非狩猟鳥獣",
    ],
    [
      "https://raw.githubusercontent.com/kmc2400/hunting_exam/refs/heads/main/w292eD8JyA.jpg",
      "✕ 非狩猟鳥獣",
    ],
    [
      "https://raw.githubusercontent.com/kmc2400/hunting_exam/refs/heads/main/e0q1fLIfu1.jpg",
      "✕ 非狩猟鳥獣",
    ],
    [
      "https://raw.githubusercontent.com/kmc2400/hunting_exam/refs/heads/main/wWbPhwtbe0.jpg",
      "✕ 非狩猟鳥獣",
    ],
    [
      "https://raw.githubusercontent.com/kmc2400/hunting_exam/refs/heads/main/DyUM0RWtps.jpg",
      "✕ 非狩猟鳥獣",
    ],
    [
      "https://raw.githubusercontent.com/kmc2400/hunting_exam/refs/heads/main/tEkg4sxuEh.jpg",
      "✕ 非狩猟鳥獣",
    ],
    [
      "https://raw.githubusercontent.com/kmc2400/hunting_exam/refs/heads/main/wpgaBvscoF.jpg",
      "✕ 非狩猟鳥獣",
    ],
    [
      "https://raw.githubusercontent.com/kmc2400/hunting_exam/refs/heads/main/T13PZFhATj.jpg",
      "✕ 非狩猟鳥獣",
    ],
    [
      "https://raw.githubusercontent.com/kmc2400/hunting_exam/refs/heads/main/3LfrCnyFur.jpg",
      "✕ 非狩猟鳥獣",
    ],
    [
      "https://raw.githubusercontent.com/kmc2400/hunting_exam/refs/heads/main/R86cmbktXP.jpg",
      "✕ 非狩猟鳥獣",
    ],
    [
      "https://raw.githubusercontent.com/kmc2400/hunting_exam/refs/heads/main/oQOHigAjrJ.jpg",
      "✕ 非狩猟鳥獣",
    ],
    [
      "https://raw.githubusercontent.com/kmc2400/hunting_exam/refs/heads/main/VHqzVtSOU4.jpg",
      "✕ 非狩猟鳥獣",
    ],
    [
      "https://raw.githubusercontent.com/kmc2400/hunting_exam/refs/heads/main/P80xwK0oBB.jpg",
      "✕ 非狩猟鳥獣",
    ],
    [
      "https://raw.githubusercontent.com/kmc2400/hunting_exam/refs/heads/main/1cSRPhbCVl.jpg",
      "✕ 非狩猟鳥獣",
    ],
    [
      "https://raw.githubusercontent.com/kmc2400/hunting_exam/refs/heads/main/ytfRDIL7n8.jpg",
      "✕ 非狩猟鳥獣",
    ],
    [
      "https://raw.githubusercontent.com/kmc2400/hunting_exam/refs/heads/main/jgn3WsN8ok.jpg",
      "✕ 非狩猟鳥獣",
    ],
    [
      "https://raw.githubusercontent.com/kmc2400/hunting_exam/refs/heads/main/gH4jOmVbXq.jpg",
      "✕ 非狩猟鳥獣",
    ],
    [
      "https://raw.githubusercontent.com/kmc2400/hunting_exam/refs/heads/main/UybpiHbuUm.jpg",
      "✕ 非狩猟鳥獣",
    ],
    [
      "https://raw.githubusercontent.com/kmc2400/hunting_exam/refs/heads/main/hZjF0h9zJe.jpg",
      "✕ 非狩猟鳥獣",
    ],
    [
      "https://raw.githubusercontent.com/kmc2400/hunting_exam/refs/heads/main/iFDkBQDi6t.jpg",
      "✕ 非狩猟鳥獣",
    ],
    [
      "https://raw.githubusercontent.com/kmc2400/hunting_exam/refs/heads/main/cfCulOmnOT.jpg",
      "✕ 非狩猟鳥獣",
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
            Positioned.fill(
              child: Image.network(
                sample.imageUrl,
                // fit: BoxFit.cover,// 画面いっぱいに広げる代わりに上下左右が切れる
                fit: BoxFit.contain, // 画像全体が必ず画面内に収まる（余白が出ることはあるが切れない）
                loadingBuilder: (c, w, p) => p == null
                    ? w
                    : const Center(child: CircularProgressIndicator()),
                errorBuilder: (e1, e2, e3) =>
                    const Center(child: Text('画像を読み込めません')),
              ),
            ),

            if (_showAnswer)
              Positioned(
                left: 0,
                right: 0,
                bottom: 0,
                child: Container(
                  color: Colors.black54,
                  padding: const EdgeInsets.all(20),
                  child: Text(
                    sample.answer,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),

            Positioned(
              top: 10,
              right: 10,
              child: _hint(_showAnswer ? 'タップで次へ' : 'タップで正解表示'),
            ),

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
