-- n5-grammar-70 — 〜てもいいです
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n5-grammar-70',
    'grammar',
    'N5',
    $$〜てもいいです$$,
    $$te mo ii desu$$,
    $$Pode / É permitido / Tudo bem se$$,
    $$てもいいです é usado para dar ou pedir permissão. Equivale a "pode" ou "tudo bem se...".

Literalmente, a estrutura significa "mesmo fazendo isso, está bom". Ou seja, a ação é aceitável.

Em perguntas, てもいいですか é a forma padrão de pedir permissão educadamente, como "posso abrir a janela?". Em afirmações, serve para permitir algo a alguém.

Na fala informal, usa-se てもいい?, sem です. E, para soar mais leve, também se usa ても大丈夫.$$,
    $$Para responder positivamente a um pedido de permissão, as respostas mais comuns são はい、どうぞ e ええ、いいですよ.

Para negar, os japoneses costumam suavizar com すみません、ちょっと…, em vez de dizer てはいけません diretamente.

O oposto de てもいい é てはいけない. E o oposto de "precisar" é なくてもいい.$$,
    $$Verbo na forma て + も + いい / いいです
Pergunta: Verbo て + もいいですか
Informal: Verbo て + もいい？

Variações: ても大丈夫 / てもかまいません (mais formal)$$,
    $$てもいい$$,
    $$てもいい|でもいい|ても大丈夫|でも大丈夫|てもかまいません|でもかまいません$$,
    ARRAY['て', 'も', 'いい']::text[],
    ARRAY['てもいい', 'てもいいです', 'でもいい', 'ても大丈夫', 'てもかまいません']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n5-grammar-70', $$窓を開けてもいいですか。$$, $$まどをあけてもいいですか。$$, $$Posso abrir a janela?$$),
    ('n5-grammar-70', $$ここで写真を撮ってもいいです。$$, $$ここでしゃしんをとってもいいです。$$, $$Pode tirar fotos aqui.$$),
    ('n5-grammar-70', $$この本、借りてもいい？$$, $$このほん、かりてもいい？$$, $$Posso pegar este livro emprestado?$$),
    ('n5-grammar-70', $$「入ってもいいですか。」「はい、どうぞ。」$$, $$「はいってもいいですか。」「はい、どうぞ。」$$, $$"Posso entrar?" "Sim, fique à vontade."$$),
    ('n5-grammar-70', $$鉛筆で書いても大丈夫ですよ。$$, $$えんぴつでかいてもだいじょうぶですよ。$$, $$Tudo bem se escrever a lápis.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$すみません、ちょっとトイレに行っ____か。$$, $$Com licença, posso ir ao banheiro rapidinho?$$),
        (2, $$ここに座っ____か。$$, $$Posso me sentar aqui?$$),
        (3, $$疲れたら、休ん____ですよ。$$, $$Se ficar cansado, pode descansar.$$),
        (4, $$このペン、使っ____？$$, $$Posso usar esta caneta?$$),
        (5, $$「タバコを吸っ____か。」「すみません、ここはちょっと…。」$$, $$"Posso fumar?" "Desculpe, aqui não dá..."$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n5-grammar-70', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$てもいいです$$),
        (2, $$てもいいです$$),
        (3, $$でもいい$$),
        (4, $$てもいい$$),
        (5, $$てもいいです$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
