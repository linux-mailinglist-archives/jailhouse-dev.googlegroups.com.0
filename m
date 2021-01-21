Return-Path: <jailhouse-dev+bncBDAMFR7JZAEBBNNCUOAAMGQEE5XKSLI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x538.google.com (mail-ed1-x538.google.com [IPv6:2a00:1450:4864:20::538])
	by mail.lfdr.de (Postfix) with ESMTPS id 6169E2FDE3A
	for <lists+jailhouse-dev@lfdr.de>; Thu, 21 Jan 2021 01:56:22 +0100 (CET)
Received: by mail-ed1-x538.google.com with SMTP id a26sf241531edx.8
        for <lists+jailhouse-dev@lfdr.de>; Wed, 20 Jan 2021 16:56:22 -0800 (PST)
ARC-Seal: i=3; a=rsa-sha256; t=1611190582; cv=pass;
        d=google.com; s=arc-20160816;
        b=pQi6ukkFE3DZLD5kUE7RTAdUusOnGVH/x386JbGkg28I1a1L1iY/ohHZWOIGbDs3yh
         zrP9hDBr2nGJvstmqwlGGsYeBVEdDZY20+qRVOX6683aNLPlLpGrmNdHdKsdwkhkViUL
         lQx96lwy8t+lwnhg2wnOMQnLctaPKBe/x0DqiAkctWwoQKTyZG5k4fXwUdofSzaupB+k
         WqvA3dFG6a4UeN7AiasxLdxQ74OTX5hfEMxgr1aldPmsPMeaPeQjO6rr8g5yTET6waYZ
         EQMnFgaXdTYoWfCUYU4zePTfsKPxV7o/qADGN8Yzb44MLkSvrFZRNA79kvlyJ/7akx6u
         DzfQ==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:subject:cc:to:from:sender:dkim-signature;
        bh=8piYSRIf5rkzkSD7GlN0GqvAg0bBiMxtwLgi/7Y1gfg=;
        b=1Hc3DNLyvCAt6hT/K5YSyAefL2fFuMvy1Zk93qay9rxcz/aHppeOSRgQUSra3bo2jW
         kvOUTBcf4ZMcM0erIUHT4UWOQynhC/b/NeQFZi7DCub1EfpoWH6lfAQMHWGpNPK5i0qb
         uC3K6dNHHqpfiMfWpk6cQgPaQqpy+H9AQmUQcJLt/ewVEltvMYj3+2RWgKyyU63/wQI1
         hB8nogc892vyiNZ22eOTBf484wPKYxTUdDovgYSgKdnnFzT6LwBKhWZUwagx9sXmlHS1
         RS8gSENi97i80jDDapPNLIm8lKnhpFEEyQzKoWC9yTaUTskbCfkGb6T04TCYSBZNOz7y
         7Hkw==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=mYrnZGFt;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of peng.fan@nxp.com designates 40.107.20.50 as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:thread-topic:thread-index:date:message-id
         :references:in-reply-to:accept-language:content-language
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=8piYSRIf5rkzkSD7GlN0GqvAg0bBiMxtwLgi/7Y1gfg=;
        b=McDH1ViB5tn12fXtmIum+YElmlNYbKb7UW7bc6dHGKx86wPBUsU6tsnSMndfiLwdtO
         4C1L/ncJilcsPzgJRESxfvXmTOc+LQ7R9AdavkeLZ4SapQJkj3zGm4j+FZMPI4tBkhM1
         PfdUC2h3kl/GO6kAzaN1Yr+wf8E8M0n/WGMUkJOX/mPJq79VmFCOQWFOMtrO/YnNMFyq
         DtHBmRXds5akO+Sznrro4aF0d78KuKGOnRahaleZVx2f1nCdon5o8rFnhgYXZFozHU3S
         ZyDc1GAW5Z5EObimtvkDuny2B6WIDNzgxz1hRDbyWQrouKBRF+Bugp8vOOCQM73asgbP
         JoOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:thread-topic
         :thread-index:date:message-id:references:in-reply-to:accept-language
         :content-language:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=8piYSRIf5rkzkSD7GlN0GqvAg0bBiMxtwLgi/7Y1gfg=;
        b=sicWdVYtOssaMJcfKI1bXuVdd26muetbp3ypzZie6frJmIOAos3EMNMXZbWkTzuU7c
         1uW5Dm+qOl3WmIei9F+cCAAJoEYJazKRE66wQEMU7O5bYJhSy/Hw9X9EHTKss7e0ZBof
         2ylXusJiSY87jr2iGy0vE4wMvBOYUiOalXDK4xmmCZc/pjhZpYMcImxYTY4RqYuwxyff
         Duy5bF+ssAO6jr3nF1pHDFIszjJvd/LU9wX9q8Ljlqq52kqCGldjilR/NRsCPJSv6+du
         3G1ppqZ7jgpmct/3ppQPsG+TvXAmbnGf4x7nhp3A3uQS5mDP7EiR0EP28rg2avrawbCj
         VwvA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533Ol/Jji0Y1U9T6R0mmWlo8R3p2PaQLP+7NJY+b/UU867aOS2QP
	3HRmP4MCo3ZYtcA0z/2F8e8=
