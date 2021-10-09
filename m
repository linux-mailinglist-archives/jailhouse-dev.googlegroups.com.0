Return-Path: <jailhouse-dev+bncBAABBEGZQOFQMGQEXAJ2YTY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-oo1-xc3b.google.com (mail-oo1-xc3b.google.com [IPv6:2607:f8b0:4864:20::c3b])
	by mail.lfdr.de (Postfix) with ESMTPS id CB02A427557
	for <lists+jailhouse-dev@lfdr.de>; Sat,  9 Oct 2021 03:12:49 +0200 (CEST)
Received: by mail-oo1-xc3b.google.com with SMTP id k1-20020a4a8501000000b0029ac7b9dc82sf6368602ooh.17
        for <lists+jailhouse-dev@lfdr.de>; Fri, 08 Oct 2021 18:12:49 -0700 (PDT)
ARC-Seal: i=3; a=rsa-sha256; t=1633741968; cv=pass;
        d=google.com; s=arc-20160816;
        b=SExQgBGl8grLpOHF5qFknUiwHYLgg4cnkxtt5RdwmjrDOJAd2i/RTm2SVNSm12sfQB
         UyGZB8QqGOcvC6Mq35AVjD08PeT1xAMaG+fo6xhVrjr8GqkoJZV3TFiIEMJGZ8PNeQpj
         I2hQkJK8hgHejFj5T9/ON9ZHzfqMGCJgDFpxPEfsXn687YLWsRTqrVgZQeX04E1CiSvc
         v/tC0NmzcdYkP/qpLGzM8CeHUYYUUbJ5mkgPLxbbqH1EKoxyqwPPRr5CPA8dPUxG2QYh
         OpPWCtD8O9MAX/3voHWBCZMfeBDW+nxwAxcAA19Kayin9u3SvSaJo2y8Lu6SYa1immCX
         BxhQ==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=DMaLtrb86X4jIFpPWGAY8+4iNR8hPttSG3AzQHhU5RY=;
        b=wPC2dWttZ6GnG5Ym0z6rzWJHSXTLHXpe05Lad0a6kSXifPJd8D5h3Icq4Ig/143Jm4
         b33s8meZQdfm4hgQs7/vVnTtwOqtg8KNNJLsTQN1VEe6O63zxFccc3eYzeBr6cs6cbdQ
         GRH+tgxSbD0yVeMwYpW8tohUAa29JR4CsGbUR362TzNX1mh2uk5Y2/XaUC3UN5unb6cU
         w/h7Ccz7MqwVD+fvZNnssPeeHyBWIRgclrd/6aMWbgTC71sIDQQlwQ+kBN/9313JyOhZ
         AtFIjii82/g4VjuL0Hv6li6XZgEd9fsZgjG+ETtTT3zCk2RFEuh19TmdeXxYl3ApJMUg
         0dYw==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@NXP1.onmicrosoft.com header.s=selector2-NXP1-onmicrosoft-com header.b=dCdHbG3k;
       arc=pass (i=1 spf=pass spfdomain=oss.nxp.com dkim=pass dkdomain=oss.nxp.com dmarc=pass fromdomain=oss.nxp.com);
       spf=pass (google.com: domain of peng.fan@oss.nxp.com designates 40.107.6.86 as permitted sender) smtp.mailfrom=peng.fan@oss.nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=DMaLtrb86X4jIFpPWGAY8+4iNR8hPttSG3AzQHhU5RY=;
        b=qkWg0saPEq5D9kBqheCxl96ZLIScdppCy9dYFjh1aGvp8mbIhb0r6X85bLUjJkWXlF
         x2Ksli3KlkCX3Icjvwcb+LhyYlXBR4h6zZI9KjuWET463/PfJYZS3n/H6K4TRGgQCL5n
         N8FqiqNVlloVTSzae6Ww5t5FxWoyeBUVdontmFm4OvQcpqsGhuUMUlX66wGr1dzIxk33
         jbr17J7/ELz62rNFGj+ddXI9Jhg8Cn3q6K7+cLpAlcSAahNxVFP9MeUMbUVBWGpX+yG/
         V9ypxGVwHPF3nnRbRZj6CA7Q2bJ5ZptFI7/CQ63bj6AuyNRlBJGIBsvShYrApCuYeQ0+
         S9bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=DMaLtrb86X4jIFpPWGAY8+4iNR8hPttSG3AzQHhU5RY=;
        b=HM4rkiEv4GWKJIXwLLY4PJeqfZEvI5QKve0boI9gKOqKwh3o9+lItRM8xAwgOt2i5r
         g+XsiWJ8BCdBNcS5EJtbxi38Y2CXGaBan6HRtoASMQHG9KHj+HkwhNzFaqSEmCH4EhM/
         6smriP0uD7LElvOTUtlF4LP6+sZC/qw5zGXh22Bca+U5CZRH9VE1SX49XLyzz60gJF7x
         tF222fqyOiEwqiwQanesSt48N19QK5wmBaqJhRqBdJSR6WXXvS6rKW5uWftbrgOc3Lo+
         8ML3W300ZbvP1wsS2vR8yyw03QPQjXaOcDuqh0brsCWytGrTvxGtNCpXqT+AIqxvhPZu
         Ug2Q==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533O43tUeadY0QDC1qe+piJjxAQaEts31up6JbBSi5+nHYkECmht
	qvhEkOzRPFSrBsua27NU+QA=
