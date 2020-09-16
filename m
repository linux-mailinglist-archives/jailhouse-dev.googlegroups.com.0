Return-Path: <jailhouse-dev+bncBDEN32754MOBBPESQ75QKGQEHU2ISTQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ej1-x639.google.com (mail-ej1-x639.google.com [IPv6:2a00:1450:4864:20::639])
	by mail.lfdr.de (Postfix) with ESMTPS id 6511D26BEE4
	for <lists+jailhouse-dev@lfdr.de>; Wed, 16 Sep 2020 10:13:49 +0200 (CEST)
Received: by mail-ej1-x639.google.com with SMTP id e13sf2608067ejk.1
        for <lists+jailhouse-dev@lfdr.de>; Wed, 16 Sep 2020 01:13:49 -0700 (PDT)
ARC-Seal: i=3; a=rsa-sha256; t=1600244029; cv=pass;
        d=google.com; s=arc-20160816;
        b=Z7UXtsam6jdfpiem7xf55T0zG3dmvldR1/pcIQVcwe5JgoYbVWVooDHfBKTvrCrXLU
         ZwQ/+SM4eVjtU4MKR9W5SzSrhPr6D0bhaMCGqBdI32SZ4aasfwYI9vh/mNdYS/Ux0KrH
         /j1BLCZuQFV8CYXwHbAmmIyRdr5UfUvaRQr+hiVCmw9bYMl/9HbHzH794snTI1LJv0/u
         CRlCoM1+fzWXzJNys1quBJiqPfV9MHmWUnQuLtu1c4P6jhvOhqpR3QjN8mjWz5BF/Z5d
         9iUCtwP+mUgH0Hjn6V3TQ1IYakX438ps8Pf5cY6VugTJjy68L1xl9RUZt4yMaUF4EE65
         qhHg==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=j5kVyFSsr0c3dQOEeSxyG79COckp1tenLjlZMadeyTo=;
        b=lHwjSwwudEMvc4WhYX7j6h6PijUmZMRr3h7xPCcaO+7vzkk+5EAvzQz5RauPlQhD2f
         lvU2pqZaBpar8mZcLyvJuxYzjy7zGsP79VaZuO0GIksw735x7XEG7AEeNbZbC4Wwj9Nt
         S+MulYir0aBJT0p8rztf2WVGEZ0aX9aU1k+XK+6AwrhcSLqdyKIYDg0v3Salhl2ACmbW
         fnsrodA7lWb+nYxN5TLhQKiOGKBAx5fskq6QIJU3MZWr1sf9rY1m2oWqvI6TMC53wLli
         370I0LAz/weKGPNriqLlvk3g5nenNfHfunnQNX970dR+EjQrP0zMwp5rdDWG6xTndAJk
         b3Lg==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=GH+SuzUf;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of alice.guo@nxp.com designates 40.107.13.41 as permitted sender) smtp.mailfrom=alice.guo@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=j5kVyFSsr0c3dQOEeSxyG79COckp1tenLjlZMadeyTo=;
        b=M9j8BnqOaYGLrhGUQEzHwNy3/z6qp1/ojEkpUzxUOLHJ0M5b20YE4qq4CJ4uy7yFMs
         AWQyndw6WNt0BzGQcgJdO2j9f654XLQyIARhUSOmu+/SCAMLKB9moRzB3KNbjmDAFcZn
         E/QnF1j2ZW3u7YtIubsIahNCYJ54+ZDzGS0yEK4AJ6HgLbOoIMnQfWY13ODHDkF2KTbg
         kfpx/HVwTyFTtNB/N1UQ2DGdbqCVlRgn3uH3hjg9QqbF6sJa6dTSlDjU4rAmIRG5h1HP
         DaEvBUlTzNOLV/V+H/e4GNMFVPaaYbDs5s9ly7SGkmGZ5lir8asqO9kTbaIGgsCH6KVc
         SJRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=j5kVyFSsr0c3dQOEeSxyG79COckp1tenLjlZMadeyTo=;
        b=KHqyX7YPiFtcguUhhjeGPDIHCSHbaZn1Wc1Ull/ZX1z8pHGlMmPFsLD/45WXbhQw9t
         g5N2uvfU9YlP317YpcnFKQW2ePqIPX50yeMqXMPh3SG8YSeY/aTt47WPJFqLn6MmXF8w
         elZEjSbcbe5JUlZdyC0F3SudDoal+KnaE0AoapZ+mkg5DJ3IP3XIATZinSd2UtJgzcFn
         4IWSJpn7FN5YnLEW2gQuaq2GfVE4jrarQeWZohABFLSrVaEJdo7SLAiyHutN/4zhKgSZ
         tqjQOpH5dzOp+CxUFx63aePJqCcy9TCYq+hmY/b9zpfqCzRtP0ERxo9h29Gzae0ywL5z
         x8Dw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM5331NeqgF21DWFIAjGFlZdv7OYCs+3Ecfh3ord2sb43J+q7+V67K
	aMyWnvG97/XV/EPDrWcfbYQ=
