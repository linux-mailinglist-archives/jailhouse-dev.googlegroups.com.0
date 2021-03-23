Return-Path: <jailhouse-dev+bncBDAMFR7JZAEBBXH642BAMGQEJWWKKUQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x538.google.com (mail-ed1-x538.google.com [IPv6:2a00:1450:4864:20::538])
	by mail.lfdr.de (Postfix) with ESMTPS id BA214345BBD
	for <lists+jailhouse-dev@lfdr.de>; Tue, 23 Mar 2021 11:13:49 +0100 (CET)
Received: by mail-ed1-x538.google.com with SMTP id i19sf715961edy.18
        for <lists+jailhouse-dev@lfdr.de>; Tue, 23 Mar 2021 03:13:49 -0700 (PDT)
ARC-Seal: i=3; a=rsa-sha256; t=1616494429; cv=pass;
        d=google.com; s=arc-20160816;
        b=JFntVurZIRf+cyzjRyuIREzjbL830KvEDm3Nja1d+MlV/m9zDcOHWA8CAFGmQCF9lI
         LMqWwLpFhpepB7C8D3KdxcazHOELj/Bd2KBl1XL5x8BLsgIth2ncslxmOUTynxbuJB8i
         JTNNunLPohkxI8QSqHG4CkWEa7Wp17lbcaMdTYxlmcs0UzrxMKGgJmH1jdZyRSj8pyr4
         Su7ufYFQgZ/vBTOXHU7xFB8ALHN5EElEucN7BNY+2SjGoLGTigQIAiFPuT1a2KQlhaOx
         7bLGkI7ZzMgh3nmdNnpMfrWYgbcBkEir4LCBRbPjkddZRKPxESrj2GKcEooHVOpeMFR5
         Lrjg==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:subject:to:from:sender:dkim-signature;
        bh=L+AEjU7u3/4dVbBGgUtovbV7xR/ZVEEXq9TxjeNzuro=;
        b=nMUWZW/UmcnNhCi0e4ajG1HflhIpilq9ru7Ae8Ead4gN8OcF3f8Thk7jiobrs1UVJc
         X2J7dds3kA2x9VfTB8oYvuI8FTKF5b0mPAxzUWQQ6CGh2SwdH+EcBNePPSEjNgs0f2lo
         qiwwRdzYf25QB6nOXkr7VD6OK6w4Acqt+NeO7oCYLJGZBobm+y0MgS/5+1ElBAaAvZCw
         xfKzsLAGAcaMEDH97HABKM2TvmpGzUqZHcx7x6QCCU4XGPDx6/wb82ASvutZiNxsL/X9
         6OI1WQSbBYGwgpKWoXifvcsqwx6ZhCZKeqrxCLzu/k2BPUeIKk6L0v5PLjk/U249FUkk
         daUA==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=fj7v54wk;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of peng.fan@nxp.com designates 40.107.21.55 as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:thread-topic:thread-index:date:message-id
         :references:in-reply-to:accept-language:content-language
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=L+AEjU7u3/4dVbBGgUtovbV7xR/ZVEEXq9TxjeNzuro=;
        b=Si6tbBcij8qKojXv9hp9pMv4g5RuVM39uNByO8Go8Tq3Jlb/2CvEJ9L8Earlczu3GF
         bgfxGW2DkU0fcgVFtsWF3XBhOYORUKIxxobMlaEBLtKGSx/4D0F4seud5yWS8ygcIhnR
         9MmwzjKQthAQGLiUWBoGy/p5Jvr3yYl9mpXrut28RQg2TmJGql2vX7kpwNDdkU3I81gw
         Jh8mSi2LCZllf5MDje1KsLG0VHDS+C0FrY2Lu9Wklptx9iyagROCBSxAfqsezhXhlPui
         RTcYxNZ5Sf882ruQ+sggxe+JNe2+jcqtsFIcbb4RJdD3wS6Rao++shpvbkLy4TW0lyS7
         7rUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:thread-topic:thread-index
         :date:message-id:references:in-reply-to:accept-language
         :content-language:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=L+AEjU7u3/4dVbBGgUtovbV7xR/ZVEEXq9TxjeNzuro=;
        b=DZo6URCrK5ZE9HAWjmrM1CS3CwEpxlrYPQ9VZEL02OINJxBdTyg/9i/SlKADpZ0Hfg
         Ye9p9u1d+OtGM+Px4tWrEBuNImcZM2aCqfZBV7E8pXuBgheFVF7kGnHiv+eJDNq/CAI4
         6urOdM6D0hJaKgsAjvffrKE/Kc8tZKXdRa4h6wIPThTRjQpdH6DaLd5uTC91rBaDDvuS
         wTA2Cl5d2Va425x/KoS4TRDRqda25DyWHs/QkNnjjKQoq0q/VQgw5HpPODlZtAh01CXt
         jRbA3mQiBmU3SrEcMmTJp/50M2U7QEDSYCKgE735ATQEucx/Fgk+4pTUvDOtlbjUirSq
         Sc+w==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530EhTiC7UX11rGs9LxyMxftFNfcEXgLq2Kj23zHo3N9qCuH+R12
	ex0cKCwc5iQNHNQO653Gyiw=
