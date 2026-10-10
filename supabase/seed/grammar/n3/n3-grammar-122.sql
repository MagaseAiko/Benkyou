-- n3-grammar-122 — 例えば
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n3-grammar-122',
    'grammar',
    'N3',
    $$例えば$$,
    $$tatoeba$$,
    $$Por exemplo / Digamos que$$,
    $$例えば significa "por exemplo". Ele é usado para dar exemplos concretos de algo mais geral.

Muitas vezes, aparece depois de uma categoria, separada por vírgula: "frutas, por exemplo maçã e mexerica". Também é comum junto com や e など, que reforçam a ideia de exemplos.

No começo de uma pergunta ou hipótese, 例えば significa "digamos que" ou "suponha que", apresentando uma situação imaginária para discutir. Por exemplo, "digamos que você tivesse cem milhões de ienes, em que gastaria?".

É usado tanto na fala quanto na escrita, e é muito útil em explicações e apresentações.$$,
    $$例えば vem de 例 (exemplo), a mesma raiz de 例文 (frase de exemplo).

Não confunda com たとえ〜ても (mesmo que), que tem a mesma origem, mas outro uso.

Em apresentações, 例えば ajuda a deixar explicações abstratas mais claras.$$,
    $$Categoria、 + 例えば + Exemplo(s) + や / など
例えば、 + Exemplo + …
例えば、 + Hipótese + たら / なら + Pergunta (digamos que...)

Escrita: 例えば / たとえば$$,
    $$例えば$$,
    $$例えば|たとえば$$,
    ARRAY['例えば']::text[],
    ARRAY['例えば', 'たとえば']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n3-grammar-122', $$私は果物、例えばりんごやみかんが好きです。$$, $$わたしはくだもの、たとえばりんごやみかんがすきです。$$, $$Eu gosto de frutas, por exemplo maçã e mexerica.$$),
    ('n3-grammar-122', $$例えば、日本に住むならどこがいいですか。$$, $$たとえば、にほんにすむならどこがいいですか。$$, $$Digamos que você fosse morar no Japão. Onde seria bom?$$),
    ('n3-grammar-122', $$スポーツ、例えばサッカーやテニスをします。$$, $$スポーツ、たとえばサッカーやテニスをします。$$, $$Pratico esportes, por exemplo futebol e tênis.$$),
    ('n3-grammar-122', $$例えば、一億円あったら何に使いますか。$$, $$たとえば、いちおくえんあったらなににつかいますか。$$, $$Digamos que você tivesse cem milhões de ienes. Em que gastaria?$$),
    ('n3-grammar-122', $$日本料理、例えばすしや天ぷらは外国でも人気がある。$$, $$にほんりょうり、たとえばすしやてんぷらはがいこくでもにんきがある。$$, $$A culinária japonesa, por exemplo sushi e tempurá, também é popular no exterior.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$日本の祭り、____祇園祭は有名だ。$$, $$Os festivais japoneses, por exemplo o Gion Matsuri, são famosos.$$),
        (2, $$____、明日雨だったらどうしますか。$$, $$Digamos que amanhã chova. O que você vai fazer?$$),
        (3, $$漢字、____「山」や「川」は簡単だ。$$, $$Alguns kanji, por exemplo "montanha" e "rio", são fáceis.$$),
        (4, $$体にいい食べ物、____野菜や魚を食べましょう。$$, $$Vamos comer alimentos saudáveis, por exemplo verduras e peixes.$$),
        (5, $$____、あなたが社長だったら、何をしますか。$$, $$Digamos que você fosse o presidente. O que faria?$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n3-grammar-122', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$例えば$$),
        (1, $$たとえば$$),
        (2, $$例えば$$),
        (2, $$たとえば$$),
        (3, $$例えば$$),
        (3, $$たとえば$$),
        (4, $$例えば$$),
        (4, $$たとえば$$),
        (5, $$例えば$$),
        (5, $$たとえば$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
