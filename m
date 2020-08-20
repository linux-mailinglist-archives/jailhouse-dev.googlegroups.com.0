Return-Path: <jailhouse-dev+bncBDAMFR7JZAEBBVUK7H4QKGQECFWKGIA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x53e.google.com (mail-ed1-x53e.google.com [IPv6:2a00:1450:4864:20::53e])
	by mail.lfdr.de (Postfix) with ESMTPS id 33B4524B317
	for <lists+jailhouse-dev@lfdr.de>; Thu, 20 Aug 2020 11:41:43 +0200 (CEST)
Received: by mail-ed1-x53e.google.com with SMTP id p7sf664632edm.5
        for <lists+jailhouse-dev@lfdr.de>; Thu, 20 Aug 2020 02:41:43 -0700 (PDT)
ARC-Seal: i=3; a=rsa-sha256; t=1597916503; cv=pass;
        d=google.com; s=arc-20160816;
        b=wHiIQfuCmdULq4bbpJ2Hw24VZ6dKi6LeeCFwUU7vjgGL9xrH0SrWsqhr5yGW21ioRN
         9g2SUOYUDmIBhGco7N1UjirMdwGvPfXu9vjzPPO68uICndULdQJu/3fNv3TXhyvNiFfJ
         4TO+xIsH27aPgGHtyeic6Q9wnG8UtAEVzUBU1OTaKOLYJGPCK6KqJL96IUkw0pQZm8no
         bal+9dLeyiU+7IYVcHx9MpbG7qF/6oQHKJiTZhBVcY58SAdKEghBVI6uZeZ0alhu1F/X
         /YA72mspkc8V3uwDpi8TT6fMZK2hPAgftrfBnC6+/sSpX3HRn06mM//RwRW5Zphxknah
         AR2g==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:message-id:date
         :subject:cc:to:from:sender:dkim-signature;
        bh=fgEKZFCxaZcXcicueGIICowcfsVxdA/OS9rLesv85fM=;
        b=0BD0C2WWHAA6j4mCczwFcc3niu99oLkChI+6bm4sBxIo/q3xKQ7PotKb6FJSaY20Yq
         2Nvrn/v5+YKWo41MisTPMpEP8oumoqsgNznjJN82ovONHpuDPT0N+gYJvDks0696LcRl
         f8wcFSwGVB/KthZReS2VpHGzM0zRPsKEgGHgVjHrk5DjjFDcGMUnx0yoZeWALDj02BhS
         bYJz6egxW9K+9WHaPIh0aNLemJmxhgFBX3IVKY5CPIBENKH+bcRAQks1pqTDXFzKK+Bv
         TTalohDU+nncIZufo+/MvHEOaT1Wi52OE0zj0e1VscKi94hyBbcqMNs18DhADUs2h1Js
         sdeA==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=sOVzUlW9;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of peng.fan@nxp.com designates 40.107.3.81 as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=fgEKZFCxaZcXcicueGIICowcfsVxdA/OS9rLesv85fM=;
        b=SbQw/fnrdICJf1WdOpjd0VtGxgr/aYWMqNn/gCMi+f/E3e8glmHgyktCN6/Qih0Qlz
         FRqminRYo1drDAIipkPdndcRmElqpGOTJQz08tva6/yMlDJdhxyE7BW6AHUj9e6RDe77
         Wg7Y4brNyjOWEgfvK1cXbzuVP0813fJLEnSIgEFhx0s7Hx/xBLJ818FlR3MBtt62WQzm
         sfaEscEN+hE5gBDOuQpIWU3exAITnmrpSKEK/CQpA2Pr11dYP+o5NqBlM2ktdBSJtNjh
         II57Hlq7r33jmhCwRLhR2GoEwAy6uL2N4OJnGT4lgZ6fkD3qR2paCTp+cXLuGIVYO9f1
         sOZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=fgEKZFCxaZcXcicueGIICowcfsVxdA/OS9rLesv85fM=;
        b=iYYEjTGH/CnEA2DtFT725cbQNg/Y47j20L9cbEthF5WBbEq6zXDzl0BmTFzlBfei7p
         Iv00xe9DCec2dxXStpGwDIn++y9vC0pfR6HCCzP8ck/LmbiHYqWxAil4uLqHq2mujhp3
         WUDuB0JPwLd7jOyIQ+ewWfI3xXf7u9VCZOdEXCXGTIsKDv0j3feB/oktdDPn+OoOCl09
         sqf2vBjZTcPzbGC/1u9wxJsBwq0qMP1XDeQy92CnQTdsFwaC432OJUmaEAsLr3ZX5Qx0
         F8fCfMHCTwlsRnSernULqMh+gMnMpzxAYJwbU4KcWjia4iRO7/9+ny0Sk9/I1FvIbMjY
         79YA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530pEkUr4KkeHk4cNArgZ3lnPy0NgPIErFWOIjJnZQpE1Tgf465t
	2Ienqa2ZAgK0iIvj8dMdYsU=
