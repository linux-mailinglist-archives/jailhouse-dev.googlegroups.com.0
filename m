Return-Path: <jailhouse-dev+bncBDAMFR7JZAEBB26L333AKGQEYENATZQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ej1-x640.google.com (mail-ej1-x640.google.com [IPv6:2a00:1450:4864:20::640])
	by mail.lfdr.de (Postfix) with ESMTPS id 619E41ED0CB
	for <lists+jailhouse-dev@lfdr.de>; Wed,  3 Jun 2020 15:30:20 +0200 (CEST)
Received: by mail-ej1-x640.google.com with SMTP id a20sf775791ejt.19
        for <lists+jailhouse-dev@lfdr.de>; Wed, 03 Jun 2020 06:30:20 -0700 (PDT)
ARC-Seal: i=3; a=rsa-sha256; t=1591191020; cv=pass;
        d=google.com; s=arc-20160816;
        b=pC+ltpztOfi5KlwT4YEt0ZUCvSankbSeWQ6psSATW3Kakse6dM72HXaXJm0vT+VGaU
         fjjm6P4mRQE+dSqChM6b9XO1ee7SozsjAhjx4RyRAQGYxaeXt7sjskXRplw83iOxkG61
         kcJE5TN2VAff8ihb67UBhFzGkYGzwcF8HCWsm8EQ4jF455LuUzmlaq7Yl/yKoVXKcis6
         suOjnhtYhdUlMdwTdFAkzuFjeoLhe4quBNptQiuYukOGOCM/kAc8W5ALwtS+bGVjhIfH
         eKIj9UV0XQjhHzjsL0WSdKFYjJpbUBbr8skrtN2iqCmc0FjAhvB+Cp1nK8rCXJtwvpiM
         26jQ==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:message-id:date
         :subject:cc:to:from:sender:dkim-signature;
        bh=MIb2qiUrDo5tTEDCLX7cpv764PHsE744wTfuELW/7xY=;
        b=AjBisEXbInBq6fJ9dxCVluGqpLIRceUAyMdHkRb8amLl/RZSsVoTdR5EHl4g+bItoH
         WkJDv1PQl6aMBwzP6OwMuCPNyyWeZ3TqQwwRaBQ3JIavx9YseyHMe2TBIY3iBDKpV484
         +i+YaABcWh94ZtrouKCaptBvklrnXzDl4bbT+jYR67sN+HTLVIcvSTTzthVKvqs5lF+5
         fp7NqAR6DgrBtYfII6qnIugygv76nq8OKUq2hjZlz3J91PkGjzdp7Xy3BqHuz2zntpL9
         25RQtH5XZl49atUqN1XIwk49YvYx5a7z0PmV4QdD+3CIiVWEg/PAuf1wjAgvFUdspgu8
         EVYQ==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=sMdBtyFD;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of peng.fan@nxp.com designates 40.107.21.86 as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=MIb2qiUrDo5tTEDCLX7cpv764PHsE744wTfuELW/7xY=;
        b=U2cUTXmNFkSQukLLowasjsBBAiRxCneOyywkGL3KxBQjqSDxfI6jxP/B4ugnE0lk14
         PGv4wVuaokBACNysYdIPTZBxDOipnJ0bjg0YGLc3n5vi4k9bsb3Y0dSE9Iohx097YEr8
         5/+hCv6Pvt3rDbwGAJJOcXp4B/GNaw3cx736n3Jgd8akM5zaCqvx9DYT8g+zNbFr3LOm
         Jfn+kCUVxmJis8ERbVZsi9ZkLZ3RtUl/vwlqJm7SHzvaybiLeYGfslvyvg4fM7QWdOX8
         rF6AmOc5Gp69E2BBCfDoCuuCvDukOIopY2cgU/canTnKld2gCtBvAp4S3fOs00F7PZnp
         caTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=MIb2qiUrDo5tTEDCLX7cpv764PHsE744wTfuELW/7xY=;
        b=nFrrCjOgrf7D184KLIZwroXLEqNGaHdB3qM6o1gqAROtOlucZki1bPK/fqZzvmkIV0
         6DkPOOy44Tb2r+3I3nHDixOY+nGR40sSGuyVPZ9b/V+4J53w4iT5JsuPCZPxsKqBitL/
         XDlxE5wEl4w1KSaU6CpEQYVQvnFxyf9TooxNgc7P13ws7AftbA9iQO29VZA6Z3RDjNwL
         8Nt/JPmBhp/hteIshKh+H9H+mOhjGRwK/AsWBSJx2onz2sid0RxdCYFBcYaly/f+pNBz
         MrHqXFfMLX2MA7ygrRzMsxG6H/Le2evcnb92XuT9/P+7iIH7r9PartZbypCeG3YTdLJq
         oIlw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532z/BJKh5uAq/ftuuwDSTFrJUxN5XPGcdD+18AKtFpNTXtzFW1i
	vgi6Fp0D2qsfHifQ3xHgWek=
