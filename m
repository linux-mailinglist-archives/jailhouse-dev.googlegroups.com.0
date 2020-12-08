Return-Path: <jailhouse-dev+bncBDAMFR7JZAEBBZXFXT7AKGQEBHUFPTQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x238.google.com (mail-lj1-x238.google.com [IPv6:2a00:1450:4864:20::238])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DF592D254D
	for <lists+jailhouse-dev@lfdr.de>; Tue,  8 Dec 2020 09:01:43 +0100 (CET)
Received: by mail-lj1-x238.google.com with SMTP id q18sf5749090ljj.6
        for <lists+jailhouse-dev@lfdr.de>; Tue, 08 Dec 2020 00:01:43 -0800 (PST)
ARC-Seal: i=3; a=rsa-sha256; t=1607414503; cv=pass;
        d=google.com; s=arc-20160816;
        b=SqwRG4kHtD2FA/9T9RNp+gYVA7wl+7w4dmDsARRxIMTVxFOGTAx//JhiRRlrSvpoxx
         fVxhCII2oWm2PtdlsoMRhVyGuFNvT4nzOAjs3ddnaWYhf2uOzwfEXsuXEC0NYKp6Tbjc
         gCAsEq/nYSSpt0xK3BMaPlfxAPbzOhodLvar9NjcFwwWBYYh6PC1wQOp921NgaBnBJbZ
         HIXlbpIrlgwK21JCLJdkuDp3bcu3MtxeBfCt993WpCIi6438Mcsc3gKOsUY5Et1oQVw9
         qsZOyXwqiCyjk0ubrymC67gqz+qoHJFVNL6MRStCekX4tMYDWpLFYV7J6plmlMCrm3Dq
         //5w==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:subject:to:from:sender:dkim-signature;
        bh=kDrID6aIbcK4kGcPXR05czUcSK67UNCL/zbU6ltPiko=;
        b=xCkhfNitZ0UERl8x5z7EJSHaqVRL3iSS7/oXugDc3PlE2NrQ6EObWMky1FvaLLyTS0
         t1rTb8YY4INK9FqR4/EDQd/BjL0Hw7pCerlajLTWdhK5/It2ySlQM6AnmvJ8DYC/V217
         lbI0Hiw5/spULvOSL8Gedc0NIUHcx7sM3XeXGAc4N6ugF7V4CGoG17+cQcAiPIVOEfdt
         WJV1wmPJzlfdh5Hnj+biYNJFaoE59hMuj2Vk2PdD+2CACDwJI9xBE6v4uGyuc5KxsvZJ
         ZCoq1Fts8d6rdY6wArVTAawClwJ7Owv9Pz/KrIhUm7U3UqHsfejH2iYzD5LMcsqpB1qC
         8KvA==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b="Xmo4F4h/";
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of peng.fan@nxp.com designates 40.107.22.74 as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:thread-topic:thread-index:date:message-id
         :references:in-reply-to:accept-language:content-language
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=kDrID6aIbcK4kGcPXR05czUcSK67UNCL/zbU6ltPiko=;
        b=CZbrBfY3siztd0vvl9vnCOu8r0XhwMOXW64HoGcT4VOGc0x+WVaToA8KhJVjJb1WEc
         qoxRmgZCo2tjOsr5NAAe+LZ4rW5kKKwIz777PjghZEZZf7OIRUX8L72RVTAjd/HHSfOS
         42tsvZ47Z/mWDT5V6kn++NCJDRaO+YNkPsjMWZmRhz/LM+hD/FC8+nwil+J0rGcrGwye
         lRM0v5XarF1jUFdD/6+UxBITT4gZh376b8wJEYNdkAZS6NzE5IHqeSNPMQhmwq5yujsX
         /7/jFVHMxXUhgfDl0/1TqquPogKFjXKDx3O4uu75SaaQLMpnSu0JGc2XV78JwqWTgecG
         GeTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:thread-topic:thread-index
         :date:message-id:references:in-reply-to:accept-language
         :content-language:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=kDrID6aIbcK4kGcPXR05czUcSK67UNCL/zbU6ltPiko=;
        b=exVp760lyfJjFs71eqoxT5tYM/8kLOf4E5RFRCwbkrP7505N0QboqGu6BBGordgJb1
         3nbTWBvry2QF1VcteFuVsQ3xvi0Hd/GdM2AZy4Mm6jOEvEZMQwPv98wrdoKI7hUKepGV
         /6mxR8/P5T5UUI0qbuOXY7u8igxDhpdz2/yIsGf00iaIINDC9yzxhwJVakuYG7ysLVGB
         4Xzb7h/KMTPln/vt7lIg2gI6oiiPY5ko0rz62kGOKnt7TPym5UgekDou01x8A84HTUD5
         7wi9LYOeBvIdriW78y7m+0MmidEeKqjFlOmbp6Xxspw/a0wGXVwQtz2OAILTLKawhsua
         gENQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531GA2n0Rv3UPix8rZtlGkqCFalwwHmjhg3/HkEeo/Kd7AJJiyDt
	YIX4Zs5aYxk7nBA5RKPsLOA=
