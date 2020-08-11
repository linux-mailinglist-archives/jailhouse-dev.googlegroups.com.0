Return-Path: <jailhouse-dev+bncBDEN32754MOBBOGZYT4QKGQETE5WU2Q@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x437.google.com (mail-wr1-x437.google.com [IPv6:2a00:1450:4864:20::437])
	by mail.lfdr.de (Postfix) with ESMTPS id A6887240523
	for <lists+jailhouse-dev@lfdr.de>; Mon, 10 Aug 2020 13:17:12 +0200 (CEST)
Received: by mail-wr1-x437.google.com with SMTP id r29sf4087860wrr.10
        for <lists+jailhouse-dev@lfdr.de>; Mon, 10 Aug 2020 04:17:12 -0700 (PDT)
ARC-Seal: i=3; a=rsa-sha256; t=1597058232; cv=pass;
        d=google.com; s=arc-20160816;
        b=D0pRPoq8xVIChPY8ZFh77OSSSqHB0X/5wKviYTPac2B/AzCENIWAYkSLfvGSQyG1Re
         KG5jUTf9Td/ZmHhxnEcTkFUcHWi6b4u2SDvl0RaYoco6AixgiT44uW+YUpBvbtb0LCz9
         iePT9a0BM/TFNj2P46QrVlwoz50z8oKjOLPQa4RrsdUh/pBT0o6mVPeDOHeCUfBMlkcE
         kQEe4+fDRdU7BQNlO9G6QZrHmhAZviXiubBl7JipTAIsDfwa8HYr+/WaklKfwmMZjfls
         gTCyTrS1hsZYb1E8UEli2YvUqrKC0ucXJrZdylc3FP0ps8vlnqE6yof1uhj8gO1E/+4g
         yPuw==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=yXAXDHOPDKziDs9rawAHVMf48EkQn2C1XIcdHmreMr8=;
        b=c5TcDrUvxkcT5OBmwtYhtfTNFt+g1CpNEh/VnRfkn18IBWSIkOe6RMvI6po+m/3gsb
         j8T0q1R7N+wQUO2zFS/5+Mpu9QbG+aivnXxG2mQa/TFNojHKBHRLvIBqEUPR0q0m6yin
         Latj+diIMyq2IjduiWTIiTBnwKGwLtoCkFauF2Hk5cjH/GShEKdUNknoQsxGTv06JILm
         UtBO28Ckv+m5axExYYUZZ1GkNxHJPlNFwIweZzN7SZksrvf/GtjoIW+GGauGbAoe0CIu
         6gWJ9Qi39duFNTxf6nMkZ3dahw2WgnXQCvuFg0pyySWwgwJMXfMnZJWC3cQD8tC8knMV
         QdBw==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=CtNKzcPT;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of alice.guo@nxp.com designates 2a01:111:f400:fe0e::609 as permitted sender) smtp.mailfrom=alice.guo@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=yXAXDHOPDKziDs9rawAHVMf48EkQn2C1XIcdHmreMr8=;
        b=P0P2xGzV2kBh7pUiJHKim23c7RuDwN5wM4+SqfNkmAs9ZL7/Qpf/OcSgOceDLQfMZm
         /oi7iTv2Yjd8umAAkiCEnXg2Ti4hMqcGBmMlMKHPt4uVNvdKa+MkAPgMwcOvCja0Gvqx
         KDjBRemgAemj/VkLn1WH5MryezMI5NjHWWTfC48OiByCaI8bKWVo7s8Ws+MhR50WD623
         w9Bfe7DRvaE/wZGqpBu31Qq+ePCykmdLysZZhXaLiP4V1n2VgBX6b/Wco/nWzelqHd6n
         4trUsm6r+6BmNN4KmFTs15B6Q5rgAGaKKQGuD6W3+Ck9H9eNwIpVw3mDc9TZge/hp7kc
         lUVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=yXAXDHOPDKziDs9rawAHVMf48EkQn2C1XIcdHmreMr8=;
        b=j8Qjsp83v0/9fWjw2eSv2GxGGhbXpTg5v5e7N871UEus6x+rEhkEWLxWpaOti3IJQn
         vsMA+PnVoqdrlJxi3IJLTIOqdumiVZYn5bqBOZUj6uPzu0yLmk9/tIsNQGCTGtokuxra
         NAU5JavM7gaiNwgDXs2+ZJy6A25iJxkjplwonQwXh2gky+3KDPrY/WBnvB2brrxYGDNr
         viGShGiXC1EQ1cbIk6qu81/XMMK2RJciAi+1Gw4RhC1f+7C9HNQwzc6vBVkg5AuD1P8B
         vx/mtATdfkR2688Nmwq8+0/knATuYd6LKdAewB/FvaiFiE/23X8jBrfPj4s6HKrEMqeK
         iwWw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM53061f/UHrykGQScUIgrYvJ+G0mv7UTtnfq78RSvExHk9jQYCj9z
	Zy1X4/07+PQjSaWFCrp3o3w=
