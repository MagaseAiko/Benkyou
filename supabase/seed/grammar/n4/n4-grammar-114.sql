-- n4-grammar-114 — 〜とか〜とか
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n4-grammar-114',
    'grammar',
    'N4',
    $$〜とか〜とか$$,
    $$toka ~ toka$$,
    $$Coisas como... e... / Tipo... e...$$,
    $$とか〜とか é usado para dar exemplos, deixando claro que existem outras possibilidades. Equivale a "coisas como... e..." ou "tipo... e...".

Ele é parecido com や〜など, mas é mais casual e muito comum na conversa.

Uma diferença importante: とか pode ligar não só substantivos, mas também verbos, adjetivos e frases inteiras. Por isso, é muito usado para dar exemplos de ações, como "ler livros, ver filmes e coisas assim".

Com 言う, a estrutura とか〜とか言う serve para citar desculpas ou comentários de alguém, muitas vezes com tom de crítica ou cansaço.$$,
    $$Na fala dos jovens, とか às vezes é usado sozinho para suavizar a frase, como "tipo...". Esse uso é bem coloquial.

Em textos formais, prefira や〜など para substantivos e たり〜たりする para ações.

O último とか pode ser omitido, principalmente na fala rápida.$$,
    $$Substantivo A + とか + Substantivo B + とか
Verbo A (forma simples) + とか + Verbo B + とか + する
Frase A + とか + Frase B + とか + 言う

Também com um só exemplo: Substantivo + とか$$,
    $$とか$$,
    $$とか$$,
    ARRAY['とか']::text[],
    ARRAY['とか']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n4-grammar-114', $$休みの日は、映画を見るとか、本を読むとかしています。$$, $$やすみのひは、えいがをみるとか、ほんをよむとかしています。$$, $$Nos dias de folga, faço coisas como ver filmes e ler livros.$$),
    ('n4-grammar-114', $$りんごとかバナナとか、果物が好きです。$$, $$りんごとかバナナとか、くだものがすきです。$$, $$Gosto de frutas, tipo maçã e banana.$$),
    ('n4-grammar-114', $$日本語の勉強には、アニメとか漫画とかが役に立つ。$$, $$にほんごのべんきょうには、アニメとかまんがとかがやくにたつ。$$, $$Para estudar japonês, coisas como anime e mangá ajudam.$$),
    ('n4-grammar-114', $$疲れたときは、お風呂に入るとか、早く寝るとかしたほうがいい。$$, $$つかれたときは、おふろにはいるとか、はやくねるとかしたほうがいい。$$, $$Quando estiver cansado, é melhor fazer coisas como tomar banho de banheira ou dormir cedo.$$),
    ('n4-grammar-114', $$彼は忙しいとか時間がないとか言って、いつも来ない。$$, $$かれはいそがしいとかじかんがないとかいって、いつもこない。$$, $$Ele sempre diz coisas como estar ocupado ou sem tempo e nunca vem.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$週末はテニス____サッカーとかをします。$$, $$No fim de semana, jogo tênis, futebol e coisas assim.$$),
        (2, $$寿司____天ぷらとか、日本料理が好きです。$$, $$Gosto de comida japonesa, tipo sushi e tempurá.$$),
        (3, $$休みの日は掃除をする____、洗濯をするとかしています。$$, $$Nos dias de folga, faço coisas como limpar a casa e lavar roupa.$$),
        (4, $$東京とか大阪____の大きい町は人が多い。$$, $$Cidades grandes como Tóquio e Osaka têm muita gente.$$),
        (5, $$彼女は寒い____眠いとか、文句ばかり言う。$$, $$Ela só reclama, dizendo coisas como que está com frio ou com sono.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n4-grammar-114', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$とか$$),
        (2, $$とか$$),
        (3, $$とか$$),
        (4, $$とか$$),
        (5, $$とか$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
