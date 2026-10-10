-- n1-grammar-122 — 〜に忍びない
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-122',
    'grammar',
    'N1',
    $$〜に忍びない$$,
    $$ni shinobinai$$,
    $$Não ter coragem de / Não suportar / Dar pena de$$,
    $$に忍びない indica que a pessoa não consegue fazer algo porque sentiria muita pena, culpa ou dor emocional. Equivale a "não ter coragem de" ou "dar pena de".

Costuma vir com verbos como jogar fora, ver, ouvir ou dizer. Por exemplo, "não tenho coragem de jogar fora as roupas antigas do meu filho".

É uma expressão formal e emotiva.$$,
    $$Expressões comuns são 見るに忍びない, 聞くに忍びない, 捨てるに忍びない e 断るに忍びない.

É parecido com とても〜できない, mas に忍びない destaca o sentimento de pena.$$,
    $$Verbo (forma dicionário) + に忍びない
Substantivo (ação) + に忍びない$$,
    $$に忍びない$$,
    $$に忍びない|に忍びなかった|にしのびない|に忍びなく$$,
    ARRAY['に', '忍びない']::text[],
    ARRAY['に忍びない', 'に忍びなく']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-122', $$子供の古い服は、捨てるに忍びない。$$, $$こどものふるいふくは、すてるにしのびない。$$, $$Não tenho coragem de jogar fora as roupas antigas do meu filho.$$),
    ('n1-grammar-122', $$事故の現場は見るに忍びなかった。$$, $$じこのげんばはみるにしのびなかった。$$, $$Não suportei olhar a cena do acidente.$$),
    ('n1-grammar-122', $$彼のつらい話は、聞くに忍びない。$$, $$かれのつらいはなしは、きくにしのびない。$$, $$Dá pena ouvir a história triste dele.$$),
    ('n1-grammar-122', $$一生懸命頼まれると、断るに忍びない。$$, $$いっしょうけんめいたのまれると、ことわるにしのびない。$$, $$Quando me pedem com tanto empenho, não tenho coragem de recusar.$$),
    ('n1-grammar-122', $$思い出の写真は、捨てるに忍びなくて、ずっと持っている。$$, $$おもいでのしゃしんは、すてるにしのびなくて、ずっともっている。$$, $$Não tenho coragem de jogar fora as fotos de recordação, então guardo todas.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$祖母の形見は、処分する____。$$, $$Não tenho coragem de me desfazer das lembranças da minha avó.$$),
        (2, $$病気で苦しむ犬の姿は、見る____。$$, $$Não suporto ver meu cachorro sofrendo com a doença.$$),
        (3, $$彼女にその事実を伝える____。$$, $$Não tenho coragem de contar esse fato a ela.$$),
        (4, $$せっかくの料理を残す____。$$, $$Dá pena deixar a comida que foi feita com tanto carinho.$$),
        (5, $$その悲惨な話は、聞く____ものだった。$$, $$Aquela história trágica era insuportável de ouvir.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-122', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$に忍びない$$),
        (1, $$にしのびない$$),
        (2, $$に忍びない$$),
        (2, $$にしのびない$$),
        (3, $$に忍びない$$),
        (3, $$にしのびない$$),
        (4, $$に忍びない$$),
        (4, $$にしのびない$$),
        (5, $$に忍びない$$),
        (5, $$にしのびない$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
