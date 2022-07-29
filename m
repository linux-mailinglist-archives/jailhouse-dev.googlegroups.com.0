Return-Path: <jailhouse-dev+bncBDJMJPGY2MGRBB7UR2LQMGQEW4TENMI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23b.google.com (mail-lj1-x23b.google.com [IPv6:2a00:1450:4864:20::23b])
	by mail.lfdr.de (Postfix) with ESMTPS id 10F22584F03
	for <lists+jailhouse-dev@lfdr.de>; Fri, 29 Jul 2022 12:44:25 +0200 (CEST)
Received: by mail-lj1-x23b.google.com with SMTP id r4-20020a2e80c4000000b0025e05dbef18sf887690ljg.6
        for <lists+jailhouse-dev@lfdr.de>; Fri, 29 Jul 2022 03:44:25 -0700 (PDT)
ARC-Seal: i=3; a=rsa-sha256; t=1659091464; cv=pass;
        d=google.com; s=arc-20160816;
        b=WoyFRNQoUu+ueymFqMDFrYwjZp0h6VR9RcB1N6VNLfPdeLBdL0GM1/Ef8wkrFmIVlR
         WOJ6aE7HUSeZD2mUKTsI2+gTdPfSqaiYXxR7TN+BtxjA9Bcp2JLKw07t5Of2THsrfaz/
         XwOe25dHJhbhhNn4ujNgNAOsqCrzOYPv7Y/AZypJV6k/N4q1+OtKuHOOPEWNa/uiKZS7
         A6sbzoffAYb0p3GDUyFqS4ldbCYYkgw9u9iKaOoyfW2AF65gEVbhnLCcRjPA63wvOuYA
         1f6a60xEGIIV3lei5J8DBXCQNMl27HOoWfNCa4vQrAkFQ1+5071Fx0QW3NUlAVwR+6IY
         adcw==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:sender:dkim-signature;
        bh=417RZlMlekIBp3UIo4WfVDOrUGgLTeBvd2wfNwjJCds=;
        b=C5l6V/ZQAnqsaZ3DJ+J9QNmc93UwRYIXESsA1Jd4HUF9J5iwdRsNl49puJfRWTkzJf
         +YECVqAHnaIN/EB+HtZFCVtSSi8jXISkAmBWy9OkJX+eSaf72rFEadN8wCsZ7oD5cfPm
         KR4TA6hQc4bvQCUoxdZdbUbrzP8g+Bb7pEAckyRJYfdX2YaWtnt68fOQgxRl0o2Na6I1
         x5YZ5qFYH+j6vzF6teyoEpI3hFttrUnZum5KtGPjhq4EQVC8CV+15iv2hg4EI3ob2SyC
         NA76gYu3FrhVkJAa+SRS93qkKsgecrRBK9K/UfPeM/oUrvJ2dwMUkTsNRhPV0lTDnCjN
         UaJw==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@siemens.com header.s=selector2 header.b=kUA4E8aF;
       arc=pass (i=1 spf=pass spfdomain=siemens.com dkim=pass dkdomain=siemens.com dmarc=pass fromdomain=siemens.com);
       spf=pass (google.com: domain of henning.schild@siemens.com designates 40.107.20.53 as permitted sender) smtp.mailfrom=henning.schild@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:date:from:to:cc:subject:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=417RZlMlekIBp3UIo4WfVDOrUGgLTeBvd2wfNwjJCds=;
        b=trcyZXDtbtLvHmYQS14///DNTSts2RKi56HxQBJRqk1QgFJAHZY0GT05IeI1LRqhGu
         b5Vg7m40fH6YVBtYNN4QZ8McpMMYpboh7XcIk5BkLy+VX7Ev4TlYiuO9qzxUbeuP5a2i
         BRhqQrkB6Ly5sb96jkEwEMFXnL1e21Hhig4Vx6tFhvojVLu/jSvdFRJ/4p8A/7AuxjiF
         DPvholJN/n67QzEmlF7Tvh3K7IHyzFlqKMAIkLsjtyXC+n2Ist4ICJxTUnGYKvOoBDT7
         HjebegoVP2R00K/kMlhIJmOCbbrKjtf1x+j7aTINiQyyuWE2MRabidMJcINDnMr00P0h
         z4cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:date:from:to:cc:subject:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=417RZlMlekIBp3UIo4WfVDOrUGgLTeBvd2wfNwjJCds=;
        b=qdsLdcjVSWda4peRa/YeYD4Wrv7PsYmOq0RhfEtXjzv9tI3IxSTJ21TsMtvCUAKz+6
         vI8Mz/lzQ5beP0H7hnxMSRwvakzKkt+0QpGWw1VaDheSzoCNEjn5G8Rks2M2m7Grlvu7
         t92WCicf/JNh3BRxOBrudCdvCrS8iIYn/SBDRLsA+/ZOrrj/ePyIYz8PjFVIwpAOrwN3
         WdBwaWGK8vbkPWjvMbiPXDWJJC7P8+yBKhyU6gFAzLS9OqGksZPnrhCqPrlgoBkTCoFD
         TmZTA8Pw8rJWDE4oj5ubcEz4qdJAcSAdwGxnigMI14SwTU/Xx34oxuiWjxnR9q9ZZqVA
         b6/w==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AJIora9cN/cDhgfPoU2t0J6jn97aoVV/p34z7YFSysWSiVZPDnhU92ac
	VMZ41lGHIfbO16Pcj3raLh0=
