-- n2-grammar-09 — 〜だけあって
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n2-grammar-09',
    'grammar',
    'N2',
    $$〜だけあって$$,
    $$dake atte$$,
    $$Como era de se esperar de / Não é à toa que / Por ser$$,
    $$だけあって é usado para dizer que um resultado positivo corresponde ao que se esperava de alguém ou de algo, por causa de uma qualidade, condição ou esforço. Equivale a "como era de se esperar de", "não é à toa que" ou "por ser...".

A primeira parte indica o motivo da expectativa: ser profissional, ter morado muito tempo no Japão, ser uma loja famosa, ter treinado muito. A segunda mostra que o resultado está à altura dessa expectativa.

Por exemplo, "como era de se esperar de um profissional, a comida é deliciosa" ou "não é à toa que é famosa: a loja está sempre cheia".

O tom é de admiração ou de reconhecimento. Por isso, é usado quase sempre para avaliações positivas.

さすが combina muito com だけあって, reforçando a ideia.$$,
    $$だけあって é parecido com だけに, mas だけに pode ter tom positivo ou negativo, enquanto だけあって é quase sempre positivo.

A forma だけのことはある (no fim da frase) tem um sentido parecido: "faz jus a...".

Em avaliações de restaurantes e produtos, だけあって aparece com frequência.$$,
    $$Substantivo + だけあって、 + Avaliação positiva
Verbo / Adjetivo い (forma simples) + だけあって
Adjetivo な + な + だけあって
さすが + … + だけあって$$,
    $$だけあって$$,
    $$だけあって|だけある$$,
    ARRAY['だけ', 'あって']::text[],
    ARRAY['だけあって', 'だけある']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n2-grammar-09', $$さすがプロだけあって、料理がとてもおいしい。$$, $$さすがプロだけあって、りょうりがとてもおいしい。$$, $$Como era de se esperar de um profissional, a comida é deliciosa.$$),
    ('n2-grammar-09', $$彼は十年日本に住んでいただけあって、日本語がぺらぺらだ。$$, $$かれはじゅうねんにほんにすんでいただけあって、にほんごがぺらぺらだ。$$, $$Não é à toa que morou dez anos no Japão: fala japonês fluentemente.$$),
    ('n2-grammar-09', $$この店は有名なだけあって、いつも混んでいる。$$, $$このみせはゆうめいなだけあって、いつもこんでいる。$$, $$Não é à toa que esta loja é famosa: está sempre cheia.$$),
    ('n2-grammar-09', $$高いだけあって、このかばんは丈夫だ。$$, $$たかいだけあって、このかばんはじょうぶだ。$$, $$Por ser cara, esta bolsa é resistente, como era de se esperar.$$),
    ('n2-grammar-09', $$一生懸命練習しただけあって、彼は優勝した。$$, $$いっしょうけんめいれんしゅうしただけあって、かれはゆうしょうした。$$, $$Não é à toa que treinou tanto: ele foi campeão.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$毎日練習している____、彼女のピアノは上手だ。$$, $$Não é à toa que ela pratica todo dia: toca piano muito bem.$$),
        (2, $$有名なホテル____、サービスが素晴らしい。$$, $$Como era de se esperar de um hotel famoso, o serviço é excelente.$$),
        (3, $$値段が高い____、品質がいい。$$, $$Por ser caro, a qualidade é boa, como era de se esperar.$$),
        (4, $$元選手____、彼はルールに詳しい。$$, $$Não é à toa que é ex-atleta: conhece bem as regras.$$),
        (5, $$人気がある____、チケットがすぐに売り切れた。$$, $$Como era de se esperar de algo tão popular, os ingressos esgotaram na hora.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n2-grammar-09', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$だけあって$$),
        (2, $$だけあって$$),
        (3, $$だけあって$$),
        (4, $$だけあって$$),
        (5, $$だけあって$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
