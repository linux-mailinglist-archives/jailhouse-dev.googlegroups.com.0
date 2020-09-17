Return-Path: <jailhouse-dev+bncBDEN32754MOBBOGBRP5QKGQEXHLD4ZA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x337.google.com (mail-wm1-x337.google.com [IPv6:2a00:1450:4864:20::337])
	by mail.lfdr.de (Postfix) with ESMTPS id 1995226D20A
	for <lists+jailhouse-dev@lfdr.de>; Thu, 17 Sep 2020 06:06:19 +0200 (CEST)
Received: by mail-wm1-x337.google.com with SMTP id m125sf243550wmm.7
        for <lists+jailhouse-dev@lfdr.de>; Wed, 16 Sep 2020 21:06:19 -0700 (PDT)
ARC-Seal: i=3; a=rsa-sha256; t=1600315578; cv=pass;
        d=google.com; s=arc-20160816;
        b=tA5c7qQMWQR3bl3hhq+KF9AbRgxJnP/D/+ezu64QaX+8JWIh7CahTgj/bn+Bd3xRVG
         6PJEvBC2gKNhvdWklBxJf/j1z4AXwwCN46K1RjaHnP5WC9NmptFhiur63neeqD7SKFzC
         Dd5Vp2djuQ98V53ayUTUEpo87kjK7jdmaU2hA23B7GZ01tyf6RYrb7JMtSznC4I5Ounf
         lvoOz3+rkaBwX0pYbBl/ROOqbnp//6J4d2P/t6Kdj+7hyr09r9cbq8daUgRRJzjLqDUN
         AlvdFHM960ZEpW9QG8Tj7eHUZ9flfXzX1UFcvIlJFnXB5n6EDkGy5cILtwOOt4s/UkLI
         cjqw==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=OM3NYIeBNzVIvYnqqdnGZbSizC2YYhWihKX+k8dSWzY=;
        b=iWIfiMfgkZog4EPsmdSWjreJaq9DaGnovsOyqz8ON1hRcTI9K2KOKD9GrL0Sou29Td
         6bu59PdZp4Q52cTgRk1cUw0SYU+jAhbp0YeBTiAOlHD/F6hhirOjw739B/6M6kZ682TO
         5/cDH+soeaoHtlU83FaObF7ne17nbk1jWSeDTb3ZG/5/qXOnsh5TPs9KZIFzxwIq3iZX
         BkE63zvYoxrHvDql9XF/cGsZLTTn89Q+yOnmszbX88fnEF3aju6iIeLAqJ1r2hp+m6X6
         B5mTnexv+vGYVjw3gi4CbNr71daE3glul4arowHqZmt8/bqJx/EOYggA/M4TTctDQ1AM
         ZsqA==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b="e+/ZkyKl";
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of alice.guo@nxp.com designates 40.107.20.45 as permitted sender) smtp.mailfrom=alice.guo@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=OM3NYIeBNzVIvYnqqdnGZbSizC2YYhWihKX+k8dSWzY=;
        b=DQKhBh1hkgcDx4aino5sBFchFIu/QbbMzunSvV8lr3YgcSPOTAq+DU0n8PdzFPB6q0
         UqI36S86Y9v2tt7GcF/dEBQ2iUpEl6ABSJw13lkHHV73ogxt+5WJfGxeeKGFi4V5JyDl
         iF+QsAal7Eb28ZqLlxlFa71tTiEdW0VBNXMApkbhh+WP+SvkmjXBlxB7bXK2cuE3Bopt
         /OKoKEz0KpAxwmx32nT6Pp5OailzfRQuGMlZy8miPfojgQfpaF2VGIUmOW4RcxkZVSra
         l3wMk8AERCpmi3sxLfWLMcNLvdpb43qS6N1/obsjjwuGMBhhOxbv0kODdRmwkdlI+KVH
         35VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=OM3NYIeBNzVIvYnqqdnGZbSizC2YYhWihKX+k8dSWzY=;
        b=cnn0a6pppIodWM0dKcXr9d5RJAc/TT0RVypPM10FpXHHt9dx5dGcF1Kfm/5YysPXBn
         06iK7jUsSeT7IQGpuMa+lTj4yfB+4SeALYEoJUfWs86pgor+qPqNf2UG64e+MtlJr/hc
         VnevpU+CoapN355wtTdb0gut0P7fmANZhME6rCW8EOAN/SVjuJ+sAeM02BJh5wbPWPUQ
         gH9AAE95TRVAiZPuURuLSHdHcM3ejsxRalhADNsGTEnHt9LSI6e/u6KfZwBMHJ1Q5OFa
         HgueEpt+Z93hnhz7cU8xDMNBXzRgLBPqtnxh+/y4YGyt6ut/ArstTlczqIiiBjDxhI04
         +DjA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533ktli9c2VeRmhpXrg/JteCaTicrdTSDQ2sjiVKnv3tDkyBjBsO
	INNudx4NYmaToFkL9ORGQHo=
