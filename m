Return-Path: <jailhouse-dev+bncBDAMFR7JZAEBBPXA7T4QKGQEMUBAFNY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x238.google.com (mail-lj1-x238.google.com [IPv6:2a00:1450:4864:20::238])
	by mail.lfdr.de (Postfix) with ESMTPS id B979D24CAB5
	for <lists+jailhouse-dev@lfdr.de>; Fri, 21 Aug 2020 04:23:59 +0200 (CEST)
Received: by mail-lj1-x238.google.com with SMTP id t17sf147096ljg.16
        for <lists+jailhouse-dev@lfdr.de>; Thu, 20 Aug 2020 19:23:59 -0700 (PDT)
ARC-Seal: i=3; a=rsa-sha256; t=1597976639; cv=pass;
        d=google.com; s=arc-20160816;
        b=fluFSVKHd0K1tclfC4+cVAR0udumU+fQzZpWjP8YYuHPT4DlWH2jn4pzFJTCIQukf1
         qnB02BKuJivODEtOw30TEvYhJDBqVJcuW1gmTzTqOFu4RsoM0HP29zV4HdzyRLKS8r55
         Ej405iRJWJ0GCXNGZMl4JPMhVxDSDZbu3jzVWRzqcVmARd9ROVP1Gd75L7RvwXusYmfU
         ke8DprSmgRTbc5+Ob5y/CkA7UX6T2yW4UZq7M+/oi2w7fasrqijpf/qrIy057xJSAJHU
         NOCPyQCqTsr96Lu7wbFMpiF7fqh8MhCo0rrkQx9uyr++kmBYfBxJUBDfXhQ0NIlktouC
         R4fg==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=oUjJNvw7kNogGUoKshWSIoWgwtHnRF5PRcjl19z2zH8=;
        b=s9+Jxv0GLruPQKHaycKAV3QPUzGB/3dB435KHBqQbI8ceLc7qUpanCHucWRlm6Qn7G
         jLUN7+zWkog8eW8aQXEcUK9rLbL6nmcKVp2cfYwHKq/vf7Vr3XJ/PIyqE7eKsTXg3ljs
         Yx0tDwLHRD68DGhPfcU3ItPU4HWJki9nF5cPOzYRkQzI0lhAEJSkbw+YVmfUheP5Zcle
         /Tidqx/FAp16lhmf6fy6nciq/s/YiEqFCS7YZe4eHBySv70BG2WaQpd1VqCn2OhQLgeF
         l0v1N1ifLwBw0lGrjZpUH5XsWFsXwtYjozcwr/ZAPwtAQFF+j2deXYpHmnAfivAGlaF2
         3/Bw==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=JatsNT2D;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of peng.fan@nxp.com designates 40.107.22.40 as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=oUjJNvw7kNogGUoKshWSIoWgwtHnRF5PRcjl19z2zH8=;
        b=cac4WxBm6AU7J0xk3ef9tU3en4ThqownB9+8aD5YN5zM7Qe9RKu51z6Z4623h1pqdy
         pB2G7v/sZm7BHXsyrPKg2/5hWu5SGkZC1TecxuGT/8hEk1Fh365phnKyJBF9EidCqxqR
         XHn/7yYPIRLx62iab2A2QDRbKVfyHsXzWkGB1MM67M1BKuaUrosJ+VxSQlJVDC3wdd68
         J2ie/QSZyrD2XH4xzakydwGj2vpLA2rJ7JMVCxXVt7iEwCOL5es2hiCYPaNcDkpCOmS7
         9bTyHFov15XQMSNhqMy4EpWzxS0lahCfu140XO1cyoCn28tbFJ+xo4iJdXF5c2F6pdBk
         0lZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=oUjJNvw7kNogGUoKshWSIoWgwtHnRF5PRcjl19z2zH8=;
        b=I30HzqzKI9u2Y7cW7Kcsl/sXPTlBwYdlEEF6J65OSFq6uwmnM+f99HhqFvv+dQG1Wx
         M2x75txr780j/TLe12Q0uFIdNGJDSXQ3RKyfEELSjgpNrYmQbJRvF/klZ/Um18lIJjOK
         wED53A6JEMzXTEkeaBVgJlTUJnF3u8iWtRKQVnjEQKtFxg7C+70Axe6pMYhnE84o7B7r
         0/7BnLWm3ecyCP8aIpgOnSQtwhlNotiof/9djsVw2+O9Q3CTaUVBrn3kWirIIL+j/zcY
         2tqeNbVkb+PTWZUQky4hpe+NAll63a5hhoKctC2vFYsvrm89pVmCfA97Qt4XqzLVAIlG
         uHAg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM5309nXju40KHxZp2OJ4MNk0YxWGsiQZy6zc3Vpg67DCCslAQ2NTv
	iQAFBDCIvGOij5fcqdl8QTU=
