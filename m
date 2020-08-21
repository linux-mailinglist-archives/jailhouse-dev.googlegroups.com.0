Return-Path: <jailhouse-dev+bncBDAMFR7JZAEBBRPA7T4QKGQEHAZICGQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x239.google.com (mail-lj1-x239.google.com [IPv6:2a00:1450:4864:20::239])
	by mail.lfdr.de (Postfix) with ESMTPS id 0323224CAB8
	for <lists+jailhouse-dev@lfdr.de>; Fri, 21 Aug 2020 04:24:06 +0200 (CEST)
Received: by mail-lj1-x239.google.com with SMTP id t17sf147184ljg.16
        for <lists+jailhouse-dev@lfdr.de>; Thu, 20 Aug 2020 19:24:05 -0700 (PDT)
ARC-Seal: i=3; a=rsa-sha256; t=1597976645; cv=pass;
        d=google.com; s=arc-20160816;
        b=Rq8hVhqfrv90mL/Ihdc2Kc+jm+u8FciSpSi5OcwnfE5f4Ak2fs2Q9V1UeCQD4Qnhy2
         AerJbJFWpQn7Rg9MQVRkQN1dW+JZAtgek/RL7RN+avcmmOXXm/3xBi08HzNMyQGJwJxE
         drhRzfd75850tTf0f5R6MJaruViFqmWRZSzj26Hsq8IZ0ETL6hOKmQBG59Uxypyat6rh
         9vQ7NTSCYbut27faKLOUEB9WRDMHUcqjIHt16e6hLIRgLgPHlulgxxRmu8Oy/v3hUW/c
         U1Mopa6eIPtQit/drHnhLvVwIatJNVgglGx5aBkiqgvfmaH6wTeMzADf2Jkoh6EVJIsq
         ZBYw==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=l+7TCbqmuj1PWvXyqk9O5VjUJDA799il5QsaJjOYp1s=;
        b=JsYG4N9JV/5pv9GBcyempOCrLZdavRdL9tQ7kDKnqyIdKU5zPcFe7XcIJTwzhTV9zF
         O4w6z406DXyMRqLr2E84dM/q6+itlAIi69HTTLij/oAPF3RDnurZ+aVZ8sz1Z1b2B6L9
         9MyFBzaLVkIFzlTnQpz4/VPaxG+Xa5trQuVljU5yi2hWRi3pFV5bEpqTN84IiNUCf5FT
         QNva6jJMH/WwR5eqo5Gl7hxmU+nhq9uxQi3sv1VNtaGHFPj6lJwRHO9djUnjPFmbzMU6
         cf/bLLpQHiaQu4+JWy1CcgPuSkiM3cw4/d6m3EVozPJG+Y9noifvr2yhZCBH1D4Szrsr
         naPw==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=SggkR9e4;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of peng.fan@nxp.com designates 40.107.22.54 as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=l+7TCbqmuj1PWvXyqk9O5VjUJDA799il5QsaJjOYp1s=;
        b=YE1co4NIxOOoZmdGCsYkFZDD2sC1MUkL7Uiw+D2sH6nS6OcXn5BT2E/LoNm0uUhPMJ
         mjtiENkBDlGqO+lJJ+hJkYy8JS7wj4hdc7jj9A75gwPpAXRvowBGDXChMAtOwz3dV9yz
         u75HSv7HeP16EL8mdCOOUfBK52/JVx9p8k3EeyNGA7m2CxFTa83/LpiuFuX9Ze3BZSZj
         IYyc4nPt6zKJrPmAL/peuM4gbSbNWWIeqQ9EJGZf5d7KEWcRuu3SlyXebrXBuImvupr5
         dmdme/H4VnGoXx7y98Qcd8dDfLOU0kShG7FC2I823oVCpHQjknvySebbS94uYle6Gpld
         PN5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=l+7TCbqmuj1PWvXyqk9O5VjUJDA799il5QsaJjOYp1s=;
        b=DNvz6JOT8PQOg4qpFLpDuG9eC07R//7BLIgnAYwucw1SjrHorj7fmtvj01Hp6qKB7x
         IZb8a60A1Vl6ky2Qj+oBDQHSe/faiDC6QZgpOK9ywVvD9NZWSiNt6q6EdjVbOXmPXvsk
         40wGyiifahX2FmQAZQbyyj1DmnX5Yw9+WPiV466PN5zmHL1o+3lCMXC3tYYjB4wo9h1L
         jCx7iso3r2bDeW3So52JEYdPCda7/6yzmitWKsxiCRgX5UkrbBVbed3cEtVlfu4Xd3oE
         YM4kwPw0C7mlxCc4/bOheQZ+O9o1uxVtq/E22t74KPgNBv0RPuG0qINE3J7etOl6j6uL
         lquw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531/BuQRqIA5pP8ZzvGtlwKPocDqBRlv1FlQk3FgRlXQEJx6tlCA
	r6Hh0UNWqZFlCzojxRghmw8=
