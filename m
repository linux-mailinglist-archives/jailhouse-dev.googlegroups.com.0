Return-Path: <jailhouse-dev+bncBDAMFR7JZAEBBQHA7T4QKGQEXPOVVGA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43e.google.com (mail-wr1-x43e.google.com [IPv6:2a00:1450:4864:20::43e])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D42624CAB6
	for <lists+jailhouse-dev@lfdr.de>; Fri, 21 Aug 2020 04:24:01 +0200 (CEST)
Received: by mail-wr1-x43e.google.com with SMTP id t12sf133276wrp.0
        for <lists+jailhouse-dev@lfdr.de>; Thu, 20 Aug 2020 19:24:01 -0700 (PDT)
ARC-Seal: i=3; a=rsa-sha256; t=1597976641; cv=pass;
        d=google.com; s=arc-20160816;
        b=Nl/1IvfWI72Sz4tV7DyhjDJivn6EvFxwYPOjFLsQE16qfqaqyaDnBRCngG3JsKlh2y
         px68wKahr02Zc6mZHtAIIXmCYm5TruJN39dtENX5JeXzfsWsq2kc4giAbJLCoE4VDbs2
         VskGlIGitLMUcc7ifzf/rT0nkK7XMcnddFpk1JnRij3ksYfoXh4kUzKVAFbgXKyETIFX
         eyqToQUx8zbyENmEIHWoHRjfn0+EuJljDn0hPPV6zh+wDQeQdZdMsOqPG5CKsCzseg9T
         2xsj9ErDwCgfqmlOi6AQLHGyqhDU13caQ/QAGMKvDP8CHqBSwVUt80DJJRmype4m5GbW
         dpYw==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=cdXvjv5ArvnaAZuJPbtp7zxB/TcNCs5HUL7mcA5lv80=;
        b=EQ/d1dWVEMBOQTjmiJYYt3VUSnzseBKo5m8sVS1hj1PE8hIzYvSoU40Xtrl6OUAeMf
         J9cLvXi7gEk8bgvXqQJuPd19Gxms4f7ROwPHxZAUAeQi3A63tmmahWMIE/FmRk+mKxMk
         +9ARiKdVCUrHJ/bDM4FRUotlMZKjcTtGRDTcK8ZyHMKoZHOp54S+4k22i5qjfrzuYP6/
         UeiAAfFQ0sgXa41T9ZgjKTXBt4lXdL/kGl2nsG/C/+FlzEJHzk2tw2zuZZaUiXsZMFe7
         0EunbgtzLvd19QIB9Uq7tPAjbqUGZ2Q3bMS5JXjfiVge5onRSi3Tyww/6noaNlHfMItP
         4pUw==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b="aWYPXv/1";
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of peng.fan@nxp.com designates 40.107.22.40 as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=cdXvjv5ArvnaAZuJPbtp7zxB/TcNCs5HUL7mcA5lv80=;
        b=M+DiAoicZSy2GAaZ6bLmASG6/gwLHFYRr3FGvUkz11RrWhZ8dAKIVZTftcttABv/WZ
         OJlmwFtD9JWtsI91UTBH8BlXkKRHqaN6wBXbwqq1/ocehyKh6kbajTCu4UJRhk65xvkl
         G0obTVZrabG+HF8mgIViXF27emQuOEpRaC7pswh6E+FxP9kaZJyMLr7u6QRQ1DqR6Flg
         iCsJ2JKwOwvETd/dIS2jFX2vuuJ60bDJ34JLJ5NoQEg6EW1ymV4laQfwxNiA6lYGVfKk
         J0SHpjuPFNOD7YSfH8qXH4gfpEBpJ5HwHwYPpII/eFc3eWBSbzk/1grqls1xBAXHQo6k
         h7UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=cdXvjv5ArvnaAZuJPbtp7zxB/TcNCs5HUL7mcA5lv80=;
        b=EZ0WUnf6YUp5jU0w8c4krR4FQH1MWECYKjN2a6ZOX73naaphH2RzGKGpKZz1Bn0pC4
         I4PvJHn3ORUG7Y+M3o0FtZaWvivDjT9KTKKhm0jPbBliadFpgkrOziukR+4POU1Hrmxk
         nh1HfrWFojhf41od4sHdUc7YVQt8cbn8Z7BOwEF2d81ZoOsl7GApTXnqmsKNmKgyaQ+4
         JpAhdoH9BV62fj7LM8/yU1jBNGm6W6N5NQcdYUY94k7hoGrlQwpG/Kd/OV1BQYNI3Z/2
         o24gkn7Q2Vk/fYGahLQZGDB46yJv7QqSI4OkPd1QyXD+NvkntZRtPCaGQKCBmHKsS5Q4
         peCw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531SLKjSFRcZTjnNKg211JEOECkCUFAZxRB+QPv6ODDocxA2dHzp
	NJpt1uZGWwt4pAaLU96Ac9Y=