X-Google-Smtp-Source: ABdhPJwqdlpnv/Ln7NUQRkLtFY0I5SxfO1QHcaZPwUlbjIxGjqf5cHenrVarDokaGIJXEfFlbBSOKg==
X-Received: by 2002:a5d:6912:: with SMTP id t18mr31500825wru.326.1600315576393;
        Wed, 16 Sep 2020 21:06:16 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a1c:4154:: with SMTP id o81ls320521wma.0.gmail; Wed, 16 Sep
 2020 21:06:15 -0700 (PDT)
X-Received: by 2002:a1c:1d08:: with SMTP id d8mr8135654wmd.78.1600315575430;
        Wed, 16 Sep 2020 21:06:15 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1600315575; cv=pass;
        d=google.com; s=arc-20160816;
        b=zwA15ytz23QivjL5tXDyXKy9JALN2hiD28YYsl8Xn7FDe70icFXwTWt7cQORiJYYzG
         Pr+xyXT2GSkdYONY73UWoutn6f6l48BWyWWMIXnP5LfV5Gdjw1TQAxd+/ePhzH4VLLej
         jtdDMPMDu/4ZTlTHeAakZUUWzt1wQ1FgQDKZZZ4CM1M+zg4zOQvmLA+IzcrE5BppfvCl
         +kco3u04JU73WoDBKxmkDDVj+K92HunCd6phJ/hgLFDiy9dFN3MjO+pfx0HfFHx0TU1S
         W4hPSdXQ/mdhf+z5BQ9dg53BJ+H8H8aX0foWXjJx0RR/TOOOR8FpY8MIKuPfu+9CzJpL
         vc4A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=KApypnFq9NqKf6ZAoqcwK9+uRHwqoJZCQ5leOxlDijc=;
        b=pjlQ3AvU2Wv9PMprXGXX1DpYe1Sl0TgspPq9J2999Wawt1b7crWFd/Ua9lCaGOoD7R
         rAsRs6SN8gnADg8k74hRpD2v1/PQR3OzXvOeRD7/Bd8TT0s0MBKbR8enKg/J0+aHsLkX
         tyQPsJ1ZPsJdi61bpWO3/IvtVPNZ1WNGffEKcUJLSJki48OXbj7dS66OPFlEq0X4dRDU
         rbJudkSmV8Sn9CyikzWJivUnag5R6gCGhaWTBTevAhts/+zb4FAfVX9Ay1CdQXap32Mm
         qkJ+HCCGvYnouPIn4qHAeGM1SLk1hhTTEaJDomm84ZPN18h2H8tvK/gl+YIrL+DI2U5y
         blyA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b="e+/ZkyKl";
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of alice.guo@nxp.com designates 40.107.20.45 as permitted sender) smtp.mailfrom=alice.guo@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2045.outbound.protection.outlook.com. [40.107.20.45])
        by gmr-mx.google.com with ESMTPS id n1si108331wmn.1.2020.09.16.21.06.15
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 16 Sep 2020 21:06:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of alice.guo@nxp.com designates 40.107.20.45 as permitted sender) client-ip=40.107.20.45;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=akLZcBND48tbUvYCsv+IC2HuXxJ01BRoZhPVO4bKA+PmaI9d4xlm17NovhCLx1bvY/oAb5sN3QcsIB7G4qZssFxs3hm2+271phEfhO1r/eo2GoA5QfbjNWoiIz2ECyPXI0MxSetdXuT7bJrBWxh41xKMfImR1sCEYyJ6ouv7QQ4lH4ykcAMyUlNw2dnWRauBHHC1g0wHWJF242nQW7yxNORcYdpokm30pUOXZnZYGT87Tx5oVMJi8+CZzwoM8r4zrb7z+/z775tlw95MKsP7evCsTofsxLL2hVQImEIjRLrQH6jlDxTmtyyNFkuccVKm0CSQxnWf+PIn3yT9bUAWTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KApypnFq9NqKf6ZAoqcwK9+uRHwqoJZCQ5leOxlDijc=;
 b=H51Z3SX9PpIWolk54OF/1WWozsMk9O0Kkk1/mDtTae8c+zrP7N6VjdLToRinDEowg7SP3dGUUCRtrDjon24X/+srOjSlXzCU4T56I9BLS4MwztpW1zGC0UgG9/ieKn2piv8cghAOnlZC+sT3SwEt7fxNgwwnnfbBpdKst0kPZ6pDZ40P3V7GlBJaNCXBcpIx0nkCutr3IgqZZ9k91pNUP/JDX9nwSefmIQHWd+Ja6rTujVhlqfWAPEhDIVGgN9JRnlSoXHvovDsnX03AYn1XfdlZMC/Sb0PO9SHSVl1kFjdgafeOlTrya000TqdL3ohpexELyGQEvwV/fDtyKp08ew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