X-Google-Smtp-Source: ABdhPJyZP4Gbi6DPE4kdexxwgfrP/heu06zrjCbVCw9lacURQSUUWzDkXO1xtC7W+bdoMD7Mjwnefg==
X-Received: by 2002:a1c:2646:: with SMTP id m67mr26210439wmm.137.1597058232335;
        Mon, 10 Aug 2020 04:17:12 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a1c:2356:: with SMTP id j83ls4950512wmj.1.canary-gmail; Mon,
 10 Aug 2020 04:17:11 -0700 (PDT)
X-Received: by 2002:a1c:de41:: with SMTP id v62mr26383993wmg.163.1597058231826;
        Mon, 10 Aug 2020 04:17:11 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1597058231; cv=pass;
        d=google.com; s=arc-20160816;
        b=x+QTnKLGdu4LXxZL/+NRRgX4Wg/WOzkaMR/60n89OM34b9pzCOWMp5kyPCp5fHnwup
         kueA7M8ARSefUAdGnYESlJXmVrU3HKc9fuSinFV5Npk3POTITgFAYaaGKa6ZYfGEM/zA
         ka8O1Ad0kXqNC5axUldJmf41x+xj/8VsnMGcOQIK5i0Uyma7aGsdYwcSwNLA5rz4ZeiA
         N7CPszlWMrj/D2FtZD1uxEGAmIqEFHzcOU8nSDGV7lrXnlwCNFRGz68i8dijfyFAlaru
         TYX9A23bG8WPaNLz2ESKiJLty2VSYax0a+PjaVuBCqzYBUWErC2FXza/BT828YP1chNf
         cRog==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=yp+SiDPKnbrFvI3JNF1ZL5KDLb8SMH9FgcRTJhJ+Cz4=;
        b=cqsGosBlg9vOJAVKpIQUIQ5JU9HeKNU1ohta+8IzAQaupZIDjKZjtlnFypFNDiXDjs
         1OcRnjN65puPRUJwO4/mNRDl31L1dZ923WG0+xFJN3DsJcWLkHSrHU28BwiTqKvgfr2W
         C0cU8zyYwZJuQZP7YfM3VIZbESSsSNn6xtK8y+7adPWoQYVH2VvKKjAX29fbT2zp6etb
         3WkWSUp5u1snzrkLoy8wt4rcQ8zMqXW7g9XZYyC1j382UD+BU/dID6nyUUCCK9Zy4PMd
         KLm94NaZv62g0/PKShAvDIjEaF4chB6fmYs5qu7NHQ0DUDO4UUFMy6bOL2jhpBux88ro
         lt8g==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=CtNKzcPT;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of alice.guo@nxp.com designates 2a01:111:f400:fe0e::609 as permitted sender) smtp.mailfrom=alice.guo@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (mail-vi1eur04on0609.outbound.protection.outlook.com. [2a01:111:f400:fe0e::609])
        by gmr-mx.google.com with ESMTPS id j83si1532329wmj.0.2020.08.10.04.17.11
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 10 Aug 2020 04:17:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of alice.guo@nxp.com designates 2a01:111:f400:fe0e::609 as permitted sender) client-ip=2a01:111:f400:fe0e::609;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jJyBf4r85HzFdMmuiaCXj1T0j2F/GDGYFof0MWl/Y0Y0mPdwIvjMoJt4sXhnatYtL6kfdiTjovt6p/SJcsVvcNlsK+pny7IsRM4LVNNlJJk92ckRVv4Edj6fryCmuN3jxKutf4oT6/+KhVa4Z9U+hsvhN6WAYUwpEcFVCzgRSuU9efyr2SVyom2CTG3kj+zd6CUc8T+r7Nt7rHQMjs/J+UBCdwkk+Ck3vkQIUyqkE5O8+bGtgcypgS32DVgGqURux5XqziawWyfBEXf1zpQsv9zrlvywvWIOC3J/4x7qjRPw3iJslK9NtTkO1mZkBa8V/z+tEvN5DLgj9joEI65H9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yp+SiDPKnbrFvI3JNF1ZL5KDLb8SMH9FgcRTJhJ+Cz4=;
 b=FP1XsXWmENiUzf7OZ58FwUiswl1hcGpg3mHgFwmo3n87riRZO4thNZpTUL55UNbAoZ2XWqX9RYz6Uw03RXn9bP7xN1T8mjDgtdD6Ud7Dt6+CYfxBaNfQ8LT/IGg0UqZCyRBU/BPcnfUXRnebI7WcjA1/RjCoB0Qh8PNNUKjUi71OopWmwCjCt126JUOnuYgOrrV/NROMPMO2+uhNNfk3LZSwdtWKAIhsAEgsv+PtHzGjCV4xLKryGctUcmCotBhyBuE/+U6AOf2Go5zUhQUbVyH0xifTZhZdkvNYHkFpLtmNuuk5QtAJct5fjHAP8Oxn8kQNB1/xFyCXvxdX2EWS1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