X-Google-Smtp-Source: ABdhPJxBJYrHwHASsl4zr/Xmjxq66rxacABHA1O3LFWehGarB0eShbtbEdYomX9glC3dIDXFq40qFg==
X-Received: by 2002:a2e:86da:: with SMTP id n26mr396248ljj.311.1597976639209;
        Thu, 20 Aug 2020 19:23:59 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:ac2:5e33:: with SMTP id o19ls63185lfg.1.gmail; Thu, 20 Aug
 2020 19:23:58 -0700 (PDT)
X-Received: by 2002:a19:bc1:: with SMTP id 184mr306286lfl.179.1597976638473;
        Thu, 20 Aug 2020 19:23:58 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1597976638; cv=pass;
        d=google.com; s=arc-20160816;
        b=glLPeBYb37mu/ri7yMSwY7VfZoxL+t1G6Mq250BzHKRpSXzZq6keKlt7FhUl3SxHX6
         w8j0NsnuqZI2Ex4nRbSmHf0uGyv6KWJzKVWy3MmY1WpMXF6YwnDhPdLCsRmPY6Gj7dDL
         +3jifgHdwhLwF+Cx9gOepofpZ7z3zKx+/exLXHDAXusUcVjK8MLm1fZGzRQG+CKdd221
         PE9ukRSBygtCWVknbOFh5oOrYljh7qLV6vjxTkcYK0aAAV7jA014cJbYWqdnAJ2jmYRe
         pn9t4IPb0rm4bE8JAXFVeqabdV3uYbASZtZunxZhjqRFDaftsIHCZJb4fCj4leU5NCB5
         W7Ww==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=BXV8sW4vw/ZBqa7PbIHidOtCxg0qrF24qcFWkZAcwZc=;
        b=VR3eF9kRGSpoRgXDMZ9gJa9aGgCP2TDYYqQ4OIwClN1iFaa2jBnDSNSS0ZPERvE5hu
         4bT/mxhpiVr92alsXkXv68WsuV5aUzVcysz/hzCETWWn6hQSl6WYR9JZZU9U6TUqNn7y
         to34VqLeONqtMfMvGn0IY2/jwPYMhuaxaO0lyy7s7ItVd3G5w3NDPZj36Poc6+alDJQq
         AhXQ6d4NIFlcDJmoxAKf//ef84B5bPhi/nAtk+W3UCb+BioCwkphKlA4CL2PfkgTBckL
         HNlZXoKvD8klTiuUvhjpGQhF1JJyUv4ZvE7sC2bDRanifBtNLHnJ0bae5FHVb7BiJNNK
         iDQw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=JatsNT2D;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of peng.fan@nxp.com designates 40.107.22.40 as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2040.outbound.protection.outlook.com. [40.107.22.40])
        by gmr-mx.google.com with ESMTPS id u9si18457ljg.8.2020.08.20.19.23.58
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 20 Aug 2020 19:23:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of peng.fan@nxp.com designates 40.107.22.40 as permitted sender) client-ip=40.107.22.40;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DfLeEd9fIkRzjNxkhvMUTeciYcR+8UV6dFCHNUM6FufjJuT9HAZn5q2AKbbwk3AT6CRmbsITew0KwecwifOphKH+Ixa+scgqn3+nuSiW1w6NMkM3D444+r1TEEzdtEhfqQaistYY7rD55KMO9MdUAM2jOHZW7ojAuttqMYTQ0RknAS9qqdJa5Fz7wpFGHudgOz0ngc899g6L7TtQACTcwmJlvwAJNkeWgkgm2w2TnBtTwoMu+9iSk1W8czPFFWTehe5HxzkDQ+flTBLNP8Zx7q8Rk5LBy/OhR9gArjy3LbbaABEMYc6WJCkcuEeccOFNqMJV/eEhiITbnnKGEYKmfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BXV8sW4vw/ZBqa7PbIHidOtCxg0qrF24qcFWkZAcwZc=;
 b=ZXeBN8MrxbksxVs0AvkjdXMqVqPsPMYuLlYpIn+3H+f+7CQrt4nt4Db0fO3n9qTN7q4W1NGUjPkZh4ot1E2qI0qMLyqqwphYcnM6xrrP8+YI0XpswWfzR41SRrpo9I0szs3okXIeHEyr89OiqdJEg4HxqAV5GistARSPkneSjmzO0C5PyIHuOaqkhN8mvcAfuvq3M/0AapKHyuKVaxY/mNlTIGnmGH2kQ3Vi6E6HwwfmGq8tbbXNYfZ7+N+PF1rrixzZb6woD20CLRJbZG1VbJxGJp94GccE8KqrSx5S7CEabwdVb4/L4VvR0f+C5PRBCYJH7KJFUcirR8Vvsv2epA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com (2603:10a6:4:a1::14)
 by DB8PR04MB6620.eurprd04.prod.outlook.com (2603:10a6:10:107::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.25; Fri, 21 Aug
 2020 02:23:57 +0000
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::24d0:f783:3c7d:e232]) by DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::24d0:f783:3c7d:e232%12]) with mapi id 15.20.3305.026; Fri, 21 Aug
 2020 02:23:57 +0000
