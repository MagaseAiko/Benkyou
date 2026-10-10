-- n5-grammar-90 — 〜ができる
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n5-grammar-90',
    'grammar',
    'N5',
    $$〜ができる$$,
    $$ga dekiru$$,
    $$Saber (fazer) / Conseguir / Poder$$,
    $$ができる é usado para dizer que alguém sabe fazer algo, consegue fazer algo ou que algo pode ser feito em um lugar. Equivale a "saber", "conseguir" ou "poder".

A coisa que se sabe ou se pode fazer é marcada com が, e não com を. Isso acontece porque できる indica uma capacidade ou possibilidade, e não uma ação direta.

Os usos mais comuns são:
• Habilidade: saber um idioma, um esporte, tocar um instrumento.
• Possibilidade: uma atividade que pode ser feita em um lugar.
• Surgimento: algo que foi criado, construído ou ficou pronto, como uma loja nova ou um prato que ficou pronto.

Com verbos, a estrutura é ことができる, que aparece no N4.$$,
    $$Quando できる indica que algo surgiu ou foi construído, ele não fala de habilidade. O contexto mostra qual é o sentido.

Para dizer "pronto!" quando algo fica pronto, como comida ou um trabalho, os japoneses dizem できた.

Para falar de habilidade com mais modéstia, também se usa 少しできます.$$,
    $$Substantivo + が + できる
Lugar + で(は) + Substantivo + が + できる

Educado: ができます
Negativo: ができない / ができません
Passado: ができた / ができました
Passado negativo: ができなかった / ができませんでした$$,
    $$できる$$,
    $$ができる|ができます|ができない|ができなかった|ができません|ができた|ができました$$,
    ARRAY['が', 'できる']::text[],
    ARRAY['ができる', 'ができます', 'ができない', 'ができません', 'ができた', 'ができました']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n5-grammar-90', $$私は英語ができます。$$, $$わたしはえいごができます。$$, $$Eu sei inglês.$$),
    ('n5-grammar-90', $$姉はピアノができる。$$, $$あねはピアノができる。$$, $$Minha irmã mais velha sabe tocar piano.$$),
    ('n5-grammar-90', $$弟はまだ料理ができません。$$, $$おとうとはまだりょうりができません。$$, $$Meu irmão mais novo ainda não sabe cozinhar.$$),
    ('n5-grammar-90', $$このホテルでは、テニスができます。$$, $$このホテルでは、テニスができます。$$, $$Neste hotel, dá para jogar tênis.$$),
    ('n5-grammar-90', $$駅の前に新しい店ができました。$$, $$えきのまえにあたらしいみせができました。$$, $$Abriu uma loja nova em frente à estação.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$田中さんは中国語____。$$, $$O Tanaka sabe chinês.$$),
        (2, $$私は水泳____。$$, $$Eu não sei nadar.$$),
        (3, $$この公園ではバーベキュー____か。$$, $$Dá para fazer churrasco neste parque?$$),
        (4, $$子供のころは、スキー____。$$, $$Quando era criança, eu não sabia esquiar.$$),
        (5, $$先月、家の近くに大きいスーパー____。$$, $$Mês passado, abriu um supermercado grande perto de casa.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n5-grammar-90', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$ができます$$),
        (1, $$ができる$$),
        (2, $$ができません$$),
        (2, $$ができない$$),
        (3, $$ができます$$),
        (4, $$ができませんでした$$),
        (4, $$ができなかった$$),
        (5, $$ができました$$),
        (5, $$ができた$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