X-Google-Smtp-Source: ABdhPJxNwqQM3YO5HAbQNgF/t6iP7UfCKhRHw/MI2a3qvdsCpyXrugS8d3LBDt4Op9m5VHQjsMjA9Q==
X-Received: by 2002:a05:6830:2151:: with SMTP id r17mr11363917otd.141.1633741968292;
        Fri, 08 Oct 2021 18:12:48 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a9d:4a3:: with SMTP id 32ls1531976otm.2.gmail; Fri, 08 Oct
 2021 18:12:48 -0700 (PDT)
X-Received: by 2002:a05:6830:31ae:: with SMTP id q14mr11532421ots.66.1633741967956;
        Fri, 08 Oct 2021 18:12:47 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1633741967; cv=pass;
        d=google.com; s=arc-20160816;
        b=j2DB2q1ywHBZ+W72XlBk91U2I1giZhlqG7JjK4d3T+61kD9XAR1EZgOhKUBRvfysrT
         RzIe0g/+fXE6gWUF72wZh3NV6eCyscmBO1CW6CKCAk8askvSHVW8Pjk5lUeMz17UT2dn
         kyGlcICmM6AonJK6fnN3k2LJlu5PmM9MLvDMbl+3QpWsL5TP4Vsx7Lu+O11fWvbBmMep
         yDS7qT4QSqsRres5xAF3fvv8OealgrllgwARuzO/M03Cxh32wkhy1TYCSWndzyLDMclw
         G2VmOWP9U19JwLAY1ba73EL5tPyXP7TzMPbpSf4J14XWsUUqsCRAJhALoiHS0cQiMIWp
         zihA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=AXAKaqE0OCWrpJRO8jtzaAYLP7fwjG4xEAiyeh3nY7Q=;
        b=sp8vtGGvgAA9lChkvPMjsQTM4nkmvNXVp9xrLk0EVunexHR1UyHlXvK7KM7KZ47UIS
         neuzSDX352ZUcK9FlVaIacJUCOmm8U/od1x3QdArO8Xmkc72ojMIK9fz3VLspwnNp/Ov
         Eavp5QO/zyQvBF0/IntubOp8sKAxQJwh+ybE5HVY5K2GFSjZurGJ4z5kZMOUj75ai5iS
         23kL8YautTk9zCtlO8/wEeJs5Q1xUVPukHgZq4VQNUb9wEBfZ4BHzgZV0hdJY7yogHTg
         69DQZKbXc/F/PQ3xrRZO81H4C1xEvJ45oECX90jE64ZajGnMt32NVbhbniYaYQmVq86y
         sjfg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@NXP1.onmicrosoft.com header.s=selector2-NXP1-onmicrosoft-com header.b=dCdHbG3k;
       arc=pass (i=1 spf=pass spfdomain=oss.nxp.com dkim=pass dkdomain=oss.nxp.com dmarc=pass fromdomain=oss.nxp.com);
       spf=pass (google.com: domain of peng.fan@oss.nxp.com designates 40.107.6.86 as permitted sender) smtp.mailfrom=peng.fan@oss.nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (mail-eopbgr60086.outbound.protection.outlook.com. [40.107.6.86])
        by gmr-mx.google.com with ESMTPS id bc13si59911oob.2.2021.10.08.18.12.47
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 08 Oct 2021 18:12:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of peng.fan@oss.nxp.com designates 40.107.6.86 as permitted sender) client-ip=40.107.6.86;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nyUSJLnY7WjldmEAOxTiKoyZtJoOAdjGT842asWXwVliVCFXfbeHYkJKnax/eYgu05cXKtENjGFEza03tNV3+QuIl1OIz7XzaFQRoT0FM0RoPCCi646f7vKFr2n2nlmZIqAXJIol4FsKr6QUEduWdxfvpC9US5TuDjgx4HxS8EoCXIQGMZk8mMZ5kt0iomu+5v8TKGaTdDLD56snhQcd8Z7yIPhZx2RnYTA/xiK/vnJsEvmJfQUSYP74APEjYuQkJiJOCR9LK37CcT/2vl/nD0S64byhzr2QLF9tj5AYDAsTnU6J8aEKIm+yshP9oxmLElpyXWLCRpgxD0vN1LKATQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AXAKaqE0OCWrpJRO8jtzaAYLP7fwjG4xEAiyeh3nY7Q=;
 b=cyEaYTnSkTSzv10NUr1+PU+3x2EOYKT4It3XyXYKNSEV5/c76uakU4drWSU2wrgdu0mfoce5jDIZtqKs1i1Ih9SU0hmstyL132sIw0mUoVD7sYTTNr/ngkYPG1L3SaHbFtYUNKFg0PkHuQ2gf2USok4xUBJxOHsziWBO4WcfmwrerWt8pZA0UWe+fbDNmC/cjJdbq87+T0RrVEOHbj1E/84+e7Dv63ST+Tx8chaFJNpGeZ/hnmfipXRgko/BxXOvcioLBRArB9m5JWGtNa9TCaJe3Z+5xM3goLbWfhRw1r+p9e0RzOi+OGIUaKIULBAQ0oxaDuMEkJmeyli2kjvdiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
