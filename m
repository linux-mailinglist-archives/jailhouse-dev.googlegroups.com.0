Return-Path: <jailhouse-dev+bncBDAMFR7JZAEBBAVD433QKGQEBG36KSQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x53c.google.com (mail-ed1-x53c.google.com [IPv6:2a00:1450:4864:20::53c])
	by mail.lfdr.de (Postfix) with ESMTPS id 8778D20CCE0
	for <lists+jailhouse-dev@lfdr.de>; Mon, 29 Jun 2020 09:00:19 +0200 (CEST)
Received: by mail-ed1-x53c.google.com with SMTP id v7sf13675087ede.15
        for <lists+jailhouse-dev@lfdr.de>; Mon, 29 Jun 2020 00:00:19 -0700 (PDT)
ARC-Seal: i=3; a=rsa-sha256; t=1593414019; cv=pass;
        d=google.com; s=arc-20160816;
        b=Cqaf3aqBmiyVy0z2IxamDhZ6mEJ6/R2rkB/3I7b4bNEqCx77b3M+Av9AtQPfLzJOp2
         I1/56xZBGmZsGP3iZyQ3Mvd0yO+rFILoxVnCnlgJuxNU9o4bJnUnlXfSQBOJ1/XLzVZX
         FEANoMpMUbYn7nCGSlxWHKO++XxZuWBQiz/HAOKzej5CmxsY3Ov82EcZsCoTi2UeDKNZ
         vCrb7PQTzFSgg15n84kpQONLNYvl8ar/BYwROZUoglRHHyTRT+ooVCnP5Kbl0CnZwA9P
         36vgv4uWWDChLvKvV9yb+r8RBEJWkmc7vu+timrpdsCABE9QLrJJkha4/cj8Y+9C9LnA
         Frrw==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:message-id:date
         :subject:cc:to:from:sender:dkim-signature;
        bh=9wHO8KK/ntEuSNLzDQ6IKC6FQKE8NMK1RnYmqg5FAjc=;
        b=qBxani4M0o0hA3b5xOGsv69dqpsQy8A2bLZfdbenvK1GzfEMn9NxzfMBUUY4/AloIN
         WAGybAMrAc752xzP/taLBsYboKD/j9Qs1bc6Lotpg3td3aBuoA1d2AlzcWUb0oDKdh1U
         Tp3hii1ntM2xbV0rbjdIje0VEFfoGLo9cqxSTjDheZU6kkdUDEzI/lyB0gub00aCt/bk
         sP0GQVJNGVhAaMtefTLBUdEzR91x6QnqyjrcjC93FeoxVz2REvkCjg6qLbyHCorUZ/u5
         ozh+lQamtfwtvm4oQv+uCEDyS/Ga2YpXATMck22g5DJOJK/sHOy962Ez2R+/q2yt2DSE
         hVUQ==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=Plx0VQ69;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of peng.fan@nxp.com designates 40.107.2.65 as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=9wHO8KK/ntEuSNLzDQ6IKC6FQKE8NMK1RnYmqg5FAjc=;
        b=XuFBp5iJX7/5QQghXtnpP0DcG4Zw5A0nbVwxx8t9TXlQ5V0Dh7wUF2NA70BS/k5Sxs
         hcKnk51oWv4EZ7KeU3ODNdlYYF9InLW3XUixOlARq4NB2VR7UEKwLFRB1PS9llPaTxGD
         E5j1uhxgAJOzYKotsrU2OWIy9sS42gn8rXHNBWTHhs+XYuNDH84FtYXqfgHfnNnvbIkg
         +ka5uxkz4RWjOL30VOuqIh7ikKSoZmdDCE+5+n7XjWc+/mzSr/rZQFWUVp2TPxPv3rzR
         EkHif6gJBzqFhC7hIXj52w66VozaKtljy+afxa8/igVEvgJfly14sp7bqTdYwr4wiaKe
         SkeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=9wHO8KK/ntEuSNLzDQ6IKC6FQKE8NMK1RnYmqg5FAjc=;
        b=OcqnWTeR0vlMuE/bQd14vcQ7LwC08aHDVGGQYki1KTsy7nAXB+voKpNYDJnQTpKYrX
         50yCWszcgfTgbYKdbhswAxME8R/iOnzBFtTkPGq5wkHEq8a1hcdgu0sG4JlUAgng3O+b
         QB8PccF8Z3wlvtSOXKpKMX0Aciwg4WGgWWRrBZgj/5x801TL3DJjN/TdrzBOXgIC823G
         /LS/u9Yuc4fBcp9RvF+ATowwTfEpMpEkag8n9eQHmLtlp0abHJyYCJxcXy7mi1M0QUFK
         qs8dxZsTq4eno9kEbo7/0WzgjI6JXERv5VY8DzNv0kdUSoqk2RRI7JG5w5bHFXcF0bXt
         g/Ig==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM5312dP+hUd0U25BukpRllVbceAn2BSEbke89JlJzp9SJAnpVaMsf
	wp63aF0TrpSrUcxaUaQ6BeA=