X-Google-Smtp-Source: ABdhPJxllyN2xTMzU/OkjmPoRRYxOZ9uKkVZggDZ3Q+Y8J8ghSmKA9MIX1EbBGVAg+4vDLLgFAVQyA==
X-Received: by 2002:a1c:6289:: with SMTP id w131mr1310708wmb.41.1597976640918;
        Thu, 20 Aug 2020 19:24:00 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:b1cf:: with SMTP id r15ls460185wra.3.gmail; Thu, 20 Aug
 2020 19:24:00 -0700 (PDT)
X-Received: by 2002:a5d:4746:: with SMTP id o6mr564705wrs.410.1597976640162;
        Thu, 20 Aug 2020 19:24:00 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1597976640; cv=pass;
        d=google.com; s=arc-20160816;
        b=e7OYJdKevw19aKL62f0Sz2I4P0x/0ImFDKY+S4+YSQU1WJMoLRLC10ykeXTFwwd4LD
         hCsxBqfGCr+tLsi4ycuud0ntwf2ExHjlmBKUNPLJfDVIywp6sy0UIHCN2QmTRPovbvl+
         oo2dutwu/2kfJMxkUYL36a8DhZ3jKiM2NQGqx96RdQ2iWoip6yiqMh6XkGxP5D/04c7o
         jOM17zdqKS7svfxFU0n4T4heuFyeNLxHiDdtdP9uu08ykP8hwhsTJJQhFAzcz//sEDeO
         F2G71DL6qoylDaSf9OT3xuJhMpaQkGLOC6FlGcFA0D+4krnobfNV4Vb+kVCdCiwEfLb2
         dVjA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=XTu4d6rVkYE+6RgNIqB9BMMNAG6vy7uZA4+Ttq4nmMY=;
        b=cmnI+FPI67yAPBnGgrQpLRSfgmoC8kD+4dMhDUVD7Tj1OtygAxQouDgkE7B1OrM1Ww
         arxcUTEmILevJc9Omsfk4DcAQV5T0AfDqjsoC+7qo7t+R5HljCoIA8tuR8l0nya7XbRu
         7+ljEjr8iGsK5QTJRHBs2H6LASTlnPomIG2maL9PDPmEZsTdBo6KIAdcE9+qkmKW/pz4
         vPfb3mtnvfBVGQxso+Gde1UZvfjrNviBb3nfMkpIWi9KgqQTA5IhjcnuoGgwv82uUKyu
         9INDZyzzZPfpJy9vsApu73lCy03xQ7SfxXuuNFp98Vyef+ez93JCF8/DIVR8D485drcq
         Ls7A==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b="aWYPXv/1";
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of peng.fan@nxp.com designates 40.107.22.40 as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2040.outbound.protection.outlook.com. [40.107.22.40])
        by gmr-mx.google.com with ESMTPS id w6si22333wmk.2.2020.08.20.19.24.00
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 20 Aug 2020 19:24:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of peng.fan@nxp.com designates 40.107.22.40 as permitted sender) client-ip=40.107.22.40;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h/CncpIYu87hzRPO8tOEE4szqbGCWMon7kHLWWjBeT6QMUgvM0T+Q433NsqDVeZ1LIXASlwc/iM63qco8Tswmctqwew+aMfrpIho8bRPbVxqpu+z73nSun4g+hzOmguzSDsP9g2n7E/Ru1dvtUO1FfOfGJBSI/RvAa5wGTFQYOk7U27UsBcIK0p0WudiO4M7wmKUd12oFaKUoN3nZuuGAel0PD/J3EWcttRE1ocpPjmT7YNpsfA/jqApP9PZ3jAZv4B/qQjdBkCqvrcmvvMzQCYTWjInGaIIGwMx309gInabtJ2V30CFBuElQWLZKg5YT1mY7nky5D7Om4pPfVf8uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XTu4d6rVkYE+6RgNIqB9BMMNAG6vy7uZA4+Ttq4nmMY=;
 b=a/B5rpvCWTl/Q2+VNST2jHYv8/DO+c6X+1/IUm3nCNWMLQR51O+yw//WCOSFzTeumMbNAwiI+yu6MgqImAIBj+1idQmgjOP7tqeBNiJ0oZ/3FgtZ1DnSVbOBMxSXUKB/1yrZuqWUn9r/UU2G55bMCip6XtFlNoAYN9mfCLJhKYI1PWnGU265iTpbWocPuCN+XI/7TRTToOzEv+j10IL/Hvnlbt38JIZegBwjMO+EnRYa8txCBPQXNW+XaWr1//pH05QTdlbk3WnHN3nz1xbBoQPMyl0IsnY7cIihFQ7RMBGNaJYJdGO1Wj6gZ9jq9vdhNAvD/MoZx3FgCGm53KVxsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com (2603:10a6:4:a1::14)
 by DB8PR04MB6620.eurprd04.prod.outlook.com (2603:10a6:10:107::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.25; Fri, 21 Aug
 2020 02:23:59 +0000
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::24d0:f783:3c7d:e232]) by DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::24d0:f783:3c7d:e232%12]) with mapi id 15.20.3305.026; Fri, 21 Aug
 2020 02:23:59 +0000
