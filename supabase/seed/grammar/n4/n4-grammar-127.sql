-- n4-grammar-127 — 〜ようにする
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n4-grammar-127',
    'grammar',
    'N4',
    $$〜ようにする$$,
    $$you ni suru$$,
    $$Procurar (fazer) / Tentar sempre / Fazer questão de$$,
    $$ようにする é usado para dizer que alguém se esforça para fazer, ou não fazer, algo. Equivale a "procurar fazer", "tentar sempre" ou "fazer questão de".

A ideia é de esforço consciente para criar ou manter um hábito, mesmo que nem sempre dê certo.

Na forma ようにしている, indica um hábito que a pessoa vem mantendo com esforço, como comer verdura todo dia ou usar a escada.

Na forma ようにしてください, é um pedido educado para que alguém tome cuidado ou se esforce, como "procure não se atrasar".

Com a forma ない, indica o esforço para evitar algo: ないようにする.$$,
    $$Compare: ことにする é uma decisão pontual; ようにする é um esforço contínuo para que algo aconteça.

ようにしてください é mais suave que てください, porque pede um esforço, e não uma ação imediata.

É uma estrutura muito comum para falar de cuidados com a saúde e de boas práticas.$$,
    $$Verbo na forma de dicionário + ようにする
Verbo na forma ない + ようにする

Hábito: ようにしている / ようにしています
Pedido: ようにしてください
Decisão: ようにします$$,
    $$ようにする$$,
    $$ようにする|ようにします|ようにしている|ようにしています|ようにして|ようにした|ようにしました$$,
    ARRAY['よう', 'に', 'する']::text[],
    ARRAY['ようにする', 'ようにしている', 'ようにしてください', 'ようにします']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n4-grammar-127', $$健康のために、毎日野菜を食べるようにしています。$$, $$けんこうのために、まいにちやさいをたべるようにしています。$$, $$Pela saúde, procuro comer verdura todo dia.$$),
    ('n4-grammar-127', $$夜遅くまでゲームをしないようにします。$$, $$よるおそくまでゲームをしないようにします。$$, $$Vou procurar não jogar videogame até tarde da noite.$$),
    ('n4-grammar-127', $$約束の時間に遅れないようにしてください。$$, $$やくそくのじかんにおくれないようにしてください。$$, $$Procure não se atrasar para o horário combinado.$$),
    ('n4-grammar-127', $$できるだけ階段を使うようにしている。$$, $$できるだけかいだんをつかうようにしている。$$, $$Procuro usar a escada sempre que possível.$$),
    ('n4-grammar-127', $$忘れないように、メモするようにしました。$$, $$わすれないように、メモするようにしました。$$, $$Para não esquecer, passei a anotar tudo.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$毎日三十分歩く____います。$$, $$Procuro caminhar trinta minutos todo dia.$$),
        (2, $$寝る前にスマホを見ない____。$$, $$Procuro não olhar o celular antes de dormir.$$),
        (3, $$明日は遅れない____ください。$$, $$Procure não se atrasar amanhã, por favor.$$),
        (4, $$健康のために、早く寝る____。$$, $$Pela saúde, procuro dormir cedo.$$),
        (5, $$わからない言葉は、すぐ辞書で調べる____。$$, $$Faço questão de procurar logo no dicionário as palavras que não entendo.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n4-grammar-127', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$ようにして$$),
        (2, $$ようにします$$),
        (2, $$ようにしている$$),
        (2, $$ようにしています$$),
        (3, $$ようにして$$),
        (4, $$ようにしています$$),
        (4, $$ようにしている$$),
        (5, $$ようにしています$$),
        (5, $$ようにしている$$),
        (5, $$ようにします$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
