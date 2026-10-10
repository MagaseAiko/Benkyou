-- n2-grammar-38 — 〜上（じょう）
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n2-grammar-38',
    'grammar',
    'N2',
    $$〜上（じょう）$$,
    $$jou$$,
    $$Do ponto de vista de / Em termos de / Por razões de$$,
    $$上 (lido じょう), como sufixo depois de um substantivo, indica o ponto de vista, a área ou o aspecto a partir do qual algo é considerado. Equivale a "do ponto de vista de", "em termos de" ou "por razões de".

Por exemplo, 健康上 (do ponto de vista da saúde), 法律上 (em termos legais), 安全上 (por razões de segurança), 経験上 (pela experiência), 教育上 (do ponto de vista educacional).

Ele pode ser seguido de は, の, も ou de vírgula:
• 健康上の理由 (motivos de saúde).
• 法律上は問題ない (legalmente, não há problema).
• 安全上、〜してください (por segurança, faça...).

É uma expressão formal, muito usada em documentos, avisos, notícias e linguagem de negócios.$$,
    $$健康上の理由で ("por motivos de saúde") é uma forma educada e vaga de justificar ausências.

O mesmo kanji 上 tem outras leituras e usos, como うえ (em cima) e 上に / 上で, que são outras gramáticas.

Em contratos, 法律上 e 契約上 aparecem com frequência.$$,
    $$Substantivo + 上 (じょう) + の + Substantivo
Substantivo + 上 + は / も + Frase
Substantivo + 上、 + Frase

Exemplos: 健康上 / 法律上 / 安全上 / 経験上 / 教育上 / 歴史上$$,
    $$上$$,
    $$上は|上の|上、|上も|上で$$,
    ARRAY['上']::text[],
    ARRAY['上', '上の', '上は']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n2-grammar-38', $$健康上の理由で、会社を休んだ。$$, $$けんこうじょうのりゆうで、かいしゃをやすんだ。$$, $$Faltei ao trabalho por motivos de saúde.$$),
    ('n2-grammar-38', $$このやり方は、法律上は問題ない。$$, $$このやりかたは、ほうりつじょうはもんだいない。$$, $$Este método, do ponto de vista legal, não tem problema.$$),
    ('n2-grammar-38', $$安全上、ここに入らないでください。$$, $$あんぜんじょう、ここにはいらないでください。$$, $$Por razões de segurança, não entre aqui.$$),
    ('n2-grammar-38', $$経験上、この方法が一番いい。$$, $$けいけんじょう、このほうほうがいちばんいい。$$, $$Pela minha experiência, este método é o melhor.$$),
    ('n2-grammar-38', $$その番組は教育上、子供によくない。$$, $$そのばんぐみはきょういくじょう、こどもによくない。$$, $$Esse programa não é bom para as crianças do ponto de vista educacional.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$健康____の問題で、お酒をやめた。$$, $$Parei de beber por problemas de saúde.$$),
        (2, $$日本では法律____、二十歳になるまでお酒は飲めない。$$, $$No Japão, pela lei, não se pode beber antes dos vinte anos.$$),
        (3, $$安全____の理由で、イベントは中止になった。$$, $$O evento foi cancelado por razões de segurança.$$),
        (4, $$経験____、彼は時間どおりには来ないと思う。$$, $$Pela experiência, acho que ele não vai chegar no horário.$$),
        (5, $$この寺は歴史____、重要な場所だ。$$, $$Este templo é um lugar importante do ponto de vista histórico.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n2-grammar-38', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$上$$),
        (2, $$上$$),
        (3, $$上$$),
        (4, $$上$$),
        (5, $$上$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
