Return-Path: <jailhouse-dev+bncBAABBS6E2WFAMGQE6ZCLFMQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x13c.google.com (mail-lf1-x13c.google.com [IPv6:2a00:1450:4864:20::13c])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B69F41D3E9
	for <lists+jailhouse-dev@lfdr.de>; Thu, 30 Sep 2021 09:07:56 +0200 (CEST)
Received: by mail-lf1-x13c.google.com with SMTP id bp11-20020a056512158b00b003fc7d722819sf4719212lfb.7
        for <lists+jailhouse-dev@lfdr.de>; Thu, 30 Sep 2021 00:07:56 -0700 (PDT)
ARC-Seal: i=3; a=rsa-sha256; t=1632985676; cv=pass;
        d=google.com; s=arc-20160816;
        b=JxwyZK6whN+DjRSSaGNh/WnDs94FYwAALT9r/YvefyAtVZW4//bCNSMbk4YkaYAuh1
         5nTdizTt1e9u5JDOYZiCBR8JzyQQxCg727tDzcHjKKGVpMhRc/NAejRROD0jvNF9K7dK
         P4UNFQN13if2NDUpUaOoGY0eqz/DdyFiFoNs8SPk61q/JIpt/qd0kljNl+AhZXqCg9Kg
         vkG4NsMOTq7jEjWnNh4zDVU2UvK+4DxgOVxD0VdZEddP5djktuKlaeEOx6sj6cRx1aPy
         6dH7kQbgKWrWsMRh0WWQThobVsQ1rga41rHtXV66GS9xhcNVDciYPQPKaZPEznrA9iv3
         zybg==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:message-id:date
         :subject:cc:to:from:sender:dkim-signature;
        bh=Skyo3DilbvzAefoTu++2pBLGrDj/AhGiPDj1z0JH+ac=;
        b=Bk1zek5YKRAc9rKDrLtD9QHkwjPCuhg9H91gFcn47Ie/7nmZohWkhzkUD+dYDZ9lGg
         aHi0SjL9XYrinpOIY2Qlui0c1ue1Bper+fjGVVsXDvnnyhTj6alugvk03LNQUa38UKzn
         Va3iXrAFTVV0SUfnB9y5BcIhyr0JatfLUU82ApYuLhSqBfnG/9x4770GnJkfAmLq78Yl
         CvygIp/Aigt58VetjAuLxhmBYvYmxNKkyeXDEke5+tpTu1RlT5mEu3SwH7YJY5t9j3bc
         kA0qdU8d36Nfff6L9UiQjqEQlPE/31HvQje8JoVeD4kA2P4EG1BJiN3pHWwDcOjJNhiM
         3kJg==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@NXP1.onmicrosoft.com header.s=selector2-NXP1-onmicrosoft-com header.b=W4tSw3Ej;
       arc=pass (i=1 spf=pass spfdomain=oss.nxp.com dkim=pass dkdomain=oss.nxp.com dmarc=pass fromdomain=oss.nxp.com);
       spf=pass (google.com: domain of peng.fan@oss.nxp.com designates 40.107.7.74 as permitted sender) smtp.mailfrom=peng.fan@oss.nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:from:to:cc:subject:date:message-id:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=Skyo3DilbvzAefoTu++2pBLGrDj/AhGiPDj1z0JH+ac=;
        b=R6DB5d+1tHQN9kVmv3sEoqPK/H9L0QN3Xb5MZK2TsVuUhWe7VdsDwLOwFZOJBo1s6H
         CiLttxKG1kt+PA8Pbx9YZ1+VR0xqgKF8vEvU/2nODCDPD/ta5tFjTQKkA86Fo3OJ+OZj
         9uM/EwFn2HQa/N5v/+47chSQZJEsk4gyypC/kzx1ArFshwCNq4KPEVrhHXgCnbDyYwhG
         oXpJyJbP63aDEomlrFhLJhcPOa7P2XY9L0NoVRV/EfVihnA813/MJpQ6JptjGDp6T3iH
         fHzGr0ewu03BRcizz382U6Ryp1283+2xHk6JAKVshars9ks5LEEdXCKsdw3beLQ68u6+
         ENEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=Skyo3DilbvzAefoTu++2pBLGrDj/AhGiPDj1z0JH+ac=;
        b=q9W5Jdfsx23iOic8AKO6G6DBimnwus/C3bhfX0mVvAxZGYn1ssYnJLZQiixPywze0B
         /7REXxIPDThduU6tw/zSklzDqhBemSW9cVzq+EFQYd2YLp68wk0Q+YSzQi+LNA6tZY0A
         DnRd4CZoeRXRuAab9ITTtPlkhjVHmdMpokMUPJ5JIvQBJbQK6Grth1chavA1YpfvaTW6
         +VJDUorTJyM8NzqTJ2bB/YXiQFo/1/HZj69MLZkolx9G2mZxOgJVIGXGYbgwK110cSxM
         EMAXT9kWoDjVjUpXyuMeYB/5R9+5bwZLIfVinsQAKM4/adYiXLV7ZONKURv/x8YUOSYQ
         BapQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533vms6l4mP4Si5RyBSEAOD08ZYylhn7FRDmtACduDygTJpLFvyw
	MmkkgKJZ2oveftPnBkN5QEg=
