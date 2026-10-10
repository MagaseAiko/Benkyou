-- n3-grammar-177 — 〜ように見える
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n3-grammar-177',
    'grammar',
    'N3',
    $$〜ように見える$$,
    $$you ni mieru$$,
    $$Parece / Dá a impressão de / Parece como se$$,
    $$ように見える é usado para dizer como algo ou alguém parece, a partir da aparência, muitas vezes de forma diferente da realidade. Equivale a "parece", "dá a impressão de" ou "parece como se".

Ele junta ように (como, de modo parecido a) com 見える (parecer, ser visto). A ideia é "dá a impressão visual de ser assim".

Ele vem depois da forma simples de verbos e adjetivos, de adjetivos な com な e de substantivos com の.

É muito usado quando a aparência engana: "ela parecia brava, mas estava rindo". Também serve para comparações visuais: "de longe, as nuvens parecem montanhas".

Comparado a に見える, que vem diretamente depois de substantivos e adjetivos, ように見える costuma vir depois de frases inteiras ou de substantivos com の.$$,
    $$Comparado a そうだ (aparência), ように見える é usado para impressões gerais e comparações, enquanto そうだ descreve sinais visíveis de algo prestes a acontecer.

Com a forma ている, ように見える descreve um estado aparente: 疲れているように見える.

Na escrita, também aparece a forma ようにみえる em hiragana.$$,
    $$Verbo / Adjetivo い (forma simples) + ように見える
Adjetivo な + な + ように見える
Substantivo + の + ように見える

Educado: ように見えます
Passado: ように見えた$$,
    $$ように見える$$,
    $$ように見え|ようにみえ$$,
    ARRAY['ように', '見える']::text[],
    ARRAY['ように見える', 'ように見えます', 'ように見えた']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n3-grammar-177', $$彼は疲れているように見える。$$, $$かれはつかれているようにみえる。$$, $$Ele parece cansado.$$),
    ('n3-grammar-177', $$この絵は本物のように見えます。$$, $$このえはほんもののようにみえます。$$, $$Este quadro parece verdadeiro.$$),
    ('n3-grammar-177', $$彼女は怒っているように見えたが、笑っていた。$$, $$かのじょはおこっているようにみえたが、わらっていた。$$, $$Ela parecia brava, mas estava rindo.$$),
    ('n3-grammar-177', $$遠くから見ると、雲が山のように見える。$$, $$とおくからみると、くもがやまのようにみえる。$$, $$Vistas de longe, as nuvens parecem montanhas.$$),
    ('n3-grammar-177', $$彼は何も知らないように見える。$$, $$かれはなにもしらないようにみえる。$$, $$Ele parece não saber de nada.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$田中さんは今日、元気がない____。$$, $$O Tanaka parece desanimado hoje.$$),
        (2, $$このおもちゃは本物の車の____。$$, $$Este brinquedo parece um carro de verdade.$$),
        (3, $$彼女は幸せな____が、本当は悩んでいる。$$, $$Ela parece feliz, mas na verdade está preocupada.$$),
        (4, $$試合の後、彼は悲しんでいる____。$$, $$Depois da partida, ele parecia triste.$$),
        (5, $$ここから見ると、町がおもちゃの____。$$, $$Vista daqui, a cidade parece de brinquedo.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n3-grammar-177', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$ように見える$$),
        (1, $$ように見えます$$),
        (2, $$ように見える$$),
        (2, $$ように見えます$$),
        (3, $$ように見える$$),
        (4, $$ように見えた$$),
        (4, $$ように見えました$$),
        (5, $$ように見える$$),
        (5, $$ように見えます$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
