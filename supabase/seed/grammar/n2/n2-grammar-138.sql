-- n2-grammar-138 — 〜次第で
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n2-grammar-138',
    'grammar',
    'N2',
    $$〜次第で$$,
    $$shidai de$$,
    $$Dependendo de / Conforme / De acordo com$$,
    $$次第で indica que um resultado depende de algo. Equivale a "dependendo de" ou "conforme".

A primeira parte mostra o fator decisivo, e a segunda mostra que o resultado pode mudar. Por exemplo, "dependendo do esforço, qualquer um pode passar".

Na forma 次第だ, no fim da frase, significa "depende de".$$,
    $$A forma 次第では indica uma possibilidade especial, como "dependendo do caso, pode ser que...".

Expressões comuns são 努力次第, 天気次第, あなた次第 e 考え方次第.$$,
    $$Substantivo + 次第で + Frase
Substantivo + 次第だ / 次第です
Substantivo + 次第では$$,
    $$次第で$$,
    $$次第で|次第だ|次第です|しだいで$$,
    ARRAY['次第', 'で']::text[],
    ARRAY['次第で', '次第では', '次第だ', '次第です']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n2-grammar-138', $$努力次第で、誰でも上手になれる。$$, $$どりょくしだいで、だれでもじょうずになれる。$$, $$Dependendo do esforço, qualquer um pode melhorar.$$),
    ('n2-grammar-138', $$天気次第で、予定を変えるかもしれない。$$, $$てんきしだいで、よていをかえるかもしれない。$$, $$Dependendo do tempo, talvez mudemos os planos.$$),
    ('n2-grammar-138', $$行くかどうかは、あなた次第です。$$, $$いくかどうかは、あなたしだいです。$$, $$Ir ou não depende de você.$$),
    ('n2-grammar-138', $$考え方次第で、人生は楽しくなる。$$, $$かんがえかたしだいで、じんせいはたのしくなる。$$, $$Conforme o modo de pensar, a vida fica mais divertida.$$),
    ('n2-grammar-138', $$結果次第では、計画を中止する。$$, $$けっかしだいでは、けいかくをちゅうしする。$$, $$Dependendo do resultado, cancelaremos o plano.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$使い方____、便利にも危険にもなる。$$, $$Dependendo do uso, pode ser útil ou perigoso.$$),
        (2, $$成功するかどうかは、君の努力____。$$, $$Ter sucesso ou não depende do seu esforço.$$),
        (3, $$値段____、買うかどうか決めます。$$, $$Vou decidir se compro dependendo do preço.$$),
        (4, $$体調____、明日の試合に出られないかもしれない。$$, $$Dependendo de como eu estiver de saúde, talvez eu não possa jogar amanhã.$$),
        (5, $$相手の態度____、こちらの対応も変わる。$$, $$Conforme a atitude do outro, nossa reação também muda.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n2-grammar-138', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$次第で$$),
        (1, $$しだいで$$),
        (2, $$次第だ$$),
        (2, $$次第です$$),
        (3, $$次第で$$),
        (3, $$しだいで$$),
        (4, $$次第では$$),
        (5, $$次第で$$),
        (5, $$しだいで$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
