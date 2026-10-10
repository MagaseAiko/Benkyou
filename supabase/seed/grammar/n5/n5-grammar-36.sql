-- n5-grammar-36 — な形容詞
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n5-grammar-36',
    'grammar',
    'N5',
    $$な形容詞$$,
    $$na-keiyoushi$$,
    $$Adjetivo な / Adjetivo com な$$,
    $$Os adjetivos な são adjetivos que recebem な quando vêm antes de um substantivo. Eles descrevem qualidades e estados, como tranquilo, famoso, bonito e prático.

Diferente dos adjetivos い, os adjetivos な não se conjugam sozinhos. Eles funcionam de um jeito parecido com os substantivos: quem muda é o que vem depois. Para o presente usa-se だ ou です, para o negativo じゃない ou ではありません, e para o passado だった ou でした.

O な só aparece quando o adjetivo está diretamente antes de um substantivo. No final da frase, o な desaparece e entra だ ou です.

Para ligar um adjetivo な a outra qualidade, usa-se で. E para transformá-lo em advérbio, usa-se に, como "fazer algo de forma tranquila".$$,
    $$Alguns adjetivos な terminam em い e confundem estudantes, como きれい, 嫌い e 有名. Eles nunca usam くない ou かった: o negativo de きれい é きれいじゃない.

Muitos adjetivos な vêm do chinês e são escritos com dois kanji, como 有名, 便利 e 親切.

O adjetivo 同じ é especial: antes de substantivo, ele não recebe な.$$,
    $$Antes de substantivo: Adjetivo + な + Substantivo
Afirmativo: Adjetivo + だ / です
Negativo: Adjetivo + じゃない / ではない / じゃありません / ではありません
Passado: Adjetivo + だった / でした
Passado negativo: Adjetivo + じゃなかった / ではなかった / じゃありませんでした / ではありませんでした
Ligando qualidades: Adjetivo + で
Advérbio: Adjetivo + に$$,
    $$な$$,
    $$な|です|でした|だった|じゃない|ではない|じゃなかった|ではなかった|じゃありません|ではありません$$,
    ARRAY['な', 'だ', 'です']::text[],
    ARRAY['な', 'だ', 'です', 'じゃない', 'ではない', 'だった', 'でした', 'じゃなかった', 'ではなかった', 'で', 'に']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n5-grammar-36', $$ここは静かな町です。$$, $$ここはしずかなまちです。$$, $$Aqui é uma cidade tranquila.$$),
    ('n5-grammar-36', $$田中さんはとても親切です。$$, $$たなかさんはとてもしんせつです。$$, $$O Tanaka é muito gentil.$$),
    ('n5-grammar-36', $$この公園はあまりきれいじゃないです。$$, $$このこうえんはあまりきれいじゃないです。$$, $$Este parque não é muito limpo.$$),
    ('n5-grammar-36', $$昨日のテストは簡単でした。$$, $$きのうのテストはかんたんでした。$$, $$A prova de ontem foi fácil.$$),
    ('n5-grammar-36', $$この町はにぎやかで、楽しいです。$$, $$このまちはにぎやかで、たのしいです。$$, $$Esta cidade é animada e divertida.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$ここは有名____レストランです。$$, $$Aqui é um restaurante famoso.$$),
        (2, $$昨日の仕事はあまり大変____。$$, $$O trabalho de ontem não foi muito puxado.$$),
        (3, $$子供のころ、野菜が嫌い____。$$, $$Quando eu era criança, não gostava de verdura.$$),
        (4, $$彼女はきれい____、優しい人です。$$, $$Ela é bonita e é uma pessoa gentil.$$),
        (5, $$この部屋はあまりきれい____。$$, $$Este quarto não está muito limpo.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n5-grammar-36', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$な$$),
        (2, $$じゃなかった$$),
        (2, $$ではなかった$$),
        (2, $$じゃありませんでした$$),
        (2, $$ではありませんでした$$),
        (2, $$じゃなかったです$$),
        (2, $$ではなかったです$$),
        (3, $$でした$$),
        (3, $$だった$$),
        (4, $$で$$),
        (5, $$じゃない$$),
        (5, $$ではない$$),
        (5, $$じゃありません$$),
        (5, $$ではありません$$),
        (5, $$じゃないです$$),
        (5, $$ではないです$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
