Return-Path: <jailhouse-dev+bncBAABBVUW66IAMGQEKM6HYMA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23c.google.com (mail-lj1-x23c.google.com [IPv6:2a00:1450:4864:20::23c])
	by mail.lfdr.de (Postfix) with ESMTPS id E28044C8529
	for <lists+jailhouse-dev@lfdr.de>; Tue,  1 Mar 2022 08:29:27 +0100 (CET)
Received: by mail-lj1-x23c.google.com with SMTP id bn10-20020a05651c178a00b00244baa268b6sf6841393ljb.15
        for <lists+jailhouse-dev@lfdr.de>; Mon, 28 Feb 2022 23:29:27 -0800 (PST)
ARC-Seal: i=3; a=rsa-sha256; t=1646119767; cv=pass;
        d=google.com; s=arc-20160816;
        b=QBN0orbU+FcDZHH2+f94C6d4qUv6UfPZ39l1tek2E7inA0Y0wph+u9GQwZPCNakx6H
         QwGM6Tv2bKCRI2PVHfZvKRBES1kqEEfNn9wYCkXePwcZKH9MI8UcToB2+/Q27/hNwk33
         go617cicEi5NmXiaNZ26iSuzM3f6J2qB9TGV9yrpYsYKk+A+BnNHWOuJRdfK/q967TwP
         ERUd1F7B2GC/SzcbZv3UdOxVPLXfwQI0151+4ycZzMN+GMGeSAl7Fhyj950P5XZ1SPN9
         RtRBgVHfo7VnA9fbET8TCm+BNAJ4dpBzSXorQ55B0g2POBQ6gbsqp9DcWch7Q4Ux3gIS
         HdVw==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:message-id:date
         :subject:cc:to:from:sender:dkim-signature;
        bh=JGZ7ZwukKh6hJOr04talIbpdAejXCIoXzw4DNn7nxdk=;
        b=nrfF+dHCLhEkwIIfqqduwBTIeFpmySvUk9tESBYrUE/c0J6AZfHkgrqpSLJs+qdu8J
         4G+fSpjqkvLYGM1b7CdldHwQKsSrojrpMRKgt4QAgRz3CPjCGnoEHfXtopFq/zCBQuho
         Ms3jI/XL/e1Pjr9pzY0mjhKvFJv0gqhyHSg1ldQQmPhW6VTAdgSPT6EmT4Ado+PzRtB1
         22O/6tblmKfRP1Yz/vsDh81MWrQg2fW7dK8C8tVxeo16SFw3W6lDjyPMQ3pWMba/LF55
         KJw0WG89PIpp5GFetCXzZIR5d1uJJ8EsBWwW6AvjIv+66VksIgenrog2WUD1/uruKRM+
         tB1Q==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@NXP1.onmicrosoft.com header.s=selector2-NXP1-onmicrosoft-com header.b=ESFJjMXj;
       arc=pass (i=1 spf=pass spfdomain=oss.nxp.com dkim=pass dkdomain=oss.nxp.com dmarc=pass fromdomain=oss.nxp.com);
       spf=pass (google.com: domain of peng.fan@oss.nxp.com designates 2a01:111:f400:fe0d::60c as permitted sender) smtp.mailfrom=peng.fan@oss.nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:from:to:cc:subject:date:message-id:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=JGZ7ZwukKh6hJOr04talIbpdAejXCIoXzw4DNn7nxdk=;
        b=aKEd/vpKG9xc7DkZO+shjOY33wCOkDmKgLqJFnF0wB4nWG8qkXcHnVLmCevJhho38L
         wBs5A4l/65m+4d6J+dbEdANEHCuJ9iMEFqLhRUTZK3UufucxZWsUIeW+KpAPCbMGBGPH
         OmYKJ8D+dPjI6UlYjTf50wSS4O1nnG9c8S/H7P4Gz2ObpdtlBp6EWxnuOdHcH5Uqcp/Z
         Zq58bD+RNrMBsZTY2QMXrtHT0MAlVt7IVME32NnwpZle7h9Ng2xW5xneoub8TbkFZbwV
         xKCMnB6eGtQ5pJbr+R+JSspEOp0j5VYUXNXINC95P2c027eqdZ9MMEWHANWlp+5Ng1ca
         PjaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=JGZ7ZwukKh6hJOr04talIbpdAejXCIoXzw4DNn7nxdk=;
        b=CAwGp7UVBFYPXJvcKqcH60D1LcVtvEgwve07kL1spEd3lDkl+gQhByrAdesbIqLu6G
         WcMeRXWBTLMqSqNjLESV9FQOxymPVZu7Qx5uE41y2bTGLTnjCQFpWiyQN4sKAsIrVihS
         SXwPyynciXnkahEM84VJqtzkRIzkRs+/6q+yqcemIaUE4uODzvsDDvZLIQTztUuYflM7
         Rq2aj4/tWMmjb1INS/FOirvUM3312+3qXITCq5bxpqypnga6VpbB1hX2pR38CGjWEZuU
         s8Qetc63+ZTvp1Qh8PhsIMJYxQ6aBrpH6LDaxhITlPh9cYe+H5gFZuM3Sxq6nmk3CL6j
         gPsA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM5330mYM1acj1IibrbvYonq6Is8R12V5ibAGW0FmjOTN/gXWORwaZ
	b4BB/Zbm2Pn9hQly2ByjTVY=
