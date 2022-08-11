Return-Path: <jailhouse-dev+bncBDJMJPGY2MGRBSGS2OLQMGQE5TA7NGY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x439.google.com (mail-wr1-x439.google.com [IPv6:2a00:1450:4864:20::439])
	by mail.lfdr.de (Postfix) with ESMTPS id 6400958FB6E
	for <lists+jailhouse-dev@lfdr.de>; Thu, 11 Aug 2022 13:34:33 +0200 (CEST)
Received: by mail-wr1-x439.google.com with SMTP id e14-20020adfa44e000000b0021f15a9f984sf2666232wra.20
        for <lists+jailhouse-dev@lfdr.de>; Thu, 11 Aug 2022 04:34:33 -0700 (PDT)
ARC-Seal: i=3; a=rsa-sha256; t=1660217673; cv=pass;
        d=google.com; s=arc-20160816;
        b=P/Mp4cTT2kxkjeJGt8dshTfBDy5xYWtNnBR+SnWXU+0kliPLmbKeo5PAx2QsrzO4O1
         yhq0Mq4Pu3n0b7q+zzQuulL+dkyinISdciKWpPgvRwPvt6XObkAIThz9Lj9pmgDl0Nsz
         KGl7xbPfTFCApadNZcpSm3OibmuGCpOMi679nuWTpLgqX6O9bZ0zFGc6sBwhjzrTj6ai
         eI59q+DcLSRdHDlLOuOhl+8qudX2e2zV3FLA3vvVnA77zQWZVAuP9TSR1/iGZMbcw8tf
         U8PFD+x22CAf75znSkkVbULhzbOoPWLDuTJI4sA8Nv5KBr5RPkPQfUUSzKJbkvSAG4Xg
         iWQw==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:sender:dkim-signature;
        bh=22mxV6OUNPWpI3fXDxW36ihkdS1+T1CEYglQ8D0VbKE=;
        b=hqPDfnXyqU4ipWYEbSHeGDo6V6oUFHxHKp3G4qDFcySK2q9Yd15A9pd4VkuR3HXzZm
         l/T2dkfKJ8hsZeWnCDfk0oMcM5Q9KtrVNlXSeVfbR7/oWR30SJh7YfkYxs2MiS7A0mwy
         1GojSwEVeoJlTBg++orYeRZL0If3glJWwYqDupJvqYZPGgbiJYERUPAjRNJdZ3TJ53wP
         sy7XA6UAyTCO1SPtA/RFxBfTmZikVp6IjGgQ1HNBBTZ21qpunkqmeVQR0UTAWvR/Dde3
         8QDb99j4hcKRSHH1ZA7/1ErZoiysk+f6cgmT4TeiIHUXO1BRwAzfLXq3RXqwv+sF3pPT
         8rJQ==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@siemens.com header.s=selector2 header.b=WHqj9cax;
       arc=pass (i=1 spf=pass spfdomain=siemens.com dkim=pass dkdomain=siemens.com dmarc=pass fromdomain=siemens.com);
       spf=pass (google.com: domain of henning.schild@siemens.com designates 40.107.22.58 as permitted sender) smtp.mailfrom=henning.schild@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:mime-version:references:in-reply-to:message-id
         :subject:cc:to:from:date:sender:from:to:cc;
        bh=22mxV6OUNPWpI3fXDxW36ihkdS1+T1CEYglQ8D0VbKE=;
        b=ix+ruDU/nnFD/qVrDVGZdrba82+JFkU9Jq3ax730jazXTgyrAOeMKV1vjlN7y9KK9v
         cufhbet2VUi5Fh7iDJovlpz9YXiSSMSp0WrTsSFjFImK/KUj3n5T8nhX8gBM31f5gMJ5
         7ct/RxnhX7UC7FL5tgh6Ddc2/qYRXJAgC0phKM/QUDtJl3PwPr3TGqas2TibX5qkhJoK
         p7Q0/gReeyrGOjxG4QrlzrB625N/w/OKd1LOyGaVAK9z9oslRkt1csdDFapLCc4ih+Hp
         fpeJRyMFoYqLNS9+TTM2f/ivXSVZHqQWvC+/nsfXUmxgGHTXiyQqz++rR6XWFwfe11iJ
         dy/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:mime-version
         :references:in-reply-to:message-id:subject:cc:to:from:date
         :x-gm-message-state:sender:from:to:cc;
        bh=22mxV6OUNPWpI3fXDxW36ihkdS1+T1CEYglQ8D0VbKE=;
        b=RYD+0CyYrXrRT4QPHyAcJ1R4H2wREld6ouVuR03yHk8W8gr1l0bLWKZz9TaYWEd78C
         nACVZILWv3b0OqE4tZGqH/NWPfWwSDRC4SnVCG6JsWyL4BGEtH6t2SOFVcZDBkp9xgpf
         TDUi4vJQIg1AX2HWi+BSQHheaRKX9mkENvvi1PW6f5k1UnlDf4WCaBtAdkRrAVus/W82
         4m0xfb4WjxFaAxFFUEiD/QdPLWzIY7mi+GtM+JUnJFxHO7bfV92bSa+w3uphQwBKhLJk
         vNUZYqMZ0EDqQ+C3yawCuRCnTJVTO//JyW6UB92l6/8xpO/WM88fRIR1257IHasK+s0e
         EzSA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: ACgBeo1XcHWxYrx1P3zK533d/wkB755xlOgaAy5EMWA3p6QIKJJZPBjS
	BFaHbb/u6dX181GvOhbnWv4=
