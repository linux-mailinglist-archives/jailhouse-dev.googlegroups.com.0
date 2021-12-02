Return-Path: <jailhouse-dev+bncBAABBVOVUOGQMGQEZKVXGPY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23a.google.com (mail-lj1-x23a.google.com [IPv6:2a00:1450:4864:20::23a])
	by mail.lfdr.de (Postfix) with ESMTPS id 941CA466722
	for <lists+jailhouse-dev@lfdr.de>; Thu,  2 Dec 2021 16:48:38 +0100 (CET)
Received: by mail-lj1-x23a.google.com with SMTP id y23-20020a2e3217000000b00218c6ede162sf68335ljy.23
        for <lists+jailhouse-dev@lfdr.de>; Thu, 02 Dec 2021 07:48:38 -0800 (PST)
ARC-Seal: i=3; a=rsa-sha256; t=1638460118; cv=pass;
        d=google.com; s=arc-20160816;
        b=OvI/CpgDszme/R86SCmQVagxwLe4PuZjYj9+krnxTm4fo1W9eOzfo5v8kSG3xk0xZH
         SzHxczhWKtSxl5w6ADx79PCsUP5RkWc5OI816+CqnHOV99ZFt1ifP6VKJhYEd+sPN1DO
         h4TVTBFt0GWJuEoL96JPbDOfBuBYuIp59hOvUWexy7Ol/5ErE73QdLgyHcYjmwSXYhNN
         831P429sFYVIPE/qzwawkOwhLRamW3Tg0BN5Z3MO47usNzYizhYEjqmz9wr005Mx2cHl
         OHzUcShBNhPx2JBntvDGz7hTsY6+XSieta7hvugv+nOPWaFLOvbghGcFh1fk5gNcY8nW
         ecZQ==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=1FYOmP4STVSUw23rYgvsMFQGkmIpERAJzKokl0tsfzs=;
        b=Xaazc+jC0d+8JS+JLIU2slgizzYzpDCc0FXnfxBTEf5YZjQgIAQ3RjafyKuv5QwBRD
         B3jqNiqK/c0k0aolnvQi1tSXwnDTWGBS90u9+4kIkfX2n8IF+4533K52Pj3H0de9c7hP
         0/ntX5QjrvIMW4YYNA1iGstXqgY/ae/G4P8Kk3yeTbYIFrCK9n1ubR/3wnj4QAVgEu15
         0mcnG/M11TfBxklw1K0CmfhhEtyakwgHaoRf+yrI52pl+6zNmeWqU+XHHkyUXnCQNmxP
         YSffe8T8Q2bgmskLrYbo/cJf/8y4xo1dpOW7eO6QaAncSrezToZo2KaBgI3Y5zg4vVg0
         YFLw==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@NXP1.onmicrosoft.com header.s=selector2-NXP1-onmicrosoft-com header.b=QwAJT1TC;
       arc=pass (i=1 spf=pass spfdomain=oss.nxp.com dkim=pass dkdomain=oss.nxp.com dmarc=pass fromdomain=oss.nxp.com);
       spf=pass (google.com: domain of stephane.viau@oss.nxp.com designates 2a01:111:f400:7e1b::605 as permitted sender) smtp.mailfrom=stephane.viau@oss.nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=1FYOmP4STVSUw23rYgvsMFQGkmIpERAJzKokl0tsfzs=;
        b=KYa0OPK5QErhEjod2ouEYuH5cmR2J2TfcVr5biNhg8DCHmifgJN+nL4xeE9d3jgpcA
         iz+FIWwiwebAA30xi3xf4TnPwbHZk8nUTvcyflhB9eCukSUY/34zq2i0v0dFT6Rha67w
         GHw03V42pH0yq3bT/NYbZ4IiDPOj9RxdUOWDqaZqEm9/VCRvpl2Uo8anVxKUVqeIa34J
         UWwYtN2MH89ngsVwM8RZf1TOydADpkE/msbpaX3jemk8QeDTBoJklDSwDnbGjau4qyKW
         Omg3reRQT9weDMsCht7dAII1jwBp0g1vmLnlsg1dXofhO7nzX8NZXQ0V1E8s/5Dnd8gz
         4A9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=1FYOmP4STVSUw23rYgvsMFQGkmIpERAJzKokl0tsfzs=;
        b=oHpH6BBmB3yIbLRE17xop0hm1zBbir8mJ9UVT8FLzVg7nN7qFYYJmgVOtfgrn34Nq1
         yhDxClJ1Ryni0lmaEXCq1L1lKWWC8ZQpVCw6wvPUNosM/tJIG8ImwY9wz7ED48vFxE60
         LiQDw2F7RnscO0Uw7izd0/FCznk3cbzOKRgEqhdy6jTWe0+SgHlInutnCQQdF5z/zoPf
         cCp6K8gkHEvw8AoU6PbHWgQGNbJKAFSesNHr+DSFpdDnzjMPsu8OD1oKedQQTkRo8asz
         n5oBS2qIayS88YEWNlTeRen45agXq6i3kXjnwXArOuFLD2AZkTZl2D8FDmAdAeNt7knL
         vREA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM5338SjjMZ3795jUqQDQGrriKWhSGZegozLn0fyKF1AwaR379Hz0E
	1LA2mYvxo9ePGQmEvWHM784=