X-Google-Smtp-Source: AGRyM1sC2k85/63LWE0Czmy5w2jShuXw5lp8tA47xHcLIH/2BHFzvee1sIW/tgokr1OQfecN7WBMKg==
X-Received: by 2002:a05:6512:3a88:b0:48a:1dd5:3f97 with SMTP id q8-20020a0565123a8800b0048a1dd53f97mr1139449lfu.516.1659091464253;
        Fri, 29 Jul 2022 03:44:24 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:8746:0:b0:25d:59c9:11f1 with SMTP id q6-20020a2e8746000000b0025d59c911f1ls740989ljj.4.-pod-prod-gmail;
 Fri, 29 Jul 2022 03:44:22 -0700 (PDT)
X-Received: by 2002:a2e:131a:0:b0:25d:68eb:cf6 with SMTP id 26-20020a2e131a000000b0025d68eb0cf6mr839885ljt.267.1659091462435;
        Fri, 29 Jul 2022 03:44:22 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1659091462; cv=pass;
        d=google.com; s=arc-20160816;
        b=IoszWfLMZFEIZC6BvbCD/sIrmG4bZUq7OTYEJn5kLFUL0TNejvxpQoRWvk8FZAjTFE
         oYwH+A9XhEXFiZD/SOs13BeG/lkSBCNfSeDjppk00RUpP0jCrGkRu9e6B7+YKk4UUXuT
         wYjrjG7L2UokgJrTqIg+OMQ0XnotxxiarPSRV2taohFcpJFtXKfhpEXeCn8pn1Z5ouKl
         QxGx+7KihGOCCnBob55yVS4ejYzaJLnZv7hECrN4sz7jmgOACoTgbOh1zbMfPA54D8SI
         aS9u9DHOvMsIhj5qfHRFO4e+mt189ULIM4qgSq2Zb15zHQSKdWtgbJT/uSRytIi8NUAs
         gY6g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:references:in-reply-to
         :message-id:subject:cc:to:from:date:dkim-signature;
        bh=+7ScyBUKRLfm1x1bcdWYGqS28QNECtDo+T8B4I1z5Tg=;
        b=EnsHHapYzvv+OwJuM+kgFtFfAoijRUsvffrqoLaGR6VjgfdmYim0IdD1IgcWBTzvRZ
         sv3LZE0EbVrd7e1Lwu7FsGmI8Q9l7ZUB0JtwdVrHuCgzY5p+OODJF1fmey+Fb1tqOCLJ
         mkwNzOjHHhKrsus55dy3jIqWm6nt1M3vhZJXTjrYbzbr2EZBkPVTkIBya2xmPI3AttTg
         +rq9LcXKfaREkYHpi0nuB2XYfsYE7cgXEmfV3n/ojgLAnPhgvg9wUSl+IyxriY7tcxLF
         3R1bdDy9XoRIvwgbPVhZilIfEApbepGkaoCV0UVokoIp2tA4aI9jcyl30QMLt7GWJEjN
         Q7WA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@siemens.com header.s=selector2 header.b=kUA4E8aF;
       arc=pass (i=1 spf=pass spfdomain=siemens.com dkim=pass dkdomain=siemens.com dmarc=pass fromdomain=siemens.com);
       spf=pass (google.com: domain of henning.schild@siemens.com designates 40.107.20.53 as permitted sender) smtp.mailfrom=henning.schild@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2053.outbound.protection.outlook.com. [40.107.20.53])
        by gmr-mx.google.com with ESMTPS id w16-20020a05651234d000b0048acffe11d1si103155lfr.10.2022.07.29.03.44.22
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 29 Jul 2022 03:44:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of henning.schild@siemens.com designates 40.107.20.53 as permitted sender) client-ip=40.107.20.53;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JytjJOChdGqxsmCmMN3Oq0oW1yP1cJeQn6+ReqZeMVhk93ZvJVtFZxnKUnN6JPCKWFsU1jupe2tnAIyLT1fFLxFuoGdeRn0fiHpoufrksJwW1qyOkyJ2+OGpUgOxOmpH3wcvB4DHR98L4HfTXcJV25cj+NOHweQUuIzQ8fWl2Q1vhEsjVKes4/A2maLQZs9kIE/PO9D+WBtbkYMYgZ9VlMOjexYw9g+XD9d8bscyf8YV6CsEAd/MoMcZxlLfTu/DuIJVbGxWwIfCoF6FkoEQBVoDDS9Y+fkbeAkigYzxgd6nS0TUcgriCxgKUVShzSD+LPgl2vGMHxgOVbSP76KieA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+7ScyBUKRLfm1x1bcdWYGqS28QNECtDo+T8B4I1z5Tg=;
 b=SHu+9BfVNVIEGNnCtSZMbPZ5MrxRgahbBc8lfzP5ahXTV5kOGySz1Qx9nCd16XW7sfpwXoIFuYldmOPOagRVbFca5KkeUvbPsWjo8Hmff62FWIjKG2ejP5Kl0pOibusJiFwYtzUjVtyX7yNYJg3uNgx6E/sp7QT6WaZiPC1b421gPIS68Ld9q9u6by2cglmBSj3qujjVQUUuro6xGJeFC8nJs/dIvupEN0tGYQiYUm8WDoWLVqlemzTOLEzPnCEXKrFMGKq6GirRRlbjK3d8oJqcDbSrlwNJqTARshpeBwhdzZcPsnL+Uwhg6DigXJucE4KPxAhVBFTic7vKMr82eQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