X-Google-Smtp-Source: ABdhPJyJfGAA5hpdeve0wT+DQwW2dXbm+SMeiE3E6/P6sRQSXtKcGopK1c/pLtFpmHzlv4/hIrrZcA==
X-Received: by 2002:a05:6402:3c8:: with SMTP id t8mr25539674edw.266.1600244029129;
        Wed, 16 Sep 2020 01:13:49 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:906:f1c6:: with SMTP id gx6ls619371ejb.8.gmail; Wed, 16
 Sep 2020 01:13:48 -0700 (PDT)
X-Received: by 2002:a17:907:374:: with SMTP id rs20mr25239219ejb.135.1600244028077;
        Wed, 16 Sep 2020 01:13:48 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1600244028; cv=pass;
        d=google.com; s=arc-20160816;
        b=gsgnEVI5TMQ0oGV1HJ7JGuBEVZOvAHoAZpPGFEXtzrY3Gjxx8VqD1a/G2rw3oqHL/a
         Jva/xuLtf4oB/bj3Nmg1gjXAWrz1z1Dfek5GRUfQ4PZmWT1vFWeJCeoo05/ue7u1sH3w
         coIh6alY+5pLo+/SxvMlUOPo3QZIwCZLF4FP1PahL9tNiahSn0+fB64IiEcVMnnQnIEY
         ANU+XzihaR8mG3Mm8ljMwISfY/K8lhGCSQrwL1hyoFKY/ZnhKrkn+gF8AX+Y8xUm0TqM
         +rp33dtDZCoE27x5ENZE+HOhQ2b7UoKtzzVtYWoWpR4C2j4tq7AqfTyZR3idt5HxnzFN
         18QQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=KApypnFq9NqKf6ZAoqcwK9+uRHwqoJZCQ5leOxlDijc=;
        b=SqzNthLxUcw8kDjeJzKnekeTjXIlVMLrkdjZ2Nh3YLpYkMscPOFX/ijCd/lsfB6x/E
         RE1DJ4YBKLXlIcMkyUDbBIl4HFr8WSOb+qmi6Qizyd1L0muNDsXHxHRXGGVQBXpXvQ57
         4r3So2s5hM0lbJYh9iYW6/gSPI2G7kXEyKCuIkXSBfmXe0zdz0+JXp9S+Ub658cEV6qe
         DPnwwKsENQnzOo5jWTfOrL3PMUV0+ctO2s/stKRA6UzwXhVvBHZYgvmQPo/WexQeFsIu
         8izeCslLbHKmfo6nAg6cxGC+DfZ1YYHMJlFptenjuwH8XPopJpkCUzi7c/xOvDtRpL4k
         t1Rw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=GH+SuzUf;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of alice.guo@nxp.com designates 40.107.13.41 as permitted sender) smtp.mailfrom=alice.guo@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