From: peng.fan@nxp.com
To: jan.kiszka@siemens.com
Cc: jailhouse-dev@googlegroups.com,
	alice.guo@nxp.com,
	Peng Fan <peng.fan@nxp.com>
Subject: [PATCH V2 2/5] arm64: Do not use FPU registers in jailhouse
Date: Fri, 21 Aug 2020 10:49:18 +0800
Message-Id: <20200821024921.3075-2-peng.fan@nxp.com>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20200821024921.3075-1-peng.fan@nxp.com>
References: <20200821024921.3075-1-peng.fan@nxp.com>
Content-Type: text/plain; charset="UTF-8"
X-ClientProxiedBy: SG2PR02CA0038.apcprd02.prod.outlook.com
 (2603:1096:3:18::26) To DB6PR0402MB2760.eurprd04.prod.outlook.com
 (2603:10a6:4:a1::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from linux-1xn6.ap.freescale.net (119.31.174.71) by SG2PR02CA0038.apcprd02.prod.outlook.com (2603:1096:3:18::26) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.24 via Frontend Transport; Fri, 21 Aug 2020 02:23:55 +0000
X-Mailer: git-send-email 2.16.4
X-Originating-IP: [119.31.174.71]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 90a957ae-0569-4e3c-e3c6-08d8457941d9
X-MS-TrafficTypeDiagnostic: DB8PR04MB6620:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DB8PR04MB6620B2F0F0BA3D02E20ADCAA885B0@DB8PR04MB6620.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4714;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kQ0gM1sN+XG5pmEWRWGDyX1YBGGyd00AVX2J3KkYFV7FM7UjlvXJZTQ3bKxdRCtFQrjI4eaInU9CHXU2sFrrdtKrhyb5tsTvXlv7jzGz42KeS3BVlkHsQcAK9/l83G8zbieBmS5w5EE+3BS09i+wilbVZE5bp8zo0rq+iq2YJA6Wr9TA10vAeBDznri0fUdJYqxc9WTKuWpU2kCfYkRnuHWcQ3acKRaZDs/HOPK2W7Xg82rMPb/99dmwgprSufrN0WyPO1cG055B8MmCjYwP1Bt/Ias/eJ7p1h0nkj942rhX0iJNM77eHQ55lA4HaI3XiishBQS0h/TVj0KJE2v9yA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0402MB2760.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(346002)(396003)(366004)(376002)(39860400002)(6486002)(6506007)(86362001)(4744005)(26005)(52116002)(36756003)(2906002)(5660300002)(316002)(478600001)(16526019)(4326008)(8936002)(8676002)(9686003)(6512007)(6916009)(66946007)(66476007)(66556008)(186003)(2616005)(956004)(1076003)(6666004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: rXnwu7PzqDweVcxilX42ajHedgJluT4AWJcAibaLfKR9CVQaI5vnvfghENCywQEvfaBLxTQ1jUDp32jg1JIa5RtpUBFwqI51pjMyhD/+Vorh4tjlAcEUjtzxMIeCsG2y9wJOwnD6WAPF1MT/mBqcK84aXpRSkiYMbZY+euC3ycCmPnkM+vSITV8RyQgxXHATFtU0fnf8BoKJahLOQb9MJ1W6669FyfHMkk5IHyKG5ZdkrHHkf83xpmZVnmrHfiAobbDT1VzokSsSiizTk7VW+QH6zQDpaOA45BmaQA7QOFvgp2YL2p7yls78QhSOaOjhLB39se+uR9Yug2qI3sjQDjj3UFoC8B7/sQo5sbC/AxksBUJ2Nojvs7MNtlDjNZhlNcBykByCjMwgXyU/W9gVgbFpVwt6FfIBC3UITbdQWdcC3kJGlHU2p5uxFZGT/OSYHLr88Ey+GglrJTnTcB2sBGRzd2nfNGJg/n6iz02vqvI1l3l/BAJypMcq0n9362/l2lAxkrhYm8keUiB5rv4Y0ia7QtfDUOAq7xmOk1DdFkHLE6X/DafTD/01mlP+GxQxFIvaPHfObx5YYn+1a9Hnk7MSEqrh3q34+XcPrCuMKFEWS3U1HYY8ZEUfFbPrdDlZO4S7EAhA9SeEJW2FI2l3eg==
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 90a957ae-0569-4e3c-e3c6-08d8457941d9
X-MS-Exchange-CrossTenant-AuthSource: DB6PR0402MB2760.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2020 02:23:57.4641
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rdM/MhLGz6G1lNHV8KYsPV2uYUn0QpP9E3DwFI4zRPjCPBbJW1HySaM8GzDItjAXesVkVbbp7++84By7d7LFeQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6620
X-Original-Sender: peng.fan@nxp.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@nxp.com header.s=selector2 header.b=JatsNT2D;       arc=pass (i=1
 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass
 fromdomain=nxp.com);       spf=pass (google.com: domain of peng.fan@nxp.com
 designates 40.107.22.40 as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
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

Some compilers default use hardfloat to generate instructions,
so it will use some FPU/NEON registers to do some optimization.

However some inmates might use FPU/NEON registers do some
calculation such as vector/audio and etc. So we need to disable
jailhouse use these registers. Use `-march=armv8-a+nofp` for this.

Reported-by: Michal Hanak <michal.hanak@nxp.com>
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---

V2:
 Subject Change

 hypervisor/arch/arm64/Makefile | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/hypervisor/arch/arm64/Makefile b/hypervisor/arch/arm64/Makefile
index 1eb961d2..0718994d 100644
--- a/hypervisor/arch/arm64/Makefile
+++ b/hypervisor/arch/arm64/Makefile
@@ -11,3 +11,5 @@
 #
 
 LINUXINCLUDE += -I$(src)/arch/arm-common/include
+
+KBUILD_CFLAGS += -march=armv8-a+nofp
-- 
2.16.4

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20200821024921.3075-2-peng.fan%40nxp.com.
