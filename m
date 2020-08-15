Return-Path: <jailhouse-dev+bncBDEN32754MOBBSP73H4QKGQEMFY4WII@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43d.google.com (mail-wr1-x43d.google.com [IPv6:2a00:1450:4864:20::43d])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E89E2449A1
	for <lists+jailhouse-dev@lfdr.de>; Fri, 14 Aug 2020 14:12:58 +0200 (CEST)
Received: by mail-wr1-x43d.google.com with SMTP id d6sf3297679wrv.23
        for <lists+jailhouse-dev@lfdr.de>; Fri, 14 Aug 2020 05:12:58 -0700 (PDT)
ARC-Seal: i=3; a=rsa-sha256; t=1597407178; cv=pass;
        d=google.com; s=arc-20160816;
        b=RGax2HkuP9beX3s54GX2USgG1fi7CtCptYEm3+L0yreVoHWTNcMp5aramDoCPZLpQa
         5+J8vlIMoHCcwlfKgHT5e09S3EqlMEwr/h1EMOgwTwkqEJZEIIt+0eOpV/8itZ2bRdkq
         A8IUvU2Pa6yarnuQl2tHTG8q1zom99Nmi9+lVYGuze0udXLdrMyhZzAOaCRpAay5pSRh
         AJK/WTdmB+JLK5TqQP4h0u7UHBcGHfFOA32hZgJacG/5WYp2NAM9Duoi7VrzALBBaK0k
         GToLegkljQy/wcpG1iRXJuUmheaOpC9sMt4g7HGHN3FLD1kAkK50/mhzvPTqzn9+STPD
         KjTA==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=jF5x53EdlfKzIx8g69Gx0h2xKl8iKmoTqJZ5tQ+3BVU=;
        b=XQFYvu5stpJAL0LMQKBfnE5IfOtogilj0KwC9qhFpSkNhJUktzqqU088p7fax8HmlU
         L6GVVa+9XdW/lthIitRkb+1wxqaKLqR6rGyRwIiC73QJNBzOC9C1hENdCSeZWTAGiWmX
         TErGKhXtFILodTFuwYQjHQ9BDfTW9YoeRTfT5apl1D6qJsd3unWLFpicl9YyIDlQlUt8
         ApqmZJ6R4BlK6MOeuxKTExbzzJYls3XFGVYPMFbmKazzL6dNTDGuaB7NvVqJHUiYaEIm
         lvGzalnRNlFp6owLLGq3qN8dn+tAqZn6lyJgLcZkbYyyRnaW8NIPnf8uvi06XKPjv0Ce
         hPlQ==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=NR0465Nx;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of alice.guo@nxp.com designates 40.107.8.70 as permitted sender) smtp.mailfrom=alice.guo@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=jF5x53EdlfKzIx8g69Gx0h2xKl8iKmoTqJZ5tQ+3BVU=;
        b=g4brGm/+y0UwAVluTSe8fY0sR9NlHrLtITrfZAOXDJmcSLHosxiC336C5GAB9Jy3OO
         dhbkAIzZ9GT1QZLX5Oa9TdYvq1GbcKKL4kCVidxd3T+3Tkpnp8ua02UMXOHCwb0BTMPP
         Sf2arQSQXNNto7FFwJscYdoKJsVoFNmOolnXcMOF/k7SnY5a5dcleM80GuyVb9bjkWD4
         p6gZaC0fH6sydCXuYc7YZqMt4SAEDW4IQgHT68Pb+XiQNwUsFX1bWULGkHj47FqWgBHm
         lCjLTseisJfs161F12nDsEJDGl3/LfH4V/nXYeN4h+E1Dd7JwNMyqiiPzDDyaUB7nxIa
         tFyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=jF5x53EdlfKzIx8g69Gx0h2xKl8iKmoTqJZ5tQ+3BVU=;
        b=TC9Rw99TSrqrOjLjyhI+5Fa2hSCalhBMCHhB91jVIBk3r0p+8MQEhiyGS0akqJ4b7Y
         18JYOt75eaPUih7QIyCnmmTDs95OB8WiV5GS3Jv7ysceV4y132HRZVt1QkrZ6ws30pEa
         IPCily0uQEJd8Cw2RdLvdB/eRaXYmUZZcVd7KylnpBFVBeA3sNms9dwUeELsL3B9AGYi
         y+9JL1ZNPEZZSWtdlB4t0q469OvGyv454xbg8/f0FRrWjCXPiiS4Zjgr8VMMBG0WDAzn
         UW0aG9pK984srsAgNze4rRhoa1nZOH6oFOe6koRnAZuDvxMjeKqnSSJ4EvdfvI3Rq3KG
         50Tw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533R/tEKEmkwKhjiuoPKxKAmBPZXt7ZNG064Hy6GHLoJNWTsPYhY
	w/nM5UYIvgsWY82bAW+eBEo=
