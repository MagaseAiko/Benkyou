-- n5-grammar-89 — 〜が好き・〜が嫌い
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n5-grammar-89',
    'grammar',
    'N5',
    $$〜が好き・〜が嫌い$$,
    $$ga suki / ga kirai$$,
    $$Gostar de / Não gostar de / Detestar$$,
    $$が好き e が嫌い são usados para falar do que alguém gosta ou não gosta. Equivalem a "gostar de" e "não gostar de".

好き e 嫌い não são verbos, e sim adjetivos な. Por isso, a coisa de que se gosta é marcada com が, e não com を. A pessoa que sente o gosto costuma vir com は.

Para dar mais força, usa-se 大好き (adorar) e 大嫌い (detestar).

Para falar de ações, como gostar de ler ou de nadar, é preciso transformar o verbo em substantivo com の: のが好き.

Antes de um substantivo, eles recebem な, como em "comida favorita" ou "pessoa de quem não gosto".$$,
    $$嫌い soa forte em japonês. Para dizer de forma mais suave que não gosta de algo, os japoneses preferem あまり好きじゃない.

Embora 嫌い termine em い, ele é um adjetivo な. O negativo é 嫌いじゃない, e não 嫌くない.

好き também é usado para falar de gostar de uma pessoa no sentido romântico, dependendo do contexto.$$,
    $$Substantivo + が + 好き / 嫌い + です / だ
Substantivo + が + 大好き / 大嫌い + です / だ
Verbo + のが + 好き / 嫌い
好きな / 嫌いな + Substantivo

Negativo: が好きじゃない / が好きではありません
Passado: が好きでした / が嫌いでした

Escrita: 好き / すき, 嫌い / きらい$$,
    $$好き$$,
    $$が好き|が嫌い|がすき|がきらい|が大好き|が大嫌い|がだいすき|がだいきらい$$,
    ARRAY['が', '好き', '嫌い']::text[],
    ARRAY['が好き', 'が嫌い', 'がすき', 'がきらい', 'が大好き', 'が大嫌い']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n5-grammar-89', $$私は猫が好きです。$$, $$わたしはねこがすきです。$$, $$Eu gosto de gatos.$$),
    ('n5-grammar-89', $$弟は野菜が嫌いです。$$, $$おとうとはやさいがきらいです。$$, $$Meu irmão mais novo não gosta de verdura.$$),
    ('n5-grammar-89', $$母は花が大好きです。$$, $$はははながだいすきです。$$, $$Minha mãe adora flores.$$),
    ('n5-grammar-89', $$田中さんはどんな音楽が好きですか。$$, $$たなかさんはどんなおんがくがすきですか。$$, $$Que tipo de música o Tanaka gosta?$$),
    ('n5-grammar-89', $$子供のころ、牛乳が嫌いでした。$$, $$こどものころ、ぎゅうにゅうがきらいでした。$$, $$Quando era criança, eu não gostava de leite.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$私は日本の料理____です。$$, $$Eu gosto de comida japonesa.$$),
        (2, $$兄は虫____です。$$, $$Meu irmão mais velho detesta insetos.$$),
        (3, $$どんなスポーツ____ですか。$$, $$De que esporte você gosta?$$),
        (4, $$子供のころ、勉強____でした。$$, $$Quando era criança, eu não gostava de estudar.$$),
        (5, $$私はあまりお酒____じゃありません。$$, $$Eu não gosto muito de bebida alcoólica.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n5-grammar-89', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$が好き$$),
        (1, $$がすき$$),
        (1, $$が大好き$$),
        (1, $$がだいすき$$),
        (2, $$が嫌い$$),
        (2, $$がきらい$$),
        (2, $$が大嫌い$$),
        (2, $$がだいきらい$$),
        (3, $$が好き$$),
        (3, $$がすき$$),
        (4, $$が嫌い$$),
        (4, $$がきらい$$),
        (4, $$が大嫌い$$),
        (4, $$がだいきらい$$),
        (5, $$が好き$$),
        (5, $$がすき$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
