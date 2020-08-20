Return-Path: <jailhouse-dev+bncBDAMFR7JZAEBBV4K7H4QKGQEURFT5SI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43a.google.com (mail-wr1-x43a.google.com [IPv6:2a00:1450:4864:20::43a])
	by mail.lfdr.de (Postfix) with ESMTPS id F1C0724B31A
	for <lists+jailhouse-dev@lfdr.de>; Thu, 20 Aug 2020 11:41:43 +0200 (CEST)
Received: by mail-wr1-x43a.google.com with SMTP id j2sf457005wrr.14
        for <lists+jailhouse-dev@lfdr.de>; Thu, 20 Aug 2020 02:41:43 -0700 (PDT)
ARC-Seal: i=3; a=rsa-sha256; t=1597916503; cv=pass;
        d=google.com; s=arc-20160816;
        b=C3GcgFy5ASkfZ0ngu/wn3GOel18WwYkYoAIbPpI82GO2CdEC69JX1qbsGpiONKWHBB
         OuCEB0RGS0jNA/3s/I3hcNT9FR4yHMchyNEnDmVli0pTuWLU4g6xTN6xEXR4qhyUvsna
         4llcqeir1cS4U50qeuXWLb8wImxBLoO8G23HiLEzX49GKaHUgPzCIyImSWRb6pGhXj7Q
         wzg/mXejaCk1UkkJ7WFc8gxMH0Gu4DmVdUiqqX5rxahW0oGEmmpKHFYR0rRmo2IoAm/A
         P6NDrCrI8y5EDelAVuk6XkBSLdxN0x6oVJmT+NRixjWkbt8GpgDj8/vZSwo9IKgCnsB6
         jhwA==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=uPMi2HRg1mEug7Oru3+hap/og/lAvjPrsXGdIPhRoa0=;
        b=Ofnzh2nmjdGDp9cw5q8R/QMT5HlUAT7Mfyt6AYhw420yNpgHKyfsfpMgzKcLfbIDd2
         RLGCYQsXIP2bEqa4YnEM2soe0hIQR97L3Bufz3qLV4KPc2htcrW1xBvktPZAwlNG+HAT
         MMH+wLL8RneWUpk8F7hqyvTkNTazuTBj/N7h3xgQ1OggOZy76UyNHV7yoOA9HoSkkUxz
         tD5WaifOFERWIxXOyyX/7UCQ5F0UWa0dgP4rI9o3BvKt1anVEVujy26P02H/u0fQsewg
         LRrCtJSwquXtBBUNTSP7W+tottwjtg4RJ9j4XnQLmS/zzlhPgpRddlX5tugvL8EGLkW+
         R4hg==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b="N607kO/l";
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of peng.fan@nxp.com designates 40.107.20.58 as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=uPMi2HRg1mEug7Oru3+hap/og/lAvjPrsXGdIPhRoa0=;
        b=rWe/RqW7GL/22tmQ6hRPm+0ECtqsUF2ocLiCrxCBMNvTQN4Hu6oIIWuNGLcRzplCmk
         MGMVOCyflGe0eP8txbYBkcYiv4cqBB7Rr8y+bLypEyrBxRn94+Tw0AwA//g+e+Yg9ajR
         lBMewhzo4WjVo6GOJP/m74scaBObM5a3rEoCC/t9C2e8OTmFM4SUg1GBnfGi2BVWYXdJ
         o2fphHDNwkbl276UpxDmNaSKmknxFJvNaQFflPPwM232AoL+A5YxGvzf6vwczU3s1SFy
         FEZayv7P64x59s8EbYsb9CF8hpr6WMJR3g/LNJcJAgJDcXyg+5n+N8Js6CTqVeNltv/z
         Krhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=uPMi2HRg1mEug7Oru3+hap/og/lAvjPrsXGdIPhRoa0=;
        b=eG5f9sCmPStUmU/rqsznfv9Jr3uxZ25GVZKL8NZsnHLy76MtBaK1YHsTlqBBbFNTEP
         LihQqHTdwKctDWtWsDcPSEBRPJEMXk/aAVVMBTEmFd8r6JJpqdzGnyLeGOAnnm6dhMMp
         0vPJ5ypNdJupqVZUQFzalyCqkyUJyVNLeBvU5rc0xxCo2Jh4bN9QtmrJvcACJH1SapAy
         eJEAFYMsPESeq0dGWSsjEs0bY04MGl0IEXVjUdVGioLfT8eVBsFpPCozZXMphSUvlxrC
         8za8B05V1AW+BTecM+Lf4jabrrUirgPJUmNGi87d1+9K6UE8BhtQnm651FLEWmxNelTU
         3VGg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532C+3Z7LnKeU/tXyYlfgNMfkAoyxAY8CwoCVg2f6/FmSjIYm2AM
	GqnyPDjo0ok6D09/jlORrsw=
