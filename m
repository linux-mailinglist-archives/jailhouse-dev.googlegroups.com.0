Return-Path: <jailhouse-dev+bncBDAMFR7JZAEBBQXA7T4QKGQEOWYX6GA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x33b.google.com (mail-wm1-x33b.google.com [IPv6:2a00:1450:4864:20::33b])
	by mail.lfdr.de (Postfix) with ESMTPS id 780ED24CAB7
	for <lists+jailhouse-dev@lfdr.de>; Fri, 21 Aug 2020 04:24:03 +0200 (CEST)
Received: by mail-wm1-x33b.google.com with SMTP id u144sf177813wmu.3
        for <lists+jailhouse-dev@lfdr.de>; Thu, 20 Aug 2020 19:24:03 -0700 (PDT)
ARC-Seal: i=3; a=rsa-sha256; t=1597976643; cv=pass;
        d=google.com; s=arc-20160816;
        b=CPLAba1wER5CCbzDAU/ILEdaYTCAgxfLM2Zy9tNBSZ0Q4vgj5OO8G6fZCE7hLUC+wt
         Y+PPDuNj6yo+1dFaoC2mrHh2zelKbOkgzt4ZZMzZc7eJVfWWoUlp5V8REI+ZOtcJlkH2
         qsjcQh7sVhwoUKqVnuzjfk/azTr5zw7VbXWrOT1jdVkA4bDAhXPZjbjSocLsuFGmASSL
         o0k+lkae1+UW3V9Z8AiVgRnMYhGwmGDOMFCPegzkBNItN230gY+UBFHbvhdy9g+jhzgR
         U1k1KmZJLx+3UdtPor+JCPvNiVWADxmmxDz/w54ZdvLuyL1o6e6I7tTWidqjaNxVQUIg
         mitQ==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=j/2DKQbqgenBcAzbnTr2G2zotvvLaTPol+HnJr821do=;
        b=KiCVnkEmWjsha7+vUq/cdKS1rxrk94K0Zez/GCIJuNjm+yHuN8Kc4zLybvE0OPNA+c
         wDXx12sBf3ZRGoMLkZ3YzfiDj845p8vjw7TzDb343uhWgVipMnfrdEsgW314JBL9EVSH
         ICB68h0igdbISea9fOu8X6UuvghxsTyIKyphjKR2iF/royllhlsmxf1PaES9cQGcpTAx
         GVyRzKiKH/rPMhjdw+lQ1fk/K1knelYVZsKdObhEMTtke1zcVI3u5yMUnPtimoDDeNXk
         IU+QUX6wjOaDuOypYarLr+inr6Jq8P7ZY1HLMZbo816tPdz9LrYIN4KRmTeKxXE3p9dN
         kW/A==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=k+85LaeP;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of peng.fan@nxp.com designates 40.107.22.47 as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=j/2DKQbqgenBcAzbnTr2G2zotvvLaTPol+HnJr821do=;
        b=idtMTK5+Q+qJDsVWk45iaFYAllr/V9cHUPQL+0PWK11HnsBK2jZFJi2cBcFcbMaVAI
         66mUqgXNZ02zBb6DxOf3m1iVYvYoWKCqivuuynOtroZDtqduZWojDnTHXBjbwIu/FKf/
         YVO9xE4UJuV7YW+DfWpYCs1Fsp9HcpxS8g/12lqZTBRo5mozzLsRKDHcbLcQXQv5S4lo
         E9LfRIa7PMMCfExqoZQuPCzsZisT/fggpZXDfMG/2Sptt8Wco3fRrvIAHzzLMUIeCe4t
         IQ0U2Vj3yd47s24lb6174+pUhMqjIC2CoOwlLwnj3ACdCl5hbi3DiBn318Pl4ud8QaFM
         xPcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=j/2DKQbqgenBcAzbnTr2G2zotvvLaTPol+HnJr821do=;
        b=YjKu+wao6WsxAwst/UO008VR/DQ3h9bOdxVmAG1YkzzhC4UIFkYH/hPwDUxTL6tRxG
         xZNMmgEBOVM7evILMlMxwNA9MXLw3tCE9v8ON0/dYkscT13o9WZva/j/oKO6AqpSikJA
         DvBN89KA1S6dUhEYtD518NQQf3cHw7CHV5uAJ7JWIR2B91qE7hGhYyIm2NbyQE7oa6dV
         e5rGVEipBX0Pu1v+rVXA9o6eVhuSZTiMsoe1gkbvhob6D7whIqyQLdXjDOGpGy5eNSYb
         wQ01Zyn0f2SV6i5drD0KfVvCwWz9eS3vcc+Afq0+y78UfjCU4+ATeIvJelCRirLLDPIJ
         g60A==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533dAXKRwsKW7TuAqg66J8wOtdCOGygMSeTIoHsxQvmOVXDqUbIl
	i5G2o1f+ZzHtnfBXcRr+Rs8=
