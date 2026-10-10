-- n4-grammar-81 — 〜そうだ（様態）
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n4-grammar-81',
    'grammar',
    'N4',
    $$〜そうだ（様態）$$,
    $$sou da (youtai)$$,
    $$Parece que vai / Parece / Tem cara de$$,
    $$Nesse uso, そうだ expressa uma impressão baseada no que se vê. Equivale a "parece que vai..." ou "parece...".

Com verbos, indica que algo está prestes a acontecer, segundo a aparência da situação. Por exemplo, ver nuvens escuras e dizer que parece que vai chover.

Com adjetivos, indica a impressão visual de uma qualidade antes de confirmá-la. Por exemplo, olhar um bolo e dizer que parece gostoso, mesmo sem ter provado.

A formação é diferente da そうだ de hearsay. Com verbos, usa-se a forma ます sem ます. Com adjetivos い, tira-se o い. Com adjetivos な, basta tirar o な.

Esse uso não é empregado com coisas que já se veem claramente, como dizer que algo bonito "parece bonito" quando é óbvio. Ele é para impressões e previsões.$$,
    $$Com substantivos, essa そうだ não é usada. Para dizer "parece ser estudante", usa-se みたいだ, ようだ ou らしい.

Com adjetivos de aparência óbvia, como きれい e かわいい, そうだ costuma ser evitado quando a qualidade já é evidente.

A forma そうにない indica que algo provavelmente não vai acontecer, como um trabalho que não parece que vai terminar.$$,
    $$Verbo na forma ます sem ます + そうだ
Adjetivo い sem い + そうだ
Adjetivo な (sem な) + そうだ

Exceções: いい → よさそう / ない → なさそう
Negativo de verbo: Verbo sem ます + そうにない / そうもない
Educado: そうです$$,
    $$そうだ$$,
    $$そうだ|そうです|そうにない|そうもない$$,
    ARRAY['そう', 'だ']::text[],
    ARRAY['そうだ', 'そうです', 'そうにない', 'そうもない']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n4-grammar-81', $$空が暗い。今にも雨が降りそうだ。$$, $$そらがくらい。いまにもあめがふりそうだ。$$, $$O céu está escuro. Parece que vai chover a qualquer momento.$$),
    ('n4-grammar-81', $$このケーキはおいしそうですね。$$, $$このケーキはおいしそうですね。$$, $$Este bolo parece gostoso, hein.$$),
    ('n4-grammar-81', $$彼は元気そうです。$$, $$かれはげんきそうです。$$, $$Ele parece estar bem.$$),
    ('n4-grammar-81', $$危ない、棚から本が落ちそうです。$$, $$あぶない、たなからほんがおちそうです。$$, $$Cuidado, parece que o livro vai cair da prateleira.$$),
    ('n4-grammar-81', $$この仕事は今日中に終わりそうにない。$$, $$このしごとはきょうじゅうにおわりそうにない。$$, $$Este trabalho não parece que vai terminar hoje.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$空が暗い。雨が降り____。$$, $$O céu está escuro. Parece que vai chover.$$),
        (2, $$田中さん、今日は忙し____ですね。$$, $$O Tanaka parece ocupado hoje, né?$$),
        (3, $$このかばんは丈夫____です。$$, $$Esta bolsa parece resistente.$$),
        (4, $$危ない！あの子が転び____。$$, $$Cuidado! Parece que aquela criança vai cair.$$),
        (5, $$このラーメン、本当においし____。$$, $$Este ramen parece muito gostoso.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n4-grammar-81', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$そうだ$$),
        (1, $$そうです$$),
        (2, $$そう$$),
        (3, $$そう$$),
        (4, $$そうだ$$),
        (4, $$そうです$$),
        (5, $$そうだ$$),
        (5, $$そうです$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
