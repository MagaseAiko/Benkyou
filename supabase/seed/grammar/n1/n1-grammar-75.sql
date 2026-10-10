-- n1-grammar-75 — 〜めく
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-75',
    'grammar',
    'N1',
    $$〜めく$$,
    $$meku$$,
    $$Ter ar de / Parecer / Ter um toque de$$,
    $$めく indica que algo começa a mostrar características ou sinais de algo. Equivale a "ter ar de" ou "parecer".

Por exemplo, 春めく significa "ficar com ar de primavera", e 皮肉めいた significa "com um toque de ironia".

As formas めいた e めいて são as mais usadas.$$,
    $$Combinações comuns são 春めく, 秋めく, 冗談めかす, 皮肉めいた, 謎めいた e 説教めいた.

É parecido com らしい e っぽい.$$,
    $$Substantivo + めく
Substantivo + めいた + Substantivo
Substantivo + めいて + Verbo$$,
    $$めく$$,
    $$めく|めいた|めいて|めかして$$,
    ARRAY['めく']::text[],
    ARRAY['めく', 'めいた', 'めいて', 'めかして']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-75', $$三月になって、だいぶ春めいてきた。$$, $$さんがつになって、だいぶはるめいてきた。$$, $$Com a chegada de março, o tempo ficou bem com ar de primavera.$$),
    ('n1-grammar-75', $$彼は皮肉めいたことを言った。$$, $$かれはひにくめいたことをいった。$$, $$Ele disse algo com um toque de ironia.$$),
    ('n1-grammar-75', $$謎めいた女性が店に入ってきた。$$, $$なぞめいたじょせいがみせにはいってきた。$$, $$Uma mulher misteriosa entrou na loja.$$),
    ('n1-grammar-75', $$冗談めかして本音を言った。$$, $$じょうだんめかしてほんねをいった。$$, $$Disse o que realmente pensava em tom de brincadeira.$$),
    ('n1-grammar-75', $$説教めいた話はやめてほしい。$$, $$せっきょうめいたはなしはやめてほしい。$$, $$Queria que parasse com esses discursos com ar de sermão.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$木の葉が色づいて、すっかり秋____きた。$$, $$As folhas mudaram de cor e o tempo ficou com ar de outono.$$),
        (2, $$彼女は謎____笑顔を見せた。$$, $$Ela deu um sorriso misterioso.$$),
        (3, $$彼の言葉には、脅し____響きがあった。$$, $$As palavras dele tinham um tom de ameaça.$$),
        (4, $$父は冗談____、本当のことを言った。$$, $$Meu pai disse a verdade em tom de brincadeira.$$),
        (5, $$言い訳____ことは言いたくない。$$, $$Não quero dizer nada com cara de desculpa.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-75', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$めいて$$),
        (2, $$めいた$$),
        (3, $$めいた$$),
        (4, $$めかして$$),
        (5, $$めいた$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
