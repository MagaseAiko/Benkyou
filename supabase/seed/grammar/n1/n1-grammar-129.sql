-- n1-grammar-129 — 〜に照らして
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-129',
    'grammar',
    'N1',
    $$〜に照らして$$,
    $$ni terashite$$,
    $$À luz de / Com base em / Comparando com$$,
    $$に照らして indica que algo é julgado ou avaliado comparando com um padrão, uma regra ou uma referência. Equivale a "à luz de" ou "com base em".

Costuma vir com palavras como lei, regra, experiência, bom senso e fatos. Por exemplo, "à luz da lei, esse ato é crime".

É uma expressão formal, comum em contextos jurídicos e oficiais.$$,
    $$Também é escrito にてらして.

É parecido com に基づいて e と比べて, mas に照らして destaca o julgamento com base em um padrão.$$,
    $$Substantivo + に照らして / に照らし
Substantivo + に照らすと / に照らせば$$,
    $$に照らして$$,
    $$に照らして|に照らし|に照らすと|に照らせば|にてらして$$,
    ARRAY['に', '照らして']::text[],
    ARRAY['に照らして', 'に照らし', 'に照らすと', 'に照らせば']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-129', $$法律に照らして、彼の行為は犯罪にあたる。$$, $$ほうりつにてらして、かれのこういははんざいにあたる。$$, $$À luz da lei, o ato dele constitui crime.$$),
    ('n1-grammar-129', $$過去の経験に照らすと、この計画は危ない。$$, $$かこのけいけんにてらすと、このけいかくはあぶない。$$, $$Com base em experiências passadas, este plano é arriscado.$$),
    ('n1-grammar-129', $$社会の常識に照らして考えてみてください。$$, $$しゃかいのじょうしきにてらしてかんがえてみてください。$$, $$Pense nisso à luz do bom senso da sociedade.$$),
    ('n1-grammar-129', $$規則に照らし、処分を決定した。$$, $$きそくにてらし、しょぶんをけっていした。$$, $$Decidimos a punição com base nas regras.$$),
    ('n1-grammar-129', $$事実に照らせば、彼の説明はおかしい。$$, $$じじつにてらせば、かれのせつめいはおかしい。$$, $$Comparando com os fatos, a explicação dele é estranha.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$校則____、この服装は認められない。$$, $$À luz das regras da escola, esta roupa não é permitida.$$),
        (2, $$これまでのデータ____、今年の売り上げは少ない。$$, $$Com base nos dados até agora, as vendas deste ano estão baixas.$$),
        (3, $$自分の良心____、正しいと思う道を選ぶ。$$, $$Escolho o caminho que acho certo à luz da minha consciência.$$),
        (4, $$国際基準____、この製品は安全だ。$$, $$Com base nos padrões internacionais, este produto é seguro.$$),
        (5, $$契約内容____、問題がないか確認した。$$, $$Verifiquei se não havia problemas à luz do contrato.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-129', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$に照らして$$),
        (1, $$に照らし$$),
        (1, $$に照らすと$$),
        (1, $$に照らせば$$),
        (2, $$に照らして$$),
        (2, $$に照らし$$),
        (2, $$に照らすと$$),
        (2, $$に照らせば$$),
        (3, $$に照らして$$),
        (3, $$に照らし$$),
        (4, $$に照らして$$),
        (4, $$に照らし$$),
        (4, $$に照らすと$$),
        (4, $$に照らせば$$),
        (5, $$に照らして$$),
        (5, $$に照らし$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