From: peng.fan@nxp.com
To: jan.kiszka@siemens.com
Cc: jailhouse-dev@googlegroups.com,
	alice.guo@nxp.com,
	Peng Fan <peng.fan@nxp.com>
Subject: [PATCH V2 3/5] arm64: allow accessing simd/floating-point registers in inmate
Date: Fri, 21 Aug 2020 10:49:19 +0800
Message-Id: <20200821024921.3075-3-peng.fan@nxp.com>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20200821024921.3075-1-peng.fan@nxp.com>
References: <20200821024921.3075-1-peng.fan@nxp.com>
Content-Type: text/plain; charset="UTF-8"
X-ClientProxiedBy: SG2PR02CA0038.apcprd02.prod.outlook.com
 (2603:1096:3:18::26) To DB6PR0402MB2760.eurprd04.prod.outlook.com
 (2603:10a6:4:a1::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from linux-1xn6.ap.freescale.net (119.31.174.71) by SG2PR02CA0038.apcprd02.prod.outlook.com (2603:1096:3:18::26) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.24 via Frontend Transport; Fri, 21 Aug 2020 02:23:57 +0000
X-Mailer: git-send-email 2.16.4
X-Originating-IP: [119.31.174.71]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: eac998d9-4f1f-4d6c-07bc-08d845794323
X-MS-TrafficTypeDiagnostic: DB8PR04MB6620:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DB8PR04MB66200693F85C863E41D86B2A885B0@DB8PR04MB6620.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XGEs6//vx+nv5Y/5fvCmPigiwtXkCh8dB9ilCAQ+J+IbD3Jv/hOX6302jfYmYx2TL0X0P+ctYIvFQQYnoVW42lvuaKFsN+EyH8lieVYiLn5xoG8bU5xDYsWaM6YZ0GimHPgMofQZujBcpf5eERxR9NlnpGVUk5jG+t1A8k97+R94DThyFf2g6+mIi2cvgj9ZeDn3z04cv9DHoBaDLCWB83dFk+4vNhn7c5sNFx0vufs7xx+5vUe8X8b6nWyyZGhr0BFU+dhgJfLtdUv7Mbq2yTwnEElBDnxfNgLBVLUZo9ISiGm4lG9F4tqAbRGjT0BK1LFIuk2LGKj3X9ZIl/ZN1g==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0402MB2760.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(346002)(396003)(366004)(376002)(39860400002)(6486002)(6506007)(86362001)(26005)(52116002)(36756003)(2906002)(5660300002)(83380400001)(316002)(478600001)(16526019)(4326008)(8936002)(8676002)(9686003)(6512007)(6916009)(66946007)(66476007)(66556008)(186003)(2616005)(956004)(1076003)(6666004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: YPI6jcLGOEH+JPXs+t4WkVSoyRZ+f0/EQ03zOLSGRVXy4ioLPh0w3xzX36ZmQWI1HW7gGUcr0HmpT8bW+DhDeUiGGAklu1v5gBL1eiT5oDesjYDdPlrpVLVn4gGucuPRNKA1Ok3qskICekydtozZ6RPcHwrn3/Lr033iKmGe1tfB/3tGYGaSRqEQ6hFeb0IBmYZxEiL5A0Ng7PGqsrRFzXPhezFLOswCMGCdhZW1tRmF6JV9SK0a+LN38dooqp3L83pjR+oWv7O2IjfnG9tZVlwODoB7/c0YNFZ8B5zark5CLTrWLhW4ZI59FhDpa0+zFAn4gddreIrOCtzP3zBLL9kAHVuQ+j7DRMsAN5wiFvASgHe3ZPA1Zc7TAdAVHY9vFS1KJAt0JksiRkcaCzD20w3fT4hSSF+QdPGFgv0SZIAbB5CO/0wpdoGhaT679UdE1TMqRM9skPp5mAm+H9ubseR7N6MqXiUAIxbFAzWpUSEbJtFa0EZyDJwsRvpgTh20+YLkpqiAIOyhOqR6lmiaSZEm6fMsKXjUNl+kckfKCc2ENltAE+K0XcY1AcE4ididtZ3TeQdGXSm7tGetMZQimbdsFpI8M5PxShyC1O0wUilfSnEe18CZcNp7wSGbTIryGJxD3eH/R0Hw9oYrs3Ci0Q==
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eac998d9-4f1f-4d6c-07bc-08d845794323
X-MS-Exchange-CrossTenant-AuthSource: DB6PR0402MB2760.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2020 02:23:59.4782
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2OB5W/qBySL8HPvBAv50vCszx2tnjjkxzYjuZiwAKIwr/tsgf08mEP0SD3RPFDqsmhnqHAsK6weIimK/XQmRbQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6620
X-Original-Sender: peng.fan@nxp.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@nxp.com header.s=selector2 header.b="aWYPXv/1";       arc=pass (i=1
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

Set bit 30 of FPEXC32_EL2 to enables access to the Advanced SIMD and
floating-point functionality from all Exception levels.

Set CPACR_EL1.FPEN to not trap accessing to SIMD or floating point
registers.

Reported-by: Alice Guo <alice.guo@nxp.com>
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---

V2:
 Add Macros
 Use u64 for fpexc32_el2.

 hypervisor/arch/arm64/control.c             | 7 ++++++-
 hypervisor/arch/arm64/include/asm/sysregs.h | 4 ++++
 2 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/hypervisor/arch/arm64/control.c b/hypervisor/arch/arm64/control.c
index 7bc3cab1..cd90b5fc 100644
--- a/hypervisor/arch/arm64/control.c
+++ b/hypervisor/arch/arm64/control.c
@@ -21,6 +21,7 @@
 void arm_cpu_reset(unsigned long pc, bool aarch32)
 {
 	u64 hcr_el2;
+	u64 fpexc32_el2;
 
 	/* put the cpu in a reset state */
 	/* AARCH64_TODO: handle big endian support */
@@ -43,7 +44,7 @@ void arm_cpu_reset(unsigned long pc, bool aarch32)
 	arm_write_sysreg(AFSR1_EL1, 0);
 	arm_write_sysreg(AMAIR_EL1, 0);
 	arm_write_sysreg(CONTEXTIDR_EL1, 0);
-	arm_write_sysreg(CPACR_EL1, 0);
+	arm_write_sysreg(CPACR_EL1, CPACR_EL1_FPEN(3));
 	arm_write_sysreg(CSSELR_EL1, 0);
 	arm_write_sysreg(ESR_EL1, 0);
 	arm_write_sysreg(FAR_EL1, 0);
@@ -57,6 +58,10 @@ void arm_cpu_reset(unsigned long pc, bool aarch32)
 	arm_write_sysreg(TTBR1_EL1, 0);
 	arm_write_sysreg(VBAR_EL1, 0);
 
+	arm_read_sysreg(FPEXC32_EL2, fpexc32_el2);
+	fpexc32_el2 |= FPEXC_EL2_EN_BIT;
+	arm_write_sysreg(FPEXC32_EL2, fpexc32_el2);
+
 	/* wipe timer registers */
 	arm_write_sysreg(CNTP_CTL_EL0, 0);
 	arm_write_sysreg(CNTP_CVAL_EL0, 0);
diff --git a/hypervisor/arch/arm64/include/asm/sysregs.h b/hypervisor/arch/arm64/include/asm/sysregs.h
index 56f0ce0a..378fecd8 100644
--- a/hypervisor/arch/arm64/include/asm/sysregs.h
+++ b/hypervisor/arch/arm64/include/asm/sysregs.h
@@ -163,6 +163,10 @@
 /* exception level in SPSR_ELx */
 #define SPSR_EL(spsr)		(((spsr) & 0xc) >> 2)
 
+#define CPACR_EL1_FPEN(x)	((x) << 20)
+
+#define FPEXC_EL2_EN_BIT	(1UL << 30)
+
 #ifndef __ASSEMBLY__
 
 #include <jailhouse/string.h>
-- 
2.16.4

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20200821024921.3075-3-peng.fan%40nxp.com.
