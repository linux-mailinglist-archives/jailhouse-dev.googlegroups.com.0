Return-Path: <jailhouse-dev+bncBDEN32754MOBBLN3U35QKGQEMJRRW2A@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x13a.google.com (mail-lf1-x13a.google.com [IPv6:2a00:1450:4864:20::13a])
	by mail.lfdr.de (Postfix) with ESMTPS id C275A273B1A
	for <lists+jailhouse-dev@lfdr.de>; Tue, 22 Sep 2020 08:46:05 +0200 (CEST)
Received: by mail-lf1-x13a.google.com with SMTP id y9sf3325076lfe.17
        for <lists+jailhouse-dev@lfdr.de>; Mon, 21 Sep 2020 23:46:05 -0700 (PDT)
ARC-Seal: i=3; a=rsa-sha256; t=1600757165; cv=pass;
        d=google.com; s=arc-20160816;
        b=hwYiTEy4g8AY6cdBRysmJRe00BsHShvZJx5ITNCviInY7a7J6HR68G4y3n2Aa6e0Su
         w8cVRf1vgng46JXt6/rL5LZ1k70rtaOFQcuoZUhAZN4MX7tZ7+8atpf+mKViY/SgdZ7d
         WIi8/KqR+JlyjGxuhiUO84skisYxR6hZ50eGKEIFymxn/G1IemEw2goqEYGB1334Mpx5
         6fQP0XY+u3bzWUXM7azKUjm8k/f+T8oGJgpkgEac28GCC/IcV0SnlSSEVUnPpoHTTe6M
         bWwqhkoUXpLJUpIQ50emVfr6AfBzamTw3NIoFKmr3q3DroJdqoo8mmkZLw+hb4Wx1jkW
         jfqg==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=z2HXFxhASYX5Dx/epD/CsfEplPfUP0gxP65VDgHZpQ8=;
        b=il/bCotpb4zPEZVTv95Mc6OpEtofgfui1lSlpTV2iYd8kObKArH4qrMqv7mbw/rIja
         GK7o2qyotYaTjevYRkYeJ70hvm0vFJq6lqYN/d07Lmin2OQn8Owj4g5eXjQe2Ia17obq
         T2zIn4XaJZAJiBFRSj/XNmM+4ew1LRKKCG7kKtkg6DW3ppxk4+zNMFLeemOWCe6r8AYZ
         YB/sDip8DEBtcABjJEy4D36LrQmC+1+pGeb1C4V/ksTRrbBo6M+ugNMj2Iwf7WolbZHP
         cGTcp5jUkW9OXHpe6NYokuNREHK7WodDTrk0KAwjrJ2DC1KsbIc2kfGxBtnB0alvh7pW
         GxFA==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=KbS8Ap8h;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of alice.guo@nxp.com designates 40.107.6.77 as permitted sender) smtp.mailfrom=alice.guo@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=z2HXFxhASYX5Dx/epD/CsfEplPfUP0gxP65VDgHZpQ8=;
        b=pGPAh4HgKsYXjEyb0Y8d9FYHyYOwDnZKG95F/AuQapnnlAg0rOdmGemVfdHjTtJnQk
         CbR68xCDVseWsOVF/VNKFAUM30bWzVn5Ro5KDQZTsgZWfCIlfQJe4x8/BNmZTrfKrMVs
         jnyA8VCSNI3IO7Q0f3+5YfJJHBjQ5J3q6Pt0Cp93JAHo3nnPbkwlMcfD0H2xQi92UCEJ
         KSRjLBhwFz/ezD3dFYUAbMYgyksCaon3NC8juXxEEHsXUoeQEGn/lj3pIWQveHa2TP/F
         DLApIzXwQlgWjhk2pMfAquJvBTVmEwB2fxQi1LAIg+WlTiSqTsWvCk4O0cyFWuntUSx+
         qhfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=z2HXFxhASYX5Dx/epD/CsfEplPfUP0gxP65VDgHZpQ8=;
        b=JP7TX6JqzlId9jMpFQtqEeGzQ/04gZj40Il7jH7WSoXp8D82j/uvY2fQSVOPCYvTdl
         x00A+jIxnb85ZOHk0PxarpdePVNtw61KppwfGRlI1djgdcgGniRNmD0r19h0YqvE9VjN
         LNW7VwGzYpmK2KD1VYptZBJv28LLulojm41LH+rJpeJCbj8q6G4BLXeQpRgdgi+Rbafa
         pDYEMKsvRfR45y/VpT4U+3oFbkVGLJiA3gd4mQfn6E+AIefHKUaO7Whr8zulg273X6i4
         jPM2s0VzQbcqxhqvx1e4yLH++AuinLoosl6xvixJZbRzBI2aeQjstPGJVn3SAne68MKO
         F0QQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531eA1CeRQ5PRrHjxOeXn9+eCS57Qarg96U47LZQLMd19n8rbhmA
	HvLISlQloMrXU9Iwf7HMOPY=