X-Google-Smtp-Source: AA6agR55t3IoEX0PEILKxPjbci8eFlKsrIM8X5hN7FeTkZvMl5JxCev36sjSHpjHCJOk2omN/Tb13w==
X-Received: by 2002:adf:fb83:0:b0:21d:649a:72d9 with SMTP id a3-20020adffb83000000b0021d649a72d9mr18805728wrr.688.1660217672909;
        Thu, 11 Aug 2022 04:34:32 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6000:255:b0:21d:a0b5:24ab with SMTP id
 m21-20020a056000025500b0021da0b524abls2159527wrz.1.-pod-prod-gmail; Thu, 11
 Aug 2022 04:34:31 -0700 (PDT)
X-Received: by 2002:a05:6000:3c6:b0:220:5efd:423c with SMTP id b6-20020a05600003c600b002205efd423cmr20292131wrg.214.1660217671286;
        Thu, 11 Aug 2022 04:34:31 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1660217671; cv=pass;
        d=google.com; s=arc-20160816;
        b=qcRhDsrcjmY2yQEpYlCPcPQmEKFcA7eb3RkE3CUysjmrUE02tmnlJ3BbNQf0jJiswE
         4FCTqdTBMlBtJNYEHJH3I88EVWi5Kh8rHxCIaBc40VdDiIHklIjpDYWN1diOKuJRLtkt
         oxIa/zQUVRFJiSCG40VLx6xyJDmMqMNzAlykmbghxMJaeB8hYeNcto8YJNn4sbiHcfR5
         pSTrycB2fX9AiT+8sLjNdOJYwR+/iJnnnpEUF0GeblPx75To166JfTSxGZ5RpGNnbXxG
         VYptKd7ZiUVqNiavlx3e03EGj47PeC1GewsjHrn1/SxksYLI+gW/wH+xFKSU6ua7pPP4
         HO8Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:references:in-reply-to
         :message-id:subject:cc:to:from:date:dkim-signature;
        bh=4j5+qyh5UZTnUZjRt14s+8aWozmGdj6Qz3XthX+MU4w=;
        b=bPZZQrXN9IF9HrHZ5aoqKY8MTpdtQfOR5E9PUQpbqI+9G2UVhtT8NAKb6n0LILqBIr
         3f0kRrq/Rglr+epdpt+ID0B850UxcvjPztTVzkhRPxB0KoixyUSWaKbVOO1INXREPhLE
         RO7vCQP11vNwY+glx6790OqRwIegY4SPJzF8hdzJTzO4lDH8u4i5455KXnRhSfo/Wj7e
         QvYBszCmDN5qCKxOgPit6IJw9OpHFKdRMNIy/pxRdbZ2JL6YyOEdEzMaJJ+K8rZPhqrI
         jjXnqkeZ7CNXoAxW4iyKG0S54+86OaPiT3Gz18hxNhQu+nY1W81C7tOs2PbzGM63+V3+
         Fj1g==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@siemens.com header.s=selector2 header.b=WHqj9cax;
       arc=pass (i=1 spf=pass spfdomain=siemens.com dkim=pass dkdomain=siemens.com dmarc=pass fromdomain=siemens.com);
       spf=pass (google.com: domain of henning.schild@siemens.com designates 40.107.22.58 as permitted sender) smtp.mailfrom=henning.schild@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2058.outbound.protection.outlook.com. [40.107.22.58])
        by gmr-mx.google.com with ESMTPS id v22-20020a1cf716000000b003a5582cf0f0si130993wmh.0.2022.08.11.04.34.31
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 11 Aug 2022 04:34:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of henning.schild@siemens.com designates 40.107.22.58 as permitted sender) client-ip=40.107.22.58;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Vzm4p2IUbm+GxRT7guXtpVSfpulx9Eh6AkzyogjsJx0xPN5RtKVtIjVsVNe7OanmB0H0WxpYvCw4XJAgfoWOYbFJXHWfrK4nUzVfmyx3Yu4aFeqzxOGcA7JTkr8cWiclScngdCPERaya9kPmGHwiL4ywaccI7d17tDGdz6ckMpEOSWj/xjO8JHXFkITMHWm30ie+Hj9cXAr7gMvMponrkFlCZIOqfSDfjYEprr3DWnp3R7cnZToXL4x0zUyxqF53iFoh2nOnEOQprFTUzuZSSMUer/39YOnsqVv8gOQIRXgem1qaOnZIMNrqkZsAdKz9EBCWVOMh7Z6zTSd0huqj9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4j5+qyh5UZTnUZjRt14s+8aWozmGdj6Qz3XthX+MU4w=;
 b=hakIZ/kV0KE26GMSEJ9+WBS3RqM1dL++HthycjQ28pOgDujxmtf+2WRo3SO3WjHmNNQAtnPmwxUjwrOXtKB1KtmjPkmcq545VteIkkvMcq/izFIUCJVmyRXNKaPs4j8/96W7AAP36Mc0E9j7rxEs+HdaO2EfFjG9PiUQZKs16/j6I/jeFEdarev/swwFpG6lmM748cRebdpnTz5Ky88exMaos+llwhSAYCjniu3xF4mBC5SZhzrlplt2edOuBzBPQcOZAM/JpWCDuqSjyVhoXhaqYWWbFzbrh3izDUPeKLdD8ykNVbaWg4lXFqff6yMxjOMpU8RtLEdUZoK6h0Rthw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