X-Google-Smtp-Source: ABdhPJxxK+VrRGIAK+YTO6fVgdduybrYvl7dpqfYeqtYOMTFl/taRMK04xbDwGTImru9OA+xG3CYjw==
X-Received: by 2002:a17:906:7848:: with SMTP id p8mr28885756ejm.244.1591191020072;
        Wed, 03 Jun 2020 06:30:20 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6402:1004:: with SMTP id c4ls2470452edu.0.gmail; Wed, 03
 Jun 2020 06:30:19 -0700 (PDT)
X-Received: by 2002:aa7:da17:: with SMTP id r23mr8106624eds.261.1591191019260;
        Wed, 03 Jun 2020 06:30:19 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1591191019; cv=pass;
        d=google.com; s=arc-20160816;
        b=bd0Co+Lcn1wkauiyUyqu09rLbOS0Pk16cw/gmIjsLpI5QGF1ZkoGmCFkQtW9cj2TT5
         uhjnGjH+15xEOav2ZAoY7CBKWYn18UCrKgSyVAKxzai64bv12+EgqVT3JleqB6Q2NCcz
         NmfyMyJLz8xep4U4LtbiExaJO14MD+aReWujrwwUrm/OFpv+Nm+LvC8JXjFigjwQ0QON
         gnF0BfcYxbVao/HdMnLyE4x6L4FSr4KAK7SW00//XiJXw9qmu7vLwfwg2cdAJxeqxxdX
         /w0OGYFtg3iyKXHnXLcsWOineni3uPu8MmM59f9LRVy6PKgqfUwrOinMBDDm+Nh1Dj1N
         eI+A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=XFQE7VYWjvSIzahIgLpbrHq+BQ31oa7txfn14DAqh2g=;
        b=ZXFwiUO9AzxGKEPy7o7kGdQ2+NvN9Ro6C79R0RCgG2z/F/9nB32Bvpqg5ERINbBilt
         iokufLzf++kGjzNh9Y/nsk1MEm67NLMrF9JPeNHvWS4h2mANChmxmmRdHq88lp6m//Qn
         AbtX+1sAjW3Ln5HjB78eteAhQKABTdeSyQ3tG8jn7CvTjG2LW6DPdKU/c8k6z4cT2NSN
         /WC6Yx7n2ZXr9DsNBLXk8w73HKjH6jeP0Q6fMWDN4YZO4uBtzqMflh3qU8YGonDtJ+fy
         QMEKOTbTiT6A4uDL4yGF/vKC8v1bRShpq0/wDrtTiy4N/DOGhuFhZLzDKVj2mPHboYZs
         oHOg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=sMdBtyFD;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of peng.fan@nxp.com designates 40.107.21.86 as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2086.outbound.protection.outlook.com. [40.107.21.86])
        by gmr-mx.google.com with ESMTPS id m17si129047eda.1.2020.06.03.06.30.19
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 03 Jun 2020 06:30:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of peng.fan@nxp.com designates 40.107.21.86 as permitted sender) client-ip=40.107.21.86;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AVcgICL/8RW2eyRFYOqDgJAdYcmXbNf4nsFc05lC+pQIhsR4jzLImoZsUgXfiwgYLF/Jm++g+wwdrinrxz4j0Vi0DZ4x9ywevVM0UvgWnEp5tmK5cWHA8PnVJMjL+iE1uxk2S3G6qs0ZXXtoH+4/rCRtaXoJ5Nl6qw1H5lXcEYTAyQg/bRg9fcf77OT5XAPMEDtE//iEjY7Oi4j8pC+IfG9BsGLPEZ197FxddG1e9ApFx6BgQ5UgF62HupV4VnXSQw+sFr/ooafgGiUHVesDAS7M7YP+6ZfhzamNZkdg+hrM05BHBkGZxUhwbNEG1gxqHLhy1k6baJ2858KJujNV6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XFQE7VYWjvSIzahIgLpbrHq+BQ31oa7txfn14DAqh2g=;
 b=MtErav9xmFOLO5XV/a7oMYgt7yM5FppBcH+5wnkjSa9arSd2EjYmimrqLifYkBP+rwcA7F54ITgUMb8zftaYYM/R7SYnU7YvMlDnLvS9PPKFAUhX5puu1SFW/LY8bJIuNaVgF6px4sbPP73vw7T9u4ZK8RI7qtcSLmrpvijoHb1urJweFs1wYUBWxs8mzenBV+ewdU9WcP3k7VSCo7eragKF3qMpSH+12bHRNWIxS4BfLHaED7bAfo32DU2Bukr3fQr+KAMUCXV+p9P/u+R6tkJZg5ComrqJqUzkeGjku6+AXwPt16XKJrMU+IODhjqR4OkkH7cKBvnnHDhCp1/Hkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com (2603:10a6:4:a1::14)
 by DB6PR0402MB2853.eurprd04.prod.outlook.com (2603:10a6:4:99::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3045.18; Wed, 3 Jun
 2020 13:30:18 +0000
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::d17b:d767:19c3:b871]) by DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::d17b:d767:19c3:b871%6]) with mapi id 15.20.3066.018; Wed, 3 Jun 2020
 13:30:18 +0000
