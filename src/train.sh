# python joint/train.py \
#        --train /Users/szymonlaszczynski/Documents/Projects/neutralizing-bias-PL/harvest/corpus.wordbiased.tag.train \
#        --test /Users/szymonlaszczynski/Documents/Projects/neutralizing-bias-PL/harvest/corpus.wordbiased.tag.test \
#        --pretrain_data /Users/szymonlaszczynski/Documents/Projects/neutralizing-bias-PL/harvest/corpus.wordbiased.tag.shuf \
#        --extra_features_top --pre_enrich --activation_hidden --tagging_pretrain_epochs 3 \
#        --pretrain_epochs 4 --learning_rate 0.0003 --epochs 20 --hidden_size 512 --train_batch_size 24 \
#        --test_batch_size 16 --bert_full_embeddings --debias_weight 1.3 --freeze_tagger --token_softmax \
#        --working_dir public_model/ --pointer_generator --coverage

export WNC=/Users/szymonlaszczynski/Documents/Projects/neutralizing-bias-PL/harvest

python joint/train.py \
       --train $WNC/corpus.wordbiased.tag.train \
       --test $WNC/corpus.wordbiased.tag.test \
       --pretrain_data $WNC/corpus.unbiased \
       --extra_features_top --pre_enrich --activation_hidden --tagging_pretrain_epochs 3 \
       --bert_full_embeddings --debias_weight 1.3 --token_softmax \
       --pointer_generator --coverage \
       --working_dir OUT_modular/