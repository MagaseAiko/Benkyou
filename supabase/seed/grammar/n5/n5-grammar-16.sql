-- n5-grammar-16 — い形容詞
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n5-grammar-16',
    'grammar',
    'N5',
    $$い形容詞$$,
    $$i-keiyoushi$$,
    $$Adjetivo い / Adjetivo terminado em い$$,
    $$Os adjetivos い são adjetivos que terminam em い na forma básica e que se conjugam sozinhos, quase como verbos. Eles mostram qualidades, sensações e estados, como grande, frio, gostoso e divertido.

Diferente do português, em japonês o próprio adjetivo muda para indicar negativo e passado. Para isso, tira-se o い final e acrescenta-se uma terminação: くない para o negativo, かった para o passado e くなかった para o passado negativo.

Para deixar a frase educada, basta colocar です depois da forma conjugada. Não se usa だ com adjetivos い.

Antes de um substantivo, o adjetivo い fica na forma básica, sem mudança nenhuma. Para ligar dois adjetivos, troca-se o い por くて.

O adjetivo いい, que significa "bom", é irregular: nas conjugações ele vira よ, formando よくない, よかった e よくなかった.$$,
    $$Algumas palavras terminam em い, mas não são adjetivos い. As mais famosas são きれい e 嫌い, que são adjetivos な. Elas formam o negativo com じゃない, e não com くない.

Um erro comum de iniciantes é usar でした com adjetivos い, como おいしいでした. O passado educado correto é おいしかったです: o passado fica no adjetivo, e です só deixa a frase educada.

A forma くありません soa um pouco mais formal que くないです, mas as duas são corretas e muito usadas.$$,
    $$Afirmativo: Adjetivo い
Negativo: Adjetivo sem い + くない
Passado: Adjetivo sem い + かった
Passado negativo: Adjetivo sem い + くなかった

Educado: forma conjugada + です
Negativo educado alternativo: sem い + くありません / くありませんでした

Antes de substantivo: Adjetivo い + Substantivo
Ligando adjetivos: sem い + くて

Irregular: いい → よくない / よかった / よくなかった$$,
    $$い$$,
    $$いです|くない|かった|くなかった|くありません$$,
    ARRAY['い', 'くない', 'かった', 'くなかった']::text[],
    ARRAY['い', 'くない', 'かった', 'くなかった', 'くありません', 'くありませんでした', 'くて']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n5-grammar-16', $$この本はおもしろいです。$$, $$このほんはおもしろいです。$$, $$Este livro é interessante.$$),
    ('n5-grammar-16', $$今日はあまり寒くない。$$, $$きょうはあまりさむくない。$$, $$Hoje não está muito frio.$$),
    ('n5-grammar-16', $$昨日の映画は楽しかったです。$$, $$きのうのえいがはたのしかったです。$$, $$O filme de ontem foi divertido.$$),
    ('n5-grammar-16', $$旅行はあまりよくなかった。$$, $$りょこうはあまりよくなかった。$$, $$A viagem não foi muito boa.$$),
    ('n5-grammar-16', $$このラーメンは安くて、おいしいです。$$, $$このラーメンはやすくて、おいしいです。$$, $$Este ramen é barato e gostoso.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$このかばんはあまり高____。$$, $$Esta bolsa não é muito cara.$$),
        (2, $$昨日はとても寒____。$$, $$Ontem estava muito frio.$$),
        (3, $$先週のテストは難し____。$$, $$A prova da semana passada não foi difícil.$$),
        (4, $$この部屋は広____です。$$, $$Este quarto é amplo.$$),
        (5, $$昨日のパーティーはとても____です。$$, $$A festa de ontem foi muito boa.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n5-grammar-16', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$くない$$),
        (1, $$くないです$$),
        (1, $$くありません$$),
        (2, $$かった$$),
        (2, $$かったです$$),
        (3, $$くなかった$$),
        (3, $$くなかったです$$),
        (3, $$くありませんでした$$),
        (4, $$い$$),
        (5, $$よかった$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