From: peng.fan@nxp.com
To: jailhouse-dev@googlegroups.com
Cc: alice.guo@nxp.com,
	Peng Fan <peng.fan@nxp.com>
Subject: [PATCH V2] arm: irqchip: fix irq_bitmap setting
Date: Wed,  3 Jun 2020 21:54:00 +0800
Message-Id: <20200603135400.2330-1-peng.fan@nxp.com>
X-Mailer: git-send-email 2.16.4
Content-Type: text/plain; charset="UTF-8"
X-ClientProxiedBy: SGAP274CA0024.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b6::36)
 To DB6PR0402MB2760.eurprd04.prod.outlook.com (2603:10a6:4:a1::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from linux-1xn6.ap.freescale.net (119.31.174.71) by SGAP274CA0024.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b6::36) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3066.18 via Frontend Transport; Wed, 3 Jun 2020 13:30:16 +0000
X-Mailer: git-send-email 2.16.4
X-Originating-IP: [119.31.174.71]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: eeddb817-7f79-4e71-65f0-08d807c241c3
X-MS-TrafficTypeDiagnostic: DB6PR0402MB2853:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DB6PR0402MB285333486FB8EC530A7684A688880@DB6PR0402MB2853.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-Forefront-PRVS: 04238CD941
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lNLy+6rOZjyZ88evXUgdyIVbwNc3Jc63rex2vLwCAU2OINr5z6oTkc6JYzpp/SANs5KcEccbuivS8dy6HMMegkKeap+muAvdEsWhqDSJU5PXW/2NLwS5Y6P+q1qNCFPcjxRFcPVuzz++hh+lLkLMNoScNoO1C+CMP4i6JZOKcMTVyNFnhqZziK6xur4nR/6nl7LE70NAqSirGCe/8Ze/FDsw7yR1iYhQaC2PXkpOwfDVGWyw1wuqxyLnymKrF3KSnxC/ZJK+/Pakn5riHY49MxyzRynPAOqAKuYJoAM4X7Ijz73TyGo/qDZkdkVTHL4ovVNRRw85QuryFtpI3Ve5Gg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0402MB2760.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(136003)(39860400002)(396003)(366004)(346002)(376002)(16526019)(186003)(6512007)(1076003)(2616005)(956004)(8676002)(86362001)(83380400001)(26005)(52116002)(6486002)(316002)(5660300002)(4326008)(6506007)(36756003)(2906002)(66946007)(6666004)(8936002)(66556008)(9686003)(66476007)(6916009)(478600001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 6qGEi+hIsDsc0nC65CxxoL3hFmIYotLqlwYiR+F7hnocEwOuka/bpy6K8FQfiD29bu6J7TxoxHpy98iUNTtpt0cvdk54+pkfL7pPEVy8j1Qi9nkYZMmRlD2Ls/TmL2UXgze4JCcRZ2MGYDigOtpBdmOfnwXGWu/+68AgTvjpuUhu8w5zj48c1PNMYz+VNcjjAoNtzw7WyKeEXn3qc43zcwb7E5qfrbX7dpZ8o6CtZxeIStuLTyXMcvVJv8FTqDLuLuLnRuMsQ+Q0gcHImnhxWAuh2TQT2ghHNA+eeVlLA9lbfTntBj3QZIwxB0DVHm8amOwpx6pdwgUK99radt1P+kUkvBJiVGUH6UycazgL2l5EZKLgQNSFVqVzcMHGEe3f/qzrulBxLlD3WzBUHcdpS5kTj2Qk9wEubC2+pn0iXJrb5BIqcRE2RkTSS6AiySDcnUSDlQW/q7wgOk2RxHhQHxPR9KkpuXsq1fh0aVB1+A0K8lVvSw/cJORX1/oQRloA
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eeddb817-7f79-4e71-65f0-08d807c241c3
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2020 13:30:18.3468
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 65F8Z8fETNDp05ky4rLO0PLioucSis9jdoDaKlqcdeaER9uquAcRhmmfR8ADkQ7dDnK8abhZhcMoljivTzpgwQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0402MB2853
X-Original-Sender: peng.fan@nxp.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@nxp.com header.s=selector2 header.b=sMdBtyFD;       arc=pass (i=1
 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass
 fromdomain=nxp.com);       spf=pass (google.com: domain of peng.fan@nxp.com
 designates 40.107.21.86 as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
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

There is a implication that the pin_base in the cell file
should be "32 + 128 * i" with "i >= 0". However there is no checking
for that. Pepole might choose other pin_base, such as 160, 224 and etc.

Saying the 1st irqchip pin_base is 224, the 2nd irqchip pin_base is
160. When irqchip_cell_init loop into the 2nd irqchip, it will override
the settings of the 1st irqchip, because "224 - 160" is less that
"sizeof(__u32 pin_bitmap[4])", so to make things simple, we not enforce
the pin_base must be "32 + 128 * i", and make the upper example could
work is to check whether pin_bitmap has a non-zero value.

Reported-by: Alice Guo <alice.guo@nxp.com>
Tested-by: Alice Guo <alice.guo@nxp.com>
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---

V2:
 Drop useless checking

 hypervisor/arch/arm-common/irqchip.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/hypervisor/arch/arm-common/irqchip.c b/hypervisor/arch/arm-common/irqchip.c
index 847758ae..d1a89359 100644
--- a/hypervisor/arch/arm-common/irqchip.c
+++ b/hypervisor/arch/arm-common/irqchip.c
@@ -421,8 +421,10 @@ static int irqchip_cell_init(struct cell *cell)
 		    chip->pin_base + sizeof(chip->pin_bitmap) * 8 >
 		    sizeof(cell->arch.irq_bitmap) * 8)
 			return trace_error(-EINVAL);
-		memcpy(&cell->arch.irq_bitmap[chip->pin_base / 32],
-		       chip->pin_bitmap, sizeof(chip->pin_bitmap));
+		for (pos = 0; pos < ARRAY_SIZE(chip->pin_bitmap); pos++) {
+			cell->arch.irq_bitmap[chip->pin_base / 32 + pos] |=
+				chip->pin_bitmap[pos];
+		}
 	}
 	/*
 	 * Permit direct access to all SGIs and PPIs except for those used by
-- 
2.16.4

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20200603135400.2330-1-peng.fan%40nxp.com.
