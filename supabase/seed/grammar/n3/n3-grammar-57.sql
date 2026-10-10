-- n3-grammar-57 — めったに〜ない
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n3-grammar-57',
    'grammar',
    'N3',
    $$めったに〜ない$$,
    $$metta ni ~ nai$$,
    $$Raramente / Quase nunca$$,
    $$めったに〜ない é usado para dizer que algo acontece muito raramente. Equivale a "raramente" ou "quase nunca".

めったに vem antes do verbo, e o verbo fica sempre na forma negativa. Sem a negação, a frase fica errada.

Ele indica uma frequência muito baixa, menor do que あまり〜ない ("não muito"). Por exemplo, "meu pai quase nunca fica bravo" ou "aqui quase nunca neva".

A expressão めったにない também é usada para dizer que algo é raro e valioso, como uma oportunidade que quase nunca aparece.$$,
    $$Comparando a frequência: いつも (sempre) > よく (com frequência) > 時々 (às vezes) > あまり〜ない (não muito) > めったに〜ない (quase nunca) > 全然〜ない (nunca).

めったにないチャンス (uma oportunidade rara) é uma expressão muito comum.

O kanji 滅多 é pouco usado no dia a dia; o mais comum é escrever em hiragana.$$,
    $$めったに + Verbo na forma negativa
めったに + ない (raro, difícil de acontecer)
めったにない + Substantivo (algo raro)

Escrita: めったに / 滅多に$$,
    $$めったに$$,
    $$めったに|滅多に$$,
    ARRAY['めったに', 'ない']::text[],
    ARRAY['めったに', '滅多に']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n3-grammar-57', $$父はめったに怒らない。$$, $$ちちはめったにおこらない。$$, $$Meu pai quase nunca fica bravo.$$),
    ('n3-grammar-57', $$この辺では、めったに雪が降りません。$$, $$このへんでは、めったにゆきがふりません。$$, $$Por aqui, raramente neva.$$),
    ('n3-grammar-57', $$彼女はめったに会社を休まない。$$, $$かのじょはめったにかいしゃをやすまない。$$, $$Ela quase nunca falta ao trabalho.$$),
    ('n3-grammar-57', $$こんなチャンスはめったにない。$$, $$こんなチャンスはめったにない。$$, $$Uma oportunidade dessas é muito rara.$$),
    ('n3-grammar-57', $$最近は忙しくて、めったに映画を見に行かない。$$, $$さいきんはいそがしくて、めったにえいがをみにいかない。$$, $$Ultimamente estou ocupado e quase nunca vou ao cinema.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$兄は____電話をくれない。$$, $$Meu irmão mais velho quase nunca me liga.$$),
        (2, $$この店は____休まない。$$, $$Esta loja quase nunca fecha.$$),
        (3, $$彼は体が強くて、____病気にならない。$$, $$Ele é muito saudável e quase nunca fica doente.$$),
        (4, $$東京では、____星が見えない。$$, $$Em Tóquio, quase nunca dá para ver estrelas.$$),
        (5, $$私は____お酒を飲みません。$$, $$Eu raramente bebo álcool.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n3-grammar-57', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$めったに$$),
        (2, $$めったに$$),
        (3, $$めったに$$),
        (4, $$めったに$$),
        (5, $$めったに$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