X-Google-Smtp-Source: ABdhPJyJ1VHyQv0HHAUf1r+YJp4PT0stUijQLJjtCI59641Fblo/+/pUmalAibz9NPetEZiP6EpHaw==
X-Received: by 2002:a19:40c8:: with SMTP id n191mr1236914lfa.29.1600757165327;
        Mon, 21 Sep 2020 23:46:05 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a19:c7c8:: with SMTP id x191ls1453048lff.0.gmail; Mon, 21
 Sep 2020 23:46:04 -0700 (PDT)
X-Received: by 2002:a19:420a:: with SMTP id p10mr1219327lfa.513.1600757164223;
        Mon, 21 Sep 2020 23:46:04 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1600757164; cv=pass;
        d=google.com; s=arc-20160816;
        b=O23gKz0zW8b/CYJuZdtI6gLtYz8n+4LHEdLanINBOa+b92Wdcc91PZkyuzpDSTubTj
         KkgTXPMBnnGpMzdOfYDy+NRq1uXjg62mDnjNZV1zmu8bjj8rrhM2pEqM2y02A06LGNby
         9NCCz+BxbTejgrH5otUhCrB5YuAUnPKe5IG7PQn+26SebT7S6aGOE0IT19NcXuFiVWid
         NF90P9HMQpcaLamiwFzg/fMWYfpp4NMY6krleCkwSlPb01l43k7wqOZlApFIBqQEqzWO
         kR47LlVnrFZqqsQAYu+d5Us5kEuimMZiAWMzvcQGFVexgWURRy7AMRrUPp6Cc4X1+V6T
         dF+Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=KApypnFq9NqKf6ZAoqcwK9+uRHwqoJZCQ5leOxlDijc=;
        b=ARiVKG5HlCILBKRPCWzvDVNUx8GJRqHmliO9THJ00Bc0MiGls63o9VxkKlL93qlPOT
         VqacHScqHbhUJBsS+yRG3N1uTT0fN5nyoidewKK4rLLMWDINWb4/E1VlvSM6D5oVvN/2
         l6hr4fUftQ/j6csoE4OaT5r4yplj93/2U9uIHGcQ+YszV85jBLC0abyBkKheQ/3KcRfN
         AJbROpDD0dF/dzlYqsLpKxHj8IUvEWVejPyMV0H+CPtfIPuA7Pni2Oq1iwkPItthfkNP
         IcQueeqTNo2y9oYMx2wALvBaJVvtvTxuJErGYXo7TGqds7gzBfPttHlIQVAeyiBu7wgl
         AS5w==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=KbS8Ap8h;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of alice.guo@nxp.com designates 40.107.6.77 as permitted sender) smtp.mailfrom=alice.guo@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (mail-eopbgr60077.outbound.protection.outlook.com. [40.107.6.77])
        by gmr-mx.google.com with ESMTPS id 21si277203ljq.5.2020.09.21.23.46.04
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 21 Sep 2020 23:46:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of alice.guo@nxp.com designates 40.107.6.77 as permitted sender) client-ip=40.107.6.77;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y4duoii+Ym0RVFS2Uj02Po4MV8e5U3rU6zUP6P0Pp1FqaahNZ8E0ZqBkYIjWQJrd9j9FYrEVXAkKp7y9eNgCKmHn2ejvRrIojPTaOOW4zfVtPtbPAeJLKH9AThCJy01wjJGgR/Xp/U0lQ6Kh29gRybiZq373ItwdydrJ61LIshon1JSj9gMW3h9TYluY6efxzFeXEcyUHcNQIgyaiV3+KjQVBiyd7tMmManTlWYWsv9lSA6/YZNE8S9yFlLgWNnsBUyfPCtiQmkH5LT5tuXiY5xSi8moPJY7DNPGsJhKvfkfU7WUH9Gm7hvMI5lRVUeAwUUEMJaBGR3VMQTRT7H+qQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KApypnFq9NqKf6ZAoqcwK9+uRHwqoJZCQ5leOxlDijc=;
 b=bH6162cvXnepvSCfQlbsaLBjJ7mGca0NReXxy9R9JOLo5tOJl4RTHxiwqU+p9mY9bJh1s9kqbM3xEFXjNuLJfYeVXhtK3HqGgBcwirLRGa5b0sFwumTRSOxZyTudzitd4cl7sC/bJ5kBj2w5NwRLpHAt6d7H4J+RdvAhmJJ1bHjTv6iCGZqIlQKcdPN1s3LL7CyjSo8+N3dUx1rCIZKtUPPrMmuzkQVDMVfB9m+FoDR9NyIMUfSsEx05CRRoc0JXxLGfS252Bmzgz1ieAcuFyWVRHf4/yPL0cq9CH9+6a35Acz7ftLYeRu4QYCtRspgkN1bWy3xkcRTYQJoBfmBYtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