X-Google-Smtp-Source: ABdhPJzV5onKXlqmTu6YDR6JLkZNKYPNecvzAAtd5K6/qDDLN6gDtUwa8XxGtHbPwDc9j2nZrUZR5A==
X-Received: by 2002:a2e:9247:0:b0:244:ba8f:df85 with SMTP id v7-20020a2e9247000000b00244ba8fdf85mr16698686ljg.257.1646119767317;
        Mon, 28 Feb 2022 23:29:27 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6512:3b8e:b0:443:9610:6a0c with SMTP id
 g14-20020a0565123b8e00b0044396106a0cls1829245lfv.1.gmail; Mon, 28 Feb 2022
 23:29:26 -0800 (PST)
X-Received: by 2002:a19:f807:0:b0:444:65e:d555 with SMTP id a7-20020a19f807000000b00444065ed555mr14703382lff.443.1646119766074;
        Mon, 28 Feb 2022 23:29:26 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1646119766; cv=pass;
        d=google.com; s=arc-20160816;
        b=qoBf8K7iCYGsaP3fclB2DPRs7Q27zxyadBcJ7+9lt3jry6RDtozUaKYwx0Mzreuv+l
         jVKfaeeCiwwDgsovlRO2RAvKH0AzB5EYbXuWoEDKao6wxdn8Zek2IntOpRY/jZRwuayi
         +rsBTqdMRvWqB3x/cF2gEcbdeXzGr6u7uzLjEtjXiiKXEgIu0WXhJghOBmHcL/sXjOhO
         RMz+c/TaoWsUTAFKGsLfmuRkl/D/VECVdGjdI18Jz8f38UzOw5cdjDwk+MZ9MtFA2GhO
         2njrwfIXcG12hgelpl15fDZcZft7gnmCCkg5TjpAlTn/UOf67ACUc9pclREgcY1kCoRs
         8eGQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:message-id:date:subject:cc
         :to:from:dkim-signature;
        bh=MeTX4sDF3/+Dst1HXVJmdpceqDF+M1Qjx3z7JOO9ZKs=;
        b=CNyVSUN4kmUZk/g3qy0SToNeobbjRzT++gKr6yU/bF5BPhyB592QrDrFZPv27LgRZG
         N0zS+wRkDHryhK0dtrYMEVGwuNmrrLrJgiOCSEQ77tMgwXfHYKKT9G39d4V8xO4x2WCF
         kMDScwsoYEWHW6Dpton167ZI4ST2MCflA6ujq6H6Z1B11bqpZGjiPVgPYCbGK++/36cI
         sAlui3Gk+PmZHQGiNAtRvFoSf9mWwjLxQh7LgrI8j5uLTQJO7OzG+W3vxj4WUHTrCw8m
         hopq2OHP2e27czkueJ9glEp4lMhTnjUUFtx33KQB3xr5EegffsKWKwJkXc1YQIIfDLkg
         omAg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@NXP1.onmicrosoft.com header.s=selector2-NXP1-onmicrosoft-com header.b=ESFJjMXj;
       arc=pass (i=1 spf=pass spfdomain=oss.nxp.com dkim=pass dkdomain=oss.nxp.com dmarc=pass fromdomain=oss.nxp.com);
       spf=pass (google.com: domain of peng.fan@oss.nxp.com designates 2a01:111:f400:fe0d::60c as permitted sender) smtp.mailfrom=peng.fan@oss.nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (mail-he1eur04on060c.outbound.protection.outlook.com. [2a01:111:f400:fe0d::60c])
        by gmr-mx.google.com with ESMTPS id c9-20020a056512324900b00445b1b2cf5dsi43238lfr.2.2022.02.28.23.29.25
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 28 Feb 2022 23:29:25 -0800 (PST)
Received-SPF: pass (google.com: domain of peng.fan@oss.nxp.com designates 2a01:111:f400:fe0d::60c as permitted sender) client-ip=2a01:111:f400:fe0d::60c;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ew8Mf4NlR7T4qy3djQqP9JJ/zO/Z9ldmR8Lqvw5GleaZEnDoeaB3GIxpVW1BJ/NuaEiMegKelVJUMOFyxHKb6+BRnCPaMNy/sXkpLjZ0Fxw4O7NOmEgoVqKFv+C6qdDu/Z6fzkfYhaUVEohdd3CTHjIxGxon/jyAKvBwoOQRZT6yBPhszLuDZSEt5wMNO0SX76P04SV3h6XxLPr6zWtzUKqRpFhN7QbV4q8yMnxd+BDmxi452LNkh96qrPiNrWvaBqKw6arq7wGY4mG4wl1H9GrV9yZSU3Nzif1fXL3ZmL5LZe4kfK3ZoTRXN+XgU785nogEWutz+sAokim5lnbERA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MeTX4sDF3/+Dst1HXVJmdpceqDF+M1Qjx3z7JOO9ZKs=;
 b=hAxhNAX9Xg7Y3QIb5vPCPouPpOvUdudE6DXQMLJqOgd2fNnZTt0r4JtuHCqR+i1QQor42iT1vqnHUi5NkmSPR+MVDm7yvGHknWhW9HenKFTUiRfMSA8jiYA+g6pFolXssldQUfbzExHMY998l0Ypd8MloMTqI0yiHR1x+bzkuVriPG9Xn6fRO0ETYxLH18XDdueNO/FSwEAS9VePsICaFcTeEiK4egPHc4ZvBVtB2xCLiMl2KWCjhH/tGP2hY2+nq9vA70DuuZr+OSEwAtWD11vkakJcWklcL3LwcSkTWOiybfqEbs8/hR/KxWHQ2M6S4a5Iuhr8FxK+boz/SqvniQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com (2603:10a6:10:358::11)
 by AM4PR0401MB2226.eurprd04.prod.outlook.com (2603:10a6:200:50::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.25; Tue, 1 Mar
 2022 07:29:23 +0000
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::552c:ed46:26dc:77cc]) by DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::552c:ed46:26dc:77cc%4]) with mapi id 15.20.4995.018; Tue, 1 Mar 2022
 07:29:23 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
