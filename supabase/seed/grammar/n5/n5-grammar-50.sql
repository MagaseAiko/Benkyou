-- n5-grammar-50 — に・へ
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n5-grammar-50',
    'grammar',
    'N5',
    $$に・へ$$,
    $$ni / e$$,
    $$Para / A / Em direção a$$,
    $$に e へ são usadas para indicar o destino de um movimento, com verbos como ir, vir, voltar e virar. As duas podem ser traduzidas como "para" ou "a".

Na maioria das frases com verbos de movimento, as duas funcionam e o sentido é praticamente o mesmo. A diferença é de foco: に destaca o ponto de chegada, o lugar exato aonde se chega; へ destaca a direção, o caminho em direção a algum lugar.

Por causa dessa ideia de direção, へ combina bem com cartas, mensagens e palavras de direção, como "à direita" ou "para cá".

Uma diferença prática importante: só へ pode ser seguida por の para formar um modificador, como "uma carta para minha mãe". Com に, isso não é possível.$$,
    $$A partícula へ é escrita com o caractere へ, mas é pronunciada "e". É a mesma situação de は, que é lida "wa" quando é partícula.

Em frases educadas de recepção, como こちらへどうぞ, へ é a escolha natural.

Para usos que não são de movimento, como horário, existência e pessoa que recebe algo, só に funciona.$$,
    $$Lugar + に + Verbo de movimento
Lugar + へ + Verbo de movimento
Substantivo + への + Substantivo (só へ)$$,
    $$に$$,
    $$に|へ$$,
    ARRAY['に', 'へ']::text[],
    ARRAY['に', 'へ']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n5-grammar-50', $$明日、東京へ行きます。$$, $$あした、とうきょうへいきます。$$, $$Amanhã vou para Tóquio.$$),
    ('n5-grammar-50', $$毎日八時に会社に行きます。$$, $$まいにちはちじにかいしゃにいきます。$$, $$Todo dia vou para a empresa às oito.$$),
    ('n5-grammar-50', $$夏休みに国へ帰りました。$$, $$なつやすみにくにへかえりました。$$, $$Nas férias de verão, voltei para o meu país.$$),
    ('n5-grammar-50', $$こちらへどうぞ。$$, $$こちらへどうぞ。$$, $$Por aqui, por favor.$$),
    ('n5-grammar-50', $$これは母への手紙です。$$, $$これはははへのてがみです。$$, $$Esta é uma carta para minha mãe.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$来週、大阪____行きます。$$, $$Semana que vem, vou para Osaka.$$),
        (2, $$何時に家____帰りますか。$$, $$A que horas você volta para casa?$$),
        (3, $$昨日、友達が私の家____来ました。$$, $$Ontem, um amigo veio à minha casa.$$),
        (4, $$これは先生____のプレゼントです。$$, $$Este é um presente para o professor.$$),
        (5, $$次の角を右____曲がってください。$$, $$Vire à direita na próxima esquina, por favor.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n5-grammar-50', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$に$$),
        (1, $$へ$$),
        (2, $$に$$),
        (2, $$へ$$),
        (3, $$に$$),
        (3, $$へ$$),
        (4, $$へ$$),
        (5, $$に$$),
        (5, $$へ$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