X-Google-Smtp-Source: ABdhPJxerbLLyG1QahkR0g/QiyKCAn+Eq7I+upJs/KWXnZw0exjJNc8WgKhv7fKI0wiRaZBO2UcYPA==
X-Received: by 2002:a17:906:6847:: with SMTP id a7mr12379402ejs.306.1593414019080;
        Mon, 29 Jun 2020 00:00:19 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:906:2cd2:: with SMTP id r18ls4353587ejr.9.gmail; Mon, 29
 Jun 2020 00:00:18 -0700 (PDT)
X-Received: by 2002:a17:906:4989:: with SMTP id p9mr13222081eju.417.1593414018328;
        Mon, 29 Jun 2020 00:00:18 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1593414018; cv=pass;
        d=google.com; s=arc-20160816;
        b=VDQBPkH+130WFFpEHbTt5Tz2NLT8q/1VeTFqhToaQedV6t9AiTTeN3xgqy2gBQno2p
         zXxHI4YbwjBohmwC8GuJdEzERrc2dnvjQ40c5ZqnE45RAyPK+rzjHkYU6J/R8MHRM7ul
         0GGtwrtUn5v3y6nRagPMwDi3/RJDVb8fDMCt1C+cVzCA/UIyyo/RhHQbcQpfCWiFlmzT
         hrvWUsLbzUhtYitFoIMCtnj9KGhObvnVMVakm4sXN8Rx3PlC/K0FJTldTokRBQMQQLGB
         UjJxaL7GBsJFfJtzMrR7dllqOwaobZ7pBNELg8ZD+vCsiCVqI9N5W2006wzwQkvtDLSi
         1Myw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=SnD15oG/wQLFmlSxOc+MXtBT3xVJnilV+5SZaaGoJM4=;
        b=SdFjSXGWG7L3SI/4tHyoqnSCGmb/clw2zTk8q1JsaiY8TI7ip0+bMc9EWHWYQoO8U7
         3fjQFQTFAwgXhzIXauLV8fcc8ZBHr2y1ZM0IWztyx4alfObh4KIW57qfV7YzFsEFmLJg
         IEIef2GPsYauXE/7Sgj2QVxX5LLVGP6V2FxV6uyL8wfn3fFWsRlu4k7q+2tM5YOpMWd4
         Cvc8Ld0CB2GW53UEiknx1NVlSHs+IP07qDen23/ZI86fKkUgnQ7qdnznwk2OPqk4HQG/
         ZyNhoSrah34lnFn8zTGnXt/tn069b/5haeTuaU+xcqq/XWm6vgWFJK8166ktWuOfOUHe
         OuZQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=Plx0VQ69;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of peng.fan@nxp.com designates 40.107.2.65 as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
