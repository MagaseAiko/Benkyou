-- n4-grammar-01 — 〜間
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n4-grammar-01',
    'grammar',
    'N4',
    $$〜間$$,
    $$aida$$,
    $$Durante / Enquanto$$,
    $$間 (あいだ) é usado para dizer que algo acontece durante todo um período. Equivale a "durante" ou "enquanto".

A ideia central é continuidade: a ação principal acontece do começo ao fim do período indicado. Por isso, o verbo principal costuma expressar algo contínuo, como estar fazendo algo, ficar em um lugar ou continuar em um estado. É comum aparecer junto com ずっと.

Antes de 間, pode vir um substantivo com の, ou um verbo que indica um estado ou ação contínua, geralmente na forma ている ou com verbos como いる.

Não confunda com 間に: 間 cobre o período inteiro, enquanto 間に indica que algo aconteceu em algum momento dentro desse período.$$,
    $$間 também é usado para espaço físico, com o sentido de "entre", como entre dois prédios ou entre duas pessoas.

Quando a frase com 間 é seguida de は, a ideia de "durante esse tempo, sempre" fica ainda mais destacada.

Lido ま, o mesmo kanji aparece em outras palavras, como 間に合う (chegar a tempo). Lido かん, aparece em 時間 e 週間.$$,
    $$Substantivo + の + 間
Verbo na forma ている + 間
Verbo de estado (いる / ある) + 間
Adjetivo い + 間
Adjetivo な + な + 間

Escrita: 間 / あいだ$$,
    $$間$$,
    $$間、|間は|間ずっと|間中|あいだ$$,
    ARRAY['間']::text[],
    ARRAY['間', 'あいだ']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n4-grammar-01', $$夏休みの間、ずっと国に帰っていました。$$, $$なつやすみのあいだ、ずっとくににかえっていました。$$, $$Durante as férias de verão, fiquei no meu país o tempo todo.$$),
    ('n4-grammar-01', $$母が料理をしている間、私は部屋を掃除しました。$$, $$ははがりょうりをしているあいだ、わたしはへやをそうじしました。$$, $$Enquanto minha mãe cozinhava, eu limpei o quarto.$$),
    ('n4-grammar-01', $$授業の間は、携帯電話を使わないでください。$$, $$じゅぎょうのあいだは、けいたいでんわをつかわないでください。$$, $$Durante a aula, não usem o celular.$$),
    ('n4-grammar-01', $$日本にいる間、たくさんの所へ行きたいです。$$, $$にほんにいるあいだ、たくさんのところへいきたいです。$$, $$Enquanto estiver no Japão, quero ir a muitos lugares.$$),
    ('n4-grammar-01', $$電車に乗っている間、ずっと音楽を聞いていました。$$, $$でんしゃにのっているあいだ、ずっとおんがくをきいていました。$$, $$Fiquei ouvindo música o tempo todo enquanto estava no trem.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$子供が寝ている____、本を読みました。$$, $$Enquanto a criança dormia, li um livro.$$),
        (2, $$冬休みの____、毎日アルバイトをしました。$$, $$Durante as férias de inverno, trabalhei meio período todos os dias.$$),
        (3, $$先生が話している____は、静かにしてください。$$, $$Enquanto o professor estiver falando, fiquem em silêncio.$$),
        (4, $$両親が旅行している____、私が犬の世話をします。$$, $$Enquanto meus pais estiverem viajando, eu cuido do cachorro.$$),
        (5, $$会議の____、ずっと眠かったです。$$, $$Durante a reunião inteira, fiquei com sono.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n4-grammar-01', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$間$$),
        (1, $$あいだ$$),
        (2, $$間$$),
        (2, $$あいだ$$),
        (3, $$間$$),
        (3, $$あいだ$$),
        (4, $$間$$),
        (4, $$あいだ$$),
        (5, $$間$$),
        (5, $$あいだ$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
