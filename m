Return-Path: <jailhouse-dev+bncBDV3L7XXLYILHSFURMDBUBBJ73YSO@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23c.google.com (mail-lj1-x23c.google.com [IPv6:2a00:1450:4864:20::23c])
	by mail.lfdr.de (Postfix) with ESMTPS id BEB3C43117B
	for <lists+jailhouse-dev@lfdr.de>; Mon, 18 Oct 2021 09:37:23 +0200 (CEST)
Received: by mail-lj1-x23c.google.com with SMTP id g5-20020a2e9e45000000b00210e9d8299bsf1288212ljk.18
        for <lists+jailhouse-dev@lfdr.de>; Mon, 18 Oct 2021 00:37:23 -0700 (PDT)
ARC-Seal: i=3; a=rsa-sha256; t=1634542643; cv=pass;
        d=google.com; s=arc-20160816;
        b=WXLDmN6i1LckeW9CPUw2DWxY4pN3y95QrCi7Ku47ZgBRTfr0eeetChpFDMUFgHVoOC
         z0RS7iNvd6WJVzu00FQopHM6QDIzfJ2miwWHYkJMObWHEAasEb3qiZY8Re4MGCr2nHhQ
         VNYCig+g0ahqO2F9tvJPWTUpwETkyJzdTr4waEOibSdHGcaDpX8jsar5FzWPgvJWG3+V
         zf1IaYOJ9Ytv4Brp3tmDUKhPO3jfeG957OEu+WHBWh/qNbZzM+nWqhiEL8TDGpvqIDDY
         PJJIbWheGGaDEsbZw+UAgqsAx/eHlszpLqmfxV7sqL0vo0+XvpgVpxK29SYeJK8lno0A
         /jyQ==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:subject:to:from:sender:dkim-signature;
        bh=WvFbhBJ8T+DXKsnBFY2zl0Yr558Me5V4cyRsq9ELirU=;
        b=RFy+hCaAe/qLlsIHm6QvX754EHbS0Hb/SwKmU7oH77K3L4u1jt5TY7CfHXinRmDt/V
         TSefeZtylByY6CrL3FE3yumkgYjZpKcrs++8hVds1xslDw7eJzJDULODe6/hd7wx1GE8
         i/a0HF8xjJj1FMt8n5JXWdcAP0NH1mnbrKr/Lsyrrz5OseOyg1QgYFRrMSA2OcU8+aaP
         /mL1bLHHUlxb8dOQAJ4JH1Y6O4H9dHjq3oNeoaDlwcGYmz5r92hdQTySAsBDU1ofS8Cl
         i+fIZxbwgz51EJmz4volvF646hD/IKlGBMf1Tdio8CNTvfy6WZ/kCwjFU12Z7iSO2JOe
         GtSg==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=RTTq8ef3;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of anda-alexandra.dorneanu@nxp.com designates 40.107.21.84 as permitted sender) smtp.mailfrom=anda-alexandra.dorneanu@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:from:to:subject:thread-topic:thread-index:date:message-id
         :references:in-reply-to:accept-language:content-language
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=WvFbhBJ8T+DXKsnBFY2zl0Yr558Me5V4cyRsq9ELirU=;
        b=oiE4PzB0BLlp4o2KhOSkL6SHyPSCC1ECExUbnpEk2bA7Iic21I2GxPvwlSTj135+xU
         4woVJ8ozVh9Rpwm4GdiPTGD3CExdLPKP8q/ElM3zXURM9V78cRyggyVqosnFgPvUSkSn
         fZM9jX/R2e0M+a4kmsuv9xIHJDVVONuCbLn5ZjIS3JaNLrCHGKasVES8Pynbgv2Sl+3G
         s4OnJx+Qde7WT/YYxrw3C0quhP4Q3m94ywktjN984IyCbZTWxSPbW+xPlbfiObwgHT06
         6/72EzhL+o7VJX1DlUQu+hceunwxWGOYTpXcq825kjJA5g8MT6PAt9fqdc1OKESWOjCS
         BGEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:from:to:subject:thread-topic:thread-index
         :date:message-id:references:in-reply-to:accept-language
         :content-language:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=WvFbhBJ8T+DXKsnBFY2zl0Yr558Me5V4cyRsq9ELirU=;
        b=yR0T8BFD32/qoz3jdHJoixmK1LDVHwhgQMsAf+Cq9Qg7eT1cxnZLAZypE2NjJWY5gZ
         DJdWXpSSaDNlJeBwyzAu5uKFlJgJpp4jx0l7KQO9U9qeiFRltfQC1FtH5rNw1fcCKe21
         AhaE06mfKWeoAeQ1hbOPpV7a9EyfHJq8pjiF2UzC2Gl5zCqtsXk5XjdmCAVgmW56BLmN
         TdlbOBj61+RgUCryP1HQIDf/UMukot3Czlxjym1EJr9BRZJxi9QmihPcSt52GHl9gzmh
         iTWGz5ro/FE9LKpJNyUGbagytXweCAmdFh0uwTun8kbkUVe8GHwcF33b7VRi/xJsLLDd
         4ysQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM5315uBjUWZsa1Ape9GIcN/EahF6vsJqpHoI7F2LXiii6Fgs5vFts
	SDXqMAJPavzJQCpXYedLeA4=
