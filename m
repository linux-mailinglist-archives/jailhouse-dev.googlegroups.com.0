Return-Path: <jailhouse-dev+bncBAABBDEQSGFAMGQEF6XDNGQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x540.google.com (mail-ed1-x540.google.com [IPv6:2a00:1450:4864:20::540])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E05440F380
	for <lists+jailhouse-dev@lfdr.de>; Fri, 17 Sep 2021 09:47:25 +0200 (CEST)
Received: by mail-ed1-x540.google.com with SMTP id b7-20020a50e787000000b003d59cb1a923sf7296364edn.5
        for <lists+jailhouse-dev@lfdr.de>; Fri, 17 Sep 2021 00:47:25 -0700 (PDT)
ARC-Seal: i=3; a=rsa-sha256; t=1631864845; cv=pass;
        d=google.com; s=arc-20160816;
        b=QmN7lFaCz1IKdXgrQ/dywCCmcfzv6wOPTo8dBksf8WPxee/FiQq9+5kZJSpF1tRrwx
         BFUQW3b3EXTiYtwcjpv+dfr7CuYCRFjHZjVHfEECGcVoYYlaf5jAZ4ArKlXLKt7CU6xM
         SgpbCj49l6objd4oA2XS3wLpl404kOnhBSn7mD+J7Y7ogYlDKrJWgfxTcHST3i/jKN4c
         kwVx6emMvFfDOqKKLIQp4fgwsjuXgqbYmllXbFafHBg0L9CZlRxyoyaDNAUS18T48vyG
         pAJY68pq2IAZnYlcBjob9hGqTPWEpVSw177jpqcVQxcOJLZw6VJGJYpthDX5CKR4hLhB
         sM/w==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=NgDaLFZ1VHsxGrCsRY4lnnbY5QGCbDQ8p6/m+ot6NVM=;
        b=DUgZ02FWGb4iwpzB2esexnoEAkQstUZzObadNwuBnekkSqej1oEQ/zCNyyEHsPt0XI
         7bx2JtWbOoc1N46MvCpZ0dU4+/STfHTmx5Qap6iPCguVKu/PY3FhzGuWgGE5zZfwE1xw
         MkmJEb8HnH1bojuTQvcuvQ+eMWPfMJFmPOuj87hHXyJghHkgb2Czi/kDQMmehU8y5Why
         sKIB3g4pUNitwBQhCsu5rbrVpi9NuN7ZYZk1ZWhuGIf3sB+Ovc5SsHhrkjnYrN7W0ut8
         ylwAbB2paekXrNJp7dgb04XN6HLlcjiY2HRPu0w7tQm7Q4Vewz5Q9TmUTt93UZ5vfMZR
         qP9w==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@NXP1.onmicrosoft.com header.s=selector2-NXP1-onmicrosoft-com header.b=ITpj6URi;
       arc=pass (i=1 spf=pass spfdomain=oss.nxp.com dkim=pass dkdomain=oss.nxp.com dmarc=pass fromdomain=oss.nxp.com);
       spf=pass (google.com: domain of peng.fan@oss.nxp.com designates 40.107.7.72 as permitted sender) smtp.mailfrom=peng.fan@oss.nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=NgDaLFZ1VHsxGrCsRY4lnnbY5QGCbDQ8p6/m+ot6NVM=;
        b=Ffosni+l+WJXuf/jdeH6w1E7sgmerucgOJLKNBn6wjuwkHc1qfxDJUXW7tHdGpHxMx
         qP2EYP8BY+nMUy4OzjDZU3lH24IYs591S4PuD+7OHJJGiYCij1gdpddjXqSbuWXDso4f
         gFEuQfO2MeFvL+8MwzixIOOojZL1TsAKmO0f13pjAgMwmP4QrjyGF1nY5/QuS9aMZdit
         4Bk67Zb9F6qeR3wnbARr2E2JTuGoSFeufS+shEOeH9b9BXhEt16WF4QOpoZxOVfieIyJ
         UvxtYf0DhOsOJbcCTaV33XAwV9NrLVwRtwlxUJtnbQXAyK93AqfTWWdUHigfnkNEhABS
         7MEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=NgDaLFZ1VHsxGrCsRY4lnnbY5QGCbDQ8p6/m+ot6NVM=;
        b=cgu3P589JZyGVe48PK0eaM7wyaY/qJINPsSXGPxQeOm3MsysPgvzlEEUGm0fMyD+GA
         JQWJXBznYfWOkajnV9G1iFH0igj8qfJyap4Y1TXHqPzpP/LzIdzg8qZzWQxDLJqO1czn
         o8HO/ftv1v8nimIii+8YxCmpaZaS1q7ilb7dr9KE4x/nHXVEcn7BLc00NQeZQd6kZRFQ
         bEUADZ4HOIftI8IwEmnRofYQsK2VBKUdnnP6d3q8UV9AN7X8rxf5MsiNY2nZGtyEWkHV
         1moxK6rx4Y1Xdst3/ftELv9RarUMSCdR8FAfzADbxSaENUsegGhLiL9KZUeTm7zAQ/eR
         sewg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532m8vTBUVrDF64AGFP63ILU9LcXxfqAPfUq8V8VbfssEnHbIxx6
	Q8s15PxGchk+xxJrpwRRKNg=
