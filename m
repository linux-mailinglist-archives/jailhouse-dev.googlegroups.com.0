Return-Path: <jailhouse-dev+bncBCY4NF5G6YJBBW65U37AKGQEHNT7R5Q@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x238.google.com (mail-lj1-x238.google.com [IPv6:2a00:1450:4864:20::238])
	by mail.lfdr.de (Postfix) with ESMTPS id CD2652CE696
	for <lists+jailhouse-dev@lfdr.de>; Fri,  4 Dec 2020 04:37:00 +0100 (CET)
Received: by mail-lj1-x238.google.com with SMTP id a8sf1483051ljm.0
        for <lists+jailhouse-dev@lfdr.de>; Thu, 03 Dec 2020 19:37:00 -0800 (PST)
ARC-Seal: i=3; a=rsa-sha256; t=1607053020; cv=pass;
        d=google.com; s=arc-20160816;
        b=GQ4Xpe23cqJRVMDHNv0ls3VAgLMe+AUlsP9j9ybXFjUo6xwHm7+lb0KilNx7QTFdZU
         iMeGobp0Qpk/JpnYCzfLMZU1ivMHhjjc3XTWqyJ80UA3m5bZ2aAmsyTOaG9kyk4+K3fg
         PqaDeZmQoaSyn74jJyLLyPzlWrYqVbUK4mYdBcc3lc9NrbDIVpFneyywSrphS5hoNtS8
         yHqF1h5JHfI7Jgw2catokUTYrrCTxWvo1fIPkDTTiAzt+q6Oq0VREIJpPJ7TRrJEXV1a
         ly9eUW/ooDmZfTO5Xi0o6EZzgZAJ3ODPbOo1JYrLYXbFGcaDHtNDDfzteIlt2PptKq+N
         GQKQ==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:message-id:date
         :subject:cc:to:from:sender:dkim-signature;
        bh=wDZ1OLojPjyube4Z9Sf9/SBNy3tiXBUFB9vyx6/C+UQ=;
        b=ZnvlSfKZw53qLbNCKog1Yw2Jq53N++AEP8HO0JErt3vywZ6I8QBjIOr7s3ERLrUSgP
         dFVSUmf+UMu5/u4TS4BJJCnXU8T1FCqXLzdiCDM0l2GmGXHmItTUsszf/jtNJm2Ifbj+
         zawBSujd7zoaSamOsTTL82mqOjWwS/EZls5HcRnyxRCdfasoL3fJdXCq5qCftPeh9Sem
         61CoddMG8Ur+0cTEfTYVKKCBSJIFf36dwH3+wx6iHd9MNaKSoDubTF+fkDZrXS2Hg1Hv
         87Yr+YV1Ejy9v+K8AsJ7LBte3O417wRJPbsyTqTJvnb9F2OjTidWYv4+g5s9fQqHsb6Y
         2+0w==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=f13doTcL;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of jiafei.pan@nxp.com designates 40.107.6.78 as permitted sender) smtp.mailfrom=jiafei.pan@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=wDZ1OLojPjyube4Z9Sf9/SBNy3tiXBUFB9vyx6/C+UQ=;
        b=ZwhpSR3RYHDrDKFnMWoOGDCnSlj8RZf8OnkfJ2v3c854AH4/hTdwBfenWHxK3r0fKX
         gD/j8F6Ljm9fE5VbVdkZxirHtNz7wCSDa+U1o2W4kiz15Pv1D+mfEF6UMHZ+n+KASuwZ
         zbRCiQS3qjWSDC/sM+VuaaJDenAyoH2Z5InR+ECL/f5UTWv4fA2cSkuU7KPEMxcoXj/b
         EgvKL4s9pj9Eoi75MgWpLWqBUsjsjBMslhOekpJWBD5xZxtYeWkNRPqmLsqJxRhP1JQY
         pKMCAPfwxfk7rL/25AO+Bnnk/LoG3gI5B3DgcS1T28OqmyNxvyGK+oS2KFx/ywB/XrsG
         ZiXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=wDZ1OLojPjyube4Z9Sf9/SBNy3tiXBUFB9vyx6/C+UQ=;
        b=XSgqU+TDlVNuPWIfJOGQZsczxOMEEPwEaRISAPKi94dwb7EWC6PxXu9Snj5S320Yoz
         tsmfjVegHiOk8vdTQbggIWjzJKRABA2EeZVZVVmd/+V3mG3hFx5rqN101/0kvXuhr/ra
         5lTlb7U8BaHESXqh376U3TP9IObdsmGQBpd7l3v0RhNd3SOWk8Nlb+JWI9Jr27Z6cjBg
         y5cb6rmvaMQoWTl7aMSuZ98Hhv0z429gZxo+DUbrvV1h3bsp3vFOHKS14Ylwh6WtMILz
         W0rx6S8ER1CYki1SHA0c8i8S1qBMQIlQJNpoIA2wtJqC58mwe5B+zeMbb51YvDzEu0Br
         R/DQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531BY++fB0DghOWreqDhrIwkRJHdTz8+2hz3/6wsodZUY+mndU2W
	xjs0i4NXF5NPR0giY12U1xU=
