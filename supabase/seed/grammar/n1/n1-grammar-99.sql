-- n1-grammar-99 — 〜なり
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-99',
    'grammar',
    'N1',
    $$〜なり$$,
    $$nari$$,
    $$Mal / Assim que / Logo que$$,
    $$なり indica que, assim que uma ação aconteceu, outra ação veio logo em seguida, muitas vezes de forma inesperada. Equivale a "mal..." ou "assim que...".

O sujeito das duas ações costuma ser o mesmo, e não é a própria pessoa que fala. Por exemplo, "mal chegou em casa, ele foi para o quarto".

É uma expressão um pouco literária.$$,
    $$É parecido com や否や e とたんに.

Não se usa com a primeira pessoa nem com pedidos ou intenções.

Não se confunde com なり de opções, como 〜なり〜なり.$$,
    $$Verbo (forma dicionário) + なり + Ação seguinte (passado)$$,
    $$なり$$,
    $$なり$$,
    ARRAY['なり']::text[],
    ARRAY['なり']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-99', $$彼は家に帰るなり、自分の部屋に閉じこもった。$$, $$かれはいえにかえるなり、じぶんのへやにとじこもった。$$, $$Mal chegou em casa, ele se trancou no quarto.$$),
    ('n1-grammar-99', $$彼女は私の顔を見るなり、泣き出した。$$, $$かのじょはわたしのかおをみるなり、なきだした。$$, $$Assim que viu meu rosto, ela começou a chorar.$$),
    ('n1-grammar-99', $$子供はベッドに入るなり、眠ってしまった。$$, $$こどもはベッドにはいるなり、ねむってしまった。$$, $$Mal se deitou, a criança adormeceu.$$),
    ('n1-grammar-99', $$父は新聞を読むなり、怒り出した。$$, $$ちちはしんぶんをよむなり、おこりだした。$$, $$Assim que leu o jornal, meu pai ficou bravo.$$),
    ('n1-grammar-99', $$彼は電話を切るなり、部屋を飛び出した。$$, $$かれはでんわをきるなり、へやをとびだした。$$, $$Mal desligou o telefone, ele saiu correndo do quarto.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$彼女は手紙を読む____、顔色を変えた。$$, $$Assim que leu a carta, ela mudou de expressão.$$),
        (2, $$彼は席に着く____、お酒を注文した。$$, $$Mal se sentou, ele pediu uma bebida.$$),
        (3, $$犬は主人の姿を見る____、走ってきた。$$, $$Assim que viu o dono, o cachorro veio correndo.$$),
        (4, $$兄は会社から帰る____、ソファーで寝てしまった。$$, $$Mal voltou do trabalho, meu irmão dormiu no sofá.$$),
        (5, $$彼女は部屋に入る____、窓を開けた。$$, $$Assim que entrou no quarto, ela abriu a janela.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-99', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$なり$$),
        (2, $$なり$$),
        (3, $$なり$$),
        (4, $$なり$$),
        (5, $$なり$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