X-Google-Smtp-Source: ABdhPJxDmLdoTBb3xYUBYbN2zTci+S5RlkQCslqQAvte14Xy95VIBvpBA8pt7a8hfvqhHIxPxOj/BQ==
X-Received: by 2002:a1c:7e44:: with SMTP id z65mr2816351wmc.13.1597916503673;
        Thu, 20 Aug 2020 02:41:43 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:b1cf:: with SMTP id r15ls1670745wra.3.gmail; Thu, 20 Aug
 2020 02:41:42 -0700 (PDT)
X-Received: by 2002:adf:9526:: with SMTP id 35mr2442482wrs.326.1597916502788;
        Thu, 20 Aug 2020 02:41:42 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1597916502; cv=pass;
        d=google.com; s=arc-20160816;
        b=wy97KI9NC3f+MymvkRb10bt49MSHC+w2gUCr2NsclkY2ajpVncYA3PGrRZBuCYRnvV
         xp+UiQa1Knnyrzn8HTWTPCV5RBeaeq2cx3ej32KalOKmTrq+ribdr7tPANaWoxB5ICe6
         SfX5PBVNJH2Rmdzt5J37rD1eYFUwtsbsSRkAlsw8Rzl3Wbj9lIgmrg1tjuB7sMagc7qC
         aFtLauLzMfbgfPCef6F+2A5f1fPLnKjvPwt59ejOhRvvVITr2zsYqyQUvbJkXDmv9KGN
         WxG6zoKErdfqRQfiVwutVWYMLTRoX6P4bbXylUyTT063Tl4ltdYov9YxGLPyp7kxs5yC
         HUBw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=71smnUKnqzAQXXJlqBdWaHGS7ZYXA/lDTXfP0svBNi8=;
        b=BiG0hGVBRe2cCFu+hKKwTeeoeYfQIEiPUC6WixdhD4rWlDXs5gazEPjdUCU5ODOKc1
         1wA47OPrwYRybLh9euW4h/Wwfr4CRptNZVvfPxVbuy3lyyOIC5amCDmU8Uy8Gs6miRiN
         jPMmcMCiX71L5OdV0+n8ACUOAObMuP8eopI91jHPyJnR7JCCTsld67ZbOAM9nDRmgf0P
         FAW0LLa39STMrWmDR1E0C1tm3fjjrSTKe1E7p5wr4PiTcCY6+9O3kpe++Rf0XioE44tS
         QQETV19LT8z0yWHEAFnqNTHDqXoGdMQQ+09z4Wi3aynpGda/VUK06H+vgYZLbgzsdcei
         eDqg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b="N607kO/l";
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of peng.fan@nxp.com designates 40.107.20.58 as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2058.outbound.protection.outlook.com. [40.107.20.58])
        by gmr-mx.google.com with ESMTPS id j83si421718wmj.0.2020.08.20.02.41.42
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 20 Aug 2020 02:41:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of peng.fan@nxp.com designates 40.107.20.58 as permitted sender) client-ip=40.107.20.58;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P5YzqsXJnhQjVb1norLH1u2H2bw3BU/HWecioP+SmdOxDGWAkgWKZElElflW7EUnjQI+YZdj1kCUIULgNc/i/yx1W0PRaCDgFlxSOglwk8226Wv/KffMmXvah5db6IO8K1ytzi8DHsu/zlti/yWhJ4NvdXQ9R9JviTFfL8dfPO5otV/f1Qv7u8H5JNOGwgLtBm20sLV8+fQL39QlUcGf4mP/W46eJ4LH1BEwbo13UQzt71dUWCHL2oC0XSXPYZnqGGD5Nk9Q+3d0qG4amHNgZ4j4ytqO2cV41f7BBC3+4C2hd3yc8kx7RfqrsLkTzxavftYaW5H+NZPK+HKxXp14xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=71smnUKnqzAQXXJlqBdWaHGS7ZYXA/lDTXfP0svBNi8=;
 b=V3Mt13z29G1evIuvxlw9uFmAMTPYOLa2BgOofv8+Rm3XVhoZfYtRmtVucfhphKKphFQVCcla5YdjcJ5MM+v7bpzwgmT9jPNGE0WkJWM5zghxo5ArN6PyC5G0w2qxIEyrXYbZlT+hOiMuq9dCDOXKDQgBug8apOeNDJhGmp8FWIovPRe5YVlwgfU93rxAuKDmtOfOsaCRtFSau5ZeERq42Et52AP/4vjFJS34NSd7YDJfO5WNk6lJh8GOQ5URfxQLzxqrO4twZ6Qjk1d5qLydZxWyRP4adUxNvp6rLtUK/Ah8NrncjBE7+pRJYWkRTLL3ar7pgAiKYHJq/wLg/ZEZxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com (2603:10a6:4:a1::14)
 by DB7PR04MB4235.eurprd04.prod.outlook.com (2603:10a6:5:22::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.24; Thu, 20 Aug
 2020 09:41:41 +0000
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::24d0:f783:3c7d:e232]) by DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::24d0:f783:3c7d:e232%12]) with mapi id 15.20.3283.027; Thu, 20 Aug
 2020 09:41:41 +0000
