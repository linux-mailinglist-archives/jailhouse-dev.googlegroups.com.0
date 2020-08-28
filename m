Return-Path: <jailhouse-dev+bncBDEN32754MOBB3MHUP5AKGQE7TF4PTA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43d.google.com (mail-wr1-x43d.google.com [IPv6:2a00:1450:4864:20::43d])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F4132556AD
	for <lists+jailhouse-dev@lfdr.de>; Fri, 28 Aug 2020 10:44:30 +0200 (CEST)
Received: by mail-wr1-x43d.google.com with SMTP id 89sf180661wrr.15
        for <lists+jailhouse-dev@lfdr.de>; Fri, 28 Aug 2020 01:44:30 -0700 (PDT)
ARC-Seal: i=3; a=rsa-sha256; t=1598604270; cv=pass;
        d=google.com; s=arc-20160816;
        b=lsnVQyvyFJ6gHs2emD6mwaQt7GcaCHhKkkjNGxVXIXQ2Qg4X2Mmt0ArTB4O91AldlM
         e7vrQgNDGpIp9sK8GSuVBf9WPlurm2ju7OqKJT2rEuYmhDtn+pM2C0frwui4weefxrsb
         OmUg9wrA17S6jCyYIUkODXjGa7fMgbzNbVTAF5ep1p5dRoRCcCSrrVKLjPvjf4Es2Vj/
         Ee03RSNagao5ESVmwYk2TdRhtED6R9AJtDYfd7xCMocgtp1es0Vev1Fx6qZYlWCsc2sz
         06BQCFlg12mEAnCeRNMhgdaLTZJy8TLfb6s6I55XJQgfDqW5yG8Zi4OZdqm4xxyUOehq
         EChw==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=m6bnUGRhCOhAggTG0KR9yFkJ1xiLkkfQGB+Fe31Q0Bg=;
        b=odx7rpXucQhcbzr5yQoLfrqYVVP94La7OimUqVR6zVG5l2KYYxWr2D1rw8vsHmuiWe
         4TKAwnB6/NxM84hMkkxh6BmBnG4kz5RqKiL3F368MRZ7bV0q4Wxvj162rC4i5uhU7/lI
         J/Szax3eGim2W5p7GzU2ClFo7UYfXroHovd/KwqwRL/kTctvwI57yVF0s9CfvVPsJ70+
         p7gIxt2EKPGnY4m13PcScoLjl/k2zABTJOhlJW21tMt4OhkB3RPuv53x4crdskgjqBB4
         hHU1WOs7v93zcdXye/dZ4s8kFlAfnhG7nZWMu4ATB/MxBQrRxOfQfO0bIjPzlNQHX7Yf
         tW7Q==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=eK7vUL1J;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of alice.guo@nxp.com designates 40.107.0.41 as permitted sender) smtp.mailfrom=alice.guo@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=m6bnUGRhCOhAggTG0KR9yFkJ1xiLkkfQGB+Fe31Q0Bg=;
        b=XtPRkpraNH5y3hzKURF0VBtN3S7LKMQr33UoOXm02Dj2b5oFkokd+nxu8N9lqGXh+w
         MSG5xWOiKZ69F1irK9+WrF/XP98jz1JY4O3eJCeLOWGDd7P5shrT0XBp1kY+elCs3cMv
         8QxBXC+T0x9C9iXrxG37wI1UM+sFqZ9OB3l1zersm+dwLiZxFy7xREE37pTnYWRhr/QH
         wVm3QcodUr5kyo0BwgcYEq+wgwLxTG+U0557OPmMLiQZ5svzxzyvXwydOhF03elG5ykZ
         lcE8tdyonQvkbhevrFqeMtyzv4w2bystqwjV64q9hSGFBaBleiStfl67MdMgtQW9yzs9
         JOGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=m6bnUGRhCOhAggTG0KR9yFkJ1xiLkkfQGB+Fe31Q0Bg=;
        b=djRITtH3dCGQVbipuWwZ3tNlCOolS1rA+8q5Ucwo1Eujut1YJxdGdomq3id9Mn0Je8
         sVJgmTdk0sNROiHKvNiu3fflDrco2VCT8ZMEWruBmFFN1djSr+KuYZQFJoXnvPoDq18o
         lybu8I6vxb7nit91kGCmaW5bcB20zMUImS3FyEAvxz7BmbKCz3xV0SnY24HepBkVmSd9
         Jz2ieZFIRDK3CX9AsiUJVaEtmRBORfkBP8T7qDWEY/pZ7ds/mmIgSf0Wf9fKTrUCDFTf
         lHk41zrN57ZFj0DzPIIig5rNJObRYWH12Lhe1omxftk83jJDia2LaxUIuqHm13bkVy+j
         lGXQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533oqWoJM6Liykfjie0LRaAwfpvi9z+qKzHMszBUET3JL0E6uuGB
	ZWjZp12GWq0PZMdIXJcjONA=
