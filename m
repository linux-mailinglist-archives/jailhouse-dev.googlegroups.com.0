Return-Path: <jailhouse-dev+bncBDAMFR7JZAEBBXUK7H4QKGQE2RLCKQA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43e.google.com (mail-wr1-x43e.google.com [IPv6:2a00:1450:4864:20::43e])
	by mail.lfdr.de (Postfix) with ESMTPS id D15B624B322
	for <lists+jailhouse-dev@lfdr.de>; Thu, 20 Aug 2020 11:41:50 +0200 (CEST)
Received: by mail-wr1-x43e.google.com with SMTP id z12sf455726wrl.16
        for <lists+jailhouse-dev@lfdr.de>; Thu, 20 Aug 2020 02:41:50 -0700 (PDT)
ARC-Seal: i=3; a=rsa-sha256; t=1597916510; cv=pass;
        d=google.com; s=arc-20160816;
        b=V3CA5ybDD4emEfZsdL8lu6Alg52R+utt/CSuJ8h3YpfljLIRHBCRbBz5GyDAkdMdQf
         +1Pl0btaSyBU5x5GydaU2B9F2rQvppHfRiX0ID8wyG80GohVJ8h3kK8dSy6ayTXRbuSG
         Ui6C3Vd0iP1vGE9ov1CtcjVk771SyzXQ5tV+TyVLS+T4yRO5PmxvZGJ+gQh3GDem0YIp
         3Pjlqp+o6uqLWjKts+cOWjPt+hmEwq1zrYDKQD3VWgamkTGzo0U4oStM5LziNyaihL48
         AwEEvrtpsRpA0LZyS7leTXN4RoVVV02DQ8slBiae8bP8JT2ehc/h+F7ro6ldQJnmOJvA
         3xBw==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=ak5Lo0oQ6vIglDatRxqW4RIvA+lxh6vsEufg11//ghE=;
        b=eW8coKersiE2TtBRf2cVGJUDWvIIgsooTTkx/vR1DpCNFoe+A5IcLM7VnWFbrPUrF1
         0v3B05I05lVWLnxpwW7XXDRYa/aTBX02U8Pk5i7JZiwmFvIHMjUa958bFK8QOqsXg9mG
         koN4F++TR06Y3O3PYBRpgVbD+WDgbvE4zbqu1l1f+aq131PIYuMp3POmwNchltPqbm0r
         bZwc2Y/YvOYPNx8EXAA2r9UGlgDrxqIHPokWTTNGe9bmGUnONPXqrzbqmkXZRduOmRPG
         qcuRWnDryhKfeT+WLp3YYUE1J/fIFrsZFVYCGH5AYoNB/oyFd4uuuHfTEaEQ0Se7SUFu
         NC+g==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=pWDpdWHh;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of peng.fan@nxp.com designates 40.107.13.41 as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=ak5Lo0oQ6vIglDatRxqW4RIvA+lxh6vsEufg11//ghE=;
        b=sjS9tyAO3/KFa0B8+t6ohGQ/63IZ8NI8V0b9zPhpDmdMNQP4tobIZYVwQF1h3nwo8e
         qMxgdbZlI3PX2CXEmm0lHA8AnjfDkoJIsrE0/0v3sxX8Ef9COGq48+WeW2vUAvU7dp9r
         9qH1c8PSWVRZmEE+NSkkz/lq+2YCkGCvV8zTBOs7gVgzezHcz4uEFP1bl5iF81LOY1rI
         TdJMJzE+oIQe68TykXMn0S8b6dAk5HRRE5e7J205n5YwS158zvSe+XlJWgPsrn4QZ+xZ
         eUWZJ09HwWaG5c2Z0wFplNlXvTOl8WhpSyVzxtyzmieYSOWcIz9BCOiU0BrOJqieRfyw
         FFeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=ak5Lo0oQ6vIglDatRxqW4RIvA+lxh6vsEufg11//ghE=;
        b=Vr7V0eIZ1IQyFGWstot00tYHerk0f2monbqa+ymnqgMIQeth9v8LFOduOeTSJ+DtML
         p9kWr08L9iuxuCVOBZD2OvJIhFrhrGHLL2kk0Jjejw7WbjDn9/0EtWN+OJ6ICMl4RBz3
         eOGW3XgX7WkHHg8V/QDM9m2OOzr2brZGjNkcdowpXi/pb2keeTNJFpptYBtXWbkmXXun
         a9smkBgM7TW+Iyjou8Dx4zuykBRzejgRkIHHdiiLWsv4Bbwr7Xici8FZ6y+OByBYQX9k
         zqe2Z6YASmI/x9duu5WFX0xBVIgWS+xasDaYDdOFNmhdmIQrB5IVU4N5V6rXXb7xm7BI
         Kp7g==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532/rqhFb+LPkAY4rdqqBfpOCaJn1D27YkG2YT4VbQUJOvzbQ4BM
	Ek0blvR2Hm+jZNcBkJxoV7g=