X-Google-Smtp-Source: ABdhPJxaGL3jzmIG7I4KgcXA6uVQZnfweH9SryshJJQDYtzKNjEd3QxQ5SnDqEv2hCw9Bm47kR2RDQ==
X-Received: by 2002:a17:907:175c:: with SMTP id lf28mr7714024ejc.110.1611190582055;
        Wed, 20 Jan 2021 16:56:22 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:906:1192:: with SMTP id n18ls108703eja.5.gmail; Wed, 20
 Jan 2021 16:56:21 -0800 (PST)
X-Received: by 2002:a17:906:e48:: with SMTP id q8mr7508833eji.478.1611190581207;
        Wed, 20 Jan 2021 16:56:21 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1611190581; cv=pass;
        d=google.com; s=arc-20160816;
        b=gHML+KMXhuaZIRUhqxHJGoP7wy8LXeBd7lUx5XC3G/pZsUdmBxyb7sS58igEyu99qS
         9sCsebT5zsClxABLm/dY48JLe9+MQa9UEjsaGwwaU5NVJWCdzTCd0TldPHnVdx7Z/j4b
         3xd5jF9DO6Sa+GZIch9YDvvZPMu52mJgPPupZsmDP57ebmR2CLylFrwRUdPmsbJnNp0w
         i2QkfZ+8GPPSb7drrmR5SPrfjNvaq3Ia7CKhiatBjdQCgT5MSrPQ/AxgD8WNq8GxfCkU
         pqKvyPzCYXQgaaiNq4a0L+9CiVPwoJ55NveJDihst2Yh4XwbMTLy4NzxazsMLSTz0tsH
         v7gw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:subject:cc:to:from:dkim-signature;
        bh=ANIqpvn+ovJbelqq3nn8t+bI+6cPkeclKbWtFZ0NtgE=;
        b=yign+4L7ThAZbD2g6ZNmaiMFNU6Rzht6U/itkxLpTTS5gAU9i5gDpHTh7s3TC/St3X
         JtpFTmKkONcz43OJhoaq/BLKp/cT6TExIZNv+NKgENlTwwb9cF728eQCFGJBfQrmwowP
         4CCuvcFVxi0cGR4LsiIlOYkGDzZFnVvOsI5EcoTPILtaMXcG4b85PD2PDfUvrQ47SDKz
         kVyO9nRZ3/msKRb7noKyedQL5KteEUrm9Y4h1g1JiM/V+AsGYB7IS/Tj7VM04vh+nyi4
         uDj4WAnZOY5Y1vgB/gqotpIQNFHr2pvYgHkBB0gxjaBRtTyO64vw/LtJtBRXAR9K+J5C
         lAaQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=mYrnZGFt;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of peng.fan@nxp.com designates 40.107.20.50 as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2050.outbound.protection.outlook.com. [40.107.20.50])
        by gmr-mx.google.com with ESMTPS id s1si227720edw.4.2021.01.20.16.56.21
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 20 Jan 2021 16:56:21 -0800 (PST)
Received-SPF: pass (google.com: domain of peng.fan@nxp.com designates 40.107.20.50 as permitted sender) client-ip=40.107.20.50;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BNsotJaUdNewUGKiJdl1vzxvNLTfGhp7lll/df+WJ0b7+nQkxj7wp8RISQuZ/abC0yynPoq+sB+OXmpfdkVhuWnBr+Mv9Q0E8rKkv94LUt0HOPjK6WvkyLBSSpXeSmJhYcT+LsR7aUb7WkJX6DMaBG3WMvm6cHxjmHO66GDIeYG03TW1YaCd8DoAFvk3YEnOtgFbF2bdq9xkKC4tur5XiOPstiDMX1D/8p9w97+9iig8gzcr8GbXbV3gCP49TmgeVmPluWZVu+YrXtkIkq1uX9x9z11suV5Nz+PECZVQnpt1J5gXdEgsVkJlLeN3l7lss+uI/n+wUuJohMz0Kdmm4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ANIqpvn+ovJbelqq3nn8t+bI+6cPkeclKbWtFZ0NtgE=;
 b=O5m0gQ0bJwrtO6830EsSxmNANpdhM7u8GEcjovxXumPx4QsclM/saAyLxQYhvyvnlxqCfcUR7MnirXCrNGsMfkqp9pXnFtNPdg1LmcXkjezAGHtqL5vFZnunyIFVXL/ZHoetZ5oVqdxJJTyPlvPm7As1KNp2UeLxZqiRS3f/HSOTnNHh8Xuf5ieRS7C+Kg2yrvIh4bmW9FjsUiYZvs3ncMGhTNndZVSHN23r9pBFENf42F5rij2KGt6wq3myqTao4cHm7BkNwZ8p5mcpfnOD9VbGVb7MwLA+631lQ+H/2E/FqZ5G+FSEB4A6JLY49yxb+gT+npzUIPoimqaxAAbBCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com (2603:10a6:4:a1::14)
 by DB8PR04MB6713.eurprd04.prod.outlook.com (2603:10a6:10:10b::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.11; Thu, 21 Jan
 2021 00:56:19 +0000
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::c964:9:850a:fc5]) by DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::c964:9:850a:fc5%10]) with mapi id 15.20.3763.014; Thu, 21 Jan 2021
 00:56:19 +0000
