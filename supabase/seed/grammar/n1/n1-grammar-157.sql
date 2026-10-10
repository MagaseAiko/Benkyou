-- n1-grammar-157 — 〜を境に
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-157',
    'grammar',
    'N1',
    $$〜を境に$$,
    $$wo sakai ni$$,
    $$A partir de / Desde / Tendo como marco$$,
    $$を境に indica que um acontecimento ou momento marca uma mudança clara entre antes e depois. Equivale a "a partir de" ou "tendo como marco".

A segunda parte mostra que a situação mudou muito depois daquele ponto. Por exemplo, "a partir daquele dia, ele mudou completamente".

É uma expressão comum tanto na fala quanto na escrita.$$,
    $$É parecido com をきっかけに, mas を境に destaca a divisão clara entre o antes e o depois.

Expressões comuns são あの日を境に, それを境に e 結婚を境に.$$,
    $$Substantivo + を境に / を境として
Verbo (forma simples) + の + を境に$$,
    $$を境に$$,
    $$を境に|を境として|をさかいに$$,
    ARRAY['を', '境', 'に']::text[],
    ARRAY['を境に', 'を境として']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-157', $$あの日を境に、彼は人が変わったようになった。$$, $$あのひをさかいに、かれはひとがかわったようになった。$$, $$A partir daquele dia, ele parecia outra pessoa.$$),
    ('n1-grammar-157', $$結婚を境に、生活が大きく変わった。$$, $$けっこんをさかいに、せいかつがおおきくかわった。$$, $$A partir do casamento, a vida mudou muito.$$),
    ('n1-grammar-157', $$十月を境として、急に寒くなった。$$, $$じゅうがつをさかいとして、きゅうにさむくなった。$$, $$A partir de outubro, esfriou de repente.$$),
    ('n1-grammar-157', $$その事件を境に、町の雰囲気が変わった。$$, $$そのじけんをさかいに、まちのふんいきがかわった。$$, $$A partir daquele incidente, o clima da cidade mudou.$$),
    ('n1-grammar-157', $$病気をしたのを境に、健康に気をつけるようになった。$$, $$びょうきをしたのをさかいに、けんこうにきをつけるようになった。$$, $$Desde que fiquei doente, passei a cuidar da saúde.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$この試合____、チームは強くなった。$$, $$A partir desta partida, o time ficou mais forte.$$),
        (2, $$その日____、彼女は笑わなくなった。$$, $$Desde aquele dia, ela parou de sorrir.$$),
        (3, $$四十歳____、体力が落ちてきた。$$, $$A partir dos quarenta anos, minha resistência física começou a cair.$$),
        (4, $$社長が代わったの____、会社の方針が変わった。$$, $$A partir da troca de presidente, a política da empresa mudou.$$),
        (5, $$戦争____、人々の生活は一変した。$$, $$A partir da guerra, a vida das pessoas mudou completamente.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-157', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$を境に$$),
        (1, $$を境として$$),
        (2, $$を境に$$),
        (2, $$を境として$$),
        (3, $$を境に$$),
        (3, $$を境として$$),
        (4, $$を境に$$),
        (4, $$を境として$$),
        (5, $$を境に$$),
        (5, $$を境として$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