Received: from PA4PR10MB5780.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:269::8)
 by PA4PR10MB4368.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:107::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5482.10; Fri, 29 Jul
 2022 10:44:21 +0000
Received: from PA4PR10MB5780.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::75ee:d5d2:6b1d:150b]) by PA4PR10MB5780.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::75ee:d5d2:6b1d:150b%3]) with mapi id 15.20.5458.024; Fri, 29 Jul 2022
 10:44:21 +0000
Date: Fri, 29 Jul 2022 12:44:12 +0200
From: Henning Schild <henning.schild@siemens.com>
To: Sara Alonso <alonsosara44@gmail.com>
Cc: jailhouse-dev@googlegroups.com
Subject: Re: Troubles running jailhouse
Message-ID: <20220729124412.4f8aecc6@md1za8fc.ad001.siemens.net>
In-Reply-To: <CACD6wFOpQ3ZNBDtPoz+LLS57gxAZ3JuDOi_1orGKqPKiC7s4jA@mail.gmail.com>
References: <CACD6wFOpQ3ZNBDtPoz+LLS57gxAZ3JuDOi_1orGKqPKiC7s4jA@mail.gmail.com>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-pc-linux-gnu)
Content-Type: text/plain; charset="UTF-8"
X-ClientProxiedBy: CH2PR04CA0012.namprd04.prod.outlook.com
 (2603:10b6:610:52::22) To PA4PR10MB5780.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:102:269::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 09bc4b8c-5e6c-4d51-b6fa-08da714f4b61
