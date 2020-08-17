Return-Path: <jailhouse-dev+bncBDAMFR7JZAEBBWFB5H4QKGQEG5W5STQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43f.google.com (mail-wr1-x43f.google.com [IPv6:2a00:1450:4864:20::43f])
	by mail.lfdr.de (Postfix) with ESMTPS id F058D246398
	for <lists+jailhouse-dev@lfdr.de>; Mon, 17 Aug 2020 11:41:44 +0200 (CEST)
Received: by mail-wr1-x43f.google.com with SMTP id o10sf6791991wrs.21
        for <lists+jailhouse-dev@lfdr.de>; Mon, 17 Aug 2020 02:41:44 -0700 (PDT)
ARC-Seal: i=3; a=rsa-sha256; t=1597657304; cv=pass;
        d=google.com; s=arc-20160816;
        b=CRZd+P5pGm5HEO54Cz/DGZ5YskpgPFnoQ3A1Cq2DqeIPA+NYTF/aQPQZRE2a5DnBim
         1zbktQAMxOUAZ9vjG2HAaIG3YzOFyp/5DRRegh1Yrrv1gHP1vPVH0X3PKGvM5t9UCWBd
         pZfN4QMsFg/+FmOt46iLBQ03at0L1zaxQlUcGz7eH2evkFCI6caZZ7xqJGhIOioGQjOX
         AnyhvxcAc8v89/LmyHknsn77CyjxdzRFTLtv4b9bhvi1WH0JmsxGK/0vDJgNYrdkiRY0
         8XAG9+Pc6n+AMXtOjlGusvmP3NLAkRKnmPOFLxFdfulpiv+JzFYtD0Y6sCGi/pZZCxr0
         JJMw==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version
         :content-transfer-encoding:content-language:accept-language
         :in-reply-to:references:message-id:date:thread-index:thread-topic
         :subject:cc:to:from:sender:dkim-signature;
        bh=L4qd9bFmE221lAMyi7ZBVXiv58LvkB3CzZh6DNoWoAQ=;
        b=l56wWBNLLs8OnizObrJVroc5xdinHjoOX7912zCmwuMcX7ORqJMl8rX6KvYw77/zX+
         ZFijjCqxW0K7De/M20P7mRDeWZoQTGQ9bKm7GRpHpltXTXThMn81aMtkyattvgW5KSxu
         jnRz/wD7dnYT2NvJv9zKAWBFsiMDKQu4vmDOy5Fylia8i41dQvuPQHdE+n0bmNg0u2ud
         xEWtfa9/CwLd1xAgzgqmWPHjdV7JYsTj+jcc3iqAcyubnrUoAZ5WoEMQYvDex3pt/abu
         j/QrYywV70pqdVqKtpPKspfnib6llMMhDq4Y6GL3mjJ/uLabDSsHePR8awjhhD9/6KIs
         UBpg==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=QduaPePf;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of peng.fan@nxp.com designates 40.107.8.44 as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:thread-topic:thread-index:date:message-id
         :references:in-reply-to:accept-language:content-language
         :content-transfer-encoding:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=L4qd9bFmE221lAMyi7ZBVXiv58LvkB3CzZh6DNoWoAQ=;
        b=XXwhvJD0uLW3hD2CTzas3jgyxhcjSUHb7HiIpIAVHqIl91uItTecrkRWmI9AOENbzo
         ieayaSabWyGH2yqjdavuzkaBqyDt5wk4odtpuoHfK8oYWUJR7+qoyMcSEO2tgr0Ff9p/
         PTp4DSabYyP+m0OXmhvgT478SqHwyKruIrSQXz2gyhEvcSt3laZAWTPrn61g/6Z3PruP
         sH90HTdGnOgIuPEhTCBlsddBbj92UZJj//oo0rYDjJ3h72GjuFfWaCwzGxUTVkhh7I1y
         Iea1dEd/Nf/nRmvqUe9Xr4ipaOnov3m1T8cOccSzTnnT2OlIy9oGpA2iWLDGbRJ6bW9+
         OvgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:thread-topic
         :thread-index:date:message-id:references:in-reply-to:accept-language
         :content-language:content-transfer-encoding:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=L4qd9bFmE221lAMyi7ZBVXiv58LvkB3CzZh6DNoWoAQ=;
        b=krz6F5c0Urp2GHf1wtTaTgtPEgQ9HAZklYwQafNcSCJuJ6SEQb4uGk0fEsIYTgRPRh
         fqbGhGXzG5sFONVWmbLR1JTh4WRt4zg/nLDLuaUzI6x2k6I5PBcGVlObdpDOMbAL1Opz
         7xp552pS4zlPPLyYcSfW0UzN6T1rWp+ws3Ja0e/W4jkmYg4Z+3tEcHzC6BsksTiYsoq9
         qDvUiuvMP0w3j9Ds6Cb0JzhYWHm258UJ2Ze8Ys794GX0E9OqQRBSyYjSn7TKKNQ7C5RY
         CcTBW5kJx+Fp1yMJaQVuDz4XsNqz0ZozwyEFGDePOPAS2x0zM3yk24NxziEE3OJgKPUJ
         7sEA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530hEAHuiZ+X3GeSOIxzp6pry4U16mmLf1A2c5hUduwGVYJNdMFb
	vUQzWzo44VkragFrImRK3wE=
