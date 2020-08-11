Return-Path: <jailhouse-dev+bncBDEN32754MOBBNWZYT4QKGQE3SDH22Y@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x13b.google.com (mail-lf1-x13b.google.com [IPv6:2a00:1450:4864:20::13b])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AC66240521
	for <lists+jailhouse-dev@lfdr.de>; Mon, 10 Aug 2020 13:17:11 +0200 (CEST)
Received: by mail-lf1-x13b.google.com with SMTP id u11sf2791496lfg.11
        for <lists+jailhouse-dev@lfdr.de>; Mon, 10 Aug 2020 04:17:11 -0700 (PDT)
ARC-Seal: i=3; a=rsa-sha256; t=1597058231; cv=pass;
        d=google.com; s=arc-20160816;
        b=EoNcR9Jd+5YIwXTqjQ+99tlBm1yYgMg7fT3VHVz1QKjbJ5cGtlB5g/KAwJH4+Jow3X
         3rWgG5ZoN2Ekj35LHFIxPJIQ1ZRKfvqIa+PjnLbVIdeYuI0H7Ydvosz6/NU7UvSoWhuU
         1jgCJddahysECgjgiorbO6b8FBiad5bIN53lOcz8DLhAzv6DFfQOiFJ5bxzMz/ms3BRp
         W/Tr99lTxbbWFvg61oqYgdWCOf72N7saz1h/F39CXEF3oUUouXCZao+W7cnIYbceXRTg
         EKkhQv5aRkMFYUytBUbV/gJcZUwG0cDEzq8p+a9kKnQU1kZfNA+SFna+4FMivfhWoVUZ
         WcQg==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=n4AZ2KhRKIvRSvEX5EWMhn5Wa/6vuC3tMza2iHHks3k=;
        b=EfrgK9Xj9wTlWVLWjWAYj22iTAmV2EDvpgvKClZ7sxlS4FataTSTmkCf8tImsLvCZz
         ca6dHdk0iCCkDxEDMpNjwunhWrEksDc37gS3xkiuF766/jwKBI8x8EzbEmn7fxk6o/+W
         021Q6q5O4NMWczjqFkFGBYnV/+VfFcLVLBOu/V7CaN26aWzU6EsdYHvqvq7+mFMGoQ3Z
         /CpI9Fh0IC3lK1c51O076j7FfR6Ci0j3MMNBcGmAEIK6SpswwtlunQav9xFmx5m5xn1F
         U6oBfs9v9f2Z7dRu2k866iOZBRZaWR8SW+hNgfsTS6Ax2CQHAK3RUDk6Q/FOilqgk9F8
         SimQ==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=mlQvNfqj;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of alice.guo@nxp.com designates 2a01:111:f400:fe0e::620 as permitted sender) smtp.mailfrom=alice.guo@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=n4AZ2KhRKIvRSvEX5EWMhn5Wa/6vuC3tMza2iHHks3k=;
        b=Ung3jWfmXzR3fRJyDa/mi0RRT9cbNlnQGVB9bOOswE7Fq8X70coFjHtCLcIG0Gvlrq
         nI1JZdKsoOJin0zufjkfP3sJDF5XmzmMj2JKJ3sUHonRVXY0pA4+wHXqAlDE/QXIofUh
         FE+z+9j7BswXI4ud/vrI7OAsWzt9CfGQUuQxPbU49+VeEe4egO1+V88vVYxgRHD6eU7B
         NNK/8fKN6UCvJgbfrHghuj6kJkPqoQQjgNZ2cE2L9qA+dpMC6S2qgPUFKSqYXE2oA4/x
         Xv1Cxz2LJ4DFmpz90x/JhjE5qy+JkxPxfZegx1+SyYvM6M9oyjtb+tcVVlp90TdQulTm
         gXNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=n4AZ2KhRKIvRSvEX5EWMhn5Wa/6vuC3tMza2iHHks3k=;
        b=CCHEz+i3aeyIvBJhhSkfCjdZASDo450aMev7Y02pyhyPL0Q5jgwvjJkSZCaZABuzBq
         phQKRB9j3GXaIdYfCodBufV0E3brYWConUZKjeb8uECTsor67ZmQ1iqZJTRN/0I28pYA
         ti0cdinDKtBrG4d7/in5nRhT3Qa3GkT0M3Dae8e9Qe9jt/muS4aDsLyt8fSKcoMpnHY4
         +mAIsv+IA6gxaklm0caW+3FfBJox28GCX0PyalY8jHvHTMzrmxGCXMvReNwOove7RgJA
         9QAHW5SER7A7RmyKc1Ah7eD4syGI3Lf5q8I1Su9wVMmxqcPkiACweYVaX0TUPmMPQkUH
         RobA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532MYqvSaEpm0n2fuYMuF0xvdWiMY1dW/yJ2gklQ2s+rK+mW6m7O
	/ChVkEt/9+2ocsu+rtm5hN4=