X-Google-Smtp-Source: ABdhPJzz/qgbmkjmd1YnaTYKu/E+zdOtn8i9cWboFK3WhyhgDpD64TdEIjzj0oqS7AjTYXJvrqXtKA==
X-Received: by 2002:a17:906:368c:: with SMTP id a12mr10786365ejc.143.1631864845097;
        Fri, 17 Sep 2021 00:47:25 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:906:3597:: with SMTP id o23ls2948372ejb.8.gmail; Fri, 17
 Sep 2021 00:47:24 -0700 (PDT)
X-Received: by 2002:a17:906:1510:: with SMTP id b16mr11260587ejd.332.1631864844259;
        Fri, 17 Sep 2021 00:47:24 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1631864844; cv=pass;
        d=google.com; s=arc-20160816;
        b=X58J4t3vhejBbj2MsydOm29G1B7LD9ZpmrSrKHEfQu+sNqw0kclqqALENMUGVb7s1s
         dGEGxRcwNb6bNUOXoJyUbJNNs/Oa3KutaBNsVMVad1RI1r3Sm+2eFtwhNxFf/wfcrTCH
         58SU1HflqQKeLJdsRphH2nr1znLWFE26aHKHVlXi145vjzERIcrdkamYBxWyHmpuQUTi
         NWzpqp0GaNxV9r8gjl1Ky98HrLTVQkvoR+uNhXAI5y/yciwEPIzmVWa5eAJ3tJt1B+sL
         rEyH6EN2kc0QA+vvjtcH9Z/hB6dcB/h9oUolNzBinaTm1RlCnnI5OoqJmZz9F0DzihW3
         BJZA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=RQO/WnNgjXUdIsTObmicEysqz00b3C7ANz/XwfVQpBw=;
        b=lDKmBx2AisTIfPG4njilrn7XETfzyLNhRAfKlfLolMH0+Zh3FxmysSNkblZpPF40SE
         H2eQq6UCpZzULtuAsNvWqR04KYNhrYbn1m7bLwrEHwJf+mGoCvAxd8H3Fs1yJCBjQFEH
         08zeypwKCg5c2T4E9uxzXgVVwfudPlV6lUyKkDJ8JlEJOdmFr8U8b/435V7Dpr+5bU3n
         EM+lKH5jUFdfSmTrNQh8PjL6rs8lpJAMGyiIl54ceNH1R4cWBOb9AbzclvaHw0MjBKcZ
         pFw7SLRmFK3UFhIKLjEqE6jx+3GwhzTZDFjwKDn0pht7THAiQkcomYpvapLcKKFkyKTU
         gckg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@NXP1.onmicrosoft.com header.s=selector2-NXP1-onmicrosoft-com header.b=ITpj6URi;
       arc=pass (i=1 spf=pass spfdomain=oss.nxp.com dkim=pass dkdomain=oss.nxp.com dmarc=pass fromdomain=oss.nxp.com);
       spf=pass (google.com: domain of peng.fan@oss.nxp.com designates 40.107.7.72 as permitted sender) smtp.mailfrom=peng.fan@oss.nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (mail-eopbgr70072.outbound.protection.outlook.com. [40.107.7.72])
        by gmr-mx.google.com with ESMTPS id r23si738069edy.3.2021.09.17.00.47.24
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 17 Sep 2021 00:47:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of peng.fan@oss.nxp.com designates 40.107.7.72 as permitted sender) client-ip=40.107.7.72;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JBXtGkVEX1p2ZMc7XyojwvPcyK/1jJDSlz0iIxUTfdaqqH2oHD2vLuikCU7LgIYsxY0w300tDZD8uGaFLCdED03BgnJV7hSWeEuYs/naPzpgmXmxpaU14piGYVvCs19C+HyGDUBPOGgGmRbNfHyb/YYrtgv7pBdzvfQkNf+pJB1jZiFDzvWn/WeMVx7H/V0cY90XYaZR0ivzuSY4QxKh0xUKy92efOAAa1Ic0J5eIwGvMwoYmSuiz1OJ8lPi7ae3KV9rj6CrmaOkGpYUF5vAtQ0/dTgcr3E2Wz33pR8k6EqDUnnUA28lIvoD/cUnMr+UKKYccqrL9IJ9kjzTu4IUcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=RQO/WnNgjXUdIsTObmicEysqz00b3C7ANz/XwfVQpBw=;
 b=E3c1tNoiapEHoidVZ8bBRo7Yxc0S8GUOcunB7ARGChfWli5Kl6mVpY05EMT3i8rTc+3XWrrc7kuqOaW1njmVki0zkMhs/2ZjwyD4cSnvGZvxQshb33yWODcxWwNRezyo5Iq8AvhXjjFkZ7z8TwxGiHVamF1lKjyknqlqEOUFyr65sgwcf29kqYnv7FXslesYA2meZcg7byl0M06plupfosyGyVluGSfN0pilXpiY9AyRGYc3fSod7XRPJ4e2JyrdlL+frK/EMUFNNygjARdfZ/pPYoQD+XPfqbFPWYAR3CLeuXyyqoAeiPAdds6zICkfeZPI+jOo6bDh6EjaTobKbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com (2603:10a6:4:a1::14)
 by DB7PR04MB4489.eurprd04.prod.outlook.com (2603:10a6:5:35::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.15; Fri, 17 Sep
 2021 07:47:22 +0000
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::4868:6843:a39f:aa53]) by DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::4868:6843:a39f:aa53%4]) with mapi id 15.20.4500.018; Fri, 17 Sep 2021
 07:47:22 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