Received: from DB8PR04MB7065.eurprd04.prod.outlook.com (2603:10a6:10:127::9)
 by DBAPR04MB7415.eurprd04.prod.outlook.com (2603:10a6:10:1aa::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.19; Tue, 22 Sep
 2020 06:46:03 +0000
Received: from DB8PR04MB7065.eurprd04.prod.outlook.com
 ([fe80::ed87:8435:3012:9618]) by DB8PR04MB7065.eurprd04.prod.outlook.com
 ([fe80::ed87:8435:3012:9618%9]) with mapi id 15.20.3391.027; Tue, 22 Sep 2020
 06:46:03 +0000
From: Alice Guo <alice.guo@nxp.com>
To: jailhouse-dev@googlegroups.com,
	jan.kiszka@siemens.com
Cc: peng.fan@nxp.com,
	Alice Guo <alice.guo@nxp.com>
Subject: [PATCH V5 3/5] core: provide macro SET_FIELD
Date: Tue, 22 Sep 2020 14:45:40 +0800
Message-Id: <20200922064542.26274-3-alice.guo@nxp.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200922064542.26274-1-alice.guo@nxp.com>
References: <20200922064542.26274-1-alice.guo@nxp.com>
Content-Type: text/plain; charset="UTF-8"
X-ClientProxiedBy: SG2PR06CA0223.apcprd06.prod.outlook.com
 (2603:1096:4:68::31) To DB8PR04MB7065.eurprd04.prod.outlook.com
 (2603:10a6:10:127::9)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from nxf55104-OptiPlex-7060.ap.freescale.net (119.31.174.71) by SG2PR06CA0223.apcprd06.prod.outlook.com (2603:1096:4:68::31) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.15 via Frontend Transport; Tue, 22 Sep 2020 06:46:01 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [119.31.174.71]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 0d056770-08a6-46d3-c57c-08d85ec32c32
X-MS-TrafficTypeDiagnostic: DBAPR04MB7415:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DBAPR04MB7415B367A2CEF67850DEB393E23B0@DBAPR04MB7415.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1417;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 30j+Bv01gseyimYBLe9ZCDiTHnNfRwmY33kE/mYKa+3oEQl5zhowZg8xb+fa91U4kk4t0OQoWgblzEX9kvyfaBIEtowH1enmtLJA7X6CcJSKKzlT918wRt5KKxf2w2Z1K3BLMYQdytRoA+KZwz81TlIO0V7DHQXrafB6MCYN3V0BFVmLLGGCcoWCT5UXhF5svDEG2KF1qEs701rmyhhL8FNgNBOyZlP839u82T43fqeIju19Yn5PwSP7U3Q+IOlszbqqhQZUjHKHGapUKdH47WPytqJnoiI+cxQxiNhRepPuzmQrDAlFg0ysztyBYYn6AK+aqwaP328wW+PrDEgG9Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR04MB7065.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(376002)(136003)(366004)(346002)(396003)(26005)(66476007)(66946007)(66556008)(6506007)(6666004)(186003)(16526019)(4326008)(52116002)(36756003)(316002)(2906002)(6486002)(6512007)(8676002)(4744005)(2616005)(1076003)(956004)(86362001)(5660300002)(44832011)(478600001)(8936002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: VXMU9ftB36gXUAeMZsCkLs9pyr32F4x1+IwxD+qyzz2nlt6g5NOLDupD+H88ATOiA58dvPi8vfh6WFN8zp1XqXfcP2YBP4gZuZA5jLYVoXm1lvBjjjo6tRP6wink8fn6mQ58DSUynOBoupUEyzVu8eUdW/fO1zKIcgbGe21LfaNmrmCvjQt+DY6vVs8h1nKYZty9eHts7CkJuVpwIm1VIUys66Ll4EXbTFJhpEmyaEqS1tD+wCSTVAIyjRsQhyepzJ4GLpiKqmkP4QXL6kkJThZ6jf4bo7BzyyN9EgXd1zAQO89Yc8u5WedeBrQzSQSq7WY/aRxNdJgsaJoPWCOLHDMqs2pw114wsVUQAPW/7kMB70wxwfVlrvx/W1TpQlztqbpjUzGiUgxo1BoHCBsU3SDbLC4xAyG+lxPR2PJTX5tPyDP1gPTST6U9CA3G5wzpP7H2euNOWQ7zPFWeOttztMjfx1PwYhJ1sKYInm1K7x1b0qFrs1Be31ru6S+iX8KlPJhs0JZYTRD0xFyjg7ejieTS3S1Y7HCSF3ewh0rCGX81F4zzwnbxARTkcrNo1t8FvmY0XMmiWdUefYqRVQ/Kx0O6hUvqdNbWW1FYUolwW8roOjFJUl7IFhPFRUA1q0A4G1BROUmEiA8/NiyJmhqBaw==
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d056770-08a6-46d3-c57c-08d85ec32c32
X-MS-Exchange-CrossTenant-AuthSource: DB8PR04MB7065.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2020 06:46:02.9508
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RKgEFsASe2C9Sc43KjtleuejLIiBebzNee6dTfn7BNLpDzoDpWf4lU69yQ/DBXS+Dc9C41RXh2RNIpbX4ElJwQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR04MB7415
X-Original-Sender: alice.guo@nxp.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@nxp.com header.s=selector2 header.b=KbS8Ap8h;       arc=pass (i=1
 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass
 fromdomain=nxp.com);       spf=pass (google.com: domain of alice.guo@nxp.com
 designates 40.107.6.77 as permitted sender) smtp.mailfrom=alice.guo@nxp.com;
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
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20200922064542.26274-3-alice.guo%40nxp.com.