X-Google-Smtp-Source: ABdhPJw2fWLalielOCf4h4/hdfoo7nRAIv55vN2DJ7wK+xzVWgH8bNrm5Uq1zY1XhkMYKRgxwT21pQ==
X-Received: by 2002:adf:e90f:: with SMTP id f15mr14740787wrm.18.1597657304699;
        Mon, 17 Aug 2020 02:41:44 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a7b:c304:: with SMTP id k4ls7256563wmj.1.gmail; Mon, 17 Aug
 2020 02:41:43 -0700 (PDT)
X-Received: by 2002:a1c:b785:: with SMTP id h127mr14279221wmf.100.1597657303889;
        Mon, 17 Aug 2020 02:41:43 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1597657303; cv=pass;
        d=google.com; s=arc-20160816;
        b=tbzEOmhbKHIuxI6Cou4G5KTIJNG+TO5KIo3H9XO/BfrBmPdz+TxLh+7F7jRmr6G+JR
         S3lfH5SxY4apPDncd+aA2HRga/qX+vZ2oF0pLdzdIwLiXVAUFSAMf8YOpYYPdnrB78zy
         q/8sasAvtBjwPygA31IjuQkcQynxxRTjHr8muN+w/IVGAtcxpstW+F7xwQ4nNkZDwcMj
         NFvAh8cSGNDow8GLIB1THRfryT144qVhEHdrWJ1iB3AhTnV78sXTzk+tQ8e69bLhT72l
         QcXMV+6clITrjF+mnfZnoBji8CeJhMEhoOCZ96gOfEyTAx9vdfArbsU5mqydf/rlx+T+
         uOww==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:subject:cc:to:from:dkim-signature;
        bh=WqZW61INGcoS6jTVHuMmyGbJ8ruldkvSlQWAgwIUsH8=;
        b=sYa7zDRRf8Hj7MKR9PpQutTe3sUypYPIBy/YJ4J0w+6xYQVVtbQRorTvyFz46CtOVZ
         HK9BtnW3GHaxIU7X2JXEcEnviOAEaauKhaHyUx8zi3XpEU7ZNZCf0j8c6zUOwbfO+xxV
         e33yjD4M9m9E1hApIReJm4p1Uk60lcnXOUzDvziyPhxR7trIkOv7viP/wXbDQH+cij63
         90O9Rn7o+meJngZ0srrF5z9EVSSKGyVbTbd+cQ9uMme15XwDzI7bEpwortEC6cx//xuf
         OFnVlcCfMa3wEPof9nGqL+G3EYu8SSZC5AYjqoE73i9yA6aE2ROkzjNYkxOOrKJfXxUV
         XSUQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=QduaPePf;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of peng.fan@nxp.com designates 40.107.8.44 as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (mail-eopbgr80044.outbound.protection.outlook.com. [40.107.8.44])
        by gmr-mx.google.com with ESMTPS id s7si631936wme.1.2020.08.17.02.41.43
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 17 Aug 2020 02:41:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of peng.fan@nxp.com designates 40.107.8.44 as permitted sender) client-ip=40.107.8.44;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UijB60TbXW6Yzyai77adG6BueJZKea06OL99qRsEDNhWRhcslO2refa7MhOjsL5d5MsBPCOAx+NZKsKO3jjO+dq1WL6kT3n6NDA22zvue/ehVk2QFhp2zJ8zSa56UQaQr4Bxx8pDIlHw52yR+7QoPXLAjCvc2ClMtyAL2oU6Bl/Av93tT3SSc4a178giYCknWjw1kfDtjqV81HpgR9QODjBxWX4xFzTm6txKyBt/TC7gI2LRzB6DODKZIMIRWTIqrNBVOZ19sTtM4CHgkeWhMn+BbGXF/CTgta574llatc4i+FCgBc61aTkDDeOwbGi5gZy76gu6kIXSVEkbYDANhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WqZW61INGcoS6jTVHuMmyGbJ8ruldkvSlQWAgwIUsH8=;
 b=hXs6CLtmPYbmYqxo/SVvlhrYFl1gW8ZX9cUw0XDflTg01wMZJ6QkECNR3hrChNN4uA26K1r4p1rNb+5G2sA904u5V0pHqtvpsMm8H1vrvx/pzrA4fjy98y5rp5bnEPZefZu8dmfk9x7QrpqS4D4zDxDN2T6lmtjbozMQVbl3fICpU4TEUnLooIh+qIwoIgG6PTpelE+xWt71AhLMcVEJPdx2tLXVfCFhN4VpxXQdGO8jYcwYeeg+temjY5nmWDyVdjaxH9348P9CTljkTbVrszviLarx2PeOS4wzbK9cTpwEV2GTWCt1Ghxb9FNmNbQyHbokhrj9Dzb7tlmOsTvJAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com (2603:10a6:4:a1::14)
 by DBAPR04MB7223.eurprd04.prod.outlook.com (2603:10a6:10:1b0::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3283.15; Mon, 17 Aug
 2020 09:41:42 +0000
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::24d0:f783:3c7d:e232]) by DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::24d0:f783:3c7d:e232%12]) with mapi id 15.20.3283.027; Mon, 17 Aug
 2020 09:41:42 +0000