X-Google-Smtp-Source: ABdhPJwIoQbcOmiFDWmpCHpSzfO7UP6Mo3z+e+3j/PpjvM/d1kF9dovdH48uXg5Y5leY6Ab3NIAf9A==
X-Received: by 2002:a19:903:: with SMTP id 3mr2688555lfj.3.1607053020304;
        Thu, 03 Dec 2020 19:37:00 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a19:d0e:: with SMTP id 14ls1803711lfn.0.gmail; Thu, 03 Dec
 2020 19:36:59 -0800 (PST)
X-Received: by 2002:a05:6512:1112:: with SMTP id l18mr2712893lfg.538.1607053019140;
        Thu, 03 Dec 2020 19:36:59 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1607053019; cv=pass;
        d=google.com; s=arc-20160816;
        b=OikbyZyGmMTulO4NEA7Z4ly1xBivtrssPUC0Kd/b1bEsEdcK4iOw1g5tFqgRysxf2Z
         VjUTBbIe1pYGCcupNsy1CEQK1npECfjq9h1kERGVhuHSpEC3tUUU+vNYTm7HwisvQD5c
         A6Qk6pymV6l9JAyUgdXz/SU7H2kcsvm9ieqaO1PQeUBJSDQZ5CGQzzrfv7u/nvuFeA4b
         WlpIniOfjpjtpC1DCzWj51W3sFIAVSJwKNrCy9yeUznp7lCVMOktghzrHoSMc7m5mWMi
         9u9nBib8Q4b/DZAJqA12vNEPccUoWdms2CzzucG8kB9iud5OSk7H4eaMRCfFcQPP/WSv
         TFLw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=LmuXZtdKNuNv1pc/o+SpEJvltwGYdxJHEFKcTauZmaE=;
        b=YuOU5qYd8elXEF0eUA/jcRCM9FyVRArVAe7yEtc0ul/C5A92WvnYrzKNawORZwbSS1
         vmxJk50rPwplMZOXTUufjxV5VeRReI2eOdgu1PAbc5baXqbsZgzxemy/4XFR0daGmx2o
         b2O9Q8WFGMlrSS0I+ETNA58M+nY7eWQUzf2PK1+ae0ISxPLQTOIxoIrplOt1JUG65jKc
         vD/s+UBQB/9eeaNBZ/XgLhOn/CJL/9Oa1N6ImsEQrI3LUPMK4DlItw4AnnIXCJNqC4xL
         daa+FKdPoveiwyDq2k2fdYKr+L2SsBLLfCYUWYkheYtSkqY3m4gcpTaEmdJIjSOGjYJ2
         aqbg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=f13doTcL;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of jiafei.pan@nxp.com designates 40.107.6.78 as permitted sender) smtp.mailfrom=jiafei.pan@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (mail-eopbgr60078.outbound.protection.outlook.com. [40.107.6.78])
        by gmr-mx.google.com with ESMTPS id x206si110287lfa.8.2020.12.03.19.36.58
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 03 Dec 2020 19:36:59 -0800 (PST)
Received-SPF: pass (google.com: domain of jiafei.pan@nxp.com designates 40.107.6.78 as permitted sender) client-ip=40.107.6.78;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ii7B4ShGCJTSH7eCt8WWmImlg9deDG722OJneIANXnE2oL98YiwNnl29JG+mSezPAomMY6x+BVZzEDhHR/SImMFQdwE8cg0ZvsZFcpuUImB4W2bng9uRO6uvS9FJCb4tc94hD3pICBcrFznV9+v35vv5CtRJ2LN+8Z9YaPnXT5rJTmhzHjX3TLaIdrpBCX/7iKnRMT1gXLqhlt2D1pQcRrWJoNvK/sdTQi/amo4yshSeTukvH0yL9DzYX36YklEivbb23cI30sAw7MEKVHSEbtrc9M/tkbOMyQ0Nf4VNhiHCAEq/L1/868/EiJxjoaRc+roa43CxRAp3+F4C0/WWCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LmuXZtdKNuNv1pc/o+SpEJvltwGYdxJHEFKcTauZmaE=;
 b=dTZKNk6O/PPwN0rQuciLbPPUTY6GdkAxLDy883EoDQibrF65lCaTPANcC+RdiziNByKUzYXRebJPOfNeQEP6T2wuA9wE3LmjveZXCGFy4WYmQ8PVr7Uq/aYl1gLHi2MtrWPIaHwSimjV6q5+uRuLz6roIU5Y4Orpc6t2IlYVD/fy8LsOE3hQ3sIUdMBfKtLRNC3xSREVyYF0nWabRR/72wqiBf+DvIl9PUL181iAYwWm+etPaoeXvu20iB6sCAp00P7yc0hrYe+JsvZRFHrjRXzetNKw8mBNHVRt/y+p5sBHUEgcAvGC0GWIiDXUU3UJGOgw6Y1u5ijTtFErgM38mg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