X-Google-Smtp-Source: ABdhPJyIEGrPM9BqRJZ3CuPhluW5Y8cawf697kZNPDcTI24hhTYShRzY087sIP57zAmj9nYGpa6bXg==
X-Received: by 2002:a1c:105:: with SMTP id 5mr565802wmb.83.1598604269967;
        Fri, 28 Aug 2020 01:44:29 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:81c2:: with SMTP id 60ls742231wra.2.gmail; Fri, 28 Aug
 2020 01:44:29 -0700 (PDT)
X-Received: by 2002:adf:a1d6:: with SMTP id v22mr472023wrv.185.1598604269344;
        Fri, 28 Aug 2020 01:44:29 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1598604269; cv=pass;
        d=google.com; s=arc-20160816;
        b=KLEjTCjfJWNGoOiDImQtIwsSCs4ByGUsNzKnkYiwyD44osOfMnoNcnC46Iye0OtQsH
         L5r5A85TNJpt/3DvlJy7l4Ahj4BBTBukAnwcpOniZHv7+UWNJgaD8SnvxKJQ7pTUwadq
         95uStPrimAUN4VLQVlDXlRKPbHWVKzPqrtRH2Mf4gZOtvOzVbJ40EfT+BHrEJaTc841m
         Un9wloJoH7ZOlOOHnrFtS8imzB9XCWUO92K68Gl9gl+r480wfjYagBC0Obbe/1f8rkTL
         SXvdaSntARyfjY+3J5ig8Jj1rnoX5wXKwzpnIutELuW5QE3K05jdHq07sAOEi79W86+h
         d6eQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=KApypnFq9NqKf6ZAoqcwK9+uRHwqoJZCQ5leOxlDijc=;
        b=Nvcukc58qq3twNOalGpXjXh0Sm3eoIgcPOg1IfuLWBKlh9c5TQ8nXqdvjwscllHbFc
         pB+y+kU0Yfho4oySTuh7R+44u6Jyi8zdNGQz0mBKhO1xgKlkDcJqTHMiGkTO80LCpqEG
         pillnqekrgWTfzU5zZU+TCRRWEoq97pdeaHY+tl2A8xdJIiUYY+Yd2HgWo5tlsJYaxRK
         qYa1hxnt4tjTWrZ4HodK07CsbCt9A6qWbUO2Q3hai2JkPOVFty4d997soPMmTN2Ad4pw
         HjNLVcWJsDSme4hfXeRJNj3/Dd1JYwjNzd2uVriHbXEann4fJANzoD5OcwhJMx1gUBSI
         +7BQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=eK7vUL1J;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of alice.guo@nxp.com designates 40.107.0.41 as permitted sender) smtp.mailfrom=alice.guo@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
