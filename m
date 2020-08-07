Return-Path: <jailhouse-dev+bncBDAMFR7JZAEBBZ76WL4QKGQENZD53VA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x13a.google.com (mail-lf1-x13a.google.com [IPv6:2a00:1450:4864:20::13a])
	by mail.lfdr.de (Postfix) with ESMTPS id E2C5823E5F6
	for <lists+jailhouse-dev@lfdr.de>; Fri,  7 Aug 2020 04:41:43 +0200 (CEST)
Received: by mail-lf1-x13a.google.com with SMTP id p192sf169563lfa.0
        for <lists+jailhouse-dev@lfdr.de>; Thu, 06 Aug 2020 19:41:43 -0700 (PDT)
ARC-Seal: i=3; a=rsa-sha256; t=1596768103; cv=pass;
        d=google.com; s=arc-20160816;
        b=mnYfMM6/TmMzuXoChzpn57uADv9TMWp8d95q5anHkiHXwCKG9Ice97R/GNyVxBah0i
         qlNNJ3Vxv3gTvMa5xqYPuZ9g1BWGh6O1SP9f0GSyZL0z+vUK5nUvK+e6KWb0wrlFRtqx
         7bkozlmEvYTyEmxxEtMfYsUUM/kEiHE4uNUahD9OhTJEVC9ESznstds5StbM0cwiEDJw
         QOAIqq2rUjB7IuDa5UqRD8E7AGWJxEtBaW68pp8JkYs1MMF7KfY7uKNL7mRZkGwOVdfY
         f6dEATTsOOUvlYqdzcvgZvU4OlIZtv0VMGruu23+XZbWCs7LYj75Jpz+NEZsjqAJjE6O
         HwFw==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=TT1zPaB+50F0fzSqHAzhC/B+7Rj6NjvMplk1nWk/up8=;
        b=BDhWalzrxYB7vHVG/3a+af4BeSlWNYHjwkaj7hQjXDA1mnfW9vDJlsLQXmwJ2pTZFr
         0vJ82JPDFuc8hWOaeM1Fw3i5qacJ6M5gxjxFk4j7S1cgX1hT51EBdNwNL9GE8HQDC7Bx
         rGaI9+mxkx+Lmz36KRwur+FWNTpNVF3WM5+UfskWoyQ+UbY7MyO7s2s2owf+4TRiLUO+
         PrNSGVs6IazhKq11yrZUDWSpEObODoW8bWvCQCJ6LFSQdlOfcAWMnBbi78FdCKo4zmyi
         mKA4R8Za6sCO3OgncIAS8TDwkUNZDw4lCDV0mVthLMfh0dl6/BkS20gpNJhsKKORJEmK
         eo5w==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=SpTIUKbH;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of peng.fan@nxp.com designates 40.107.15.71 as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=TT1zPaB+50F0fzSqHAzhC/B+7Rj6NjvMplk1nWk/up8=;
        b=O0+BJjKqAazE3a6UGBRt42TgKhybMYUb6K1cAxPCKHRdXhwM4GsC2r/sezU3OkyMzl
         De3/xozt9jaqNQiaKbuTQOHK+nXlGCyzFZgLHR8o3l/jIJg7awPzdIEYupshNeIH740a
         BeajPrSPQlNA6ILLTRqioXV3Ufo6HRhhOvWIjE4OClR2qatnfDAC70PEpdxBLahN47BB
         FE7nu/rftl10VD2i0C8pBAMmMjQbfEOHt50LLxxgpNoqhRXhU8cWpST/P2vffOwlk+Ex
         3RoKmDH1r1yaonJIb2E0ewZ/FTVAHBLVNuSyadySMEwMJXh3gH9ewlqlYxqc4N50pvQt
         LMYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=TT1zPaB+50F0fzSqHAzhC/B+7Rj6NjvMplk1nWk/up8=;
        b=l799pgb/h2SUUjZbi7Zal+ocQmsEBt/4NvuQC8IUfdYeGk7NFu4NbYF3WDganP1RKl
         +Bf1aMuQ9SNJs23mD/TezCNJ/IYAnjvRuPCzDWfJkA9XYe/W+sf8OwrmMDRZPg1WODdF
         Q8y05CGXIpz/Hjx2uMSOGyvujAImjNpTSon2MfbKzSI29voF5lEyX/DrBWQu6/CxUrtQ
         KTrzGP+Ayv/15ami8OwtEAT8yjCXP3WyHRmBTEiznyhL1IAskZDLJOX370X67TMIjvPe
         bba4xa2W6Q3+8WJwr2VSlm0Hmze07Mh11kZ1jZRxeS7UWWMtqKs1MsbadD2ia0by/Vww
         Wh8A==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531ZpOd9EZ5guk4BjD230TDG1PG3WJpztXg4O+vTSv25Pk3yIDWi
	V49H5IRJ7B/ijYRLaES/0Zg=