Received: from EUR02-VE1-obe.outbound.protection.outlook.com (mail-eopbgr20065.outbound.protection.outlook.com. [40.107.2.65])
        by gmr-mx.google.com with ESMTPS id a23si1936487edn.0.2020.06.29.00.00.18
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 29 Jun 2020 00:00:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of peng.fan@nxp.com designates 40.107.2.65 as permitted sender) client-ip=40.107.2.65;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YQWeTNnupnQ258Ay8k2BIajLTQU8SsewpGQs8dwfWLJQQSm9zE4Qhi9yEtmMf5+0ZPJD8RxHzv3SrZQ/c3+YejY/LsPpl+i5v3VUc+LqXxazPbNuhnt4qus69VzVy7ZdCG8hh61ynWGR5KRS8giQb1Gzy6kqZ1i7bYT3Val3tUgQSQ44c7OeMwPiSMK1uZ6Es4rAxFAKvkiiUDfxS2ahYdNPdJNjBokCFS8948nBGKed0rm85XwFJQL07mDicXY6NTJl6oh0e777lG8wVX/l7CTRU5gnkY9+aTv2Bbi59xWIjuItuScUs2uqEnnTMmnbOSWcgzgcAzk96UBKskKCwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SnD15oG/wQLFmlSxOc+MXtBT3xVJnilV+5SZaaGoJM4=;
 b=Y7LtRipUWueycP9dgjP4FXrfNmTJ4A31zJDpIy4pXInp9fs9SAQ6KlnXmpbys5fFJYAfLDEc27OtU8Zr7nHBjBGqy4KZxEDpUtSd3+Z0kCu73OpvVP2/yNEu94Gu/DHlwjVS5Np1XQSMpyGom5IBNp3LIkKF1/zoOo0gUBV1cUqVxcMFUPW0xsNfZRe0ABUln2/pRDhKlb4kGWIxTfFT+YETbq3JlIP8ZhElGQzI8mQst+RlXaA5sSTJRu4BEJajb9bVaCSovQSYfWwIKaeHQK+c/XT+ziQZmotBtfr9lwDXekfmW35zV0WXeB4EEo6VitWC1i07nR4RVl5906CxOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com (2603:10a6:4:a1::14)
 by DB7PR04MB4090.eurprd04.prod.outlook.com (2603:10a6:5:28::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3131.25; Mon, 29 Jun
 2020 07:00:17 +0000
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::2d36:b569:17c:7701]) by DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::2d36:b569:17c:7701%4]) with mapi id 15.20.3131.026; Mon, 29 Jun 2020
 07:00:17 +0000
From: peng.fan@nxp.com
To: jailhouse-dev@googlegroups.com
Cc: alice.guo@nxp.com,
	Peng Fan <peng.fan@nxp.com>
