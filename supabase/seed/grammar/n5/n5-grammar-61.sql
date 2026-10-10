-- n5-grammar-61 — 〜すぎる
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n5-grammar-61',
    'grammar',
    'N5',
    $$〜すぎる$$,
    $$sugiru$$,
    $$Demais / Excessivamente$$,
    $$すぎる é usado para dizer que algo passou do limite, ou seja, é "demais". Equivale a "demais" ou "excessivamente".

O verbo すぎる sozinho significa "passar", "ultrapassar". Quando é ligado a outra palavra, ele mostra que aquela ação ou característica foi além do normal ou do adequado.

Com verbos, tira-se ます e acrescenta-se すぎる, como em "comer demais". Com adjetivos い, tira-se o い. Com adjetivos な, basta tirar o な.

Na maioria das vezes, すぎる tem um tom negativo: indica que o excesso causou algum problema. Por isso, é comum aparecer na forma すぎて, ligando o excesso ao resultado.

Depois de ligado, すぎる se conjuga como um verbo comum: すぎます, すぎた, すぎて.$$,
    $$Na fala jovem, すぎる às vezes é usado de forma positiva, como em elogios exagerados. Mesmo assim, o sentido básico é "passou do ponto".

O substantivo すぎ também existe, como em 食べすぎ e 飲みすぎ, que significam "o excesso de comer" e "o excesso de beber".

Com adjetivos い terminados em ない, como 少ない, a forma é 少なすぎる, sem さ. O さ aparece apenas com ない sozinho e com adjetivos formados com ない.$$,
    $$Verbo na forma ます sem ます + すぎる
Adjetivo い sem い + すぎる
Adjetivo な (sem な) + すぎる

Exceções: いい → よすぎる / ない → なさすぎる

Educado: すぎます
Passado: すぎた / すぎました
Ligando: すぎて

Escrita: すぎる / 過ぎる$$,
    $$すぎる$$,
    $$すぎる|すぎます|すぎました|すぎた|すぎて|過ぎる|過ぎます|過ぎた|過ぎて$$,
    ARRAY['すぎる']::text[],
    ARRAY['すぎる', 'すぎます', 'すぎた', 'すぎました', 'すぎて', '過ぎる']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n5-grammar-61', $$昨日は食べすぎました。$$, $$きのうはたべすぎました。$$, $$Ontem comi demais.$$),
    ('n5-grammar-61', $$このかばんは高すぎます。$$, $$このかばんはたかすぎます。$$, $$Esta bolsa é cara demais.$$),
    ('n5-grammar-61', $$この部屋は静かすぎて、ちょっと怖い。$$, $$このへやはしずかすぎて、ちょっとこわい。$$, $$Este quarto é silencioso demais, dá um pouco de medo.$$),
    ('n5-grammar-61', $$お酒を飲みすぎて、頭が痛いです。$$, $$おさけをのみすぎて、あたまがいたいです。$$, $$Bebi demais e estou com dor de cabeça.$$),
    ('n5-grammar-61', $$この問題は難しすぎて、全然わからない。$$, $$このもんだいはむずかしすぎて、ぜんぜんわからない。$$, $$Esta questão é difícil demais, não entendo nada.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$このカレーは辛____。$$, $$Este curry é apimentado demais.$$),
        (2, $$昨日はテレビを見____、目が痛いです。$$, $$Ontem vi TV demais e estou com os olhos doendo.$$),
        (3, $$この靴は私には大き____。$$, $$Estes sapatos são grandes demais para mim.$$),
        (4, $$昨日の夜、ゲームをし____。$$, $$Ontem à noite, joguei videogame demais.$$),
        (5, $$彼の説明は簡単____、よくわかりませんでした。$$, $$A explicação dele foi simples demais, e eu não entendi direito.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n5-grammar-61', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$すぎます$$),
        (1, $$すぎる$$),
        (2, $$すぎて$$),
        (3, $$すぎます$$),
        (3, $$すぎる$$),
        (4, $$すぎました$$),
        (4, $$すぎた$$),
        (5, $$すぎて$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