X-Google-Smtp-Source: ABdhPJwzwcQvAy2w4a2ZAOVsJMyPWkZ2nGdEE1n/PdMpmuRMF/EbB3/YqgymasqqJpTH2c4LzmSfZw==
X-Received: by 2002:a2e:b8c2:: with SMTP id s2mr5428047ljp.179.1596768103420;
        Thu, 06 Aug 2020 19:41:43 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:300f:: with SMTP id w15ls1412700ljw.1.gmail; Thu, 06 Aug
 2020 19:41:43 -0700 (PDT)
X-Received: by 2002:a2e:910b:: with SMTP id m11mr5194426ljg.159.1596768102933;
        Thu, 06 Aug 2020 19:41:42 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1596768102; cv=pass;
        d=google.com; s=arc-20160816;
        b=RgLRAJnfIlbmOVdZEoL6SD68bVBaJYxtJXpbbtK6eFpxVer3tFCcQDfShEHSz4pv0C
         BkHGJYJoiRpcsmXjcMdO9f3RQZgMarFaK9okTOJBgsQUFOC3YUF/A3SZw+6NSJNbyzpO
         tnMTE7XKMIdHHsK5nAJZ3iXsMR8jUAddAtJ6gDmt6kVUqm3sXtnaC2xCQtfLIuNw6xE9
         tNBJGCGei+u78yduFYUi3ILT/ih7F26JgM+ttagU2ehQMQL3PudjndDVwk9xYa7paPGD
         0AS3Sp0ZrgD2hLNZRTPrwkMDmN0hEEyjubvhqgOkpV5peQksebzNMvDAytQ4xTyYDcVA
         siKg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=AUqw9v7tUdR2EqOVILnNkZ79LodG3exl7buhSxMTaVI=;
        b=Pgc6GcKNfA5brdDHv/U5U2WKqCZ5AQBArSyYSMLWnLK+Qsx/QBC/lX4aZIKvAOcObq
         PU994Dg9J00j112sjLutDlLExF1ZEP/M9+zhq6TW7T5EK/0yDFEosiSKVoGrAf/CIQMK
         qn806hUqrrXFud7cBeFVjPaQBTtNJMLE5wEVwP8Pi31U5sAAWTgDcZc0KgQjeIhia+lA
         qbQlYbX6NdLoQlplqoabNYDWDswHu3fC3ezEZxrhVKZAKs5nsbIBq5pqYooHBWoaodXt
         Soi2ZJyKxc39ti/P17K7Z7joLaCWUB4CaT1W8BQH+W36zJOpO9CuZUwi+bELj85PX2xd
         n71g==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=SpTIUKbH;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of peng.fan@nxp.com designates 40.107.15.71 as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
Received: from EUR01-DB5-obe.outbound.protection.outlook.com (mail-eopbgr150071.outbound.protection.outlook.com. [40.107.15.71])
        by gmr-mx.google.com with ESMTPS id 141si361595lfh.4.2020.08.06.19.41.42
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 06 Aug 2020 19:41:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of peng.fan@nxp.com designates 40.107.15.71 as permitted sender) client-ip=40.107.15.71;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P4Dn+2ZYTYrkj/NHv1cSbqJwxOoXTHjt9/O6rCmoeD0d9K/ZIAhZ9o7PMSQ/xyLjJ5VFdfAJwfY8bczweVv3HHV84NmyApTL468N2KP/KL1zJ2Xp+/hmPYAsp09m0ocfgapx7SqQT/mijmRBoY70mb3srRxvWa//Xqq/kLX0Kcw6rIAmdXzLWPQktO58PHr47SE+gVRFDlHcYSI50Api6H5+vVp+VykFF502mxPSOobmmrwY/CvVq69sRfWjXGsVIOAf66Rw+nz+XJFt0RwYoRk1oD3Y1RWC1lzmtFuyf62nqFFVAWNLofgivXfNgo2DLnI/VkZBwt7Dt4ThMeiE2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AUqw9v7tUdR2EqOVILnNkZ79LodG3exl7buhSxMTaVI=;
 b=CHC09eZdgAyUCWYURms8hH8V51kYyHgzbwc6RDWEdP6C40BvrEtonVFjto5MhgQFr9si+7b4BsfcXofWqDIjISC4nIXvGZQkz5h9VEkcZsts0X5WUfTsk4jedkuOt3uKVa6T0Tmp3780yJm7jUOAtOetj6l8xPmcjQoVhMPZIG3offeTQAjDwLeniZs3GQbhEAIYxGUtVLX8H+YlyU1IaL/jEXDtrj8GpTf0BxSYYzGolcCUklDSNUD4TPG7mhsQt75afoXeMynTV80Yh3AgEBnQR0htn8duHvxq7XgvtTUyRUJRsoDfrN+WBMznGVWgNRp1zlk1jE9wOy+o0xQf4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