X-Google-Smtp-Source: ABdhPJxMNk7qt08Sy5+TlstNbbXzmEF1sC5Td1Q43q7Wcv+NL+SzU83Nq5w0BXH4sZu4Z9TaqF6dhw==
X-Received: by 2002:a2e:1302:: with SMTP id 2mr425265ljt.303.1597976645499;
        Thu, 20 Aug 2020 19:24:05 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:ac2:5e33:: with SMTP id o19ls63238lfg.1.gmail; Thu, 20 Aug
 2020 19:24:04 -0700 (PDT)
X-Received: by 2002:a05:6512:2010:: with SMTP id a16mr351798lfb.196.1597976644835;
        Thu, 20 Aug 2020 19:24:04 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1597976644; cv=pass;
        d=google.com; s=arc-20160816;
        b=RubN2NKvSIh1G/yzJoPhonqXF7nv8lu/p5oHDHH4UgzFw9YscJuum6h8kIOLabIUto
         EBbymZR80YDsNalv2iz/JUwETVUQlyU+NPwE0zKQA24XcgitI5IVhJzMSwd/3Pofbt1z
         wy2lT3VVxK3APbWBbyP/xgj8eRpj++6uB/QC5lBWY6u3oHGO45zlKpHsh/PeX4Qp0/Pv
         wT2C8DbpyfFrGZNUcO9s91lnPdTANpt87LqAjiUiR7qHsIcChator2FkqlOb+/KmcLbw
         yScgJbdke5tC1p5bhiwKcXjQiPQfuLDNLbOT5WiHv3Kacka02Sb7YHZCLXQgJAmKuSgv
         B4tA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=1hsKECVLNJ/DSIrqvUPPGQnxhV6ucAABLasYNRVS5o4=;
        b=UutkE0VZwTII6WcxFluZTGPL+tr4BhBFxeV8fD6dJKLvjTkjmGqH5fWfY6PEjef2tR
         rTmp0uPu9u1oJDfN5A0yCPLrFZ1k+SHDws7fQY+dmN/s0qUzfyTvXevRKYbIP0pGBTxB
         +8bTAKsp8C3wc2W+CPbZmk/EBRWaKEh/6vVj9rShrKwnfEBH4+n8rGTdAsEYIr+1cRnx
         HSUqVb7iUrQRZDO9aPpqfP1MEUSDzDSITT1q4sYgeZwOggaKgSZgioNcuCmnBS07Kx7T
         x8yZIM98cXJJd++F0g1Sd9Gjli3I3mG9LfTeRHeBL9HcOytnEb39IdlTzDlwkIpzJAkC
         HPGQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=SggkR9e4;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of peng.fan@nxp.com designates 40.107.22.54 as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2054.outbound.protection.outlook.com. [40.107.22.54])
        by gmr-mx.google.com with ESMTPS id f16si8762ljk.5.2020.08.20.19.24.04
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 20 Aug 2020 19:24:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of peng.fan@nxp.com designates 40.107.22.54 as permitted sender) client-ip=40.107.22.54;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K6AwXjT14/AvS30RPlsd0gclhgHI+OUS//fP+QgDZbrHm5wRyLh1PLfn2/9GOxlLIp2U8QVvjgUJTq2HGytAffOLwP3Ht25dyWI7tpMg6uuzUyrE/O5gEdhLVCoSZYXah+R5FGlBw9Cv35N8ZMAyLVsxtHN1zUayjOj8RovqnBaHd7gYVqVyzO9c52FHHk3FL/WPs4Cx8T1fJim2kXK99nmRaZ/pcdinNWGYhkH1pNOiY09h7VyzXDUgQQXNmdokUsJ43lo/sX/P9ZiEcQlMDWy+zKZarH+rHEDHJGzUaN7cfGmqZ4XgCl61I+NNdURiCqqscmukUp7O5cs/ryOb6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1hsKECVLNJ/DSIrqvUPPGQnxhV6ucAABLasYNRVS5o4=;
 b=EIta8rTGstwjvCq67v7ybGq986rgAP9VtHX3LU05oyqoOD5B3sgODevK1YJJ99fRiYzmAUTqBz7tGGeanZyN9hbcHI54tnQkCUW+0E+vX6riXhEhoVy0G62vmXsGEBvbyin5SN2hWZOPryjcjduArv0GucSIeR/lDRk2TEYGSFss4pClBqx1CQ9Knlr5QWpp9wOl2Ssuhx0wjCaLdRl0/5mdsGokn3hfzyOwvstJrNnIEqH+WikS9teg/0wMNp7f9MPVPhDhkIrXC7OHq86pTrxm6x/5qDQajFBqnTxnTq6GimuZQCgZQ7oQq78nyezg8+adiUQI4uszQZ4OkmU/UA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com (2603:10a6:4:a1::14)
 by DB8PR04MB6620.eurprd04.prod.outlook.com (2603:10a6:10:107::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.25; Fri, 21 Aug
 2020 02:24:03 +0000
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::24d0:f783:3c7d:e232]) by DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::24d0:f783:3c7d:e232%12]) with mapi id 15.20.3305.026; Fri, 21 Aug
 2020 02:24:03 +0000
