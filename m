Return-Path: <jailhouse-dev+bncBDAMFR7JZAEBBPPA7T4QKGQEICXWFBQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23d.google.com (mail-lj1-x23d.google.com [IPv6:2a00:1450:4864:20::23d])
	by mail.lfdr.de (Postfix) with ESMTPS id E0C5524CAB4
	for <lists+jailhouse-dev@lfdr.de>; Fri, 21 Aug 2020 04:23:58 +0200 (CEST)
Received: by mail-lj1-x23d.google.com with SMTP id d2sf146227lja.18
        for <lists+jailhouse-dev@lfdr.de>; Thu, 20 Aug 2020 19:23:58 -0700 (PDT)
ARC-Seal: i=3; a=rsa-sha256; t=1597976638; cv=pass;
        d=google.com; s=arc-20160816;
        b=PS/1PF/LQR50g+z/+d/tT3lDePsANJRWdNiZBQz3iALs8k26dfXCbQnzYhj76wNvCs
         m6HHea2PMMeFm+xsIPP0j9Wa+ffJY0EWITtG/3APb/yZ9NoKSDCY7MrMbiAgfQprCyoy
         J5m0b5C5ziGHyiJozfQaDJXSz5l59SNSwfWA8PLa8Ud9O1BpnSsRHs7vGgnpBAuxZDjP
         BLc7QQtiW3twh/qbDubQ+VX1e/qFkbBne2Ktt4KuGCQpkX/CnODdh0gpXNDSuRm3kcgx
         e1k9yFLYSxFg5YEQZSFDVxolW2BrrovCy+XlRlNL7cm1qU6A5NQS33vICaL/V1hAuwd2
         gWjg==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:message-id:date
         :subject:cc:to:from:sender:dkim-signature;
        bh=AH0evThk02sYsWSn5CIkD62Wby3Y8ynRPVRB9/iXJWM=;
        b=z9g0o5oK9C1itCNSO8gnUQT2VYwN0tcFKwYPsWFYSZ1E7tYoYK41lJD7BfJIPMDZm2
         evFuYc0chMG/q6aRujoIn4VUhtGEO65F0Jnyu/OuDXciRJV/GaIAVsE0Hgv+QV+/38KU
         r8lwYKqkHl9xfpcR4E1go0XDr98LlQZqsVSLcygFplDI0q7iRNKLsjNerFYp6IFNfIuT
         Wzjf3JFeqFzPaIWJj59++JSwvu7W3Gr98zTObniroyCLP31apB9KRGNN5shIWC9Fsmhc
         lC3Onw1ogNXOu0wtYnaeg66N5JoFz3qpVwBzkIqq87n8bH4XlWiROfD2KG+MHbLLW/uz
         PxrA==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=BYWjlUVx;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of peng.fan@nxp.com designates 40.107.22.71 as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=AH0evThk02sYsWSn5CIkD62Wby3Y8ynRPVRB9/iXJWM=;
        b=tNGtskfV/Ya2RJCDuWNaI2ygCeNZXRAXNcxQM6EaUMgf9BoQYpGsK0NFoYs0AFGPuQ
         mutwff8XriO04cKuNAdF63kqE6oLcTt2Rn4cMo1z36x6m9ZqP1EpKuRVT5NKOCNqqtcp
         bkaRhZHls1WWSTOtia5JZ7Kliza66MADoOT8YRM2dbiySRcwfSTDoYGc2F7/xHexzqsV
         q9/yghj4G+ehhr1CmY68VeM+TGsrPSOx1051uTDOd1dwTjVcgCHbMnYybZcTuJYD0I36
         LeB821B9XgFSQapVSPnFJI5aN6wK6brFuMYkRo33PFpSWwEnKdmUQxgAjrXQdr/aUQ6j
         TaDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=AH0evThk02sYsWSn5CIkD62Wby3Y8ynRPVRB9/iXJWM=;
        b=C7pMkrHpvQ4UbI5VWjT6JFCPCKLEh6BlAqfY4f3qrPctTEWuR2cvhL9VEwb2w6LNvE
         M6F53DNjQbp/1Lz7zVOw+ZgWiqFakbADa8RFtVcofzQ7MKImFA/Xwts+Vtdc0a4yCWxw
         QW1gV5hTHj6at3wZAPAwnB9PbMSXiaFGPLK9k07yhiqe/Hou1jV+n3NKicANvDvSYVIU
         rXVOI2ZyVAohEDoZi8I3mCFtQSvlouYDl3c7JpVQYtQzzSE6l1P2FvxQbTwnV79yadSw
         yBQDv6FU2s0zwmTI3xK13yAYghHMakR5JTFNGhiLy7N7WC8d9D61TvibQxXfkO8mib9W
         b2aQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM5322DfQEl8PoB+otRYVYUBVETgxYOt1y9jFGiOV4Ef3EwZRKMb/T
	9T4UmmUKdLK25Y6d5nYUjEQ=