X-Google-Smtp-Source: ABdhPJzWZfOCtv98W/quO0D028q+UltJShM1bdQEPTuh21BJ3CDYEzAr/kYypHbjOSEZt5GlGt8t7g==
X-Received: by 2002:a2e:99cd:: with SMTP id l13mr2775658ljj.318.1607414503025;
        Tue, 08 Dec 2020 00:01:43 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:ac2:4942:: with SMTP id o2ls732634lfi.1.gmail; Tue, 08 Dec
 2020 00:01:41 -0800 (PST)
X-Received: by 2002:ac2:46d4:: with SMTP id p20mr3498685lfo.299.1607414501887;
        Tue, 08 Dec 2020 00:01:41 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1607414501; cv=pass;
        d=google.com; s=arc-20160816;
        b=W1TC3yJMVVk0kf6j1azu+mh783cBCwZ9bHJC4JFlXfrL3U6iSVaYit0vuEMQxdmfOT
         diaVGp7680FLHegx0qmPrmY8Xf1CIdOVOugJz0kf3nlh7bJkaaknUsUy1dswkxosLUdE
         11lA6CyAJ6CEeokgW8oq7H106eP8oPjhLzpXqN1iodWROL5KB3mwsXT92RL8a0nwGVy+
         XdKXirbl+esvLzDZn5oW+DFYk1fiCyZ/8Qg0jgJcy6rmIdrV1Zzx4+SDMMQCZM8Lzu3z
         Br5ohPWXA47gHxgFisuIYnz6slfUAYRwzcbftmGr4ChKcMKxAVfCi48Ds8X5TJUJXfwx
         VhxA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:subject:to:from:dkim-signature;
        bh=hhPJVfzBgtla2mTIVYDeamoiHHeRR9FqQWqknZcIGgA=;
        b=NU0YCQ0syoV+EU+cATuHepHJ12GGBJRes6eF+LkKZJx3FTzxbngu2/rhJKeskpqwLX
         Q0uZ5NKkjWTIBkbmr3y0X8mrVcA1CGKFAEcLGo6cac3DJs9er+Khhs9wVL7xAH5wTDHl
         wk4PoSxkR+tPixqlC0MH416DlZTVyV4spIdsvhcTNuvPyrbEsHxaJ/qf9of0tQc0/wyn
         dobZN2T23BbTZe75z6vtTRazOigGC7UfjgPGVBehsCzxoTIGULNNKEc19u6joMZ16kq6
         S/KDvgaHZ/xVeFlg6z6IRGFvzKd0AxHUMPbZLelPAJ9h05qs3JmPyZdweezY7RQYXPvz
         ibpA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b="Xmo4F4h/";
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of peng.fan@nxp.com designates 40.107.22.74 as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2074.outbound.protection.outlook.com. [40.107.22.74])
        by gmr-mx.google.com with ESMTPS id d3si265397ljj.4.2020.12.08.00.01.41
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 08 Dec 2020 00:01:41 -0800 (PST)
Received-SPF: pass (google.com: domain of peng.fan@nxp.com designates 40.107.22.74 as permitted sender) client-ip=40.107.22.74;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W4ZjYpqekC84I0TqDfXgCogoMQ9doc6nKACRTirmgXHRCGAbYoBfD4Q+/zVNSRqFrFJNihyuGyb+0IUgQ9N1zSHY1cbApIimfrZDaWi4tCTHemNmFLF7bzzjTedcxSwXAFS/uUVjbZKYW4pviHHyajduSyN4o0ELsDNmoILp7Ji1KbycvM4Mlpz6AV8R6swZZEL3MSeQWZkjdeLq+dqKqj3yM+daByTzDyhYmlutseahYMzGTPdF22WYqsbMl4TYARxXefswqlkXQNNgM+zu6AFMhKAhWSi8aO+q+5HLMtYrDmTQKiya7+DaljWlxsJ2t7mjPMNzh6SocyUYGM7rtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hhPJVfzBgtla2mTIVYDeamoiHHeRR9FqQWqknZcIGgA=;
 b=JOEE3EHXd61d1RzYOVJ1VItT2cHzn24FOwF/Lujk2muWCF4pZqyMbp9vPSWJ06amqafdtuszD8HqLWqWBNnuDHAMKxTeHrNw8KB3b4XvBXkBf1oS6riod++Z92QJbi7+sGM1FK38shOwUvf8ThF7+aLK3rSyEUfthPV2GdGQ6UBZsEAB0oh/0OyVSnBnI2bhjZkclNsM4cA01m3kpyg3ZUQIORGtCFlAydwNNFEleb+5IeL9LmZVbi3gL+vyJzkRKqGGJ6yfWtkhgWp9EwrH9VezLzhcd8pMG693rAc9nmIvjbvCDvwG3iNg8ocU5qJRvhpz1LtMScOUa7n08/nXKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com (2603:10a6:4:a1::14)
 by DB8PR04MB7179.eurprd04.prod.outlook.com (2603:10a6:10:124::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.17; Tue, 8 Dec
 2020 08:01:40 +0000
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::c964:9:850a:fc5]) by DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::c964:9:850a:fc5%10]) with mapi id 15.20.3632.024; Tue, 8 Dec 2020
 08:01:40 +0000
