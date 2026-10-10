-- n4-grammar-117 — 〜って
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n4-grammar-117',
    'grammar',
    'N4',
    $$〜って$$,
    $$tte$$,
    $$Dizem que / Chamado / Quanto a / Que$$,
    $$って é uma partícula muito comum na fala casual. Ela substitui várias formas mais longas e tem alguns usos principais.

• Citar o que alguém disse: substitui と (de と言う) e também そうだ, como em "ele disse que não vem" ou "dizem que...".
• Dar nome: substitui という, como em "uma loja chamada Sakura".
• Apresentar um tema: substitui は, com um tom de "falando de..." ou "esse tal de...", como em "japonês é difícil, né?".
• Perguntar o significado de algo: como em "o que é ramen?".

Por ser informal, って é usado com amigos, família e em conversas do dia a dia. Em situações formais, usa-se a forma completa, como と, という ou は.$$,
    $$No final da frase, って sozinho já indica que a informação foi ouvida de alguém: 来ないって = "disse que não vem".

Às vezes って aparece duplicado como ってば, para insistir ou mostrar impaciência, num uso mais avançado.

Em mensagens de texto e redes sociais, って é extremamente frequente.$$,
    $$Frase + って (dizem que / disse que)
Frase + って + 言う / 聞く (citação)
Nome + って + Substantivo (chamado...)
Substantivo + って + Comentário (tema)
〜って + 何ですか (o que é...?)$$,
    $$って$$,
    $$って$$,
    ARRAY['って']::text[],
    ARRAY['って']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n4-grammar-117', $$田中さん、明日来ないって。$$, $$たなかさん、あしたこないって。$$, $$O Tanaka disse que não vem amanhã.$$),
    ('n4-grammar-117', $$「さくら」って店、知ってる？$$, $$「さくら」ってみせ、しってる？$$, $$Você conhece uma loja chamada "Sakura"?$$),
    ('n4-grammar-117', $$日本語って難しいね。$$, $$にほんごってむずかしいね。$$, $$Japonês é difícil, né?$$),
    ('n4-grammar-117', $$先生が明日テストがあるって言ってたよ。$$, $$せんせいがあしたテストがあるっていってたよ。$$, $$O professor disse que amanhã tem prova.$$),
    ('n4-grammar-117', $$すみません、「ラーメン」って何ですか。$$, $$すみません、「ラーメン」ってなんですか。$$, $$Com licença, o que é "ramen"?$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$彼女、来月結婚する____。$$, $$Ela disse que vai se casar no mês que vem.$$),
        (2, $$「すき焼き」____何ですか。$$, $$O que é "sukiyaki"?$$),
        (3, $$母が早く帰ってきなさい____言ってた。$$, $$Minha mãe disse para eu voltar logo.$$),
        (4, $$東京____人が多いですね。$$, $$Tóquio tem muita gente, né?$$),
        (5, $$「ポチ」____名前の犬を飼っています。$$, $$Tenho um cachorro chamado "Pochi".$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n4-grammar-117', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$って$$),
        (2, $$って$$),
        (3, $$って$$),
        (4, $$って$$),
        (5, $$って$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