Received: from DU2PR04MB9020.eurprd04.prod.outlook.com (2603:10a6:10:2e3::9)
 by DU2PR04MB8967.eurprd04.prod.outlook.com (2603:10a6:10:2e2::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.18; Sat, 9 Oct
 2021 01:12:46 +0000
Received: from DU2PR04MB9020.eurprd04.prod.outlook.com
 ([fe80::b928:9230:aa10:639a]) by DU2PR04MB9020.eurprd04.prod.outlook.com
 ([fe80::b928:9230:aa10:639a%9]) with mapi id 15.20.4587.019; Sat, 9 Oct 2021
 01:12:46 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
To: jailhouse-dev@googlegroups.com
Cc: Peng Fan <peng.fan@nxp.com>
Subject: [PATCH 2/3] configs: arm64: imx8mp: typo fix
Date: Sat,  9 Oct 2021 09:11:37 +0800
Message-Id: <20211009011138.469592-2-peng.fan@oss.nxp.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211009011138.469592-1-peng.fan@oss.nxp.com>
References: <20211009011138.469592-1-peng.fan@oss.nxp.com>
Content-Type: text/plain; charset="UTF-8"
X-ClientProxiedBy: SG2PR01CA0099.apcprd01.prod.exchangelabs.com
 (2603:1096:3:15::25) To DU2PR04MB9020.eurprd04.prod.outlook.com
 (2603:10a6:10:2e3::9)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.66) by SG2PR01CA0099.apcprd01.prod.exchangelabs.com (2603:1096:3:15::25) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.21 via Frontend Transport; Sat, 9 Oct 2021 01:12:45 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3b73f0a8-37b7-4299-1dab-08d98ac1e722