X-Google-Smtp-Source: ABdhPJwefP1JcFVxW96vBBnQeVFrKE8yhlkwQFDc9gjYnl1vXkpdqA1/BHZGS9GLC3fGaEy19z4zhw==
X-Received: by 2002:a17:906:3f87:: with SMTP id b7mr4142958ejj.139.1616494429265;
        Tue, 23 Mar 2021 03:13:49 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:906:16d7:: with SMTP id t23ls8760618ejd.7.gmail; Tue, 23
 Mar 2021 03:13:48 -0700 (PDT)
X-Received: by 2002:a17:907:20e4:: with SMTP id rh4mr4170161ejb.369.1616494428292;
        Tue, 23 Mar 2021 03:13:48 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1616494428; cv=pass;
        d=google.com; s=arc-20160816;
        b=MPMFo2gUwRh3hL03qnHsRpYwSDl/8oMEidROQ/fJ0yAcHKD/O7RJTrYU8IoH1DkjCa
         LvHqF/Mma4EuFkUCYPIAq7qR5Kn24V83K2pWZPHuCZpxD3qPHg1PQs7UBPnyKGoyna+G
         iZeK/L9ALXkELyU0ODw2u6Afp00dFOG05OqUSHALeMEacre1xynVqKZPU1vKrlooyr4v
         tP3i2abwcTSttOcXml/0hEP84pYAo4ALAv4favB/nHTEJFTKNtbYsNK8j3PKaRq/WBy1
         AYH9yTP9ypbBo7kGH/TCHyMDJDKYANsq2rwlmePDgn+KhuorLAKSoGzb6Ckq+00layfD
         3A7Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:subject:to:from:dkim-signature;
        bh=myCCY5IMQ3urVKgx7RE/jM5pboKgSkmaL51K/kDAJ7E=;
        b=B4CU9erH4/WbUNTFd+/DnZZFlVwlMIq4d+QXQU0ZwR4D8LCCUwyfpS9OjL4/fgy8Le
         fSzNn3+upahY1BuQYR7NWL46CGnzFIMuzCEFdUwbfj7hyHG4aJHX9Jj75t7x/5HF3p9P
         +Ps7YtZxEffqC/Kp2ok4fy54QftAm72uImrQkkSf+Wt1CuuS7fmEKeoKJdjXjFkVbXSg
         DhzgoEwI+NRJNZj7tlOKRxtzofBzAvflf0anYvMelDbWDKJT6Gt744uPKvzYtjVvDyRm
         9lLdDOU0yNwRRJcfW3zzOkBCIVxRCa4o+hkva7jjkWn5QD/Q38YY/yXeB76WmdTkzKEy
         Fhwg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=fj7v54wk;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of peng.fan@nxp.com designates 40.107.21.55 as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2055.outbound.protection.outlook.com. [40.107.21.55])
        by gmr-mx.google.com with ESMTPS id w5si563010edv.1.2021.03.23.03.13.48
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 23 Mar 2021 03:13:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of peng.fan@nxp.com designates 40.107.21.55 as permitted sender) client-ip=40.107.21.55;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GTIBHhuHRxHqWzkEM35GzBP186OsWrL6w7wwQo7rJy0DC2IAMsHpeKc1E7bWTwow7BfqI2cl0dNiIxAruNmG/6CmDQDPWK7OurtFvZk7HV0HROuz4i21szYwhqjDkIP4akxJLZSTUR324jK5IUlRixiqoDomjDiFTPKxgCVBg4XMRhc81W+xSwVCI1hSiMK1HyPI0G0TexXbdlJvhuTdLkM56orYNejGveb3y5WsTWuz0oZwj/5I5f1Pr6v8fnOdks5nmsAOhXPnhtNyBzlmfDEkseU4ISgISKC4jbBhSn6DDd4C749DmOmjRz8ZwcBxukVma3lXkf8StZm53+1Krw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=myCCY5IMQ3urVKgx7RE/jM5pboKgSkmaL51K/kDAJ7E=;
 b=h+95copNabdg9ukQIaT6iCfbn92yYLuGOf+KZS8DZYvODSgowuPBCS9ZSGqsHLsiaWyqDxFEANnhNSxbIgRDZz7qUKuQL151ptzYhEsXPiRnDV+sFg3p2EIuwmf8CSBXHRO88SX6QhN3xTvE6xGHbCl+2H4V34f5EHtIddZNamXGT5zLu5FiyyfCSv+5LuvgBqhlhuJ6Cw27KUIJ6eJom0A642QEmzVp2/BklElw0Tm0gq7PortNHgLHuih+Z3Rrrflbez+zPjDc3J+xxU/51SZVeP87ypyUBlelQCJNrligVHwCcOlyO9mn2YiEmfX0k5dzp4WGd30Isb8apOw1Rg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com (2603:10a6:4:a1::14)
 by DB8PR04MB7178.eurprd04.prod.outlook.com (2603:10a6:10:12e::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.24; Tue, 23 Mar
 2021 10:13:46 +0000
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::d58c:d479:d094:43d0]) by DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::d58c:d479:d094:43d0%9]) with mapi id 15.20.3955.025; Tue, 23 Mar 2021
 10:13:46 +0000
