-- n3-grammar-97 — 〜っぱなし
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n3-grammar-97',
    'grammar',
    'N3',
    $$〜っぱなし$$,
    $$ppanashi$$,
    $$Deixar ligado / Deixar aberto / Sem parar$$,
    $$っぱなし é usado para indicar que algo foi deixado em um estado, sem ser desfeito, ou que uma ação continua sem parar. Equivale a "deixar ligado", "deixar aberto" ou "sem parar".

A estrutura junta o verbo na forma ます sem ます com っぱなし.

Ela tem dois usos principais. O primeiro é deixar algo como está, quando o normal seria desfazer: deixar a luz acesa, a janela aberta, a água correndo, as roupas jogadas. O tom é de crítica ou de descuido.

O segundo é uma ação ou estado que continua por muito tempo sem interrupção, como ficar de pé o dia inteiro ou falar sem parar.

っぱなし funciona como um substantivo: pode ser seguido de で, に, の e だ.$$,
    $$Comparado a まま, っぱなし tem um tom mais negativo e de descuido. つけたまま é neutro; つけっぱなし sugere desleixo.

Expressões como 出しっぱなし e 開けっぱなし são muito usadas em broncas de pais para filhos.

O uso de continuidade, como 立ちっぱなし, é comum para reclamar de cansaço.$$,
    $$Verbo na forma ます sem ます + っぱなし + で (deixando...)
Verbo sem ます + っぱなし + に + する (deixar assim)
Verbo sem ます + っぱなし + だ (sem parar)

Escrita: っぱなし / っ放し$$,
    $$っぱなし$$,
    $$っぱなし|っ放し$$,
    ARRAY['っぱなし']::text[],
    ARRAY['っぱなし', 'っ放し']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n3-grammar-97', $$電気をつけっぱなしで寝てしまった。$$, $$でんきをつけっぱなしでねてしまった。$$, $$Acabei dormindo com a luz acesa.$$),
    ('n3-grammar-97', $$窓を開けっぱなしにしないでください。$$, $$まどをあけっぱなしにしないでください。$$, $$Não deixe a janela aberta, por favor.$$),
    ('n3-grammar-97', $$水を出しっぱなしにしてはいけない。$$, $$みずをだしっぱなしにしてはいけない。$$, $$Não se deve deixar a água correndo.$$),
    ('n3-grammar-97', $$今日は一日中立ちっぱなしで、足が痛い。$$, $$きょうはいちにちじゅうたちっぱなしで、あしがいたい。$$, $$Hoje fiquei de pé o dia inteiro, e meus pés doem.$$),
    ('n3-grammar-97', $$彼はいつも服を脱ぎっぱなしにする。$$, $$かれはいつもふくをぬぎっぱなしにする。$$, $$Ele sempre deixa as roupas jogadas depois de tirar.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$テレビをつけ____で出かけてしまった。$$, $$Saí deixando a TV ligada.$$),
        (2, $$本を出し____にしないで、片付けなさい。$$, $$Não deixe os livros espalhados, guarde-os.$$),
        (3, $$満員電車で一時間立ち____だった。$$, $$Fiquei uma hora de pé no trem lotado.$$),
        (4, $$寒いので、ドアを開け____にしないでください。$$, $$Está frio, então não deixe a porta aberta.$$),
        (5, $$彼は朝から話し____だ。$$, $$Ele está falando sem parar desde de manhã.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n3-grammar-97', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$っぱなし$$),
        (2, $$っぱなし$$),
        (3, $$っぱなし$$),
        (4, $$っぱなし$$),
        (5, $$っぱなし$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