X-Google-Smtp-Source: ABdhPJzZZrq/RLzcqJM52XHqsQzeutuA9V+P5metWXCICLO7SUVv7oqfE9/hd68C+iYei3RB1T3GHA==
X-Received: by 2002:a5d:4603:: with SMTP id t3mr559125wrq.175.1597976643220;
        Thu, 20 Aug 2020 19:24:03 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:e78f:: with SMTP id n15ls465344wrm.1.gmail; Thu, 20 Aug
 2020 19:24:02 -0700 (PDT)
X-Received: by 2002:a5d:464e:: with SMTP id j14mr511994wrs.361.1597976642466;
        Thu, 20 Aug 2020 19:24:02 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1597976642; cv=pass;
        d=google.com; s=arc-20160816;
        b=BfmAyDJhjx/Fikb4ROgeFauksdps/0k12uqShyYwwZfK+EXb1r7mGi8T5g/KMIkRhd
         2VvhkgDTX/HUCzgVgGyWXaAtBcSAAMy7ixDdh8qjbN665xODqQpWOvt+SqzM+4y8R8za
         BTgDR8wD159SzBrJrHzzBynRQ35d5tCpChdNCpD7pTYNI/lPPYSAu6gKCYG561UlFmtg
         GoNhID+1tbMJ1dlfKdBbCRRQzWDMTFvp7oEe1A/7gF1yxcSBSQZ2ip0Ty5TfiDzhlIfM
         +hmZG+DKnYfY87Z0P2KgNHxNyNUWKI0JopzGaw1DHeSlEpmQYcQMZ3ATolblBY/+KpIR
         NG0A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=qa7WFYj1N6xq1PefExmbMjp5TrlZFpgQ1j8dMpLgdLA=;
        b=k7o1gTXz4NR/NAKUNNuf4gdNs5Rw7Coc7V82zv6pBdNUP8GDnF23TWr+ZE3f6GpxIA
         EtLNSWhBfm/Edl5LNHyn1GJeO9gXdZMF13BVBiadpaTblWR8kElXwrFLbCMFoSwzDKLK
         MW625prS3fZVHp4fYi+T4bYzhrpgHGGd3KunPBe1UrHkPHSVzLt21pr3cdID7EZC2Vo1
         W1fbnhDfGLss3tQa4FChkjWbXRFPXdDXXiDYXTU06FTDRhaqwihe2OizoEBNyjoYT6Kd
         gILWU42YeA2H83vx5R6HdqT1CUFnyv4gHe5nvBbwjDqgI7N0zWoHEFSnP8dfHO+RMobm
         dXbg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=k+85LaeP;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of peng.fan@nxp.com designates 40.107.22.47 as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2047.outbound.protection.outlook.com. [40.107.22.47])
        by gmr-mx.google.com with ESMTPS id j16si11082wrs.5.2020.08.20.19.24.02
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 20 Aug 2020 19:24:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of peng.fan@nxp.com designates 40.107.22.47 as permitted sender) client-ip=40.107.22.47;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WDA1ReiBnWMd8FeUMqKtz3n51oN6BWaFYS6iYqR7RyfepvysrSjmSkxfhTRWMS/nIWq+RxJ3e0fPkzrE7rThN9ZRKwQ1rjguPMV2WihWY5Iui1bSuah9CwMImpdC9qd5h6xPG391uJ7lNvhQrxQRWWodGmACPHVH0nwiBqNy1scs9wkoT72hFN2QXDkcFRa25NeSWiCasxcG9ZdGWX39orl1tlVp9bR/ksjxaNOxRLCXCkmoZORjcNQLIp1Na9z/cvOrhtNmCQqDwATIsPrB0iJ1bmj8bKOXZYtfKfOP9/R7SLAhQf32sMK5Ar0QsTu+kEDF7+9uaxbMRhxjEdwXyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qa7WFYj1N6xq1PefExmbMjp5TrlZFpgQ1j8dMpLgdLA=;
 b=UNWiA7WidNM5Ae0KFxuas1bQok8YNypdHLZuvgJRyYnhR9foZi04RLuiNdR9lNjt1bj9/GSSgaFSIlqks/f55uA4qKBim3FGYdNuBYVwRUBbuPZfVuXHlzOnajt725IOXwMnqIyCVlmW9TuMoLUB5zcw5s1zNJS3sUUFybT8sfUN+IISnOmjLnvMxjMbstyR4nyJCZZOUlxrCbEdCV2EbStcM+yNcl/tubwxXa6uq8lL8GWxmoZ3CJTwfAMxmur/WXTN9JQaaQoFlaZ5z9Q+tXmqELEDx0G3XRRbBuhnvsH54qshkaH+ks3f72reqZlfA2gR31k217Baf2dYxC85eA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com (2603:10a6:4:a1::14)
 by DB8PR04MB6620.eurprd04.prod.outlook.com (2603:10a6:10:107::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.25; Fri, 21 Aug
 2020 02:24:01 +0000
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::24d0:f783:3c7d:e232]) by DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::24d0:f783:3c7d:e232%12]) with mapi id 15.20.3305.026; Fri, 21 Aug
 2020 02:24:01 +0000
