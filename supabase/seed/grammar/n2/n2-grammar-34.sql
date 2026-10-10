-- n2-grammar-34 — 一気に
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n2-grammar-34',
    'grammar',
    'N2',
    $$一気に$$,
    $$ikki ni$$,
    $$De uma vez só / De um fôlego / Rapidamente$$,
    $$一気に é um advérbio que significa "de uma vez só" ou "de um fôlego". Ele indica que algo é feito sem parar, com rapidez e intensidade, ou que uma mudança acontece de forma súbita e grande.

Ele tem dois usos principais.

O primeiro é fazer algo sem pausa, até o fim: "bebeu a água de uma vez só", "li o romance inteiro de um fôlego", "resolvi o trabalho todo de uma vez".

O segundo é indicar uma mudança grande e rápida: "a temperatura caiu de repente", "a popularidade se espalhou rapidamente".

Comparado a 一度に (ao mesmo tempo, de uma vez), 一気に destaca a energia e a continuidade da ação.$$,
    $$一気飲み significa "beber de uma vez só", e em festas japonesas é desencorajado por razões de saúde.

Com verbos de leitura e trabalho, 一気に mostra que a pessoa estava muito envolvida.

Em notícias, 一気に aparece para mudanças bruscas em preços, temperatura e popularidade.$$,
    $$一気に + Verbo

Escrita: 一気に / いっきに$$,
    $$一気に$$,
    $$一気に|いっきに$$,
    ARRAY['一気', 'に']::text[],
    ARRAY['一気に', 'いっきに']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n2-grammar-34', $$喉が渇いていたので、彼は水を一気に飲んだ。$$, $$のどがかわいていたので、かれはみずをいっきにのんだ。$$, $$Ele estava com sede e bebeu a água de uma vez só.$$),
    ('n2-grammar-34', $$おもしろくて、小説を一気に読んでしまった。$$, $$おもしろくて、しょうせつをいっきによんでしまった。$$, $$Era tão interessante que li o romance inteiro de um fôlego.$$),
    ('n2-grammar-34', $$週末に、たまった仕事を一気に片付けた。$$, $$しゅうまつに、たまったしごとをいっきにかたづけた。$$, $$No fim de semana, resolvi de uma vez todo o trabalho acumulado.$$),
    ('n2-grammar-34', $$夜になって、気温が一気に下がった。$$, $$よるになって、きおんがいっきにさがった。$$, $$À noite, a temperatura caiu de repente.$$),
    ('n2-grammar-34', $$彼は階段を一気に駆け上がった。$$, $$かれはかいだんをいっきにかけあがった。$$, $$Ele subiu a escada correndo, de uma vez só.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$暑かったので、ビールを____飲み干した。$$, $$Estava quente, então bebi a cerveja de uma vez só.$$),
        (2, $$集中して、宿題を____終わらせた。$$, $$Me concentrei e terminei a lição de uma vez.$$),
        (3, $$暖かくなって、桜が____咲いた。$$, $$Esquentou e as cerejeiras floresceram todas de uma vez.$$),
        (4, $$テレビで紹介されて、その店の人気が____広がった。$$, $$Depois de aparecer na TV, a popularidade da loja se espalhou rapidamente.$$),
        (5, $$彼は坂を____走って上った。$$, $$Ele subiu a ladeira correndo, de uma vez só.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n2-grammar-34', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$一気に$$),
        (1, $$いっきに$$),
        (2, $$一気に$$),
        (2, $$いっきに$$),
        (3, $$一気に$$),
        (3, $$いっきに$$),
        (4, $$一気に$$),
        (4, $$いっきに$$),
        (5, $$一気に$$),
        (5, $$いっきに$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
