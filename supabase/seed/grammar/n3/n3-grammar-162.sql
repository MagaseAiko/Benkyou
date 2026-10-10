-- n3-grammar-162 — 〜上に
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n3-grammar-162',
    'grammar',
    'N3',
    $$〜上に$$,
    $$ue ni$$,
    $$Além de / E ainda por cima / Não só... como também$$,
    $$上に é usado para acrescentar uma informação a outra, indicando que as duas coisas se somam. Equivale a "além de", "e ainda por cima" ou "não só... como também".

As duas partes costumam ter o mesmo tom: duas coisas boas ("é barato e, além disso, gostoso") ou duas coisas ruins ("me perdi e, ainda por cima, perdi a carteira").

Ele vem depois da forma simples de verbos e adjetivos. Com adjetivos な, usa-se な, e com substantivos, である ou の.

A segunda parte costuma ter も, reforçando a ideia de acúmulo.

Comparado a し, que também lista razões, 上に destaca que a segunda informação vem como algo a mais, intensificando a situação.$$,
    $$Não misture tons diferentes: uma qualidade boa e uma ruim não combinam com 上に. Para contraste, use が ou けど.

Em reclamações, 上に aparece muito para dizer que tudo deu errado ao mesmo tempo.

Não confunda com 上で (depois de / para), que tem outro sentido.$$,
    $$Verbo / Adjetivo い (forma simples) + 上に、 + … + も
Adjetivo な + な + 上に
Substantivo + である / の + 上に

Escrita: 上に / うえに$$,
    $$上に$$,
    $$上に|うえに$$,
    ARRAY['上', 'に']::text[],
    ARRAY['上に', 'うえに']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n3-grammar-162', $$この店は安い上に、おいしい。$$, $$このみせはやすいうえに、おいしい。$$, $$Esta loja é barata e, além disso, gostosa.$$),
    ('n3-grammar-162', $$彼は頭がいい上に、スポーツも得意だ。$$, $$かれはあたまがいいうえに、スポーツもとくいだ。$$, $$Ele é inteligente e, além disso, bom em esportes.$$),
    ('n3-grammar-162', $$雨が降っている上に、風も強い。$$, $$あめがふっているうえに、かぜもつよい。$$, $$Está chovendo e, ainda por cima, ventando forte.$$),
    ('n3-grammar-162', $$旅行先で道に迷った上に、財布もなくした。$$, $$りょこうさきでみちにまよったうえに、さいふもなくした。$$, $$Na viagem, me perdi e, ainda por cima, perdi a carteira.$$),
    ('n3-grammar-162', $$彼女は親切な上に、とても優しい。$$, $$かのじょはしんせつなうえに、とてもやさしい。$$, $$Ela é atenciosa e, além disso, muito gentil.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$この部屋は広い____、駅から近い。$$, $$Este apartamento é amplo e, além disso, perto da estação.$$),
        (2, $$今朝は寝坊した____、電車も遅れた。$$, $$Hoje de manhã dormi demais e, ainda por cima, o trem atrasou.$$),
        (3, $$彼は背が高い____、ハンサムだ。$$, $$Ele é alto e, além disso, bonito.$$),
        (4, $$この仕事は大変な____、給料も安い。$$, $$Este trabalho é pesado e, ainda por cima, paga mal.$$),
        (5, $$熱がある____、頭も痛い。$$, $$Estou com febre e, ainda por cima, com dor de cabeça.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n3-grammar-162', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$上に$$),
        (1, $$うえに$$),
        (2, $$上に$$),
        (2, $$うえに$$),
        (3, $$上に$$),
        (3, $$うえに$$),
        (4, $$上に$$),
        (4, $$うえに$$),
        (5, $$上に$$),
        (5, $$うえに$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