Received: from DB8PR04MB7065.eurprd04.prod.outlook.com (2603:10a6:10:127::9)
 by DB7PR04MB5451.eurprd04.prod.outlook.com (2603:10a6:10:8e::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.17; Mon, 10 Aug
 2020 11:17:10 +0000
Received: from DB8PR04MB7065.eurprd04.prod.outlook.com
 ([fe80::8cf6:40ae:36ee:9b42]) by DB8PR04MB7065.eurprd04.prod.outlook.com
 ([fe80::8cf6:40ae:36ee:9b42%9]) with mapi id 15.20.3261.024; Mon, 10 Aug 2020
 11:17:09 +0000
From: Alice Guo <alice.guo@nxp.com>
To: jailhouse-dev@googlegroups.com,
	jan.kiszka@siemens.com
Cc: peng.fan@nxp.com,
	Alice Guo <alice.guo@nxp.com>
Subject: [PATCH V1 4/5] arm: include: protect header file hypervisor/arch/arm/include/asm/bitops.h
Date: Wed, 12 Aug 2020 02:16:40 +0800
Message-Id: <20200811181641.7282-4-alice.guo@nxp.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200811181641.7282-1-alice.guo@nxp.com>
References: <20200811181641.7282-1-alice.guo@nxp.com>
Content-Type: text/plain; charset="UTF-8"
X-ClientProxiedBy: SG2PR03CA0149.apcprd03.prod.outlook.com
 (2603:1096:4:c8::22) To DB8PR04MB7065.eurprd04.prod.outlook.com
 (2603:10a6:10:127::9)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from nxf55104-OptiPlex-7060.ap.freescale.net (119.31.174.71) by SG2PR03CA0149.apcprd03.prod.outlook.com (2603:1096:4:c8::22) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3283.6 via Frontend Transport; Mon, 10 Aug 2020 11:17:08 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [119.31.174.71]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 3d3e0577-50b6-489d-afa1-08d83d1eec50
X-MS-TrafficTypeDiagnostic: DB7PR04MB5451:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DB7PR04MB5451AEA4EB504FD7C80DD65AE2440@DB7PR04MB5451.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1923;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: P+D4MK4DsgcJI6VvSBk/rzLSGCYU3V40VFtlELUFJ2sN6EflsUvvsC9hdy/3egXqyXmOI1YPNqMfdPBuKuG39vaawou2dyh0oDvSSMBgifUOMnSt/DyPWLQrP/POoNap+iCUoRkEz4H8jzdomwnjnYFkE4XIxi2XdKudUnWAau0FzvKCKvS5Nd/9PAobqj2JNNBxeZOzBFItiRPBYmIZpLcbzac2GADRHeNyUOubslfZGiX78LrS4iggKBzY5+72VebbXY8FjuFoSOHZW4GZww1u9WR8StXnHZO33Z/LeOcvNkn1tpf2TeIjRfJcz0BVe5oGUvQinwCaNRzIO/hV+g==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR04MB7065.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(136003)(396003)(366004)(346002)(39860400002)(376002)(2906002)(956004)(6512007)(8676002)(52116002)(1076003)(8936002)(478600001)(4744005)(44832011)(86362001)(5660300002)(66476007)(66556008)(2616005)(36756003)(4326008)(316002)(66946007)(6486002)(186003)(16526019)(26005)(6506007)(6666004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: v76tl18gorA1NEb2U3AL/lTQBpWjkqS+PyHSutg9z6/R9YGTttkphRISMPPVYXM75sKgObWVA7Ag0Z9wXBcE/vsf6U2G5IlDntPCXm4bBC0Z3M2MMFONdPSiEl5dhXvUrlyErqMQvnKK6cEElqiH8fD1psTI0jhnMC3vRS3piuS/kzWrAlwxGd3tj6KBwKzyZnnih98rFIHanzk5GfsfzTHI+rA3kmXEId+bWqRWuzq3JmOqFlJ67Lx5+rfSbrwProGPGShm6BBVxyV2ulcizjUa0eGUOKVmXuf0nhklBYZnUAW3PJ2j2d1k8r4K8VKVji627IYJpEr98Jw1KD+lIFo41M69NWCAH1B/1hzwwgZl+UTSvJZ+GP5idHqnLUCHFs1Me1xA9ouevuv2epaQvV7P2qG5XgfMKgRYG1bEWXbEkQZF/umi9qGzWwUwTWVbQU5HTQ4g3DkQOfyMrHjVtl7Bp3lH1Ol//7SYdZ+mDSreCDnYy9/X43JKZncLCJERuYzkDa3TIh0N6KXFZpFYmcFDW6JZn8WNH4M672LqHdwm3YBrNxqz97TWq0bQaTTNccEGL2qyeFRJnGv3b3GTuCO7piNEmlB6h1VQqmoAh/4Q8MRpNRypge+sMjOuwI9/gPvLkmLX1FTWC70BjGJjFQ==
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d3e0577-50b6-489d-afa1-08d83d1eec50
X-MS-Exchange-CrossTenant-AuthSource: DB8PR04MB7065.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Aug 2020 11:17:09.8846
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UG/EZkauJDlw7U3RElV/rbbW0ib64x61jjQu/4MacqOEghWhQCWKblYErCIQDvY6AGVoI23A7x5cvi0uGE6kPQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB5451
X-Original-Sender: alice.guo@nxp.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@nxp.com header.s=selector2 header.b=CtNKzcPT;       arc=pass (i=1
 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass
 fromdomain=nxp.com);       spf=pass (google.com: domain of alice.guo@nxp.com
 designates 2a01:111:f400:fe0e::609 as permitted sender) smtp.mailfrom=alice.guo@nxp.com;
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

Use "__ARM32_ASM_BITOPS__" to avoid redefine functions declared in
hypervisor/arch/arm/include/asm/bitops.h when building for AArch32.

Signed-off-by: Alice Guo <alice.guo@nxp.com>
---
 hypervisor/arch/arm/include/asm/bitops.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/hypervisor/arch/arm/include/asm/bitops.h b/hypervisor/arch/arm/include/asm/bitops.h
index 67aee781..2940ae16 100644
--- a/hypervisor/arch/arm/include/asm/bitops.h
+++ b/hypervisor/arch/arm/include/asm/bitops.h
@@ -13,6 +13,10 @@
  */
 
 /* also include from arm-common */
+
+#ifndef __ARM32_ASM_BITOPS__
+#define __ARM32_ASM_BITOPS__
+
 #include_next <asm/bitops.h>
 
 static inline int atomic_test_and_set_bit(int nr, volatile unsigned long *addr)
@@ -42,3 +46,4 @@ static inline int atomic_test_and_set_bit(int nr, volatile unsigned long *addr)
 
 	return !!(test);
 }
+#endif
-- 
2.17.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20200811181641.7282-4-alice.guo%40nxp.com.
