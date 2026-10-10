-- n3-grammar-60 — もしも〜たら
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n3-grammar-60',
    'grammar',
    'N3',
    $$もしも〜たら$$,
    $$moshimo ~ tara$$,
    $$Se por acaso / Caso / Na hipótese de$$,
    $$もしも〜たら é usado para falar de uma hipótese, uma situação imaginada ou pouco provável. Equivale a "se por acaso", "caso" ou "na hipótese de".

もしも é uma forma mais enfática de もし. Ele fica no começo da frase e reforça que aquela condição é apenas uma suposição.

A condição vem normalmente com たら, mas também pode vir com ば, なら ou と.

É usado para planos de emergência ("se por acaso houver um terremoto..."), sonhos e fantasias ("se eu ganhasse na loteria...") e situações contrárias à realidade ("se eu fosse um pássaro...").

A expressão もしもの時 significa "em caso de emergência" ou "se algo acontecer".$$,
    $$もしもし, usado ao atender o telefone, tem origem parecida, mas é uma expressão diferente.

もし e もしも podem ser trocados na maioria dos casos. もしも soa um pouco mais enfático ou dramático.

Em frases contrárias à realidade, é comum terminar com のに, expressando desejo ou pena.$$,
    $$もしも + … + たら / ば / なら
もしもの + 時 / 場合 (em caso de emergência)

Mais simples: もし + … + たら$$,
    $$もしも$$,
    $$もしも|もし$$,
    ARRAY['もしも', 'たら']::text[],
    ARRAY['もしも', 'もし']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n3-grammar-60', $$もしも宝くじが当たったら、家を買いたい。$$, $$もしもたからくじがあたったら、いえをかいたい。$$, $$Se por acaso eu ganhasse na loteria, queria comprar uma casa.$$),
    ('n3-grammar-60', $$もしも明日雨が降ったら、試合は中止です。$$, $$もしもあしたあめがふったら、しあいはちゅうしです。$$, $$Caso chova amanhã, a partida será cancelada.$$),
    ('n3-grammar-60', $$もしも地震が起きたら、机の下に入ってください。$$, $$もしもじしんがおきたら、つくえのしたにはいってください。$$, $$Se por acaso houver um terremoto, entre embaixo da mesa.$$),
    ('n3-grammar-60', $$もしも私が鳥だったら、空を飛べるのに。$$, $$もしもわたしがとりだったら、そらをとべるのに。$$, $$Se eu fosse um pássaro, poderia voar pelo céu.$$),
    ('n3-grammar-60', $$もしもの時は、この番号に電話してください。$$, $$もしものときは、このばんごうにでんわしてください。$$, $$Em caso de emergência, ligue para este número.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$____道に迷ったら、電話してね。$$, $$Se por acaso se perder, me ligue, tá?$$),
        (2, $$____一億円あったら、何をしますか。$$, $$Se você tivesse cem milhões de ienes, o que faria?$$),
        (3, $$____明日晴れたら、ピクニックに行こう。$$, $$Se amanhã fizer sol, vamos fazer um piquenique.$$),
        (4, $$____の時のために、お金を貯めている。$$, $$Estou guardando dinheiro para alguma emergência.$$),
        (5, $$____私が社長だったら、休みを増やす。$$, $$Se eu fosse o presidente, aumentaria as folgas.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n3-grammar-60', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$もしも$$),
        (1, $$もし$$),
        (2, $$もしも$$),
        (2, $$もし$$),
        (3, $$もしも$$),
        (3, $$もし$$),
        (4, $$もしも$$),
        (5, $$もしも$$),
        (5, $$もし$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
