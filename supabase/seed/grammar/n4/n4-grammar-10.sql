-- n4-grammar-10 — 〜でございます
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n4-grammar-10',
    'grammar',
    'N4',
    $$〜でございます$$,
    $$de gozaimasu$$,
    $$É (muito formal) / Trata-se de$$,
    $$でございます é a forma extremamente educada de です. Ela tem o mesmo significado, "é", mas mostra muito respeito pelo ouvinte.

É usada principalmente por funcionários de lojas, hotéis, restaurantes, empresas e serviços de atendimento ao cliente. Também aparece em anúncios, ligações de trabalho e situações muito formais.

Ela faz parte do 丁寧語, a linguagem polida que deixa a frase mais elegante sem elevar nem rebaixar ninguém em especial. Quem fala está sendo gentil com quem ouve.

No dia a dia, entre colegas ou amigos, でございます soaria exagerado. O normal é usar です.$$,
    $$Ao atender o telefone no trabalho, é comum dizer o nome da empresa ou o próprio sobrenome seguido de でございます.

ございます sozinho é a forma polida de あります. Com で, ele substitui です.

Com adjetivos い, não se usa でございます. Existe uma forma especial e rara, mas, no uso comum, basta usar です.$$,
    $$Substantivo + でございます
Adjetivo な (sem な) + でございます

Passado: でございました
Pergunta: でございますか$$,
    $$でございます$$,
    $$でございます|でございました$$,
    ARRAY['で', 'ございます']::text[],
    ARRAY['でございます', 'でございました', 'でございますか']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n4-grammar-10', $$こちらが会議室でございます。$$, $$こちらがかいぎしつでございます。$$, $$Esta é a sala de reuniões.$$),
    ('n4-grammar-10', $$お手洗いは二階でございます。$$, $$おてあらいはにかいでございます。$$, $$O banheiro fica no segundo andar.$$),
    ('n4-grammar-10', $$本日は休業日でございます。$$, $$ほんじつはきゅうぎょうびでございます。$$, $$Hoje é dia de folga do estabelecimento.$$),
    ('n4-grammar-10', $$はい、山田でございます。$$, $$はい、やまだでございます。$$, $$Alô, aqui é o Yamada.$$),
    ('n4-grammar-10', $$お会計は三千円でございます。$$, $$おかいけいはさんぜんえんでございます。$$, $$O total da conta é três mil ienes.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$受付は一階____。$$, $$A recepção fica no primeiro andar.$$),
        (2, $$こちらが新しい商品____。$$, $$Este é o novo produto.$$),
        (3, $$「はい、さくら銀行____。」$$, $$"Alô, aqui é o Banco Sakura."$$),
        (4, $$エレベーターはあちら____。$$, $$O elevador fica para lá.$$),
        (5, $$申し訳ございません、その商品は売り切れ____。$$, $$Pedimos desculpas, esse produto está esgotado.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n4-grammar-10', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$でございます$$),
        (2, $$でございます$$),
        (3, $$でございます$$),
        (4, $$でございます$$),
        (5, $$でございます$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