X-Google-Smtp-Source: ABdhPJzJx6sGkH/ZPWvsgMokdbxGKTEGn+D/avf74sxBiQvhGeI2DCPr5FDGpbEctl6cNRReAHa3+g==
X-Received: by 2002:ac2:58c6:: with SMTP id u6mr4181938lfo.222.1632985675563;
        Thu, 30 Sep 2021 00:07:55 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6512:3a83:: with SMTP id q3ls1329443lfu.2.gmail; Thu, 30
 Sep 2021 00:07:54 -0700 (PDT)
X-Received: by 2002:a05:6512:3502:: with SMTP id h2mr3920102lfs.635.1632985674683;
        Thu, 30 Sep 2021 00:07:54 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1632985674; cv=pass;
        d=google.com; s=arc-20160816;
        b=FH4diOG6nRDA8UiOhzcDrAWDEqcY9OhylZmzSvSRmyW/xz8DvzRbH1Ash4Xc1Oyb6C
         H0I52uJNA3tCHV1k/EShgWfdcy4f0M5IhQXovwqk0x1ETAP3zZKk8kKexQeIwTtywGVt
         jbAsw+z81SiI3oI4IPlvlFyStSUJOCBotrpHpyRobL+vN2VsxDPkC9k3lj8LT7DRRcVV
         Vc/jqupZqCXmnDPLq2nng4oV+sip3Cphu3xXIenxZb05yCpIIt2WZUFQH1FOqE+ppRTj
         zHixrw5HVb9m96HcHxhLRMmUdZu6k8wJ+IWs4/NP9VSMlX5EhoW/ytwl8YFwIP5+NdQo
         2pUg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:message-id:date:subject:cc
         :to:from:dkim-signature;
        bh=HuBnT6fikEt9bpd7K2LgSuPZrx12c/dFDvU3LA3byg8=;
        b=ldvgRseBdznPGXWXL4iWCc1NWJSWJ1JyaB2NnDRDaKjh7E0nxtBBC4zWnJtbQ5AKxj
         T9cGKLwwwa3HxfURfAsEHuFc6ETBJKSuVKHnDB+vp4QAkW41hKKqwaK1jfAebvHrvykQ
         LqVQM5kedc9ZvI2NTjQXENvct9TRgHNmLBmTQtitUPYMmX04w1okFn6HpzPhBVH2FzUD
         8YEn69ig0d2UPNLhb2Mful10SUCfXiWnZnVkBwQuSC9JBDDjWxByJEv0rmV0ZuXKi5Bm
         wjbfS/LO2KP8aZ/tT1Lahv0ExwCDkXz6pyUbDefe4HmoPJTO8vejnEY3Aameai+0I7o5
         kRNw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@NXP1.onmicrosoft.com header.s=selector2-NXP1-onmicrosoft-com header.b=W4tSw3Ej;
       arc=pass (i=1 spf=pass spfdomain=oss.nxp.com dkim=pass dkdomain=oss.nxp.com dmarc=pass fromdomain=oss.nxp.com);
       spf=pass (google.com: domain of peng.fan@oss.nxp.com designates 40.107.7.74 as permitted sender) smtp.mailfrom=peng.fan@oss.nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (mail-eopbgr70074.outbound.protection.outlook.com. [40.107.7.74])
        by gmr-mx.google.com with ESMTPS id w6si116787lfa.7.2021.09.30.00.07.54
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 30 Sep 2021 00:07:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of peng.fan@oss.nxp.com designates 40.107.7.74 as permitted sender) client-ip=40.107.7.74;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fBUJIVq2H3ubjXN86xOblWrmERs+ZjZjZ6ZVvQAZaOPBXITcVCPUfgxtURlWcXJh7UekMTOXU7jzcoR6mju8gipK6c2bj48/00CDYf66eViNlEvB1DCe5Gw7mZTwWopOHHUOSZwUdk64AJS1SFuMSVXq/B3MfR7v+MPZTQqHWKUPBLqHwBWVoFOi1JKru7luLLaQhF2WjsHflNZ0ocYMB6JIJrcqDo48iGRhYrhQsOd1dSLOuAUrqFnERhphqbjX14KcJ9Whm8QpQHibImtHFXz5LP3lllFlQlhHYdlTWfPvlY7t7pWjYphF7dPWZcMRQgcLpkB35mv7jngZPBjvyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=HuBnT6fikEt9bpd7K2LgSuPZrx12c/dFDvU3LA3byg8=;
 b=b3DbydBKtuU02/PeTX1id/Ye/PgkRZIdmx6voqDqHB6h3+ak1RPvSMlGtc3spMqq5RjdXeRs2I85JEHhK7o38hZCWRcyBCVdVdAnHxiEJCXWusCXs0aZJXa0A6Mws6vmj/2Wune2ulukoOJWljf8rnVDIEs0OWmRE0vHq1ApB4XxoNYfaP6uehjgq1f8JxevbH/X6ryS9WiJ88HRxWAaVx0HcV+NsqMEYOqvmCfXhrvAiUHErsO4ox5/m5r8mdS7BCMjIRDe4MVdzjcplsUcaaOvQL5BL2Ud9vip7V1P4kdIHjFfSGXUSz972ZVuqzlDOMIJzcRwBP8ZssgUdDMH2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