Received: from EUR02-AM5-obe.outbound.protection.outlook.com (mail-eopbgr00041.outbound.protection.outlook.com. [40.107.0.41])
        by gmr-mx.google.com with ESMTPS id h11si23537wrc.2.2020.08.28.01.44.29
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 28 Aug 2020 01:44:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of alice.guo@nxp.com designates 40.107.0.41 as permitted sender) client-ip=40.107.0.41;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RaY5eGyGUotZJlrRUZJUcicvmnVMnl/ordwn5w8haQ7PFFzP9je9G+lsN1phIFx91z7Pe1hkOqSSGxZVaX8/NpppqTM61oM86icfZZ/hTGkjP3q2TfF53gwp0s28mGd/2v64+kFrbRi/wPWKpbSdaQK+5/OyMdPwKzxvPrUIayy5KutAHm83ctX3g7kX8H+I3mIR7ftB9PKm/dD7MGatbam7ZFnviubUH8EHJfHvJ//Sva7MndqEzdfTuKtlmNrR1SZ6AwxD3FlZ2NIKqFO6Cbii7iqmmzdOXkj2DC4RRuK0sQsYTPXIDwmSq1KLApYBLDB6RcdoVXbFnIEJZXC7SQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KApypnFq9NqKf6ZAoqcwK9+uRHwqoJZCQ5leOxlDijc=;
 b=k/LQmp41cwaxeiAa5r0WQ3k68tB85dmanIJwAabydlFC1GcyHGjzeCb4OG86jnD0BbhWnSVMq6MvCRWLQdadVaMh5fvPdvNaAu3eT+ksNyduKD3EBu+grEXCwyemEuip77Mlib47kPOorA+elkbT3b8edFLjk+tuw8hcTsCKfu3iBZ1HhfKcinoFiI4k0SmMSE8JKKWFS/KmCcrI+oc7LdRG72jyMqKOYawUzf9cVajPv8MLpQckKBhSnKHXLK2NDMhTLnG3BnlnqM85LZyvqs/odPi9ZCyYRDdKmGsTgc4KDPixxFtgwbxIN6bCBp7aDMhfKGoP4AdzGlH45a9QCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
