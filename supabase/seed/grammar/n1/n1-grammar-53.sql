-- n1-grammar-53 — かつて
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-53',
    'grammar',
    'N1',
    $$かつて$$,
    $$katsute$$,
    $$Antigamente / Outrora / Uma vez$$,
    $$かつて indica algo que aconteceu ou existia no passado, mas que não existe mais ou mudou. Equivale a "antigamente" ou "outrora".

Por exemplo, "antigamente, aqui havia um castelo". É mais formal que 昔 ou 以前.

Com uma forma negativa, かつてない significa "sem precedentes" ou "nunca antes visto".$$,
    $$Expressões comuns são かつての, como かつての友人, e いまだかつてない, "nunca antes".

É usada principalmente na escrita e em falas formais.$$,
    $$かつて + Frase (passado)
かつてない + Substantivo (sem precedentes)$$,
    $$かつて$$,
    $$かつて|嘗て$$,
    ARRAY['かつて']::text[],
    ARRAY['かつて', 'かつての', 'かつてない']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-53', $$ここにはかつて大きな城があった。$$, $$ここにはかつておおきなしろがあった。$$, $$Antigamente, aqui havia um grande castelo.$$),
    ('n1-grammar-53', $$かつての友人に、偶然再会した。$$, $$かつてのゆうじんに、ぐうぜんさいかいした。$$, $$Reencontrei por acaso um antigo amigo.$$),
    ('n1-grammar-53', $$これはかつてない大きな災害だ。$$, $$これはかつてないおおきなさいがいだ。$$, $$Este é um desastre de proporções sem precedentes.$$),
    ('n1-grammar-53', $$彼はかつて有名な歌手だった。$$, $$かれはかつてゆうめいなかしゅだった。$$, $$Ele foi, outrora, um cantor famoso.$$),
    ('n1-grammar-53', $$かつてこの町は工業で栄えていた。$$, $$かつてこのまちはこうぎょうでさかえていた。$$, $$Antigamente, esta cidade prosperava com a indústria.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$私は____この町に住んでいた。$$, $$Eu morei nesta cidade antigamente.$$),
        (2, $$____ない規模の大会が開かれた。$$, $$Foi realizado um campeonato de proporções sem precedentes.$$),
        (3, $$____の恋人から手紙が届いた。$$, $$Chegou uma carta de um antigo namorado.$$),
        (4, $$この地域は____海だった。$$, $$Esta região foi mar, outrora.$$),
        (5, $$いまだ____経験したことのない暑さだ。$$, $$É um calor que nunca antes experimentei.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-53', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$かつて$$),
        (2, $$かつて$$),
        (3, $$かつて$$),
        (4, $$かつて$$),
        (5, $$かつて$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
