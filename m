Return-Path: <jailhouse-dev+bncBDEN32754MOBB2EHUP5AKGQECVINVLA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x440.google.com (mail-wr1-x440.google.com [IPv6:2a00:1450:4864:20::440])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CF4E2556A8
	for <lists+jailhouse-dev@lfdr.de>; Fri, 28 Aug 2020 10:44:25 +0200 (CEST)
Received: by mail-wr1-x440.google.com with SMTP id d15sf183497wrp.10
        for <lists+jailhouse-dev@lfdr.de>; Fri, 28 Aug 2020 01:44:25 -0700 (PDT)
ARC-Seal: i=3; a=rsa-sha256; t=1598604264; cv=pass;
        d=google.com; s=arc-20160816;
        b=L7avX6ZmVFUdSj7tHBWOaLTY1xShzgQTMy1xHwG/roE7B95wkcX8gnsKEKqq5Rze3a
         J0pdT9rmpkMUar88p8l0aaUg8/JfuXSxT/G/XZ8jEpEl3Y9sRUkZeTK/Z4G5c5l2K3+X
         w6qcuBodG6sFAUdlJTARfzEeV14E/0uHiDwHTt7d6CGHkyK3QEABAfhqx5YrNHnjc7+J
         bU0+RkHWqNf4rZ672lcuDyB/p2xZvWH5C08Vdwd1hu/ymdV3N+Sy0Mf4uFeiKVdHKZNs
         CWeakePdoruSiTL4FILrZv08b59dnh9EVan4JIzmRrcFPkMV1qrU/oUt3JFz//39yCH6
         sFqA==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:message-id:date
         :subject:cc:to:from:sender:dkim-signature;
        bh=vZsUc7YWALttZeUY3NiXNjiH/5FP5XztAi8mffeh4jU=;
        b=L9lMS3pD142TlU9ea7wcckFnYY1EEBQ22IxbBqk/UVFHl6I0eX6eiINjql9EA1wYOr
         sWJlydl/xXYldpLSy8EEJzqfbEHObyZduqlu3UsGS2peg8q3qlvSjdYHUcKdrB00L0Km
         kHKvXpnU/6azJQoNjQ1ebe4owy94C4uX7DmiNo0j4i3Vys4MjxjTCOXW36p0iue48A59
         fOKY8sBL/d2GnJ14o3ePkUzYbtSMmZJOuop7wh5KIKYrxMRaS1t/uC/Ue1+8kdq7Kr45
         JdMYG0OaQCSnHCNhlgEvqw+VtdvqEYRZk0A/dYKvlwXq/G4SkhFY5G4OMNtJubU0jxvJ
         Z3Ww==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b="baOs/7ia";
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of alice.guo@nxp.com designates 40.107.0.73 as permitted sender) smtp.mailfrom=alice.guo@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=vZsUc7YWALttZeUY3NiXNjiH/5FP5XztAi8mffeh4jU=;
        b=cNUf49CXJcfqmXpsJdZVM9ZYwvBX70Xhr4xkKFI8/N3NrYpAl/QAvYk+oRxMoHf14s
         VYzxnSYYycYtMT6PK5WetmMdlmnIdjs6zuV0QHyKd6+P9bIjRhcVGjxrbo2PMramV6j2
         NB01+4OeKq262UA5HpAElWxd+i86FLp9KzYPcNERZ+Cat6SlHEtro2etRLmbY+a60HlR
         Bu9SgbDAF0SN5OVB94EJ+TCVfwl8Q+mAvvGQms3ok5Y7ewOmfKN6zFUeQ7797cHMuhvS
         E9hwJJzbPtwyDo+tskjycjKUCgh6m6wSRc5A+g4g70FfScWzEJiRprSoerzvp7JvCGIb
         KOGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=vZsUc7YWALttZeUY3NiXNjiH/5FP5XztAi8mffeh4jU=;
        b=D8M/bE17XnhQkwCj2vi0mW98kL2q5odlBIrzj3FP9MRKpd+oiQXaxJEEVtZw0TKKH0
         rTQLs/QoAsfnbgfIitana634g1Elg/OISVImyFuzvuhaWofoklQyl4DFnwYwH1h5xuIb
         MCb067EzpZiKH/k4MpdJ9xgDRkMJPXvyxhlNhe9qKfx8FI9AiN8wjOdNle2puJh0cp9b
         xtmUfRVbP5a0oUuXPJAK3pdpaEVf/F2V2E2pxAeK6MWLXYjt+T52BYDQN3TiJw36B+7B
         +hhftrz2Uy/4NdvF+2RMmHxFeQ3LJZNzzdHHTxKMxLNPDGZbPSppgxe+wpI3N+JsS1fu
         gNvg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530KaaXaC7GCytRr55XjmJIjSLBiKcRufdwSxaPIxJZsWorhWcfW
	P5rMswr1TeK4sjynLiPFo10=
