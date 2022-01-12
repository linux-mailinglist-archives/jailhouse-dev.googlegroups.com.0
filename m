Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBTN57KHAMGQETL4E4RI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x13d.google.com (mail-lf1-x13d.google.com [IPv6:2a00:1450:4864:20::13d])
	by mail.lfdr.de (Postfix) with ESMTPS id B1DBB48C0F8
	for <lists+jailhouse-dev@lfdr.de>; Wed, 12 Jan 2022 10:26:38 +0100 (CET)
Received: by mail-lf1-x13d.google.com with SMTP id s16-20020a056512215000b0042bd76cb189sf1281315lfr.6
        for <lists+jailhouse-dev@lfdr.de>; Wed, 12 Jan 2022 01:26:38 -0800 (PST)
ARC-Seal: i=3; a=rsa-sha256; t=1641979598; cv=pass;
        d=google.com; s=arc-20160816;
        b=DpFmBVdizh3eZnS66EKqPoGf4iuDH6+LuM0N4NMy9nQGdZ4QjS3iDVyDrA5nbNFSHe
         vyZp9mqcVgjPE++23hMtP2L0gR/0x41mjtMFqXZJwAeOVk2R5avSbJYx+v/FiRB2Afbq
         towOZkxxngrv1TeC63nRnpxl2/ErfF+CdP0Mo3EYte6hBFn5J5esJOx4Ur7MhaAVrTKO
         pHjiizK+lYlb8Zq+u2d0Yr31kOuXc91BcyjYA4rMqABvJ5IGTt9Ah+nZxf+9+Z6PCN3n
         Fh9UPBbuAqiFrl3chdvoo1oDk14GqqeQ6K62MlQKs+Q4kKFyIVz2tx2vWmtQ3MhMyqs+
         pSLg==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:sender:dkim-signature;
        bh=aneQrlE9y0MAXi+PMI5P2Q3LSI+GkB0ZDq7yVPbwYG0=;
        b=jVvQEhdRHZRLSqNyYewQ+N/0HKLhG7Bl4INom+iZ1Q8pqU9HhQOwA5bCS++9uWZOqm
         qCDU0F8+FwpcvqSj8tGa086531I52tei4I6vKfF7nn/op9dmUM6Gw8fzbGmIMS7lerkp
         e9DjBKC6tfZ5J78f/mBefMRstnT+VE2Q8ZyeUvHJGTavArC3AK0JLVJc8miUD4QfJJEd
         JYeFDdBkrA0tOpM8XdpO+RPGbSAcKc7xMaH1/9tWyS+tnAYCsSngJDMLR9HtSTt0GQUf
         tQEAo+z+TtIt+G7ny8IcsoILqyatoGIjrMGtCIgYFgYv1EjPMvv7LzmrsrjYOm4KE6Ym
         ++hQ==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@siemens.com header.s=selector2 header.b=Aw61a0L9;
       arc=pass (i=1 spf=pass spfdomain=siemens.com dmarc=pass fromdomain=siemens.com);
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 2a01:111:f400:fe0e::60b as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:in-reply-to
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=aneQrlE9y0MAXi+PMI5P2Q3LSI+GkB0ZDq7yVPbwYG0=;
        b=GVHwAyvq58DJMQ9J9cG9A/EIkN0uhXLk2EnW3pkqIJN+Q1krfXtA5TYyVF6NU5A8Hx
         RPpbKDNBJs6UpGUpszyI34IMwxoyOPEFEiyE3JNGxf5lRmUHyTpx/1PFqBni+S4+BY8e
         8GyuN+RmeLxhXf6IPxEt0cgG5vm/6MI+Uphm25Mzoz+3cX3NZwUJR6rcETkErGELumwn
         BWB2zDxbSNhuD3b7YoAiAYiH4+sHFnmWddYm6dCNzRn9HivmkkHSaO/JzL6Ckp3FSRyA
         xWZQSJHiVBOzwoXW545ad0GZef3y9pTfRmu4/9iWq0QPo3wltSWQy8megSMy9nAb24Nx
         47Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:message-id:date:mime-version:user-agent
         :subject:content-language:to:references:from:in-reply-to
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=aneQrlE9y0MAXi+PMI5P2Q3LSI+GkB0ZDq7yVPbwYG0=;
        b=dBM/KiAEaF9FL+Pa1LgH4oSruqxwovqI6jrfNbMM+pEvH4nY9RzYkA7XGsKNyIZfua
         GJGEUAhlsKKM6O8Zv75MB9390p75y6Rm2UnupQeEju9oWKkROTqWjkbfvMnT8fX3Hdg7
         +vS7mbBGcHRN2Gdga3Lf+p/zHds/msbfbIZTbxTUyGzZHuegM6/7lII53TaQT3dNCZ52
         PdsiMqAJOJRQzlVt4b6OGBF6UryeEf6DqSc4vsFOn38yEyGuxmOKn2bEe16hbvTOBuEd
         C73HJSYU+/fWFj82OytSo7zwynKvrYL4w/gWVBn2SszfEuLEkKoJ3c9Pig67woRVMMu8
         2zOw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM53149BG75vWsNuvQHDvhufU1bndT3a29xMrnPiHESjs9mbL+nNBl
	Y4A/N95pPFJPvnIW+IXEwVc=