Received: from DB8PR04MB7065.eurprd04.prod.outlook.com (2603:10a6:10:127::9)
 by DB8PR04MB6651.eurprd04.prod.outlook.com (2603:10a6:10:10e::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3326.21; Fri, 28 Aug
 2020 08:44:28 +0000
Received: from DB8PR04MB7065.eurprd04.prod.outlook.com
 ([fe80::5042:d7a1:10c0:c40e]) by DB8PR04MB7065.eurprd04.prod.outlook.com
 ([fe80::5042:d7a1:10c0:c40e%6]) with mapi id 15.20.3305.032; Fri, 28 Aug 2020
 08:44:28 +0000
From: Alice Guo <alice.guo@nxp.com>
To: jailhouse-dev@googlegroups.com,
	jan.kiszka@siemens.com
Cc: peng.fan@nxp.com,
	Alice Guo <alice.guo@nxp.com>
Subject: [PATCH V2 2/4] core: provide macro SET_FIELD
Date: Fri, 28 Aug 2020 16:44:23 +0800
Message-Id: <20200828084425.21282-2-alice.guo@nxp.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200828084425.21282-1-alice.guo@nxp.com>
References: <20200828084425.21282-1-alice.guo@nxp.com>
Content-Type: text/plain; charset="UTF-8"
X-ClientProxiedBy: SG2PR01CA0157.apcprd01.prod.exchangelabs.com
 (2603:1096:4:28::13) To DB8PR04MB7065.eurprd04.prod.outlook.com
 (2603:10a6:10:127::9)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from nxf55104-OptiPlex-7060.ap.freescale.net (119.31.174.71) by SG2PR01CA0157.apcprd01.prod.exchangelabs.com (2603:1096:4:28::13) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3326.19 via Frontend Transport; Fri, 28 Aug 2020 08:44:26 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [119.31.174.71]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: d72cdbba-7c1c-437e-8c45-08d84b2e933e
X-MS-TrafficTypeDiagnostic: DB8PR04MB6651:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DB8PR04MB6651652A0F5128F313E1C929E2520@DB8PR04MB6651.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1417;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Xu2RYuyA1e0tIhzyb1Fy1SeXS62X5UkUlP0CLIkbAAgzODrUBxBCdq6EkYXfd7QwPkB4CZdOkz4B6l7Lesj6ZaDNCbZSsCE5R2tWDfxji8nXDwBXFSWbKxzYtVK7VCWYTCwwhI3l2L0CLRf2faDIfWOUWWJba0gxQKoi/ivr+fpf+mzgf4TWMO1OWHK2twBZY97g1Z4ZPPniGQUEcjIIlzLjATcRt7TspO4smAEdYPML1YuS+KLLYME5mbAu5ri5xnpSuios/M9ty5LNRw92U0PbE7Ehz0Y4rR8th1t/5/OcZU/IGeqsxElLh0Qf02E3nSbVKRHUShKIy+wWoSM9KQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR04MB7065.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(366004)(346002)(39860400002)(376002)(136003)(8936002)(2616005)(316002)(4326008)(36756003)(52116002)(956004)(26005)(16526019)(6506007)(6512007)(2906002)(6486002)(186003)(44832011)(4744005)(6666004)(8676002)(66556008)(86362001)(66946007)(478600001)(5660300002)(1076003)(66476007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: /LWBqhA0vq++37+u/jDHw1Gtjtq1/pT2X2fRPBa096mJ0w9gXwIScTyyS595og4nxd6+bY93pEF+xZroi3xN+pDXfjWfp8aebPslZcLKiwVVTdJ8wgmpev+AeW9YcHhIkszzoJ/okp+eVxeIFM+pdCVMZrMOO8AcKj6gkIflOPNXwDn9VM0DfkDPNB7GLIpeTlZ3h04UilvdLfrR/sjhf5DnuFHNjHksUMx4jfQFJWy1DhU92mBrRQFcFIP42mtkQuK4+lmNYPtvWjfp8mtb2nl+O3M/ZIeVJRXAIzLdkpMX4d6a//Hoy6FIXWqm3cfA3pOXYRtrsDtGZB63MoAI2NiXwRMjVKiL7kVRNSMg8Iszi4IAE0i8NtYTAQWpQVhVpogiMxB5FMkJ325U1UpERj+sSZK4yprjf9lrt1eAEcoapysI0fATrh7M5Gf82dOir5retQaHjWGAbX2+zR2vhIllVPpNaNYla861YWdHRj+CtT8BLBOps5gW5Be8HTHETsBGusKto+COtbmYXRXfFToBo23iB9fa75S0UHSxIgO8+TqYlZUevM9zPjYj9Roipcr+lZmF5nOafnCeJgX2mqwfkpCOnsbjIHmmSXJXU9PUZ20cakrlkSHGzLRR9+XoUzVV430MUhkCQgCKqAt6AQ==
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d72cdbba-7c1c-437e-8c45-08d84b2e933e
X-MS-Exchange-CrossTenant-AuthSource: DB8PR04MB7065.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2020 08:44:28.6940
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VzoTjhQ2FRZiQUMN7IkmG06HGyMaLsozWgj1ifLRKXxh5yH9xbjJGfl+te2uG+m4QTrgWin8FSFFZ+BPYgUFHg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6651
X-Original-Sender: alice.guo@nxp.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@nxp.com header.s=selector2 header.b=eK7vUL1J;       arc=pass (i=1
 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass
 fromdomain=nxp.com);       spf=pass (google.com: domain of alice.guo@nxp.com
 designates 40.107.0.41 as permitted sender) smtp.mailfrom=alice.guo@nxp.com;
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
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20200828084425.21282-2-alice.guo%40nxp.com.