Received: from AM5PR0402MB2756.eurprd04.prod.outlook.com
 (2603:10a6:203:99::22) by AM6PR04MB4087.eurprd04.prod.outlook.com
 (2603:10a6:209:4d::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.17; Fri, 7 Aug
 2020 02:41:42 +0000
Received: from AM5PR0402MB2756.eurprd04.prod.outlook.com
 ([fe80::485:d415:5f2f:e599]) by AM5PR0402MB2756.eurprd04.prod.outlook.com
 ([fe80::485:d415:5f2f:e599%10]) with mapi id 15.20.3239.023; Fri, 7 Aug 2020
 02:41:41 +0000
From: peng.fan@nxp.com
To: jan.kiszka@siemens.com
Cc: jailhouse-dev@googlegroups.com,
	alice.guo@nxp.com,
	Peng Fan <peng.fan@nxp.com>
Subject: [PATCH 10/10] driver: main: introduce early_loader param
Date: Fri,  7 Aug 2020 11:06:32 +0800
Message-Id: <20200807030632.28259-11-peng.fan@nxp.com>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20200807030632.28259-1-peng.fan@nxp.com>
References: <20200807030632.28259-1-peng.fan@nxp.com>
Content-Type: text/plain; charset="UTF-8"
X-ClientProxiedBy: SGBP274CA0019.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b0::31)
 To AM5PR0402MB2756.eurprd04.prod.outlook.com (2603:10a6:203:99::22)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from linux-1xn6.ap.freescale.net (119.31.174.71) by SGBP274CA0019.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b0::31) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.19 via Frontend Transport; Fri, 7 Aug 2020 02:41:40 +0000