To: jailhouse-dev@googlegroups.com
Cc: peng.fan@nxp.com
Subject: [PATCH] configs: arm64: qemu zephyr inmate
Date: Tue,  1 Mar 2022 16:09:26 +0800
Message-Id: <20220301080926.15295-1-peng.fan@oss.nxp.com>
X-Mailer: git-send-email 2.30.0
Content-Type: text/plain; charset="UTF-8"
X-ClientProxiedBy: SG2PR04CA0192.apcprd04.prod.outlook.com
 (2603:1096:4:14::30) To DU0PR04MB9417.eurprd04.prod.outlook.com
 (2603:10a6:10:358::11)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 50a45890-762d-4886-3d3c-08d9fb5534e5
X-MS-TrafficTypeDiagnostic: AM4PR0401MB2226:EE_
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-Microsoft-Antispam-PRVS: <AM4PR0401MB22261CAC51F356661929B018C9029@AM4PR0401MB2226.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: h1WbCFyon82ns6h5ThbK1rlOPVzJwLGVaq0E7gLZF57r55smG+rE2y0avAvCZTAU4or3e/s1ntJoPF65U7UpLItaVAEZ/4tqVsjHoSNPLt46Vo4y4Xl5xFAmDLsqKR1livNRKC2o+mQBq9iSFcp0BSxBfcovMMR1fUBSCW3+wMRcHsSwR+hBcA9/2Pb+JYKEQsU3BhcwGLG9MPdwUx83Cr6qavKFOnBIwHOfEngvdBCdJv3FsnXFaiK/5Jr0DjkFITHOgd11snV7GiwxT07C21OW6Vv3B0WNOANK1abezcss71zpirM8cZ64cUVxtJEl4cYc9CVs+UXHhYi6d3jEoASwdlOg6XccHY2SiiP2k0cuaEfsvMDNrQb9yXEn56Hdbq5YfWrJgb53/gJQVw8EHTQayXB3EuIdteoWiSeBZsBsOQUlCBevA31FVpTEBxqtVIdJ05/gN6gMyW8RiaFk8hpLss1zulI5fp8+qZNgFVigb1XiI5hjN2sERIf6N0mj3jNP3rE8/XVdxE7Uy4aVrUmraAd0qvFXlGxNvV8ag28VGJxPKMcgutXUXGBEhmbIo3p1w5wP/0AMd+KQ6NqnG/eNxffsRKsdPLxxCUnLGhloIWZFRvL8lpu2IdJ6xi/POU/P//IGiNiauYblhi50872OrvbtR04RDgoSWGmZqLS2aTCQmbRDCBWD8eXlqWgzLnBEWO54q/VeJhPo1ITP8o3LYksdBzUrWBvSC9C/mH6foaB7YnEh38dg1ZHU29R7AXlU8jfx5nxIfjbV3cQZ2YDcV8tGDYy6ttFgSio66Dw=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9417.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(38350700002)(38100700002)(86362001)(316002)(6916009)(6506007)(6512007)(52116002)(2906002)(508600001)(6486002)(966005)(8936002)(5660300002)(1076003)(2616005)(26005)(186003)(83380400001)(4326008)(66946007)(66476007)(66556008)(8676002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?0MiNTAzlhRzvhHLsB5P6GcHmVNs9edLlkqFZSE+Y77E3xaSk46VhaLttWZBS?=
 =?us-ascii?Q?4GTf7KfLi5P7ptRLuYzB1eOQKl99ahG7KKel8Pn1kne+R7wXPOBh4tUYCsUC?=
 =?us-ascii?Q?ryS7HFyrtj8hoXhMXI1z7K3hO5Z/e/Z4kQ1jWHkX4DrklZAzfp8dHDUczSsT?=
 =?us-ascii?Q?Flas8sDT7edScRpcuzBglo2TV+joI47pTdOjqXvpqbxyUKiDaSbIOTSaTdGo?=
 =?us-ascii?Q?pj9zIWE0qMiAal75Cj+L6VDeOmjdRFx2uJLJwYQUQTvuAibVn7aSZCzmdi2V?=
 =?us-ascii?Q?qjTe2hm1porJspaO/+jBd28gsuyEM1rBH0Lg5EmUaZQ+dxhLmkE5Er14kIOT?=
 =?us-ascii?Q?2SBum7sM+LSmUF0yHJpWIMeeCHWLeVhH29oIgN7NcUMck+V3tCtqUKW0tuw8?=
 =?us-ascii?Q?msUJA9n4/zxlSCWqW4Vg29VPPuK0TDhZz3+6ajKfJxfiWM499xW5gIu/Mfmf?=
 =?us-ascii?Q?+5zLuagb9pBeJTNu1GtUnFUvmFGpnH/lq0YUAh/QhVuA+4LBvyW9NPWXOj4H?=
 =?us-ascii?Q?v4iX+bXZt7A4CU/5LwrQWMfwhgmgPuAaU+9qyeS6rD18m8TohfjUZMshpCJ3?=
 =?us-ascii?Q?rLytJgUtO8WepbbXBd6L87RxDUo504RgQS/qVG5m9kB0ED91DUinh0tjyJiU?=
 =?us-ascii?Q?nXeypLkVx7zeLgnwzJsDtCgYGBUfds8Bhw92se8q4pWLSmVfCPMIGahMhltN?=
 =?us-ascii?Q?0P3GiuoI4K/UawtSEhn9JdO8/1qBIjwCA388/DT93YzXL88Bdb7vsQuL7Qkz?=
 =?us-ascii?Q?0XZP9NOyYdVW00PEoarS3D1gDPPAUmMfR98kD163tZcADW1Y5G8WvhAVgf+A?=
 =?us-ascii?Q?uw4OJ9WRJHxY0ytoex2lLHXO7GxXbQ35LnUH8IeGprYEeosBshqBWcxZD0Fp?=
 =?us-ascii?Q?bW2b4ALnQLdCscEy9xqliigPVf5i5MVg7opTdHWewpdLkohC1jiNCZNk23uJ?=
 =?us-ascii?Q?sBGI+1XLNoCODu0GtEMdAO9IuyCmj2H1rK+tVp+7bHO1UdwCGJ3pBHMNoFeG?=
 =?us-ascii?Q?wF2U3I70Iaum7iKnn0Zp+rCclftXbInKcu/vux5E1hFf+k+GrldhRWNgXa4w?=
 =?us-ascii?Q?u1Eogrx06IEFvjC79NASO5rP2g0ZhSyPbH5hGFrhrL6Nb6tL7FLEPJU2/xD2?=
 =?us-ascii?Q?645hFacCCih875DPR4xdJgt2vdiK3ICQEyvMV3ZP88af4YfZ52wqbbahr4Iq?=
 =?us-ascii?Q?Uw7LmiiarG+cQDFjU51gGO0MpKFq64z35/2UBgMUgrl7UgZmgasIwDnHTnrs?=
 =?us-ascii?Q?lAhUZJL6n55KRiza6BoAmHkA9HNE2HiK0fuu3WSyaOFVdUD0XaO59CmhqYwA?=
 =?us-ascii?Q?7VixdX1vpz2IDAlF72hU1MoCAvqBkzK8cmtLooWqefDc66NTTcGIhxR7I+Bs?=
 =?us-ascii?Q?s4ZUa+KVWBz78UapQdoqZMo15n4Sd3DCTJQwNe9buaXA8ClMTwsFxInuEYbD?=
 =?us-ascii?Q?Rbk5R9u093wJU6YqYjD2+muf5RLgVhfCzE2s2ijyviywIbvlTxdeirpMhswi?=
 =?us-ascii?Q?1yNOkIyWjqU5E9ghoQ73oKmqDrTBMqqoB7fwntw2k4hk56JZCJvVSHY5pMke?=
 =?us-ascii?Q?TAOPKEl/XWgmXPzEEGjJ1gSVNncKZHnC/LR2YxYo1v/hCAtkciCMowUfdnxr?=
 =?us-ascii?Q?CAtyLdTeoae5Q8xFht1Lo4Y=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 50a45890-762d-4886-3d3c-08d9fb5534e5
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9417.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Mar 2022 07:29:23.1459
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WJuReKjXyyvAc8eBxW+p5WL3oU+DH2Vy83p+h2iibZ5QvJSH+fnMIE72npyP7Cg+NycjtHGNoAhyfcNwZescIw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM4PR0401MB2226
X-Original-Sender: peng.fan@oss.nxp.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@NXP1.onmicrosoft.com header.s=selector2-NXP1-onmicrosoft-com
 header.b=ESFJjMXj;       arc=pass (i=1 spf=pass spfdomain=oss.nxp.com
 dkim=pass dkdomain=oss.nxp.com dmarc=pass fromdomain=oss.nxp.com);
       spf=pass (google.com: domain of peng.fan@oss.nxp.com designates
 2a01:111:f400:fe0d::60c as permitted sender) smtp.mailfrom=peng.fan@oss.nxp.com;
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

