import config from './config.js'
import { ButtonBuilder, ButtonStyle, ActionRowBuilder, ModalBuilder, TextInputBuilder, TextInputStyle, SelectMenuBuilder, channelLink } from 'discord.js'

export default {
    whitelist: {
        defaultMessage: {
            title: '🚀 **Cadastro para Whitelist**',
            description: 'Escolha um dos botões abaixo e vamos te colocar na whitelist! 🔥',
            color: 0x2f3136,
        },        

        whitelistClosed: {
            content: `🚫 Ops! A whitelist está fechada no momento... mas não desanime, em breve ela vai reabrir! 😎`,
            ephemeral: true
        },        
    
        waitResult: {
            content: `⏳ Sua análise está em andamento! Fique tranquilo, logo logo teremos um resultado pra você! 🙌`,
            ephemeral: true
        },
        
        rateLimit: {
            content: `⚠️ Uau! Tem muita galera entrando na whitelist agora! 😅 Dá um tempinho aí que logo você vai conseguir também! ⏳`,
            ephemeral: true
        },
        
    
        timeout: {
            title: '⏰ Tempo Esgotado!',
            description: 'Poxa, você demorou um pouco demais... 😅 Sua whitelist foi encerrada. Não se preocupe, bora iniciar uma nova! 🚀',
            color: 0x2f3136,
            timestamp: new Date().toISOString(),
        },
        
    
        finished: {
            title: '🎉 Whitelist Finalizada!',
            description: 'Tudo certo, sua whitelist foi concluída! 🎯 Agora é só aguardar o resultado, logo logo você vai saber! 🙌',
            color: 0x2f3136,
            timestamp: new Date().toISOString(),
        },
        
    
        approveMessage: {
            title: '🎉 Whitelist Aprovada! 🎉',
            description: 'Parabéns, você foi aprovado! 🚀 Agora é só curtir a nossa cidade! 😎',
            fields: [
                {
                    name: 'Conexão',
                    value: 'Agora que você foi aprovado, é só ir até o FiveM e se conectar na nossa cidade com o **IP**: **newvalley.online** 🌆. Nos vemos lá!',
                },
            ],
            color: 0x2f3136,
            timestamp: new Date().toISOString(),
        },
        
    
        failMessage: {
            title: '❌ Whitelist Reprovada! ❌',
            description: 'Infelizmente, dessa vez não deu certo. 😔 Mas não desanime, você pode tentar novamente agora mesmo! 💪',
            fields: [
                {
                    name: 'Dica - 01',
                    value: 'Tente escrever suas respostas de forma mais pessoal, como se estivesse contando uma história sua. Use suas próprias palavras! ✍️',
                },
                {
                    name: 'Dica - 02',
                    value: 'Capriche na sua história! Torne-a mais realista, adicione detalhes e traga um toque único a ela! 🌟',
                },
            ],
            color: 0x2f3136,
            timestamp: new Date().toISOString(),
        },
        
    
        createChannel: function (name, category, guild, member) {
            return {
                name: 'whitelist-' + name,
                parent: category,
                topic: 'Formulario para whitelist',
                reason: 'Criando formulario de whitelist',
                
                permissionOverwrites: [
                    {
                        id: member.id,
                        allow: ['ViewChannel'],
                        deny: ['SendMessages']
                    },
                    {
                        id: guild.roles.everyone.id,
                        deny: ['ViewChannel']
                    },
                ]
            }
        },
    
        initWhitelist: function (client, member) {
            return {
                content: `<@${member.id}>`,
                embeds: [{
                    title: 'Formulario para realização da whitelist',
                    color: 0x2f3136,
                    fields: [
                        {
                            name: '😀 Recomendações',
                            value: '😎 Recomendamos que responda as perguntas com suas proprias palavras, evite preguiça na hora de responder!'
                        },
                        {
                            name: '🔞 Idade',
                            value: '🤔 Recomendamos que você tenha mais de 16 Anos para entrar em nossa cidade!'
                        },
                        {
                            name: '⏳ Tempo',
                            value: '📚 Nossa Whitelist é analisada pelos nossos staffs, o tempo de espera é essencial, mas vale a pena👌'
                        },
                    ],
                    timestamp: new Date().toISOString(),
                    footer: { iconURL: client.user.avatarURL(), text: client.user.username },
                }],
                components: [new ActionRowBuilder()
                    .addComponents(
                        new ButtonBuilder()
                            .setCustomId('init_whitelist')
                            .setStyle(ButtonStyle.Success)
                            .setLabel('Iniciar Whitelist')
                    )]
            }
        },
    
        questionBuilder: function (client, question) {
            return {
                title: 'Responda as perguntas atentamente!',
                color: 0x2f3136,
                fields: [
                    {
                        name: `Questão - ${question.id}`,
                        value: `${question.question}`
                    },
                ],
                timestamp: new Date().toISOString(),
                footer: { iconURL: client.user.avatarURL(), text: `Você tem ${question.time} minuto(s) para responder` },
            }
        },
    
        createButton: function (custom_id, label, ButtonStyle) {
            return new ActionRowBuilder()
            .addComponents(
                new ButtonBuilder()
                .setCustomId(custom_id)
                .setStyle(ButtonStyle)
                .setLabel(label)
            )
        },
    
        createResultButtons: function (member_id) {
            return new ActionRowBuilder()
            .addComponents(
                new ButtonBuilder()
                .setCustomId(`approve-${member_id}`)
                .setStyle(ButtonStyle.Success)
                .setLabel('Aprovar Whitelist')
            )
            .addComponents(
                new ButtonBuilder()
                .setCustomId(`fail-${member_id}`)
                .setStyle(ButtonStyle.Danger)
                .setLabel('Reprovar Whitelist')
            )
        },
    
        createTextInput: function (question) {
            const modal = new ModalBuilder()
            .setCustomId(`question-${question.id}`)
            .setTitle(`Questão - ${question.id}`)
    
            const TextInput = new TextInputBuilder()
            .setValue(' ')
            .setMinLength(0)
            .setRequired(true)
            .setLabel('Responda atentamente a todas as questões')
            .setMaxLength(question.caracteres)
            .setCustomId(`question-${question.id}`)
            .setPlaceholder('Escreva sua resposta aqui')
            .setStyle(question.caracteres > 256? TextInputStyle.Paragraph : TextInputStyle.Short)
    
            return [modal, TextInput]
        },
    
        formBody: function (member_infos, member_id) {
            return {
                title: 'Analise de whitelist',
                color: 0x2f3136,
                description: `Formulario feito por: <@${member_id}>`,
                fields: member_infos.answers,
                timestamp: new Date().toISOString(),
                footer: { text: 'Usuário em analise' },
            }
        },
    
        buttonCreateWhitelist: new ActionRowBuilder()
        .addComponents(
            new ButtonBuilder()
                .setCustomId('create_whitelist')
                .setStyle(ButtonStyle.Success)
                .setLabel('Iniciar whitelist')
        )
    },

    ticket: {
        defaultMessage: {
            title: 'Sistema de Tickets',
            description: 'Selecione abaixo o método de atendimento',
            color: 0x2f3136,
        },

        openMessage: function(topic) {
            return {
                title: topic,
                color: 0x2f3136,
                fields: [
                    {
                        name: 'Deseja um atendimento mais rápido?',
                        value: 'Para um atendimento mais rápido basta você informar o motivo da abertura do ticket, envie o máximo de detalhes para um melhor atendimento.'
                    },
                ],
                timestamp: new Date().toISOString(),
            }
        },

        closeButton: function () {
            return new ActionRowBuilder()
            .addComponents(
                new ButtonBuilder()
                    .setCustomId('request_close')
                    .setStyle(ButtonStyle.Danger)
                    .setLabel('Fechar')
            )
        },

        createTicketButton: function() {
            return new ActionRowBuilder()
            .addComponents(
                new SelectMenuBuilder()
                    .setCustomId('create_ticket')
                    .setPlaceholder('Abra um ticket!')
                    .addOptions(config.ticket.categories),
            )
        }
    },

    useful: {
        welcomeMessage: {
            color: 0x2f3136,
            title: 'Olá, Seja bem vindo(a)!',
            description: 'Seja bem vindo ao servidor, leia as regras e fique por dentro de todos os nossos anuncios para não perder nenhuma novidade!',
            timestamp: new Date().toISOString()
        },

        exitMessage: function (member) {
            return {
                color: 0x2f3136,
                title: 'Um membro saiu do servidor',
                description: `<@${member.id}> saiu do servidor!`,
                timestamp: new Date().toISOString()
            }
        },

        failLiberation: {
            color: 0x2f3136,
            title: 'Liberação falhou!',
            description: `Envie apenas o ID para liberação da sua whitelist`,
            timestamp: new Date().toISOString()
        },

        embedBuilder: function (title, description) {
            return {
                title,
                color: 0x2f3136,
                description,
                timestamp: new Date().toISOString()
            }
        }
    }
}