Received: from AM9PR04MB9015.eurprd04.prod.outlook.com (2603:10a6:20b:40b::22)
 by AM9PR04MB8954.eurprd04.prod.outlook.com (2603:10a6:20b:409::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.15; Thu, 30 Sep
 2021 07:07:51 +0000
Received: from AM9PR04MB9015.eurprd04.prod.outlook.com
 ([fe80::1930:4dff:d531:7c3b]) by AM9PR04MB9015.eurprd04.prod.outlook.com
 ([fe80::1930:4dff:d531:7c3b%6]) with mapi id 15.20.4544.022; Thu, 30 Sep 2021
 07:07:51 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
To: jailhouse-dev@googlegroups.com
Cc: Peng Fan <peng.fan@nxp.com>
Subject: [PATCH 1/2] arm: gic-v3: clear SGI GICR active flag
Date: Thu, 30 Sep 2021 15:07:03 +0800
Message-Id: <20210930070704.2315052-1-peng.fan@oss.nxp.com>
X-Mailer: git-send-email 2.25.1
Content-Type: text/plain; charset="UTF-8"
X-ClientProxiedBy: SG2PR06CA0103.apcprd06.prod.outlook.com
 (2603:1096:3:14::29) To AM9PR04MB9015.eurprd04.prod.outlook.com
 (2603:10a6:20b:40b::22)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.66) by SG2PR06CA0103.apcprd06.prod.outlook.com (2603:1096:3:14::29) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.14 via Frontend Transport; Thu, 30 Sep 2021 07:07:49 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3f90bcdd-a23b-44ce-9e7c-08d983e10404