From: Peng Fan <peng.fan@nxp.com>
To: Jan Kiszka <jan.kiszka@siemens.com>, "jailhouse-dev@googlegroups.com"
	<jailhouse-dev@googlegroups.com>
Subject: RE: ARM64 MSIX enabling error
Thread-Topic: ARM64 MSIX enabling error
Thread-Index: AdbMbLjE+IGjwJH3TguDfS43O45UGQADqiQAACSJ9gAABUGw0AAEHfCAAAEwDFA=
Date: Tue, 8 Dec 2020 08:01:39 +0000
Message-ID: <DB6PR0402MB27605393AB95974CE4D8944E88CD0@DB6PR0402MB2760.eurprd04.prod.outlook.com>
References: <DB6PR0402MB2760E09A5E40B4818663E07D88CE0@DB6PR0402MB2760.eurprd04.prod.outlook.com>
 <3bbd059e-632b-da36-1f79-de1731e1352e@siemens.com>
 <DB6PR0402MB2760AF37C2A42481C80249E788CD0@DB6PR0402MB2760.eurprd04.prod.outlook.com>
 <DB6PR0402MB2760C14BDE7BECED2A60906488CD0@DB6PR0402MB2760.eurprd04.prod.outlook.com>
 <543a61e2-e521-5c89-0d96-9f06946f0aae@siemens.com>
