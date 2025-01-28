export default {
    "sql": {
        "host": "localhost",
        "user": "root",
        "password": "",
        "database": "fivem",
        "port": 3306
    },

    "channels": {
        "welcome_channel": "1332449379214164078", // canal de mensagem de bem vindo
        "exit_channel": "1332449379214164078" // canal de mensagem de log de saida
    },

    "whitelist": {
        "channelRole": "1320790285994692628", // canal aonde será recebido o id
        "WhitelistIsOpen": true, // Coloque como "false" caso queira que a whitelist seja desabilitada
        "simultaneousWhitelist": 20, // limite de quantas whitelist podem serem feitas ao mesmo tempo
        "category": "1316263389911191622", // categoria aonde o canal de whitelist será criado
        "result": "1316263434395848734", // canal aonde o resultado será postado
        "staff": "1260643504862789756", // cargo necessario para aprovar / reprovar whitelists
        "channel": "1320790285994692628", // canal aonde será enviado as whitelist para serem lidas
        "waiting_role": "1321629009213128755", // cargo que será recebido quando o membro fizer a wl (aguardado resultado da whitelist)
        "approved_role": "1257764601307856988", // cargo que será recebido quando o membro for aprovado na wl (aguardado liberação de ID ou HEX)
        "questions": [
            { id: '01', question: 'Para você, o que é roleplay?', time: 5, caracteres: 256 },
            { id: '02', question: 'Porque você faz roleplay?', time: 5, caracteres: 256 },
            { id: '03', question: 'Cite uma forma de dizer que o microfone do outro jogador está ruim.', time: 5, caracteres: 256 },
            { id: '04', question: 'O que é Random Deathmatch (RDM) ? Porque Não devo fazer?', time: 5, caracteres: 256 },
            { id: '05', question: 'Explique o que é OCC, e cite um exemplo', time: 5, caracteres: 256 },
            { id: '06', question: 'Explique qual a regra de Vehicle Deathmatch (VDM), e cite um exeplo', time: 5, caracteres: 256 },
            { id: '07', question: 'Por que não devo fazer Meta Gaming (MG), explique o que é isso.', time: 5, caracteres: 256 },
            { id: '08', question: 'Após você morrer em uma troca de tiros com inimigos, e renascer no hospital, oque você faria?', time: 5, caracteres: 256 },
            { id: '09', question: 'O que é Combat logging? Cite um exemplo', time: 5, caracteres: 256 },
            { id: '10', question: 'Explique a regra relacionada ao Amor A Vida', time: 5, caracteres: 256 },
            { id: '11', question: 'Você está na rua e é abordado por 2 pessoas armadas, e você está armado, oque você faria?', time: 5, caracteres: 256 },
            { id: '12', question: 'Informe a historia do seu personagem', time: 10, caracteres: 4000, history: true } // UTILIZE SOMENTE O HISTORY: TRUE CASO SEJA REALMENTE A HISTORIA DO PERSONAGEM! SÓ PODE SER UTILIZADO EM 1 LOCAL
        ]
    },

    "liberation": {
        "rename": "", // canal aonde será enviado o discord, id e nome do personagem para renomear o membro do discord!
        "channel": "", // canal aonde o membro vai enviar hex // id para liberação
        "addRole": "", // cargo que será entregue quando o ID for liberado!
        "removeRole": "", // cargo que será removido quando o ID for liberado!
        "table": "accounts", 
        "column": "whitelist",
        "identifier": "id"
    },

    "ticket": {
        "category": "1316263398672961580", // categoria aonde o canal de texto de ticket será criado
        "staff": "1332924763915554858", // cargo que terá acesso ao ticket
        "prefix": "chamado-", // prefix de como o ticket será criado (exemplo ticket-0001)
        "table": "discord", // tabela aonde ficará registrado todas as informações sobre tickets
        "categories": [
            {
                label: 'Denuncia',
                description: 'Ticket para efetuar denuncias',
                value: 'Atendimento para denuncias',
            },{
                label: 'Beneficios',
                description: 'Ticket para atendimento relacionado a doações',
                value: 'Atendimento para beneficios',
            },{
                label: 'Atendimento',
                description: 'Ticket para atendimento geral ao usuário',
                value: 'Atendimento e suporte ao usuário',
            }
        ]
    }
}