X-Google-Smtp-Source: ABdhPJzuAP2MvwEXtjqRKgK7e71ZJXpV6AP+il8Orev2Yyp8rCTeYH2siKDDWuWFTWCPqK3wsnTyVA==
X-Received: by 2002:a2e:978f:: with SMTP id y15mr5794602lji.192.1641979598114;
        Wed, 12 Jan 2022 01:26:38 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6512:3b90:: with SMTP id g16ls2136129lfv.0.gmail; Wed,
 12 Jan 2022 01:26:37 -0800 (PST)
X-Received: by 2002:a05:6512:3da6:: with SMTP id k38mr6383886lfv.517.1641979597029;
        Wed, 12 Jan 2022 01:26:37 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1641979597; cv=pass;
        d=google.com; s=arc-20160816;
        b=ZjqV+q0jQ0dZU6xW4FrUtHG/fHFc5BbknlecPaateB4aVol+VNYR08aAL/SxcsOfXp
         Ic9EprM4FCrq50tYBHUUNw9im2IjY1s8bXi8N3WjRgpoV6OSKm5Z5Y33tsyTvJbXcnGa
         S/iCpTRNCfS17CTvRsDgAF8Fpq658oBOhvG8PdfQBI226i9NK7+X6u0msviUVXohw/Vs
         UlSFEHqmKGWsXn93gstSUqRYpLtc1a4o+mDNUX92xJkJLjjiW/Mc4GXmgmjS4FGUf/gl
         6h1TGIVc9BclKHgnm7P7/j/O314IaA64DMnCe65/sS5JEzBCEkHuPYx9g0hGAm8outvi
         WN+g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=YWqTxwR1NpEp5tfE/3gIrdjKRQVI9GNJ54IfwJjurTA=;
        b=RKshqMUSaB9okG3cINx7+uoUamAJFNKuFCyhY3LSuhmi5EsL28sqngBcFlIj1QMwXu
         fHywraMhVAKImG3/t5uEcROCdTmJLamy41L2sxv0hAVonX19nWf0prTXIHYLzv30Uc8U
         8XjHSjRmcbwTHtDWAbSveajzMcCRFK3I3eBFKLqwndMK3bCV+6Z58q2knejw6DXSlhF9
         gyHgc3Lk6c9jOTmZNDyKuSYWRS3wNzD27hXzgVM+gL44KpWLWxH+Hda8b1pK0U5hlzrW
         28UxRO2At7Dr5zXmrdB7h/wSU3lipwF+/YXKkNihaKCid2ev4swb54h27X3p/HBeNqTm
         MezQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@siemens.com header.s=selector2 header.b=Aw61a0L9;
       arc=pass (i=1 spf=pass spfdomain=siemens.com dmarc=pass fromdomain=siemens.com);
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 2a01:111:f400:fe0e::60b as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (mail-vi1eur04on060b.outbound.protection.outlook.com. [2a01:111:f400:fe0e::60b])
        by gmr-mx.google.com with ESMTPS id 18si475271ljp.5.2022.01.12.01.26.36
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 12 Jan 2022 01:26:37 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 2a01:111:f400:fe0e::60b as permitted sender) client-ip=2a01:111:f400:fe0e::60b;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bEZBnGTudugzNR2neFWCHf/guWJ+wwmWwR3KiTaFT2nQ51qmQFkhW+DtmEDkRv6XZw012Vy5uCE1D26LEMRyq3Cnw2SUpsZzdIqOSrXdvVDOQim0F1CmZ9BR2atijg/GLd7vXe4vpcyzQ7WtatjtfKrC9Qz0Z5oEC65UZU5GqRRqNvtkL9xzBX0EsPY9fTG5d8Hotl7gmM0BtsowrM5fNM/FHprVu6ycKOiRPfqJF0HEmcBzkXysak0sGNoYBZg/kxYBecUXR6UFhOIGdbsbMzWjxJaiWlJYreh0XTR5Hj7oZR3t/NqhuE2ieCBQHAstX2NLxJjIa2I5Ddc9XR5HtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YWqTxwR1NpEp5tfE/3gIrdjKRQVI9GNJ54IfwJjurTA=;
 b=cfjccM8PGiyt796KZvs7uqTDG4w4rw7ZmfZfvg7VEiUOD1qroiVzv01DkoLrrydsVN7LiXHIrObtxSXDmgMmJnj6kLNW8ui6+LKD+xdHqOJ7w5VFyD8nFVG8JDziEKORtaNjCHDhw3ugCDTjeJSZz5wYogSy3SWpGskUQ287NU/AjTs8j3248aqJtNklcFH7zcDg0PowhuGcFH4lub4QgWzGRHRswnznjvx+1vzvNJc3RQKVJkUQkFpfElNhHl5AxFvIb3nIWx4yymO1i9d95vLFQtkcqR0Nc1rIRiSgHX1N+7wU/muVxwXJgZX0vJM03Qh7SM1eAp5yIvNE426VAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 194.138.21.73) smtp.rcpttodomain=nxp.com smtp.mailfrom=siemens.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=siemens.com;
 dkim=none (message not signed); arc=none