X-Google-Smtp-Source: ABdhPJwlHhfLNDbcrnxGBzqCiYYsE4ww5714z/S5/FxYEX54IH9F3GC8ZhbDjoH1n30BjCL7mqbaJA==
X-Received: by 2002:aa7:da04:: with SMTP id r4mr2042617eds.265.1597916502888;
        Thu, 20 Aug 2020 02:41:42 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:aa7:dcda:: with SMTP id w26ls1520426edu.2.gmail; Thu, 20 Aug
 2020 02:41:42 -0700 (PDT)
X-Received: by 2002:a05:6402:6cc:: with SMTP id n12mr2144634edy.258.1597916502068;
        Thu, 20 Aug 2020 02:41:42 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1597916502; cv=pass;
        d=google.com; s=arc-20160816;
        b=Mjs7t3DbLB5DsgiLLo3ACg9hUfRNBRSzJGBeIf+k+XlLn2dFyUVkBAEPjAylS/NOy2
         W5Flf+o3p69zUeIvpQCj70kowIk2bC1joAtVZZ40hZHVZrFF1o0d7i2EZHwBhelLFgny
         acDzp5U+A2u0MiVaTk84zP4OLnpFib2KWLuF9F2WIYiOOyXZpvd6/ywr7ylNZLD9CFBv
         9OTXCNAh7SREyIjadEGM6iauHxRIln3q4RgLg0bkrw8XmE6DFQDnRnhqnwH7+PvRRHvJ
         6b0hwoo9KL3YCYi/Ig8oxko6oJmHTuZFCrJHOdq9eA/8w4KkmlFDvRZCiKHODglyr74+
         PNYw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=lFAtdDNyoCwwhSOHbRlzN+jVmZJXNboomkNllb0CYgU=;
        b=f3v3otM0Tn32QgzaK0Omn35R347oPFU17bKkqgrSk2PWmkdeSAQTn16Ci9P6RHCfUv
         6Z7799v9uiZpEpEtwcgmoHlnlgdcWzx+LnTUMM940jMfsFIfRSUgN4L5q8iS7v58VSsC
         iED4yBinNuocUYML76rgWyuiT3l+UK0yMk++JBn0Q3NKitkQDF9Qg1XwXujZNOe1zfHR
         nK3lOfMtzKW83SuuxEnGMTAa21JlPMfsmRx8/ToC1h7sZngbYEWgFdgh3WMbeOJXpkJ1
         wI+DUjbnwvTng+Dm+CYvbkGYZIKctqbQzL6PH6obWIqYYnxQKLQ8ChWKXy/DTGg64ulu
         eJNQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=sOVzUlW9;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of peng.fan@nxp.com designates 40.107.3.81 as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
Received: from EUR03-AM5-obe.outbound.protection.outlook.com (mail-eopbgr30081.outbound.protection.outlook.com. [40.107.3.81])
        by gmr-mx.google.com with ESMTPS id h10si56635edn.2.2020.08.20.02.41.41
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 20 Aug 2020 02:41:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of peng.fan@nxp.com designates 40.107.3.81 as permitted sender) client-ip=40.107.3.81;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N2fvShmtdYPUk/YWoENqkE0VMlKhrMUifW7GMofibBku5pDwHQxXRPIM/g3cedENU5ySf0utyCAv1AYlGNlEHPmquxJfAjErY+0xwhI8a0nZzvxOlt61Xa4RaR4VYIBWdpLnWHOM7DKhX6738GELsB1O7/IAOgRRZrUOqlG8k+JupVQWfuVggABY11hZ8BelF+uiVnUMZQnmkiUrUypNWW/Ci64VvY94pGdwRajQ6IQ11rQEQLfzKGtfb+M9jZ4o8sCAHJeDBNsrI9qpcRIuftASQpp6PKMVpXi2KY7fFaadhk2by9wCpg8QLf7XV/ERxOQUQrPjBvX5rdkpmtJhlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lFAtdDNyoCwwhSOHbRlzN+jVmZJXNboomkNllb0CYgU=;
 b=QS7ibVh9rD1ARltOBs7btIpBuuU5qoGmiwOyhLI5bMWw3wmzT3ZFMKcQDYGr/uHxrvIPM/Q/M9qqaWkfkprhjah8CXl3LuuuY13mX+elB9rnR1bgWXby0FLtNAGy7t3YUnqZPyAi8aKodQztWNAOv+w1/Q+J/3Wf+Jv+ZXn6fd9OW+HcfOuOkiNKN1n4pd+61BnKFz0nxZAiOziSfCI0xmJu/+S5GJ9XymI/1aVAl0MI5lLbpA8Ao+7Qso6AGEaLVH9ZYcrGFl0zQdPPqx9o6JC3saylLn5/ALzUULwV+7T1a9TlEwasGJ1rQRVsU97rhpLZkoBEmt00rmbAkQnkwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com (2603:10a6:4:a1::14)
 by DB3PR0402MB3660.eurprd04.prod.outlook.com (2603:10a6:8:c::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3283.23; Thu, 20 Aug
 2020 09:41:39 +0000
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::24d0:f783:3c7d:e232]) by DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::24d0:f783:3c7d:e232%12]) with mapi id 15.20.3283.027; Thu, 20 Aug
 2020 09:41:39 +0000
