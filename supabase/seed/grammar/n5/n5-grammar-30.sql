-- n5-grammar-30 — 〜前に
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n5-grammar-30',
    'grammar',
    'N5',
    $$〜前に$$,
    $$mae ni$$,
    $$Antes de / Há (tempo atrás)$$,
    $$前に é usado para dizer que uma ação acontece antes de outra. Equivale a "antes de".

Ele pode vir depois de um verbo ou de um substantivo. Com verbo, usa-se sempre a forma de dicionário, mesmo que a frase inteira esteja no passado. Isso acontece porque, no momento da primeira ação, a segunda ainda não tinha acontecido.

Com substantivo, coloca-se の entre o substantivo e 前に, como "antes da aula" ou "antes da refeição".

Depois de uma quantidade de tempo, sem の, 前に significa "atrás" ou "há", como "há três anos".$$,
    $$Usar o verbo no passado antes de 前に é um erro comum. Mesmo falando do passado, o verbo continua na forma de dicionário.

A palavra 前 também significa "frente". Quando se fala de um lugar, como a frente da estação, の前に indica posição, e não tempo. O contexto mostra qual sentido é usado.

O oposto de 前に é 後で (depois de), que usa o verbo na forma た.$$,
    $$Verbo na forma de dicionário + 前に
Substantivo + の + 前に
Período de tempo + 前に (há... / ... atrás)

Escrita: 前に / まえに$$,
    $$前に$$,
    $$前に|まえに$$,
    ARRAY['前', 'に']::text[],
    ARRAY['前に', 'まえに']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n5-grammar-30', $$寝る前に歯を磨きます。$$, $$ねるまえにはをみがきます。$$, $$Escovo os dentes antes de dormir.$$),
    ('n5-grammar-30', $$食事の前に手を洗いましょう。$$, $$しょくじのまえにてをあらいましょう。$$, $$Vamos lavar as mãos antes da refeição.$$),
    ('n5-grammar-30', $$日本に来る前に、少し日本語を勉強しました。$$, $$にほんにくるまえに、すこしにほんごをべんきょうしました。$$, $$Antes de vir para o Japão, estudei um pouco de japonês.$$),
    ('n5-grammar-30', $$三年前に結婚しました。$$, $$さんねんまえにけっこんしました。$$, $$Casei há três anos.$$),
    ('n5-grammar-30', $$出かける前に、天気予報を見たほうがいいですよ。$$, $$でかけるまえに、てんきよほうをみたほうがいいですよ。$$, $$Antes de sair, é melhor ver a previsão do tempo.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$ご飯を食べる____、手を洗います。$$, $$Lavo as mãos antes de comer.$$),
        (2, $$授業の____宿題を出してください。$$, $$Entregue a lição antes da aula, por favor.$$),
        (3, $$二年____日本に来ました。$$, $$Vim para o Japão há dois anos.$$),
        (4, $$電車に乗る____、切符を買います。$$, $$Compro a passagem antes de pegar o trem.$$),
        (5, $$試験の____、もう一度復習しました。$$, $$Antes da prova, revisei mais uma vez.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n5-grammar-30', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$前に$$),
        (1, $$まえに$$),
        (2, $$前に$$),
        (2, $$まえに$$),
        (3, $$前に$$),
        (3, $$まえに$$),
        (4, $$前に$$),
        (4, $$まえに$$),
        (5, $$前に$$),
        (5, $$まえに$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