X-Google-Smtp-Source: ABdhPJzsCkf2oiXXN5++ETltA2qryxQnduxY4L7uLeQ7emstbHH2rbdTCG5GmdL9QkssgsKpGS78Fw==
X-Received: by 2002:a2e:983:: with SMTP id 125mr429620ljj.32.1597976638309;
        Thu, 20 Aug 2020 19:23:58 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:ac2:5e33:: with SMTP id o19ls63171lfg.1.gmail; Thu, 20 Aug
 2020 19:23:57 -0700 (PDT)
X-Received: by 2002:a19:654c:: with SMTP id c12mr367439lfj.132.1597976637308;
        Thu, 20 Aug 2020 19:23:57 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1597976637; cv=pass;
        d=google.com; s=arc-20160816;
        b=c1mOC+4mwHFYcxoY4Uid+WQhnP3F6ryFHgAJVMr4ygkBDZJH58toXJfnhYe2T7hjEP
         NIv8hOs9SDbcIkQQNeh3s2ZXuIlEdCk5FJvC3Kv8Mi8d5Ne9UirwXSn8nli/R/02i6xf
         JSv+tvXX+i/K/YDzfWUdp/AKqLCCTniaNRErX7QrWuYLedt/M0o/paWEODyB8+tL3Iij
         9pQkT5ux8gEyRTNhfmTCY1uV4nFKiEbk1uCPyIVZ5WbUXKGwHkVTz+ydzUnHNzNp/UrV
         KemViSMr4Fei6L0i4c1KBXFiUEFh/v+hRqjhQ/ggPnY8FVyOJv4K/vAY4hPWrbgBmZb3
         Z/QA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=lFAtdDNyoCwwhSOHbRlzN+jVmZJXNboomkNllb0CYgU=;
        b=w9qm2sPq23T1KPBO7nnkdXi0qtsEuP99Y7akrFGeQWVwGap82rpngFFVfDv8mv4Ump
         5t3CDEn2yRbe0+av1gyCUnwRovxkgefRS87sGN5nXsUQiSr9uth07ARoWqB55yZ4oJLE
         3PF0g4XvqtvaMrZOP8UZUTpWASDa8OtpvHXXX+WYCu6STCFw6Ep1jiqbOg3YO34JDV63
         yojKJnNj9UZQp5Q0NdYeto5AsekT/THVS+Jt4fTKrajTOpAYSMaonaloTsG879ggpoXB
         0A81aG4xaROkBBssDG2VvCR7ycYR4IRZohwic6JbJT2m/kOw6H5ocymXhQmVBlyYvgkK
         LNqg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=BYWjlUVx;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of peng.fan@nxp.com designates 40.107.22.71 as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2071.outbound.protection.outlook.com. [40.107.22.71])
        by gmr-mx.google.com with ESMTPS id a23si17769lji.7.2020.08.20.19.23.57
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 20 Aug 2020 19:23:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of peng.fan@nxp.com designates 40.107.22.71 as permitted sender) client-ip=40.107.22.71;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E4zxOaZLHRbbZf1UImJgXWRRMZlrrf0D2V5c1/J1W0DDl3dnkrN9BQVABfoiaG8/XX6c6Ze/RP5BHukzSCi++j7qaNIOaa8a9heIWh2k8UQZmG+gwEByU95jNz5iVEjZPpU/vmuWk2iND6pzeEVlnmtvglxo9m7fLWWgXnfCwsFP0r63hiPjk+fYy1TUN3vX+yIfZ+mfwkvhF4D9N9n4UFP1yyz6gIX4MaEW6v959e0mPtXVre9HwXZJ7kpSqmkLv1fxuZ9BYE3xrsOontxLgrLoyi+9nBSdNFrf84x0GBbdqiqOnCXH/WHpqkSCNlgh7Bg9R6+uLQh6FzUhrFp8zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lFAtdDNyoCwwhSOHbRlzN+jVmZJXNboomkNllb0CYgU=;
 b=R3PjsAYcWAstLbMMaS9oe5ZlgAXoerV0In+6SIq2vI6MTT9cHXGNwIKg+k2MQssRL0q2iUDwRg4Bi/7AQCWelV8heUxyDoT9d3FbeqcgmYeorpgaS7x9Fo0i5NyrcRkjXnU4Kwd2O9z4lpU6woz4horfQLnPojDaRzgHVGLPuCBFCE2X2vGsyg5KXZ9orWs4LQpwf4zte1oSFFO47W/7NnWxNwHLzTX/k0OnYoqkozRWXRUaWOh9px4TOgdlpnHJyGiaYc/rWYB1W77FDyzm5EuDxk5pm03k+xaX2HuQauMBny+shSXMUNk0FBoos6XIVN8MbXfs0aS7L91wn1PaVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com (2603:10a6:4:a1::14)
 by DB8PR04MB6620.eurprd04.prod.outlook.com (2603:10a6:10:107::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.25; Fri, 21 Aug
 2020 02:23:55 +0000
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::24d0:f783:3c7d:e232]) by DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::24d0:f783:3c7d:e232%12]) with mapi id 15.20.3305.026; Fri, 21 Aug
 2020 02:23:55 +0000