Received: from FR3P281CA0080.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:1f::15)
 by AS8PR10MB4485.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:2b7::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4867.7; Wed, 12 Jan
 2022 09:26:35 +0000
Received: from VE1EUR01FT017.eop-EUR01.prod.protection.outlook.com
 (2603:10a6:d10:1f:cafe::5) by FR3P281CA0080.outlook.office365.com
 (2603:10a6:d10:1f::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.4 via Frontend
 Transport; Wed, 12 Jan 2022 09:26:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 194.138.21.73)
 smtp.mailfrom=siemens.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=siemens.com;
Received-SPF: Pass (protection.outlook.com: domain of siemens.com designates
 194.138.21.73 as permitted sender) receiver=protection.outlook.com;
 client-ip=194.138.21.73; helo=hybrid.siemens.com;
Received: from hybrid.siemens.com (194.138.21.73) by
 VE1EUR01FT017.mail.protection.outlook.com (10.152.2.226) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4888.9 via Frontend Transport; Wed, 12 Jan 2022 09:26:35 +0000
Received: from DEMCHDC8A0A.ad011.siemens.net (139.25.226.106) by
 DEMCHDC9SNA.ad011.siemens.net (194.138.21.73) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Wed, 12 Jan 2022 10:26:34 +0100
Received: from [139.22.143.158] (139.22.143.158) by
 DEMCHDC8A0A.ad011.siemens.net (139.25.226.106) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Wed, 12 Jan 2022 10:26:34 +0100