Subject: [PATCH] README: drop the warning
Date: Mon, 29 Jun 2020 15:24:39 +0800
Message-Id: <20200629072439.29835-1-peng.fan@nxp.com>
X-Mailer: git-send-email 2.16.4
Content-Type: text/plain; charset="UTF-8"
X-ClientProxiedBy: SG2PR0401CA0011.apcprd04.prod.outlook.com
 (2603:1096:3:1::21) To DB6PR0402MB2760.eurprd04.prod.outlook.com
 (2603:10a6:4:a1::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from linux-1xn6.ap.freescale.net (119.31.174.71) by SG2PR0401CA0011.apcprd04.prod.outlook.com (2603:1096:3:1::21) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3131.21 via Frontend Transport; Mon, 29 Jun 2020 07:00:15 +0000
X-Mailer: git-send-email 2.16.4
X-Originating-IP: [119.31.174.71]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: cb611fba-79ff-4a48-8e90-08d81bfa1432
X-MS-TrafficTypeDiagnostic: DB7PR04MB4090:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DB7PR04MB40908C739CDFCD138D2DE3B1886E0@DB7PR04MB4090.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-Forefront-PRVS: 044968D9E1
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 64WYBRm6xjbfCJzCGUMDhsU/xSg8J8425cVAcTxWpL7kwpMLhFjkeLqjaYEFcDr7OeXnJFc6gu8UiIZvr+TzkKF0faS8U3vrMudrAQURlZPUfrHQHLL0XyfNWdu7DCsa5M/Y0x7jWagvGdxfHGxT6VmkoKCKbjVOQ0+6zsDvyCkPekgkq4nW60hz/7qSq8YuUXQsebTgMTAs/XRnHdWIkOQXCyj0KwV4WgWzjv3MllvjpIyUJG+HMHluJ3tWZp2xIL9lYJfB4XiW4TsMyc9xCOJqR2ld/jhZfUvj4i1ABlOeZqQl2JvXQQauDWMhIGQlfCBinXxDandLQf0kJY1WXw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0402MB2760.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(136003)(396003)(366004)(376002)(346002)(39860400002)(52116002)(36756003)(83380400001)(2616005)(956004)(1076003)(6512007)(9686003)(8676002)(2906002)(6486002)(66946007)(86362001)(66476007)(66556008)(4326008)(6666004)(316002)(26005)(5660300002)(6506007)(6916009)(8936002)(4744005)(186003)(478600001)(16526019);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: iaYEDDp+OE/f/poJdtkspSaNCkC5Rw+X21eBXLrRGfzIXEXAFtB44IlHG0B1VCuX3X0dBvDahSb3B5U5hD+eCzg4xgNWCT0RvKlFt4+3dgxn13ESspsqMLbWBhPjXe3WAfvu2bTPoZv/Ankc00B1juMhr3RR40Tw01VNFeuzjtZ4ztv2/XlZBUF8zVPo/lJbK84T1diYtAFQ7PASZgCi7yrWkK4gc3MRSUdRA0wIYBtCNsfQo70x75phbozTv/rdaKCy/9sqQO5ctyAkNuGtloc1g7QbaVHGmCCL1mb9p4wo1pWSzxeWRqUg7S3gRu53k1XveJLj1lOa9ekT/gu3DfahnaKFojaDRqzvI/sfAIdVUi0uZU04NTthq+skl+XGp3tAYZ4c/+aosWMTh/mEEFgxLT76dSnl+bQvX3YuTPGXqXeXa8BdTP0MV1PxhBzi5vW8qyvxeWHNCTfbPzArWGB3W259rekJ25xdPYiaFPjmO5+jS4Ptyu3vQ66oxGGp
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cb611fba-79ff-4a48-8e90-08d81bfa1432
X-MS-Exchange-CrossTenant-AuthSource: DB6PR0402MB2760.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2020 07:00:17.2604
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bjiNvDa0dqV35VegTxkkmeOxoV6EWtSLe0J9jOwdt0iJoaXPH6KFWVF//GgqzFNVbuFFcejTYxy6INXaP0pzGg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB4090
X-Original-Sender: peng.fan@nxp.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@nxp.com header.s=selector2 header.b=Plx0VQ69;       arc=pass (i=1
 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass
 fromdomain=nxp.com);       spf=pass (google.com: domain of peng.fan@nxp.com
 designates 40.107.2.65 as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
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

Jailhouse has been chosen by Semiconductor Companies(TI, NXP)
in regular software releases. And it has also been deployed
in real products.

So let's mark jailhouse product ready,  drop the warning that
make people scared to use Jailhouse Hypervisor.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 README.md | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/README.md b/README.md
index 2413aba2..c95e8e07 100644
--- a/README.md
+++ b/README.md
@@ -23,10 +23,6 @@ Its management interface is based on Linux infrastructure. So you boot Linux
 first, then you enable Jailhouse and finally you split off parts of the
 system's resources and assign them to additional cells.
 
-**WARNING**: This is work in progress! Don't expect things to be complete in any
-dimension. Use at your own risk. And keep the reset button in reach.
-
-
 Community Resources
 -------------------
 
-- 
2.16.4

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20200629072439.29835-1-peng.fan%40nxp.com.