To: jailhouse-dev@googlegroups.com
Cc: Peng Fan <peng.fan@nxp.com>
Subject: [PATCH 2/2] Kbuild: use toolchain stdarg.h
Date: Fri, 17 Sep 2021 15:46:30 +0800
Message-Id: <20210917074630.2585329-2-peng.fan@oss.nxp.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210917074630.2585329-1-peng.fan@oss.nxp.com>
References: <20210917074630.2585329-1-peng.fan@oss.nxp.com>
Content-Type: text/plain; charset="UTF-8"
X-ClientProxiedBy: SG2PR03CA0109.apcprd03.prod.outlook.com
 (2603:1096:4:91::13) To DB6PR0402MB2760.eurprd04.prod.outlook.com
 (2603:10a6:4:a1::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.66) by SG2PR03CA0109.apcprd03.prod.outlook.com (2603:1096:4:91::13) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.9 via Frontend Transport; Fri, 17 Sep 2021 07:47:21 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3bcb4091-b86b-4069-0428-08d979af6218
X-MS-TrafficTypeDiagnostic: DB7PR04MB4489:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DB7PR04MB44897D05CADEFA3EED01E402C9DD9@DB7PR04MB4489.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4714;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DCtqcSkh+t+5j8JU4L00yq1Wdh/bRBRx9hQwdMgxl1GMDc2CIPkcAks6OY66/IUYKF5y4auofMuxJFyx8GPR1endu9e8q2+sXp5bu/dX8tiVEm29yROd4/nk2PoIIA/JpgkTdYzf49gvFglOhivloqdV/YoaPNRc/SgMs9rL+IZGtc6yMDZSsotEi6Kpj3HTOJJGo3Kn7yJRFMdZYkm2Or+yZmfhTrNgI//5OpxZ1cWx6/HcCMHaET9s5RGeUJuTFfmSyeXhMSd9roPf8q3pU+7dwPXJ1TxX3f4L7B8VSGOlj7vx9eIrZZY5EpE24M/46Ips6hLcrbGpsS0nY96Veyrcj+tIlroWJr1RSkpA7/q8YigNlExqRwoP54ty5o4zN7Cl2X48EuPqApUJahGGsX6En274AailOJmx7HZehAFLhSjoP8HF2AcNM79loC+amDNooVqjFbZueZxHrB5Wdd1ibFrbIRaQplp74e2KsnfKTRWbHkuS3GMGu/w0k1hXGVie+T25q8LQv38Q5k18br+sDr4gvGvfftEL6JB/2ohYJ0z0t/cOVxmPJrJRj+SilPisP0P83FSNzEXEkeLc8+51ixggdAJ4wCPmcqNKJ1iYJBfDkzp98SBWqkFL7g8BF7/PaDIiIV7LQ7YcQtRZrMWyoywXbB1FcZmtP0fwL+05bEbNCnCNm0WmVpLZrnHx4zmHd+IteUKjjdlgR2BMFA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0402MB2760.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(66476007)(66556008)(6506007)(316002)(956004)(6512007)(5660300002)(4744005)(8676002)(66946007)(8936002)(52116002)(83380400001)(4326008)(6486002)(2616005)(26005)(6666004)(186003)(86362001)(1076003)(38350700002)(2906002)(38100700002)(6916009)(508600001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?qTzFazx8zhXRr4Xxz8kohRcS8h8GZkgRXC4Z8sFg7dnElbc3dGNAneZYXFRQ?=
 =?us-ascii?Q?c9mgZfiHukREhz1tr52SvK5vzHH+8IBp2Xc2pYiRake3l5FsteWDns3y+xzS?=
 =?us-ascii?Q?h3tWRAOw/cSRCUXK2oPkZWsGWE6TmouGaJNz0/j4ZHrES7SlTTYYqDBM7eod?=
 =?us-ascii?Q?aqJw6mXdwFkqbfVHjRz8ITNCsOiE12alTqQXExEVHA6RoMnSCc4kEP/vej1w?=
 =?us-ascii?Q?pnClp1q7S05O/y+scLwf04EmRaWdrIjbQPtl5erR517XN1t5GCKANMcBXtLY?=
 =?us-ascii?Q?F9omEGtYv92hMClP4LgUkq05Hf2IPUy54weBomkdWGloukN/gS7iDiy1hJKv?=
 =?us-ascii?Q?LL+sBjACwNDZjhhaXfHICLMRAjzY5xSk4ZijMpH3HIyPO94iTlCnjd2HNcci?=
 =?us-ascii?Q?3OKNm+aCLiQCrJ8YQ25fz1ZZm3CWJinXRMk2MQWh45FSKzOmBCbzNgnalwxe?=
 =?us-ascii?Q?Df+ijBzbJU8XO4I/cn0D75Qr7ypHhY1thDhyHwaQtH1nunVczXSSMx5+5mL6?=
 =?us-ascii?Q?2vD+xmOHllGbsyvsf0ZFMsRYsSb9Koo+1fqB8510tUxLESB+wyxfP6ZE1Jck?=
 =?us-ascii?Q?U/GWH/vK8qooIxlKkg3okPH/le1KaS6OFg9CY3lLBgYDShjG1H8CqsW4bvj3?=
 =?us-ascii?Q?cVy1rh0Igx5PxwWLIOexf4EnMNA8Zuc4siEfPKyuYuWEgD/wnHid4LiExH0Y?=
 =?us-ascii?Q?3jBaMoT2W3yuYXJXmyyf/WwLIK9Km7AIz1TTTokXDNOhY0uWT6/x573foN76?=
 =?us-ascii?Q?dfLtpZOOxz6D3Xu0E4ru/GzezRdil5zntrLEPbZ+QdCHfDu+yX//tLjtMCwQ?=
 =?us-ascii?Q?LZMJ1tHy7RcuRYOA7n4BWtmwPIpD2j/3ZMBETbOcd9uG4SCt9bUnSwuUcqIm?=
 =?us-ascii?Q?nlkddGhLrdfDnyZQKWMi7N0a3p7HUEAiJ9/97vtZe9Y2NyOrZbhGmUrTc0SG?=
 =?us-ascii?Q?lmi6GX7EaHXaqb1Scen4feCuchvHsH/SB32v//kK/tNfb4aDnRX1j647e53Z?=
 =?us-ascii?Q?oCpQzPkHwG8lwL48AOye1zxcQaM5+CPSCR408Awu4EbalLQSJ6Mlb0Ik9++a?=
 =?us-ascii?Q?pBEHI7Mw7Ig7JeYRNovj0hB8DWQFXqAMZgZS6HRR51LDjIB/gpyk82suWNZK?=
 =?us-ascii?Q?sGFWojQFLs0g7Ix2xIBkGbTj+WXiUTjbyFlhzQ4kStq7TizwzphOt0+xNziS?=
 =?us-ascii?Q?MMyoUSabrMn15Lcp5dWq8gDpWLnYZs3SDPUw6ykX3y6rgfcb7F7IsEXIFU3y?=
 =?us-ascii?Q?JL9n6xseg58b/CTlG15pR3auqzniA1qnyvkIm0I73b7AlzVavCb7xemXRxIF?=
 =?us-ascii?Q?qYNx/RpUu5rmZp2KvdQg/fIW8kBkVq0tpFH+Vvec/eD5kA=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3bcb4091-b86b-4069-0428-08d979af6218