From: Peng Fan <peng.fan@nxp.com>
To: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>, Jan Kiszka
	<jan.kiszka@siemens.com>, Angelo Ruocco <angelo.ruocco.90@gmail.com>,
	"lokeshvutla@ti.com" <lokeshvutla@ti.com>, "nikhil.nd@ti.com"
	<nikhil.nd@ti.com>
CC: "jailhouse-dev@googlegroups.com" <jailhouse-dev@googlegroups.com>, Alice
 Guo <alice.guo@nxp.com>
Subject: RE: [PATCH 00/10] ARM64: boot jailhouse before root cell linux
Thread-Topic: [PATCH 00/10] ARM64: boot jailhouse before root cell linux
Thread-Index: AQHWbGQ7sCfqYTCIg0iVKNihnvHAXakyjcmAgAABblCA/RU5kIAAEzGAgAAVaYCAAnmN0A==
Date: Thu, 21 Jan 2021 00:56:19 +0000
Message-ID: <DB6PR0402MB276015BA5191EA1010D6D8DA88A10@DB6PR0402MB2760.eurprd04.prod.outlook.com>
References: <20200807030632.28259-1-peng.fan@nxp.com>
 <891d13c9-6845-ef65-36db-4327d6736361@siemens.com>
 <AM5PR0402MB275606FED01836E49F644C2E88450@AM5PR0402MB2756.eurprd04.prod.outlook.com>
 <DB6PR0402MB2760EC86B40254F8CC07A1FF88A30@DB6PR0402MB2760.eurprd04.prod.outlook.com>
 <3125cc07-ff98-2427-2c9c-56c94588f97c@siemens.com>
 <a7c570ee-7860-f1ea-60bd-3fb17c6d1751@oth-regensburg.de>
