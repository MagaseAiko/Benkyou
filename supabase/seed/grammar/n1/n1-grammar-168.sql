-- n1-grammar-168 — 〜始末だ
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-168',
    'grammar',
    'N1',
    $$〜始末だ$$,
    $$shimatsu da$$,
    $$Chegar ao ponto de / Acabar / E para piorar$$,
    $$始末だ indica que, depois de uma série de coisas ruins, a situação chegou a um resultado ainda pior. Equivale a "chegar ao ponto de" ou "acabar...".

O tom é de crítica, irritação ou desânimo. Por exemplo, "ele sempre se atrasa, e hoje chegou ao ponto de nem aparecer".

A primeira parte costuma descrever um problema que vinha se repetindo.$$,
    $$A expressão この始末だ significa "olha só no que deu".

É parecido com ことになった, mas 始末だ sempre indica um resultado ruim.$$,
    $$Verbo (forma dicionário) + 始末だ
この / その / あの + 始末だ$$,
    $$始末だ$$,
    $$始末だ|始末です|しまつだ$$,
    ARRAY['始末', 'だ']::text[],
    ARRAY['始末だ', '始末です', 'この始末だ']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-168', $$彼は遅刻ばかりで、ついには無断で休む始末だ。$$, $$かれはちこくばかりで、ついにはむだんでやすむしまつだ。$$, $$Ele vivia se atrasando e acabou chegando ao ponto de faltar sem avisar.$$),
    ('n1-grammar-168', $$息子は勉強しないで、とうとう学校をやめる始末だ。$$, $$むすこはべんきょうしないで、とうとうがっこうをやめるしまつだ。$$, $$Meu filho não estudava e acabou largando a escola.$$),
    ('n1-grammar-168', $$注意したのに、この始末だ。$$, $$ちゅういしたのに、このしまつだ。$$, $$Eu avisei, e olha só no que deu.$$),
    ('n1-grammar-168', $$彼女は買い物ばかりして、借金までする始末だ。$$, $$かのじょはかいものばかりして、しゃっきんまでするしまつだ。$$, $$Ela só fazia compras e chegou ao ponto de se endividar.$$),
    ('n1-grammar-168', $$弟はゲームに夢中で、食事も忘れる始末です。$$, $$おとうとはゲームにむちゅうで、しょくじもわすれるしまつです。$$, $$Meu irmão está tão vidrado no videogame que chega a esquecer de comer.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$彼は酒を飲みすぎて、道で寝てしまう____。$$, $$Ele bebe demais e chega ao ponto de dormir na rua.$$),
        (2, $$夫は家事を手伝わないどころか、文句まで言う____。$$, $$Meu marido, longe de ajudar em casa, ainda reclama.$$),
        (3, $$あれほど言ったのに、この____。$$, $$Eu disse tanto, e olha só no que deu.$$),
        (4, $$子供はわがままで、ついには親を殴る____。$$, $$A criança é mimada e acabou chegando ao ponto de bater nos pais.$$),
        (5, $$彼は嘘ばかりついて、友達もいなくなる____。$$, $$Ele só conta mentiras e acabou ficando sem amigos.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-168', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$始末だ$$),
        (1, $$始末です$$),
        (2, $$始末だ$$),
        (2, $$始末です$$),
        (3, $$始末だ$$),
        (3, $$始末です$$),
        (4, $$始末だ$$),
        (4, $$始末です$$),
        (5, $$始末だ$$),
        (5, $$始末です$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