X-MS-TrafficTypeDiagnostic: AM9PR04MB8954:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM9PR04MB8954FC2622E13EAA09E1D014C9AA9@AM9PR04MB8954.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1923;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cEMoOd1zyRJFZoYpuZli0flARu1waMpc+hUcEhkAy6CuywuCPNb+KGi6KxXhh8rPNhYFaOT9/u3CSHskyxdqd1sfpOusQhLcT8niccnRnLsFbcRDWxycvWnlxg8bILuIXD2vi2PAaB2rRrB1LlS4fWZmyoFHBV6BuGzp/Gzbb6uVJpNmgIDfgNPaw6WMXgiZzIH8XbCzh6hFQ7vSk6OQojdhBXn+PHY8NdS7988qUB+MlP5az/68CjNdHHbkC9XSuwE06oEOiRBitIINTR/qWY9n0QvjCHOfAwdkXWwoutpu3LEXos1r22y+8ACf8f+rZWJZ/LFXSBuK8+WJ/L0lQYcGBENt7T+TJ+Y9uO+Yr6d52yUxkYiyQjX6CmkM5gtEadHFpP5MloXkTNRC3KF2U+XP/KkFhfLI6bbYl2Ua+yoUn01eN7ftI6qW9z0aVT2BptGAPjZNOExOV+xdudXfJqH23jxidT1D/JVoCpBUa5kPFzbW3It5U/eBrb8tKrT/PaeUdY0byeVw/bFECTtT3D9Zp2w6wMmxTiVo+DxcrSovKjHZDfprNRkFW9jRNKSfid56wqYzg10WkQiY+eG8RXisdhpW1zfOA5PgLPhaLLoNhj2r/Z9X9YvLOI152xGq6uuOFmav3HK5N30EB4OGFvqtoopzA5Y/+QMaCcgNLMaEAMWDp4OLQEb6dfxyg1iTyetgrtbRget2yVGmj2ev8g==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB9015.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(8936002)(6486002)(1076003)(5660300002)(956004)(2616005)(6666004)(6512007)(26005)(186003)(8676002)(508600001)(66476007)(66556008)(66946007)(316002)(6916009)(52116002)(2906002)(83380400001)(38100700002)(38350700002)(6506007)(4326008)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?XuDN2ydmrzKB1wfz2dQzbxzuM9Gozt/RA/LowLeHZpm4Nm1U9KgDvM6okY/g?=
 =?us-ascii?Q?Y7tJPHDeoWLtFa96K5KWfbKHEStzAcmtPQ+SQ9wypnZ9p99E9oE3ginxxKwT?=
 =?us-ascii?Q?jkQHvF7eiMQ+3q6OuMzDZ12ZVZ60HOyBvz0eQsOXpY363C+JP4wlVoRwPSqY?=
 =?us-ascii?Q?lWaMXGH4fw68PVbTqD6KRwM/PPv/2/j7qf/uLUtwutcKqfO9F4svwLZXsVYN?=
 =?us-ascii?Q?ldaRF/k8s20UdG+1VXAFggtyZi2PGgGMBZjOQ2Qao4qx9fHFgc0xMYpWB62Y?=
 =?us-ascii?Q?KyEJqbPHZLTv4nz6s+6xgwmO3cyV72aSJxD4L2KlY5lGmVlYfl/yg9FAhRsb?=
 =?us-ascii?Q?5jyBkSAvJJrUXUSG3kLAeAk8525FN+0+J+bAFiBGGBkqsJ39A7EJeVlKKFAG?=
 =?us-ascii?Q?YOlHrxkiRgyKug8Ea8bvnM6I8DsNDcmRM00tKH9aJgDdwRoJ59BYGo7jje+s?=
 =?us-ascii?Q?P/msoBa47yqcQcEU1IDAr+5a5ZzARy4nIgQ6BPBaBoCNBxuQQJxPOCv2Ojzf?=
 =?us-ascii?Q?xVbHcBNm4VP3i9AVpxAfl69kvyCANEhworkKNvvTYn+WKMsx5ZbqnCZ60fXr?=
 =?us-ascii?Q?jVOpzHNNgcM3FjUDqgwFN0huT4pO90Y8Q8yKqFXopUJq1TTzschak/H2OxI0?=
 =?us-ascii?Q?lRW4HCFzZGdKTE5lmHtkO+bQWL3PWFMbcm2ZtbtwZFFcePnBs6uKKHr3N/1A?=
 =?us-ascii?Q?5WZHbYhvHadLqIMscMI4Y+n2hI5vZPmxWN8yMqyblW/md5kw/oIgx7ZPPxVo?=
 =?us-ascii?Q?Dipug6rHswe25ZVoYGmv9jV1w3l1hAT3cyR1ksiYGpXqYHbrKZP1ElmyS4p/?=
 =?us-ascii?Q?OrkNXBMbgVzoG2t+xCyUK45pTEZPHGcK/V1Z068RTbMv0QmQ4OGQoNTwMara?=
 =?us-ascii?Q?g7n4tM4bkV8PVhFWIJRpX+zNhezqXuLwf1YzZHTGd3BKOZoS63hN+4P7f7G7?=
 =?us-ascii?Q?VdgeI9QQQvYOEo5UgMhcgMeEfC8bOU8NHSunfpD8TUdwUUfxDNi61G4DzXe0?=
 =?us-ascii?Q?TFaq/pf68jQcbQxWgxGKVH8QL/kUyiCGUYsrUBpahU9BZUt8YUJdlzOum6TE?=
 =?us-ascii?Q?BrvprPmKCg8vK84L34Q4WbMtZioobOleB1dJbrBenDquhgYi833I1DG1ALeN?=
 =?us-ascii?Q?mM1D128oBhF+hjfsO1I+LVY6xeEsVMwBV63RVp00mcaqpbRgkOXnj2uZrpLQ?=
 =?us-ascii?Q?zUQpEb54Zwr6UcyiXsZr8/ZQh2sDplzzZ2CnOPWQ6iM17aLrCGyLJgdz5tVO?=
 =?us-ascii?Q?aCGRynme1asrCzfqUF3JGRrgbvNomes2hYNorE1JA67Z9ifLqVgOpK71Uz03?=
 =?us-ascii?Q?Guna4vM8ba4Gqn51iOay/xwy?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f90bcdd-a23b-44ce-9e7c-08d983e10404
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB9015.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2021 07:07:51.1501
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LOX7ZPpSWve8z1pNKoX73MkWaEnrIhFFsutO/IhWHBWXbAPVQ4EXvysEYVObHM4KUB9aSsDmLamWD1tNJBi+rg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8954
X-Original-Sender: peng.fan@oss.nxp.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@NXP1.onmicrosoft.com header.s=selector2-NXP1-onmicrosoft-com
 header.b=W4tSw3Ej;       arc=pass (i=1 spf=pass spfdomain=oss.nxp.com
 dkim=pass dkdomain=oss.nxp.com dmarc=pass fromdomain=oss.nxp.com);
       spf=pass (google.com: domain of peng.fan@oss.nxp.com designates
 40.107.7.74 as permitted sender) smtp.mailfrom=peng.fan@oss.nxp.com;
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