X-Google-Smtp-Source: ABdhPJxOL9fmDOalyTVoGMbYmEY6LqIShCaNY3d1W6Iaucfb78WYe6LsdleXkvzyrFjCS4Hom1kgZA==
X-Received: by 2002:adf:c7ca:: with SMTP id y10mr2451735wrg.255.1597916510546;
        Thu, 20 Aug 2020 02:41:50 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a1c:a587:: with SMTP id o129ls674574wme.2.canary-gmail; Thu,
 20 Aug 2020 02:41:49 -0700 (PDT)
X-Received: by 2002:a1c:6a03:: with SMTP id f3mr2721906wmc.181.1597916509655;
        Thu, 20 Aug 2020 02:41:49 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1597916509; cv=pass;
        d=google.com; s=arc-20160816;
        b=nlaWQra8L/H7Lr6MCY5G1ZNPMC1FvwnZEL9BzqfIJwD9qNSNjgKT8u3qFhb+xVsZu2
         bo+QHZJE9g9BJfMRewx6A5Ci0nTHa7m8HXOmPzmw/4rHAnS32hYpvt4OwwjhKvpxWhca
         bhSTnwX17ygNDCSia2EnHi3XTuFMfH1iCY14EpzOTyi2ojMuwKgZ5LusbYcWCmlERp7d
         /62L1uf72Dzvwvm0Y6hE4s0ez//jz4p64rwGu7VK1v9P9l4CoCIXXpPioqKfyl47ghzi
         +VyRhydwL7K13zT8J7smTg19BmsqwVWlwk3LVeMFi827q9G0KPGTXweXRR3BwSBT0byh
         lxLA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=1hsKECVLNJ/DSIrqvUPPGQnxhV6ucAABLasYNRVS5o4=;
        b=SDOQ9/PnCPgrXDudS3go7fu1y/hoYlv3lb04KrR5JEOrwskLUds/kwOlLdsrfszUMZ
         Cs6fMkotPVZulhbzaXyg4vSwaDHVgknnH0PvnRUAMr2lwYvFmGc/ePBzesHBL+q1X6Mr
         hkH5JYycRF3+xkt65/5f/vEdCc18pY1EXIua+/jPYjjhh7+pbzToLVMhRCeVZdBdpSHJ
         Mv6n+BXyKdyOA8VOx6xARgnJSAyKrTykt8RS5Y2S5+mtVOZuWdK+4GUvjMcHgOin9V4L
         gOc7mDUh6WjwXoA8UeYdGC5YKcP063YmxBWRcKbVHFax1zYmnOAa9yTc08DOQzo48f47
         4BWQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=pWDpdWHh;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of peng.fan@nxp.com designates 40.107.13.41 as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
Received: from EUR01-HE1-obe.outbound.protection.outlook.com (mail-eopbgr130041.outbound.protection.outlook.com. [40.107.13.41])
        by gmr-mx.google.com with ESMTPS id m3si59191wme.0.2020.08.20.02.41.49
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 20 Aug 2020 02:41:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of peng.fan@nxp.com designates 40.107.13.41 as permitted sender) client-ip=40.107.13.41;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DLlsq8hTV4EhUbl957c5EtFBsbb3mUVFKsyW2C/sAiqglIjjMHdSFIQgK/aNpWsjsbCSECK+Da0K/YGsa9DhY0zWErQot4BKW0RUSzByqD96FHk8Xuy3E9IcsqEDK/lhaK7XkmLYW8H8q+6qJOBkJOqr6AJz+I5jynrRG5VufRLJOlPMTw0QZdrRJ+k6f3g4eebucZfh3IaBEWglGNoC3Wbq+mBKyNs0MzXzmTAaT3c/a6UJk+sxizV4TRhbctrKMuqdrEFZxzrL71gH112k4mgPoISspOAS8aVieo4sPBitvEqb6JuNIuXP4IP8qhQY+xiU8OB1u3lLZSOxGpxkyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1hsKECVLNJ/DSIrqvUPPGQnxhV6ucAABLasYNRVS5o4=;
 b=mY/qPsxMmwT+1tSavX+g/XUgdMRJoLLUPj6wj89+Q98MjXmBGCeMm3+1xodVtR73/WLdmyknpZrqv+abCWJhg60gAU3BydhWj9DG7oOsbMTGiMm5+LJssoDzfdFtKDV8XjmYjhlkAV9ibi9PJdWO8Rt1YE2p6ObspIZyTPsGfSh1De1V9D9n7p6bCAqnvi2H+4Q90ZPdMX8Y1m90fbCOcmg5d1H/PSHVS913Ec/DFs3/iE6riRh4e4itzByOdcIM2aCUsWUGE4ow+KcNx7YiATe7/GCSUAhHfjLITt4Yw5ndLRVaq2fBHtnY96fJpaCSJMrIhyeCPYHqiiwxdRIUrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com (2603:10a6:4:a1::14)
 by DB3PR0402MB3660.eurprd04.prod.outlook.com (2603:10a6:8:c::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3283.23; Thu, 20 Aug
 2020 09:41:48 +0000
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::24d0:f783:3c7d:e232]) by DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::24d0:f783:3c7d:e232%12]) with mapi id 15.20.3283.027; Thu, 20 Aug
 2020 09:41:48 +0000