Received: from EUR01-HE1-obe.outbound.protection.outlook.com (mail-eopbgr130041.outbound.protection.outlook.com. [40.107.13.41])
        by gmr-mx.google.com with ESMTPS id a16si830669ejk.1.2020.09.16.01.13.47
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 16 Sep 2020 01:13:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of alice.guo@nxp.com designates 40.107.13.41 as permitted sender) client-ip=40.107.13.41;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gfP3kU9FoSKoQYei8TXJxI+nQr3YfBz4sGns/rBB1dci2ubwDdkWHo97KdMQFNnjmrBV8rNf3moeEUNDJc5d0nXCrthaiMglX/o2mrpvzv20ZAcaU747B2Dz62zL8l/eNIReO+xagRih4Xw2OJ1gkmestauYvdok9zwTiHDwo66IG6SEhLCtlbOk48Fa7xHxus5etj4Z40/HS+rGuim9iC33SzLDKsH45Y+Jzs4B56pNsiEvpixTdCxYYdxvAA1udxgbBwkRxXgnIVYw3dMomrwQn+RRHeSgDTk+mrNwP2rXhnAwNNHp+sdMiPWqZEUvBkWMMvJ/rnOcZUdawXc9Og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KApypnFq9NqKf6ZAoqcwK9+uRHwqoJZCQ5leOxlDijc=;
 b=O0FVJgkouXCDxiUVqjJMePbx1ku2xwn1PGRljWYLEIDM3E9T1AUzCZmXg2ykC2WMcJfOm4O06JISbRysw/oYmJd73koE1uhoOaICT1+/TKhahvy8b9U4b+jWJ/fGo74F/MMW675aSvANC69+gzzjlJOaq4aJowZ+wvL72iIMwaou2KsO22t5RZm7SzM9s8fp+hoFgxt4spzGQMkpt4+m5om1S3LzgV5fCJIMbu7z13gbCrIKZSKW7biOqBmTv4wpc6Yvf4IKQQdSdU2dyNeKltiJvH8HPn2zPICwT6jR2dTGvRKjNqRsRMZJ39/+6ghnqtTK6RKrtkn5hchMsDAF5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
