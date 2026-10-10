-- n1-grammar-76 — 〜も同然だ
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-76',
    'grammar',
    'N1',
    $$〜も同然だ$$,
    $$mo douzen da$$,
    $$É praticamente / É quase como / Equivale a$$,
    $$も同然だ indica que algo não é exatamente aquilo, mas é quase igual na prática. Equivale a "é praticamente" ou "é quase como".

Por exemplo, "o trabalho está praticamente terminado" ou "ele é quase como da família".

É usado para destacar que a diferença é tão pequena que não importa.$$,
    $$É parecido com と同じだ e みたいなものだ.

A forma も同然の vem antes de substantivos, como ただも同然の値段, "um preço quase de graça".$$,
    $$Substantivo + も同然だ
Verbo (forma た) + も同然だ
Substantivo + も同然の + Substantivo$$,
    $$も同然だ$$,
    $$も同然|もどうぜん$$,
    ARRAY['も', '同然', 'だ']::text[],
    ARRAY['も同然だ', 'も同然の', 'も同然です']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-76', $$この仕事は終わったも同然だ。$$, $$このしごとはおわったもどうぜんだ。$$, $$Este trabalho está praticamente terminado.$$),
    ('n1-grammar-76', $$彼は私にとって家族も同然です。$$, $$かれはわたしにとってかぞくもどうぜんです。$$, $$Ele é quase como da família para mim.$$),
    ('n1-grammar-76', $$この値段なら、ただも同然だ。$$, $$このねだんなら、ただもどうぜんだ。$$, $$Com este preço, é praticamente de graça.$$),
    ('n1-grammar-76', $$決勝に進んだのだから、優勝したも同然だ。$$, $$けっしょうにすすんだのだから、ゆうしょうしたもどうぜんだ。$$, $$Chegamos à final, então é praticamente como se tivéssemos vencido.$$),
    ('n1-grammar-76', $$この車は新品も同然の状態だ。$$, $$このくるまはしんぴんもどうぜんのじょうたいだ。$$, $$Este carro está em estado praticamente de novo.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$ここまで来れば、合格した____。$$, $$Tendo chegado até aqui, já é praticamente uma aprovação.$$),
        (2, $$一度しか着ていないので、新品____。$$, $$Só usei uma vez, então é praticamente novo.$$),
        (3, $$あの二人は、もう夫婦____。$$, $$Aqueles dois já são praticamente marido e mulher.$$),
        (4, $$十点差なら、勝負は決まった____。$$, $$Com dez pontos de diferença, a partida está praticamente decidida.$$),
        (5, $$このパソコンは壊れている____。$$, $$Este computador está praticamente quebrado.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-76', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$も同然だ$$),
        (1, $$も同然です$$),
        (2, $$も同然だ$$),
        (2, $$も同然です$$),
        (3, $$も同然だ$$),
        (3, $$も同然です$$),
        (4, $$も同然だ$$),
        (4, $$も同然です$$),
        (5, $$も同然だ$$),
        (5, $$も同然です$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