From: Peng Fan <peng.fan@nxp.com>
To: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>, Jan Kiszka
	<jan.kiszka@siemens.com>
CC: "jailhouse-dev@googlegroups.com" <jailhouse-dev@googlegroups.com>, Alice
 Guo <alice.guo@nxp.com>, Wolfgang Mauerer
	<wolfgang.mauerer@oth-regensburg.de>
Subject: RE: [PATCH 06/10] Add libbaremetal
Thread-Topic: [PATCH 06/10] Add libbaremetal
Thread-Index: AQHWbGRD5zCxHBIdykSEGCFUwoysfqkyir8AgATRQiCAAAoEgIAAWiYAgAALm4CAABXnAIAAA9WAgAAHtICABC77kA==
Date: Mon, 17 Aug 2020 09:41:42 +0000
Message-ID: <DB6PR0402MB2760128F2AF78973F466B6B3885F0@DB6PR0402MB2760.eurprd04.prod.outlook.com>
References: <20200807030632.28259-1-peng.fan@nxp.com>
 <20200807030632.28259-7-peng.fan@nxp.com>
 <4bfbd74f-843e-c3b9-47c7-31100d085052@siemens.com>
 <DB6PR0402MB2760040A34FE70576005395E88400@DB6PR0402MB2760.eurprd04.prod.outlook.com>
 <deb41f1a-1b87-ebd1-50d2-d7d299d35d8e@siemens.com>
 <9e8f00b4-2a2d-8bb8-e92c-8e23e5910af0@oth-regensburg.de>
 <5cd1415a-f4d0-b307-e81a-769b7be8eebb@siemens.com>
 <f81327a9-db37-be4d-4aa3-862b7d0416f3@oth-regensburg.de>
 <47babf84-565b-db76-7e42-47b0a2d5ed00@siemens.com>
 <9d551e5e-25fb-4c8f-66a4-934187b9650f@oth-regensburg.de>
