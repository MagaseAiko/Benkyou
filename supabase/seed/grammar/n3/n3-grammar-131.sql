-- n3-grammar-131 — 〜ている場合じゃない
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n3-grammar-131',
    'grammar',
    'N3',
    $$〜ている場合じゃない$$,
    $$te iru baai ja nai$$,
    $$Não é hora de / Não dá para ficar$$,
    $$ている場合じゃない é usado para dizer que, na situação atual, não é momento de fazer certa coisa, porque há algo mais urgente ou importante. Equivale a "não é hora de..." ou "não dá para ficar...".

Ele junta a forma ている com 場合 (situação, ocasião) e じゃない (não é). A ideia literal é "não é situação de estar fazendo isso".

O tom é de urgência, alerta ou repreensão, para si mesmo ou para outra pessoa. Por exemplo, "amanhã tem prova, não é hora de ficar brincando" ou "não adianta chorar, temos que fazer alguma coisa".

A forma ている場合ではない é mais formal, e てる場合じゃない é a versão falada.$$,
    $$Com substantivos, a estrutura também existe: 今はけんかしている場合じゃない ou 今は冗談を言う場合じゃない.

É muito comum em mangás e animes, em momentos de tensão.

Às vezes, a frase vem seguida do que realmente deve ser feito, como 早く〜しないと.$$,
    $$Verbo na forma ている + 場合じゃない
Verbo na forma ている + 場合ではない (formal)
Verbo na forma てる + 場合じゃない (fala)$$,
    $$ている場合じゃない$$,
    $$ている場合じゃない|ている場合ではない|てる場合じゃない|でいる場合じゃない|でいる場合ではない|ている場合ではありません$$,
    ARRAY['ている', '場合', 'じゃない']::text[],
    ARRAY['ている場合じゃない', 'ている場合ではない', 'てる場合じゃない']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n3-grammar-131', $$明日は試験だから、遊んでいる場合じゃない。$$, $$あしたはしけんだから、あそんでいるばあいじゃない。$$, $$Amanhã tem prova, então não é hora de ficar brincando.$$),
    ('n3-grammar-131', $$寝ている場合ではない。早く準備しなさい。$$, $$ねているばあいではない。はやくじゅんびしなさい。$$, $$Não é hora de dormir. Vá se preparar logo.$$),
    ('n3-grammar-131', $$泣いている場合じゃない。何とかしないと。$$, $$ないているばあいじゃない。なんとかしないと。$$, $$Não dá para ficar chorando. Temos que fazer alguma coisa.$$),
    ('n3-grammar-131', $$みんな真剣なんだから、今は笑っている場合ではありません。$$, $$みんなしんけんなんだから、いまはわらっているばあいではありません。$$, $$Todos estão sérios, então agora não é hora de rir.$$),
    ('n3-grammar-131', $$宿題が終わっていないのに、のんびりテレビを見ている場合じゃないよ。$$, $$しゅくだいがおわっていないのに、のんびりテレビをみているばあいじゃないよ。$$, $$Você nem terminou a lição, não é hora de ficar vendo TV tranquilo.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$締め切りは明日だ。休ん____。$$, $$O prazo é amanhã. Não é hora de descansar.$$),
        (2, $$電車が来る！のんびり話し____。$$, $$O trem está chegando! Não dá para ficar conversando com calma.$$),
        (3, $$火事だ！写真を撮っ____。$$, $$É um incêndio! Não é hora de tirar fotos.$$),
        (4, $$試験が近いから、ゲームをし____。$$, $$A prova está chegando, então não é hora de jogar videogame.$$),
        (5, $$もう時間がない。迷っ____。$$, $$Não temos mais tempo. Não dá para ficar em dúvida.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n3-grammar-131', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$でいる場合じゃない$$),
        (1, $$でいる場合ではない$$),
        (2, $$ている場合じゃない$$),
        (2, $$ている場合ではない$$),
        (3, $$ている場合じゃない$$),
        (3, $$ている場合ではない$$),
        (4, $$ている場合じゃない$$),
        (4, $$ている場合ではない$$),
        (5, $$ている場合じゃない$$),
        (5, $$ている場合ではない$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
