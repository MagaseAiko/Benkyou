-- n4-grammar-86 — 〜たがる
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n4-grammar-86',
    'grammar',
    'N4',
    $$〜たがる$$,
    $$tagaru$$,
    $$Querer (outra pessoa) / Ter vontade de$$,
    $$たがる é usado para falar do desejo de outra pessoa, ou seja, para dizer que um terceiro quer fazer algo. Equivale a "querer" ou "ter vontade de", quando o sujeito não é quem fala.

Em japonês, a forma たい expressa um desejo interno, e só a própria pessoa pode afirmá-lo com certeza. Para falar do desejo de outra pessoa, usa-se たがる, que descreve o desejo a partir do comportamento visível.

Ele é formado tirando o い de たい e acrescentando がる. O resultado funciona como um verbo do grupo 1.

Para um desejo no momento, usa-se たがっている. Para uma tendência geral, como "crianças sempre querem brincar", usa-se たがる.

Como たがる é um verbo de ação, o objeto é marcado com を.$$,
    $$Usar たがる para superiores pode soar desrespeitoso, porque descreve o desejo deles como algo observado de fora. Nesses casos, é melhor dizer 〜たいとおっしゃっていました.

Para coisas desejadas, e não ações, usa-se ほしがる.

Para falar de alguém próximo, como familiares, たがっている é muito natural no dia a dia.$$,
    $$Verbo na forma ます sem ます + たがる

Desejo no momento: たがっている / たがっています
Tendência geral: たがる / たがります
Negativo: たがらない$$,
    $$たがる$$,
    $$たがる|たがって|たがった|たがります|たがらない$$,
    ARRAY['たがる']::text[],
    ARRAY['たがる', 'たがっている', 'たがります', 'たがらない']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n4-grammar-86', $$子供はいつも外で遊びたがります。$$, $$こどもはいつもそとであそびたがります。$$, $$As crianças sempre querem brincar lá fora.$$),
    ('n4-grammar-86', $$弟は新しいスマホを買いたがっている。$$, $$おとうとはあたらしいスマホをかいたがっている。$$, $$Meu irmão mais novo está querendo comprar um celular novo.$$),
    ('n4-grammar-86', $$娘は一人で何でもやりたがる。$$, $$むすめはひとりでなんでもやりたがる。$$, $$Minha filha quer fazer tudo sozinha.$$),
    ('n4-grammar-86', $$父は病院に行きたがらない。$$, $$ちちはびょういんにいきたがらない。$$, $$Meu pai não quer ir ao hospital.$$),
    ('n4-grammar-86', $$妻は海外旅行に行きたがっています。$$, $$つまはかいがいりょこうにいきたがっています。$$, $$Minha esposa está querendo fazer uma viagem ao exterior.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$息子は犬を飼い____います。$$, $$Meu filho está querendo ter um cachorro.$$),
        (2, $$子供は甘い物を食べ____。$$, $$As crianças querem comer doces.$$),
        (3, $$彼女は最近、誰にも会い____。$$, $$Ultimamente ela não quer ver ninguém.$$),
        (4, $$弟は日本へ留学し____いる。$$, $$Meu irmão mais novo está querendo fazer intercâmbio no Japão.$$),
        (5, $$犬が散歩に行き____。$$, $$O cachorro está querendo passear.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n4-grammar-86', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$たがって$$),
        (2, $$たがります$$),
        (2, $$たがる$$),
        (3, $$たがらない$$),
        (4, $$たがって$$),
        (5, $$たがっている$$),
        (5, $$たがっています$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