Received: from PA4PR10MB5780.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:269::8)
 by AS8PR10MB6724.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:562::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5525.10; Thu, 11 Aug
 2022 11:34:30 +0000
Received: from PA4PR10MB5780.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::75ee:d5d2:6b1d:150b]) by PA4PR10MB5780.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::75ee:d5d2:6b1d:150b%3]) with mapi id 15.20.5525.010; Thu, 11 Aug 2022
 11:34:30 +0000
Date: Thu, 11 Aug 2022 13:34:27 +0200
From: Henning Schild <henning.schild@siemens.com>
To: star sun <sunxing960116@gmail.com>
Cc: Jailhouse <jailhouse-dev@googlegroups.com>
Subject: Re: Ask for =?UTF-8?B?aGVscO+8jGFib3V0?= cpu down after jailhouse
 =?UTF-8?B?ZW5hYmxl44CC44CC?=
Message-ID: <20220811133427.336a5da7@md1za8fc.ad001.siemens.net>
In-Reply-To: <3fdb914d-9ec7-4a5b-93e4-d07333100ff3n@googlegroups.com>
References: <3fdb914d-9ec7-4a5b-93e4-d07333100ff3n@googlegroups.com>
X-Mailer: Claws Mail 3.19.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Content-Type: text/plain; charset="UTF-8"
X-ClientProxiedBy: AM5PR0402CA0010.eurprd04.prod.outlook.com
 (2603:10a6:203:90::20) To PA4PR10MB5780.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:102:269::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 475bed5d-d8e2-4697-767e-08da7b8d7479
