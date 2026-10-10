-- n4-grammar-74 — 〜させる（使役）
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n4-grammar-74',
    'grammar',
    'N4',
    $$〜させる（使役）$$,
    $$saseru (shieki)$$,
    $$Fazer (alguém) fazer / Deixar (alguém) fazer$$,
    $$させる é a forma causativa. Ela tem dois sentidos principais, que dependem do contexto.

O primeiro é obrigar ou mandar alguém fazer algo: "fazer alguém fazer". Por exemplo, a mãe fez o filho limpar o quarto.

O segundo é permitir que alguém faça algo: "deixar alguém fazer". Por exemplo, deixar a criança fazer o que gosta. Esse sentido fica mais claro com てあげる, てくれる ou てもらう.

Também é usado para provocar sentimentos ou reações em alguém, como fazer as pessoas rirem ou deixar a família preocupada.

A pessoa que faz a ação é marcada com に quando o verbo tem objeto (を). Com verbos sem objeto, como ir ou correr, a pessoa pode ser marcada com を.$$,
    $$O causativo não costuma ser usado com superiores como "obrigar". Para pedir algo a um superior, usa-se てもらう ou ていただく.

A forma させてください, muito comum, usa o causativo para pedir permissão: "me deixe fazer".

Em níveis seguintes, aparecem formas como させてもらう e させていただく, muito usadas em linguagem formal.$$,
    $$Grupo 1: último som "u" → "a" + せる (書く → 書かせる / 待つ → 待たせる / 言う → 言わせる)
Grupo 2: tire る + させる (食べる → 食べさせる)
Irregulares: する → させる / 来る → 来させる (こさせる)

Pessoa + に + Objeto + を + Verbo causativo
Pessoa + を + Verbo intransitivo causativo$$,
    $$させる$$,
    $$させる|させ|かせ|がせ|たせ|らせ|わせ|ばせ|ませる|ませた|ませて$$,
    ARRAY['させる']::text[],
    ARRAY['させる', 'させます', 'させた', 'させました', 'させて']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n4-grammar-74', $$母は弟に部屋を掃除させました。$$, $$はははおとうとにへやをそうじさせました。$$, $$Minha mãe fez meu irmão mais novo limpar o quarto.$$),
    ('n4-grammar-74', $$先生は学生に作文を書かせた。$$, $$せんせいはがくせいにさくぶんをかかせた。$$, $$O professor fez os alunos escreverem uma redação.$$),
    ('n4-grammar-74', $$子供には好きなことをさせてあげたい。$$, $$こどもにはすきなことをさせてあげたい。$$, $$Quero deixar meus filhos fazerem o que gostam.$$),
    ('n4-grammar-74', $$彼は冗談を言って、みんなを笑わせた。$$, $$かれはじょうだんをいって、みんなをわらわせた。$$, $$Ele contou uma piada e fez todo mundo rir.$$),
    ('n4-grammar-74', $$帰りが遅くなって、家族を心配させてしまった。$$, $$かえりがおそくなって、かぞくをしんぱいさせてしまった。$$, $$Cheguei tarde e acabei deixando minha família preocupada.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$父は私に車を運転さ____くれた。$$, $$Meu pai me deixou dirigir o carro.$$),
        (2, $$コーチは選手を毎日走ら____。$$, $$O treinador faz os atletas correrem todos os dias.$$),
        (3, $$母は子供に野菜を食べさ____。$$, $$A mãe fez a criança comer verdura.$$),
        (4, $$彼はいつも面白い話で私を笑わ____。$$, $$Ele sempre me faz rir com histórias engraçadas.$$),
        (5, $$社長は新人にお茶を入れさ____。$$, $$O presidente mandou o funcionário novo preparar o chá.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n4-grammar-74', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$せて$$),
        (2, $$せます$$),
        (2, $$せる$$),
        (2, $$せました$$),
        (2, $$せた$$),
        (3, $$せました$$),
        (3, $$せた$$),
        (4, $$せる$$),
        (4, $$せます$$),
        (5, $$せた$$),
        (5, $$せました$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