Message-ID: <b1fd0279-e42b-6041-fbaf-3e48ac3b9ebe@siemens.com>
Date: Wed, 12 Jan 2022 10:26:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH] hypervisor: arm/arm64: fix build error
Content-Language: en-US
To: "Bezdeka, Florian (T CED SES-DE)" <florian.bezdeka@siemens.com>,
	"peng.fan@nxp.com" <peng.fan@nxp.com>, "peng.fan@oss.nxp.com"
	<peng.fan@oss.nxp.com>, "jailhouse-dev@googlegroups.com"
	<jailhouse-dev@googlegroups.com>
References: <20220112065619.19432-1-peng.fan@oss.nxp.com>
 <fc104832-1a03-5d06-f12f-dd34bdb2fe60@siemens.com>
 <DU0PR04MB94175FA39632BC0AFEA908B088529@DU0PR04MB9417.eurprd04.prod.outlook.com>
 <115f149b84fcce90236cde99c1e3f2f11ec86307.camel@siemens.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
In-Reply-To: <115f149b84fcce90236cde99c1e3f2f11ec86307.camel@siemens.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [139.22.143.158]
X-ClientProxiedBy: DEMCHDC89XA.ad011.siemens.net (139.25.226.103) To
 DEMCHDC8A0A.ad011.siemens.net (139.25.226.106)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fa95cf7a-95e5-4177-94cf-08d9d5ada0ac
X-MS-TrafficTypeDiagnostic: AS8PR10MB4485:EE_
X-Microsoft-Antispam-PRVS: <AS8PR10MB448526601344FF43DF10340995529@AS8PR10MB4485.EURPRD10.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ukHiZ4eWqYzFH0urkoa72dSu12fz2e15JLpWtmYDHB6ixNXfbYdbPvX5NM0Oj7EIxERsDe1H/AggAIHHNSKJbISnhnIBKjN0Tl0HN48RJd855oDjv/8V07YMKyAsGp77eIHaiFDLP97QC0g8ywg8MitFrseXSZg1eNOMJWqstO7jMyGLQPDfQdN9i+6TdxWoHV47ycRgFRZUa/hNiJoDq9xXWD+NmCzip0oeJgPDRwE/fmbdrgZ0KB5scj2QA3iI8tvS8GarefopBtQyEEnS/Eltt/5QhDORddQe2Vu/aRDUbRTAN8V50tnSEsW+CiWbejXVVk332A02700M0IwWZQ+JIlgaHq1c0cy9xgpDL0jODTJ8OxWUt0N2q/5bNGcQ9l5Otcd22ntJws72MEpoStDNIBDatfON8OOFNc2Yv+ZrzXmYHGROHyBuCbQxTvKrQQQGV250gLI+MXptnNotVpQPqgce8YYb7HR2Vmfz1SmtUddT1ctVtNrMRK1ovVVUvbdjzO1gUGrcr6U92pPR5qTpCwcdiUpF+34Gk7eGWYhM5z0UO2CmRU+KqB15n4I2rpB2dI8DDM+TiQW0+jf7aqr4lXnn8TAMI9QA4vob//8PTNSRl/Pg3lOo1NL2yEt0mLlXWj4nPgDIWNUq+d4w7lz28snMol/hatdyNOE2O1JMvi6oNUcAyrZAloHWN++9FWcXoQYJJdpKYUP6V7DTErp2tBU0ZRqzGCAwjk29opQ6xeMWqwKQa8WYAmj/e9gZkPO1dcUX1RgC8v3cqcSy5LvrWAzGD10Fl0Q8ZgHwrTWQE5CnAfAHcb2Sv8u27c2m3KeHAtEvpH63sKwBejNSbY0JXCejYEz2ZPGf++q7zcqFT0782Bgds1ucrzHBYzppSCvZJEJlP2zoWTRmKHdhJEWZwzvAc8tvfoFc7p4u+cB3Kj15jnkHdD/jpnriqEc9
X-Forefront-Antispam-Report: CIP:194.138.21.73;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:hybrid.siemens.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(40470700002)(36840700001)(46966006)(70586007)(44832011)(70206006)(2906002)(6706004)(47076005)(26005)(31686004)(86362001)(36860700001)(31696002)(82310400004)(40460700001)(81166007)(5660300002)(82960400001)(508600001)(110136005)(316002)(8676002)(53546011)(356005)(16576012)(8936002)(956004)(16526019)(336012)(2616005)(36756003)(966005)(186003)(83380400001)(3940600001)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2022 09:26:35.0734
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fa95cf7a-95e5-4177-94cf-08d9d5ada0ac
X-MS-Exchange-CrossTenant-Id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;Ip=[194.138.21.73];Helo=[hybrid.siemens.com]
X-MS-Exchange-CrossTenant-AuthSource: VE1EUR01FT017.eop-EUR01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR10MB4485
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@siemens.com header.s=selector2 header.b=Aw61a0L9;       arc=pass
 (i=1 spf=pass spfdomain=siemens.com dmarc=pass fromdomain=siemens.com);
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates
 2a01:111:f400:fe0e::60b as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
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