From: peng.fan@nxp.com
To: jan.kiszka@siemens.com
Cc: jailhouse-dev@googlegroups.com,
	alice.guo@nxp.com,
	Peng Fan <peng.fan@nxp.com>
Subject: [PATCH 2/5] arm64: no use FPU registers in jailhouse
Date: Thu, 20 Aug 2020 18:07:04 +0800
Message-Id: <20200820100707.20013-2-peng.fan@nxp.com>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20200820100707.20013-1-peng.fan@nxp.com>
References: <20200820100707.20013-1-peng.fan@nxp.com>
Content-Type: text/plain; charset="UTF-8"
X-ClientProxiedBy: SG2PR02CA0073.apcprd02.prod.outlook.com
 (2603:1096:4:90::13) To DB6PR0402MB2760.eurprd04.prod.outlook.com
 (2603:10a6:4:a1::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from linux-1xn6.ap.freescale.net (119.31.174.71) by SG2PR02CA0073.apcprd02.prod.outlook.com (2603:1096:4:90::13) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.24 via Frontend Transport; Thu, 20 Aug 2020 09:41:39 +0000
X-Mailer: git-send-email 2.16.4
X-Originating-IP: [119.31.174.71]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 73740b71-3543-49a2-390c-08d844ed3e04
X-MS-TrafficTypeDiagnostic: DB7PR04MB4235:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DB7PR04MB4235B157B0969807CEB802E4885A0@DB7PR04MB4235.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4714;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: nqSxe8lPgtdbPUsd/gUMnxkD+u/VDW9JUKN25PG7fqOIIihCUc2EVOJtFQnoRirj+G1m7VMCjIhMqsYyGYvYCS+Kw0QrFERCIPGewFwuuTgqdcBjDISeiDIivH+4KX4QJSUQNs+sijq+pPgYF090ZXNfm8jnLfN4/Z1QCW34x1KHfGhJ+cKqxiDIedRQsGaETFU/ABAKOmSyr9tQYBByFzmiSh1fMr6ImJ/QJ9c6owLFsR0Az1qSOFUJoD+AcvhltxbqAysxDl2pqIdlZIB7JOuPnvSZCJspwNABi9ZV8XG/OmYxt5UDHx9uWWhElSRi7aXgKoFRmfp+y71TG0tWyg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0402MB2760.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(346002)(39860400002)(396003)(366004)(136003)(16526019)(6512007)(66556008)(2906002)(66476007)(6486002)(5660300002)(4744005)(36756003)(8936002)(86362001)(9686003)(2616005)(186003)(52116002)(26005)(8676002)(6916009)(956004)(6506007)(478600001)(316002)(66946007)(1076003)(6666004)(4326008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 8ZpNybAsewGmZLsEF7AYDuyLdVTlzKcsn6luk0MW7seqffsHHMiF1JlT2GfKLc0czh6Ka5i/zi5uNJCTUjUhiQ67fP0GDY+trMvEQAnihlz2bGlA0RBAMRbHWw/kI91RpeJBQkvXwxYqUXQe9iKaOtvAIlSCm7+pTkkQez24zOGyteXWD2+ZZ+aWU2akmf97VrMvkms6EXBGl72qgJT0vs9eropcHEj3xhjtheB+tbgTL8lhwAab+SptsW4k7chGh4TI+LNurKEtuLVCIqWgN38Vo/lKxsDIW8CxnpSRK/sQfeigkmuSHs7rPOkLwEt+jL2zh16h0Seo2KqAfD47LPEjekc5V7QNK+bQ70agygZP+vVuU7fl0qTL2ab66MOW89pVkqdBtqGxmmdX0Xxe1/PuuSAzeBWUkpEh3JPmBEjsPo4drsTUu1BAZ2uzPxmtTjedI+WeXOAcPKEYLvE8OeZuHMgz9aKb98J/K4m2dUoRWWVsPj6j2u8kg+pLzy2WPSqe4Ltxbfm/yM6dwkYaRXWwX1lkyA/+XDkSIVVSFp1jWrrifoS7c9xIUu7yrOCd7NhBdcEGi1iKtEFGE2GYUZI83UakKrsyq3BKBTege0LCTelOf/v+EyDMsqtdl1FqdPR5k3OvIdTh6gBXUV63ow==
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 73740b71-3543-49a2-390c-08d844ed3e04
X-MS-Exchange-CrossTenant-AuthSource: DB6PR0402MB2760.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2020 09:41:41.5695
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WgiVT2cttG8U+YXDN8sTm09JMsTJ4TwchD7HUUljfu+uQpMO75pYhsYWLPmR+4VSlq0Z3U6AlHe/ouoKLsfIKg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB4235
X-Original-Sender: peng.fan@nxp.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@nxp.com header.s=selector2 header.b="N607kO/l";       arc=pass (i=1
 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass
 fromdomain=nxp.com);       spf=pass (google.com: domain of peng.fan@nxp.com
 designates 40.107.20.58 as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
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
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20200820100707.20013-2-peng.fan%40nxp.com.