From: peng.fan@nxp.com
To: jan.kiszka@siemens.com
Cc: jailhouse-dev@googlegroups.com,
	alice.guo@nxp.com,
	Peng Fan <peng.fan@nxp.com>
Subject: [PATCH V2 4/5] arm: pass -march=armv7ve to KBUILD_AFLAGS
Date: Fri, 21 Aug 2020 10:49:20 +0800
Message-Id: <20200821024921.3075-4-peng.fan@nxp.com>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20200821024921.3075-1-peng.fan@nxp.com>
References: <20200821024921.3075-1-peng.fan@nxp.com>
Content-Type: text/plain; charset="UTF-8"
X-ClientProxiedBy: SG2PR02CA0038.apcprd02.prod.outlook.com
 (2603:1096:3:18::26) To DB6PR0402MB2760.eurprd04.prod.outlook.com
 (2603:10a6:4:a1::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from linux-1xn6.ap.freescale.net (119.31.174.71) by SG2PR02CA0038.apcprd02.prod.outlook.com (2603:1096:3:18::26) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.24 via Frontend Transport; Fri, 21 Aug 2020 02:23:59 +0000
X-Mailer: git-send-email 2.16.4
X-Originating-IP: [119.31.174.71]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 90a449bb-d9b7-414a-d9d3-08d84579445b
X-MS-TrafficTypeDiagnostic: DB8PR04MB6620:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DB8PR04MB66206CE40B73F84E3DFB8F36885B0@DB8PR04MB6620.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: m74jOLS2WT7uMXygV13RpHNdnCZFDMQPNHErBLcy3VxcS5dDnbCuy+ZUcLG0T826AtJJ2ivnOA3+FZf2S+gPKyUFIvGZSHJYXm3H6iEKSx23C7mHYUikVAys1+hZgSrv6HuxOtcTGtxu+PTi658hCDI+ApKkLCskAdMNXe4yT+JSGPBWRdJTASCgiwte4tXlxF87SifuvRHuqtPz5bGoha9RD0KTjAMmL2wVXz2sVIfXdblcbrY25h3r4CbF8k8aNN2kP4131eSNLWcS4MD8pJnY99kgbSk6kyKjIwCAFA7yK7d5fpLiHm8CH3x0gz619NZu/sxKhwBn/6Oa2A8bXQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0402MB2760.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(346002)(396003)(366004)(376002)(39860400002)(6486002)(6506007)(86362001)(4744005)(26005)(52116002)(36756003)(2906002)(5660300002)(316002)(478600001)(16526019)(4326008)(8936002)(8676002)(9686003)(6512007)(6916009)(66946007)(66476007)(66556008)(186003)(2616005)(956004)(1076003)(6666004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: kQZhHGS5lz9Gr9y/CJh3JROGKfJY6/4a24PuuskPONG/pWTjzmKswJZO9lurG2+eD4U01WJjmji7pWkMZzQ88Oey0bTC/l4DqfuCbTRoCtQag1peg0zCSHyel0I1m8rkg6Cy0FxLA3spdzYhW3zVRNAuj4t5Y2VMf9VBUrqmElsFsrBbj1uUHugpUfM9ExC6HTbT7bsYdZi3AA3hjsSfQ9+ztmOWIR7rNq/VrlznK4/j7CR1HHh7w1yvCPj3mPfTQuwzJcP5oOfkYxAl3+fIsGqDFo38p5LxFB0I/1mrobRe98/eW+kyANjUUdJM03ZYpy+KS7/xH9wKpu+9Ky7WtLixPdpnqLN0PvTqodd64lrSX45A/4ElrAV37B3aq8NzCUUkULDH1YDKk/fAtfByZvomh9L1vcfy2M1ZHfaSaWheuxa1GJ3FG9hXp+ttEOeTseZfQjp9bNg7prsjersZkSC391WYkVtkFGYEsu9DC34jeEQLE+LqVDvQZT6WnJsr8kvlViZhRq58TPtB7GDfQHu2ASdvy3vuTmHsygKlsuJya0ZjJz9B1WIbOQY//A7FuzpHPbr4N+kXyNR+u/itwqYNrKtl3B/HM8vfF1Yyn7CARCC/jt1bu/0MlRApYAfSVa2opsWI8DlGocrXFGXsag==
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 90a449bb-d9b7-414a-d9d3-08d84579445b
X-MS-Exchange-CrossTenant-AuthSource: DB6PR0402MB2760.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2020 02:24:01.6903
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DgRoDzN2YIbpINe3/BH9wiUow71dkKiMtZcuglCaMjDbxia1fBvfecnQvSnZ7tLEepLUGdpa+0JhSbVXtpP40g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6620
X-Original-Sender: peng.fan@nxp.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@nxp.com header.s=selector2 header.b=k+85LaeP;       arc=pass (i=1
 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass
 fromdomain=nxp.com);       spf=pass (google.com: domain of peng.fan@nxp.com
 designates 40.107.22.47 as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
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

Some toolchains might not have this flag default set, so when compiling,
there will be error that "dsb not supported" in cache.S.

So pass the flag to force toolchain use v7.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 hypervisor/arch/arm/Makefile | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hypervisor/arch/arm/Makefile b/hypervisor/arch/arm/Makefile
index a170b593..ad5b2276 100644
--- a/hypervisor/arch/arm/Makefile
+++ b/hypervisor/arch/arm/Makefile
@@ -13,3 +13,4 @@
 LINUXINCLUDE += -I$(src)/arch/arm-common/include
 
 KBUILD_CFLAGS += -marm -march=armv7ve
+KBUILD_AFLAGS += -march=armv7ve
-- 
2.16.4

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20200821024921.3075-4-peng.fan%40nxp.com.