On 12.01.22 08:40, Bezdeka, Florian (T CED SES-DE) wrote:
> On Wed, 2022-01-12 at 06:44 +0000, Peng Fan wrote:
>>> Subject: Re: [PATCH] hypervisor: arm/arm64: fix build error
>>>
>>> On 12.01.22 07:56, Peng Fan (OSS) wrote:
>>>> From: Peng Fan <peng.fan@nxp.com>
>>>>
>>>> With gcc 5.15, met the following error
>>>
>>> Which gcc version (surely not "5.15") from which distro? I've tried
>>> with
>>> manually adding -Werror=3Darray-bounds to the build and using gcc-
>>> 10.3.1, but
>>> this message didn't trigger.
>>
>> I use NXP linux 5.15-honister, gcc version 11.2.0.
>>
>>>
>>>>
>>>> hypervisor/arch/arm64/control.c:33:9:
>>>> error: =E2=80=98memset=E2=80=99 offset [0, 255] is out of the bounds [=
0, 0]
>>> [-Werror=3Darray-bounds]
>>>>      33 |         memset(&this_cpu_data()->guest_regs, 0,
>>>> sizeof(union
>>> registers));
>>>>         |
>>> ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>>> ~~
>>>> cc1: all warnings being treated as errors
>>>>
>>>> Fix this by use a volatile pointer to keep GCC from determining
>>>> its
>>>> value
>>>>
>>>
>>> Do we something wrong here, or did the kernel, e.g., had to work
>>> around such
>>> issues as well? The workaround looks a bit odd.
>>
>> It is gcc try to determining the array value, but I am not sure why
>> it not.
>> This patch is to let gcc not determine the array value to avoid
>> build break.
>=20
> This sounds like [1], another gcc 11.x issue with kernel / Jailhouse
> sources. I had the same problem for x86 some time ago. Not sure if
> there are kernel workarounds for that.
>=20
> The bug was marked as duplicate of [2], which is the kernel issue.
>=20
> [1] https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D100834
> [2] https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D99578
>=20

Interesting. Just scanned for recent kernel commits containing=20
"volatile" and referencing "gcc" in their log message, but I'm not yet=20
finding anything related. Maybe too early to run after this gcc stuff?=20
Or disable this check? But the latter may overshoot if that check was=20
just expanded, not newly introduced.

Jan

--=20
Siemens AG, Technology
Competence Center Embedded Linux

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/b1fd0279-e42b-6041-fbaf-3e48ac3b9ebe%40siemens.com.