X-Google-Smtp-Source: ABdhPJyXmfISv764W9PdSA/9BWqpHz/MbF+6TdIqoRLtsgnIFjEchzA00GIO3mUaYnbG6UewV1GAAg==
X-Received: by 2002:a2e:8557:: with SMTP id u23mr287591ljj.45.1597058230974;
        Mon, 10 Aug 2020 04:17:10 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:9a58:: with SMTP id k24ls3138279ljj.4.gmail; Mon, 10 Aug
 2020 04:17:10 -0700 (PDT)
X-Received: by 2002:a2e:720f:: with SMTP id n15mr283982ljc.73.1597058230267;
        Mon, 10 Aug 2020 04:17:10 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1597058230; cv=pass;
        d=google.com; s=arc-20160816;
        b=PCplJ7asoDOcnjcB8evZTdJtIFT3HLWmLOPC62r2JqFDl3cVD+dRZLDoY9mMldS4PK
         o2iTB2sqppU+BnNaYAfPNI+ZZ536gEQlM/HxcFxn+3NlKGVTuLqTSd8UWOwc4xfk8BmI
         n9gRMlMA3KTvyuziikBSNgRVZ3sx4O7MQX+8L2e+DPfUZqw+rmZ+ZiV4ZfbeEL1p/0ls
         HUhQOUbBtQXsSjeRXcW0Xfa0MRIpB9kLCaGeTzibIhOmPPq3H5RoUkbF2t2GGGjGDi7r
         /nVAuVOEoRksLKSBoUl9slJrN6UQaoED/fnxzP2Iu4d2k/xSblL6vOpnXVFZoR9fCYsF
         /iKA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=6L+I0TgpK5usRZ2lCJ//ed4PE+Qc1VyPHobPjQ8wLjE=;
        b=Zaj4jcjWs0mWUUF8c28fJuqE1uFjrIa/TJwFnNHl6UBCAX2Hih4pnLM27icMA17AtB
         RpSJMjscs0HdU/a+8hpTHEiVZCP1dleLqpnN+AyJVDKeCZ6/Bad42M5FkHOQ4CmdqWIk
         QNP1Q42GBwxj2rdrfQmYK+nmaJWTvq3Yxn4OJbpvR1noqBtXYstpZ+iLqHMi7o2RFfmy
         gc9GmBIq/IFqGoJHHyR4hFO04lbQ8B3SEaD4lOVLxyBaC8Y7q16kyezbp90+K2pHQjw2
         5OjgOI/3cvef4GH4IDb2x/GNw5PHb5qK1oQWtAL5Zq76CoRBt0TJyJS+AYiaN8yBMH/P
         UTDA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=mlQvNfqj;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of alice.guo@nxp.com designates 2a01:111:f400:fe0e::620 as permitted sender) smtp.mailfrom=alice.guo@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (mail-vi1eur04on0620.outbound.protection.outlook.com. [2a01:111:f400:fe0e::620])
        by gmr-mx.google.com with ESMTPS id u9si688471ljg.8.2020.08.10.04.17.09
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 10 Aug 2020 04:17:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of alice.guo@nxp.com designates 2a01:111:f400:fe0e::620 as permitted sender) client-ip=2a01:111:f400:fe0e::620;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iV6aYftFyzcpJ1sladuArrnGPmPmG8eDNn+7Fxz4JeVVuz0G3vIx55/u+t/Q+z8GSL6ghIoGdC2iX1uU7ZvnbyW0ckRPtFZfr5PhrPwji+3oHYhG+xihPzRqH46Kg5uwJKnD93OeqEGh4uGyiS6bhLbzeKbswc7bnTb2Dx+PlCySXQBirKlb+1d1vR/kiAV/weygzHVIVjANVoNH+oTAREmUHwP+K67Ck1lqK7ZlcpIsYmF79IFIaovY0rdqYNuMr12P023QmA8Y4RWM8vnCNiLUyr9/Pe00yx+XEi9zM3Z1MLaCc0sHrRs+lPN2L38BUYPylM6qcrZC4l4B5Xa0tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6L+I0TgpK5usRZ2lCJ//ed4PE+Qc1VyPHobPjQ8wLjE=;
 b=e41tS4kxlGLrGx8u3nQo3JAA4R0XTjev3mHxR1r9UZcM5DwhwAZ6XyWsuAqhscrboRuHfKZK4dkym5Zc+0VwoZ2jej7qkSXe0z3XNSHwXYNyHrsxNigSePO2I/uDEFftd4s5CV9NwB9WBq4sT5lsIgk880Xo4+Q6MbQthW1iXcoOsmXHsM5cC4TuN0IIM3Sl9fax1SS5jbVKV5qG5G0VdFdmh09mrYWWcKwVqzHKFY5+1lg4QXfLjBcKhbbTdrKeaC2VFNqUqP9Z18ngxGd9vGLU5sxRccn71rM5fzHmuzg3QqysrzGpdsAg7MNFcBhHMkGFTIOxe/rWS8XCpaqqjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