X-MS-TrafficTypeDiagnostic: PA4PR10MB4368:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: aa5JpYZUT9tBd4zQv3WyLCvAybomRDTgkdbEl4/HPtLGM++pLeOwOCy/o0iKl7YbpicA+omp5t9dDopeF07utSDBaxVkmdCNRnypRvigWE0BOCmzSiV2lgPqxDo80C0/C+Un7b/09iIGD/ZumlbnDh6q/wYm/T3EvwhoLm6ljSnH8h3D+iYtDFOtsPPOwJCSpcVD5/OxGxOst/iLjyV5ExaPmcXBTpI32AS1YcypdnUr8z85WP7iQIIEnBoIOW4G7M0+Evwnx1fxYzsSIQ3ZS0fZd7avGAugjsLw7tOUputq6HlFhImsSRg6TkvytG663Cg048CPhD7LyaPcPyD2ExP87OieF7BqweBijndioLKi5dyVVx8aF0JQLKkP2HdREEmOKTJGVoJ/ekJx686cU5NllDlQ5p+WTrLnFy8gYHp6v6q1fStoxCZoGdqTfhEJg1p0XpiDMXcU1QyIS8GILo/AuL60oA1nM9inOMFg1KpAcYw3ysjmnqwIVGJ7S5LG9qjhAGxMnGc5CvAaD5tH0KC2BNCHsmYoqN3IygFGTQe+akKY+owRnYIt1BxfywQy4EHUZKkQWowHc94xgKlOKVTMHVKLqbKvJ2tP5lzRgEpEbWwaZgBu4omJF0vc7joxd77e0BmGouQZKpg9knQFFtdtGOiMIMT5CkUctrodmWTUUukgW77olxH+0MjD10QVsferjL9UbQpQqfTCD3ns2L1qJwq2d34dXwF9cv9a/n7rUxWZLHsW6GQNHTluNXWtN5gSr9ruQ1U2tY/imLeKSA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR10MB5780.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230016)(4636009)(136003)(366004)(39860400002)(376002)(396003)(346002)(6486002)(316002)(966005)(38100700002)(86362001)(41300700001)(186003)(6506007)(82960400001)(1076003)(6666004)(6916009)(478600001)(6512007)(26005)(9686003)(7116003)(8676002)(8936002)(5660300002)(66946007)(66556008)(4326008)(66476007)(44832011)(83380400001)(3480700007)(2906002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?xg91DaZajRMIX4LPgA0R0zDa2wG3hEQIDBfrm+LNdAQa8JoaHG3lQk3YS8p1?=
 =?us-ascii?Q?SXXdQ1Uim14uSR707i4AWcpatVC845VZ4ZxQMao1YR8/2K3WSnZbC3pdqaDz?=
 =?us-ascii?Q?gkNGQxIQmKeNpOfuWu/TMh4AZU92S2VbLYG/2G1S3a22qwCPzOP4kJVsHxBy?=
 =?us-ascii?Q?sBD7eMYkfxoVN9Y8gCT6P2KumeLQ1937xR7kC8Wjl2+al2QUjIguKlWudHeY?=
 =?us-ascii?Q?VW1IX1gtZw4Vor1Z/4rQLMc2874HfY8ka6t/ETemYn5sDvlCiLvXbBQ7rvOF?=
 =?us-ascii?Q?ziPgv1cTJvw+Ezu16hfvtr2sk5Bztf8ud3dWwe/3BC5XoDno+bzV9bw5zwas?=
 =?us-ascii?Q?vXD+5HqEdPWU7MOPsMFwYhdYeQUBO0DS4SVx2ZkEx1K8IXxpi/Ja8MXH/CkM?=
 =?us-ascii?Q?fxXMNlJpw2msiC+FDltBTTRGMbwsAfxTpFgLRQKLZfIe6cAAFkUgPIWW8lmf?=
 =?us-ascii?Q?TofAUy0IaWkwr/YISHHkcjzVLYTF/9yXmAU3qw5lON0ao1kZwXPYi3VLqQgs?=
 =?us-ascii?Q?i3SIWe5Kdi+sdFxCIAFOr8LS1uUjJ3WlZCbroSQU/MuE8kGCpLFSJm+h3BZw?=
 =?us-ascii?Q?izPdQa15irFeeILdJpzv6Sh1Mx8RdguiMSAcXOs3CH+hOVJR7pxfB1mQvY+d?=
 =?us-ascii?Q?DP1N0lezWRMRc5Ffw0J4TR/dCnnRUh2HAGV2CL2yhLKKWT5xs/ZPelqMkSIV?=
 =?us-ascii?Q?z6JmWYzGg9KMrbT1ws64lrKxjhDBkzaxQ6Sgv1GWxRS2Q5bfgJMDkW+v9vAv?=
 =?us-ascii?Q?C3SiOxF+e/snntsnUoKiOS0ZXgG5yOUgEo4smz6kIcBuW+4tGWyLk2UlFmA2?=
 =?us-ascii?Q?0ectHKnm0VwssgVskxIZ8vyidBG4w5kW1zr7tIesMOsaIGwf83N/l7q8ZQ3P?=
 =?us-ascii?Q?Kl6ltZHxz+AG6deEa6Db+eTsvGq2Aqe1r9n0PkVSTViltUC5SDEudY0LLTEr?=
 =?us-ascii?Q?xnQ+F0AdR2FS6Vq/Qxv9t2+xcYeAYW//uydGKhmlCVZCWtpuSlzfWnr6Kiz4?=
 =?us-ascii?Q?5KJd0+60s/8z82WsQlHKIICgR02RbHrWVVXC4kDnp6+/mpLrulRisDi1COt6?=
 =?us-ascii?Q?qpdmgJHcC7UwC8BKNipM9Ie8JgfW5nwbWwRDCVhI8sa4+Aa7HV+kxEV5Uf/e?=
 =?us-ascii?Q?UYpb+jwiFC2R5py5xu9k6odcsKojKsfT5tq+/t4XWEidXgIY+SToToojN0FJ?=
 =?us-ascii?Q?HcfD1fXTv1HZ5KR9d4nVY/HDbmdXCEj5xt894ENC0cToUjF8XlCKv0V/gr2u?=
 =?us-ascii?Q?6IV8bo+H+Ejrfti9tCX7r1Tw0ub95CLI/8wPKH3P4R2e2yPDbVUlyENxHHyF?=
 =?us-ascii?Q?Rs0+u5Gb7InKcf1eZpqlDwJcVvUKIFtlABie1RbyGbrhLwB1ZmDtUb2sr2jx?=
 =?us-ascii?Q?845aHs1rdq9JmV9Im2osGJdMHx1+4tZ50MusTwDcJlMYWqyj320CIn9RucAr?=
 =?us-ascii?Q?0sgxxKCs0pSUt2BLh6hbSIM3Bfndz62hxq+h++k6Dc3fQO/Oc0d0ZbA7cwt2?=
 =?us-ascii?Q?JHojMObtkJ17Xzgidvz2bs8MxRwFg0octaAYnPCDvM2kFi49AVc/MUh3p2Mt?=
 =?us-ascii?Q?mWGdRTvSss+E3cZWcpRp70XR/wvjcFWyoETeEizpM6uYl+EKbVd/gQdlF/G1?=
 =?us-ascii?Q?zw=3D=3D?=
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 09bc4b8c-5e6c-4d51-b6fa-08da714f4b61
X-MS-Exchange-CrossTenant-AuthSource: PA4PR10MB5780.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2022 10:44:20.9427
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SwWOGjQJ7ab6hukQ/VvvoLtpj5spR/EsG4tnhbId2EHsp0V9pE2iAwVR8w61M4Kiu2xKOM/HIw9GFhBxDsmaof+ng07IgR36raUiilokgs0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR10MB4368
X-Original-Sender: henning.schild@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@siemens.com header.s=selector2 header.b=kUA4E8aF;       arc=pass
 (i=1 spf=pass spfdomain=siemens.com dkim=pass dkdomain=siemens.com dmarc=pass
 fromdomain=siemens.com);       spf=pass (google.com: domain of
 henning.schild@siemens.com designates 40.107.20.53 as permitted sender)
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

Am Fri, 29 Jul 2022 11:33:32 +0200
schrieb Sara Alonso <alonsosara44@gmail.com>:

> Hi!
> 
> I am trying to run jailhouse in a zcu102 board following this
> tutorial:
> https://github.com/siemens/jailhouse/blob/master/Documentation/setup-on-zynqmp-zcu102.md
> But I am new at this and I have some troubles.
> 
> I have built the petalinux-project and also jailhouse.  I have copied
> into the SD: the image.ub, BOOT.BIN, system.dtb, inmate-zynqmp.dtb,
> zynqmp-zcu102.cell and zynqmp-zcu102-inmate-demo.cell in the BOOT
> partition and the rootfs.cpio + the lib and usr files installed when
> jailhouse is compiled in the ROOT partition. I don't know if
> something else is required or if something is not needed.
> 
> The project is running, but if I do "modprobe jailhouse" it says:
> modprobe: module jailhouse not found in modules.dep
> I think I have followed all the steps of the tutorial. What could be
> happening?

Jailhouse uses a kernel module which you have to copy as well. Double
check that you did. It should be called jailhouse.ko and end up
somewhere in /lib/modules/<kernel>/extra or something. For "modprobe"
to work you might have to run "depmod -a" first, otherwise you can also
"insmod /lib/.../jailhouse.ko" and load it by file instead of by name.

regards,
Henning

> Thank you very much,
> Sara
> 

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20220729124412.4f8aecc6%40md1za8fc.ad001.siemens.net.