From: peng.fan@nxp.com
To: jan.kiszka@siemens.com
Cc: jailhouse-dev@googlegroups.com,
	alice.guo@nxp.com,
	Peng Fan <peng.fan@nxp.com>
Subject: [PATCH 5/5] inmates: Makefile: add -march=armv7ve
Date: Thu, 20 Aug 2020 18:07:07 +0800
Message-Id: <20200820100707.20013-5-peng.fan@nxp.com>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20200820100707.20013-1-peng.fan@nxp.com>
References: <20200820100707.20013-1-peng.fan@nxp.com>
Content-Type: text/plain; charset="UTF-8"
X-ClientProxiedBy: SG2PR02CA0073.apcprd02.prod.outlook.com
 (2603:1096:4:90::13) To DB6PR0402MB2760.eurprd04.prod.outlook.com
 (2603:10a6:4:a1::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from linux-1xn6.ap.freescale.net (119.31.174.71) by SG2PR02CA0073.apcprd02.prod.outlook.com (2603:1096:4:90::13) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.24 via Frontend Transport; Thu, 20 Aug 2020 09:41:46 +0000
X-Mailer: git-send-email 2.16.4
X-Originating-IP: [119.31.174.71]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: b028a489-105d-4482-4f1e-08d844ed4221
X-MS-TrafficTypeDiagnostic: DB3PR0402MB3660:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DB3PR0402MB366082285497F7C67A560209885A0@DB3PR0402MB3660.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:949;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mEJ5ly8tduCESVpjL4U0T2eMwhwCl13sFpjoxr/HZLUkdmZfqVAXZ4Ha8d9T0CsEmUQTzK1rY0QJPCT4NO8heL7DUXrZOHQfPHz/nXqQVAeZIyyM4F49S1F/3lJFuk/OuFddqNx3gky2wiHNgJ2Q9hfYtcdhLUxTNiLi9JLiB5mX0YZyGIoU07n3sLbHmW8elNg1bNdhQXRLebJn1Di5OcuQfOJzpmS0JgH6k3k7ivd7P/mmm0bhztqWTCRp6+KeWhzDv1DXD6TffA9xQ0Pqffgtt+TIHqCle/HF8nfmDXe+M+y2f5Z7uFcJ0IHFGp/XJwJkBm1mH2Rdc6dkEuNpWw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0402MB2760.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(136003)(346002)(366004)(396003)(376002)(6916009)(66946007)(9686003)(6506007)(83380400001)(66476007)(52116002)(186003)(8676002)(66556008)(6512007)(8936002)(6666004)(16526019)(4326008)(36756003)(316002)(5660300002)(2906002)(956004)(478600001)(6486002)(86362001)(1076003)(26005)(4744005)(2616005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: RtLjKgPzU2VCf7srG3y/vDDvq0NBmlBoWxYPgGG2bzGmc3fMC58H9s5i/VvJSJcnAZEX0pss4A4VeRZeSDAsW7yfDU9nHxERfEfeRuyBh06Lny4AufecNntABmohWVyCZ98yr3VrBbjrh5A7Rwy3LJcCZV06DLNa+P+3oGin9dzEUrfyqhZWS2H+U3wk4o+HDzVZYV5cM3YNJtWBi05l1udri+s6C2BZB31TYUKbzyDOeMbGVNZi31iTRahvVa8EQCaan450ciFEk4sFq4CyYx83+f+f2FRrygysP7fmSlv4EO6TXtrsqVLSDbkhdNjoC7fWb3b+DmEztc51+HpwUv2R7wx9/j0yAWmJQFutl1ACz8huddathEa9b94hfVzgMfThtgoqJ9xsDjVIYZVT8vO4PLZvMCJHH9PwDnA+tZnvpg+REsmG3WLpkYmvDRZUVx43InoW7M7T8TxCaS0DzrKA8UmUOt+U0AHyLbqOARWLY4PqUDDzFLTEoASzjMFFJpQqtp5KNWsFmq2vM+PbOvQFulZdA7oSnQ7dIjrgcXwtn86YD4CNEmOTz5w1zZlGUFqQW3fvWwU8hGSn8v4WSqlreS/bdvLaokxdJ4k6sBh7H0hn9znLeylIEquWRm05E6r96XS7hTQ+keT//i+Q5g==
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b028a489-105d-4482-4f1e-08d844ed4221
X-MS-Exchange-CrossTenant-AuthSource: DB6PR0402MB2760.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2020 09:41:48.4430
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BI91763tSNk4P/tMdykbeFPJKLySHEzxslwuyNFVvKdKW+dGPLDM+aCXZ3jmPR/lkplubZ0ntSbfzr/RQT5FPw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR0402MB3660
X-Original-Sender: peng.fan@nxp.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@nxp.com header.s=selector2 header.b=pWDpdWHh;       arc=pass (i=1
 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass
 fromdomain=nxp.com);       spf=pass (google.com: domain of peng.fan@nxp.com
 designates 40.107.13.41 as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
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
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20200820100707.20013-5-peng.fan%40nxp.com.