From: peng.fan@nxp.com
To: jan.kiszka@siemens.com
Cc: jailhouse-dev@googlegroups.com,
	alice.guo@nxp.com,
	Peng Fan <peng.fan@nxp.com>
Subject: [PATCH V2 5/5] inmates: Makefile: add -march=armv7ve
Date: Fri, 21 Aug 2020 10:49:21 +0800
Message-Id: <20200821024921.3075-5-peng.fan@nxp.com>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20200821024921.3075-1-peng.fan@nxp.com>
References: <20200821024921.3075-1-peng.fan@nxp.com>
Content-Type: text/plain; charset="UTF-8"
X-ClientProxiedBy: SG2PR02CA0038.apcprd02.prod.outlook.com
 (2603:1096:3:18::26) To DB6PR0402MB2760.eurprd04.prod.outlook.com
 (2603:10a6:4:a1::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from linux-1xn6.ap.freescale.net (119.31.174.71) by SG2PR02CA0038.apcprd02.prod.outlook.com (2603:1096:3:18::26) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.24 via Frontend Transport; Fri, 21 Aug 2020 02:24:02 +0000
X-Mailer: git-send-email 2.16.4
X-Originating-IP: [119.31.174.71]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: dd014b29-8588-4208-0644-08d8457945aa
X-MS-TrafficTypeDiagnostic: DB8PR04MB6620:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DB8PR04MB6620F702563B70C535ABCC11885B0@DB8PR04MB6620.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:949;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BYhyDOFg+4Yd6G/iin2cHQX/h7fFtpkz5D9+5CE9npFmZqQQ3/n7Eaz1hU+iiANp/ZZfhKTypcMrTLzaeahxxKWVrS6L0vjDLtRaqIleAmR7tlSUcgo2lAp25tnlIXHtXzqkDSbwIGpVDeOFBW/DdDOx+KoBeAWNJp4z4uKNwuERJmBppDxUFg421W76VSnCIDq9OUPZRSTVPhQV1PM6kLETYEw+1BlNAjf1zU4VcKZNqFdRKomoA4sMEbgBvPXT3Cj50dJiJrZRD+BLx+Tt/QM98YlDMV3MuzV6DrJcIIPaTb0gN1K5w+V6k/z2UozSg0QBjzumiP03PCxlz6u8Og==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0402MB2760.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(346002)(396003)(366004)(376002)(39860400002)(6486002)(6506007)(86362001)(4744005)(26005)(52116002)(36756003)(2906002)(5660300002)(83380400001)(316002)(478600001)(16526019)(4326008)(8936002)(8676002)(9686003)(6512007)(6916009)(66946007)(66476007)(66556008)(186003)(2616005)(956004)(1076003)(6666004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: u5jCdbjJhWHmAqQK/sDBiopiueW72UbahIYhP7Clu8QBxzFAJ7GbXtap8EGE+Muk1Il6t3hRcyl5lOeYAfTUzlBaSTW4PLQxUmA1I4rD+2KzZb0IuUjXE6h2kuTnpkuAjc79QWVeGqHqGgqTPzRh1Wbh2fDBKq3FU8/eslnd7AjfhH1xRJUr+0dkKXmNjcvD2/3Vs2k2DmlIgt9XaHXrVX3VZvTmqpZkSPfv7czP+0PEmbdWuemg0rAcuW/n78LIEtHT6KjgWvA2Fq6o/NoJIfBAd4su+k4ikv0lgrYjY6bXlqZ5fLQQxsnnMh1lH9O//d5k3gxHCZBUZf6cVCGkwY+qZA1h0vD10FL2LHhl1Lq+r2qeOeI+p+JjLkgU//xGS2M/K95oOErMGqxpBXJZ7qvx9wlICAk0cI8xTKmdWIRB2ee6lWKD8+KUY52rOUKdHUGrfWaX6N3boq7PogmWjQzYkzAxu6LY3Vruj53QYr4FK4CRxEJxQnDZUoplotrVOXpBMQNkORQsOuInlERxwfZXhbhrJ2ppHd/6flVAw/WF4V1zUrRcu9yQjHISzTQrkFk0ehTWhLiywafLlfZrUk0U8oW7z2G7RxMBoVYDQXtqBO1DO3uyxef/EdxbkPZITvfU6tzO1/LiTUt+TA8Rqw==
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dd014b29-8588-4208-0644-08d8457945aa
X-MS-Exchange-CrossTenant-AuthSource: DB6PR0402MB2760.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2020 02:24:03.8323
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uJ+KT5EKOYK0jjgs3SBFL1RH8bvE7sBaOC48rtE07a7FF9LXoTkfJpKlY36CB5/C5UnhfD/3UYbt/friqu5kQA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6620
X-Original-Sender: peng.fan@nxp.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@nxp.com header.s=selector2 header.b=SggkR9e4;       arc=pass (i=1
 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass
 fromdomain=nxp.com);       spf=pass (google.com: domain of peng.fan@nxp.com
 designates 40.107.22.54 as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
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

From: Peng Fan <peng.fan@nxp.com>

Add -march=armv7ve to avoid build error
that ".virt extension not supported".

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 inmates/Makefile | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/inmates/Makefile b/inmates/Makefile
index 18a94853..25639922 100644
--- a/inmates/Makefile
+++ b/inmates/Makefile
@@ -35,6 +35,10 @@ KBUILD_CFLAGS := -g -Os -Wall -Wstrict-prototypes -Wtype-limits \
 ifneq ($(wildcard $(INC_CONFIG_H)),)
 KBUILD_CFLAGS += -include $(INC_CONFIG_H)
 endif
+ifeq ($(SRCARCH),arm)
+KBUILD_CFLAGS += -march=armv7ve
+KBUILD_AFLAGS += -march=armv7ve
+endif
 
 OBJCOPYFLAGS := -O binary
 # prior to 4.19
-- 
2.16.4

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20200821024921.3075-5-peng.fan%40nxp.com.