X-Google-Smtp-Source: ABdhPJxRetPLRbD2I6tEv18jr1SD/yB69aT3733Vxp/rAeGJtlaOm7jZA9iOMat1CPYgFFfkziea9A==
X-Received: by 2002:a1c:4d12:: with SMTP id o18mr557029wmh.95.1598604264757;
        Fri, 28 Aug 2020 01:44:24 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:81c2:: with SMTP id 60ls741991wra.2.gmail; Fri, 28 Aug
 2020 01:44:24 -0700 (PDT)
X-Received: by 2002:adf:b1ca:: with SMTP id r10mr522711wra.150.1598604263947;
        Fri, 28 Aug 2020 01:44:23 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1598604263; cv=pass;
        d=google.com; s=arc-20160816;
        b=srFKBgQtjE4Hhjyg+Wzs2UHvcZug7AiELc7jQvbyNW+KRzMyxOXzqsxee8KRzqJWGj
         waIg6ayxm20aDh5rh0yAG7s9IrHvfSgNwzRqgGNmn2Pwj8A+a8FG1oFmPB7h18nY/kju
         4RZR1lcuHemkxjAbKLMlInCllnmQo7CyqfpWw+j02gtIzubi/qAK9sSo6f5L9pxPNbGe
         bbIo7Ufghx9x40OIcCtQUSUyLwHXfY9mIvogB6RtgC2GHROGLwgO2lvXwsioT5zKgtbm
         uAZrtFhz8QjuOiA03xvTYA7svpM8/+ANKJD+pVlOm+6DMAszA+iL0EESr8kzvzQ+sJNh
         PErA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=QIcSW+7R02r/4+6yIpq1QkL5P6u7cMsoHOvdzVAKdKA=;
        b=tzq3sYu4z16kMB9YjxAJE5/1AfR0h2U1zfMXiwHRRZtaHQraZhuQJrqYXw12RJ57zx
         zdi4mMVl+TilftBWKhJqpUQFJayAPcXk0uIMxB3DB8k6AXlzJQnoMgKzS6SaNBhePGqM
         xJG3c42qEWBTrHnAOsuQ/8HS8qdWupHit3H30XMWm0+/+qiERnqDV0rwZW/0k/7srRa6
         bGjl5H/pUKWwEfveKKpJXbtrPeyKOAkvtB+Lvx2g03rBovn5Gs2Lg/r0wWosL5GS14Wa
         3EwFowIWBsDp18ALJVhGsPSGJ/DuMxEs14aFOu4k7MzrenPUB+pYUh1XpXGrs0ALNQ8I
         eIGg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b="baOs/7ia";
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of alice.guo@nxp.com designates 40.107.0.73 as permitted sender) smtp.mailfrom=alice.guo@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
Received: from EUR02-AM5-obe.outbound.protection.outlook.com (mail-eopbgr00073.outbound.protection.outlook.com. [40.107.0.73])
        by gmr-mx.google.com with ESMTPS id w6si30455wmk.2.2020.08.28.01.44.23
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 28 Aug 2020 01:44:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of alice.guo@nxp.com designates 40.107.0.73 as permitted sender) client-ip=40.107.0.73;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mm59Ua/xYtoA+TIHGedZb8KUKrfXIo10PVA4d29qbviIROKptFeum4NKPpP+Ju2uI2ARvMs8ofnSiWvdOhs/vMzGxm0v/WLAgv9hHmpLHuoQrAUvUMjA+4SZqSFILcim44wG1YxLRGsVbDm5VICR9JFKdypEeeuDjMr+yYplHX+gLoP3FU3yA6vauEHsNsQIX26M69+N98NBg+hR/A+HrjQIc/l76WFDVd4viJjrx29xkmGDlTKZ0T7c8SHfvwTwgbJPdlGOgE58JgpXtDV+sq+sQyrmg2V+1P8HHd3TULfT9uK1OANZJLxddnoVj60+caFwFP+VCkAD/uJD7CFnwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QIcSW+7R02r/4+6yIpq1QkL5P6u7cMsoHOvdzVAKdKA=;
 b=Ov71jX+bID579BpDOFx4KZ/C/7h+6z6khWA4jnzlVIOr9ziMDLs9eVbsqLntP9CzvMxyjIE1CZGf00zRFgPXE0Yi9MJNOCZPS0O6EaOq4JusUSgkeRpH4pnGb1w5rFP2qtnkkQej/Gd8ap2fHClDtW+6ETl76TARkl7LDgKkS1irUGiqTLex9RhtWb7B42auG2v9M+bl2rl1FXuruwFyjbyKCTejSoZD92xq/I6QpFPugSn2pqTSofnxeOkIBduW4ZVZZYjRH5H6zeDfJeosKhhd8Ucd8Kq7pWknt8wTmxpr2/y8kdPWdN/UtqwlJQWINldu8sHjrrLXO4WY70aGTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
