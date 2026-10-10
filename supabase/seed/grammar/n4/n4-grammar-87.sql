-- n4-grammar-87 — 〜たら
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n4-grammar-87',
    'grammar',
    'N4',
    $$〜たら$$,
    $$tara$$,
    $$Se / Quando / Depois que$$,
    $$たら é a forma condicional mais usada na conversa. Ela pode significar "se", "quando" ou "depois que", dependendo da frase.

No sentido de "se", ela apresenta uma condição hipotética: se algo acontecer, haverá um resultado.

No sentido de "quando" ou "depois que", ela indica que, depois de uma ação acontecer, outra vai acontecer. Nesse caso, a primeira ação certamente vai ocorrer, como chegar à estação.

No passado, たら pode descrever uma descoberta: "quando fiz isso, aconteceu tal coisa". A segunda parte mostra algo inesperado ou uma constatação.

たら é formado com a forma た + ら. Diferente de ば, a segunda parte pode ser um pedido, uma ordem, uma vontade ou uma sugestão.$$,
    $$たら é o "se" mais versátil do japonês. Quando estiver em dúvida, ele costuma ser a opção mais segura na conversa.

Com descobertas no passado, a segunda parte não pode ser uma ação controlada por quem fala.

Em frases como もし〜たら, a palavra もし reforça a ideia de hipótese.$$,
    $$Verbo na forma た + ら
Adjetivo い sem い + かったら
Adjetivo な / Substantivo + だったら
Negativo: Verbo ない → なかったら$$,
    $$たら$$,
    $$たら|だら$$,
    ARRAY['たら']::text[],
    ARRAY['たら', 'だら', 'かったら', 'だったら', 'なかったら']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n4-grammar-87', $$雨が降ったら、試合は中止です。$$, $$あめがふったら、しあいはちゅうしです。$$, $$Se chover, a partida será cancelada.$$),
    ('n4-grammar-87', $$駅に着いたら、電話してください。$$, $$えきについたら、でんわしてください。$$, $$Quando chegar à estação, me ligue.$$),
    ('n4-grammar-87', $$お金があったら、世界一周したい。$$, $$おかねがあったら、せかいいっしゅうしたい。$$, $$Se eu tivesse dinheiro, queria dar a volta ao mundo.$$),
    ('n4-grammar-87', $$安かったら、買います。$$, $$やすかったら、かいます。$$, $$Se for barato, eu compro.$$),
    ('n4-grammar-87', $$窓を開けたら、富士山が見えた。$$, $$まどをあけたら、ふじさんがみえた。$$, $$Quando abri a janela, deu para ver o Monte Fuji.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$宿題が終わっ____、遊びに行ってもいいよ。$$, $$Quando terminar a lição, pode ir brincar.$$),
        (2, $$暇だっ____、一緒に映画を見ませんか。$$, $$Se estiver livre, quer ver um filme comigo?$$),
        (3, $$大人になっ____、何になりたい？$$, $$Quando crescer, o que você quer ser?$$),
        (4, $$その薬を飲ん____、すぐ治りました。$$, $$Quando tomei esse remédio, melhorei logo.$$),
        (5, $$家に帰っ____、誰もいなかった。$$, $$Quando voltei para casa, não havia ninguém.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n4-grammar-87', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$たら$$),
        (2, $$たら$$),
        (3, $$たら$$),
        (4, $$だら$$),
        (5, $$たら$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
