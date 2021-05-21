Return-Path: <jailhouse-dev+bncBC44VTVY2UERBC6STWCQMGQEATCLTWA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x138.google.com (mail-lf1-x138.google.com [IPv6:2a00:1450:4864:20::138])
	by mail.lfdr.de (Postfix) with ESMTPS id DE9A538C130
	for <lists+jailhouse-dev@lfdr.de>; Fri, 21 May 2021 10:02:19 +0200 (CEST)
Received: by mail-lf1-x138.google.com with SMTP id q7-20020a196e470000b029022ff5d290c5sf4666598lfk.13
        for <lists+jailhouse-dev@lfdr.de>; Fri, 21 May 2021 01:02:19 -0700 (PDT)
ARC-Seal: i=3; a=rsa-sha256; t=1621584139; cv=pass;
        d=google.com; s=arc-20160816;
        b=UpuHMPmEnh9vrbwiQ5gowcaHyDrP9llNtKMm4KzOy/IDzfn8WK/hxQrWpJOzJgTt/C
         h5K5JRLPDHbSU6uqhVMkIkKNiNWyh2oPOdqwRnWj97EEKr7j1SQskEL3OoX2ldb2mc+B
         6LIII5Zbr5HlBejnhZ0IbMtZ/LVfS2DP+gc5jGV5z3a4FOIKn3hrqsaA3qyaTCzf71tC
         CsuKXeR7HBxPIevDZPP9HjiordePN9Cje6pHGKS+JyOwYanno/fD7n2tSVxFrJall7k+
         LjZmdQzO7nCJnRbf54EsMPgkjEDmmrdWiXfRYu4otYiYvy6j3NaKBAMNeEpK5ELmhPTw
         lKww==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:message-id:date
         :subject:cc:to:from:sender:dkim-signature;
        bh=/l94OhWrd4Xgg8J16fa9tA0plb57ouKZtZA6sjt+Ai4=;
        b=ci7vlBk/s1dkbPHnaw0UAaEGGpVFpobtKh9HsAcVF9OossKJlV1R28my79iteLpuQf
         zlYkKTVB24ld/ysJFwjQ+Qvvpi9uJMsCv4MIA65RSmBZSrx8eumiIPzzrJ093pql6oYs
         qCIjwPheaWqXHq31ymvs+MyomvqkU5pDxsaTDAVi8HM2r83p4FuqXH20yB/HtDkO6Bot
         6RNyQB6K+NqDvGdBQscEDbAzrAdFQHaGvIurbXjZtZ9O93Eo1w13xKsf0uROAbVMJHkc
         nLR5OGOpNjnz1Qw08SThCTqrVQy9vQm7Wr8Sfvu79UegK+jIXFlbNY/icMh+yXbxR/6S
         NoWQ==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@siemens.onmicrosoft.com header.s=selector1-siemens-onmicrosoft-com header.b=H0c7cCQZ;
       arc=pass (i=1 spf=pass spfdomain=siemens.com dkim=pass dkdomain=siemens.com dmarc=pass fromdomain=siemens.com);
       spf=pass (google.com: domain of florian.bezdeka@siemens.com designates 40.107.21.49 as permitted sender) smtp.mailfrom=florian.bezdeka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=/l94OhWrd4Xgg8J16fa9tA0plb57ouKZtZA6sjt+Ai4=;
        b=naW01jqjbWTMnahJcuKWCoGuZvDeapCtJuDzqYBV003nL0zzhXCu4YgGEsQEjQOogI
         0mCwffcCbj/oMB/q1pMonMiJw757pNUYXF2qNPFwWdfxVSliwKoKUFZoJLVyYiIfmMZ8
         1ZU8Go3D9FURzx+irD/L9Z6vKxXww1E5MG7obB47EAGg6CGZTJ1Ms6+QpoY38iKaw4FJ
         6G21CXZJ4fewruaR2qt7wOc70j0fDr7tCdSMZ6bEUmzImQe8SJuZHRaudjzAFWp0rEOX
         CU5+YDeUQJZdN+qf8TaNns+uFqAo6gWmK124MbC2FJNYvlUD8r1wtfvh/Xq6Sooiu9Ip
         02iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=/l94OhWrd4Xgg8J16fa9tA0plb57ouKZtZA6sjt+Ai4=;
        b=cIMtk5Yhr2xlVVYH2v7PA4uT4IMaMJhCd3I4wKfvzahbvLdz91ABa6DzGU/D8tXaNh
         tRxsVcoEmApb80rPaOMplpKb7d+KrcGen1lChCAoDRGvsgKm0hMh/s6VUk1YqcYfSRBk
         vv3jh+H+8cY+nYEwv9J/dbSjfj0Qn7FoyBKz2ZkVq+Se5G5Ao2KVEHJnYfBODD45ODrC
         6yC5+PploWw+F5CTd23Ogxigrroq6NVuAvxIfek+rrA1tckmb4CaxIQEU70q1vrpyslN
         dmHK0VoG7uuhIVW7i25OJzFmx07HugYNgqTDJMfUb13e0M24+ZlD+H1JWUXzTrkPcUOA
         g6DQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533AqQaO3kztyK5jOMUECI8gM4RHoxz7CtcttaoI3BSWB7aoa8N7
	p0/OeY3DXSuCtpv4KaoHhEQ=