Received: from AM0PR04MB4772.eurprd04.prod.outlook.com (2603:10a6:208:c2::17)
 by AM0PR04MB5203.eurprd04.prod.outlook.com (2603:10a6:208:c1::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.17; Fri, 4 Dec
 2020 03:36:57 +0000
Received: from AM0PR04MB4772.eurprd04.prod.outlook.com
 ([fe80::749c:710a:a453:8795]) by AM0PR04MB4772.eurprd04.prod.outlook.com
 ([fe80::749c:710a:a453:8795%2]) with mapi id 15.20.3611.025; Fri, 4 Dec 2020
 03:36:57 +0000
From: Jiafei Pan <Jiafei.Pan@nxp.com>
To: jailhouse-dev@googlegroups.com
Cc: jiafei.pan@nxp.com,
	jan.kiszka@siemens.com,
	Jiafei Pan <Jiafei.Pan@nxp.com>
Subject: [PATCH v3 1/2] configs: ls1046a-rdb: add cell configure files
Date: Fri,  4 Dec 2020 11:45:15 +0800
Message-Id: <20201204034516.20000-1-Jiafei.Pan@nxp.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain; charset="UTF-8"
X-Originating-IP: [119.31.174.73]
X-ClientProxiedBy: SG2PR06CA0134.apcprd06.prod.outlook.com
 (2603:1096:1:1f::12) To AM0PR04MB4772.eurprd04.prod.outlook.com
 (2603:10a6:208:c2::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.73) by SG2PR06CA0134.apcprd06.prod.outlook.com (2603:1096:1:1f::12) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.17 via Frontend Transport; Fri, 4 Dec 2020 03:36:54 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: bcde92e3-850d-4d9d-9183-08d89805d984
X-MS-TrafficTypeDiagnostic: AM0PR04MB5203:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM0PR04MB5203A06F684619583934D7C68AF10@AM0PR04MB5203.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SZh39PMt2ld4+8KprFuEUxnpPZmEmad4W0AxWXEVoxxeRa9P9I3Yf1jdC81/emCf/D0Op1azVWzH/f/ePJ3gZXcRRLkQdfurjbPHy3clfvIGNMVrgqL8CChZX6lIqs7E9/l9fbnM+ev5UTE+d+VVImwBJs1rRgU1eYnexHSKyoerwPSpLsZfPBVdqgpC/G4JqSUV43GKKLK4g5DgH+T8Mr3if0uAqL2AdgVRU1+ZUN3i7Rtk6OOOSNk3/3fbXi2a5tyNzVvLX8Wxr+j2IAc9gOOFQv+nR4OCF6UzhyKVlQyXFFbyh7DHyaizZN5tHPpb+S+/mfUZz3/gQOBUXr/E+MiRn4XG8Tx9Vt+nmXqrqmfJ8bAJ9lzjQQU1vDLgdSK7
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB4772.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(346002)(376002)(366004)(396003)(39860400002)(30864003)(956004)(8676002)(2616005)(316002)(36756003)(6666004)(86362001)(1076003)(16526019)(186003)(6506007)(5660300002)(66556008)(66476007)(4326008)(66946007)(69590400008)(2906002)(52116002)(26005)(6512007)(6916009)(83380400001)(8936002)(478600001)(6486002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?AiR8Ud7GTXLr5Xb4bff1IQRwcDWvGgfQKgeRouLKqRnjwIYuiB/CecWVcRWm?=
 =?us-ascii?Q?c4IBubyPaWf5TEdYs6AkOoF1bjm9GdMIBmYP+4IqKG/f4emklv864ZQN2KWk?=
 =?us-ascii?Q?FZC2ffzvVBcuFC4GNoErD+nG/T0v0p7mPyAV7wtH6p+cRwLj2voOm+W288gy?=
 =?us-ascii?Q?ca0TtCFD/rnsTXFKOfoYr43O1ji9vbmUVCyNgEEo5F6o91gRbdEGg03WuAmx?=
 =?us-ascii?Q?z+i+QcCNlb3hwapxJmybSAV41M+CaD8s+V6Wrff/G/VfCkVUu098LGyxWYqE?=
 =?us-ascii?Q?X6IMcRnV2VDlb14OppzGFyoJL9Jq7lKed7vE11wqacD59zXizRdxJggU/Qbi?=
 =?us-ascii?Q?fo1OB3mIE38UU0pnTacwk9cisE8eQJ1vTIsxslVa1Sz1iTpvzM+DV38CwFZx?=
 =?us-ascii?Q?6NLVegY/PRaHcMavFCiNL+2Nc6hZNo/0FQf++LRCarAyHRhOPCrJAEt8Vcrz?=
 =?us-ascii?Q?8SylYojWjed74n9N8z4ruKN9mt/Pc1mzdjIVXXomWpXO6lNJIT18sbwoGJzg?=
 =?us-ascii?Q?h9IyRe3MaUFqRFZ0Oyx3zpOJKSUWAU7MSUJ50i8PEdw6EiUqYwXoOyOn9X2+?=
 =?us-ascii?Q?DP1hozU6jLy2MYY4KUdwaDSw2KhFUUEJ8D9dnVhfZ50r6jNIeSOpbu9Qujlc?=
 =?us-ascii?Q?qb1Amhjp9HDsTaXvixDBYnkJfGaDHi4mfSZ6YXmQpl8fRyPvDwXfyKuvYCNb?=
 =?us-ascii?Q?ldSqtIi7wuR61cKRm5q4/OTidOIYkNzn6qBZDac2bEQwf/K4ghGkW9Q/3zsY?=
 =?us-ascii?Q?NV/mYRHiM/QM+rf8eWItZkMZCqEAv84gj5e99WhYIZU3BP+I4mJj0mh8+5BU?=
 =?us-ascii?Q?vyyVwxZfP94s5B9La73ZyJotG+F9lJAbIWld/TuG+hYeb5tGbGI2N2RttkW0?=
 =?us-ascii?Q?Cl2cvtMLUAygnPgeSy7I9L3+rTq3/XUtaK5yJnYrl08CjVmZtI9Y+vEoOSLV?=
 =?us-ascii?Q?YgZOJtos+7Dsk/xu5shCPxIe2kO+USxB65v85w3E9eLG0Ch6M/iHe3ONd58m?=
 =?us-ascii?Q?w2vi?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bcde92e3-850d-4d9d-9183-08d89805d984
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB4772.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2020 03:36:57.0204
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: G0IV8xn+TXsuYqql5l35TXzoK7NmwQ/BXNvtIPVdEdM6dlL19hBT8b/+hjnUOVty1KsPu3c1Y06WXg/nEP7wYw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB5203
X-Original-Sender: jiafei.pan@nxp.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@nxp.com header.s=selector2 header.b=f13doTcL;       arc=pass (i=1
 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass
 fromdomain=nxp.com);       spf=pass (google.com: domain of jiafei.pan@nxp.com
 designates 40.107.6.78 as permitted sender) smtp.mailfrom=jiafei.pan@nxp.com;
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

Add root cell, inmate cell, and Linux demo cell configure files
for NXP ls1046a RDB platform.

Signed-off-by: Jiafei Pan <Jiafei.Pan@nxp.com>
---
Change in v3:
	- Merge inmate demo and ivshmem demo configure files

Change in v2:
	- Removed some annotated code


 configs/arm64/ls1046a-rdb-inmate-demo.c | 139 +++++++
 configs/arm64/ls1046a-rdb-linux-demo.c  | 165 ++++++++
 configs/arm64/ls1046a-rdb.c             | 517 ++++++++++++++++++++++++
 3 files changed, 821 insertions(+)
 create mode 100644 configs/arm64/ls1046a-rdb-inmate-demo.c
 create mode 100644 configs/arm64/ls1046a-rdb-linux-demo.c
 create mode 100644 configs/arm64/ls1046a-rdb.c

diff --git a/configs/arm64/ls1046a-rdb-inmate-demo.c b/configs/arm64/ls1046a-rdb-inmate-demo.c
new file mode 100644
index 00000000..b2b7c516
--- /dev/null
+++ b/configs/arm64/ls1046a-rdb-inmate-demo.c
@@ -0,0 +1,139 @@
+/*
+ * ls1046a RDB - inmate demo
+ *
+ * Copyright NXP 2020
+ *
+ * Authors:
+ *  Jiafei Pan <jiafei.pan@nxp.com>
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
+	struct jailhouse_memory mem_regions[8];
+	struct jailhouse_irqchip irqchips[2];
+	struct jailhouse_pci_device pci_devices[1];
+} __attribute__((packed)) config = {
+	.cell = {
+		.signature = JAILHOUSE_CELL_DESC_SIGNATURE,
+		.revision = JAILHOUSE_CONFIG_REVISION,
+		.name = "inmate-demo",
+		.flags = JAILHOUSE_CELL_PASSIVE_COMMREG,
+
+		.cpu_set_size = sizeof(config.cpus),
+		.num_memory_regions = ARRAY_SIZE(config.mem_regions),
+		.num_irqchips = ARRAY_SIZE(config.irqchips),
+		.num_pci_devices = ARRAY_SIZE(config.pci_devices),
+		.vpci_irq_base = 60 - 32,	/* vPCI INTx */
+
+		.console = {
+			.address = 0x21c0600,	/* Uart1 in DUART1 */
+			.divider = 0xbd, /* baudrate: 115200 */
+			.type = JAILHOUSE_CON_TYPE_8250,
+			.flags = JAILHOUSE_CON_ACCESS_MMIO |
+				JAILHOUSE_CON_REGDIST_1,
+		},
+	},
+
+	.cpus = {
+		0x8,
+	},
+
+	.mem_regions = {
+		/* IVSHMEM shared memory region for 00:00.0 */ {
+			.phys_start = 0xfb700000,
+			.virt_start = 0xfb700000,
+			.size = 0x1000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED,
+		},
+		{
+			.phys_start = 0xfb701000,
+			.virt_start = 0xfb701000,
+			.size = 0x9000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_ROOTSHARED,
+		},
+		{
+			.phys_start = 0xfb70a000,
+			.virt_start = 0xfb70a000,
+			.size = 0x2000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED,
+		},
+		{
+			.phys_start = 0xfb70c000,
+			.virt_start = 0xfb70c000,
+			.size = 0x2000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_ROOTSHARED,
+		},
+		{
+			.phys_start = 0xfb70e000,
+			.virt_start = 0xfb70e000,
+			.size = 0x2000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED,
+		},
+		/* DUART1 */ {
+			.phys_start = 0x21c0000,
+			.virt_start = 0x21c0000,
+			.size = 0x10000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO | JAILHOUSE_MEM_ROOTSHARED,
+		},
+		/* RAM: Top at 2GB DRAM1 Space */ {
+			.phys_start = 0xc0000000,
+			.virt_start = 0,
+			.size = 0x00010000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_LOADABLE,
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
+		/* GIC-400 */ {
+			.address = 0x1410000,
+			.pin_base = 32,
+			.pin_bitmap = {
+				1 << (60 - 32), /* vPCI */
+				0,
+				0,
+				0,
+			},
+		},
+		/* GIC-400 */ {
+			.address = 0x1410000,
+			.pin_base = 160,
+			.pin_bitmap = {
+				0,
+				0,
+				0,
+				0,
+			},
+		},
+	},
+
+	.pci_devices = {
+		{ /* IVSHMEM 00:00.0 (demo) */
+			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
+			.domain = 0,
+			.bdf = 0 << 3,
+			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
+			.shmem_regions_start = 0,
+			.shmem_dev_id = 1,
+			.shmem_peers = 1,
+			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_UNDEFINED,
+		},
+	},
+
+};
diff --git a/configs/arm64/ls1046a-rdb-linux-demo.c b/configs/arm64/ls1046a-rdb-linux-demo.c
new file mode 100644
index 00000000..6bba61fb
--- /dev/null
+++ b/configs/arm64/ls1046a-rdb-linux-demo.c
@@ -0,0 +1,165 @@
+/*
+ * ls1046a RDB target - linux-demo
+ *
+ * Copyright 2020 NXP
+ *
+ * Authors:
+ *  Jiafei Pan <jiafei.pan@nxp.com>
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
+	struct jailhouse_memory mem_regions[16];
+	struct jailhouse_irqchip irqchips[2];
+	struct jailhouse_pci_device pci_devices[2];
+} __attribute__((packed)) config = {
+	.cell = {
+		.signature = JAILHOUSE_CELL_DESC_SIGNATURE,
+		.revision = JAILHOUSE_CONFIG_REVISION,
+		.name = "linux-inmate-demo",
+		.flags = JAILHOUSE_CELL_PASSIVE_COMMREG,
+
+		.cpu_set_size = sizeof(config.cpus),
+		.num_memory_regions = ARRAY_SIZE(config.mem_regions),
+		.num_irqchips = ARRAY_SIZE(config.irqchips),
+		.num_pci_devices = ARRAY_SIZE(config.pci_devices),
+		.vpci_irq_base = 60 - 32,  /* vPCI INTx: 60,61,62,63 */
+	},
+
+	.cpus = {
+		0xc,
+	},
+
+	.mem_regions = {
+		/* IVSHMEM shared memory region for 00:00.0 */ {
+			.phys_start = 0xfb700000,
+			.virt_start = 0xfb700000,
+			.size = 0x1000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED,
+		},
+		{
+			.phys_start = 0xfb701000,
+			.virt_start = 0xfb701000,
+			.size = 0x9000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_ROOTSHARED,
+		},
+		{
+			.phys_start = 0xfb70a000,
+			.virt_start = 0xfb70a000,
+			.size = 0x2000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED,
+		},
+		{
+			.phys_start = 0xfb70c000,
+			.virt_start = 0xfb70c000,
+			.size = 0x2000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED,
+		},
+		{
+			.phys_start = 0xfb70e000,
+			.virt_start = 0xfb70e000,
+			.size = 0x2000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_ROOTSHARED,
+		},
+		/* IVSHMEM shared memory regions for 00:01.0 (networking) */
+		JAILHOUSE_SHMEM_NET_REGIONS(0xfb800000, 1),
+		/* DUART1 */ {
+			.phys_start = 0x21c0000,
+			.virt_start = 0x21c0000,
+			.size = 0x1000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO | JAILHOUSE_MEM_ROOTSHARED,
+		},
+		/* clockgen */ {
+                        .phys_start = 0x01ee1000,
+                        .virt_start = 0x01ee1000,
+                        .size = 0x1000,
+                        .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+                                JAILHOUSE_MEM_IO | JAILHOUSE_MEM_ROOTSHARED,
+                },
+		/* dcfg */ {
+			.phys_start = 0x01ee0000,
+			.virt_start = 0x01ee0000,
+			.size = 0x1000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* RAM */ {
+			.phys_start = 0xbf900000,
+			.virt_start = 0,
+			.size = 0x00010000, /* 64K */
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_LOADABLE,
+		},
+		/* RAM: Top at DRAM1 2GB Space */ {
+			.phys_start = 0xc0000000,
+			.virt_start = 0xc0000000,
+			.size = 0x3b500000,
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
+		/* GIC-400 */ {
+			.address = 0x1410000,
+			.pin_base = 32,
+			.pin_bitmap = {
+				1 << (60 -32)  | 1 << (61 - 32) |
+					1 << (62 - 32) | 1 << (63 -32), /* vPCI */
+				0,
+				0,
+				0,
+			},
+		},
+		/* GIC-400 */ {
+			.address = 0x1410000,
+			.pin_base = 160,
+			.pin_bitmap = {
+				0,
+				0,
+				0,
+				0,
+			},
+		},
+	},
+
+	.pci_devices = {
+		{ /* IVSHMEM 00:00.0 (demo) */
+			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
+			.domain = 0,
+			.bdf = 0 << 3,
+			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
+			.shmem_regions_start = 0,
+			.shmem_dev_id = 2,
+			.shmem_peers = 3,
+			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_UNDEFINED,
+		},
+		{ /* IVSHMEM 00:01.0 (networking) */
+			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
+			.domain = 0,
+			.bdf = 1 << 3,
+			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
+			.shmem_regions_start = 5,
+			.shmem_dev_id = 1,
+			.shmem_peers = 2,
+			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VETH,
+		},
+	},
+};
diff --git a/configs/arm64/ls1046a-rdb.c b/configs/arm64/ls1046a-rdb.c
new file mode 100644
index 00000000..d05c1628
--- /dev/null
+++ b/configs/arm64/ls1046a-rdb.c
@@ -0,0 +1,517 @@
+/*
+ * ls1046a RDB target - linux-demo
+ *
+ * Copyright 2020 NXP
+ *
+ * Authors:
+ *  Jiafei Pan <jiafei.pan@nxp.com>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2.  See
+ * the COPYING file in the top-level directory.
+ */
+
+#include <jailhouse/types.h>
+#include <jailhouse/cell-config.h>
+
+struct {
+	struct jailhouse_system header;
+	__u64 cpus[1];
+	struct jailhouse_memory mem_regions[64];
+	struct jailhouse_irqchip irqchips[2];
+	struct jailhouse_pci_device pci_devices[2];
+} __attribute__((packed)) config = {
+	.header = {
+		.signature = JAILHOUSE_SYSTEM_SIGNATURE,
+		.revision = JAILHOUSE_CONFIG_REVISION,
+		.flags = JAILHOUSE_SYS_VIRTUAL_DEBUG_CONSOLE,
+		.hypervisor_memory = {
+			.phys_start = 0xfba00000,
+			.size =       0x00400000,
+		},
+		.debug_console = {
+			.address = 0x21c0500, /* Uart0 in DUART1 */
+			.size = 0x100,
+			.type = JAILHOUSE_CON_TYPE_8250,
+			.flags = JAILHOUSE_CON_ACCESS_MMIO |
+				 JAILHOUSE_CON_REGDIST_1,
+		},
+		.platform_info = {
+			.pci_mmconfig_base = 0xfb500000,
+			.pci_mmconfig_end_bus = 0,
+			.pci_is_virtual = 1,
+			.pci_domain = -1,
+
+			.arm = {
+				.gic_version = 2,
+				.gicd_base = 0x1410000,
+				.gicc_base = 0x142f000,
+				.gich_base = 0x1440000,
+				.gicv_base = 0x146f000,
+				.maintenance_irq = 25,
+			},
+		},
+		.root_cell = {
+			.name = "ls1046a",
+			.num_pci_devices = ARRAY_SIZE(config.pci_devices),
+			.cpu_set_size = sizeof(config.cpus),
+			.num_memory_regions = ARRAY_SIZE(config.mem_regions),
+			.num_irqchips = ARRAY_SIZE(config.irqchips),
+			.vpci_irq_base = 67 - 32, /* Not include 32 base */
+		},
+	},
+
+	.cpus = {
+		0xf,
+	},
+
+	.mem_regions = {
+		/* IVSHMEM shared memory region for 00:00.0 */ {
+			.phys_start = 0xfb700000,
+			.virt_start = 0xfb700000,
+			.size = 0x1000,
+			.flags = JAILHOUSE_MEM_READ,
+		},
+		{
+			.phys_start = 0xfb701000,
+			.virt_start = 0xfb701000,
+			.size = 0x9000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
+		},
+		{
+			.phys_start = 0xfb70a000,
+			.virt_start = 0xfb70a000,
+			.size = 0x2000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
+		},
+		{
+			.phys_start = 0xfb70c000,
+			.virt_start = 0xfb70c000,
+			.size = 0x2000,
+			.flags = JAILHOUSE_MEM_READ,
+		},
+		{
+			.phys_start = 0xfb70e000,
+			.virt_start = 0xfb70e000,
+			.size = 0x2000,
+			.flags = JAILHOUSE_MEM_READ,
+		},
+		/* IVSHMEM shared memory regions for 00:01.0 (networking) */
+		JAILHOUSE_SHMEM_NET_REGIONS(0xfb800000, 0),
+		/* RAM - 1GB at DRAM1 region - root cell */ {
+			.phys_start = 0x80000000,
+			.virt_start = 0x80000000,
+			.size = 0x40000000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_EXECUTE,
+		},
+		/* DRAM2 6GB */ {
+			.phys_start = 0x880000000,
+			.virt_start = 0x880000000,
+			.size = 0x180000000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_EXECUTE,
+		},
+		/* RAM: Inmate */ {
+			.phys_start = 0xc0000000,
+			.virt_start = 0xc0000000,
+			.size = 0x3b500000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_EXECUTE,
+		},
+		/* RAM: loader */ {
+			.phys_start = 0xbf900000,
+			.virt_start = 0xbf900000,
+			.size = 0x00100000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_EXECUTE,
+		},
+		/* DDR memory controller */ {
+			.phys_start = 0x01080000,
+			.virt_start = 0x01080000,
+			.size =	          0x1000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* IFC */ {
+			.phys_start = 0x01530000,
+			.virt_start = 0x01530000,
+			.size =	         0x10000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* QSPI */ {
+			.phys_start = 0x01550000,
+			.virt_start = 0x01550000,
+			.size = 0x10000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* esdhc */ {
+			.phys_start = 0x01560000,
+			.virt_start = 0x01560000,
+			.size = 0x10000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* scfg */ {
+			.phys_start = 0x01570000,
+			.virt_start = 0x01570000,
+			.size = 0x10000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* crypto */ {
+			.phys_start = 0x01700000,
+			.virt_start = 0x01700000,
+			.size = 0x100000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* qman */ {
+			.phys_start = 0x01880000,
+			.virt_start = 0x01880000,
+			.size = 0x10000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+                /* bman */ {
+                        .phys_start = 0x01890000,
+                        .virt_start = 0x01890000,
+                        .size = 0x10000,
+                        .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+                                JAILHOUSE_MEM_IO,
+                },
+		/* fman */ {
+			.phys_start = 0x01a00000,
+			.virt_start = 0x01a00000,
+			.size = 0x100000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* qportals CE */ {
+			.phys_start = 0x500000000,
+			.virt_start = 0x500000000,
+			.size = 0x4000000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
+		},
+		/* qportals CI */ {
+			.phys_start = 0x504000000,
+			.virt_start = 0x504000000,
+			.size = 0x4000000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* bportals CE */ {
+			.phys_start = 0x508000000,
+			.virt_start = 0x508000000,
+			.size = 0x4000000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
+		},
+		/* bportals CI */ {
+			.phys_start = 0x50c000000,
+			.virt_start = 0x50c000000,
+			.size = 0x4000000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* dcfg */ {
+			.phys_start = 0x01ee0000,
+			.virt_start = 0x01ee0000,
+			.size = 0x1000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+                /* clockgen */ {
+                        .phys_start = 0x01ee1000,
+                        .virt_start = 0x01ee1000,
+                        .size = 0x1000,
+                        .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+                                JAILHOUSE_MEM_IO,
+                },
+		/* rcpm */ {
+			.phys_start = 0x01ee2000,
+			.virt_start = 0x01ee2000,
+			.size = 0x1000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* tmu */ {
+			.phys_start = 0x01f00000,
+			.virt_start = 0x01f00000,
+			.size = 0x10000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* dspi */ {
+			.phys_start = 0x02100000,
+			.virt_start = 0x02100000,
+			.size = 0x10000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* i2c0 */ {
+			.phys_start = 0x02180000,
+			.virt_start = 0x02180000,
+			.size = 0x10000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* i2c1 */ {
+			.phys_start = 0x02190000,
+			.virt_start = 0x02190000,
+			.size = 0x10000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* i2c2 */ {
+			.phys_start = 0x021a0000,
+			.virt_start = 0x021a0000,
+			.size = 0x10000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* i2c3 */ {
+			.phys_start = 0x021b0000,
+			.virt_start = 0x021b0000,
+			.size = 0x10000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* duart1 */ {
+			.phys_start = 0x021c0000,
+			.virt_start = 0x021c0000,
+			.size = 0x10000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* duart2 */ {
+			.phys_start = 0x021d0000,
+			.virt_start = 0x021d0000,
+			.size = 0x10000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* gpio0 */ {
+			.phys_start = 0x02300000,
+			.virt_start = 0x02300000,
+			.size = 0x10000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* gpio1 */ {
+			.phys_start = 0x02310000,
+			.virt_start = 0x02310000,
+			.size = 0x10000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* gpio2 */ {
+			.phys_start = 0x02320000,
+			.virt_start = 0x02320000,
+			.size = 0x10000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* gpio3 */ {
+			.phys_start = 0x02330000,
+			.virt_start = 0x02330000,
+			.size = 0x10000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* lpuart0 */ {
+			.phys_start = 0x02950000,
+			.virt_start = 0x02950000,
+			.size = 0x1000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* lpuart1 */ {
+			.phys_start = 0x02960000,
+			.virt_start = 0x02960000,
+			.size = 0x1000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* lpuart2 */ {
+			.phys_start = 0x02970000,
+			.virt_start = 0x02970000,
+			.size = 0x1000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* lpuart3 */ {
+			.phys_start = 0x02980000,
+			.virt_start = 0x02980000,
+			.size = 0x1000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* lpuart4 */ {
+			.phys_start = 0x02990000,
+			.virt_start = 0x02990000,
+			.size = 0x1000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* lpuart5 */ {
+			.phys_start = 0x029a0000,
+			.virt_start = 0x029a0000,
+			.size = 0x1000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* wdog0 */ {
+			.phys_start = 0x02ad0000,
+			.virt_start = 0x02ad0000,
+			.size = 0x10000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* edma0 */ {
+			.phys_start = 0x02c00000,
+			.virt_start = 0x02c00000,
+			.size = 0x30000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* usb0 */ {
+			.phys_start = 0x02f00000,
+			.virt_start = 0x02f00000,
+			.size = 0x100000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* usb1 */ {
+			.phys_start = 0x03000000,
+			.virt_start = 0x03000000,
+			.size = 0x100000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* usb2 */ {
+			.phys_start = 0x03100000,
+			.virt_start = 0x03100000,
+			.size = 0x100000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* sata */ {
+			.phys_start = 0x03200000,
+			.virt_start = 0x03200000,
+			.size = 0x10000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* msi1 */ {
+			.phys_start = 0x01580000,
+			.virt_start = 0x01580000,
+			.size = 0x10000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* msi2 */ {
+			.phys_start = 0x01590000,
+			.virt_start = 0x01590000,
+			.size = 0x10000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* msi3 */ {
+			.phys_start = 0x015a0000,
+			.virt_start = 0x015a0000,
+			.size = 0x10000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* pcie0 */ {
+			.phys_start = 0x03400000,
+			.virt_start = 0x03400000,
+			.size = 0x10000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* pcie1 */ {
+			.phys_start = 0x03500000,
+			.virt_start = 0x03500000,
+			.size = 0x10000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* pcie2 */ {
+			.phys_start = 0x03600000,
+			.virt_start = 0x03600000,
+			.size = 0x10000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* pcie2 pf0 */ {
+			.phys_start = 0x036c0000,
+			.virt_start = 0x036c0000,
+			.size = 0x10000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* PCI host bridge 0 */ {
+			.phys_start = 0x4000000000,
+			.virt_start = 0x4000000000,
+			.size = 0x800000000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* PCI host bridge 1 */ {
+			.phys_start = 0x4800000000,
+			.virt_start = 0x4800000000,
+			.size = 0x800000000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* PCI host bridge 2 */ {
+			.phys_start = 0x5000000000,
+			.virt_start = 0x5000000000,
+			.size = 0x800000000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+	},
+
+	.irqchips = {
+		/* GIC */ {
+			.address = 0x1410000,
+			.pin_base = 32,
+			.pin_bitmap = {
+				0xffffffff, 0xffffffff, 0xffffffff, 0xffffffff
+			},
+		},
+		/* GIC */ {
+			.address = 0x1410000,
+			.pin_base = 160,
+			.pin_bitmap = {
+				0xffffffff, 0xffffffff, 0xffffffff, 0xffffffff
+			},
+		},
+	},
+
+	.pci_devices = {
+		{ /* IVSHMEM 00:00.0 (demo) */
+			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
+			.domain = 0,
+			.bdf = 0 << 3,
+			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
+			.shmem_regions_start = 0,
+			.shmem_dev_id = 0,
+			.shmem_peers = 3,
+			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_UNDEFINED,
+		},
+		{ /* IVSHMEM 00:01.0 (networking) */
+			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
+			.domain = 0,
+			.bdf = 1 << 3,
+			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
+			.shmem_regions_start = 5,
+			.shmem_dev_id = 0,
+			.shmem_peers = 2,
+			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VETH,
+		},
+	},
+};
-- 
2.17.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20201204034516.20000-1-Jiafei.Pan%40nxp.com.
