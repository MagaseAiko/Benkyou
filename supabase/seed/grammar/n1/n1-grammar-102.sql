-- n1-grammar-102 — 〜なり〜なり
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-102',
    'grammar',
    'N1',
    $$〜なり〜なり$$,
    $$nari ~ nari$$,
    $$Ou... ou / Seja... seja / Tanto faz se$$,
    $$なり〜なり serve para apresentar exemplos de opções possíveis, deixando a escolha livre. Equivale a "ou... ou" ou "seja... seja".

Muitas vezes a pessoa sugere ou pede que o outro faça uma das opções, ou algo parecido. Por exemplo, "pergunte ao professor ou procure no dicionário".

A segunda parte costuma ser um conselho, um pedido ou uma ordem.$$,
    $$Não se usa para falar de fatos passados.

É parecido com か〜か e とか〜とか, mas なり〜なり é usado para dar sugestões.

Não se usa com superiores, porque soa como uma ordem.$$,
    $$Substantivo + なり + Substantivo + なり
Verbo (forma dicionário) + なり + Verbo (forma dicionário) + なり$$,
    $$なり〜なり$$,
    $$なり$$,
    ARRAY['なり']::text[],
    ARRAY['なり〜なり']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-102', $$わからないことは、先生に聞くなり辞書で調べるなりしなさい。$$, $$わからないことは、せんせいにきくなりじしょでしらべるなりしなさい。$$, $$O que não souber, pergunte ao professor ou procure no dicionário.$$),
    ('n1-grammar-102', $$電話なりメールなりで連絡してください。$$, $$でんわなりメールなりでれんらくしてください。$$, $$Entre em contato por telefone ou por e-mail.$$),
    ('n1-grammar-102', $$休みの日は、本を読むなり映画を見るなり、好きに過ごしたい。$$, $$やすみのひは、ほんをよむなりえいがをみるなり、すきにすごしたい。$$, $$Nos dias de folga, quero passar o tempo do meu jeito, lendo ou vendo filmes.$$),
    ('n1-grammar-102', $$困ったら、親なり友達なりに相談したほうがいい。$$, $$こまったら、おやなりともだちなりにそうだんしたほうがいい。$$, $$Se estiver em apuros, é melhor conversar com seus pais ou amigos.$$),
    ('n1-grammar-102', $$煮るなり焼くなり、好きにしてくれ。$$, $$にるなりやくなり、すきにしてくれ。$$, $$Cozinhe ou asse, faça o que quiser.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$暑いなら、窓を開ける____エアコンをつけるなりしてください。$$, $$Se está quente, abra a janela ou ligue o ar-condicionado.$$),
        (2, $$コーヒーなり紅茶____、好きなものを飲んでください。$$, $$Café ou chá, beba o que preferir.$$),
        (3, $$行けないなら、手紙を書くなり電話する____すればいい。$$, $$Se não puder ir, basta escrever uma carta ou ligar.$$),
        (4, $$パン____おにぎりなり、何か食べておきなさい。$$, $$Pão ou bolinho de arroz, coma alguma coisa.$$),
        (5, $$自分で調べるなり、人に聞く____しなさい。$$, $$Pesquise por conta própria ou pergunte a alguém.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-102', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$なり$$),
        (2, $$なり$$),
        (3, $$なり$$),
        (4, $$なり$$),
        (5, $$なり$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
