-- n1-grammar-171 — 〜損なう / 〜損ねる / 〜損じる
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-171',
    'grammar',
    'N1',
    $$〜損なう / 〜損ねる / 〜損じる$$,
    $$sokonau / sokoneru / sonjiru$$,
    $$Deixar de / Falhar em / Perder a chance de$$,
    $$損なう, 損ねる e 損じる, depois de outro verbo, indicam que a pessoa falhou em fazer algo ou perdeu a chance de fazer. Equivalem a "deixar de", "falhar em" ou "perder a chance de".

Por exemplo, "perdi o trem" ou "deixei de ver o filme". Também pode indicar que algo foi feito de forma errada, como "escrevi errado".

A expressão 死に損なう significa "escapar da morte por pouco".$$,
    $$Combinações comuns são 見損なう, 乗り損ねる, 言い損なう, 聞き損じる e 書き損じる.

見損なう também significa "decepcionar-se com alguém", como 君を見損なった.$$,
    $$Verbo (forma ます sem ます) + 損なう
Verbo (forma ます sem ます) + 損ねる
Verbo (forma ます sem ます) + 損じる$$,
    $$損なう$$,
    $$損なう|損なった|損ねる|損ねた|損ねて|損じる|損じた|損なって|そこなう|そこねた$$,
    ARRAY['損なう']::text[],
    ARRAY['損なう', '損ねる', '損じる', '損ねた']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-171', $$寝坊して、電車に乗り損ねた。$$, $$ねぼうして、でんしゃにのりそこねた。$$, $$Dormi demais e perdi o trem.$$),
    ('n1-grammar-171', $$忙しくて、その映画を見損なった。$$, $$いそがしくて、そのえいがをみそこなった。$$, $$Estava ocupado e deixei de ver esse filme.$$),
    ('n1-grammar-171', $$大事なことを言い損ねてしまった。$$, $$だいじなことをいいそこねてしまった。$$, $$Acabei deixando de dizer algo importante.$$),
    ('n1-grammar-171', $$君を見損なったよ。$$, $$きみをみそこなったよ。$$, $$Você me decepcionou.$$),
    ('n1-grammar-171', $$手紙を書き損じたので、もう一枚ください。$$, $$てがみをかきそんじたので、もういちまいください。$$, $$Errei ao escrever a carta, me dê mais uma folha.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$チャンスをつかみ____。$$, $$Perdi a chance de agarrar a oportunidade.$$),
        (2, $$最終バスに乗り____、タクシーで帰った。$$, $$Perdi o último ônibus e voltei de táxi.$$),
        (3, $$先生の説明を聞き____。$$, $$Deixei de ouvir a explicação do professor.$$),
        (4, $$ボールを受け____、点を取られた。$$, $$Falhei em pegar a bola e levamos um ponto.$$),
        (5, $$あの選手は記録を作り____。$$, $$Aquele atleta falhou em bater o recorde.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-171', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$損ねた$$),
        (1, $$損なった$$),
        (2, $$損ねて$$),
        (2, $$損なって$$),
        (3, $$損ねた$$),
        (3, $$損なった$$),
        (3, $$損じた$$),
        (4, $$損ねて$$),
        (4, $$損なって$$),
        (5, $$損ねた$$),
        (5, $$損なった$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