X-Google-Smtp-Source: ABdhPJwdaq9IraL/N0WKexu9HX3r7YiUj8eTGGGFZR+TMHwB4w7KhvAcB12mhIWZ4T7S+5V5QWpWfw==
X-Received: by 2002:a05:6512:798:: with SMTP id x24mr1336741lfr.575.1621584139417;
        Fri, 21 May 2021 01:02:19 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:bf0f:: with SMTP id c15ls1049890ljr.9.gmail; Fri, 21 May
 2021 01:02:18 -0700 (PDT)
X-Received: by 2002:a2e:b61b:: with SMTP id r27mr5971356ljn.327.1621584138312;
        Fri, 21 May 2021 01:02:18 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1621584138; cv=pass;
        d=google.com; s=arc-20160816;
        b=SyIXIf+4WV6fi0hT6xzVOhR5TnQ7dzJDGo65hKocMxoBVafSMfghlbb7sws/QqP5+C
         jqFtprkNdQ0tarYnxMK4ha6wKxzizbMmUXUf7xw8loI7bsZffGTF3aTE13CNFoyuNTgV
         sAxFLF9GzJTmWYVnbFvCAHer09Iond+2u5ojhSs4oWoKPo+KTlxBmG46o8Rc/I6AUavP
         O8IXMMmdgCKgHlGsb+S3aCIi2QmqWJP17Kl68jQU+5L4732mowYz06C1yE0eOxGduvvD
         3Na1D0Tz15EwoqGNmta9Z8F2atwPPaP1q3e/Kj0KrfZRZqx+/jzUd/+5Z6RhhkGw47qV
         Kjeg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:message-id:date:subject:cc
         :to:from:dkim-signature;
        bh=DUh2GBm5Txx3GMTEJPwmAd3rGOOw2eUdoolJmbcv9jw=;
        b=qpAY4l7YMK5l10uBQsRZMSm8gxYS3Zd0htBx5+dBok1uUubmPR2k0l2ic6L7+jcFbS
         igjlUEumz5jEQh+M3l3+TN68zGVQsV7g2vhw6p1HMb9R+krxsTcZbYBxxmCqacOx6J0s
         280UEfQybO4Ymru3JV8s2fd6QQOVAvTDe8OGEDpmGONSOIY8z1O0A1YeM1HVx2mUOZrX
         g5hmH7/OUp2NS7DDw3OWuSAA93ccEygEaAsU5MNbdwAi5pi4eEirDdalvyM8CgzPynhW
         2WPDhvtZmzW56r/NyPUsSdeQG13SQmqKxpsGWoDl1zzWwDi2UJxQuABEG8m4MI/lNF12
         FZwQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@siemens.onmicrosoft.com header.s=selector1-siemens-onmicrosoft-com header.b=H0c7cCQZ;
       arc=pass (i=1 spf=pass spfdomain=siemens.com dkim=pass dkdomain=siemens.com dmarc=pass fromdomain=siemens.com);
       spf=pass (google.com: domain of florian.bezdeka@siemens.com designates 40.107.21.49 as permitted sender) smtp.mailfrom=florian.bezdeka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2049.outbound.protection.outlook.com. [40.107.21.49])
        by gmr-mx.google.com with ESMTPS id a1si221078ljb.5.2021.05.21.01.02.18
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 21 May 2021 01:02:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of florian.bezdeka@siemens.com designates 40.107.21.49 as permitted sender) client-ip=40.107.21.49;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JkGiw9Pkq3P/NC6/YxdzToDPaUu87od2Vmi05tUDT/br7bcMlkjaQhg7adm7fZUpFobhCkzK75JwdIK4aAo/EI2qBYF+Kr0022PfoXtjtZwh/bIDUqw24c9u99PZsZ0wpRUckM746OXpxg/wQ4kjLVWjvRUlZAO6UX48yUriQbsA/ZZp1QVGcuuxIWyUc6ZyVwsa0q1En3vO6mtpJCSxEXLUmaLcGhmcQ70EdJtjWu7yUJHWclEbVWppZEfzquaploIaFVu1qsoAiRW64BLOn9XE+sGqN+D+/6BydIjJf2Sue3sQ0KmAksHOULxVMFAsMCTCTCz6p1U12RCdanqylA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DUh2GBm5Txx3GMTEJPwmAd3rGOOw2eUdoolJmbcv9jw=;
 b=LY66V1s+itnKw/DH2jR4lXqQ0US4CyDhKrLNqpQgoEH2FvBJ1Zo+cjxqkaQguVW+9C3hxwlLjgFwP7RAYfHm2hatmmDi9hZ5Fe9FoTR4wOjcU21GYHK8rw+WtLFMCCDrp1ecs1J27BMk8lqbKHHNksa+JtWfqjh3WCgBPve37kIInsjXU2WN3oJTMuMW9PQpy7YWt8at5yXMrQpnSWdFHVWjlTseyXORx3Z0BBxqSyotSeC399TmUBmmNL/n9EzuM3Ts0rE073hUl1O1IPcnuYzrG3C/bsLGrG1Tk59FV/R+jFN+CeQ8z0LgCllMz3QySoIYZ5PGcLO+3PXbsm+FSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