In-Reply-To: <9d551e5e-25fb-4c8f-66a4-934187b9650f@oth-regensburg.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [119.31.174.71]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 454f1080-1085-4506-20ed-08d84291bfb2
x-ms-traffictypediagnostic: DBAPR04MB7223:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DBAPR04MB7223F46DE74828AC39DF374C885F0@DBAPR04MB7223.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4502;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: j3hnQyJsOaNRu8WAaxFcW8g2UxBYzNtcK3EMTmLokl+J/yiiGxHvQpdarvqwqJ5uhoUcQJHHTWa6wxqwO/wB7/RlbcAylEnTJKqc7Gm6IfbkDJyO1RdvpSUgbay7SO6Kpn9/hOPX4/UcuFkovbPmpum3UcUbe+ivt9/6rAealA6r9+GsJ/dKU+VuI7sPM8ltA1q/sR7fUv12R7PQMnH3DZRNT7M4zwXE6/0uEbsgbbqQT91YzGvam57SrcMqkijThGBbJlUgYZMa6QJYupEThmjdFr0j7tcnsHs/0WF+/BA/G0yxBmF7q82nh7i3pfR+gqnsHf2MWeUQPiFwQIR5Pw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0402MB2760.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(346002)(366004)(396003)(39860400002)(376002)(2906002)(316002)(186003)(110136005)(54906003)(6506007)(53546011)(26005)(4326008)(7696005)(83380400001)(33656002)(478600001)(8676002)(44832011)(66476007)(9686003)(55016002)(8936002)(66556008)(76116006)(66946007)(66446008)(64756008)(5660300002)(52536014)(71200400001)(86362001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: xWYrU3f6vWPakJccbpXB5ViHHzv1qjoZzuB7eQ+Iizbvn62z10fQ4XOg464jhUHaCw5keKobRZKEqSwmB0T7v64Pm8HOxf/NDHWneBupED6WXQzKPVLyg6wnxEYb+W9gwtnrz9Cv6xV18OxUaNlqQUKqo+OlOl8+OI++j8eB8YOP0SYi7PXeALUf5VFeQXxotSWBQMHxzF3ym11hKsREBmz+ttJ3devKbl+I/Jahr0hie1VwUPgyT9wjQaEcIlWTfJTesQYjjAr4h8sHAeok1JZzZ9SzpH4f/0/NInF1bGDxM5uOMqa8nECJxjws84FQCNIMElWD5azF5ETGRQu7vUswPMskyIa2BkhagotAmRMXXhxUx7hU6ZY3qUeDO1WxI1TD8FyaYAoxSrz9RhEYWFeZjmgkOOeD6sACi1u9OICRMpDUy8vgfcXQLrIkFcaNyA6jbE/tAPt+pOV147yw0oN9+fZpJFz0PPsQBfAcpn8CHZ4bPsVnYIM29i7xigaX9YtNlj74O+UkUxRLKxwHsTr/ctThZRbzppjgt1hKSKwRRwgTertHrFlkkP8FDwTeaF9F0N1Y/U7cAFPsgovxIsisM2+N0Z85xAeNYrAhzlCvc8vnHf3Opr0eRkUvkDU2Edh+b3BemE1J0aiHn2EHHA==
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB6PR0402MB2760.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 454f1080-1085-4506-20ed-08d84291bfb2
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Aug 2020 09:41:42.4869
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TWR5jsk55SUKwQSTgRW9xrHiyUUONltt9qGVJZTN/TPUfLTg3O7Rg+7zkdvs3L1Ang/BGHEVKBi3GnxXAY0Pog==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR04MB7223
X-Original-Sender: peng.fan@nxp.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@nxp.com header.s=selector2 header.b=QduaPePf;       arc=pass (i=1
 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass
 fromdomain=nxp.com);       spf=pass (google.com: domain of peng.fan@nxp.com
 designates 40.107.8.44 as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
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

> Subject: Re: [PATCH 06/10] Add libbaremetal

Since we come to discuss in a bigger picture, how do you suggest
to proceed about the bootloader part?

Thanks,
Peng.

>=20
> On 8/14/20 7:20 PM, Jan Kiszka wrote:
> > On 14.08.20 19:06, Ralf Ramsauer wrote:
> >>
> >>
> >> On 8/14/20 5:47 PM, Jan Kiszka wrote:
> >>> On 14.08.20 17:06, Ralf Ramsauer wrote:
> >>>> (+Cc Wolfgang, we recently had discussion on the boot process of
> >>>> Jailhouse)
> >>>>
> >>>> On 8/14/20 11:43 AM, Jan Kiszka wrote:
> >>>>> On 14.08.20 11:08, Peng Fan wrote:
> >>>>>>> Subject: Re: [PATCH 06/10] Add libbaremetal
> >>>>>>>
> >>>>>>> On 07.08.20 05:06, peng.fan@nxp.com wrote:
> >>>>>>>> From: Peng Fan <peng.fan@nxp.com>
> >>>>>>>>
> >>>>>>>> Add libbaremetal for sharing code between inmates and jailhouse
> >>>>>>>> baremetal loader.
> >>>>>>>>
> >>>>>>>> The Makefile code is copied from inmates, currently only
> >>>>>>>> string.c is moved from inmates to libbaremetal. In future, we
> >>>>>>>> might need to share uart/mmu and etc.
> >>>>>>>
> >>>>>>> Might quickly become confusing to have two libs. What prevents
> >>>>>>> renaming inmates/lib completely into libbaremetal? Sure, there
> >>>>>>> are some jailhouse specifics in inmates/lib, but those could
> >>>>>>> likely be put in some corner.
> >>>>>>
> >>>>>> How about rename inmates to baremetal?
> >>>>>> And add bootloader stuff under baremetal?
> >>>>>
> >>>>> We could do
> >>>>>
> >>>>> baremetal
> >>>>
> >>>> What we provide is a minimalist runtime environment, which is not
> >>>> just limited to baremetal applications (depends on the definition
> >>>> of baremetal, though). But=E2=80=A6
> >>>>
> >>>>> =E2=94=9C=E2=94=80=E2=94=80 demo-inmates
> >>>>> =E2=94=9C=E2=94=80=E2=94=80 lib
> >>>>> =E2=94=9C=E2=94=80=E2=94=80 tests
> >>>>> =E2=94=94=E2=94=80=E2=94=80 tools
> >>>>>
> >>>>> and put the jailhouse loader under tools. Inmates is a "brand" in
> >>>>> Jailhouse context, so it should remain in some form. But it's
> >>>>> true, some
> >>>>
> >>>> =E2=80=A6 yep, the branding is the point why we should keep calling =
them
> >>>> 'inmates'.
> >>>>
> >>>>> of the existing demo inmates can already run without jailhouse.
> >>>>
> >>>> And that's the second point - we already have some kind of support
> >>>> for this kind of use case. However, I agree that I wouldn't expect
> >>>> the preloader inside inmates/.
> >>>>
> >>>>>
> >>>>> Ralf, what do you think?
> >>>>
> >>>> Peng, I just read the code of the loader and I try to understand
> >>>> what how it's exactly working. Nice work! Do I see that correctly:
> >>>> You basically "imitate" Linux in a way that you manually do the
> >>>> early setup (some register setup, GIC init, kick off all CPUs, hv st=
ubs, ...).
> >>>>
> >>>> IOW, you bring the system to the same state, where the Linux driver
> >>>> would hand over Jailhouse. You activate Jailhouse, we then return
> >>>> to the loader which got lifted to the first cell, the root cell.
> >>>> Now you use the loader to partition the system, i.e., to create
> >>>> cells. Therefore, you use the hypercall interface, just like Linux
> >>>> would typically do it for us. Finally, there's the hand over to
> >>>> Linux.
> >>>>
> >>>> But do we really need a separate loader? Can't we just place the
> >>>> loader-related stuff at, say, the end of jailhouse.bin?
> >>>>
> >>>> To be more concrete, i think it should be possible to have the full
> >>>> preloader-thing located under hypervisor/arch/arm64/. It should
> >>>> also be possible to link everything that is required into
> >>>> jailhouse.bin - so we would get one universal binary instead of a
> >>>> chain of dependent binaries. [1]
> >>>
> >>> Interesting idea.
> >>>
> >>>>
> >>>> Pro: You can make early use of the UART in your preloader without
> >>>> having the need to, for example, duplicate drivers. That's quite
> >>>> useful for debugging if something goes wrong very early. Secondly,
> >>>> you can also piggyback on existing gic routines, no need to
> >>>> reimplement phys_processor_id, =E2=80=A6
> >>>>
> >>>> The next thing after early boot would be the handover to jailhouse.
> >>>> Before the handover, we set a flag that indicates that we do an
> >>>> early boot of Jailhouse. We can use this flag to do the full
> >>>> partitioning of the system before we return to the guests in one
> >>>> single step. IOW, we never return to the preloader once the
> >>>> handover happened. We can do that, as u-boot already placed our
> >>>> guests and we just need to start them (as we would start regular
> >>>> cells).
> >>>>
> >>>> The amount of additional logic in the actual hypervisor core should
> >>>> be reasonably low.
> >>>>
> >>>> Did you already consider that strategy? Jan, what do you think?
> >>>
> >>> As we are already in visionary phase... There is another use case to
> >>> consider:
> >>>
> >>> I'd like to have a Jailhouse variant that comes without a root cell.
> >>> That means, we will need a booting procedure that creates all cells,
> >>> loads and starts them - and then drops all the logic that could
> >>> configure or destroy them (or never includes it in the first place -
> >>> build-time setting). This should reduce the Jailhouse runtime code
> >>> to much less than 10K LoC.
> >>
> >> Ok, that's indeed an awesome idea.
> >>
> >>>
> >>> Peng's approach is useful in case you do want to keep the
> >>> flexibility to reconfigure the system from a root cell, just like
> >>> you can do when
> >>
> >> To be honest, I consider the "dynamic" reconfigurability of Jailhouse
> >> as a development and testing utility rather than something that would
> >> ever be useful for operative usage. This includes, of course,
> >> jailhouse disabling.
> >
> > Reconfiguration, yes, but reloading can be a topic in certain scenarios=
.
> > The current config locking mechanisms allows to keep this door for the
> > root cell open, even while there is a critical cell running.
> >
> >>
> >> What would be great would be a single-shot 'jailhouse freeze' (or,
> >> ha, 'jailhouse detention') call, that throws away the whole hypercall
> >> interface. Having such a thing, we an drop everything that is somehow
> >> related to cell management: create, start, stop, destroy, stats,
> >> disable, enable, ...
> >>
> >> And that would in fact be no big deal: Annotate all affected
> >> routines, replace hyp vectors with stubs, drop the section, done.
> >> Every code that has no other users than from a hypercall can be
> >> dropped. Or do I miss something?
> >
> > I haven't thought this through in details yet, but I would be
> > surprised if there weren't at least some smaller challenges in
> > implementing that cleanly. Still, it's mostly about disabling code.
> >
> >>
> >>> booting via Linux. The idea of adding a preloader is minimal
> >>> invasive to the existing setup. My root-less mode will be maximal inv=
asive,
> though.
> >>
> >> Why do you think that it would be maximal invasive?
> >
> > As it changes the current hypervisor code for sure. Just loading
> > Jailhouse via a different thing than Linux does not bring many
> > changes, at least to the core. See this series.
> >
> >>
> >> Oh btw: who would receive the freed memory? Would it remain in the
> >> hypervisor or be assigned back to a cell? Though that should probably
> >> only be a few pages.
> >
> > What freed memory? When things are only created, nothing will be freed
> > anymore. There will also be no jailhouse disable.
>=20
> There will, e.g., be a cell_create routine, that will be called once per =
cell. After
> the creation of those cells, drop it, we won't need it again.
>=20
> If we have a universal binary, there will be a jailhouse disable will be =
present
> in the beginning. Once we decide freeze the configuration, drop it. If we=
 make
> those things compile-time configurable, then it has potential to become a
> variant hell.
>=20
> >
> >>
> >>> If root-less would be sufficient for cases you do not want
> >>> Linux-based boot, we can skip this approach and head for root-less fu=
ll
> steam.
> >>
> >> root-less means that the detention call (I like that) comes after
> >> cell creation, but before cell start. .oO(we can even drop the
> >> cell_start code, if we find a smart strategy to drop code right
> >> before vmreturn)
> >>
> >
> > I would rather envision some alternative configuration that contains
> > all cell configs, not just the root cell (which would become a
> > non-root cell as well). Loading would have to happen into the target
> > memory regions before jailhouse enable, and the enabling would also
> > imply starting all cells.
> >
> >>>
> >>> If there are use cases for all three variant, we can try to look for
> >>> common pieces in the two Linux-free options. My root-less mode would
> >>> also need a single-step "create and start all cells", e.g. And your
> >>> idea to include the bootstrap logic into an init section of
> >>> jailhouse.bin is also attractive for both.
> >>
> >> Yes, I see the overlaps. By the way... Why don't we actually do:
> >>
> >> $ cat jh.bin sys.cell c1.cell c2.cell > jh.image
>=20
> Even better:
>=20
> cat preloader.bin jh.bin sys.cell c1.cell c2.cell > jh.image
>=20
> Again, the preloader.bin is still a binary image that only contains the p=
reloader
> section, but u-boot can directly jump into it. It is still developed unde=
r
> hypervisor/arch/foo and hence has full visibility of all symbols that are
> available in regular jailhouse code and can potentially use them. We just
> exploit the linker to export that section to a separate binary.
>=20
> If someone wants bare-metal boot mode, we just glue things together.
>=20
> >>
> >> for the bare metal case?
> >
> > That comes close to what I have in mind, config-wise. sys.cell would
> > still need a counter of cells that follow (simple to add to struct
> > jailhouse_system).
>=20
> Not necessarily. We can also define a zero-termination. Once the first by=
te of
> the JHCELL magic isn't present, we're done. But that's details.
>=20
>   Ralf
>=20
> >
> > Jan
> >

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/DB6PR0402MB2760128F2AF78973F466B6B3885F0%40DB6PR0402MB2760.eu=
rprd04.prod.outlook.com.