Received: from DB8PR04MB7065.eurprd04.prod.outlook.com (2603:10a6:10:127::9)
 by DB8PR04MB6651.eurprd04.prod.outlook.com (2603:10a6:10:10e::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3326.21; Fri, 28 Aug
 2020 08:44:23 +0000
Received: from DB8PR04MB7065.eurprd04.prod.outlook.com
 ([fe80::5042:d7a1:10c0:c40e]) by DB8PR04MB7065.eurprd04.prod.outlook.com
 ([fe80::5042:d7a1:10c0:c40e%6]) with mapi id 15.20.3305.032; Fri, 28 Aug 2020
 08:44:23 +0000
From: Alice Guo <alice.guo@nxp.com>
To: jailhouse-dev@googlegroups.com,
	jan.kiszka@siemens.com
Cc: peng.fan@nxp.com,
	Alice Guo <alice.guo@nxp.com>
Subject: [PATCH V2 1/4] hypervisor: Provide delay_us() for ARM
Date: Fri, 28 Aug 2020 16:44:22 +0800
Message-Id: <20200828084425.21282-1-alice.guo@nxp.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain; charset="UTF-8"
X-ClientProxiedBy: SG2PR01CA0157.apcprd01.prod.exchangelabs.com
 (2603:1096:4:28::13) To DB8PR04MB7065.eurprd04.prod.outlook.com
 (2603:10a6:10:127::9)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from nxf55104-OptiPlex-7060.ap.freescale.net (119.31.174.71) by SG2PR01CA0157.apcprd01.prod.exchangelabs.com (2603:1096:4:28::13) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3326.19 via Frontend Transport; Fri, 28 Aug 2020 08:44:21 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [119.31.174.71]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: e72e4bc1-1b34-4ff3-f867-08d84b2e8fdf
X-MS-TrafficTypeDiagnostic: DB8PR04MB6651:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DB8PR04MB665106C6F2B09200CCFE4F83E2520@DB8PR04MB6651.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5236;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VDBXIhNdlWIuZzzH0bRqbjKDPkQyejcRP12rqvuXKuTMs5sYzUL3O84Gx9Xxjvv8sGF0P+UzBuLG3SUsH/G3GIPFs5fjlzaYEh6KoziK79CpaW8HjZxQArPMFckU+ZaUJ79XP16CKGnyci+bj/dvn+9L44oMtsLueXtddiTqiroN2LmIDjstSZ8/0kZYaMcebfdiSLtg/4BqnMUozqSvcckapXLOzbzUZWuQ2qJLuJNFxrdKfoYi9xn87x1K6lZ+wU8b90t0VKxTjWP7dJYZzVEc+TYfz3h3+i74KSCaY4C2qF6VbQxrbhjrv3EiPKme
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR04MB7065.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(366004)(346002)(39860400002)(376002)(136003)(8936002)(2616005)(316002)(4326008)(36756003)(52116002)(956004)(26005)(16526019)(6506007)(6512007)(2906002)(6486002)(186003)(44832011)(8676002)(66556008)(83380400001)(86362001)(66946007)(478600001)(5660300002)(1076003)(66476007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: mYvAii/JgUsMoRfpKgPHTtj7bj6pTUBSa3Lhnxf4W/W8EJmSZeiyflW/FHz+CRc/2KFzUYLa/OgKJtpJv6P8MrLsNGJFSzelvjJJlBn8GRiAChgb9p8iRNV6zPyPJUbUGdF5rzzh+cgrXZgT0tZpJB/ry2iDIbiFeRXTQj+gEIkeulYRSDxn0tKkX5NiVj8n7/a2xUG+IXN06ShphIsYiX4qBDCUAP0+jlPtZEb3cQBBv0BGWO6qRHdMTMQa5/MtEUA/nudO8F7MVR7wBJcibHG+R+s6v+p5QQze3Zw7togvbhWWLdbcXMth/xA8DEFlle81tnwiKuN12xb8JiDuU2QDIhT/I18WEHp9Knkt9EasASoeISLV6oL9N5gtHhTEr3tGdgPNEJ1tUwrQgRltC7vue4hRQYo0QSIw6cufIo+DggWL5vn14kKZcvE0NsOW0TK9aanDVYbS9jeIKyjuBkSsrSl/Tg+gW1ls+I26gA3EvfenxaNRcOL+Kpc1lknAY0GF2H4ElRBS8n7bTsNbcp1P+7YG9I1fipQYLqW6zjWfhxNspbAdGHx0EVLmmV/K1DQrwRIbKuxABmHPel4S+JQgtYMTPloyJ2ausMZfxMkFz4MLbjY4U3CYbkpWkruo7NmO9B8ap3t/at7r7NOlFA==
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e72e4bc1-1b34-4ff3-f867-08d84b2e8fdf
X-MS-Exchange-CrossTenant-AuthSource: DB8PR04MB7065.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2020 08:44:22.9723
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xI7MEl+BGryi8ECzvblnbVx2uddkaNkPXV4pfiwCVWGfHJj+nmibTmD5nGeso1RyGTyPVt840wVXKNL5c73hYw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6651
X-Original-Sender: alice.guo@nxp.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@nxp.com header.s=selector2 header.b="baOs/7ia";       arc=pass (i=1
 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass
 fromdomain=nxp.com);       spf=pass (google.com: domain of alice.guo@nxp.com
 designates 40.107.0.73 as permitted sender) smtp.mailfrom=alice.guo@nxp.com;
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

Ensure that wait sufficiently on faster CPUs.

Signed-off-by: Alice Guo <alice.guo@nxp.com>
---
 hypervisor/arch/arm-common/Kbuild             |  2 +-
 .../arch/arm-common/include/asm/timing.h      | 17 ++++++++
 hypervisor/arch/arm-common/timing.c           | 39 +++++++++++++++++++
 3 files changed, 57 insertions(+), 1 deletion(-)
 create mode 100644 hypervisor/arch/arm-common/include/asm/timing.h
 create mode 100644 hypervisor/arch/arm-common/timing.c

diff --git a/hypervisor/arch/arm-common/Kbuild b/hypervisor/arch/arm-common/Kbuild
index ab86eca6..86ef9b86 100644
--- a/hypervisor/arch/arm-common/Kbuild
+++ b/hypervisor/arch/arm-common/Kbuild
@@ -17,6 +17,6 @@ ccflags-$(CONFIG_JAILHOUSE_GCOV) += -fprofile-arcs -ftest-coverage
 objs-y += dbg-write.o lib.o psci.o control.o paging.o mmu_cell.o setup.o
 objs-y += irqchip.o pci.o ivshmem.o uart-pl011.o uart-xuartps.o uart-mvebu.o
 objs-y += uart-hscif.o uart-scifa.o uart-imx.o uart-imx-lpuart.o
-objs-y += gic-v2.o gic-v3.o smccc.o
+objs-y += gic-v2.o gic-v3.o smccc.o timing.o
 
 common-objs-y = $(addprefix ../arm-common/,$(objs-y))
diff --git a/hypervisor/arch/arm-common/include/asm/timing.h b/hypervisor/arch/arm-common/include/asm/timing.h
new file mode 100644
index 00000000..145beb6c
--- /dev/null
+++ b/hypervisor/arch/arm-common/include/asm/timing.h
@@ -0,0 +1,17 @@
+/*
+ * Jailhouse, a Linux-based partitioning hypervisor
+ *
+ * Copyright 2020 NXP
+ *
+ * Authors:
+ *  Alice Guo <alice.guo@nxp.com>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2.  See
+ * the COPYING file in the top-level directory.
+ */
+
+#include <jailhouse/types.h>
+
+unsigned long timer_get_frequency(void);
+u64 timer_get_ticks(void);
+void delay_us(unsigned long microsecs);
diff --git a/hypervisor/arch/arm-common/timing.c b/hypervisor/arch/arm-common/timing.c
new file mode 100644
index 00000000..ad4a5a86
--- /dev/null
+++ b/hypervisor/arch/arm-common/timing.c
@@ -0,0 +1,39 @@
+/*
+ * Jailhouse, a Linux-based partitioning hypervisor
+ *
+ * Copyright 2020 NXP
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2.  See
+ * the COPYING file in the top-level directory.
+ *
+ * Partly derived from inmates/lib/arm-common/timing.c
+ */
+
+#include <asm/processor.h>
+#include <asm/sysregs.h>
+#include <asm/timing.h>
+
+unsigned long timer_get_frequency(void)
+{
+	unsigned long freq;
+
+	arm_read_sysreg(CNTFRQ_EL0, freq);
+	return freq;
+}
+
+u64 timer_get_ticks(void)
+{
+	u64 pct64;
+
+	arm_read_sysreg(CNTPCT_EL0, pct64);
+	return pct64;
+}
+
+void delay_us(unsigned long microsecs)
+{
+	unsigned long long timeout = timer_get_ticks() +
+		microsecs * (timer_get_frequency() / 1000 / 1000);
+
+	while ((long long)(timeout - timer_get_ticks()) > 0)
+		cpu_relax();
+}
-- 
2.17.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20200828084425.21282-1-alice.guo%40nxp.com.
