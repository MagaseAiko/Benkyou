-- n1-grammar-59 — 〜こそすれ
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-59',
    'grammar',
    'N1',
    $$〜こそすれ$$,
    $$koso sure$$,
    $$Pelo contrário / Só se for para / Muito pelo contrário$$,
    $$こそすれ indica que algo pode acontecer de uma forma, mas nunca da forma oposta. Equivale a "pelo contrário" ou "só se for para...".

A primeira parte mostra o que é possível, e a segunda nega fortemente o oposto. Por exemplo, "se ele ajudou, eu só tenho a agradecer, nunca a reclamar".

É uma expressão formal e literária.$$,
    $$Expressões comuns são 感謝こそすれ, 喜びこそすれ e 増えこそすれ減ることはない.

A segunda parte costuma ser ことはない ou ない.$$,
    $$Verbo (forma ます sem ます) + こそすれ + Verbo oposto (forma ない)
Substantivo (ação) + こそすれ + Frase negativa$$,
    $$こそすれ$$,
    $$こそすれ$$,
    ARRAY['こそ', 'すれ']::text[],
    ARRAY['こそすれ']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-59', $$彼には感謝こそすれ、恨むことはない。$$, $$かれにはかんしゃこそすれ、うらむことはない。$$, $$Por ele só tenho a agradecer, nunca a guardar rancor.$$),
    ('n1-grammar-59', $$この問題は悪化こそすれ、よくなることはない。$$, $$このもんだいはあっかこそすれ、よくなることはない。$$, $$Este problema só pode piorar, nunca melhorar.$$),
    ('n1-grammar-59', $$値段は上がりこそすれ、下がることはないだろう。$$, $$ねだんはあがりこそすれ、さがることはないだろう。$$, $$O preço só deve subir, nunca baixar.$$),
    ('n1-grammar-59', $$母は喜びこそすれ、反対はしないだろう。$$, $$はははよろこびこそすれ、はんたいはしないだろう。$$, $$Minha mãe só vai ficar feliz, nunca contra.$$),
    ('n1-grammar-59', $$彼の努力は尊敬こそすれ、批判されるものではない。$$, $$かれのどりょくはそんけいこそすれ、ひはんされるものではない。$$, $$O esforço dele merece respeito, não críticas.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$あなたには感謝し____、怒ってなどいない。$$, $$Só tenho a agradecer a você, não estou bravo de jeito nenhum.$$),
        (2, $$人口は減り____、増えることはないだろう。$$, $$A população só deve diminuir, nunca aumentar.$$),
        (3, $$彼の態度は、人を怒らせ____、喜ばせることはない。$$, $$A atitude dele só irrita as pessoas, nunca as agrada.$$),
        (4, $$この経験は役に立ち____、無駄になることはない。$$, $$Esta experiência só vai ser útil, nunca um desperdício.$$),
        (5, $$彼女の言葉は、励まし____、傷つけるものではなかった。$$, $$As palavras dela só encorajavam, nunca magoavam.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-59', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$こそすれ$$),
        (2, $$こそすれ$$),
        (3, $$こそすれ$$),
        (4, $$こそすれ$$),
        (5, $$こそすれ$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
