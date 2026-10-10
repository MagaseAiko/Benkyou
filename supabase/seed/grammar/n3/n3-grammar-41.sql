-- n3-grammar-41 — 決して〜ない
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n3-grammar-41',
    'grammar',
    'N3',
    $$決して〜ない$$,
    $$kesshite ~ nai$$,
    $$Nunca / Jamais / De forma alguma$$,
    $$決して〜ない é usado para fazer uma negação muito forte e firme. Equivale a "nunca", "jamais" ou "de forma alguma".

決して vem antes do verbo ou do adjetivo, e a frase fica sempre na forma negativa. Sem a negação, a frase fica errada.

Ele é usado para promessas sérias ("nunca vou esquecer"), descrições firmes de caráter ("ele jamais mente"), pedidos enfáticos ("de forma alguma vá sozinho") e para corrigir uma impressão ("não é de forma alguma fácil").

O tom é sério e um pouco formal, mais forte que 全然〜ない ou 絶対に〜ない em algumas situações.$$,
    $$絶対に〜ない também expressa negação forte, mas 絶対に pode aparecer em frases afirmativas, enquanto 決して só aparece com negação.

決して〜ない é comum em promessas, juramentos e textos formais.

Para suavizar uma avaliação negativa, como dizer que algo não é fácil, 決して簡単ではない soa educado e firme ao mesmo tempo.$$,
    $$決して + Verbo na forma negativa
決して + Adjetivo い sem い + くない
決して + Adjetivo な / Substantivo + ではない
決して + Verbo ないでください (pedido forte)

Escrita: 決して / けっして$$,
    $$決して$$,
    $$決して|けっして$$,
    ARRAY['決して', 'ない']::text[],
    ARRAY['決して', 'けっして']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n3-grammar-41', $$このご恩は決して忘れません。$$, $$このごおんはけっしてわすれません。$$, $$Jamais vou esquecer esse favor.$$),
    ('n3-grammar-41', $$彼は決してうそをつかない人だ。$$, $$かれはけっしてうそをつかないひとだ。$$, $$Ele é uma pessoa que jamais mente.$$),
    ('n3-grammar-41', $$つらくても、決してあきらめないでください。$$, $$つらくても、けっしてあきらめないでください。$$, $$Mesmo que seja difícil, nunca desista.$$),
    ('n3-grammar-41', $$この仕事は決して簡単ではない。$$, $$このしごとはけっしてかんたんではない。$$, $$Este trabalho não é nada fácil.$$),
    ('n3-grammar-41', $$あなたのしたことを、私は決して許さない。$$, $$あなたのしたことを、わたしはけっしてゆるさない。$$, $$Jamais vou perdoar o que você fez.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$彼女の優しさは____忘れられない。$$, $$Jamais vou conseguir esquecer a gentileza dela.$$),
        (2, $$危ないから、____一人で行かないでください。$$, $$É perigoso, então de forma alguma vá sozinho.$$),
        (3, $$私は____あなたを裏切りません。$$, $$Eu jamais vou trair você.$$),
        (4, $$心配しないで。日本語は____難しくないですよ。$$, $$Não se preocupe. O japonês não é nada difícil.$$),
        (5, $$この秘密は____誰にも言わない。$$, $$Jamais vou contar este segredo a ninguém.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n3-grammar-41', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$決して$$),
        (1, $$けっして$$),
        (2, $$決して$$),
        (2, $$けっして$$),
        (3, $$決して$$),
        (3, $$けっして$$),
        (4, $$決して$$),
        (4, $$けっして$$),
        (5, $$決して$$),
        (5, $$けっして$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
