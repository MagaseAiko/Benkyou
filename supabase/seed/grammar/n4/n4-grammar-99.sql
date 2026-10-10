-- n4-grammar-99 — 〜てもらう
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n4-grammar-99',
    'grammar',
    'N4',
    $$〜てもらう$$,
    $$te morau$$,
    $$Receber (o favor de) / Pedir para alguém fazer$$,
    $$てもらう é usado quando quem fala recebe uma ação de outra pessoa como favor. Equivale a "receber o favor de" ou "ter alguém que faça algo por você".

Ele junta a forma て do verbo com もらう (receber). A ideia é "recebi de alguém a ação de...".

A diferença em relação a てくれる é o foco. Com てくれる, o sujeito é quem faz o favor ("meu amigo me ajudou"). Com てもらう, o sujeito é quem recebe ("eu recebi ajuda do meu amigo"). A pessoa que fez a ação é marcada com に.

Muitas vezes, てもらう também indica que quem fala pediu a ação, como pedir para alguém cortar o cabelo ou consertar algo.

Com superiores, a forma humilde é ていただく.$$,
    $$Para traduzir, muitas vezes é mais natural inverter: 友達に手伝ってもらった vira "meu amigo me ajudou".

Na pergunta てもらえませんか, o pedido soa mais educado que てくれませんか.

Com てもらう, quem fala geralmente é o beneficiário. Por isso, ela expressa gratidão de forma indireta.$$,
    $$Pessoa + に + Objeto + を + Verbo na forma て + もらう

Passado: てもらった / てもらいました
Pedido: てもらえませんか / てもらえますか
Humilde: ていただく$$,
    $$てもらう$$,
    $$てもら|でもら$$,
    ARRAY['て', 'もらう']::text[],
    ARRAY['てもらう', 'てもらった', 'てもらいました', 'てもらえませんか']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n4-grammar-99', $$友達に宿題を手伝ってもらいました。$$, $$ともだちにしゅくだいをてつだってもらいました。$$, $$Meu amigo me ajudou com a lição.$$),
    ('n4-grammar-99', $$母に髪を切ってもらった。$$, $$ははにかみをきってもらった。$$, $$Minha mãe cortou meu cabelo.$$),
    ('n4-grammar-99', $$先生に作文を直してもらいました。$$, $$せんせいにさくぶんをなおしてもらいました。$$, $$O professor corrigiu minha redação.$$),
    ('n4-grammar-99', $$医者に診てもらったほうがいいですよ。$$, $$いしゃにみてもらったほうがいいですよ。$$, $$É melhor você se consultar com um médico.$$),
    ('n4-grammar-99', $$兄にパソコンの使い方を教えてもらった。$$, $$あににパソコンのつかいかたをおしえてもらった。$$, $$Meu irmão mais velho me ensinou a usar o computador.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$田中さんに駅まで送っ____。$$, $$O Tanaka me levou até a estação.$$),
        (2, $$父に自転車を直し____。$$, $$Meu pai consertou minha bicicleta.$$),
        (3, $$友達に写真を撮っ____。$$, $$Pedi para um amigo tirar uma foto minha.$$),
        (4, $$店の人にケーキを箱に入れ____。$$, $$O atendente colocou o bolo numa caixa para mim.$$),
        (5, $$姉に日本語の手紙を読ん____。$$, $$Minha irmã mais velha leu a carta em japonês para mim.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n4-grammar-99', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$てもらいました$$),
        (1, $$てもらった$$),
        (2, $$てもらいました$$),
        (2, $$てもらった$$),
        (3, $$てもらいました$$),
        (3, $$てもらった$$),
        (4, $$てもらいました$$),
        (4, $$てもらった$$),
        (5, $$でもらいました$$),
        (5, $$でもらった$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
