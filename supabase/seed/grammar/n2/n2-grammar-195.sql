-- n2-grammar-195 — 〜ずに済む
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n2-grammar-195',
    'grammar',
    'N2',
    $$〜ずに済む$$,
    $$zu ni sumu$$,
    $$Não precisar / Livrar-se de / Escapar de$$,
    $$ずに済む indica que não foi preciso fazer algo que normalmente seria necessário ou que se temia. Equivale a "não precisar" ou "livrar-se de".

Muitas vezes mostra alívio por ter evitado um trabalho, um gasto ou um problema. Por exemplo, "como um amigo me emprestou, não precisei comprar".

É a forma mais formal de なくて済む e ないで済む.$$,
    $$Atenção à forma de する, que vira せずに済む.

No passado, ずに済んだ mostra alívio por algo que não foi necessário.$$,
    $$Verbo (forma ない sem ない) + ずに済む
する → せずに済む$$,
    $$ずに済む$$,
    $$ずに済|ずにすむ|ずにすん$$,
    ARRAY['ず', 'に', '済む']::text[],
    ARRAY['ずに済む', 'ずに済んだ', 'せずに済む']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n2-grammar-195', $$友達が貸してくれたので、辞書を買わずに済んだ。$$, $$ともだちがかしてくれたので、じしょをかわずにすんだ。$$, $$Como um amigo me emprestou, não precisei comprar o dicionário.$$),
    ('n2-grammar-195', $$早めに薬を飲んだので、ひどくならずに済んだ。$$, $$はやめにくすりをのんだので、ひどくならずにすんだ。$$, $$Como tomei o remédio cedo, não piorou.$$),
    ('n2-grammar-195', $$近所に引っ越せば、電車に乗らずに済む。$$, $$きんじょにひっこせば、でんしゃにのらずにすむ。$$, $$Se me mudar para perto, não vou precisar pegar trem.$$),
    ('n2-grammar-195', $$事前に連絡したので、待たずに済んだ。$$, $$じぜんにれんらくしたので、またずにすんだ。$$, $$Como avisei antes, não precisei esperar.$$),
    ('n2-grammar-195', $$説明書を読めば、人に聞かずに済む。$$, $$せつめいしょをよめば、ひとにきかずにすむ。$$, $$Lendo o manual, você não precisa perguntar a ninguém.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$バスが来たので、雨の中を歩か____。$$, $$Como o ônibus chegou, não precisei andar na chuva.$$),
        (2, $$上手に説明すれば、けんかせ____。$$, $$Se explicar bem, dá para evitar a briga.$$),
        (3, $$母が作ってくれたので、料理をせ____。$$, $$Como minha mãe cozinhou, não precisei fazer comida.$$),
        (4, $$ネットで申し込めば、窓口に行か____。$$, $$Se fizer a inscrição pela internet, não precisa ir ao guichê.$$),
        (5, $$保険に入っていたので、お金を払わ____。$$, $$Como eu tinha seguro, não precisei pagar.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n2-grammar-195', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$ずに済んだ$$),
        (1, $$ずにすんだ$$),
        (2, $$ずに済む$$),
        (2, $$ずにすむ$$),
        (3, $$ずに済んだ$$),
        (3, $$ずにすんだ$$),
        (4, $$ずに済む$$),
        (4, $$ずにすむ$$),
        (5, $$ずに済んだ$$),
        (5, $$ずにすんだ$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
