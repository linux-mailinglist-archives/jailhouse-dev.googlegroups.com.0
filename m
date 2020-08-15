Return-Path: <jailhouse-dev+bncBDEN32754MOBBTP73H4QKGQEIFHSAAY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x539.google.com (mail-ed1-x539.google.com [IPv6:2a00:1450:4864:20::539])
	by mail.lfdr.de (Postfix) with ESMTPS id 0643E2449A2
	for <lists+jailhouse-dev@lfdr.de>; Fri, 14 Aug 2020 14:13:02 +0200 (CEST)
Received: by mail-ed1-x539.google.com with SMTP id j14sf3192451edk.1
        for <lists+jailhouse-dev@lfdr.de>; Fri, 14 Aug 2020 05:13:02 -0700 (PDT)
ARC-Seal: i=3; a=rsa-sha256; t=1597407181; cv=pass;
        d=google.com; s=arc-20160816;
        b=xyR4Bj7Icfd1OLYr/afjkNGNVIsU0mEZ6NvIjAKwPPi2lVWw35XiJB6QylHEv3W/R6
         3cigW9Mybw/1WA70RWIh1fQNMFTSnKSJdjB3DGDxPUUlLa3ev8bxef6g5jFsdvmjjFoD
         InBIrl0HmErCpLACj24mehkDmsaCPXsCmHNoZ9eKLVCJF3v9cycF5bM52Eh9Cus+B/wT
         OXszVnIHif6rxSctF+eoJajqncg9mzUg/IF+/TLEtuibZRUguqTW6KrpLQJR5ZGJJwCm
         UUciH5786xgRIjaKKYF7ZGG7t5H7Cjx1fauVzTtKggnepWm+gBFvKik4FntAIxwRHh0s
         fujw==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=UAVKcVk9ea+yBKCJQGPAMSL7+MnxOEOpPvBqCak10VU=;
        b=uNSt47Gu83EeNbf3Gu44lrWtGaap2VZDkDxhHMYfcjeXeZaEn30rUHxHll36BeJepT
         XE7TXJMUKOVcWbiY6iYWCW5NY2tRJ9A2I+bE9M/4l+LcRLj/A2xqBBTNiiey9KRBovcJ
         V2RTyOB1oCUue/YGPCOP7n3merLwP4cwSwAo3SrZYiTLFI2nlMefV0A3zAgYoE08v/ZP
         of4JpyAI+VAbWt4lFSpgo5k7zQyzQZviYBmIfLvknkvga88EPhuyAvbDCY9vVtcibd+T
         ejVu5cQCwb6GE8cpP8IzlvurY6douWq5YtuWJ8CWE/fTOK6gCfxLb++EBiwvCCcvQMOZ
         H7AQ==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=MmVMJgeG;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of alice.guo@nxp.com designates 40.107.8.78 as permitted sender) smtp.mailfrom=alice.guo@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=UAVKcVk9ea+yBKCJQGPAMSL7+MnxOEOpPvBqCak10VU=;
        b=bRB7YjQn7l7nYpgrsYSBGYT67dk8Z3OqDrQVgYU7/arSd8jRrq0U4jFhHLvQtWAa5Q
         7Lrjp93mrzdn7Fary+QNH0oMCt664spLPaKcZN4PFf01EBi6GO/kVm92N5xTSjnf7d6U
         LQnlFtY7Ym8dYDsvZAOuFGDCzd6L0StSP0jo9Mwvh6TjIcHRKCcrcx1s5Wnv7K2L/u57
         xta3zw1i7C1w8F3WYLBaHR5FJyh/oYedd7+eQCraJZkb3/uiylUa3H63bOK2neX3Ja9d
         EbOt0xNzjCSOqftbeu3toZMgmGwrkMKdVladoxGtBCNRIlU6lXaedAomTulSsHyq35uK
         vRpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=UAVKcVk9ea+yBKCJQGPAMSL7+MnxOEOpPvBqCak10VU=;
        b=Ld2mRtEur+/4T1/q7khAY2Gn7NZmvUviZS7MjA98AWCKqclbVUg5APhjvpdcDxLndl
         VQlmDzpPau1zr+f+EqT+4BWo8zNNt99pGAjzZAPdRJfXAbwzVUDkX7mKBtiVKViWEV3L
         fp9lsFH4U+SwaxbpfCtNvU4Kq0sKc+oIAPI8M+OZ3xe5hfSRtWzn3AxnaVMhH4auNnLE
         LVxCXnepMxv0BvgfwFPtfdF16B+8QZdoW94eU2Lu3dwlVHa3ZH9/jDYquUj15LtQiEsy
         4qfQr6zWb3WbfrxLIeMpwqlXft9Hqb37fZRIyj4pDB+jL3hK+MD8xqe5EevgsuG2C+Rs
         DVYw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530w1tcH2lsccikUi24f5W0f2xVc82YyKiSbPe6YOvy7biOOnRUx
	dikk5P/srzqsmH/XmxGcZoI=