From: Peng Fan <peng.fan@nxp.com>
To: Jan Kiszka <jan.kiszka@siemens.com>, "jailhouse-dev@googlegroups.com"
	<jailhouse-dev@googlegroups.com>
Subject: RE: [PATCH 2/5] Check UART UCR1_UARTEN bit before writing data
Thread-Topic: [PATCH 2/5] Check UART UCR1_UARTEN bit before writing data
Thread-Index: AQHXH6j5GEVticSj+kyg0459SAbqyaqRM0qAgAAnNmA=
Date: Tue, 23 Mar 2021 10:13:46 +0000
Message-ID: <DB6PR0402MB27606C1FA79A5B33C6E6052388649@DB6PR0402MB2760.eurprd04.prod.outlook.com>
References: <20210323062536.3888-1-peng.fan@nxp.com>
 <20210323062536.3888-2-peng.fan@nxp.com>
 <69cf89e6-dc86-a3d7-01fa-1e5abee7f1e8@siemens.com>
In-Reply-To: <69cf89e6-dc86-a3d7-01fa-1e5abee7f1e8@siemens.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [119.31.174.71]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: ec329d8a-cb25-432c-b356-08d8ede4589b
x-ms-traffictypediagnostic: DB8PR04MB7178:
x-microsoft-antispam-prvs: <DB8PR04MB71782271BE379C382954CE5888649@DB8PR04MB7178.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 7hWNogWu1EUPzjhjaPAz8rQQc1Tq8imevVmJDkGDQBNn64m9PgIzDpS0WYLRm2jEu5MRuYdBz7mhpNL29A2wnhtGNxq8m3+knoXYNlpbBAf825VjbYkZdq8s33YYaLnPZtgw2QBBwA9xR0H2xMo/bV076cmIvH7NL+lbX8ObIMckmaMJI3w0RHRbi4jZ/npGxKTHI3EN6AQoZnKSmx0Fnk8VMuBQi52EXBc9cRRN8Qejpx8uAqA18eRyze4m1pBPMTEJro87nXLo36OwDUEBZ8hjsQ8eXrAvZX66T79vB7ftiT9TR9utOGV4qSk5LKT2RkuYG+r4iLxlGIwmfzXzGExLmIQEmmmthkPpqLTSR4l9U+EGydIc4e7o9Q7Oeus3EDjG0OMhVVgK0i2x9b/GjDVz3JxoCwWIY0iE57RlDPLBUwCvXHIhAK7n4Z6ccpze3tnnoLZZYdmerKsbST3/l/kTxAFZ+1KB78FpvsVmR749+Orbpyas59ndY4xFDHGPxRJPJ2pNO7z0osxDF47EYiCz3HPy0FoH31PgO7ONcbtI8RsYCsiI4KlLsE5N6IaewEejQFuaz4sSqDGTbALyX93wwdYvkf8NRD0vsTt9yi8Ww6t/Y6EYuQmuRG0uFSBwN78SUUuCYIv7jAvVNn738/oTGB3iPA4vhSGtnyFlWQc=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0402MB2760.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(33656002)(66946007)(8936002)(9686003)(110136005)(498600001)(64756008)(53546011)(66476007)(66556008)(76116006)(6506007)(66446008)(7696005)(26005)(86362001)(5660300002)(38100700001)(83380400001)(186003)(2906002)(52536014)(44832011)(8676002)(55016002)(71200400001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?utf-8?B?bkhaSDVaRHdQTmNFTmF0QW9aMStQL1R0MHR6WXFxYlZZUTRNT2dYaVhEUUFl?=
 =?utf-8?B?cTZ5MUNEK2pBbzcyZFM0VlcvVGRWYSs5ZWJnZDlTSzdQNFBMcnBEQVQ0aVMw?=
 =?utf-8?B?enZSSTlKL291YjYrRnh6eHFSTE1KOFYwWVpXRkpzWUpEeUZTSTh0dHdDci9y?=
 =?utf-8?B?cXhTN05UYTJnQkZmNWVRcUtVdVpVYTRpUzdPVGRBOC8rSkdoZ1NCUnFqSmhC?=
 =?utf-8?B?ZG9NRjV4Z0daWC9BWjFUUUZJZTZ5czB2cHp2bzFEcjVQeHhJZllYcHA1dVBi?=
 =?utf-8?B?Z1NGS3VHTFFTQTlJKzNrNVUzdG5ZOGIxTmJZYnJaaU44R0NHVi82ekVUZFAw?=
 =?utf-8?B?bHhaa2s4T05xenFKK1JucVF5djdmazVreE5SeW5CdXhCNkpNVDRlRzlUcDlE?=
 =?utf-8?B?ZnhlN1hrblRTOVBHc3BzdTJ1ZTIzckh4TC9HNnp0Y01hTm9jTENDVjFYMDJy?=
 =?utf-8?B?dWx5ekRLekZoeXUwWnRGT0tGUjZCTTV5dWpQTkxkQzJwQXJSTnRyTldRQnJV?=
 =?utf-8?B?b2d3ckFHSGVpTmFEQmlBSUVtQnl2a3ZFTmJjZXhWQ0JqOFQ3NHRQaEJuWEg3?=
 =?utf-8?B?dlViMWd1QU54RjFOcmlBSktCMkJTU1ZqamJoRjlDYmZaRHFFZmZGTnVsSVUw?=
 =?utf-8?B?TkYyWGJYOGpSbWFaeGwzaGt6VEdsbWJaTzZEaEFCQzFNSXN5bjRtQUhrQTRD?=
 =?utf-8?B?eTUzTGZhcU5ncTkyTVFGa01hRGFoVDhyZFpBVGllN3h6TVhaMW1USm9VSjZ0?=
 =?utf-8?B?N0dxdkxXY0tMdVdJZmlReTRRMlJpVVdnYzFNOGo2MGszRUVFblRraEczZkJi?=
 =?utf-8?B?QWJRTUlSSkZmdjBYemxGeExnUlRWK2YvM3UyZDF3Vld3SWNyaU5HZnRYdFNP?=
 =?utf-8?B?TzFmYklMNlF3STR3ajAwTUQ4VmhHbzdRd0IvTWNUTS9LREtQUENDYXdnNnY1?=
 =?utf-8?B?d2l3b1pCSnkwMm50dHUycE9HRzFOTEt4ZEJGUUZ5NUtDTlV6UVBUOGtMU2RE?=
 =?utf-8?B?N2wzZTcwQWNqMUxFdWF5UlZaZ2NYeThJRHNuKzA0c0dYUjIzZ0s5MWFnWFFk?=
 =?utf-8?B?dy9wN3Z6dzRrVW5YM1FEaHMxQTBwMVVzY1lpN2w2V016aXNkMlB0WkJQWnA2?=
 =?utf-8?B?MUlDanczM2RiODhXVWhESEgzTGxLYVdhd2kwaTVYdFNKWG1tQzlJUVNTSkJR?=
 =?utf-8?B?MGtlNkxSSVFGb0xRd1M3cDhYcVNWRXBPNStjTytqQ3ZTWG45dnlISVliN3V1?=
 =?utf-8?B?TFpHKzdBWStvc2NuYmF6RVZLTGlacEM4S0JRSHdQWGpmYURTc3kvUmZTZlE5?=
 =?utf-8?B?M1RiaE9GU2REUGU3c0c2ZmdGZk0vTTVMa3Bsb0JVV3R2M2VmTGdpdlYwTzR0?=
 =?utf-8?B?WlgraDN2b0tlRVQ3R280MzJZM1dsTi95OFRnNDZmZWVJQVEwVXI2ZFA2Zk1V?=
 =?utf-8?B?L3JEcnFvNHpSTDVVRnU3aWxSSU1vRXdwNElPVHJOZ2s3QjNqY3ZEYlBGckx3?=
 =?utf-8?B?aHdnc1JUZHRIR0Z0RmNTTWRBSkVMZVc4bWdzcnNxNTF1MzVUUTY0RWZJZkFO?=
 =?utf-8?B?RFdnc0R2MW1rTkhhZkdpODFPcU81WjFjSTl1WWJOK0NITHNGRE0wSEdpcVAz?=
 =?utf-8?B?SmRyNVBXK0F1RzZzWmRXd0habC8xZEVmbC9Lc043T1Awc3hPZlNCclBvcEJZ?=
 =?utf-8?B?dzAvendRUlNjUjVPekVxUmhrSUdhNHVCY09rKytEY05FWG5YMEU5RVptNVBI?=
 =?utf-8?Q?67H/+ZWOuhBhiJUocOYJXOeBLgttNwV1RFoFKcE?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="UTF-8"
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB6PR0402MB2760.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ec329d8a-cb25-432c-b356-08d8ede4589b
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Mar 2021 10:13:46.7150
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WbhtOJ62/fXDnhf9euG/v48VpfuOuLaFu8DdiuY6Ee7zwN1VeTcRcZfYWurXKF6zdyryMsyD8NVmy1NXxV8HGQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB7178
X-Original-Sender: peng.fan@nxp.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@nxp.com header.s=selector2 header.b=fj7v54wk;       arc=pass (i=1
 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass
 fromdomain=nxp.com);       spf=pass (google.com: domain of peng.fan@nxp.com
 designates 40.107.21.55 as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
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

> Subject: Re: [PATCH 2/5] Check UART UCR1_UARTEN bit before writing data
> 
> On 23.03.21 07:25, peng.fan@nxp.com wrote:
> > From: Peng Fan <peng.fan@nxp.com>
> >
> > There is frequent start/shutdown operation in kernel reboot process.
> > And at the end of kernel reboot, kernel will switch to use console
> > output,saying imx_console_write on i.MX8MM.
> >
> > imx_console_write will save/restore uart configuration.
> > However before imx_console_write the UCR1_UARTEN already set to 0.
> > when restore, it is also 0. Then when we runs into jailhouse disable,
> > jailhouse write to uart will trigger errors.
> 
> What kind of errors? Hardware exceptions or what?

Hardware exceptions.

> 
> >
> > So let's add a check.
> >
> > However to hypervisor itself, there is still risk that kernel disable
> > uart, whenh jailhouse is going to write data registers even with this
> > patch applied.
> >
> > There is no good way to avoid such contention, the best way to avoid
> > such issue is that use a different uart from Linux or remove `.type =
> > JAILHOUSE_CON_TYPE_IMX,` from configs/arm64/imx8mm.c.
> >
> > Remove `.type = JAILHOUSE_CON_TYPE_IMX,` means jailhouse hypervisor
> > will not output to uart, but you still could see jailhouse log by `cat
> > /dev/jailhouse`
> 
> There is no separate UART available, to have kernel and Jailhouse on different
> channels?

It depends on board design.

> 
> Another alternative is to avoid using the UART as console under Linux, right?

Yes. But in case jailhouse is sharing the uart with Linux.

Thanks,
Peng.

> 
> >
> > Signed-off-by: Peng Fan <peng.fan@nxp.com>
> > ---
> >  hypervisor/arch/arm-common/uart-imx.c | 4 ++++
> >  inmates/lib/arm-common/uart-imx.c     | 4 ++++
> >  2 files changed, 8 insertions(+)
> >
> > diff --git a/hypervisor/arch/arm-common/uart-imx.c
> > b/hypervisor/arch/arm-common/uart-imx.c
> > index 849f8fca..6485f36e 100644
> > --- a/hypervisor/arch/arm-common/uart-imx.c
> > +++ b/hypervisor/arch/arm-common/uart-imx.c
> > @@ -15,6 +15,8 @@
> >
> >  #define UTS			0xb4
> >  #define UTXD			0x40
> > +#define UCR1			0x80
> > +#define UCR1_UARTEN		(1<<0)
> >  #define UTS_TXEMPTY		(1 << 6)
> >
> >  static void uart_init(struct uart_chip *chip) @@ -29,6 +31,8 @@
> > static bool uart_is_busy(struct uart_chip *chip)
> >
> >  static void uart_write_char(struct uart_chip *chip, char c)  {
> > +	if ((mmio_read32(chip->virt_base + UCR1) & UCR1_UARTEN) !=
> > +UCR1_UARTEN)
> 
> if (mmio_read32(chip->virt_base + UCR1) & UCR1_UARTEN)
> 	mmio_write32(chip->virt_base + UTXD, c);
> 
> And a comment on the "why" here would be good.
> 
> > +		return;
> >  	mmio_write32(chip->virt_base + UTXD, c);  }
> >
> > diff --git a/inmates/lib/arm-common/uart-imx.c
> > b/inmates/lib/arm-common/uart-imx.c
> > index 984dc218..9cdf9089 100644
> > --- a/inmates/lib/arm-common/uart-imx.c
> > +++ b/inmates/lib/arm-common/uart-imx.c
> > @@ -39,6 +39,8 @@
> >
> >  #define UTS			0xb4
> >  #define UTXD			0x40
> > +#define UCR1			0x80
> > +#define UCR1_UARTEN		(1<<0)
> >  #define UTS_TXEMPTY		(1 << 6)
> >
> >  static void uart_imx_init(struct uart_chip *chip) @@ -53,6 +55,8 @@
> > static bool uart_imx_is_busy(struct uart_chip *chip)
> >
> >  static void uart_imx_write(struct uart_chip *chip, char c)  {
> > +	if ((mmio_read32(chip->base + UCR1) & UCR1_UARTEN) !=
> UCR1_UARTEN)
> > +		return;
> >  	mmio_write32(chip->base + UTXD, c);
> >  }
> >
> >
> 
> Jan
> 
> --
> Siemens AG, T RDA IOT
> Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/DB6PR0402MB27606C1FA79A5B33C6E6052388649%40DB6PR0402MB2760.eurprd04.prod.outlook.com.
