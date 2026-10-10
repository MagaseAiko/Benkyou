-- n1-grammar-22 — 〜でなくてなんだろう
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-22',
    'grammar',
    'N1',
    $$〜でなくてなんだろう$$,
    $$de nakute nan darou$$,
    $$Se isso não é... o que é / Isso só pode ser / Não há outra palavra senão$$,
    $$でなくてなんだろう é uma pergunta retórica que afirma algo com muita força. Equivale a "se isso não é..., então o que é?" ou "isso só pode ser...".

A pessoa expressa uma emoção forte ou uma convicção, dizendo que não há outra palavra para descrever aquela situação. Por exemplo, "se isso não é amor, o que é?".

É uma expressão literária, usada em textos, discursos e falas emotivas.$$,
    $$A forma でなくてなんであろう é ainda mais formal.

Costuma vir com palavras abstratas, como 愛, 奇跡, 運命 ou 犯罪.$$,
    $$Substantivo + でなくてなんだろう
Substantivo + でなくてなんであろう$$,
    $$でなくてなんだろう$$,
    $$でなくてなんだろう|でなくてなんであろう|でなくて何だろう|でなくて何であろう$$,
    ARRAY['で', 'なくて', 'なん', 'だろう']::text[],
    ARRAY['でなくてなんだろう', 'でなくてなんであろう', 'でなくて何だろう']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-22', $$これが愛でなくてなんだろう。$$, $$これがあいでなくてなんだろう。$$, $$Se isso não é amor, o que é?$$),
    ('n1-grammar-22', $$あの状況で助かったのは、奇跡でなくてなんだろう。$$, $$あのじょうきょうでたすかったのは、きせきでなくてなんだろう。$$, $$Ter sobrevivido naquela situação só pode ser um milagre.$$),
    ('n1-grammar-22', $$二人の出会いは運命でなくてなんであろう。$$, $$ふたりのであいはうんめいでなくてなんであろう。$$, $$Se o encontro dos dois não é destino, o que é?$$),
    ('n1-grammar-22', $$子供を守るために命をかける。これが親の愛でなくて何だろう。$$, $$こどもをまもるためにいのちをかける。これがおやのあいでなくてなんだろう。$$, $$Arriscar a vida para proteger o filho. Se isso não é amor de pai, o que é?$$),
    ('n1-grammar-22', $$弱い人をだますのは、犯罪でなくてなんだろう。$$, $$よわいひとをだますのは、はんざいでなくてなんだろう。$$, $$Enganar os mais fracos, se isso não é crime, o que é?$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$この発見が偉業____。$$, $$Se esta descoberta não é uma grande conquista, o que é?$$),
        (2, $$十年ぶりに偶然再会するなんて、運命____。$$, $$Se reencontrar alguém por acaso depois de dez anos não é destino, o que é?$$),
        (3, $$これが友情____。$$, $$Se isso não é amizade, o que é?$$),
        (4, $$無事に戻れたのは、幸運____。$$, $$Ter voltado em segurança só pode ser sorte.$$),
        (5, $$自然を壊すのは、人間のおごり____。$$, $$Destruir a natureza, se isso não é arrogância humana, o que é?$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-22', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$でなくてなんだろう$$),
        (1, $$でなくてなんであろう$$),
        (1, $$でなくて何だろう$$),
        (2, $$でなくてなんだろう$$),
        (2, $$でなくてなんであろう$$),
        (2, $$でなくて何だろう$$),
        (3, $$でなくてなんだろう$$),
        (3, $$でなくてなんであろう$$),
        (3, $$でなくて何だろう$$),
        (4, $$でなくてなんだろう$$),
        (4, $$でなくてなんであろう$$),
        (4, $$でなくて何だろう$$),
        (5, $$でなくてなんだろう$$),
        (5, $$でなくてなんであろう$$),
        (5, $$でなくて何だろう$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