X-Google-Smtp-Source: ABdhPJyVt5/J8UBMQdvP6sI55ueIkyHATymiDxIA4P3mvJh3CmzTqVYgBMkdc7cBuy+1Ijv2LSUgYQ==
X-Received: by 2002:aa7:cdc4:: with SMTP id h4mr1856020edw.252.1597407181745;
        Fri, 14 Aug 2020 05:13:01 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:906:cb95:: with SMTP id mf21ls4210458ejb.9.gmail; Fri,
 14 Aug 2020 05:13:01 -0700 (PDT)
X-Received: by 2002:a17:906:b5a:: with SMTP id v26mr2197912ejg.515.1597407181046;
        Fri, 14 Aug 2020 05:13:01 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1597407181; cv=pass;
        d=google.com; s=arc-20160816;
        b=fWZ3zwxGgiAK8HQuIOFrWE3O19EaAMTzCIzeXx+CT+yRgwatgHlE+XUATAg+vl+Czt
         rUIBGp6FfFZOudbDdAdfqQ/a1SCXFKwNVPD3rltyfIM11CyAajHk3stvnPs46xTTOc9Z
         soWLtqi6g6LBcit608rKG99j8I/KtSwmxPkPU3HMPM+OpqG1M6RrfFRAVJENQjwocdlZ
         Cl4p+ap0ouA/6ctP4T7EVZHK8LsDwvTF9Fk4S9XDgDul/Fv1BrGgN3J9g7pa/WkrviiN
         +utfiVK3j01wrNUJrA0PGWmHShgOXsg9P3bxBTZjkiVI8ZLZhGOzaD6DUWOuVuZaVjGG
         Prsw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=txlc9z2U8vkQI1iMxQZC4rOPquPe2njAGAZb783fN7c=;
        b=Rt43plVOgzrr2Prwtt0mCoKFrd7/8NNCsEcjjCuqnhbV4BVZ4WPskOSJj3LCSTy+jI
         hM5cHdGCz3bFBmdijfLg1XmAurQ2DyR/iVHv7cxR9WcWFE0FTwz/DP0SKSkW3utgQ551
         kK4D1sPdMY3pM9MxiHdM8pNH92QitMMyETZFyNnjni6+/hbBzdlJflOWWUAdKJOYkkQc
         jFcVF59l7c0tkbpzBr4CF/JJjYin6DeIGjVoIg2u3JXcWH6VmDhj06rwCvVMLJEPZoV3
         3ABAvSxufSfAHVJKwuRkLL43ICmLPni/Xi13UzpSFeMYM0JqVfoZv6lzOb9CSxXY8woN
         pRmQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=MmVMJgeG;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of alice.guo@nxp.com designates 40.107.8.78 as permitted sender) smtp.mailfrom=alice.guo@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (mail-eopbgr80078.outbound.protection.outlook.com. [40.107.8.78])
        by gmr-mx.google.com with ESMTPS id h10si455427edn.2.2020.08.14.05.13.00
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 14 Aug 2020 05:13:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of alice.guo@nxp.com designates 40.107.8.78 as permitted sender) client-ip=40.107.8.78;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QUOIlUk13O9vhkMVFGXvdco/aJTnTuElIrO5kA7aEXw3HBUwEbg/bOjapBkwaWcPFMX0gSTvqeb33kkQdhhXmTkn3Kro6RD0VO0fF69WFU38bEZZfT5zccR32eR5UQcXjbtzwp1BC/ADxCA9pw2uG3LgCYPJApuRHNHGvN56Ve32d5Lsht58m6Gn+40acsimDP0d1Fg30lomlUZkwYmhe9EyG25nRsCqiSoJPrGqJQByt0jUeFeLS4fn2TMTcEMGbK9NQPovCYGLwmh1t0GrT/mqRJLHLTSc9Co+FiDdjMoj0zEBCLHThpHLju5AWLPjwZWR7qJmyGtAz/hlboEiwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=txlc9z2U8vkQI1iMxQZC4rOPquPe2njAGAZb783fN7c=;
 b=XTG0THdX91s6bsUfHEhXaZ6ytbe8kWXDHAIx9EOciLW1H+wg88w53T3e3BFJwutwlrQpdkaxdGRyAhTyc+aGEt5s0ACgqiHP3eWFKnx3dG+F59C/tYlVNdqUUABpP7b6JFAVQS0lYyGjqvIAG/PMP5MBAfZIxk7+S9sdtqhqFONw3Ei0MwGsWV9CnFP4w16UAyfvzC+EnYmGiOSqhOYR+8ohck9SjiyC+Z/xYUDmCBfmReiWFRt6loMLNin07I4ocnPc0Wm5l9m7j6h6yTqH5imDBkXscdL1BJW+J2oG4J9EKPIwv0t+rOSwboxPAlBwEnqVonunbSbr+TWo+WwS4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
