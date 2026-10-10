-- n5-grammar-67 — 〜てから
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n5-grammar-67',
    'grammar',
    'N5',
    $$〜てから$$,
    $$te kara$$,
    $$Depois de / Desde que$$,
    $$てから é usado para dizer que uma ação acontece depois de outra. Equivale a "depois de fazer...".

A primeira ação fica na forma て + から, e a segunda vem em seguida. A ideia é que a primeira ação precisa terminar antes de a segunda começar. Por isso, てから destaca bem a ordem.

O tempo da frase, presente ou passado, fica no último verbo.

Com expressões de tempo, como "já faz três anos", てから significa "desde que": desde que algo aconteceu, passou certo tempo.$$,
    $$A forma て sozinha também liga ações em sequência, mas てから deixa a ordem mais clara e enfatiza que uma coisa vem só depois da outra.

Não confunda てから com から (porque). A diferença está na forma do verbo: com てから, o verbo está na forma て.

Para expressar "depois de" com o verbo no passado, existe também たあとで, que aparece no N4.$$,
    $$Verbo A na forma て + から + Verbo B
Verbo na forma て + から + Período de tempo (desde que)$$,
    $$てから$$,
    $$てから|でから$$,
    ARRAY['て', 'から']::text[],
    ARRAY['てから', 'でから']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n5-grammar-67', $$手を洗ってから、ご飯を食べます。$$, $$てをあらってから、ごはんをたべます。$$, $$Como depois de lavar as mãos.$$),
    ('n5-grammar-67', $$宿題をしてから、遊びに行きます。$$, $$しゅくだいをしてから、あそびにいきます。$$, $$Vou brincar depois de fazer a lição.$$),
    ('n5-grammar-67', $$昨日はシャワーを浴びてから寝ました。$$, $$きのうはシャワーをあびてからねました。$$, $$Ontem dormi depois de tomar banho.$$),
    ('n5-grammar-67', $$この本を読んでから、感想を書いてください。$$, $$このほんをよんでから、かんそうをかいてください。$$, $$Depois de ler este livro, escreva sua opinião, por favor.$$),
    ('n5-grammar-67', $$日本に来てから、もう三年になります。$$, $$にほんにきてから、もうさんねんになります。$$, $$Já faz três anos desde que vim para o Japão.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$毎晩、歯を磨い____寝ます。$$, $$Toda noite, durmo depois de escovar os dentes.$$),
        (2, $$電話をかけ____、友達の家に行きました。$$, $$Depois de ligar, fui à casa do meu amigo.$$),
        (3, $$よく考え____、答えてください。$$, $$Pense bem antes de responder, por favor.$$),
        (4, $$薬を飲ん____、少し休みました。$$, $$Depois de tomar o remédio, descansei um pouco.$$),
        (5, $$大学を卒業し____、ずっとこの会社で働いています。$$, $$Desde que me formei na faculdade, trabalho nesta empresa.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n5-grammar-67', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$てから$$),
        (2, $$てから$$),
        (3, $$てから$$),
        (4, $$でから$$),
        (5, $$てから$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