X-Google-Smtp-Source: ABdhPJzhoFfsitETvvrhrgcMHCdfnyTwCYpEF8OLtghu9x/ek+NIsYDY+MvT2uwaw0oVWLfC2iEH8Q==
X-Received: by 2002:a2e:7308:: with SMTP id o8mr4159452ljc.360.1634542643256;
        Mon, 18 Oct 2021 00:37:23 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:a48d:: with SMTP id h13ls2539025lji.8.gmail; Mon, 18 Oct
 2021 00:37:22 -0700 (PDT)
X-Received: by 2002:a2e:b547:: with SMTP id a7mr31176854ljn.347.1634542642341;
        Mon, 18 Oct 2021 00:37:22 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1634542642; cv=pass;
        d=google.com; s=arc-20160816;
        b=XZkB7eg6dsPVdauez70vIXyJwVB6JUOBRi4hWzy4FsA+Hy8sNqlRJF+hSdSqx3HC99
         UUPxUEETytyKrv1U5ZAt+0j8pvjL/tQiMYaqYBooPfaUKVj6aiiM6bfwGbWKIm9+vwfV
         C/vQGzn6e0Qc++xEExCUQaGDT5E5/jeHfkEFUshEsFnTUZiqcXbKAPSXVxn6LUj9bJn8
         U4jraeRXd+43pkKpd4phCLggzdn/2J/S4nZO8iefsnW+Zw42i+rbKDv6uQTzttnyxDTg
         N+51WzVy19v6dOA0cEmnerYXeg/YPtcmeKqW3SN5oMhEfIC5a/nlG57g/LfRus2zKIX+
         uYkQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:subject:to:from:dkim-signature;
        bh=8hzV61P0V1VrLqlGLR27Ut94ezJ93rn9j8V3nvlW6dY=;
        b=lPCYn18KUV95RVNUFwBMPP9zEZUOOILQ40uLw3PzI3WsZevtWwoS+zOKZ2+pj7Nxsa
         V1qtxSJBsrFR9oJeGAv0LVgtOR8X2cHQAzypUiC9Ano3HNDPt5IeQmNXv1NhBk5r7Lf7
         Kiutv+2Ma0/zJid8wej2BcFaJjJvLAbx6WACQ3pvNie+ynaOmIbx9J8v5k0w/h7Iz6X9
         ekRxl5ckOpjo9HOSghRnNnu9nsdnnJwb/894/Igbo48ZmUP1FoyaHoXwfJn7GEov7SXs
         xoGfeY5ehl/0h02fw7f3UHUpvR9nd295KYlRHXDNYYPs/0xOJoLBl79bfQffOjmCvU3u
         2O4w==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=RTTq8ef3;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of anda-alexandra.dorneanu@nxp.com designates 40.107.21.84 as permitted sender) smtp.mailfrom=anda-alexandra.dorneanu@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2084.outbound.protection.outlook.com. [40.107.21.84])
        by gmr-mx.google.com with ESMTPS id d19si856597lfa.0.2021.10.18.00.37.22
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 18 Oct 2021 00:37:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of anda-alexandra.dorneanu@nxp.com designates 40.107.21.84 as permitted sender) client-ip=40.107.21.84;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C62SRzBzEDHfAxWTFULZYbpB7FzApaDGEQ4qbva/G9qliAnyvcRyMpyXlSQ9pNgq24jaD9XBceB0yvpyHIjQk5Zmr+v761xNsuhClPugP2aUbnOs3AtbFOLI+epunn2Ia4g84RSQSRCMEI8lx4BiDgnKpYBvD87hwPG79wyNghJ/iAJZznwcaw0Hfx5S8FxAbhLpdUW81Ukciv6X3AqSCM+an0ZHIdobvob3I9ctgfHwHtfID0tJ4fzXG9Rd4MqeSsSVlky7bUOvDk0IQxXbEtoOLWKOxt/lLsnMe1760hTJzidFlzJFYp+OipAF/6W8OzaDUCgG/YSimH70lbdjCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8hzV61P0V1VrLqlGLR27Ut94ezJ93rn9j8V3nvlW6dY=;
 b=MKcbb+RKOB1QI8ZNlg3saLV0VOykZCrrm74vrlxm22Sd+v4ZVUrqL4noeaFRI0x2hKG2ELtY1icA3k/HbGJ8ME4an759Y23Hsxm9mXzaQ1WqsGbs0o9UHiCJWzkbsc8rPtIgNy5yNPNxZkvhms4vvBJsrUNxhAeZEK2Xxwnbe0qaWgVT+vjNYdZKa6L/0TDxhIFqZRNlgKIrHcm7aLLA+BdJdiDaraE3jNOJ/H57fpqpoADwqE9iitgHkfy5n1NzBuc9//cseTLILQSk4BVBO0ES8YTOAs75vxlJwKjKZs6qJEi5sboSyUkIcMLBFMJT32gYVzFMPjDcLJEKj0Ok2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
