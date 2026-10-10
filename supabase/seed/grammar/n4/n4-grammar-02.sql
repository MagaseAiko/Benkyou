-- n4-grammar-02 — 〜間に
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n4-grammar-02',
    'grammar',
    'N4',
    $$〜間に$$,
    $$aida ni$$,
    $$Enquanto / Durante (em algum momento) / Antes que$$,
    $$間に é usado para dizer que algo acontece em algum momento dentro de um período, e não durante o período inteiro. Equivale a "enquanto" ou "durante".

A diferença em relação a 間 é muito importante. Com 間, a ação principal ocupa todo o período. Com 間に, a ação principal acontece uma vez, em algum ponto desse intervalo, e termina antes de o período acabar.

Por isso, o verbo principal costuma ser uma ação pontual, como chegar, terminar, fazer uma tarefa ou acontecer algo.

Muitas vezes, 間に também carrega a ideia de aproveitar uma oportunidade: fazer algo enquanto ainda dá tempo ou enquanto uma situação continua.$$,
    $$A expressão 知らない間に significa "sem perceber" ou "quando vi, já tinha acontecido".

間に é parecido com うちに, que também significa "enquanto", mas うちに destaca mais a ideia de "antes que a situação mude".

Uma dica para escolher: se a ação dura o tempo todo, use 間; se acontece uma vez no meio do período, use 間に.$$,
    $$Substantivo + の + 間に
Verbo na forma ている + 間に
Verbo de estado (いる / ある) + 間に
Adjetivo い + 間に
Adjetivo な + な + 間に

Escrita: 間に / あいだに$$,
    $$間に$$,
    $$間に|あいだに$$,
    ARRAY['間', 'に']::text[],
    ARRAY['間に', 'あいだに']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n4-grammar-02', $$留守の間に、友達が来ました。$$, $$るすのあいだに、ともだちがきました。$$, $$Enquanto eu estava fora, um amigo veio.$$),
    ('n4-grammar-02', $$赤ちゃんが寝ている間に、洗濯をします。$$, $$あかちゃんがねているあいだに、せんたくをします。$$, $$Vou lavar a roupa enquanto o bebê dorme.$$),
    ('n4-grammar-02', $$夏休みの間に、運転免許を取りたいです。$$, $$なつやすみのあいだに、うんてんめんきょをとりたいです。$$, $$Quero tirar a carteira de motorista durante as férias de verão.$$),
    ('n4-grammar-02', $$若い間に、いろいろな国へ行ってみたい。$$, $$わかいあいだに、いろいろなくにへいってみたい。$$, $$Quero conhecer vários países enquanto sou jovem.$$),
    ('n4-grammar-02', $$知らない間に、雨がやんでいた。$$, $$しらないあいだに、あめがやんでいた。$$, $$Sem eu perceber, a chuva tinha parado.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$母が買い物に行っている____、部屋を片付けました。$$, $$Enquanto minha mãe foi fazer compras, arrumei o quarto.$$),
        (2, $$日本にいる____、富士山に登りたいです。$$, $$Quero subir o Monte Fuji enquanto estiver no Japão.$$),
        (3, $$寝ている____、地震がありました。$$, $$Enquanto eu dormia, houve um terremoto.$$),
        (4, $$休みの____、引っ越しを済ませました。$$, $$Terminei a mudança durante a folga.$$),
        (5, $$気がつかない____、もう夜になっていた。$$, $$Sem eu perceber, já tinha anoitecido.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n4-grammar-02', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$間に$$),
        (1, $$あいだに$$),
        (2, $$間に$$),
        (2, $$あいだに$$),
        (3, $$間に$$),
        (3, $$あいだに$$),
        (4, $$間に$$),
        (4, $$あいだに$$),
        (5, $$間に$$),
        (5, $$あいだに$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
