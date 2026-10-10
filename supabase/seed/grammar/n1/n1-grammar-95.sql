-- n1-grammar-95 — なんという / なんと / なんて
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-95',
    'grammar',
    'N1',
    $$なんという / なんと / なんて$$,
    $$nanto iu / nanto / nante$$,
    $$Que / Como / Mas que$$,
    $$なんという, なんと e なんて são usadas para expressar emoção forte, como surpresa, admiração ou indignação. Equivalem a "que...!" ou "como...!".

なんという vem antes de substantivos, como "que dia lindo!". なんと vem antes de adjetivos ou frases, como "como é bonito!". なんて é a forma mais coloquial.

Muitas vezes a frase termina com だろう ou のだろう.$$,
    $$なんと também pode ser usada para mostrar surpresa com um número ou fato, como "nada menos que...".

なんて no fim de uma expressão tem outro uso, de desprezo ou surpresa, como 勉強なんて.$$,
    $$なんという + Substantivo + だろう
なんと + Adjetivo + Substantivo + だろう
なんて + Adjetivo + んだろう$$,
    $$なんという$$,
    $$なんという|なんと|なんて|何という|何と$$,
    ARRAY['なん', 'という']::text[],
    ARRAY['なんという', 'なんと', 'なんて']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-95', $$なんという美しい景色だろう。$$, $$なんといううつくしいけしきだろう。$$, $$Que paisagem linda!$$),
    ('n1-grammar-95', $$なんとかわいい子供だろう。$$, $$なんとかわいいこどもだろう。$$, $$Que criança fofa!$$),
    ('n1-grammar-95', $$なんて素敵なプレゼントなんだろう。$$, $$なんてすてきなプレゼントなんだろう。$$, $$Que presente maravilhoso!$$),
    ('n1-grammar-95', $$なんということをしてくれたんだ。$$, $$なんということをしてくれたんだ。$$, $$Mas que coisa você fez!$$),
    ('n1-grammar-95', $$彼はなんと百歳まで生きた。$$, $$かれはなんとひゃくさいまでいきた。$$, $$Ele viveu até nada menos que cem anos.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$____ひどい話だろう。$$, $$Que história horrível!$$),
        (2, $$____きれいな花なんだろう。$$, $$Que flor bonita!$$),
        (3, $$____ことだ、財布をなくした。$$, $$Mas que coisa, perdi a carteira.$$),
        (4, $$彼女は____十か国語も話せる。$$, $$Ela fala nada menos que dez línguas.$$),
        (5, $$____優しい人なんだろう。$$, $$Que pessoa gentil!$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-95', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$なんという$$),
        (1, $$なんと$$),
        (1, $$なんて$$),
        (2, $$なんと$$),
        (2, $$なんて$$),
        (3, $$なんという$$),
        (4, $$なんと$$),
        (5, $$なんと$$),
        (5, $$なんて$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
