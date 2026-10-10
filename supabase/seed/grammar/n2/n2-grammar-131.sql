-- n2-grammar-131 — 及び
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n2-grammar-131',
    'grammar',
    'N2',
    $$及び$$,
    $$oyobi$$,
    $$E / Bem como / Assim como$$,
    $$及び serve para ligar dois ou mais substantivos, com o sentido de "e" ou "bem como".

É uma palavra formal, usada principalmente na escrita, em documentos oficiais, leis, avisos e notícias. Na fala do dia a dia, usa-se と.

Por exemplo, "o nome e o endereço" ou "estudantes, bem como professores".$$,
    $$Quando há vários itens, 及び costuma ficar antes do último.

Também é escrito em hiragana, および.

É parecido com 並びに, que também é formal.$$,
    $$Substantivo + 及び + Substantivo
Substantivo、Substantivo + 及び + Substantivo$$,
    $$及び$$,
    $$及び|および$$,
    ARRAY['及び']::text[],
    ARRAY['及び', 'および']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n2-grammar-131', $$氏名及び住所を記入してください。$$, $$しめいおよびじゅうしょをきにゅうしてください。$$, $$Preencha o nome e o endereço.$$),
    ('n2-grammar-131', $$学生及び教職員は、この入口を使ってください。$$, $$がくせいおよびきょうしょくいんは、このいりぐちをつかってください。$$, $$Estudantes e funcionários, usem esta entrada.$$),
    ('n2-grammar-131', $$会場内での飲食及び喫煙は禁止です。$$, $$かいじょうないでのいんしょくおよびきつえんはきんしです。$$, $$É proibido comer, beber e fumar dentro do local.$$),
    ('n2-grammar-131', $$東京、大阪及び名古屋で説明会を開きます。$$, $$とうきょう、おおさかおよびなごやでせつめいかいをひらきます。$$, $$Faremos reuniões informativas em Tóquio, Osaka e Nagoya.$$),
    ('n2-grammar-131', $$日本語および英語で対応いたします。$$, $$にほんごおよびえいごでたいおういたします。$$, $$Atendemos em japonês e em inglês.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$申込書____写真を提出すること。$$, $$Entregue o formulário de inscrição e a foto.$$),
        (2, $$本人____家族の同意が必要です。$$, $$É necessário o consentimento da própria pessoa e da família.$$),
        (3, $$駐車場____駐輪場は地下にあります。$$, $$O estacionamento de carros e de bicicletas fica no subsolo.$$),
        (4, $$中学生____高校生を対象とした講座です。$$, $$É um curso voltado a alunos do ensino fundamental e médio.$$),
        (5, $$商品の返品____交換はできません。$$, $$Não é possível devolver nem trocar os produtos.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n2-grammar-131', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$及び$$),
        (1, $$および$$),
        (2, $$及び$$),
        (2, $$および$$),
        (3, $$及び$$),
        (3, $$および$$),
        (4, $$及び$$),
        (4, $$および$$),
        (5, $$及び$$),
        (5, $$および$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