Received: from VI1PR04MB4719.eurprd04.prod.outlook.com (2603:10a6:803:61::13)
 by VI1PR04MB6144.eurprd04.prod.outlook.com (2603:10a6:803:fd::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.16; Mon, 18 Oct
 2021 07:37:20 +0000
Received: from VI1PR04MB4719.eurprd04.prod.outlook.com
 ([fe80::10ba:7d8:8af8:2fc]) by VI1PR04MB4719.eurprd04.prod.outlook.com
 ([fe80::10ba:7d8:8af8:2fc%3]) with mapi id 15.20.4608.018; Mon, 18 Oct 2021
 07:37:19 +0000
From: Anda-Alexandra Dorneanu <anda-alexandra.dorneanu@nxp.com>
To: Jan Kiszka <jan.kiszka@siemens.com>, "jailhouse-dev@googlegroups.com"
	<jailhouse-dev@googlegroups.com>
Subject: RE: [EXT] Re: [PATCH 1/2] configs: arm64: Add support for NXP
 LS2088ARDB platform
Thread-Topic: [EXT] Re: [PATCH 1/2] configs: arm64: Add support for NXP
 LS2088ARDB platform
Thread-Index: AQHXv2BAqTPiFJvOjkeF7xt1wqEos6vSXJMAgAYJihA=
Date: Mon, 18 Oct 2021 07:37:19 +0000
Message-ID: <VI1PR04MB4719745D619F78DC62EAF8E8BABC9@VI1PR04MB4719.eurprd04.prod.outlook.com>
References: <20211012115644.31005-1-anda-alexandra.dorneanu@nxp.com>
 <adf4fcd1-8e60-fb93-e1ae-209079c55873@siemens.com>
In-Reply-To: <adf4fcd1-8e60-fb93-e1ae-209079c55873@siemens.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d2c25e1b-3fd4-4032-207d-08d9920a1df5
x-ms-traffictypediagnostic: VI1PR04MB6144:
x-microsoft-antispam-prvs: <VI1PR04MB6144FE2FBBBEBCE48E16DD34BABC9@VI1PR04MB6144.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6108;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: oa6HDQ02xJ7p6ViLy4AocIt7nyH75+XrAkDmt+tdxIKIxj1SzY3tqbz4NP+B323qTDNiZUoVRf6GQi2jZMhjrLLBCaXeu6rtfXg+5IGDUpSE6GPRo+3mlvCqADxR25PEBAMVpIlBw3o7ouaXa7Px+XYik7A3BTiYRdoSsXKq772FSxoA1Mh2+r3NntqECX2IIvHl4WvvcoSZhRORqkP7j8td4A8ekerF+RopgpXn+3vS2RdNTSKo2PxB75NOHIG/pK1XC04xEs8Zh9Kr3A19urX6sp7pu1vZD4rN2N1KSBonsqs/w1p8C2wc7W6tLZyiZ1uCc/yvw1NFbptt3MO8HzEqsJfpjAm4mBM3pJQ5Uybwify+SuUGnFXHOsIKgQYud0RSnNaTs5uNUIn367+lypFTQTylnrNKTJ1jtnGLFtVCVAWBvp4f5Jo8oVhjj7AMd3c+Dp/5lbvaj2dtaPa+94aSbEjvFNlE5vDtvsgASZAc1q/e3vhtAwir3pI9QEwmWjMux1XktuYiiuHamQMB+qjN9AU8htNgHuUQe7AJj7fG8fIsp837CTtT209a9NAULGWUyTHxvGjEZl39y1+92JZ1JivUzCTFi7Z7osSaQF3jbMF3pgpRoDIytkHoSY43RJ5mainRkmBC4prFCmv1fB0G47fWutVn0Ysh2NDoP2JmwWEjIeegcJk0ZowVmtApc3ouMNyr9KHP5321XirW8Q==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB4719.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(38070700005)(26005)(52536014)(66476007)(7696005)(38100700002)(71200400001)(186003)(6506007)(9686003)(66946007)(86362001)(8676002)(8936002)(316002)(76116006)(55016002)(2906002)(66446008)(5660300002)(122000001)(110136005)(508600001)(64756008)(66556008)(33656002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RXhBb2Q3VjNpNVBmY1hBbUViQXJvZWVtSUJWMkpJMldCdlNtVFNjZDVMOGRh?=
 =?utf-8?B?N3dQbS8yYWR4QjY1RzBzdHhZTDRaM21nVzZrTzE2c29JS3FKTWpqMmhMemV5?=
 =?utf-8?B?QmhJeStGT1J4RUR4Y2dWT2M2YnNDRnErUENpM1BFTk9UY21LdXR3enN1cFk2?=
 =?utf-8?B?U2xuMmo5R2Z6VCs1ZFVpcktSYTl5azlXZkV3VldheTJaQXpkRktBcXBscXJK?=
 =?utf-8?B?TzR1UnRCVjRPNHBEZENFdWUwM2hRUk4rYWc5K1dpNEYwbXI5blplK2RwbHVY?=
 =?utf-8?B?TFlLcVNNaE50ZGhObWJFeFpDVVk2R0YwOXBiZUtoZHZGWFlnU0hzV242cFht?=
 =?utf-8?B?UGFVR0FVZlYrdXB4MmswRHFHbkZDVVdLNVArTXgvNFU0cmlDVG9veE5JZGJj?=
 =?utf-8?B?Q00zY2FJMy9FUXpWeEZFQXFFcWM1TXMxRXUyNXg3cFJsaW1VMHRIbVlPLy9U?=
 =?utf-8?B?SlhlN3JlcEVHMmNCcG45KzNSekd2VUVtNlRIWEpEMzEyVXdJOXJQUFRjYnZh?=
 =?utf-8?B?SThQd3o3cnBxemk0SVdid3htM2JQd3VsdS9kb2c5VUgwM1ptQnppVGdhWU5o?=
 =?utf-8?B?djB6NDJSb2hBREthVEZWZk1OSkRmQlYvVW01Ry9tWmZyOHU0dVBUeEw0OXpO?=
 =?utf-8?B?ZmJ3OWNad0lTVlZhcm55dW5GUTI2QmFINzQybk5rSSswbGJiK2NVdGFqK29Q?=
 =?utf-8?B?aDJEZjUrdkZ6emJiTU5FbjRTK1Y1dlNNSU1ZMkdqei9Hb05hL055dTM0UUtw?=
 =?utf-8?B?QlBOWmVQZDBJNzIzN2ViV1h0em82cFZFNGxkdWJvdXYvenk0bUlpN1p0QWlK?=
 =?utf-8?B?RzBNdFRKU2picnlJOTZTZ1ovNkVWcTdMWDhscElDM05yVGE1dlI4UVJiMEl5?=
 =?utf-8?B?SFZ5SjV4Zk1RUDhHVGduTHM1QjRQMC9UbjVtUUYrYWphWmx0U0l2bzloY2Nm?=
 =?utf-8?B?YkJwMkVEY0FwTzNuWm5wVFhPMkhkMDkyVjVVa281bXJEZ282QVhLWWtrbUJJ?=
 =?utf-8?B?Zk1XMSt1dlU0Skx1WHIyVEFBaDNXK3lnMk1VUU5JVWpaOHBmVGdtbll3N3Zm?=
 =?utf-8?B?dHZqRFZlZE9KNkRVQk1pS094UElpY0Q1MHBnVm1DdU5YSmluSlkrcCtVT0g4?=
 =?utf-8?B?ZDF2STBqbmZ0cThUVjFiMEdWT2tMc0l5eFNqRW10RVNyODdYSUlaa0RNdktj?=
 =?utf-8?B?b3RsSVJ0dTQ5RlpoTWUwR1ROaEJxdWtqK1Fxai82Y1VCcVI2VzBmU0cyRkdC?=
 =?utf-8?B?MDkwZFYzNitiQnd6OXUyWS8vNFk1ZlF6MGNMYzBJZndUWFJRRXFXbittcWZW?=
 =?utf-8?B?TUVLbklRd1pQZGZEellBSkNQdVBLT1oramNvYWwyeXEvamhSb1hqTFQwUXFG?=
 =?utf-8?B?SGsrT1JIbVBlSU9uVkZIb21raFpVQUcrMTJGSGZ0L1NIWHMzK2xzVFdHY015?=
 =?utf-8?B?M2dPYVdINmtpMkY3Tm9NeEFHcWJsNU1aUXJxTk0vMXdKWG9vWHQ2TlhhOWxj?=
 =?utf-8?B?L25jZUVEc2FYN0k3czNNSWJmbWRsUVZMekovZEVaMy8xTXF0eWdGOHJnS0FB?=
 =?utf-8?B?MHRZd1htdEJnRWxVZXVUWGhydlpMdzBLaHY3b3FXdDFYd28rK2VNRC81cXN2?=
 =?utf-8?B?S3VwYlRvR0ZsM0dYeVQ3MU5XUnBsM2tpdHBqWmszcS8rcVVKYjJRd3VuaFQ0?=
 =?utf-8?B?dUFCVTU4TEwwVE1aVFE2YkZQT0wySmNvS2puN1pRSEhKUndWOERlTndQZzJk?=
 =?utf-8?Q?8/Hlyw63kX0RU03jjJ0EUpsgO94NaBX5SmNJSV4?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="UTF-8"
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB4719.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d2c25e1b-3fd4-4032-207d-08d9920a1df5
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Oct 2021 07:37:19.8338
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vq4CqrbHmL4gzyrhMLGJQ4ear5hSyKrOuq8KTui1A6iwy4tWgCztr9cIAIOvA0MYFsdBUl46QFR9M3pLzvx2H53s6xsRitdqXRiO1o33W6Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6144
X-Original-Sender: anda-alexandra.dorneanu@nxp.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@nxp.com header.s=selector2 header.b=RTTq8ef3;       arc=pass (i=1
 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass
 fromdomain=nxp.com);       spf=pass (google.com: domain of
 anda-alexandra.dorneanu@nxp.com designates 40.107.21.84 as permitted sender)
 smtp.mailfrom=anda-alexandra.dorneanu@nxp.com;       dmarc=pass (p=NONE
 sp=NONE dis=NONE) header.from=nxp.com
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

>
>> Add root cell, inmate cell and Linux demo cell configuration files for 
>> NXP LS2088ARDB platform.
>>
>> Signed-off-by: Anda-Alexandra Dorneanu 
>> <anda-alexandra.dorneanu@nxp.com>
>> ---
>>  configs/arm64/ls2088a-rdb-inmate-demo.c | 122 ++++++  
>> configs/arm64/ls2088a-rdb-linux-demo.c  | 141 ++++++
>>  configs/arm64/ls2088a-rdb.c             | 556 ++++++++++++++++++++++++
>>  3 files changed, 819 insertions(+)
>>  create mode 100644 configs/arm64/ls2088a-rdb-inmate-demo.c
>>  create mode 100644 configs/arm64/ls2088a-rdb-linux-demo.c
>>  create mode 100644 configs/arm64/ls2088a-rdb.c
>>
>
>[...]
>
>> diff --git a/configs/arm64/ls2088a-rdb-linux-demo.c 
>> b/configs/arm64/ls2088a-rdb-linux-demo.c
>> new file mode 100644
>> index 00000000..b8e583c0
>> --- /dev/null
>> +++ b/configs/arm64/ls2088a-rdb-linux-demo.c
>> @@ -0,0 +1,141 @@
>> +/*
>> + * Configuration for LS2088ARDB - linux-demo
>> + *
>> + * Copyright 2021 NXP
>> + *
>> + * Authors:
>> + *  Anda-Alexandra Dorneanu <anda-alexandra.dorneanu@nxp.com>
>> + *
>> + * This work is licensed under the terms of the GNU GPL, version 2.  
>> +See
>> + * the COPYING file in the top-level directory.
>> + */
>> +
>> +#include <jailhouse/types.h>
>> +#include <jailhouse/cell-config.h>
>> +
>> +struct {
>> +     struct jailhouse_cell_desc cell;
>> +     __u64 cpus[1];
>> +     struct jailhouse_memory mem_regions[13];
>> +     struct jailhouse_irqchip irqchips[2];
>> +     struct jailhouse_pci_device pci_devices[2]; } 
>> +__attribute__((packed)) config = {
>> +     .cell = {
>> +             .signature = JAILHOUSE_CELL_DESC_SIGNATURE,
>> +             .revision = JAILHOUSE_CONFIG_REVISION,
>> +             .name = "linux-inmate-demo",
>> +             .flags = JAILHOUSE_CELL_PASSIVE_COMMREG,
>> +
>> +             .cpu_set_size = sizeof(config.cpus),
>> +             .num_memory_regions = ARRAY_SIZE(config.mem_regions),
>> +             .num_irqchips = ARRAY_SIZE(config.irqchips),
>> +             .num_pci_devices = ARRAY_SIZE(config.pci_devices),
>> +             .vpci_irq_base = 85 - 32,
>> +     },
>> +
>> +     .cpus = {
>> +             0x2,
>
>One thing I missed: This overlaps with the inmate-demo, and we only assign a single core for Linux here. Can we make this 0xc (core 2 & 3), like with the other ls* configs?
>
>If it's ok, I'll fix this up in-tree (no need for v2 then).
>
>Jan
>
>--
>Siemens AG, T RDA IOT
>Corporate Competence Center Embedded Linux

Yes, it is ok for me. Thank you!

Anda

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/VI1PR04MB4719745D619F78DC62EAF8E8BABC9%40VI1PR04MB4719.eurprd04.prod.outlook.com.
