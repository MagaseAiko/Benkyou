-- n4-grammar-91 — 〜てあげる
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n4-grammar-91',
    'grammar',
    'N4',
    $$〜てあげる$$,
    $$te ageru$$,
    $$Fazer (algo) para alguém / Fazer o favor de$$,
    $$てあげる é usado para dizer que você, ou alguém do seu grupo, faz algo em benefício de outra pessoa. Equivale a "fazer algo para alguém".

Ele junta a forma て do verbo com あげる (dar). A ideia é "dar" uma ação como favor: ensinar, ajudar, comprar algo, emprestar.

A pessoa que recebe o favor é marcada com に, e quem faz a ação costuma ser o sujeito.

Um ponto cultural importante: como てあげる destaca que você está fazendo um favor, usá-lo diretamente com superiores, ou ao oferecer ajuda a alguém que não é próximo, pode soar arrogante. Nesses casos, prefere-se ましょうか ou formas humildes como お〜します.

Com pessoas próximas, crianças e animais, てあげる é natural.$$,
    $$Para crianças, animais e plantas, também se usa てやる, que é mais informal.

Para ações feitas por outros em seu benefício, usa-se てくれる; para ações que você pede ou recebe, usa-se てもらう.

Ao contar algo que você fez por alguém, てあげた é natural entre amigos, mas pode soar como se gabar se exagerado.$$,
    $$Pessoa + に + Objeto + を + Verbo na forma て + あげる
Verbo na forma て + あげる

Passado: てあげた / てあげました
Pedido para outra pessoa: てあげてください
Mais humilde: てさしあげる$$,
    $$てあげる$$,
    $$てあげ|であげ$$,
    ARRAY['て', 'あげる']::text[],
    ARRAY['てあげる', 'てあげた', 'てあげました', 'てあげて']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n4-grammar-91', $$弟に宿題を教えてあげました。$$, $$おとうとにしゅくだいをおしえてあげました。$$, $$Ensinei a lição para o meu irmão mais novo.$$),
    ('n4-grammar-91', $$友達の引っ越しを手伝ってあげた。$$, $$ともだちのひっこしをてつだってあげた。$$, $$Ajudei meu amigo na mudança.$$),
    ('n4-grammar-91', $$母の日に、母に花を買ってあげたいです。$$, $$ははのひに、ははにはなをかってあげたいです。$$, $$No Dia das Mães, quero comprar flores para minha mãe.$$),
    ('n4-grammar-91', $$毎晩、子供に本を読んであげます。$$, $$まいばん、こどもにほんをよんであげます。$$, $$Toda noite, leio um livro para o meu filho.$$),
    ('n4-grammar-91', $$道に迷っている人に、駅までの道を教えてあげた。$$, $$みちにまよっているひとに、えきまでのみちをおしえてあげた。$$, $$Ensinei o caminho até a estação para uma pessoa que estava perdida.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$妹に新しい服を買っ____。$$, $$Comprei roupas novas para a minha irmã mais nova.$$),
        (2, $$駅で、おばあさんの荷物を持っ____。$$, $$Na estação, carreguei a bagagem de uma senhora idosa.$$),
        (3, $$友達に私の辞書を貸し____。$$, $$Emprestei meu dicionário para um amigo.$$),
        (4, $$毎晩、子供に絵本を読ん____います。$$, $$Toda noite, leio livros ilustrados para o meu filho.$$),
        (5, $$困っている人がいたら、助け____ください。$$, $$Se houver alguém em dificuldade, ajude, por favor.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n4-grammar-91', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$てあげました$$),
        (1, $$てあげた$$),
        (2, $$てあげました$$),
        (2, $$てあげた$$),
        (3, $$てあげました$$),
        (3, $$てあげた$$),
        (4, $$であげて$$),
        (5, $$てあげて$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