In-Reply-To: <a7c570ee-7860-f1ea-60bd-3fb17c6d1751@oth-regensburg.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [114.220.136.38]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 708a1ece-9341-43e5-6097-08d8bda75d3f
x-ms-traffictypediagnostic: DB8PR04MB6713:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DB8PR04MB6713FDD441CF8DC8421F3DD688A10@DB8PR04MB6713.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 8ZAaFcQmMpc2rh3Wxa2CpCj/J5bc7i1lze00CfajpRKWQLzZoVIOXjcAUHAadigGqJUZ3gEMdXaZ1AxfmGhDKJf94ElKVAXXFmuWEsAxhwYT/D/SzUgP28Gax46dve1eswhyqzGvMS5hGspZSc4gza4Wh/LzmPcXJkBn5a4EFQZ+B82mgnzsi8tIlfo1IItZ6bcnJ0fOjfN4FxxLPqcDX+hkftpnVxDSgtQSvN0Tunc3xedt/Bgu614SiLN6r6xSu7YrYwQExCLq2bzxMiSo8MJxJHQVP68NwZ9unXzty4uzwDYatXInzeFzeD5wfm+WZ+dI1tydD1Yv//mwqOjanlARsmW6oWAe/+Jv5d4fkXlAzfOEQ+FOWoPMeXq0mAl1uW//R/KAXJZtu51LgNJQK+rMWIpCsU3s2rZLzxOEMmAuTtN9Lkgq9JKKiU83xB1dPPt6tlA5Gh+lYxPTAYR/5A==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0402MB2760.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(396003)(136003)(376002)(39850400004)(346002)(5660300002)(66476007)(8936002)(55016002)(33656002)(186003)(478600001)(66446008)(64756008)(66556008)(76116006)(52536014)(86362001)(2906002)(53546011)(966005)(26005)(4326008)(9686003)(44832011)(6506007)(54906003)(71200400001)(316002)(83380400001)(8676002)(110136005)(7696005)(45080400002)(66946007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?MyzDTPzo+KdGkBuEVOboKdr2CiALDafwbQGL8IRWj1JOHOn3+batVdbCkyZf?=
 =?us-ascii?Q?YzQ6T1Obvc65/8D59sZFtAJqyKAcWKE1Onix90ifFaGRYQvd3J4n88Q4ycsT?=
 =?us-ascii?Q?dKRReoF6gBSqyismI2PISGjdLbIT3fVof/iIhVGjNyD73gOWWDJlmGw3wMEz?=
 =?us-ascii?Q?Oy/HkcBaAMiYWBPvukibF7/wnCwJNIOWvVwpGXsh4ahH4yPHFVUqYr8th4ZA?=
 =?us-ascii?Q?6+/ZFQXkz8jnW9UxviXuutvT2dzfqQ2QiEGH4+q7Vf99PlSXznmB7SlzbsMr?=
 =?us-ascii?Q?e96PyzL6uaX2Z4J0/pnM49LfBjBgzuX3OWZWYEC4N5GMjLw27ElZyhJ2fSNH?=
 =?us-ascii?Q?NuQJWrm3BqJ0pwDuaYasEa8bCRoIyvNMftzdlZEhqd7xGs0n+jCKmrvQRQdc?=
 =?us-ascii?Q?JM3raMqKilN9UoafEf2mV21yRAxezaB5FDNzFuLWHWPUz7QUJ8JskYtYa+VR?=
 =?us-ascii?Q?P760RdV8yhyZRIxszeqXp286nXqie3mkci7846Wb5ttLJU1ghM/+pQopjH7g?=
 =?us-ascii?Q?kD0hFHtdN9fPGyOf382F0Z7N7EO2J0yvR4PhpK/9/b8h81/kpSUPYf6kRgsS?=
 =?us-ascii?Q?odAiHazptLtYWl/ooFoJvmvFljO7sRYr8J7i0l4W39fljhdwAKeBagiPXhCQ?=
 =?us-ascii?Q?9IyyQBiWqVhOj3XACrYUG+wpkrMFn1kY13JM+SmDZAT5miTyoIQWCZzOxS9C?=
 =?us-ascii?Q?PfQtG5rSsEH0VtgqajRT6mGjPyxouvH61+xWpCXlSJ+Hh/CNXAD7zmQ5Jsof?=
 =?us-ascii?Q?Cyp85LCKPa/RstMGv42FpVD0MrsJhvOEfKRY6AeSE3EoWsFU+j680BBBGKWV?=
 =?us-ascii?Q?h6H/MCtkw3vZ5XZa90WhdyPcwIyMeyCCBkJdIdA8C2S/EQVsjyCLY8Ydu5ix?=
 =?us-ascii?Q?1rFPnUjtk+IhDr307qQanwQCmrmkNhMAo2BVUBH+BOoVEMpk/Pnrb2jioGjU?=
 =?us-ascii?Q?ZonBDffba9y0gEvlfLWWqpFpQZaIPrKzRZfidrE5CL4=3D?=
