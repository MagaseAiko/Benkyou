-- n5-grammar-72 — 〜とき
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n5-grammar-72',
    'grammar',
    'N5',
    $$〜とき$$,
    $$toki$$,
    $$Quando / Na hora em que / Na época em que$$,
    $$とき significa "quando" e é usado para indicar o momento ou a época em que algo acontece. Literalmente, とき é "tempo" ou "momento".

Ele funciona como um substantivo. Por isso, a palavra que vem antes se liga a ele como se fosse descrever um substantivo: verbos e adjetivos い ficam na forma simples, adjetivos な recebem な, e substantivos recebem の.

Com verbos, o tempo do verbo antes de とき muda o sentido. Com a forma de dicionário, a ação de とき ainda não aconteceu no momento da outra ação. Com a forma た, a ação de とき já aconteceu.

Por exemplo, ao falar de uma viagem, "quando vou" pode indicar algo feito antes de partir, e "quando fui" indica algo feito já no destino.$$,
    $$O tempo do verbo antes de とき não depende do tempo da frase inteira, e sim da ordem das ações. Esse é um dos pontos que mais confundem estudantes.

とき costuma vir seguido de vírgula ou de partículas como に e は. A forma ときに destaca um momento específico.

Para dizer "quando eu era criança", usa-se 子供のとき ou 子供のころ. ころ dá uma ideia de época mais ampla.$$,
    $$Verbo (forma simples) + とき
Adjetivo い + とき
Adjetivo な + な + とき
Substantivo + の + とき

Escrita: とき / 時$$,
    $$とき$$,
    $$とき|時に|時は|時、|時の$$,
    ARRAY['とき']::text[],
    ARRAY['とき', '時', 'ときに', 'ときは']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n5-grammar-72', $$子供のとき、よく川で遊びました。$$, $$こどものとき、よくかわであそびました。$$, $$Quando eu era criança, brincava muito no rio.$$),
    ('n5-grammar-72', $$暇なとき、何をしますか。$$, $$ひまなとき、なにをしますか。$$, $$O que você faz quando tem tempo livre?$$),
    ('n5-grammar-72', $$寒いとき、温かいスープを飲みます。$$, $$さむいとき、あたたかいスープをのみます。$$, $$Quando está frio, tomo uma sopa quente.$$),
    ('n5-grammar-72', $$日本へ行くとき、新しいかばんを買いました。$$, $$にほんへいくとき、あたらしいかばんをかいました。$$, $$Quando ia viajar para o Japão, comprei uma bolsa nova.$$),
    ('n5-grammar-72', $$日本へ行ったとき、友達におみやげを買いました。$$, $$にほんへいったとき、ともだちにおみやげをかいました。$$, $$Quando fui ao Japão, comprei lembrancinhas para os amigos.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$学生の____、よく図書館に行きました。$$, $$Quando eu era estudante, ia muito à biblioteca.$$),
        (2, $$頭が痛い____、この薬を飲んでください。$$, $$Quando estiver com dor de cabeça, tome este remédio.$$),
        (3, $$道がわからない____、交番で聞きます。$$, $$Quando não sei o caminho, pergunto no posto policial.$$),
        (4, $$暇な____、遊びに来てください。$$, $$Quando tiver tempo, venha me visitar.$$),
        (5, $$家に帰った____、「ただいま」と言います。$$, $$Quando chego em casa, digo "tadaima".$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n5-grammar-72', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$とき$$),
        (1, $$時$$),
        (2, $$とき$$),
        (2, $$時$$),
        (3, $$とき$$),
        (3, $$時$$),
        (4, $$とき$$),
        (4, $$時$$),
        (5, $$とき$$),
        (5, $$時$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