X-MS-TrafficTypeDiagnostic: AS8PR10MB6724:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VGbca2YWZSE5yoqBZu0EaGqmIK03pj0dmoIytz0buIzi4gLeMhyCjJxCGMLaFV6QI1KorHtTCmRAlJTIS266V/uW7BVONM8NZWSE2J0N9UWU9JIkGV1Nk5NK1/YOI9qJNWhfcFugu/3BCpj86BE3T2Sf7KJc2+qOlgxvn4mw0Dthh/UiViCGRxcxUZItqlAh5Vu1GdK6AzgXx9J70qwBQhIaxLn/NxHClxT14OB1htnGeYvuL3qvhmi8n6DgWZy81ph4SbyjNKkbWX70j8kDQdjGhLpgMuS9ubtYMVIH+wMBayiVVLer1DCqJ4CrLPVgy52Y+Pw64EiIgYtB/vtmEpYpvGtK0BBNPRtNGc4EGPVGnH9cgKNao9egKutatlug9shJ1ZJlHaOLWw7xRumS6ZoX7yUBBpfXkMpnh7aljYUV40E3wmO6FlLOuVvKdas5oZowmEsAnoRD/YiqbpgjgkVYDlXVP/dZU+EaHkT43RcS9+A0pfTY1LOHLNTD+fCL8FKi/oe34ChnVQiJMdK0yzasArinElCbLOTtivhNgjCU/1ja3WTv/WV3aOoJD0bA3pxL9+zJIQgs9kgF0DP3JTWZ6ewKngy94359rh+MtjtMfggbu9QzSqmo7n6ynFPlinE5rBC+rVBzJtzewxYF/yoaL/W0vC9caWyYvY+5fAr1hAQcWhPtUoyRi28DqdBsYjeT3ucUCTUSh/xlcliDs3Wu0A+8wT839Y33WfcIcKzQ05HzqDEdLDQyO7qbxBTc
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR10MB5780.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230016)(4636009)(136003)(396003)(346002)(376002)(366004)(39860400002)(2906002)(1076003)(186003)(9686003)(6916009)(8936002)(86362001)(83380400001)(44832011)(5660300002)(4744005)(66476007)(4326008)(66946007)(66556008)(6666004)(38100700002)(6512007)(26005)(316002)(6506007)(41300700001)(478600001)(6486002)(82960400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?oYFGkAEE0K3Gbyi/rZqGc6t5ZeHP2qsu2DbZOTy5UkOtoiTKlU7W4tUEKAYT?=
 =?us-ascii?Q?VIU9+161HiN0hzk1Er7XjhyTa3X0R/RwNm8RKS2OD74Dna1x1Y1+X0uH/7v+?=
 =?us-ascii?Q?7yA/VveabBT0/bg22sOXetwO6uPoxdwfMG+BowykFc94bTBeKC/CojzDgrcO?=
 =?us-ascii?Q?4luv4qlTMYjg5P3kuthxvsm5UE9JOG7PD8UsYXbYI2+l8emsVgn5YzmLYYCk?=
 =?us-ascii?Q?7p3+Wm/IGCdrYEXOsTVbqRdw3geZwjWPqqNtolwG/ahQscAa3+GulYJkqFrj?=
 =?us-ascii?Q?nlk/4j+Y9xtZ7ngzA4C463vo9n23jnE5qMWlQUrQaaMUjX/bsuhbAl2w7ij6?=
 =?us-ascii?Q?JdvA3lReL5C/KzLQmlpPD4rB0/mU70zXdmOt4aNsWd3E8B9fqmuFBCo46ZLM?=
 =?us-ascii?Q?4w0Ck1upGsAKwnE9WEns1taexV0i3ok23eR3iyTqMtEz59ZsyRkgE1pXVorF?=
 =?us-ascii?Q?fKhRSr5LLEaRNv/EJdBIawRJEcEFHQzAAO8DGFlQ+iF4JLkajttOlFrNaYWy?=
 =?us-ascii?Q?1VAkTFSNVmW8JI+X4ZgYxyAwKsZkA6KFp3AgJN366Xslc+sWQj85Lk3ZvgXA?=
 =?us-ascii?Q?GqMnm6m0X32t1OH0nLw880zPNbxm+gHCNeWZ5G8HaHmESD7fJ/45CHe9HugN?=
 =?us-ascii?Q?hOZIvP8bEsVKZKQL+UwjEkEDAs+MN44P229ptjI4BF7BGGN1LvciqPg5bJWu?=
 =?us-ascii?Q?Z+UAu7nRUFzo/2LfEsBeFdHODBWvT4RVYpKjQc0coqNRIze9zPu816Xugyo9?=
 =?us-ascii?Q?cAIkv244ePuptJh4FNPXtBpjYgE62S4OcraO41nsBSAl0Lg2NSofrB6IcMmN?=
 =?us-ascii?Q?6ERd49+jTNziHcQgfyKIazcTPfWNQedWoW8hwBDrlsPS1YfhNlfK3usO4Tf0?=
 =?us-ascii?Q?t9ZScx5l6aF9H6MS95C3AXQ11jjefFUTWTCesZnldQalbbrLqqnrIMvziZF1?=
 =?us-ascii?Q?C6JNDVKMMg231ioITKY2PfEQKccJOqqDfkxdU0QqCIuifmbRkQxHeCfn2YqL?=
 =?us-ascii?Q?C0+ugjd9skRMXuX5aScDiSXsfKwz0J+IPyW8w6kYh0wJUNHn3UFymGRHxcCU?=
 =?us-ascii?Q?nm9rcPim9hxEB1lK4KqwRSxpyeDC2pVIDw469t+7pff/Q1WjyVrxqGM77N7Q?=
 =?us-ascii?Q?dA6hig5F4cxXFoHU79jDwImOYfDaumBfefySNb+HbKr5966AVt4PhWKG9M0t?=
 =?us-ascii?Q?f7ORV44z8R64XxELswi+CzRaPofuURSHKkzN6AeIml9r14Fiz3TooCGhgNCi?=
 =?us-ascii?Q?KjF55jFOjG+HwYbod5A/3pDq8m1vopJgwQLZZustQ+O3xthh7Xv6Ar/JvD0d?=
 =?us-ascii?Q?niixCIe244A4E88V+hKWZREMmCVilZP72RWF8qf1RbRdcfYOdj7dmvdNj+U3?=
 =?us-ascii?Q?+heUkBzVeUC4lvxkORh2vRQcQq7g2hk5yK5EUwti/jB1VexSZvvcS/aGV7Pg?=
 =?us-ascii?Q?exY6AgIkD0SP4eGyA6wsk9TEBla67p1z7ORv3S/qUBiUEnlTl86tehBtA7xA?=
 =?us-ascii?Q?930F9hIE/Cr70oO9pdX41tGb6abBjnLxwWYeMEj6ePgwFF8suCNN5wYO1e/x?=
 =?us-ascii?Q?Oy1h+L0Zg+aXfR7ZopNG/d7pZcHks2oVlMqopH4LeRDu+LG6ATrHrMdZd7rR?=
 =?us-ascii?Q?Ew=3D=3D?=
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 475bed5d-d8e2-4697-767e-08da7b8d7479
X-MS-Exchange-CrossTenant-AuthSource: PA4PR10MB5780.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2022 11:34:30.2162
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9OaPi27vVgBy1HDXVqBJhBU9rgdr/g1pAuS6F1o7LbM81htugjOHXq7teaXtngIOuvhTC6zcgyU3B7a3uCjwFbM2l+Gq8uNMMxoXNYJiJ4E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR10MB6724
X-Original-Sender: henning.schild@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@siemens.com header.s=selector2 header.b=WHqj9cax;       arc=pass
 (i=1 spf=pass spfdomain=siemens.com dkim=pass dkdomain=siemens.com dmarc=pass
 fromdomain=siemens.com);       spf=pass (google.com: domain of
 henning.schild@siemens.com designates 40.107.22.58 as permitted sender)
 smtp.mailfrom=henning.schild@siemens.com;       dmarc=pass (p=NONE sp=NONE
 dis=NONE) header.from=siemens.com
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

Am Wed, 10 Aug 2022 23:29:16 -0700 (PDT)
schrieb star sun <sunxing960116@gmail.com>:

>  i want make jailhouse working in one phone with 4 cortex-a53 cpu.
> 
> I feel like I've successfully executed jailhouse enbale.
> unfortunately, there is a kernel panic    when i down one cpu for a 
> non-root-cell during jialhouse cell create .
> 
> This question has puzzled me for a long time    Do you have any good 
> methods? thank you

You could try offlining one or more CPUs with your stock kernel and not
even the jailhouse module loaded. If that also causes problems you are
likely dealing with a vendor kernel that has been patched to become
sort of broken.

echo 0 > /sys/devices/system/cpu/cpu3/online

writing a 1 will bring it back.

This should work before you even start with jailhouse.

Henning

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20220811133427.336a5da7%40md1za8fc.ad001.siemens.net.