X-Google-Smtp-Source: ABdhPJxSx0WFCuMMZhzsJjnwmoqCzdwTB2euVyzpreph2y33gJX0XnIDKrriuWWwASzWu8ExlkPgzg==
X-Received: by 2002:a05:6512:3f86:: with SMTP id x6mr12350416lfa.616.1638460118115;
        Thu, 02 Dec 2021 07:48:38 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6512:234c:: with SMTP id p12ls3444723lfu.0.gmail; Thu,
 02 Dec 2021 07:48:37 -0800 (PST)
X-Received: by 2002:ac2:515a:: with SMTP id q26mr12697431lfd.658.1638460117378;
        Thu, 02 Dec 2021 07:48:37 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1638460117; cv=pass;
        d=google.com; s=arc-20160816;
        b=avsg0WqOFG/PqX4PJnmBBWfQ1Cq99EEyqyLu2/Gs9Pl+At3McC2vMXRtu1B/+PAbFE
         OFAyfAGEGpJW81R3Ffa6JjOLT76eBB6Hm3jpuJi8FgNwv8QqAv39PcQK/CSx2z0/BWnG
         USMcS2Rn7hu3PkXXa71etGgp8LpQ+dfEg4jBmz+nlntPSdZyISaORKe3IiMnf+PHGqYj
         xL4INtLjfslFXKJ7BcMBgABPYd7EuNgoTZr6Q8yYDUgD0X5TFe4/0zBozxFKGaAlPRxu
         hTblINHSl865NMwXRyWquAsElIMUu6qFMVKv/pQBS1rf2RhAYcYD9kve5qC6ZW9FnQKK
         8IkA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=48WCM09N0UmD0UpPr6uUK8S3zgt/qNaaL7nAtcg50bc=;
        b=y3y7zePu7ZXHwaWiTxzas0RsLdAnzl4qn4ugc2DLaHqu3ACtyktPnn3YBxuUNHF1Sz
         Cf0OulXc6T/0lXcxlRhJzYo5FYWQd+bJ+vAbxxgGbE0Ro1pslJ8WlpG2jhGvMDqwFoqc
         EJwdfNzIyYnZEhZ6IPGmERjBLRfr7pCcGg89gigiUZL8W2ppFj4hq/mGDt2uEF1Ou6Hj
         FT0hw3nrbCao9DKfky/DlZO3wcDWmlKnZBZ7x2t8yH6hUCWANXdG2hZ5p70QynEVBpBt
         AxQZuWQUMB86RYyTx7LW9zaXk4EO9sFe7Wg2BO56FI9la98ypTsvEDq5CtAvqSgLlJvv
         Dbrg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@NXP1.onmicrosoft.com header.s=selector2-NXP1-onmicrosoft-com header.b=QwAJT1TC;
       arc=pass (i=1 spf=pass spfdomain=oss.nxp.com dkim=pass dkdomain=oss.nxp.com dmarc=pass fromdomain=oss.nxp.com);
       spf=pass (google.com: domain of stephane.viau@oss.nxp.com designates 2a01:111:f400:7e1b::605 as permitted sender) smtp.mailfrom=stephane.viau@oss.nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on20605.outbound.protection.outlook.com. [2a01:111:f400:7e1b::605])
        by gmr-mx.google.com with ESMTPS id t18si10948lfp.0.2021.12.02.07.48.37
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 02 Dec 2021 07:48:37 -0800 (PST)
Received-SPF: pass (google.com: domain of stephane.viau@oss.nxp.com designates 2a01:111:f400:7e1b::605 as permitted sender) client-ip=2a01:111:f400:7e1b::605;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L4OqxqELRz8U0x5ZnRtFd5NG3s0McMidLJXByvaS4R9ZfY14Ig0cWCshRJCsDW1UOZFl1u7iSGbCBpBWOyAcbixsvzjNU3G4Rj/chcMk/TlvQSZZGCR1CfEfWuw6e9fO8wc1qhPhDOq1+/GcVhWDjAMTUYrmQrznWPFwHjS89IWmIPLwJDytMHpbk4sSvzgOHRFh+FLGfd86Bsx3stARxo/v1pS59vflSRboRWQJ/cY61shAyeYNf7ovpglEZmMbnoi8jzeCWFP1CQFElUI5SQ26q46INAugziPRsXIBJltEctO2xXEvq1SbIZ0Jbdl49tQnH5iE+Cfpr3B7vbFRkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=48WCM09N0UmD0UpPr6uUK8S3zgt/qNaaL7nAtcg50bc=;
 b=dE+q6tja8tQJG1TGzYAze2BA9SDoW1U1CuRiPqyeArgleS52lAsumqyZWWK8CEarNGYRPMZ/ytG6YNxbcYext1ggMDLeiL5ddo+rMMsJxesm8e+UoWgbDhGW9Ys1irrDH1ZDs3zlsQK4V5cTMEDsxoEwst1285Q+hwGNO5L+Sm6tJDT9ANFtSYEop5WROIfkIRcAyRBvDiQI/HpiDZGz0eYZjKhb5gJ0KVNycC34dlFBVyjHI1VeGPpHgZ8WXnIzbS9HPUTmdjuDGXoon/D9u0VmlVbFgOjoGDzDL5teGkqFH6uxuMn4/7uxutQrFpZlnvBze0AH82hds/RtOu5XAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