With Linux Kernel 5.15
commit 6abbd6988971a ("irqchip/gic, gic-v3: Make SGIs use handle_percpu_devid_irq()"),
the on_each_cpu IPI_CALL_FUNC interrupt active flag will not be cleared
until interrupt handler finish.

Without Jailhouse hypervisor enabled, everything is ok, but when
enabling jailhouse, HCR_EL2.[FMO | IMO] is set, that means NS-EL1
is actually accessing ICV_DIR_EL1 when eoi_irq after enter_hypervisor
return. It not able to deactive the interrupt that is actually a
phyiscal irq which in active state.

To ARM64, the IPI_CALL_FUNC is using SGI 1 which is same value as
jailhouse SGI_EVENT.

Then the following `jailhouse cell create` will hang the system, because
the previous 'SGI_EVENT' is in active state and not deactivated, so
the current SGI_EVENT issued not able to interrupt the target cpu core.

To resolve this issue, let's clear the active bit of SGI_EVENT and
SGI_INJECT before back to Linux.

Tested on NXP i.MX8MP-EVK

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 hypervisor/arch/arm-common/gic-v3.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/hypervisor/arch/arm-common/gic-v3.c b/hypervisor/arch/arm-common/gic-v3.c
index 03cface0..8327a95a 100644
--- a/hypervisor/arch/arm-common/gic-v3.c
+++ b/hypervisor/arch/arm-common/gic-v3.c
@@ -200,7 +200,7 @@ static int gicv3_cpu_init(struct per_cpu *cpu_data)
 	unsigned long redist_addr = system_config->platform_info.arm.gicr_base;
 	unsigned long redist_size = GIC_V3_REDIST_SIZE;
 	void *redist_base = gicr_base;
-	unsigned long gicr_ispendr;
+	unsigned long gicr_ispendr, gicr_isacter;
 	unsigned int n;
 	void *gicr;
 	u64 typer, mpidr;
@@ -291,6 +291,10 @@ static int gicv3_cpu_init(struct per_cpu *cpu_data)
 	/* After this, the cells access the virtual interface of the GIC. */
 	arm_write_sysreg(ICH_HCR_EL2, ICH_HCR_EN);
 
+	/* Clear SGI active flag */
+	gicr_isacter = mmio_read32(gicr + GICR_ISACTIVER);
+	mmio_write32(gicr + GICR_ICACTIVER, gicr_isacter & 0xffff);
+
 	/* Forward any pending physical SGIs to the virtual queue. */
 	gicr_ispendr = mmio_read32(gicr + GICR_ISPENDR);
 	for (n = 0; n < 16; n++) {
-- 
2.25.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20210930070704.2315052-1-peng.fan%40oss.nxp.com.