Content-Type: text/plain; charset="UTF-8"
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB6PR0402MB2760.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 708a1ece-9341-43e5-6097-08d8bda75d3f
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jan 2021 00:56:19.3138
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: IuUFuOBGP6uQ0JmnxkyhFJJM6RPgqATyMfL+KhLPpS+2hFg9yofCPli3DUVX4923n5MVi1PjMwZiLYGDz2iUCw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6713
X-Original-Sender: peng.fan@nxp.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@nxp.com header.s=selector2 header.b=mYrnZGFt;       arc=pass (i=1
 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass
 fromdomain=nxp.com);       spf=pass (google.com: domain of peng.fan@nxp.com
 designates 40.107.20.50 as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
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

> Subject: Re: [PATCH 00/10] ARM64: boot jailhouse before root cell linux
> 
> On 1/19/21 10:48 AM, Jan Kiszka wrote:
> > On 19.01.21 09:48, Peng Fan wrote:
> >> All,
> >>
> >>> Subject: RE: [PATCH 00/10] ARM64: boot jailhouse before root cell
> >>> Linux
> >>
> >>
> >> I wanna restart this topic and hope we could move forward to land
> >> this feature in Jailhouse mainline.
> >>
> >> The initial thread:
> >> https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgro
> >>
> ups.google.com%2Fg%2Fjailhouse-dev%2Fc%2FIZEFz-e2lh4&amp;data=04%7
> C01
> >> %7Cpeng.fan%40nxp.com%7Ce99f4eb319194a5c16b708d8bc6a0d65%7C
> 686ea1d3bc
> >>
> 2b4c6fa92cd99c5c301635%7C0%7C0%7C637466510971068028%7CUnknow
> n%7CTWFpb
> >>
> GZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI
> 6Mn
> >>
> 0%3D%7C1000&amp;sdata=ckwld2q5WaXdTjFZgKupN0brisxgyNdu1hiMplrdnj
> k%3D&
> >> amp;reserved=0
> >>
> >> Angelo also post a Linux-less RFC mail:
> >> https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgro
> >>
> ups.google.com%2Fg%2Fjailhouse-dev%2Fc%2FgctNUieKd8Q%2Fm%2FekSKq
> Ba2BQ
> >>
> AJ&amp;data=04%7C01%7Cpeng.fan%40nxp.com%7Ce99f4eb319194a5c16b
> 708d8bc
> >>
> 6a0d65%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C637466510
> 97106802
> >>
> 8%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIi
> LCJBTiI
> >>
> 6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=JDEBgtW8bOeqjI5m1bK2
> q5DdGCbi
> >> pkgK2EX3gfQiOkA%3D&amp;reserved=0
> >>
> >> I propose a IRC[1] discuss in Germany UTC + 1 (10:00am); China UTC +
> >> 8(17:00pm) in Jan/22. If you need the other timeslot, please raise,
> >> then I try to find one that make all happy.
> >
> > I'm already blocked (up to 11:30 local time) on the 22nd. If we are
> > looking for a morning slot in European time: 25th before 11am or 26th
> > before 1pm.
> 
> 22nd won't work for me, 25th or 26th would both be fine.

Then let's choose 25th, UTC + 1(9:00 am); UTC + 8 (16:00pm).
1 hour should be enough for the discussion.

Thanks,
Peng.


> 
>   Ralf
> 
> >
> > Jan
> >
> >>
> >> [1]
> >>
> https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fweb
> >>
> chat.freenode.net%2F%23jailhouse&amp;data=04%7C01%7Cpeng.fan%40nx
> p.co
> >>
> m%7Ce99f4eb319194a5c16b708d8bc6a0d65%7C686ea1d3bc2b4c6fa92cd99
> c5c3016
> >>
> 35%7C0%7C0%7C637466510971068028%7CUnknown%7CTWFpbGZsb3d8ey
> JWIjoiMC4wL
> >>
> jAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&am
> p;sdat
> >>
> a=yVeutdslxmRixs2jiUvPqkW3l7Xf9OSF7q0P%2B%2Bo1xDc%3D&amp;reserv
> ed=0
> >>
> >> Thanks,
> >> Peng.
> >>
> >>>
> >>>> Subject: Re: [PATCH 00/10] ARM64: boot jailhouse before root cell
> >>>> linux
> >>>>
> >>>> On 07.08.20 05:06, peng.fan@nxp.com wrote:
> >>>>> From: Peng Fan <peng.fan@nxp.com>
> >>>>>
> >>>>> This patchset is to support boot jailhouse before Linux.
> >>>>> The previous RFC patchset:
> >>>>> https://gr
> >>>>> ou
> >>>>>
> >>>>
> >>>
> ps.google.com%2Fg%2Fjailhouse-dev%2Fc%2FIZEFz-e2lh4%2Fm%2FBBmGI_s
> >>>> pIQAJ
> >>>>>
> >>>>
> >>>
> &amp;data=02%7C01%7Cpeng.fan%40nxp.com%7Cfd19d34344a04a8e00690
> >>>> 8d83dca6
> >>>>>
> >>>>
> >>>
> d2b%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C637327286910
> >>>> 022610&am
> >>>>>
> >>>>
> >>>
> p;sdata=LWalmGgc5itX1A9VYPlJHE8zRst1XiL2lSilgI2z%2F4U%3D&amp;reserv
> >>>> ed=
> >>>>> 0
> >>>>>
> >>>>> Patch 1~6 is to create an new folder libbaremetal to hold files
> >>>>> that could shared between inmates and new bootloader.
> >>>>>
> >>>>> Patch 9 is the central part to boot jailhouse with a baremetal
> >>>>> bootloader, which only support ARM64 + GIC_V3 now. It will use
> >>>>> psci to power up secondary cores, do GIC_V3 dist initialization,
> >>>>> Then kick inmate cell.
> >>>>>
> >>>>> Images/cells loading is done by U-Boot bootm command to boot a fit
> >>> image.
> >>>>>
> >>>>> Patch 10 is to support using jailhouse userspace tool even boot
> >>>>> jailhouse before linux, just do as "insmod jailhouse.ko
> >>>>> early_loader=1", then it will bypass fw loading and etc, but setup
> >>>> information for linux usage.
> >>>>>
> >>>>
> >>>> I'm missing the big picture description here:
> >>>>  - how is the memory structure that the boot loader needs to set up?
> >>>
> >>> Nothing special, just put the cells/inmates to the fit file, as 8mm.its.
> >>>
> >>>>  - how is the handover between loader and root linux?
> >>>
> >>> Nothing special, the boot args are reserved when U-Boot kick the
> >>> loader, the loader will pass the args to Linux after jailhouse initialization
> done.
> >>>
> >>>>  - how are things configured?
> >>>>
> >>>> From a first glance at the code, it seems a lot of things are still
> >>>> hard-coded, likely imx8-specific. That may mean we need to work on
> >>>> the user story further.
> >>>
> >>> I use bootloader/include/config.h to define some addresses. Since I
> >>> using Fit image, do you think it is good to parse fit image to get out the
> info?
> >>> This will need porting code from U-Boot or write from scratch.
> >>>
> >>>>
> >>>> Also, a qemu-arm64 target would be good.
> >>>
> >>> Per my understanding, qemu-arm64 to run jailhouse not have U-Boot.
> >>> I need to let U-Boot boot Linux, then could add the feature.
> >>>
> >>> Regards,
> >>> Peng.
> >>>
> >>>>
> >>>> Jan
> >>>>
> >>>> --
> >>>> Siemens AG, Corporate Technology, CT RDA IOT SES-DE Corporate
> >>>> Competence Center Embedded Linux
> >>>
> >>> --
> >>> You received this message because you are subscribed to the Google
> >>> Groups "Jailhouse" group.
> >>> To unsubscribe from this group and stop receiving emails from it,
> >>> send an email to jailhouse-dev+unsubscribe@googlegroups.com.
> >>> To view this discussion on the web visit https://groups
> >>> .google.com%2Fd%2Fmsgid%2Fjailhouse-dev%2FAM5PR0402MB275606F
> ED0
> >>>
> 1836E49F644C2E88450%2540AM5PR0402MB2756.eurprd04.prod.outlook.co
> >>>
> m&amp;data=02%7C01%7Cpeng.fan%40nxp.com%7Caa5cbde61bf944b03f45
> >>>
> 08d83dcbd646%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C637
> >>>
> 327292966107007&amp;sdata=C7kgZJYMLzHTCwhP6cCjub7x0K0raYBc%2F3I
> >>> bwqI%2BRZw%3D&amp;reserved=0.
> >
> >

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/DB6PR0402MB276015BA5191EA1010D6D8DA88A10%40DB6PR0402MB2760.eurprd04.prod.outlook.com.
