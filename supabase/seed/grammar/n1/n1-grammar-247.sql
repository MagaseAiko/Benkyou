-- n1-grammar-247 — 〜ずくめ
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-247',
    'grammar',
    'N1',
    $$〜ずくめ$$,
    $$zukume$$,
    $$Só / Cheio de / Repleto de$$,
    $$ずくめ indica que algo está completamente cheio de uma mesma coisa, ou que só há aquilo. Equivale a "só" ou "repleto de".

Pode ser usado com cores, como "todo de preto", ou com situações, como "só coisas boas" ou "repleto de regras".

É uma expressão um pouco literária.$$,
    $$Expressões comuns são 黒ずくめ, いいことずくめ, 規則ずくめ e ごちそうずくめ.

É parecido com だらけ e ばかり, mas ずくめ pode ser usado com coisas boas.$$,
    $$Substantivo + ずくめ
Substantivo + ずくめの + Substantivo$$,
    $$ずくめ$$,
    $$ずくめ$$,
    ARRAY['ずくめ']::text[],
    ARRAY['ずくめ', 'ずくめの']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-247', $$黒ずくめの男が店に入ってきた。$$, $$くろずくめのおとこがみせにはいってきた。$$, $$Um homem todo de preto entrou na loja.$$),
    ('n1-grammar-247', $$今年はいいことずくめの一年だった。$$, $$ことしはいいことずくめのいちねんだった。$$, $$Este ano foi cheio de coisas boas.$$),
    ('n1-grammar-247', $$この学校は規則ずくめで、自由がない。$$, $$このがっこうはきそくずくめで、じゆうがない。$$, $$Esta escola é repleta de regras, não há liberdade.$$),
    ('n1-grammar-247', $$結婚式は、ごちそうずくめだった。$$, $$けっこんしきは、ごちそうずくめだった。$$, $$O casamento foi repleto de banquetes.$$),
    ('n1-grammar-247', $$最近は失敗ずくめで、落ち込んでいる。$$, $$さいきんはしっぱいずくめで、おちこんでいる。$$, $$Ultimamente só tenho tido fracassos e estou desanimado.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$彼女はいつも白____の服を着ている。$$, $$Ela sempre usa roupas todas brancas.$$),
        (2, $$今日は朝からいいこと____だ。$$, $$Hoje, desde a manhã, só aconteceram coisas boas.$$),
        (3, $$この会社は規則____で、息が詰まる。$$, $$Esta empresa é cheia de regras, é sufocante.$$),
        (4, $$旅行中は、おいしいもの____だった。$$, $$Durante a viagem, só comi coisas gostosas.$$),
        (5, $$黒____の格好で、何だか怪しい。$$, $$Vestido todo de preto, parece meio suspeito.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-247', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$ずくめ$$),
        (2, $$ずくめ$$),
        (3, $$ずくめ$$),
        (4, $$ずくめ$$),
        (5, $$ずくめ$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
