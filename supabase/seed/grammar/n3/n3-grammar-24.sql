-- n3-grammar-24 — 〜がち
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n3-grammar-24',
    'grammar',
    'N3',
    $$〜がち$$,
    $$gachi$$,
    $$Tender a / Ter a tendência de / Com frequência$$,
    $$がち é usado para dizer que algo tende a acontecer com frequência, geralmente algo negativo ou indesejado. Equivale a "tender a" ou "ter a tendência de".

Ele vem depois do verbo na forma ます sem ます, ou diretamente depois de alguns substantivos. Por exemplo, 休みがち (tende a faltar), 病気がち (vive doente), 曇りがち (tempo frequentemente nublado).

O tom costuma ser de crítica, preocupação ou constatação de algo ruim. Por isso, é usado com coisas como esquecer, faltar, ficar doente ou descuidar da alimentação.

がち funciona como um adjetivo な: pode ser seguido de だ, です, な, で e になる.$$,
    $$がち é muito parecido com やすい no sentido de tendência, mas がち foca na frequência com que algo acontece, enquanto やすい foca na facilidade.

Para tendências positivas, がち soa estranho. Nesses casos, prefira よく ou 傾向がある.

Na gíria jovem, ガチ (em katakana) significa "sério" ou "de verdade", e não tem relação com essa gramática.$$,
    $$Verbo na forma ます sem ます + がち + だ / です
Substantivo + がち + だ / です (病気がち / 曇りがち / 遠慮がち)
〜がち + な + Substantivo
〜がち + になる$$,
    $$がち$$,
    $$がち$$,
    ARRAY['がち']::text[],
    ARRAY['がち', 'がちだ', 'がちな', 'がちになる']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n3-grammar-24', $$冬は風邪をひきがちだ。$$, $$ふゆはかぜをひきがちだ。$$, $$No inverno, a gente tende a pegar resfriado.$$),
    ('n3-grammar-24', $$彼は最近、学校を休みがちです。$$, $$かれはさいきん、がっこうをやすみがちです。$$, $$Ultimamente, ele tem faltado à escola com frequência.$$),
    ('n3-grammar-24', $$雨の日は家にこもりがちになる。$$, $$あめのひはいえにこもりがちになる。$$, $$Em dias de chuva, a gente tende a ficar trancado em casa.$$),
    ('n3-grammar-24', $$母は病気がちで、よく入院している。$$, $$はははびょうきがちで、よくにゅういんしている。$$, $$Minha mãe vive doente e é internada com frequência.$$),
    ('n3-grammar-24', $$忙しいと、食事が不規則になりがちだ。$$, $$いそがしいと、しょくじがふきそくになりがちだ。$$, $$Quando estamos ocupados, a alimentação tende a ficar irregular.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$一人暮らしだと、野菜が不足し____だ。$$, $$Morando sozinho, a gente tende a comer pouca verdura.$$),
        (2, $$彼は約束を忘れ____なので、困る。$$, $$Ele tende a esquecer os compromissos, e isso é um problema.$$),
        (3, $$梅雨の時期は曇り____の天気が続く。$$, $$Na época das chuvas, o tempo costuma ficar nublado.$$),
        (4, $$年をとると、物忘れし____になる。$$, $$Com a idade, a gente tende a ficar esquecido.$$),
        (5, $$子供のころ、私は病気____だった。$$, $$Quando criança, eu vivia doente.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n3-grammar-24', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$がち$$),
        (2, $$がち$$),
        (3, $$がち$$),
        (4, $$がち$$),
        (5, $$がち$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