X-Mailer: git-send-email 2.16.4
X-Originating-IP: [119.31.174.71]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 8fba0968-c275-4ff4-4c17-08d83a7b6a99
X-MS-TrafficTypeDiagnostic: AM6PR04MB4087:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR04MB4087F48AE0EB4158FC842C8588490@AM6PR04MB4087.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Y4QJNxTOS8To76fyCicAJWOzzN/GZc5qqQiHPrrh+sl6Sut/b5cMhV3/gnF/SLlIVZoV/nwEo6hS8KaSarQR7oWuSlj14hjCEb2IiNtSrT4IS0KBq0fR1T2jC/REeILVx2OMXpt3OWryhQo901tEzC7GdVfY2vEYCiuqgA1H8qFqZY+ediCIrcU4j4HZL+sgyc1QsLCtJXrwcuc8/nQc0hSP8zlIwMPdEgYKIrphrDo6egZtSCsQ6WMiV98FOeCRKQYtZh++c4avfbjdMCVxnxn3FOqVtHf0lngx5+QZ8LeORASEGxL4AGzbVBzNnIKKK5URHDZaLiASGW2ZB0ezPQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM5PR0402MB2756.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(39860400002)(396003)(346002)(136003)(376002)(366004)(8676002)(52116002)(478600001)(6916009)(1076003)(6506007)(83380400001)(9686003)(6512007)(6666004)(8936002)(66946007)(66556008)(66476007)(2906002)(16526019)(26005)(956004)(2616005)(4326008)(5660300002)(316002)(36756003)(86362001)(186003)(6486002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: pWtNuorlkfP+nDpgzfGCIWiPbsiGSwyUd/oHQiQ5G7sIpq/JjefGohkRvQvT0asYfMp9KwrAjpl0YmbjoxttvGaAoYFzQ0iYXsrPGv05EsVmgXuQIYpXac5gRgHGO6F5nonv0fCPCp+sL/W3IMvadtxdhXUFULIlFk4kEwyiECZuio5eOEjNJZsnujaFzO1qy0dkPjZUFn0F21w8Z47q9dMUIoiM+XtfwH5wSg45tQSxeMOFzVpa/D8QWG4s2RSrrOA1DgBAUoR/L+4Du91qV9GhFjyF1DQtHOxSyIhBKeT2AiUi7czI6E8iGJA9+UzGgiZWVrHQC9IRAinxb7ERjrqsy9+FguUkMcWuNY6VaQu6TIs09K4Cv0UXLCNSGyHk+rt/4Sbdn78cUr9Ay1xA6BkoCm+/LD74EZw6+2XPZybcktWt/QkEWCNXY9t2NARCfQOuik2OvJ7vmrwp/a5ZUN6NGJRuRs+lzzYtxLx3mNX5vn+FDXmCn5dlqgcz3A6gmA5nN3qzDF1QdzU1zJru5lUbYE0lOSxD6wke8WBxNGrPS8QMHYgQbA1qDIlAzrxIMo7fT9397uU/Rto1lik+Y258fAskDU7dvePx+zO+ZsPS90o/bZxUZF5J4styqXZefC8Gre1W2WUc7NM2KBwdIQ==
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8fba0968-c275-4ff4-4c17-08d83a7b6a99
X-MS-Exchange-CrossTenant-AuthSource: AM5PR0402MB2756.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2020 02:41:41.8594
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0vIc2VYdd9O4brsFW3O2KT3wiIXI/Bd2GzD7YLmlylWIZNLIjErDAPEi1YbbI3EVmZJpWMKhhLjlDzzSBkYNkQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB4087
X-Original-Sender: peng.fan@nxp.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@nxp.com header.s=selector2 header.b=SpTIUKbH;       arc=pass (i=1
 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass
 fromdomain=nxp.com);       spf=pass (google.com: domain of peng.fan@nxp.com
 designates 40.107.15.71 as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
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

If early_loader set to 1, it means jailhouse hypervisor booted
by an bootloader before Linux, so when "jailhouse enable [x].cell",
we need to bypass some operations.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 driver/main.c | 89 +++++++++++++++++++++++++++++++++--------------------------
 1 file changed, 50 insertions(+), 39 deletions(-)

diff --git a/driver/main.c b/driver/main.c
index ec302639..28c65f90 100644
--- a/driver/main.c
+++ b/driver/main.c
@@ -103,6 +103,7 @@ static int error_code;
 static struct jailhouse_virt_console* volatile console_page;
 static bool console_available;
 static struct resource *hypervisor_mem_res;
+static u32 early_loader = 0;
 
 static typeof(ioremap_page_range) *ioremap_page_range_sym;
 #ifdef CONFIG_X86
@@ -363,6 +364,7 @@ static int jailhouse_cmd_enable(struct jailhouse_system __user *arg)
 	unsigned int clock_gates;
 	const char *fw_name;
 	long max_cpus;
+	int cpu;
 	int err;
 
 	fw_name = jailhouse_get_fw_name();
@@ -474,46 +476,46 @@ static int jailhouse_cmd_enable(struct jailhouse_system __user *arg)
 		(hypervisor_mem + header->console_page);
 	last_console.valid = false;
 
-	/* Copy hypervisor's binary image at beginning of the memory region
-	 * and clear the rest to zero. */
-	memcpy(hypervisor_mem, hypervisor->data, hypervisor->size);
-	memset(hypervisor_mem + hypervisor->size, 0,
-	       hv_mem->size - hypervisor->size);
-
 	header = (struct jailhouse_header *)hypervisor_mem;
-	header->max_cpus = max_cpus;
+	/* Copy system configuration to its target address in hypervisor memory
+	 * region. */
+	config = (struct jailhouse_system *)
+		(hypervisor_mem + hv_core_and_percpu_size);
+	if (!early_loader) {
+		/* Copy hypervisor's binary image at beginning of the memory region
+		 * and clear the rest to zero. */
+		memcpy(hypervisor_mem, hypervisor->data, hypervisor->size);
+		memset(hypervisor_mem + hypervisor->size, 0,
+		       hv_mem->size - hypervisor->size);
+		header->max_cpus = max_cpus;
 
 #if defined(CONFIG_ARM) || defined(CONFIG_ARM64)
-	header->arm_linux_hyp_vectors = virt_to_phys(*__hyp_stub_vectors_sym);
+		header->arm_linux_hyp_vectors = virt_to_phys(*__hyp_stub_vectors_sym);
 #if LINUX_VERSION_CODE < KERNEL_VERSION(4,12,0)
-	header->arm_linux_hyp_abi = HYP_STUB_ABI_LEGACY;
+		header->arm_linux_hyp_abi = HYP_STUB_ABI_LEGACY;
 #else
-	header->arm_linux_hyp_abi = HYP_STUB_ABI_OPCODE;
+		header->arm_linux_hyp_abi = HYP_STUB_ABI_OPCODE;
 #endif
 #endif
+		/*
+		 * ARMv8 requires to clean D-cache and invalidate I-cache for memory
+		 * containing new instructions. On x86 this is a NOP. On ARMv7 the
+		 * firmware does its own cache maintenance, so it is an
+		 * extraneous (but harmless) flush.
+		 */
+		flush_icache_range((unsigned long)hypervisor_mem,
+				   (unsigned long)(hypervisor_mem + header->core_size));
+
+		if (copy_from_user(config, arg, config_size)) {
+			err = -EFAULT;
+			goto error_unmap;
+		}
+	}
 
 	err = jailhouse_sysfs_core_init(jailhouse_dev, header->core_size);
 	if (err)
 		goto error_unmap;
 
-	/*
-	 * ARMv8 requires to clean D-cache and invalidate I-cache for memory
-	 * containing new instructions. On x86 this is a NOP. On ARMv7 the
-	 * firmware does its own cache maintenance, so it is an
-	 * extraneous (but harmless) flush.
-	 */
-	flush_icache_range((unsigned long)hypervisor_mem,
-			   (unsigned long)(hypervisor_mem + header->core_size));
-
-	/* Copy system configuration to its target address in hypervisor memory
-	 * region. */
-	config = (struct jailhouse_system *)
-		(hypervisor_mem + hv_core_and_percpu_size);
-	if (copy_from_user(config, arg, config_size)) {
-		err = -EFAULT;
-		goto error_unmap;
-	}
-
 	if (config->debug_console.clock_reg) {
 		clock_reg = ioremap(config->debug_console.clock_reg,
 				    sizeof(clock_gates));
@@ -548,7 +550,8 @@ static int jailhouse_cmd_enable(struct jailhouse_system __user *arg)
 		}
 		/* The hypervisor has no notion of address spaces, so we need
 		 * to enforce conversion. */
-		header->debug_console_base = (void * __force)console;
+		if (!early_loader)
+			header->debug_console_base = (void * __force)console;
 	}
 #endif
 
@@ -570,17 +573,24 @@ static int jailhouse_cmd_enable(struct jailhouse_system __user *arg)
 
 	preempt_disable();
 
-	header->online_cpus = num_online_cpus();
+	if (!early_loader) {
+		header->online_cpus = num_online_cpus();
 
-	/*
-	 * Cannot use wait=true here because all CPUs have to enter the
-	 * hypervisor to start the handover while on_each_cpu holds the calling
-	 * CPU back.
-	 */
-	atomic_set(&call_done, 0);
-	on_each_cpu(enter_hypervisor, header, 0);
-	while (atomic_read(&call_done) != num_online_cpus())
-		cpu_relax();
+		/*
+		 * Cannot use wait=true here because all CPUs have to enter the
+		 * hypervisor to start the handover while on_each_cpu holds the calling
+		 * CPU back.
+		 */
+		atomic_set(&call_done, 0);
+		on_each_cpu(enter_hypervisor, header, 0);
+		while (atomic_read(&call_done) != num_online_cpus())
+			cpu_relax();
+	} else {
+		for_each_cpu(cpu, &root_cell->cpus_assigned) {
+			if (!cpu_online(cpu))
+				cpumask_clear_cpu(cpu, &root_cell->cpus_assigned);
+		}
+	}
 
 	preempt_enable();
 
@@ -964,5 +974,6 @@ static void __exit jailhouse_exit(void)
 	root_device_unregister(jailhouse_dev);
 }
 
+module_param(early_loader, uint, S_IRUGO);
 module_init(jailhouse_init);
 module_exit(jailhouse_exit);
-- 
2.16.4

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20200807030632.28259-11-peng.fan%40nxp.com.