From: peng.fan@nxp.com
To: jan.kiszka@siemens.com
Cc: jailhouse-dev@googlegroups.com,
	alice.guo@nxp.com,
	Peng Fan <peng.fan@nxp.com>
Subject: [PATCH V2 1/5] arm: irqchip/gic: Ensure we have an ISB between ack and ->handle_irq
Date: Fri, 21 Aug 2020 10:49:17 +0800
Message-Id: <20200821024921.3075-1-peng.fan@nxp.com>
X-Mailer: git-send-email 2.16.4
Content-Type: text/plain; charset="UTF-8"
X-ClientProxiedBy: SG2PR02CA0038.apcprd02.prod.outlook.com
 (2603:1096:3:18::26) To DB6PR0402MB2760.eurprd04.prod.outlook.com
 (2603:10a6:4:a1::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from linux-1xn6.ap.freescale.net (119.31.174.71) by SG2PR02CA0038.apcprd02.prod.outlook.com (2603:1096:3:18::26) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.24 via Frontend Transport; Fri, 21 Aug 2020 02:23:53 +0000
X-Mailer: git-send-email 2.16.4
X-Originating-IP: [119.31.174.71]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 30e2e2ac-88f0-4cf2-395b-08d84579408f
X-MS-TrafficTypeDiagnostic: DB8PR04MB6620:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DB8PR04MB66204F89F6AF3ED86F245B5E885B0@DB8PR04MB6620.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3383;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: uoMnMTuk6CT9/iKINSYStr65dmYrX82VPklB6BE31vzr9R1EfyJyHxBjWK4INzF6+KQy4hkhpCf4juO94x7t+E2By8+VBY6pP9FDTRav2fqBl33aKA+ugTBmWMw18LDoJxi6WRRrQS5/PmM16smkgR7VYNruo6tV6S1e5G0eLf2oABsx5NS/WXPLAbDNAT1sTyP38NUN2PLkoH878WKxrcvB6d75rXbQntf4NmBQZ03gbvcZY1VUjqqwGx9Bi8czNm5j1WyxPEFPNDXE0r18ruwZPWQERlj2bO9JqpArCF/3RA3//TL2XVJKCBpzSnZx9b7hB21Bj/8fxw2QGYzW9g==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0402MB2760.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(346002)(396003)(366004)(376002)(39860400002)(6486002)(6506007)(86362001)(26005)(52116002)(36756003)(2906002)(5660300002)(83380400001)(316002)(478600001)(16526019)(4326008)(8936002)(8676002)(9686003)(6512007)(6916009)(66946007)(66476007)(66556008)(186003)(2616005)(956004)(1076003)(6666004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: NKojgZCAzrhKrukemFPhO6fyf26VxPtRbazrTvjn0CC1NxF+J9IVImP1FnMwFePeCueoQCVEBbkAZKqlpX+f6GG7tlr5TZiS/SXUdqMKqKhGM3bDufp+MKMb/vHLyVQBvHeYd4+vii0ZDQsLWd4UUq44zSROBN5NDIO/c/zlnBWs+QfaVAiqvYOUxqQJZhvubEITg/gBQWg2GNtbW+29WEZXMrCILSBH/7tWfk3ILnde13IETj4ye2xOZsFzz2dB4fIYqdcgevCFZl5USZfg27tCnBUluo3ExFJHbBMj8WEKZOu7xAKXPgBF8ZB9O8HCTSjaz/38edyB0gFFoyviyL515EigNX1b5dyz//Mb5+RroiAb8o0Gu5JHTuj5AD063vGBIGYHeqsFaNEVmsjFQaULn8tqATN4vyVLO17T+dYraHSVK+6/+Bq3RNZuTtCZMfDEGUhGSAJ/5vVcJ34Vsy3oCesknwLlmyTlCN6AMPg+QqfJJfFo9T1qMOcQAMlHuvkbXucdr8zhKiFlobN6lvdM1eYmChMmO5NtS34nf5qompajnwy/STDUKi844F+IY1y8GJ3gX7zFyEke9BbqluBl9/pA+jCEWr9lauTWT3YNC6P3sBh9aDFu0OFcMTynDwn6p8/idiUROl483UNUxA==
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 30e2e2ac-88f0-4cf2-395b-08d84579408f
X-MS-Exchange-CrossTenant-AuthSource: DB6PR0402MB2760.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2020 02:23:55.2991
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MpyJv9n3RUv8g26a0eJQ3dZq7AAtNu3qebY1+W6tfy+PqY1+g0eJcExABhradbuTKL4VUaZGM3FxFChfu4EoCA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6620
X-Original-Sender: peng.fan@nxp.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@nxp.com header.s=selector2 header.b=BYWjlUVx;       arc=pass (i=1
 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass
 fromdomain=nxp.com);       spf=pass (google.com: domain of peng.fan@nxp.com
 designates 40.107.22.71 as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
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

The whole commit message is from Linux Kernel:
commit <39a06b67c2c1>("irqchip/gic: Ensure we have an ISB between ack and ->handle_irq")

Devices that expose their interrupt status registers via system
registers (e.g. Statistical profiling, CPU PMU, DynamIQ PMU, arch timer,
vgic (although unused by Linux), ...) rely on a context synchronising
operation on the CPU to ensure that the updated status register is
visible to the CPU when handling the interrupt. This usually happens as
a result of taking the IRQ exception in the first place, but there are
two race scenarios where this isn't the case.

For example, let's say we have two peripherals (X and Y), where Y uses a
system register for its interrupt status.

Case 1:
1. CPU takes an IRQ exception as a result of X raising an interrupt
2. Y then raises its interrupt line, but the update to its system
   register is not yet visible to the CPU
3. The GIC decides to expose Y's interrupt number first in the Ack
   register
4. The CPU runs the IRQ handler for Y, but the status register is stale

Case 2:
1. CPU takes an IRQ exception as a result of X raising an interrupt
2. CPU reads the interrupt number for X from the Ack register and runs
   its IRQ handler
3. Y raises its interrupt line and the Ack register is updated, but
   again, the update to its system register is not yet visible to the
   CPU.
4. Since the GIC drivers poll the Ack register, we read Y's interrupt
   number and run its handler without a context synchronisation
   operation, therefore seeing the stale register value.

In either case, we run the risk of missing an IRQ. This patch solves the
problem by ensuring that we execute an ISB in the GIC drivers prior
to invoking the interrupt handler. This is already the case for GICv3
and EOIMode 1 (the usual case for the host).

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 hypervisor/arch/arm-common/irqchip.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hypervisor/arch/arm-common/irqchip.c b/hypervisor/arch/arm-common/irqchip.c
index 4172934a..c50ea18a 100644
--- a/hypervisor/arch/arm-common/irqchip.c
+++ b/hypervisor/arch/arm-common/irqchip.c
@@ -193,6 +193,7 @@ void irqchip_handle_irq(void)
 			arch_handle_sgi(irq_id, count_event);
 			handled = true;
 		} else {
+			isb();
 			handled = arch_handle_phys_irq(irq_id, count_event);
 		}
 		count_event = 0;
-- 
2.16.4

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20200821024921.3075-1-peng.fan%40nxp.com.