Received: from DB8PR04MB7065.eurprd04.prod.outlook.com (2603:10a6:10:127::9)
 by DB7PR04MB4730.eurprd04.prod.outlook.com (2603:10a6:10:1c::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3283.20; Fri, 14 Aug
 2020 12:13:00 +0000
Received: from DB8PR04MB7065.eurprd04.prod.outlook.com
 ([fe80::5042:d7a1:10c0:c40e]) by DB8PR04MB7065.eurprd04.prod.outlook.com
 ([fe80::5042:d7a1:10c0:c40e%6]) with mapi id 15.20.3283.018; Fri, 14 Aug 2020
 12:13:00 +0000
From: Alice Guo <alice.guo@nxp.com>
To: jailhouse-dev@googlegroups.com,
	jan.kiszka@siemens.com
Cc: peng.fan@nxp.com,
	Alice Guo <alice.guo@nxp.com>
Subject: [PATCH V2 3/4] hypervisor: gic-v3: solve incompatibility problems in gic_v3_init()
Date: Sun, 16 Aug 2020 03:09:48 +0800
Message-Id: <20200815190949.6837-3-alice.guo@nxp.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200815190949.6837-1-alice.guo@nxp.com>
References: <20200815190949.6837-1-alice.guo@nxp.com>
Content-Type: text/plain; charset="UTF-8"
X-ClientProxiedBy: AM0PR08CA0001.eurprd08.prod.outlook.com
 (2603:10a6:208:d2::14) To DB8PR04MB7065.eurprd04.prod.outlook.com
 (2603:10a6:10:127::9)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from nxf55104-OptiPlex-7060.ap.freescale.net (119.31.174.71) by AM0PR08CA0001.eurprd08.prod.outlook.com (2603:10a6:208:d2::14) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3283.15 via Frontend Transport; Fri, 14 Aug 2020 12:12:58 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [119.31.174.71]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 9831c00a-3ca9-4a19-1ede-08d8404b62d6
X-MS-TrafficTypeDiagnostic: DB7PR04MB4730:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DB7PR04MB4730F6BF85D6F0D8D29E46B9E2400@DB7PR04MB4730.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4502;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /uVhN1eCs2dL9p41mWcajU1PdbTpBCx8iULZepSouwR6mFojTvD0sX/lmnLscbjse3R3//TS+gvgti/ei5gqHHYrC/541LtUQb+FCBb/CfaXiWSPe9G9Myn1EXUZOoOORPG3Z1wvKSfufVPjDFAHu6yASpGJTj5ecOSGkJnQmTJlw/kRmy/3cJOB5sjoZ5rFKL2tW8rkXRS2m4ubEkM/zDql4ERECWhp6bYRpbyOEDoIoepaCJE5/MtAuaqWRMR/aLjjewcqn5T/Z2Kw/GmIn2ENAFpkweGI8rdVlBHLu/Z+n6z268j4DGikjbUnZy2iC42/RCNDOwNqRHECUTyFzw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR04MB7065.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(376002)(396003)(366004)(136003)(39860400002)(8936002)(6506007)(4744005)(2906002)(6486002)(83380400001)(16526019)(26005)(186003)(66946007)(44832011)(6512007)(52116002)(8676002)(478600001)(1076003)(5660300002)(66556008)(36756003)(6666004)(4326008)(86362001)(316002)(2616005)(956004)(66476007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: zPj5vKgPWj/79wRwk5w+XRYsAbUwDHIqBkojRG4vX3T8l3aacbGRkE+pkpkPTHNtkdvr1YtiKICR5YVtUzfCL8fbRizMG/6CyJyDhXOqFJxQTK8XuXi/nPxIoHPrhqWheai0GWReqk9Ji6IMYfZY1tlZJyWcJIyW1S2UTKTInhyCEpOCwVT/NTKNxWbMLq/GcmPKup6Z13QTlTdyyknb1h7xaUQIfzJFcc6aszXbo85HTeBHPBD3QZx3kqPp6zwxfttXerqs1rc1HojTsyO2Q/mt/+A2P+rEB6MRGkpFCeknSH1huhPLEYFNH8OsZ7xeoCN0RANn+On/MM9m23djNZCxYOq+8tfMhGDNTh96eBBLTT1X/AtGV9NcdfBgUDnE6F88WqLRbVElDcVyWm8nTLp1LK6+M0+X1OOTr12l10bAegQYspk326gJ/YxD4UIuCXrcRTjqSXSwDRbiR37xNXNY4CSbQp/y2jjUmataFFl+IR8Fg/kh2R5SWeiV2XlmRtrQdlKaXjQm19cMI7NnkaJXRxclMIGi23/4IDiqYCLr3twTc4QxUd1cZ4Spe5gcOZ0X2Ax6/GLmCWfMZPVxmJMJomXhf4H543dqAfhi1HlbexAPrtNKJXISueJGURHxBCr492zvTHIhfSNKwWh2uQ==
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9831c00a-3ca9-4a19-1ede-08d8404b62d6
X-MS-Exchange-CrossTenant-AuthSource: DB8PR04MB7065.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2020 12:13:00.1762
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9QAXDUobbGDVoqI0jViwT8D7Et/ORV+MVqnG4EHjY8JbxJpmv7P5CqER1YTmpvGlW3Q4tPNZAhs+yXAvJzlqpg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB4730
X-Original-Sender: alice.guo@nxp.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@nxp.com header.s=selector2 header.b=MmVMJgeG;       arc=pass (i=1
 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass
 fromdomain=nxp.com);       spf=pass (google.com: domain of alice.guo@nxp.com
 designates 40.107.8.78 as permitted sender) smtp.mailfrom=alice.guo@nxp.com;
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

Because use mmio_read32() to read 64-bit GICR_ TYPER in twice, add
processing case for reading the higher 32 bits of GICR_TYPER in
gicv3_handle_redist_access().

Signed-off-by: Alice Guo <alice.guo@nxp.com>
---
 hypervisor/arch/arm-common/gic-v3.c | 3 +++
 1 file changed, 3 insertions(+)

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
-- 
2.17.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20200815190949.6837-3-alice.guo%40nxp.com.