Received: from AM9PR04MB8652.eurprd04.prod.outlook.com (2603:10a6:20b:43f::21)
 by AM9PR04MB8716.eurprd04.prod.outlook.com (2603:10a6:20b:43f::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.14; Thu, 2 Dec
 2021 15:48:36 +0000
Received: from AM9PR04MB8652.eurprd04.prod.outlook.com
 ([fe80::6989:73a2:f15b:2370]) by AM9PR04MB8652.eurprd04.prod.outlook.com
 ([fe80::6989:73a2:f15b:2370%9]) with mapi id 15.20.4734.024; Thu, 2 Dec 2021
 15:48:36 +0000
From: Stephane Viau <stephane.viau@oss.nxp.com>
To: jailhouse-dev@googlegroups.com,
	jan.kiszka@siemens.com,
	ralf.ramsauer@oth-regensburg.de
Cc: Stephane Viau <stephane.viau@oss.nxp.com>
Subject: [PATCH v3 2/2] [RFC] configs: imx8mp: Convert a cell using helper files
Date: Thu,  2 Dec 2021 16:48:00 +0100
Message-Id: <20211202154800.2671-3-stephane.viau@oss.nxp.com>
X-Mailer: git-send-email 2.34.0
In-Reply-To: <20211202154800.2671-1-stephane.viau@oss.nxp.com>
References: <20211202154800.2671-1-stephane.viau@oss.nxp.com>
Content-Type: text/plain; charset="UTF-8"
X-ClientProxiedBy: AM3PR07CA0075.eurprd07.prod.outlook.com
 (2603:10a6:207:4::33) To AM9PR04MB8652.eurprd04.prod.outlook.com
 (2603:10a6:20b:43f::21)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from b57362-l-11.ea.freescale.net (81.1.10.98) by AM3PR07CA0075.eurprd07.prod.outlook.com (2603:10a6:207:4::33) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.4755.9 via Frontend Transport; Thu, 2 Dec 2021 15:48:35 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2ad06c3f-5020-4a51-711a-08d9b5ab3396
X-MS-TrafficTypeDiagnostic: AM9PR04MB8716:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-Microsoft-Antispam-PRVS: <AM9PR04MB8716CE46BE7F0B94B72F6E1DA7699@AM9PR04MB8716.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2150;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /CkOigz6hVn2fuwI6SLAyLlf8SljtvdvJQ3+ussNZrFaQgpPAb9bcdJwaSQ6LPcIfFo/Z++HUSX0MJz7aupLDLXF46DA9KhyuFDp0EC6cITg+MGoUklxRm+q9i6W/9RkrBT1icQZowox2iPs4+1OkWuINhS0RQyk610jMODCTpb1YhCWbER+W5Z7E4dAlsn63usm/BEN6ZYudZnKkLkEuTYu4mKPTYhe8v2dnBWPMooi7MDh9M7ftvwPcCwbCMcBDBDdWyDKHHh+IGyYcDQ/PzqnlLXGIBCdIi5kazwOFuoHQYod55eZ8oW4Byg021Orv9QGLyPTtxllyzqp1pL8zO91+BLYphWulYsSvlu56eIkIiRhriJBy5OoBT66Y7vUs8joCQrUC1ICPMsqfLZGx1K8LOzX2vCBAjlMCk2+HZhxMi9UIuLLTfQNrzbh0I9iGqX4MsB15e2pUVeutra5cMWGeSpsgv/ZfLIYiseD0xbPt5HgkemRtcOF6G06D7j/58CHENynm0O6MewGv1/fMN+a/h3m9DgLK6rZKsKCM/WrnVkmOd8pjU/A5gJmhbOTIPvXH7yn6oPed5VipSYOafmtXfenlQB9FvgHyndaOrWSE+SwXB/LCloT3LfClW+HLiDt5CWuzprmHXeP+tW8uUuXfmge95jFeD+eQOIW+QHd6ooors/Y1xzFqVzoVHqvjg3rI9lcKdpCkDJ7FH1fVRmp4zEheR2plZwo3JHC/k8=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8652.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(52116002)(44832011)(956004)(508600001)(4326008)(66556008)(8676002)(2616005)(38100700002)(66476007)(66946007)(8936002)(1076003)(6666004)(38350700002)(6512007)(2906002)(86362001)(6486002)(5660300002)(26005)(316002)(6506007)(83380400001)(186003)(32563001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?LQWr2tkEOoI09b470I4z9d2puslgeQs7uKB234TTiwGs5seibIUpFtS6+hJH?=
 =?us-ascii?Q?hNmSeVzP9/TmnIfNx1Ma04u+BmNhgvs/Ax9CLA1zbYqVvIpDfCffo8men6Xq?=
 =?us-ascii?Q?Zhw6MMqevEtHXws4bpxLR9jo3X+uzZKWBRlT6MRjTqCwPSPVtkCOuPNHaASV?=
 =?us-ascii?Q?e1cPpDDx1Dwnqv9pgnGjsnu4AHErsWqgAmEyHFqF7mttliqigzdC4vIUl1Hx?=
 =?us-ascii?Q?RYOzE0vCR/ifvJ+l7tzXezZNyJiY5IKYxSsQiFla1iDXA9UlIJhE3uNn07B8?=
 =?us-ascii?Q?sWtD+/s06j5jayarl2K+F4eb/7JDfyFzhcUJpqxrN75ITvpXHmo01sxIqdrD?=
 =?us-ascii?Q?7aH2iUFuhHm3fy1BU9fr9/zVOe2Ieyw1Y+fYqk9Br1LZfI9mBlyNY+JruM8u?=
 =?us-ascii?Q?TyBLLpQnE4KW4pmJygYXqozj3knMgxxERU/JuvUg14d/teXdClH6KU2pL8VX?=
 =?us-ascii?Q?u/FBwA1bJPWW48IzmfTN/so7XG7JDQ7f77qQixKiEvnZlv+yFxdRXe2CjRbT?=
 =?us-ascii?Q?upuOupiRZhC4Ha6JEYSU0xr4b0i0Wd788DuYblCdP9t02qRY244u3UuG9UAL?=
 =?us-ascii?Q?EV+E7bN1MmLdg8PvNBpLTJGVuDskI3Nc9XcBmSyhmSF+vDu9q3wFR77Q3jhr?=
 =?us-ascii?Q?v/1Ie5aR2Ke7OwWn+ra9a+ZHuPyyvgvRHD2Asum1w+pHz0Scwi7CFqS7/dg7?=
 =?us-ascii?Q?jHns+URurG30zlzFwMpge5pwEeIcVBamUz/D/JGKII+ROvyP/ursvOR4NhOx?=
 =?us-ascii?Q?hQDqI90e+ycUXlnoWSnb+n+SFdKP2sF2F0fhUfWUQGSA0AJCK7mVasHIKFBz?=
 =?us-ascii?Q?lJxvGCIUwxZFT0R0cf5ful14GTAp3f9CxwwH3E8uhxryiTlIarw4SMq1Uidk?=
 =?us-ascii?Q?xpjLsVfiVlFXtb19KJMdPNJScq8nysQdKowKmX1cpJ0JgXKc9B8a/UE+YP7q?=
 =?us-ascii?Q?5ICvQGFAQWF3R29FXLiA++jv2KHVBwVDakxB4tbd+8F+5/KH4yLoaJa+1Y4O?=
 =?us-ascii?Q?JAOSzziDAMrwQdJGyneuKrbNRwB2lmWmkGjekBH7BgsBPoY5vxIE7v2Pbrpj?=
 =?us-ascii?Q?ATp/BloVNRJWVGS3Y6LYi4V6WQQvbQbAoWvii3/28E62tLSZhRywuCoWLYgR?=
 =?us-ascii?Q?u5wY2Gz2+nP5YRr3P3LpVwR2OfkpFMIE6bmEmJeZjPJxmkFBL7gZNimmyjac?=
 =?us-ascii?Q?H7LoMB37ydBzO0ryXrWdVEN9KuygB2KcfPwRJsVPBR77H1RaqBgMsnGc/tZC?=
 =?us-ascii?Q?I1pkOU34Yi+O68pguXYfbm8RYxEzuDEe/MQBIwM7VARV2Zel65YlZJGjZanV?=
 =?us-ascii?Q?N2zb/lg8/ZMhG8Z0qPcmOhPoP+faBA2Ro3+Raf/Ndm51pIaOo+Ml57XIOQdf?=
 =?us-ascii?Q?SJixq1QnfvPJDVv3fxZ8XYP5QCH3w+GtE5O03dh7Kfk4xRE9BdnoHYbCex4P?=
 =?us-ascii?Q?7zzHwZr2DGR3HN3IGZyldUzKcp9zeMm6USkCYanPgOjPu3r8MgOF9a33jGEG?=
 =?us-ascii?Q?MvmuEhn1M/jqgq70wkR7Tqh4v55MKtI862D6OOHD1b6t63fipYrJ29PmHG4l?=
 =?us-ascii?Q?p4tvqFyftviNjgVOxoWtt8AHA7AZyz4hMSQ2/K8oUARZsnhizrT4p0KUATmv?=
 =?us-ascii?Q?PFeix6/tshWofFxHVvYK49g=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ad06c3f-5020-4a51-711a-08d9b5ab3396
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8652.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2021 15:48:36.0482
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uYFifjWwWy2AaQ3kW3p5ka+IQU8R7WWquWVDk0ATfrGeLEAKdCtqpXtC4JIaYvbCu3yu3kax0hDwci0uc+TJ3g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8716
X-Original-Sender: stephane.viau@oss.nxp.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@NXP1.onmicrosoft.com header.s=selector2-NXP1-onmicrosoft-com
 header.b=QwAJT1TC;       arc=pass (i=1 spf=pass spfdomain=oss.nxp.com
 dkim=pass dkdomain=oss.nxp.com dmarc=pass fromdomain=oss.nxp.com);
       spf=pass (google.com: domain of stephane.viau@oss.nxp.com designates
 2a01:111:f400:7e1b::605 as permitted sender) smtp.mailfrom=stephane.viau@oss.nxp.com;
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

Pick a cell and convert it to show the influence of these helper files.

Signed-off-by: Stephane Viau <stephane.viau@oss.nxp.com>

---

v2 -> v3:
- Get rid of the *_NUM macros in config files and have them computed
  instead (suggested by Ralf)

v2:
- Convert an existing cell to see the impact of the helper files
  (suggested by Jan)

Signed-off-by: Stephane Viau <stephane.viau@oss.nxp.com>
---
 configs/arm64/imx8mp-inmate-demo.c | 161 ++++++++---------------------
 1 file changed, 45 insertions(+), 116 deletions(-)

diff --git a/configs/arm64/imx8mp-inmate-demo.c b/configs/arm64/imx8mp-inmate-demo.c
index 127392df..169177ad 100644
--- a/configs/arm64/imx8mp-inmate-demo.c
+++ b/configs/arm64/imx8mp-inmate-demo.c
@@ -1,126 +1,55 @@
 /*
- * iMX8MM target - inmate-demo
+ * iMX8MP target - inmate-demo
  *
- * Copyright 2020 NXP
+ * Copyright 2020-2021 NXP
  *
  * Authors:
  *  Peng Fan <peng.fan@nxp.com>
+ *  Stephane Viau <stephane.viau@oss.nxp.com>
  *
  * This work is licensed under the terms of the GNU GPL, version 2.  See
  * the COPYING file in the top-level directory.
  */
 
-#include <jailhouse/types.h>
-#include <jailhouse/cell-config.h>
-
-struct {
-	struct jailhouse_cell_desc cell;
-	__u64 cpus[1];
-	struct jailhouse_memory mem_regions[8];
-	struct jailhouse_irqchip irqchips[1];
-	struct jailhouse_pci_device pci_devices[1];
-} __attribute__((packed)) config = {
-	.cell = {
-		.signature = JAILHOUSE_CELL_DESC_SIGNATURE,
-		.revision = JAILHOUSE_CONFIG_REVISION,
-		.name = "inmate-demo",
-		.flags = JAILHOUSE_CELL_PASSIVE_COMMREG,
-
-		.cpu_set_size = sizeof(config.cpus),
-		.num_memory_regions = ARRAY_SIZE(config.mem_regions),
-		.num_irqchips = ARRAY_SIZE(config.irqchips),
-		.num_pci_devices = ARRAY_SIZE(config.pci_devices),
-		/* IVSHMEM_IRQ - 32 */
-		.vpci_irq_base = 76, /* Not include 32 base */
-
-		.console = {
-			.address = 0x30890000,
-			.type = JAILHOUSE_CON_TYPE_IMX,
-			.flags = JAILHOUSE_CON_ACCESS_MMIO |
-				 JAILHOUSE_CON_REGDIST_4,
-		},
-	},
-
-	.cpus = {
-		0x8,
-	},
-
-	.mem_regions = {
-		/* IVSHMEM shared memory regions (demo) */
-		{
-			.phys_start = 0xfd900000,
-			.virt_start = 0xfd900000,
-			.size = 0x1000,
-			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED,
-		},
-		{
-			.phys_start = 0xfd901000,
-			.virt_start = 0xfd901000,
-			.size = 0x9000,
-			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
-				JAILHOUSE_MEM_ROOTSHARED,
-		},
-		{
-			.phys_start = 0xfd90a000,
-			.virt_start = 0xfd90a000,
-			.size = 0x2000,
-			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED,
-		},
-		{
-			.phys_start = 0xfd90c000,
-			.virt_start = 0xfd90c000,
-			.size = 0x2000,
-			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
-				JAILHOUSE_MEM_ROOTSHARED,
-		},
-		{
-			.phys_start = 0xfd90e000,
-			.virt_start = 0xfd90e000,
-			.size = 0x2000,
-			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED,
-		},
-		/* UART2 */ {
-			.phys_start = 0x30890000,
-			.virt_start = 0x30890000,
-			.size = 0x1000,
-			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
-				JAILHOUSE_MEM_IO | JAILHOUSE_MEM_ROOTSHARED,
-		},
-		/* RAM: start from the bottom of inmate memory */ {
-			.phys_start = 0xc0000000,
-			.virt_start = 0,
-			.size = 0x00010000,
-			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
-				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_LOADABLE,
-		},
-		/* communication region */ {
-			.virt_start = 0x80000000,
-			.size = 0x00001000,
-			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
-				JAILHOUSE_MEM_COMM_REGION,
-		},
-	},
-
-	.irqchips = {
-		/* GIC */ {
-			.address = 0x38800000,
-			.pin_base = 96,
-			.pin_bitmap = {
-				0x1 << (76 + 32 - 96) /* SPI 76 */
-			},
-		},
-	},
-
-	.pci_devices = {
-		{
-			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
-			.domain = 2,
-			.bdf = 0 << 3,
-			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
-			.shmem_regions_start = 0,
-			.shmem_dev_id = 1,
-			.shmem_peers = 1,
-			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_UNDEFINED,
-		},
-	},
-};
+#include "cell-helper.h"
+
+/* Name, cores, entry point */
+#define CONFIG_INMATE_NAME		"inmate-demo"
+#define CONFIG_INMATE_CORE_BITMAP	(0b1000)
+#define CONFIG_INMATE_BASE		(0x00000000)
+
+/* Memory & peripherals */
+#define CONFIG_INMATE_REGIONS		\
+	MEM_REGION_RWXL(0xc0000000, CONFIG_INMATE_BASE, MB(16)), /* RAM */ \
+	\
+	MEM_REGION_ROS( 0xfd900000, 0xfd900000, KB(4)),    /* IVSHMEM */ \
+	MEM_REGION_RWS( 0xfd901000, 0xfd901000, KB(36)),   /* IVSHMEM */ \
+	MEM_REGION_ROS( 0xfd90a000, 0xfd90a000, KB(8)),    /* IVSHMEM */ \
+	MEM_REGION_RWS( 0xfd90c000, 0xfd90c000, KB(8)),    /* IVSHMEM */ \
+	MEM_REGION_ROS( 0xfd90e000, 0xfd90e000, KB(8)),    /* IVSHMEM */ \
+	\
+	MMIO_REGION_RW( 0x30890000, 0x30890000, KB(4)),    /* UART2 */   \
+
+/* GIC */
+#define CONFIG_INMATE_IRQCHIPS_ADDR	(0x30890000)
+#define CONFIG_INMATE_IRQCHIPS_BASE	(32)
+#define CONFIG_INMATE_IRQCHIPS_BITMAP	\
+	/* interrupts 32..63 */         \
+	0,                              \
+	/* interrupts 64..95 */         \
+	0,                              \
+	/* interrupts 96..127 */        \
+	1 << (76 + 32 - 96), /* SPI */  \
+	/* interrupts 128..159 */       \
+	0
+
+#define CONFIG_INMATE_VPCI_IRQ_BASE	(76) /* IVSHMEM_IRQ */
+
+#define CONFIG_INMATE_PCI_DEVICES	\
+	PCI_DEVICE_IVSHMEM(2, 0, 0, 1, 1)
+
+#define CONFIG_INMATE_CONSOLE \
+	CONSOLE(0x30890000, JAILHOUSE_CON_TYPE_IMX, \
+		JAILHOUSE_CON_ACCESS_MMIO | JAILHOUSE_CON_REGDIST_4)
+
+#include "cell-create.h"
-- 
2.34.0

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20211202154800.2671-3-stephane.viau%40oss.nxp.com.
