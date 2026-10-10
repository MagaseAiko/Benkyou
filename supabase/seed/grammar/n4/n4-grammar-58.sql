-- n4-grammar-58 — 〜に見える
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n4-grammar-58',
    'grammar',
    'N4',
    $$〜に見える$$,
    $$ni mieru$$,
    $$Parecer / Dar a impressão de$$,
    $$に見える é usado para dizer como algo ou alguém parece, a partir da aparência. Equivale a "parecer" ou "dar a impressão de".

O julgamento é visual: quem fala está descrevendo a impressão que tem ao olhar. Muitas vezes, a aparência é diferente da realidade, como alguém que parece jovem, mas não é.

A forma de ligar depende da palavra. Com substantivos e adjetivos な, usa-se に antes de 見える. Com adjetivos い, troca-se o い por く, formando く見える.

Diferente de そうだ (aparência de algo prestes a acontecer ou de uma qualidade), 見える fala do aspecto visual geral, e é muito usado para comparar aparência com idade, profissão ou estado.$$,
    $$Para dizer que alguém parece mais jovem que a idade real, é muito comum a frase 年より若く見える.

見える sozinho também significa "ser visível", "dar para ver", como em 山が見える. O contexto mostra qual sentido é usado.

Para aparência baseada em algo que se ouviu, usa-se そうだ (hearsay) ou らしい, e não 見える.$$,
    $$Substantivo + に + 見える
Adjetivo な + に + 見える
Adjetivo い sem い + く + 見える

Educado: に見えます / く見えます
Escrita: 見える / みえる$$,
    $$に見える$$,
    $$に見え|く見え|にみえ|くみえ$$,
    ARRAY['に', '見える']::text[],
    ARRAY['に見える', 'く見える', 'に見えます', 'く見えます']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n4-grammar-58', $$彼は年より若く見えます。$$, $$かれはとしよりわかくみえます。$$, $$Ele parece mais jovem do que é.$$),
    ('n4-grammar-58', $$あの人は先生に見える。$$, $$あのひとはせんせいにみえる。$$, $$Aquela pessoa parece professora.$$),
    ('n4-grammar-58', $$家具が少ないから、この部屋は広く見えますね。$$, $$かぐがすくないから、このへやはひろくみえますね。$$, $$Como tem poucos móveis, este quarto parece amplo, né?$$),
    ('n4-grammar-58', $$彼女は元気に見えるけど、本当は疲れている。$$, $$かのじょはげんきにみえるけど、ほんとうはつかれている。$$, $$Ela parece bem, mas na verdade está cansada.$$),
    ('n4-grammar-58', $$遠くから見ると、あの雲は魚に見える。$$, $$とおくからみると、あのくもはさかなにみえる。$$, $$Vista de longe, aquela nuvem parece um peixe.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$父は年より若____。$$, $$Meu pai parece mais jovem do que é.$$),
        (2, $$このかばんは本物____けど、偽物です。$$, $$Esta bolsa parece verdadeira, mas é falsa.$$),
        (3, $$眼鏡をかけると、頭がよ____。$$, $$Usando óculos, a pessoa parece inteligente.$$),
        (4, $$あの子は静か____けど、本当はよく話す。$$, $$Aquela criança parece quieta, mas na verdade fala bastante.$$),
        (5, $$ここから見ると、人がアリ____。$$, $$Vistas daqui, as pessoas parecem formigas.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n4-grammar-58', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$く見えます$$),
        (1, $$く見える$$),
        (2, $$に見える$$),
        (3, $$く見える$$),
        (3, $$く見えます$$),
        (4, $$に見える$$),
        (5, $$に見える$$),
        (5, $$に見えます$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