X-MS-TrafficTypeDiagnostic: DU2PR04MB8967:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DU2PR04MB8967BC87FE7430DAC381CBF4C9B39@DU2PR04MB8967.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:243;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tWiHx/AGjY336HXPPc0te5Mh+khNwNaoGMU4MlnhICuIknLnwTYU9MiwR7gWQtVfFYqsFajJJkZEZeN2evKVi15D7S35OFwhRBNpwVYukgoYFEm1FpsKT75SraqWAwFgHWHsJoU5HaLgmmamxqVR7JJ6PURoj1MMahlhbDkbbCNpYtEoH4yl/Bk8wGTIoKwvpklOpGKbnJAU3uZ7wmv3emFuZb1rkbFg0SaiK7vDhRQGICUmwxk6pAZx3Uz15sVU5tJVV0CoqCDwbwBUTE1Wcaw93ZXdTjqcEgdF1bxmbB5kQrBdSm2Yv7KueR94Hks97Sjn+U+BVrLIfL0fWp7qI1L0HYUq3gS5KE/J0qplZVWgvK75yARtgSMlnCZFz5VYFXgjrJZLPRlqqtroMfqawfUiNZ5ZblqGW1+MDHEKThi6OdAo+faU+C3hq+T3ruzJ570ljP48qEatJzFMIMLatJtdLCsNGNphqgn6iHP8xNUzbKzEzuHNbbzETHvCXS+ilfSdfvfS+krKJtak0vN+ieTLwIsLhyUSPiHCfWJ1FFsN1V2f33jW0Uy32pOrlbR8R7CY0+gZmL6ihL+sjAt+/YKNHWolTKUDV5m5dpLkhimh2VCLjF3cDIdmsUS+nyHpivs/JW+nyxBNiNwKea0UvD8ypeZkKRmDYIyocANIxCsnVa00cJwwPRZpyO49+AwjyEkZitOPjivSJZ1tgTVz4gbeI9tPYXaz+TmHVMQQMbg=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB9020.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(316002)(6512007)(1076003)(66946007)(8936002)(8676002)(4326008)(6916009)(2616005)(956004)(66476007)(38350700002)(66556008)(38100700002)(6666004)(5660300002)(186003)(83380400001)(26005)(6506007)(4744005)(508600001)(86362001)(6486002)(52116002)(2906002)(32563001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?zMbI7jPx4rCqCS9ECN5NYvsRi4CNywpkiv1nWEUHFD78jEkC9Uu8NXP605KQ?=
 =?us-ascii?Q?QaTHLQHQPFCDX66F3JJACr7prJ42G4BFdw43eWzfub8wozOBbCNAqVGRn3Vb?=
 =?us-ascii?Q?8TWdR/2E3i8t9dz5KtqPInPR+z4FikFZeHbBr7qocmLMTHm5eDbK5G4mcunC?=
 =?us-ascii?Q?3uGib1SWMbDNdEsdRPbL/EeSCFnbW1zW+UetnxXwnnVEAOlh7058mACu1qpg?=
 =?us-ascii?Q?9Exd0QwUeKDcw/5E8n3gH20L52fZkokfhgpTLf/RHCXlY6Auia5Yw8JT7MFH?=
 =?us-ascii?Q?ZtSCLeNekZAhOMSBemDsLPtQTSXHS2QQGI7vO5T3j6hOizif3pHel6BgzGba?=
 =?us-ascii?Q?eZIauZKPZ8foWdRvpNemxjXeriN5q05J7fjLMn3GaYL/3DkNbZmCjWtBo2B5?=
 =?us-ascii?Q?L1uXo56wX+3jKn7y6rBToe/4aWqu2v3TOdtmWNnDP5TyC4L2HbuOfAn+lzhU?=
 =?us-ascii?Q?m+mTnmpwG5Tyt6l1Qmlh8p0M+5d/iJMGyR+95nGizYtloq8Oq/OsAo/Qj88B?=
 =?us-ascii?Q?aGuxE6texKaJUIfSc/J4FZsLQASGsSOiu4/IZ8heP8jgvrPHjd7LS+RCfJ7C?=
 =?us-ascii?Q?k5aX/5jrcarme2HWchLfkQwrL94YfCcpajB7BK3kQtnt1Q3qBwJTlRm55Ya5?=
 =?us-ascii?Q?ZXvndtj7Gst0sYK4QNxIuvLm98RN1DULeJ8o3dUnYCOrkccEPxtmrKmIkaCq?=
 =?us-ascii?Q?MdGD5UvaWOb5UQ5RmUblkPiqOc+xud9NEmvn3hZTcqxsTc7gc9Ex6xc3OQL6?=
 =?us-ascii?Q?WJ+mBT5Kr4RJfYgHlahQ3O+WSNpVBs/6Us+yU6+q2PfDn/kR1V6L3m7inT4j?=
 =?us-ascii?Q?aFt8QlPzvbI58+9XSLUisPj5iFFSKlP7qtBX/dTrzT+h1/OWochjc8x+q85d?=
 =?us-ascii?Q?F+DQH7LRYJylvGVUMOVhAx3DNzyheGfvXrQPEosMXSsRiQR6JSpJ728jnham?=
 =?us-ascii?Q?Z0tbuxu3AFArFhuag8p7A7hqfvTSAewWCZjKAUN43rNGNHO7ciE5cIdEENNG?=
 =?us-ascii?Q?pTKcbMt8bFmC3dYhhEZdQG48M5XnhKGxt4wbgpL4rozooqJ1jJcDKr7bqKd5?=
 =?us-ascii?Q?S/3O/ZQz2ltQyM9xIN8tydCik/8RVx+dP5olNIIXjVpUptXbrQx0cNbJgNyM?=
 =?us-ascii?Q?r1tFMB0JLRtqMFO/RXCkzVtQdgqvSS3UlSDGe36u0xujKZWwbEeGk5/MM5tm?=
 =?us-ascii?Q?c32hSndHWsS06FVsOv1q1J01i40C37qVYcH/KMec9nZL1gpnPYO4fsTzdxeX?=
 =?us-ascii?Q?IvvGhCETV1YJkD1KJYBqnpXDnk0kDdwGgopHp770/1hcowYfeGUMBccrgvKD?=
 =?us-ascii?Q?6PupHkw/QAAUlbROcWNbl/hZ?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b73f0a8-37b7-4299-1dab-08d98ac1e722
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB9020.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2021 01:12:46.4443
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UmWvYBbcqi7uymGHd36ciNyowpamwSCqMVz4GGgjUR+Lx/pRZNfgWT8gWolbzNVH25mnq+3fFV1rs1kt+9WNHg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8967
X-Original-Sender: peng.fan@oss.nxp.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@NXP1.onmicrosoft.com header.s=selector2-NXP1-onmicrosoft-com
 header.b=dCdHbG3k;       arc=pass (i=1 spf=pass spfdomain=oss.nxp.com
 dkim=pass dkdomain=oss.nxp.com dmarc=pass fromdomain=oss.nxp.com);
       spf=pass (google.com: domain of peng.fan@oss.nxp.com designates
 40.107.6.86 as permitted sender) smtp.mailfrom=peng.fan@oss.nxp.com;
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

Typo fix

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 configs/arm64/imx8mp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configs/arm64/imx8mp.c b/configs/arm64/imx8mp.c
index d64017c3..7fbf6ef7 100644
--- a/configs/arm64/imx8mp.c
+++ b/configs/arm64/imx8mp.c
@@ -1,5 +1,5 @@
 /*
- * i.MX8MM Target
+ * i.MX8MP Target
  *
  * Copyright 2020 NXP
  *
-- 
2.25.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20211009011138.469592-2-peng.fan%40oss.nxp.com.
