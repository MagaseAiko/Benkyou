-- n3-grammar-109 — そのために
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n3-grammar-109',
    'grammar',
    'N3',
    $$そのために$$,
    $$sono tame ni$$,
    $$Por isso / Por esse motivo / Para isso$$,
    $$そのために é uma expressão de ligação usada no começo de uma frase, que retoma o que foi dito antes. Ela tem dois sentidos, dependendo do contexto.

O primeiro é causa: "por isso", "por esse motivo". A frase anterior explica o motivo, e a frase com そのために mostra a consequência. Por exemplo, "nevou muito. Por isso, os trens pararam".

O segundo é objetivo: "para isso". A frase anterior apresenta um objetivo, e a frase com そのために mostra o que se faz para alcançá-lo. Por exemplo, "quero trabalhar no Japão. Para isso, estou estudando japonês".

A forma そのため, sem に, é mais comum no sentido de causa e soa formal. Ela aparece muito em notícias e textos explicativos.$$,
    $$O contexto mostra se é causa ou objetivo: se a primeira frase é um acontecimento, é causa; se é um desejo ou meta, é objetivo.

Em notícias, そのため aparece com muita frequência para explicar consequências de desastres e mudanças.

Na conversa casual, os japoneses costumam usar だから ou それで para causa.$$,
    $$Frase 1 (motivo, com ponto final) + そのために / そのため、 + Consequência
Frase 1 (objetivo, com ponto final) + そのために、 + Ação para alcançá-lo$$,
    $$そのために$$,
    $$そのために|そのため$$,
    ARRAY['その', 'ために']::text[],
    ARRAY['そのために', 'そのため']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n3-grammar-109', $$大雪が降った。そのために、電車が止まった。$$, $$おおゆきがふった。そのために、でんしゃがとまった。$$, $$Nevou muito. Por isso, os trens pararam.$$),
    ('n3-grammar-109', $$私は日本で働きたい。そのために、日本語を勉強している。$$, $$わたしはにほんではたらきたい。そのために、にほんごをべんきょうしている。$$, $$Quero trabalhar no Japão. Para isso, estou estudando japonês.$$),
    ('n3-grammar-109', $$道が混んでいた。そのため、会議に遅れた。$$, $$みちがこんでいた。そのため、かいぎにおくれた。$$, $$O trânsito estava ruim. Por esse motivo, me atrasei para a reunião.$$),
    ('n3-grammar-109', $$来月試験がある。そのために、毎日図書館に通っている。$$, $$らいげつしけんがある。そのために、まいにちとしょかんにかよっている。$$, $$Tenho prova no mês que vem. Para isso, vou à biblioteca todo dia.$$),
    ('n3-grammar-109', $$台風が近づいている。そのため、学校は休みになった。$$, $$たいふうがちかづいている。そのため、がっこうはやすみになった。$$, $$Um tufão está se aproximando. Por isso, as aulas foram canceladas.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$彼は留学したい。____、アルバイトでお金を貯めている。$$, $$Ele quer fazer intercâmbio. Para isso, está juntando dinheiro com trabalho de meio período.$$),
        (2, $$昨日は熱があった。____、学校を休んだ。$$, $$Ontem eu estava com febre. Por isso, faltei à escola.$$),
        (3, $$高速道路で事故があった。____、道路が渋滞している。$$, $$Houve um acidente na rodovia. Por isso, o trânsito está congestionado.$$),
        (4, $$健康になりたい。____、毎日運動している。$$, $$Quero ficar saudável. Para isso, faço exercício todo dia.$$),
        (5, $$電車が遅れた。____、面接に間に合わなかった。$$, $$O trem atrasou. Por isso, não cheguei a tempo para a entrevista.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n3-grammar-109', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$そのために$$),
        (1, $$そのため$$),
        (2, $$そのために$$),
        (2, $$そのため$$),
        (3, $$そのために$$),
        (3, $$そのため$$),
        (4, $$そのために$$),
        (4, $$そのため$$),
        (5, $$そのために$$),
        (5, $$そのため$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