Received: from DB8PR04MB7065.eurprd04.prod.outlook.com (2603:10a6:10:127::9)
 by DB7PR04MB5451.eurprd04.prod.outlook.com (2603:10a6:10:8e::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.17; Mon, 10 Aug
 2020 11:17:06 +0000
Received: from DB8PR04MB7065.eurprd04.prod.outlook.com
 ([fe80::8cf6:40ae:36ee:9b42]) by DB8PR04MB7065.eurprd04.prod.outlook.com
 ([fe80::8cf6:40ae:36ee:9b42%9]) with mapi id 15.20.3261.024; Mon, 10 Aug 2020
 11:17:06 +0000
From: Alice Guo <alice.guo@nxp.com>
To: jailhouse-dev@googlegroups.com,
	jan.kiszka@siemens.com
Cc: peng.fan@nxp.com,
	Alice Guo <alice.guo@nxp.com>
Subject: [PATCH V1 3/5] arm-common: gic-v3: solve incompatibility problems in gic_v3_init()
Date: Wed, 12 Aug 2020 02:16:39 +0800
Message-Id: <20200811181641.7282-3-alice.guo@nxp.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200811181641.7282-1-alice.guo@nxp.com>
References: <20200811181641.7282-1-alice.guo@nxp.com>
Content-Type: text/plain; charset="UTF-8"
X-ClientProxiedBy: SG2PR03CA0149.apcprd03.prod.outlook.com
 (2603:1096:4:c8::22) To DB8PR04MB7065.eurprd04.prod.outlook.com
 (2603:10a6:10:127::9)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from nxf55104-OptiPlex-7060.ap.freescale.net (119.31.174.71) by SG2PR03CA0149.apcprd03.prod.outlook.com (2603:1096:4:c8::22) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3283.6 via Frontend Transport; Mon, 10 Aug 2020 11:17:05 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [119.31.174.71]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 30f08c28-25a8-4e54-1a3c-08d83d1eea7b
X-MS-TrafficTypeDiagnostic: DB7PR04MB5451:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DB7PR04MB545150F191FA8E49F31FA8A9E2440@DB7PR04MB5451.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8u3VlnCVbmFcPNagxG9PD9UJrHCmZ2mQISYRv5u/dZNkmAC8U3D1d9LpMAazQRsaLCnDFVvfUPzISJPXK8htBLbWvfkVU4ZrNYfLn+jl7fqknXEXvBVkMFCqI+1HbM4bkMme9lyHNpzN9pzWDWhNi9+O095zn1IzVY7lN6bPTHNlfwYmp6WvFSMiU8EhPYl40BCdwSfI1XqKXBqmEbgkm/Ydub1ut4AQsjBD20L36OpQ6tmIXjEjaiYUhloPgtUNYgBKnW5ltVWFZnouDBQO8oOKMQPzwNqFZRdeGRO5ki++sFp/WfwDIBm5tAQfxJppiMNSN3cowRfgNJUk0Kqfag==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR04MB7065.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(136003)(396003)(366004)(346002)(39860400002)(376002)(2906002)(956004)(6512007)(8676002)(52116002)(1076003)(8936002)(478600001)(44832011)(86362001)(5660300002)(66476007)(66556008)(2616005)(83380400001)(36756003)(4326008)(316002)(66946007)(6486002)(186003)(16526019)(26005)(6506007)(6666004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: PT6JozeitDMAXikRTKt7rCHlsaV7JpcsdPb8s/FoXuqTj1SFSh3Vcl/esYpw81TSj0fiUTOjeWsbDMbKVAkSUbB2o4OILeMv9PgZaPokOl3ThIR6LKhDU95yJ30KYJ4U2DNaABd+rBdINevgUmQzKqVbG/UErkVnR1lJA1T7zZpL98Fc9pLlftV6THz0+QEjVkc3pFHyp/wg7kAr4ltQU/gEGXUcdzq3gpSBZce0/7XFT46Ss8eWCulAEkMwc9bPpOtDbtG5ODvb1ajEYdXaMX1K89oKZx4Rr18RcgHbTucw+IyCjPcWA0n5E9yqR7Yvw5OATf3JHC7negp2/AO64NMCNPSXxMzfg28DXXFuJEtp25LRpVrkT1p1p7VGG10OVFP9igaYiD44nVG9BR6MqNGbgMJrAcDMAmj40SUCK+CcmLwCChh+UOdrsgTb0nF64E2YPnirT5fFLy5gPdA71UYUFcXiGYk876M0Vk0W3qB4c34hGeXxNE7dbcgmWvbJuGHGiVDAJzwljp1xLlycRDaySAE0ntHlWS76YueQsi07idAXSO04ahgEu4B6sGHYQQQnkehl5Y+py6iQ7NDdSfM+pr4iYT5kfwWaiAZuWeh/WOufPk8T7UJcrUOne7fpFqQLE6EDnEZz5rr8Tc6zsg==
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 30f08c28-25a8-4e54-1a3c-08d83d1eea7b
X-MS-Exchange-CrossTenant-AuthSource: DB8PR04MB7065.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Aug 2020 11:17:06.7544
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: y0vN+ehj2Ha7ENsKCgcMG8JzKtS1ty7eYA67F83fYF9OkYclon9npzFw4c9GL5qA9D/YpHoF4KmxqJH7w2aQFw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB5451
X-Original-Sender: alice.guo@nxp.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@nxp.com header.s=selector2 header.b=mlQvNfqj;       arc=pass (i=1
 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass
 fromdomain=nxp.com);       spf=pass (google.com: domain of alice.guo@nxp.com
 designates 2a01:111:f400:fe0e::620 as permitted sender) smtp.mailfrom=alice.guo@nxp.com;
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

When the inmate cell is in AArch32 execution state, using mmio_read64()
to obtain the value of GICR_TYPER will cause error because mmio_read64()
generates "ldrd" instruction when compiling 32-bit gic_demo.bin, and
"ldrd" belongs to A64 assembly language which is cannot be used in
AArch32. So use mmio_read32() to read 64-bit GICR_ TYPER in twice and
add processing case for reading the higher 32 bits of GICR_ TYPER in
gicv3_handle_redist_access().

In ARMv8-A, AArch64 state supports four levels of affinity. but AArch32
state can only support three levels of affinity. So set bit[31:24] of
mpidr to be 0 for AArch32, without affecting AArch64 because
"MPIDR_AFFINITY_LEVEL" used in AArch32 and AArch64 is different.

Signed-off-by: Alice Guo <alice.guo@nxp.com>
---
 hypervisor/arch/arm-common/gic-v3.c | 3 +++
 inmates/lib/arm-common/gic-v3.c     | 4 +++-
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/hypervisor/arch/arm-common/gic-v3.c b/hypervisor/arch/arm-common/gic-v3.c
index 6a1d90f8..584c2c79 100644
--- a/hypervisor/arch/arm-common/gic-v3.c
+++ b/hypervisor/arch/arm-common/gic-v3.c
@@ -351,6 +351,9 @@ static enum mmio_result gicv3_handle_redist_access(void *arg,
 		if (cpu_public->cpu_id == last_gicr)
 				mmio->value |= GICR_TYPER_Last;
 		return MMIO_HANDLED;
+	case GICR_TYPER + 4:
+		mmio_perform_access(cpu_public->gicr.base, mmio);
+		return MMIO_HANDLED;
 	case GICR_IIDR:
 	case 0xffd0 ... 0xfffc: /* ID registers */
 		/*
diff --git a/inmates/lib/arm-common/gic-v3.c b/inmates/lib/arm-common/gic-v3.c
index 35ee9a6a..12978ea5 100644
--- a/inmates/lib/arm-common/gic-v3.c
+++ b/inmates/lib/arm-common/gic-v3.c
@@ -76,6 +76,7 @@ static int gic_v3_init(void)
 	map_range(redist_addr, PAGE_SIZE, MAP_UNCACHED);
 
 	arm_read_sysreg(MPIDR, mpidr);
+	mpidr &= ~(0xFF << 24);
 	aff = (MPIDR_AFFINITY_LEVEL(mpidr, 3) << 24 |
 		MPIDR_AFFINITY_LEVEL(mpidr, 2) << 16 |
 		MPIDR_AFFINITY_LEVEL(mpidr, 1) << 8 |
@@ -87,7 +88,8 @@ static int gic_v3_init(void)
 		if (GICR_PIDR2_ARCH(pidr) != 3)
 			break;
 
-		typer = mmio_read64(redist_addr + GICR_TYPER);
+		typer = mmio_read32(redist_addr + GICR_TYPER);
+		typer |= (u64)mmio_read32(redist_addr + GICR_TYPER + 4) << 32;
 		if ((typer >> 32) == aff) {
 			gicr = redist_addr;
 			break;
-- 
2.17.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20200811181641.7282-3-alice.guo%40nxp.com.