Received: from DB8PR04MB7065.eurprd04.prod.outlook.com (2603:10a6:10:127::9)
 by DB7PR04MB5291.eurprd04.prod.outlook.com (2603:10a6:10:24::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3370.16; Wed, 16 Sep
 2020 08:13:46 +0000
Received: from DB8PR04MB7065.eurprd04.prod.outlook.com
 ([fe80::ed87:8435:3012:9618]) by DB8PR04MB7065.eurprd04.prod.outlook.com
 ([fe80::ed87:8435:3012:9618%9]) with mapi id 15.20.3391.011; Wed, 16 Sep 2020
 08:13:46 +0000
From: Alice Guo <alice.guo@nxp.com>
To: jailhouse-dev@googlegroups.com,
	jan.kiszka@siemens.com
Cc: peng.fan@nxp.com,
	Alice Guo <alice.guo@nxp.com>
Subject: [PATCH V3 3/5] core: provide macro SET_FIELD
Date: Wed, 16 Sep 2020 16:12:51 +0800
Message-Id: <20200916081253.27536-3-alice.guo@nxp.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200916081253.27536-1-alice.guo@nxp.com>
References: <20200916081253.27536-1-alice.guo@nxp.com>
Content-Type: text/plain; charset="UTF-8"
X-ClientProxiedBy: AM3PR04CA0141.eurprd04.prod.outlook.com (2603:10a6:207::25)
 To DB8PR04MB7065.eurprd04.prod.outlook.com (2603:10a6:10:127::9)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from nxf55104-OptiPlex-7060.ap.freescale.net (119.31.174.71) by AM3PR04CA0141.eurprd04.prod.outlook.com (2603:10a6:207::25) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.11 via Frontend Transport; Wed, 16 Sep 2020 08:13:44 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [119.31.174.71]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: f34be776-246c-4ff8-33f4-08d85a186f07
X-MS-TrafficTypeDiagnostic: DB7PR04MB5291:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DB7PR04MB5291C95D755675EAFEF0595AE2210@DB7PR04MB5291.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1417;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4QrPN1K+8Icta9U3e85k4/zqKmJgOgJH6YvlxjnoRswAkVaA8zkiAxNEA2S1yxus29gnclrPwoRQ51eYLkgJDCoLCUAaxqdToh2CTwDLT6x0xkKxnruaj0AxAej5rABMgfW717PeLz8akqCRLahHTRoq4HKZKQtkSQjoYEKEDMCthhxtcW/1Q9jiQJ/RzDXBQ8vTWErhkFElGV9SlEfet9yzQNBNDVN4XwWoMcS/+HKr28dS3UH466he4+kvR41yLNM3lyDasSpBIpHrxIZfo8wZRC0oFOLzfi+QX5c9QrzOhNn69A+w1u+b21bMuzI2zmyyfhyHWniqZ+gTPdqd8h6LL8apBuHD+U75vlpxdaAa4SwtPvaOMzmfk4l7Mw/v
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR04MB7065.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(956004)(2616005)(44832011)(66556008)(1076003)(66476007)(66946007)(86362001)(6486002)(5660300002)(2906002)(36756003)(6506007)(8676002)(26005)(4744005)(498600001)(6512007)(52116002)(186003)(6666004)(16526019)(8936002)(4326008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: pe/vZOvSAqnq/734kqUi6Qq1ZTKulM9ksJqZmVGK+9ywt4/z3l6h0GinHeAavDzZBvPaQDhQ8af0VD+pN5UAXqauuZa534LufPJM/3mf+0D5Tglfd+i4J2jg5YulfyhzRYLtQ6oeR9194uq+qRNt3PdefNdF/OvFZmyjU1xr7TbsUXyH7Tl+XrDpZBBuc2H9KKwLQDnxlYvCny+7B9H1EjKWwOQix1IcJ7SALiGJzsDyPvXZ0Ubsd/W4UVTXvxUlbEABhWI0vRy5aeZ3JDcMCXCEp62qAPaNxCX+QkTdVLmKyorHhTh2cv5uxSB6PSvy+Epkg76qcZze6Uyd1WHByOVi58qZyQfpuSjaInER1sp+8oVe684+hdvBEhQqh4aGZSbth2YjkCqz/gpRLrkTCO+3giCao7bX+fOpqL9v5Jl8o0Wdcd/T93u2lnMl/4GF4akzlSwItPvbzvTOCe87g4fYmstP1z4S+vmSwyjVJJPJnx6m0R6/nX+MLaKugzkQtM9Dyqhfn4MvTuWfaKcqya9i4v5KCpQEdEg0UfqCDifJiHddHDKpSAf/7F0kPfgchC3jIW0Ya7GGGHujpSyv+tbMts8ktWOBytFDwYWv49hVtR7sRtxaftZccyljBaOQwWUV/K1OtCBV1B3qU/RCNA==
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f34be776-246c-4ff8-33f4-08d85a186f07
X-MS-Exchange-CrossTenant-AuthSource: DB8PR04MB7065.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2020 08:13:46.8790
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TH4W0YreLOZIk6ZLd0KEcrTe8LdTqaPWUXdIM582qTRHoVb0FCdZg2n4THKOOPIrraTiYJUTsEwk/TAjCscaWg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB5291
X-Original-Sender: alice.guo@nxp.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@nxp.com header.s=selector2 header.b=GH+SuzUf;       arc=pass (i=1
 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass
 fromdomain=nxp.com);       spf=pass (google.com: domain of alice.guo@nxp.com
 designates 40.107.13.41 as permitted sender) smtp.mailfrom=alice.guo@nxp.com;
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
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20200916081253.27536-3-alice.guo%40nxp.com.