X-Google-Smtp-Source: ABdhPJzrwm6iyZK7y9QQGqvjc0uQBL8Cb/xNwfyQ0qlDYy09vwU7RaaAkR5+kp148xpR/UjcqwfzjA==
X-Received: by 2002:a1c:41c5:: with SMTP id o188mr2368633wma.187.1597407177847;
        Fri, 14 Aug 2020 05:12:57 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a1c:a587:: with SMTP id o129ls4044530wme.2.canary-gmail;
 Fri, 14 Aug 2020 05:12:57 -0700 (PDT)
X-Received: by 2002:a1c:e302:: with SMTP id a2mr2378042wmh.110.1597407177259;
        Fri, 14 Aug 2020 05:12:57 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1597407177; cv=pass;
        d=google.com; s=arc-20160816;
        b=b28/aHOQYC8c+J6HfsPGezLsJdTGQmBM1vwLrmaPLQP+oqRY1skkXIpiT712EEP3ti
         LuQNlISQ/s6kxs8tWjoRztJbfpJb6Xrmbkd1/fvy5BtbuampJ9nn4y9DVPZ88GrMHdt3
         aMNmxjFmEdYPCfOPuzk9U7KE/qf+EKbd3Rl94bPy7BzEUInOChjbzJ92BNR9LQT2dVyi
         OvmWRA97q7tO6W9juBKQ+sPTDpLiFc2rNcln2CtPU9Sk5nY0Qe9Y68oLqK0H8s+cuy7L
         XNmazuvuLRdmT/e6MzGOIU2YfUGKqI6AJJR9ElSsV8ZbtdACpgYnY2UjZgSvQF4aQCu7
         xxyA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=SVEajnWZOU5dJO5CNX63HlgBLx1k/A94TQ43bgC3Etc=;
        b=A9KWZ+FnuJCbHmov8OAYJ4kPPdbxA02IzkJgqGtcdBgUvDsK1srKVH63ElWpMB9gk8
         WClvkZIYq6/lq7whJhucg44vjS5uQ57kKP/XfXaEmA7FoIjEOcf5L71mi7SEomrmesuq
         b8YXMZI5yBMUC5eYDywWS+RYlN5T/ZNr206LU4knp2N6J7OASHv95E/NcW8mb2y1Et/d
         SYsKFDp8sTr+GADrw2MfAzEVrt1CkuVRqFLWMj+TT+5jtqKBLJSo0RCxuW9z9+95W0R1
         gxNKb215Cgr3+ZL0AMWGva05qUlbTNcIMiAYlwpR7cv+cCT1qfygJhWBxOJrVZZ8No8s
         zTHg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=NR0465Nx;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of alice.guo@nxp.com designates 40.107.8.70 as permitted sender) smtp.mailfrom=alice.guo@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (mail-eopbgr80070.outbound.protection.outlook.com. [40.107.8.70])
        by gmr-mx.google.com with ESMTPS id n129si513944wma.2.2020.08.14.05.12.57
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 14 Aug 2020 05:12:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of alice.guo@nxp.com designates 40.107.8.70 as permitted sender) client-ip=40.107.8.70;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VRG3TfWTVQAmGzpsqHrQIVyPCXsrSIvqXL59q9J0bSi8AOL1vMUFsz05M4Z/owjZnsFMT4qjpnA862Pvdefjdoi88S5SwGmfJbTtmY+MnkSLMJWfiIumyUs4uMBbXlolE4BRK/wQ1AC7saZPgmOXTbdWobax9iZVk2AvD6ItebYzzcr3OqEFeyP4oQDfR3J+EVnC8V4rS3zoV+pSq3wMVnHn60CzmOT5pv6EUxobpJ3VN1hurUc+AyCaccruarmWkGq/HCa5qko1tM4upx/ms/Bmsr1q5RI5BYsmh5IVGevaGHV3OI9Pc/Mk9BO7AojRYF0jF67v5HcUyHigLjA6Ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SVEajnWZOU5dJO5CNX63HlgBLx1k/A94TQ43bgC3Etc=;
 b=OEzpsaL7SXakjjZracMtkZmK3jxHcOYrjsIIfDyn0aQ+0LanXWtT7MC8ZZ2yGBy+ZhxUkqXg5Z1sM4Wlcbnk1x7M3kymROUB3B7agCV4QzoOfQd13uFWgP/1Z+wXGoltZWmxN8yh9mq9a4FTW3CTaemsOa0zd3Q1sT012XVOt5N55A+eQhcRY4sLdX5d+J0BkOXjflQqL3lfMWYdR/+9hQhu0sqAQ248VNNk1sSrOHOrPdQT4ynOjVQ2J/H/2V11dWxmHzG/OikvrQxF96nZG7ZqkvQKR5+/MdA8J1jLawOIKlnS+KMtSZm2UyLnfYAly4GwoG0BHkoAOJOEAAtPlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