Received: from AM0PR10MB1906.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:49::10)
 by AM0PR10MB2418.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:dd::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.25; Fri, 21 May
 2021 08:02:17 +0000
Received: from AM0PR10MB1906.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::bda0:21a9:36c7:c9f6]) by AM0PR10MB1906.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::bda0:21a9:36c7:c9f6%7]) with mapi id 15.20.4129.035; Fri, 21 May 2021
 08:02:17 +0000
From: Florian Bezdeka <florian.bezdeka@siemens.com>
To: jailhouse-dev@googlegroups.com
Cc: jan.kiszka@siemens.com,
	henning.schild@siemens.com,
	Florian Bezdeka <florian.bezdeka@siemens.com>
Subject: [PATCH 0/4] Support building and running on Debian 11
Date: Fri, 21 May 2021 10:02:07 +0200
Message-Id: <20210521080211.487380-1-florian.bezdeka@siemens.com>
X-Mailer: git-send-email 2.31.1
Content-Type: text/plain; charset="UTF-8"
X-Originating-IP: [2a02:810d:82c0:38fc:e180:2248:7590:2b4d]
X-ClientProxiedBy: VI1P195CA0056.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:802:5a::45) To AM0PR10MB1906.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:49::10)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost (2a02:810d:82c0:38fc:e180:2248:7590:2b4d) by VI1P195CA0056.EURP195.PROD.OUTLOOK.COM (2603:10a6:802:5a::45) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.33 via Frontend Transport; Fri, 21 May 2021 08:02:16 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 29451042-91ed-4e69-f60e-08d91c2ec03a
X-MS-TrafficTypeDiagnostic: AM0PR10MB2418:
X-LD-Processed: 38ae3bcd-9579-4fd4-adda-b42e1495d55a,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM0PR10MB241873BE8B73F2C6D9F29080F6299@AM0PR10MB2418.EURPRD10.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: J5xfOwfnk1QuUyWXKswgyYm4h91ox4YriHTGAgO63zWdYZbScAEjrVWooRsmRoESTzQSMOvtGiabHKg84OATO7czAtKlVLKme9B2jQY5HOqQSLwb1W0QdLLUrhqoaBWsM9GWkqlAidoZBZdIvR2i5Oo2iHkomUjesxDhPtTPr3mlwlm1g8UJ/mClDlQPb/h+ELv6qcX2/NulFlQvwjp06zU60TEMOaU9geAVSEgbYOJYyZNhHw1KuVTEEJHllm1B3M/JXQa98CrQgKOhLQudYg0KwvM+Tc2RnkvJY0U81Z1cq0Hp7K1hV6cDakKAvTGBPu9PMRtDwKaFqxrpa+Wc0JhE/7/cpuInjmoC4IBX9mTKfG4xqo6RwceEVkPq9sn4SvN9Nuv+UWHbmdl7WQGalvC+bfNWQ+W+HO+xVRhauzPEPriqBuFAAyMB2FRLH2mhJLRb9iZSg4rtTGAu+exq10Z1H3iIh38qsV5LWgEoTpMCnCTL8C0oYa7evuvtRjKNprVk95tA6bjseojSu4Kj2HZ5p7naQ6DUBwRGr66rh2+Upbsav6hBYI4viNJinc1Pc6GAj71Ed7MwjwVtm9AQPJi9/UnFKb/n9W2Jq6aBUg0=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR10MB1906.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(136003)(346002)(376002)(396003)(366004)(1076003)(44832011)(66476007)(66946007)(4743002)(6916009)(5660300002)(8936002)(6496006)(107886003)(16526019)(6666004)(2616005)(316002)(478600001)(2906002)(66556008)(186003)(4744005)(8676002)(4326008)(86362001)(38100700002)(36756003)(6486002)(83380400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?ldsPDRgZf/6f6wkWOCr/Zdfmq95OCrOBKGp4JToqwlATbvZwEe/B67qGTas1?=
 =?us-ascii?Q?dVy/S6mTWOeDIcAJ+/VlFG9aimqRk1YvgafUcSz6TjlHPyFcRqCv+nnnv4dL?=
 =?us-ascii?Q?gchgUPbFnPwi4shKsYu8R5Hfcv/TFE4FECYJmL6MXUAmh7kqe2CBWLp8YstL?=
 =?us-ascii?Q?VVlbUeGwhTtCB4GUziJKICFUsakBkcAA8pcdaSsmuX8OhiuVj3u/BYJ39iz6?=
 =?us-ascii?Q?UPzPS0n+GXf/ns+LyKzy3KS4mfxjBPPuwG1JF4v2AgbPWbkk/i9vUS1bp6z1?=
 =?us-ascii?Q?cM80PKrEQjc/MzOuE9/hWhSl2semDitxJCzd3Yx0GCocv5bC+J431XESIIAH?=
 =?us-ascii?Q?TDw4GhTrPHbDDqetJpA1VCoG+IDxEP7GRHkrojp7qZecwKT7JDleVHEC+qNW?=
 =?us-ascii?Q?fxSzSkBLFIHNI2wXzcJa4izfN6WAl/mzemkOVuoKoyaBItn7d11MgSKiiSoz?=
 =?us-ascii?Q?olOEynAxqqvfmtmzQuEX3q0XPIb26IBBFFolFeCUFutwkI1CeFs1Xt2lxHt2?=
 =?us-ascii?Q?Dz+Aj7vJLldxYPBuUSxfPv5Rjn/i+u8ejVlK/1rFTQhvpMVk3REwLVeFzAEa?=
 =?us-ascii?Q?n/LxFQK5bW3leISrPbHtkrfPikFX3M1xYQLiPBLOODsT8hfky0ovEa7XzUD0?=
 =?us-ascii?Q?uVWjFSe/4FxTvrbusRdJaP6SSs7DXiExkMA53+5MhFG+Ft8Qx9cI/kMAwmUC?=
 =?us-ascii?Q?gQ074RbTbSStgRJjko4O2KBOej/R0zG1yCDu/j/h6Ne6oVZs5wLbpSzhs714?=
 =?us-ascii?Q?jftiL+3YWd/3wAXvPKqIDS2dp/yHgJXDw2n6Nw+bM0U+fA8OvzIHJpS3yaEj?=
 =?us-ascii?Q?P4cnQQaPst0LxtA1Z1dEv0VIaeicZQ5LgREqbUz45Q5aFYBjJE7A9nQZ9LWb?=
 =?us-ascii?Q?ZxCZsoe6TS9VjBjd/Dcf6uktDzRIRdtcetx863W9rCJmiX6xTj4e6xVLYuQX?=
 =?us-ascii?Q?cX4N4ZALShZEqdCBZ9VCJjQT2M1Ml5CaVxcZ/b9pSD1Qn543z46E1PGzbM2J?=
 =?us-ascii?Q?CL5j0NtFZt3bIutjqxrM+duAB+s/jbeFDX0COtHlx4j38DEbwfYG1luG85p+?=
 =?us-ascii?Q?jvva2TrQDO/Xh6nSgmJM335kcwCL3RgpWgR0zbeDqTfGTTLs3b88rZqj4265?=
 =?us-ascii?Q?qdoGx/GzS9ko2139pWuRf+YXaHIvJj7/O9Civ/rHzR8wtp60YlamoyFwzjJg?=
 =?us-ascii?Q?sKQ21KhxhhJuqe7j6yMohJgSg4UVCVieMD2rXsBNa6nrG0WIniCxLuihvDgE?=
 =?us-ascii?Q?1sDXMR1YsD6/wRH6muq5j9klwpVprBVakUuBYbG1g6rHa5Ne9ERN44piym4Z?=
 =?us-ascii?Q?bkRfpqs1fK6/tixv1h9dWhLaipC7GGm0Bwfk04pfD5kGEZumWcF5lqqPWfpr?=
 =?us-ascii?Q?P1ucg09SFi+5J2+186emP5hDIsyk?=
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 29451042-91ed-4e69-f60e-08d91c2ec03a
X-MS-Exchange-CrossTenant-AuthSource: AM0PR10MB1906.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2021 08:02:17.0107
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VPa3mJooMKVx9932MoNR7FPlxM9c786B8a2o18o8k48aS+PyEKvpQh8hoif2Jv0HM2/M1VqUJptSODISZS2IcvSCm3o+5yck54Fw5bSCKys=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR10MB2418
X-Original-Sender: florian.bezdeka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@siemens.onmicrosoft.com header.s=selector1-siemens-onmicrosoft-com
 header.b=H0c7cCQZ;       arc=pass (i=1 spf=pass spfdomain=siemens.com
 dkim=pass dkdomain=siemens.com dmarc=pass fromdomain=siemens.com);
       spf=pass (google.com: domain of florian.bezdeka@siemens.com designates
 40.107.21.49 as permitted sender) smtp.mailfrom=florian.bezdeka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
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

Hi!

This are the necessary changes for building and running Jailhouse on a
Debian 11 system. As Debian 11 will no longer support Python 2, most of
the changes are related to the Python2 -> Python3 migration.

Testing was done on x86 only so far.

Most of the problems where found while trying to update jailhouse-images
to Debian 11 as well. jailhouse-images patches will follow soon.

Best regards,
Florian

Florian Bezdeka (4):
  Makefile: Update build dependency from python to python3
  tools: Update shebang from python to python3
  tools: jailhouse-hardware-check: Remove python2 specific dummy
  doc: Migrate setup instructions from python2 to pyhton3

 Documentation/setup-on-banana-pi-arm-board.md | 2 +-
 scripts/include.mk                            | 4 ++--
 tools/Makefile                                | 2 +-
 tools/jailhouse-cell-linux                    | 2 +-
 tools/jailhouse-cell-stats                    | 2 +-
 tools/jailhouse-config-check                  | 2 +-
 tools/jailhouse-config-create                 | 2 +-
 tools/jailhouse-hardware-check                | 6 +-----
 8 files changed, 9 insertions(+), 13 deletions(-)

-- 
2.31.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20210521080211.487380-1-florian.bezdeka%40siemens.com.