After root cell start up, use following steps to start zephyr inmate:
jailhouse cell create qemu-arm64-zephyr-demo.cell
jailhouse cell load zephyr.bin -a 0x70000000
jailhouse cell start

Currently ivshmem not supported.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---

V1:
 Just a copy of linux inmate cell with minor update for zephyr usage.
 zephyr ivshmem-v2 is not supported for now, but I not remove that from
 cell file.
 Zephyr PR: https://github.com/zephyrproject-rtos/zephyr/pull/43301

 configs/arm64/qemu-arm64-zephyr-demo.c | 155 +++++++++++++++++++++++++
 1 file changed, 155 insertions(+)
 create mode 100644 configs/arm64/qemu-arm64-zephyr-demo.c

diff --git a/configs/arm64/qemu-arm64-zephyr-demo.c b/configs/arm64/qemu-arm64-zephyr-demo.c
new file mode 100644
index 00000000..e5e36237
--- /dev/null
+++ b/configs/arm64/qemu-arm64-zephyr-demo.c
@@ -0,0 +1,155 @@
+/*
+ * Jailhouse, a Linux-based partitioning hypervisor
+ *
+ * Configuration for zephyr-demo inmate on QEMU arm64:
+ * 2 CPUs, 128M RAM, serial port
+ *
+ * Copyright (c) Siemens AG, 2014-2017
+ * Copyright 2022 NXP
+ *
+ * Authors:
+ *  Jan Kiszka <jan.kiszka@siemens.com>
+ *  Peng Fan <peng.fan@nxp.com>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2.  See
+ * the COPYING file in the top-level directory.
+ */
+
+#include <jailhouse/types.h>
+#include <jailhouse/cell-config.h>
+
+struct {
+	struct jailhouse_cell_desc cell;
+	__u64 cpus[1];
+	struct jailhouse_memory mem_regions[13];
+	struct jailhouse_irqchip irqchips[1];
+	struct jailhouse_pci_device pci_devices[2];
+} __attribute__((packed)) config = {
+	.cell = {
+		.signature = JAILHOUSE_CELL_DESC_SIGNATURE,
+		.revision = JAILHOUSE_CONFIG_REVISION,
+		.name = "qemu-arm64-zephyr-demo",
+		.flags = JAILHOUSE_CELL_PASSIVE_COMMREG |
+			JAILHOUSE_CELL_VIRTUAL_CONSOLE_PERMITTED,
+
+		.cpu_set_size = sizeof(config.cpus),
+		.num_memory_regions = ARRAY_SIZE(config.mem_regions),
+		.num_irqchips = ARRAY_SIZE(config.irqchips),
+		.num_pci_devices = ARRAY_SIZE(config.pci_devices),
+
+		.vpci_irq_base = 140-32,
+		.cpu_reset_address = 0x70000000,
+
+		.console = {
+			.address = 0x09000000,
+			.type = JAILHOUSE_CON_TYPE_PL011,
+			.flags = JAILHOUSE_CON_ACCESS_MMIO |
+				 JAILHOUSE_CON_REGDIST_4,
+		},
+	},
+
+	.cpus = {
+		0x3,
+	},
+
+	.mem_regions = {
+		/* IVSHMEM shared memory regions (demo) */
+		{
+			.phys_start = 0x7faf0000,
+			.virt_start = 0x7faf0000,
+			.size = 0x1000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED,
+		},
+		{
+			.phys_start = 0x7faf1000,
+			.virt_start = 0x7faf1000,
+			.size = 0x9000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_ROOTSHARED,
+		},
+		{
+			.phys_start = 0x7fafa000,
+			.virt_start = 0x7fafa000,
+			.size = 0x2000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED,
+		},
+		{
+			.phys_start = 0x7fafc000,
+			.virt_start = 0x7fafc000,
+			.size = 0x2000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED,
+		},
+		{
+			.phys_start = 0x7fafe000,
+			.virt_start = 0x7fafe000,
+			.size = 0x2000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_ROOTSHARED,
+		},
+		/* IVSHMEM shared memory region */
+		JAILHOUSE_SHMEM_NET_REGIONS(0x7fb00000, 1),
+		/* UART */ {
+			.phys_start = 0x09000000,
+			.virt_start = 0x09000000,
+			.size = 0x1000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO | JAILHOUSE_MEM_ROOTSHARED,
+		},
+		/* RAM */ {
+			.phys_start = 0x7f900000,
+			.virt_start = 0,
+			.size = 0x10000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_LOADABLE,
+		},
+		/* RAM */ {
+			.phys_start = 0x70000000,
+			.virt_start = 0x70000000,
+			.size = 0x8000000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA |
+				JAILHOUSE_MEM_LOADABLE,
+		},
+		/* communication region */ {
+			.virt_start = 0x80000000,
+			.size = 0x00001000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_COMM_REGION,
+		},
+	},
+
+	.irqchips = {
+		/* GIC */ {
+			.address = 0x08000000,
+			.pin_base = 32,
+			.pin_bitmap = {
+				1 << (33 - 32),
+				0,
+				0,
+				(1 << (140 - 128)) | (1 << (141 - 128))
+			},
+		},
+	},
+
+	.pci_devices = {
+		{ /* IVSHMEM 00:00.0 (demo) */
+			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
+			.domain = 1,
+			.bdf = 0 << 3,
+			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
+			.shmem_regions_start = 0,
+			.shmem_dev_id = 2,
+			.shmem_peers = 3,
+			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_UNDEFINED,
+		},
+		{ /* IVSHMEM 00:01.0 (networking) */
+			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
+			.bdf = 1 << 3,
+			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
+			.shmem_regions_start = 5,
+			.shmem_dev_id = 1,
+			.shmem_peers = 2,
+			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VETH,
+		},
+	},
+};
-- 
2.30.0

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20220301080926.15295-1-peng.fan%40oss.nxp.com.