Received: from DB8PR04MB7065.eurprd04.prod.outlook.com (2603:10a6:10:127::9)
 by DB7PR04MB4730.eurprd04.prod.outlook.com (2603:10a6:10:1c::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3283.20; Fri, 14 Aug
 2020 12:12:55 +0000
Received: from DB8PR04MB7065.eurprd04.prod.outlook.com
 ([fe80::5042:d7a1:10c0:c40e]) by DB8PR04MB7065.eurprd04.prod.outlook.com
 ([fe80::5042:d7a1:10c0:c40e%6]) with mapi id 15.20.3283.018; Fri, 14 Aug 2020
 12:12:55 +0000
From: Alice Guo <alice.guo@nxp.com>
To: jailhouse-dev@googlegroups.com,
	jan.kiszka@siemens.com
Cc: peng.fan@nxp.com,
	Alice Guo <alice.guo@nxp.com>
Subject: [PATCH V2 2/4] inmates: gic-v3: solve incompatibility problems in gic_v3_init()
Date: Sun, 16 Aug 2020 03:09:47 +0800
Message-Id: <20200815190949.6837-2-alice.guo@nxp.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200815190949.6837-1-alice.guo@nxp.com>
References: <20200815190949.6837-1-alice.guo@nxp.com>
Content-Type: text/plain; charset="UTF-8"
X-ClientProxiedBy: AM0PR08CA0001.eurprd08.prod.outlook.com
 (2603:10a6:208:d2::14) To DB8PR04MB7065.eurprd04.prod.outlook.com
 (2603:10a6:10:127::9)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from nxf55104-OptiPlex-7060.ap.freescale.net (119.31.174.71) by AM0PR08CA0001.eurprd08.prod.outlook.com (2603:10a6:208:d2::14) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3283.15 via Frontend Transport; Fri, 14 Aug 2020 12:12:53 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [119.31.174.71]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 3269e0f1-c0b5-4729-686b-08d8404b603c
X-MS-TrafficTypeDiagnostic: DB7PR04MB4730:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DB7PR04MB47307866EF0C3F15176E105AE2400@DB7PR04MB4730.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: k4ZpadHU5mIERM5Vf8Isu5XJOq81DjKFesvgUmOS8uviYU7040n9EuBESe0ngf8GtUmfv78bvwZfI+y11RePeBYBMyPMlJHQLnliOXUZEnfHwymA1pLVifedQwRVcsPBNkpPbJR/qH5+4f83+OfYw9fZUdtEoJY9HZk1kJSvuGmtkhetcyaQ3JuT3JcWkDz02eh95bWCD3ScMhpOEzK77yx0mhWh1Pf/6ytsC8wWsuhMJM93mRLVHJH+Ndlwa3+VYuwwhlZ65pJ8aKxxT5lu9MFjG5VTeK+2wmpcsG6mGJ8StoK7moalzVg+05C+w+tWDWKqEO+n/i2EKjNRaSjrTw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR04MB7065.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(376002)(396003)(366004)(136003)(39860400002)(8936002)(6506007)(2906002)(6486002)(83380400001)(16526019)(26005)(186003)(66946007)(44832011)(6512007)(52116002)(8676002)(478600001)(1076003)(5660300002)(66556008)(36756003)(6666004)(4326008)(86362001)(316002)(2616005)(956004)(66476007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: nsuHVwvMKBz+nzjLzpodihX3je6G5BqmFOsyjMkzB0ul6etMFB6aXfKQu3OBvw8VQrODw+s5sAb7PI9UfESLkQKNWtX1Y8ya21mLBJ63hQKf2BksBhCRYOtYam320a0JJh0u50T9F6YPJBM8QUAxG8mDKm4SxAYzNAdJFKCL8i1BJQMkeCCfPQaCxfn/6sElSUf6ukvXlVlzJKtnp4j19ke3LmC3vOX/tqL6EuaSp1aK1Zu/mthZo5HHRy0hyf53SBShvxbryEcfN3iSa+/HK90EGaMBUto7SbtPm+xJhweSaZTzQALKRwdQQlnWbHr77nBqOrt1rjj531/DMbueQwFX8/wcqqPUGl481gHW7wDJYENxm0VRIPWOJXN2jqWV/LdYEr2vuTmthJ6xwNHOxOa+Rx1Zb2rWWo1+dIlvBfL1l0DSDQs625w+be9X3fZFjgvnj8kDd6fKJgTHzBanAJdJqkdgOrfvyPycM5JEYxr7KgJFEJh2+G491DQjYV+YzOtrxgSJ7/N8i1mOGP1LyVYQUXU8fZ1s8Kb7JzoLJMfWUPEvKgaYGe4ioWukVgbHlmbMaEXeXdYfWgA2CWoIFUnYkkDjcUSarkni2rxnzt+N/JZds3GZDXXyLy4JvHzDOvknB2bH+DgXGUBAWnizpg==
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3269e0f1-c0b5-4729-686b-08d8404b603c
X-MS-Exchange-CrossTenant-AuthSource: DB8PR04MB7065.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2020 12:12:55.8005
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LVjhaJvh7bnCS666c+/Z3ip33R/zAOsjjgZ25DLROrlAn3NVcBWhDPRGsJuoCEq8z4rYcNiFvWdJL6MByOgU9A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB4730
X-Original-Sender: alice.guo@nxp.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@nxp.com header.s=selector2 header.b=NR0465Nx;       arc=pass (i=1
 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass
 fromdomain=nxp.com);       spf=pass (google.com: domain of alice.guo@nxp.com
 designates 40.107.8.70 as permitted sender) smtp.mailfrom=alice.guo@nxp.com;
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

When the inmate cell is in AArch32 execution state, using mmio_read64()
to obtain the value of GICR_TYPER will cause error because mmio_read64()
generates "ldrd" instruction when compiling 32-bit gic_demo.bin, and
"ldrd" belongs to A64 assembly language which is cannot be used in
AArch32. So use mmio_read32() to read 64-bit GICR_ TYPER in twice.

In ARMv8-A, AArch64 state supports four levels of affinity. but AArch32
state can only support three levels of affinity. So use MPIDR_CPUID_MASK
to set bit[31:24] of mpidr to be 0, and ensure the correct mpidr.

Signed-off-by: Alice Guo <alice.guo@nxp.com>
---
 inmates/lib/arm-common/gic-v3.c         | 4 +++-
 inmates/lib/arm/include/asm/sysregs.h   | 2 ++
 inmates/lib/arm64/include/asm/sysregs.h | 2 ++
 3 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/inmates/lib/arm-common/gic-v3.c b/inmates/lib/arm-common/gic-v3.c
index 35ee9a6a..cd202a46 100644
--- a/inmates/lib/arm-common/gic-v3.c
+++ b/inmates/lib/arm-common/gic-v3.c
@@ -76,6 +76,7 @@ static int gic_v3_init(void)
 	map_range(redist_addr, PAGE_SIZE, MAP_UNCACHED);
 
 	arm_read_sysreg(MPIDR, mpidr);
+	mpidr &= MPIDR_CPUID_MASK;
 	aff = (MPIDR_AFFINITY_LEVEL(mpidr, 3) << 24 |
 		MPIDR_AFFINITY_LEVEL(mpidr, 2) << 16 |
 		MPIDR_AFFINITY_LEVEL(mpidr, 1) << 8 |
@@ -87,7 +88,8 @@ static int gic_v3_init(void)
 		if (GICR_PIDR2_ARCH(pidr) != 3)
 			break;
 
-		typer = mmio_read64(redist_addr + GICR_TYPER);
+		typer = mmio_read32(redist_addr + GICR_TYPER);
+		typer |= (u64)mmio_read32(redist_addr + GICR_TYPER + 4) << 32;
 		if ((typer >> 32) == aff) {
 			gicr = redist_addr;
 			break;
diff --git a/inmates/lib/arm/include/asm/sysregs.h b/inmates/lib/arm/include/asm/sysregs.h
index 72cabdc5..c0b137c7 100644
--- a/inmates/lib/arm/include/asm/sysregs.h
+++ b/inmates/lib/arm/include/asm/sysregs.h
@@ -77,6 +77,8 @@
 
 #define MPIDR		SYSREG_32(0, c0, c0, 5)
 
+#define  MPIDR_CPUID_MASK	0x00ffffff
+
 #define MPIDR_LEVEL_BITS		8
 #define MPIDR_LEVEL_MASK		((1 << MPIDR_LEVEL_BITS) - 1)
 #define MPIDR_LEVEL_SHIFT(level)	(MPIDR_LEVEL_BITS * (level))
diff --git a/inmates/lib/arm64/include/asm/sysregs.h b/inmates/lib/arm64/include/asm/sysregs.h
index 8065b89d..6d94a59f 100644
--- a/inmates/lib/arm64/include/asm/sysregs.h
+++ b/inmates/lib/arm64/include/asm/sysregs.h
@@ -75,6 +75,8 @@
 
 #define MPIDR	MPIDR_EL1
 
+#define MPIDR_CPUID_MASK	0xff00ffffffUL
+
 #define MPIDR_LEVEL_BITS_SHIFT	3
 #define MPIDR_LEVEL_BITS	(1 << MPIDR_LEVEL_BITS_SHIFT)
 #define MPIDR_LEVEL_MASK	((1 << MPIDR_LEVEL_BITS) - 1)
-- 
2.17.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20200815190949.6837-2-alice.guo%40nxp.com.