In-Reply-To: <543a61e2-e521-5c89-0d96-9f06946f0aae@siemens.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [119.31.174.71]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: cb443a40-90e9-4aba-bfb3-08d89b4f7e99
x-ms-traffictypediagnostic: DB8PR04MB7179:
x-microsoft-antispam-prvs: <DB8PR04MB7179307870FAC7647A5C50BA88CD0@DB8PR04MB7179.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: hn+Z4AuFhasXMOgTgRjbnICR2kEEDeWu7HTWcA19J4oWlBccU3WNVJeoP03qZuk5yoqUjJuxlxK7bKOkGK9N86IxDsPHLOgObwUJFe+AQtYhkTE6dULaXV0cA+eib9RGqcmSocW2LFgOTvEZKkneYI3xfYnPa5n6vND3d8GfMnadQAbHUvVx/P6RzzsElEESJKWqSZrpJXfOsyniXh9bOgJlqpOD2iT5oR7+b0uEUnZ2b+1mVxw9Su4EI2KgaTg2HF8Y9vL2IZzj6geee+VUlgjrjyR9TZ1UoFZdadg1fREjflLGmMYaYq34WWewyNS5skHsHu0XDmKkGqEeUHf77dcysDlU1JUFU7KBr7s0FbXPC+VEaqz394OaNKvz+DWmENF7FKALeu+1ZrlUNQiZ6w==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0402MB2760.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(346002)(366004)(136003)(186003)(6506007)(508600001)(86362001)(71200400001)(44832011)(45080400002)(9686003)(33656002)(110136005)(53546011)(966005)(5660300002)(8936002)(7696005)(26005)(66446008)(52536014)(66946007)(83380400001)(2906002)(55016002)(76116006)(66556008)(8676002)(66476007)(64756008);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?utf-8?B?YlJwVWVPb1pmNEIrazlPYlkyTk1Mc3BzZVp6L3Z4V3NsK2ZtQW5WYWZoeWV6?=
 =?utf-8?B?OHJ4S0NoK3d6UnpkTVNhZERUcDdQakpoMEkyTjd4OCt1SDQxNU45Ynl0dkhi?=
 =?utf-8?B?NkdHUGMrVTRMdWNZUllJUHFHTllDNktYZ0dwQ0dWdGlxa2wyR2MxQ1B0UUlS?=
 =?utf-8?B?M05vZ2ttSlg2dnJpRFM3RGVjOGlJdllUdGQzUThvL2wycTdEMjN4and5Qi9J?=
 =?utf-8?B?RUdKaG5vVndzK1prMWU3WTZ4K1lyTjM4WnBsaWxMa0EzT0xYeFF2K2ttVUFP?=
 =?utf-8?B?TXZ6YkRXMWdkYzBpbFBCcGVYUkw0RC9NdEdUWkZKUjVxVS9rL0dGcWNwNVNO?=
 =?utf-8?B?V2FVV0VINW1CRkFiU21lNkIrTTVQNlU4ZkN5VHN1aWpPVlpBRGQzQk8zQ0FC?=
 =?utf-8?B?SkV2UDBOYjZDMXRTanBPczZvSHhWSGoxck5GTE13eGRYZlFFNW1aZkRXdTlt?=
 =?utf-8?B?YXpINDA0UXdFSlRJZkdzUlZ2YVphbk92bTRzdVFEUVdzSGtOaVc2Z0J2YWto?=
 =?utf-8?B?WFd0RnZtdXM4cnVKQTdkS1p3WnNNL0JoQjJzRmtFbHBHem0vTlZZVFVKenNU?=
 =?utf-8?B?NEF6dnN1RjV3UWhYYTF1YlhDbDRsQWs0VjRoUGVLY3VXdDQyVWNaaHFjQVZN?=
 =?utf-8?B?Z1Y3TG5sV3lRRTVPVkdkenBFN1lxODRIbGJma3hiZUdYaGt1WmxMSzdrcWhn?=
 =?utf-8?B?dTlqeUppSTNFQUtLR2FqWURrM3pnZDViWlk4eVZnVzlNTlZ5UTl6WGdyMHlw?=
 =?utf-8?B?b0N1bHV0Uk1rbkZHOGgxUzhFZkZ6TXljZXhFb0pBa0FONDlPRzV0WVBnV2ty?=
 =?utf-8?B?UVJSWTAxSmM2azhtN0lEZnAyVmZDUUJMcW9lYTJBTkdNd0doazZpdVh2SStY?=
 =?utf-8?B?V0NHYnEzU05Id2JUcDU5c21NbUMyQXNnNFg0aEhaRU9VZ2creW5tL0dyMmM5?=
 =?utf-8?B?aENPa3lVZVNOdWkveWxBNUJZYm9RVjFRb0NCeVZJVjdXSkQyQU1VKzVzKzd1?=
 =?utf-8?B?c1B0ZTU2L1lCY05YRjkrcENIRmpoVTlLbmtmSjVocGNwTVpram0xbW9VTnZx?=
 =?utf-8?B?dGpqYmx2RjlsZGhYbFd2aFFrY3l3Y3RkZHVBRzl3OGE1ZGNpN3N1YVRGaGhJ?=
 =?utf-8?B?Um1BU1lmNEdZVmN0YjM4Wkx2STdqeXF4QlBKVGhRb2lwY3dWdW5kSWNHTXpl?=
 =?utf-8?B?MUY4NER5L28vRkF1ZVNUNTZ5RzQxMmoxaCs1b1A2RWNkQTVyUGpiWE42YWNJ?=
 =?utf-8?B?ckQxNVRna2lmSWFjaE14MXNIckhMeXFOb0t0eFArZ1pwTXFURFkvWlVSTk5W?=
 =?utf-8?Q?iZUIMChvUKRXs=3D?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="UTF-8"
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB6PR0402MB2760.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cb443a40-90e9-4aba-bfb3-08d89b4f7e99
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Dec 2020 08:01:40.0572
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qBLgfzVXy5HcHySIUxclvpnDcj7F3bt4T/s6YL06jXX13u+gz5K1KHAssaXZQS9weN93Zn/Ly+6yyzhENvjpdA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB7179
X-Original-Sender: peng.fan@nxp.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@nxp.com header.s=selector2 header.b="Xmo4F4h/";       arc=pass (i=1
 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass
 fromdomain=nxp.com);       spf=pass (google.com: domain of peng.fan@nxp.com
 designates 40.107.22.74 as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
Precedence: list
Mailing-list: list jailhouse-dev@googlegroups.com; contact jailhouse-dev+owners@googlegroups.com
List-ID: <jailhouse-dev.googlegroups.com>
X-Spam-Checked-In-Group: jailhouse-dev@googlegroups.com
X-Google-Group-Id: 175645748590
List-Post: <https://groups.google.com/group/jailhouse-dev/post>, <mailto:jailhouse-dev@googlegroups.com>
List-Help: <https://groups.google.com/support/>, <mailto:jailhouse-dev+help@googlegroups.com>
List-Archive: <https://groups.google.com/group/jailhouse-dev
List-Subscribe: <https://groups.google.com/group/jailhouse-dev/subscribe>, <mailto:jailhouse-dev+subscribe@googlegroups.com>
List-Unsubscribe: <mailto:googlegroups-manage+175645748590+unsubscribe@googlegroups.com>,
 <https://groups.google.com/group/jailhouse-dev/subscribe>


> Subject: Re: ARM64 MSIX enabling error
> 
> On 08.12.20 06:28, Peng Fan wrote:
> >> Subject: RE: ARM64 MSIX enabling error
> >>
> >>> Subject: Re: ARM64 MSIX enabling error
> >>>
> >>> On 07.12.20 08:46, Peng Fan wrote:
> >>>> Hi,
> >>>>
> >>>> I use MSIX, not INTX in root cell file, but always met the following error.
> >>>> uio_ivshmem: probe of 0001:00:00.0 failed with error -28
> >>>>
> >>>>
> >>>> I am trying virtio ivshmem on my board, but seems virtio ivshmem
> >>>> vi_find_vqs not work with INTX, so I change to MSIX to see how.
> >>>> But met upper error, any suggestions?
> >>>
> >>> MSI-X for virtual devices only works when injecting them into a
> >>> physical PCI bus which is using MSI-X already. Is that the case here?
> >>> If not, you need to debug the INTx case.
> >>
> >> ok. Thanks.
> >>
> >> I could see virtio-ivshmem-console /dev/uio1 shows a few lines log,
> >>
> >> But it responds to input very slow, when I press enter key, it takes
> >> long time to respond.
> >
> > After correct the interrupt number, it responds to enter key fast.
> > But if I not press enter key, the virtio-ivshmem-console /dev/uio1
> > will show nothing. If I press enter key, it will show one line boot log.
> > Press one more time, it will show the other boot log.
> > I need press enter always, then could see the boot log printed out.
> >
> 
> Still interrupts issues, I would say. The GIC MMIO resources are not
> accidentally passed through? Does /proc/interrupts report events for the
> virtual device?

ivshm_irq_handler is triggered in the beginning, for several times, but after
that, there is no interrupt triggered from inmate Linux to root Linux.

The inmate Linux is dead loop in 
__send_to_port
      -> 
644         while (!virtqueue_get_buf(out_vq, &len)
645                 && !virtqueue_is_broken(out_vq))
646                 cpu_relax();

If I press enter key in virtio-ivshmem-console /dev/uio1, it could pass the loop.
But it will run into it again later and not break out.

Regards,
Peng.

> 
> Jan
> 
> --
> Siemens AG, T RDA IOT
> Corporate Competence Center Embedded Linux
> 
> --
> You received this message because you are subscribed to the Google Groups
> "Jailhouse" group.
> To unsubscribe from this group and stop receiving emails from it, send an
> email to jailhouse-dev+unsubscribe@googlegroups.com.
> To view this discussion on the web visit
> https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgroups
> .google.com%2Fd%2Fmsgid%2Fjailhouse-dev%2F543a61e2-e521-5c89-0d96-
> 9f06946f0aae%2540siemens.com&amp;data=04%7C01%7Cpeng.fan%40nxp.
> com%7Ceacc771a8b7b4d510a8b08d89b4a2ca4%7C686ea1d3bc2b4c6fa92cd
> 99c5c301635%7C0%7C1%7C637430090157688268%7CUnknown%7CTWFpb
> GZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI
> 6Mn0%3D%7C3000&amp;sdata=G%2FBsXHpiIJyCP5xLNegvC%2FF3Sapl27EH
> wCG%2FPNpwaY8%3D&amp;reserved=0.

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/DB6PR0402MB27605393AB95974CE4D8944E88CD0%40DB6PR0402MB2760.eurprd04.prod.outlook.com.
