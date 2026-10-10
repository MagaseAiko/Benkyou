-- n4-grammar-05 — 〜ば
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n4-grammar-05',
    'grammar',
    'N4',
    $$〜ば$$,
    $$ba$$,
    $$Se / Caso / Quando$$,
    $$ば é a forma condicional que expressa "se". Ela mostra que, se uma condição for cumprida, um resultado acontece.

A ideia principal é de condição necessária: para que o resultado aconteça, é preciso que a primeira parte seja verdade. Por isso, ば é muito usado para conselhos, regras gerais, consequências naturais e hipóteses.

A forma muda conforme o tipo de palavra. Nos verbos, o último som muda de "u" para "e" e recebe ば. Nos adjetivos い, troca-se い por ければ. Nos negativos, ない vira なければ. Para substantivos e adjetivos な, usa-se であれば ou なら.

Em geral, quando a primeira parte é afirmativa e descreve uma ação de quem fala, a segunda parte não costuma ser uma ordem ou pedido. Essa restrição não vale quando a primeira parte é um estado, como ある, いる ou adjetivos.$$,
    $$A expressão どうすればいいですか é muito usada para pedir conselho: "o que eu devo fazer?".

O japonês tem várias formas de "se": ば, たら, と e なら. ば destaca a condição; たら é a mais versátil na conversa; と indica consequência automática; なら responde a algo que o outro disse.

A forma よければ, de いい, aparece muito em ofertas educadas, como "se quiser...".$$,
    $$Verbo grupo 1: último som "u" → "e" + ば (行く → 行けば / 飲む → 飲めば)
Verbo grupo 2: tire る + れば (食べる → 食べれば)
Irregulares: する → すれば / 来る → 来れば (くれば)
Adjetivo い: tire い + ければ (安い → 安ければ / いい → よければ)
Negativo: ない → なければ
Substantivo / Adjetivo な: + であれば / なら$$,
    $$ば$$,
    $$えば|けば|げば|せば|てば|べば|めば|れば$$,
    ARRAY['ば']::text[],
    ARRAY['ば', 'れば', 'ければ', 'なければ']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n4-grammar-05', $$時間があれば、手伝います。$$, $$じかんがあれば、てつだいます。$$, $$Se eu tiver tempo, ajudo.$$),
    ('n4-grammar-05', $$安ければ、買います。$$, $$やすければ、かいます。$$, $$Se for barato, eu compro.$$),
    ('n4-grammar-05', $$この薬を飲めば、すぐ治りますよ。$$, $$このくすりをのめば、すぐなおりますよ。$$, $$Se tomar este remédio, você vai melhorar logo.$$),
    ('n4-grammar-05', $$急げば、間に合うと思います。$$, $$いそげば、まにあうとおもいます。$$, $$Se nos apressarmos, acho que chegamos a tempo.$$),
    ('n4-grammar-05', $$雨が降らなければ、ピクニックに行きましょう。$$, $$あめがふらなければ、ピクニックにいきましょう。$$, $$Se não chover, vamos fazer um piquenique.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$お金があ____、旅行に行きたいです。$$, $$Se eu tivesse dinheiro, queria viajar.$$),
        (2, $$天気がよけ____、ここから山が見えます。$$, $$Se o tempo estiver bom, dá para ver a montanha daqui.$$),
        (3, $$この道をまっすぐ行____、駅に着きます。$$, $$Se seguir reto por esta rua, você chega à estação.$$),
        (4, $$毎日練習す____、上手になりますよ。$$, $$Se praticar todo dia, você vai ficar bom.$$),
        (5, $$わからな____、先生に聞いてください。$$, $$Se não entender, pergunte ao professor.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n4-grammar-05', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$れば$$),
        (2, $$れば$$),
        (3, $$けば$$),
        (4, $$れば$$),
        (5, $$ければ$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