From: peng.fan@nxp.com
To: jan.kiszka@siemens.com
Cc: jailhouse-dev@googlegroups.com,
	alice.guo@nxp.com,
	Peng Fan <peng.fan@nxp.com>
Subject: [PATCH 1/5] arm: irqchip/gic: Ensure we have an ISB between ack and ->handle_irq
Date: Thu, 20 Aug 2020 18:07:03 +0800
Message-Id: <20200820100707.20013-1-peng.fan@nxp.com>
X-Mailer: git-send-email 2.16.4
Content-Type: text/plain; charset="UTF-8"
X-ClientProxiedBy: SG2PR02CA0073.apcprd02.prod.outlook.com
 (2603:1096:4:90::13) To DB6PR0402MB2760.eurprd04.prod.outlook.com
 (2603:10a6:4:a1::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from linux-1xn6.ap.freescale.net (119.31.174.71) by SG2PR02CA0073.apcprd02.prod.outlook.com (2603:1096:4:90::13) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.24 via Frontend Transport; Thu, 20 Aug 2020 09:41:37 +0000
X-Mailer: git-send-email 2.16.4
X-Originating-IP: [119.31.174.71]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 4392b51c-368b-45de-df1b-08d844ed3ca9
X-MS-TrafficTypeDiagnostic: DB3PR0402MB3660:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DB3PR0402MB36600BD56A0C41756D50387A885A0@DB3PR0402MB3660.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3383;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SpkI9p/Og26pjno78nidg0lKdSiUwwu2aTjMc5VEDiUORLmWbYh/JANwU4eiau3U1ZDdw3bWEHPxjucKbOXI6tVbATvLV7nENMDqXSEkVJGc2gGZBuwhbbvL9+sCkGI0o4UtnSyvcsipOHNMz+vPbTHGPGxMSnJIaUdRo6MpgbE2NjQ/kGSTxDmetK+ca08g+yxxHzmuiSXRBdzehp+CT9vSj8R50cA/7G4MGgi7fk7TfXdDHztRGpHqkJxrs+1q6uTyEvKV7EfNQxna6nhkGANO1FIymMuiJXR9nOvnBKbWI1DYdzXL1BA2xqT/Szm6FhBWdD2pxXIuvG0TtWLo/Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0402MB2760.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(136003)(346002)(366004)(396003)(376002)(6916009)(66946007)(9686003)(6506007)(83380400001)(66476007)(52116002)(186003)(8676002)(66556008)(6512007)(8936002)(6666004)(16526019)(4326008)(36756003)(316002)(5660300002)(2906002)(956004)(478600001)(6486002)(86362001)(1076003)(26005)(2616005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: J5XDAFvyug0NIfK39ywvlu9bXiwHe8mfTfqvbdNwZaLWjFCSSQE1MmomC8uVRyNNKYz9ShWZheP8kqjLPCFwhH/jAJi9AJC81k5hNrCQHXIEPqtKpy6x3paVZjxQ4plb39KVKMgvTJPaRZ46rYcBlHT7eR3Dk+TJiu571qeBh2K/FTDeUASTg0IqW0l7SrADEhYHT8bYR6HvSTmfUaKJwfIIyQXngRIKvbu1m4bJfhYQ8RiIwNzVfF7mDzpWv+Sr7ZuDKvR0+GTJSfnJaHKn55Gfh66azYKG4TwM6v9nOnhj/ZwrfSjQo7zleWUp5C88he2h+ND0x3fCH78y+ONjtqTiD2Qhptp6hOpeXPZwwu1Ff3vPhnC3BoDTCYF6W4QFMbnJh3HPOabHO2DTDG6VnDPE8G/jsxzuvtbsvRPe33RWAQupsOKrgq5JAIjTSGFjz/yS/y6wcMZs0WHwTLrclYX59u/SlFMan3w1AqLJky8Im2iaHScjS5pYdX4LkgTsGrujX0JoravTk45rKV+f8BotAWZ0oyt0emN5+AIrtm5BVt/uZyhjZh1ElALc8FDm0J5KGA1yllT5S4mGqKYAzTeJ4vt/WH+3HakEXnr1t9eKEayt0u43go0vnumDEN38sme9zKP6HtBXzxj7zV5WGQ==
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4392b51c-368b-45de-df1b-08d844ed3ca9
X-MS-Exchange-CrossTenant-AuthSource: DB6PR0402MB2760.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2020 09:41:39.2686
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: daLT7koeZBaj64ExSvenDGLZMSu4eQ3nbZJsZI2TxqKUCROBJyG0G5g14+ypJPk7/T9PtbxWvm1eahvdoAnw6g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR0402MB3660
X-Original-Sender: peng.fan@nxp.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@nxp.com header.s=selector2 header.b=sOVzUlW9;       arc=pass (i=1
 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass
 fromdomain=nxp.com);       spf=pass (google.com: domain of peng.fan@nxp.com
 designates 40.107.3.81 as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
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
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20200820100707.20013-1-peng.fan%40nxp.com.