Received: from VI1PR04MB7071.eurprd04.prod.outlook.com (2603:10a6:800:128::8)
 by VE1PR04MB6654.eurprd04.prod.outlook.com (2603:10a6:803:129::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.14; Thu, 17 Sep
 2020 04:06:13 +0000
Received: from VI1PR04MB7071.eurprd04.prod.outlook.com
 ([fe80::c97:3a39:dcbb:117c]) by VI1PR04MB7071.eurprd04.prod.outlook.com
 ([fe80::c97:3a39:dcbb:117c%8]) with mapi id 15.20.3391.011; Thu, 17 Sep 2020
 04:06:13 +0000
From: Alice Guo <alice.guo@nxp.com>
To: jailhouse-dev@googlegroups.com,
	jan.kiszka@siemens.com
Cc: peng.fan@nxp.com,
	Alice Guo <alice.guo@nxp.com>
Subject: [PATCH V4 3/5] core: provide macro SET_FIELD
Date: Thu, 17 Sep 2020 12:05:52 +0800
Message-Id: <20200917040554.4599-3-alice.guo@nxp.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200917040554.4599-1-alice.guo@nxp.com>
References: <20200917040554.4599-1-alice.guo@nxp.com>
Content-Type: text/plain; charset="UTF-8"
X-ClientProxiedBy: SG2PR06CA0196.apcprd06.prod.outlook.com (2603:1096:4:1::28)
 To VI1PR04MB7071.eurprd04.prod.outlook.com (2603:10a6:800:128::8)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from nxf55104-OptiPlex-7060.ap.freescale.net (119.31.174.71) by SG2PR06CA0196.apcprd06.prod.outlook.com (2603:1096:4:1::28) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3326.19 via Frontend Transport; Thu, 17 Sep 2020 04:06:11 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [119.31.174.71]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: c872ba91-a107-4a8c-864a-08d85abf048a
X-MS-TrafficTypeDiagnostic: VE1PR04MB6654:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VE1PR04MB6654A9E8BD08D020EA4ED4C4E23E0@VE1PR04MB6654.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1417;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: G20wwrCDRe3PNksclO2iSiJ4QXw7Vce88ZBfv1DkrLZZidv++tOaFpVbyA/9BnK3POo4HaxlhQMCNXsL5M+Z4plpyBbR2P5dtmdKfKuA54Hy997R5m9LkK7SVkOcYHutSOrCFpONlJivMmoCImSUlukdxLVcFcfVHAp2Ti3ukvhfvs1ny0mqvpd5+yMRH+zUjL8D4h5alpVJgCMoNLaM0YnWpZ3avJx7AtlkH4oerzjF8rK4x2+iRf0Nc32iaU7clZiz4VEQYtjdtytY58KGlgnHWwzTS33tDq5sMLNzwyUmHS/otwbRfkWZcwYUc69MpmgPLcIhzsvBauOZMPd8tA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB7071.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(366004)(396003)(346002)(39860400002)(376002)(6512007)(86362001)(8936002)(316002)(4744005)(52116002)(6486002)(44832011)(478600001)(2616005)(26005)(16526019)(66946007)(66476007)(8676002)(186003)(4326008)(956004)(66556008)(6506007)(5660300002)(36756003)(2906002)(6666004)(1076003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: AzZLxuFWKW8JNhzBdIlofxeY16eI1206hQv9a4fPHcZ46xLP+S7VINZ4ZZXUKuBaTqLs0JdSgnkAoxB8S6EjelmmFsakdjxq1RsPyVaj1nSdHteJZXZMnHmf9kSmw1IN0WCAb0MFeYFlnsoZV1QkSjfb021bvjctd+E4K1uVOfWiYH91ygiJQNOu2BSXHwXXNBAKUUG9jm4tAUe7p8om+TBMEH3kJfIJser4SAEQcrp+huGM6Ibikt/BPal0UfbIisEbkkVwH+lomGfDlZafhJm1kdkHwyGFlto4005i1j5neBVLT9vF3liF5CqY5Ylmn1vqHa2kCM+RS3B4+rWXJDmDN8a9mAni3NP8sd6siUb+RyO9tfxbvy5Eeq+cOY3rcD10t4q9lRzJV+ST1/H8Z5+1omIgsHq3lZT+U07z078OniNgwrZSwE/mtI75w9j8XI4J1Ca4OeHfmFQ0l3wxf5/toNzfaC9yVrvUuAywCksqOTK9KS6Iay1FHfCTBrv+lJiToCNY/6k/NXVmg6uGV7B3bi5nDmIDo3NRRGUBXjkuhFm6PAZFpcQBBYoVX7iv1zIHeydbkg0eoQon/5OtnLix8foL1Doefc5DMzNhO2GqsIMUMh/7Qoj5ib5HSy5Azr++GjvEMiTgbY2zW7lWLw==
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c872ba91-a107-4a8c-864a-08d85abf048a
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB7071.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2020 04:06:13.7800
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rptOC6QDtJ1EOvvdqsqFcXE3bHkrjVeg1/sT1mFL0P52321oeFblMbJ6Weu29IiDBSJ1hrhKWvHJNueQc/DdKg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB6654
X-Original-Sender: alice.guo@nxp.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@nxp.com header.s=selector2 header.b="e+/ZkyKl";       arc=pass (i=1
 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass
 fromdomain=nxp.com);       spf=pass (google.com: domain of alice.guo@nxp.com
 designates 40.107.20.45 as permitted sender) smtp.mailfrom=alice.guo@nxp.com;
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

SET_FIELD allows to set bits[last:first] with the given value.

Signed-off-by: Alice Guo <alice.guo@nxp.com>
---
 hypervisor/include/jailhouse/utils.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/hypervisor/include/jailhouse/utils.h b/hypervisor/include/jailhouse/utils.h
index 411f6365..21243082 100644
--- a/hypervisor/include/jailhouse/utils.h
+++ b/hypervisor/include/jailhouse/utils.h
@@ -35,5 +35,9 @@
 #define GET_FIELD(value, last, first) \
 	(((value) & BIT_MASK((last), (first))) >> (first))
 
+/* set the field value at [last:first] from an input of up to 64 bits*/
+#define SET_FIELD(value, last, first) \
+	((value) << (first) & BIT_MASK((last), (first)))
+
 #define MAX(a, b)		((a) >= (b) ? (a) : (b))
 #define MIN(a, b)		((a) <= (b) ? (a) : (b))
-- 
2.17.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20200917040554.4599-3-alice.guo%40nxp.com.
