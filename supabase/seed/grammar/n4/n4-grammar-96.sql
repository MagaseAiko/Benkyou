-- n4-grammar-96 — 〜てくれる
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n4-grammar-96',
    'grammar',
    'N4',
    $$〜てくれる$$,
    $$te kureru$$,
    $$Fazer (algo) por mim / Fazer o favor de$$,
    $$てくれる é usado quando outra pessoa faz algo em benefício de quem fala ou do seu grupo. Equivale a "fazer algo por mim" ou "fazer o favor de".

Ele junta a forma て do verbo com くれる (dar para mim). A ideia é que alguém "deu" uma ação em seu favor.

Quem faz a ação é o sujeito, marcado com が ou は. Quem recebe o favor costuma ser "eu", e geralmente não aparece na frase.

Usar てくれる mostra gratidão. Por isso, os japoneses o usam muito ao contar o que outras pessoas fizeram por eles.

Na forma de pergunta negativa, てくれない？ ou てくれませんか, ele vira um pedido: "você poderia...?".$$,
    $$A escolha entre てあげる, てくれる e てもらう depende de quem faz e de quem recebe. てくれる sempre tem quem fala (ou seu grupo) como beneficiário.

Sem てくれる, uma frase como "meu amigo me levou até a estação" soaria fria em japonês, como se não houvesse gratidão.

Com superiores, a forma respeitosa é てくださる.$$,
    $$Pessoa + が + Verbo na forma て + くれる
Pessoa + が + (私に) + Objeto + を + Verbo て + くれる

Passado: てくれた / てくれました
Pedido: てくれる？ / てくれない？ / てくれませんか
Respeitoso: てくださる$$,
    $$てくれる$$,
    $$てくれ|でくれ$$,
    ARRAY['て', 'くれる']::text[],
    ARRAY['てくれる', 'てくれた', 'てくれました', 'てくれない', 'てくれませんか']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n4-grammar-96', $$友達が駅まで送ってくれました。$$, $$ともだちがえきまでおくってくれました。$$, $$Meu amigo me levou até a estação.$$),
    ('n4-grammar-96', $$今朝、母がお弁当を作ってくれた。$$, $$けさ、ははがおべんとうをつくってくれた。$$, $$Hoje de manhã, minha mãe fez marmita para mim.$$),
    ('n4-grammar-96', $$先輩が仕事を手伝ってくれました。$$, $$せんぱいがしごとをてつだってくれました。$$, $$Meu veterano me ajudou no trabalho.$$),
    ('n4-grammar-96', $$彼はいつも私の話を聞いてくれる。$$, $$かれはいつもわたしのはなしをきいてくれる。$$, $$Ele sempre me escuta.$$),
    ('n4-grammar-96', $$ちょっと窓を開けてくれない？$$, $$ちょっとまどをあけてくれない？$$, $$Você pode abrir a janela rapidinho?$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$雨の日に、田中さんが傘を貸し____。$$, $$Num dia de chuva, o Tanaka me emprestou o guarda-chuva.$$),
        (2, $$父が誕生日に時計を買っ____。$$, $$Meu pai me comprou um relógio de aniversário.$$),
        (3, $$日本人の友達が日本語を教え____。$$, $$Um amigo japonês me ensinou japonês.$$),
        (4, $$ねえ、ちょっと手伝っ____？$$, $$Ei, você pode me ajudar um pouco?$$),
        (5, $$姉が私の代わりに荷物を運ん____。$$, $$Minha irmã mais velha carregou a bagagem no meu lugar.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n4-grammar-96', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$てくれました$$),
        (1, $$てくれた$$),
        (2, $$てくれました$$),
        (2, $$てくれた$$),
        (3, $$てくれました$$),
        (3, $$てくれた$$),
        (4, $$てくれない$$),
        (4, $$てくれる$$),
        (5, $$でくれました$$),
        (5, $$でくれた$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