X-MS-Exchange-CrossTenant-AuthSource: DB6PR0402MB2760.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2021 07:47:22.5242
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6tjVq+82w4hWrKqGtq40hgnyHSNDY76ur2gxM1sw3e4QaYHVMKuk6vEnTpWsXRcLLL0WBTEG7yDB5Cs0QK5zGA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB4489
X-Original-Sender: peng.fan@oss.nxp.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@NXP1.onmicrosoft.com header.s=selector2-NXP1-onmicrosoft-com
 header.b=ITpj6URi;       arc=pass (i=1 spf=pass spfdomain=oss.nxp.com
 dkim=pass dkdomain=oss.nxp.com dmarc=pass fromdomain=oss.nxp.com);
       spf=pass (google.com: domain of peng.fan@oss.nxp.com designates
 40.107.7.72 as permitted sender) smtp.mailfrom=peng.fan@oss.nxp.com;
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

Linux Kernel has shipped a in-house stdarg.h under include/linux/
and drop using the header files with -isystem.

However jailhouse need to support multiple kernel versions, instead
to add Kernel version check in various source files, update to still
use toolchain stdarg.h with -isystem option.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 Kbuild | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Kbuild b/Kbuild
index 2863c121..fecf61f7 100644
--- a/Kbuild
+++ b/Kbuild
@@ -58,6 +58,8 @@ subdir-y := hypervisor configs inmates tools
 
 obj-m := driver/
 
+NOSTDINC_FLAGS += -nostdinc -isystem $(shell $(CC) -print-file-name=include)
+
 # Do not generate files by creating dependencies if we are cleaning up
 ifeq ($(filter %/Makefile.clean,$(MAKEFILE_LIST)),)
 
-- 
2.25.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20210917074630.2585329-2-peng.fan%40oss.nxp.com.
