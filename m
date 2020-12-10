Return-Path: <jailhouse-dev+bncBAABBCP2Y77AKGQEZIWPXHA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x53f.google.com (mail-ed1-x53f.google.com [IPv6:2a00:1450:4864:20::53f])
	by mail.lfdr.de (Postfix) with ESMTPS id 32F7B2D5884
	for <lists+jailhouse-dev@lfdr.de>; Thu, 10 Dec 2020 11:48:42 +0100 (CET)
Received: by mail-ed1-x53f.google.com with SMTP id dc6sf2238707edb.14
        for <lists+jailhouse-dev@lfdr.de>; Thu, 10 Dec 2020 02:48:42 -0800 (PST)
ARC-Seal: i=3; a=rsa-sha256; t=1607597322; cv=pass;
        d=google.com; s=arc-20160816;
        b=odyiKer5AffaYxRZ9WFz+cLZauU7qMhwKv7uJmidWodVhliMQjKMTsRevlJWBas8Nv
         uXl6tDm4AGD6lbQhJWPKzkeBc/LF7lw9PLqIovgn+4Ex6ez5Myvrsnf7QpZ/GirhTS05
         FnkikqoQR05J6LKBOIi5vXsRZWpBuQLNQZmUjn8OPKAMmudvXOJ3p1xNLzIC+RZ1PzAu
         KjoNdis3LoPDgWZplAh7kL/ZGWNMRxA6pO/VYET5h2isdaBNn9NWCJFslFHnrRaaebM0
         7RZCNjjUHp7OxOOSY0PO4epEAMMRXlSFaXCixjFINgyVnMHvIRX2uhnftOxHUSqyxSEd
         P6tw==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:message-id:date
         :subject:to:from:sender:dkim-signature;
        bh=459/IcTshUTvFnR1TstUEsG4hvYOQreCsLDPb+a1dtI=;
        b=jPa4E4kwqL/yrbF96Q50zT8WN3JCeY4MSYsL8OYqez4aWkZlWJ6sJEhBFk4BIY9Ynx
         itzMq4aVojAB6X+OxthdO2gWpxHAokT4gI+VaJ65UEyn8saakw5qn+AE5IF5fFe5JPoe
         /pW1Hg88jRTXJ/x2GlRuvDa9YE7SwX+FYyzeh1oMN7NzEC/iZxeDQaC+tzjae+bPtA2j
         za+Rd1+70k0veC+nStjF1fOlYgI2JyZNQEpLnzkH4xkKQGmXsPqMviWCPSd+5I5oMuhB
         qL03YbPUC2RtQH5zr8DAeMK7NIf2BD1/3A0EZIMv4a97Uc/z9vgKbzDLv0dM7TRT3Z3u
         ndnw==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=mLsTXORI;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of hongbo.wang@nxp.com designates 40.107.6.75 as permitted sender) smtp.mailfrom=hongbo.wang@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:date:message-id:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=459/IcTshUTvFnR1TstUEsG4hvYOQreCsLDPb+a1dtI=;
        b=PSXStBf/Wizhsj/73hFoKPFQUEw2qHMKm8S/3T2A8b/VVnon0Fs1z0zRk4tG4GcvZV
         7Sug41VWeOTAxRc7x5xmyAriSnZaHgpV8CUvBgC5GMGJ1S/5VegpeGo+KMQdYFFQRCIo
         5YcXmXJmfFce84f/RjBuTklwhndckP3pwyQj9nBuOv17x+20v1Sbg9wD7oTmtrLx4Mm2
         t+ZF0mTf+PZiZA4lCJf1hVbM1IREn29KXkKKaXw02JyH4dUsc2hqReKC7lFGTMaPc51N
         3z+oHyb1dSmCI5oRIDB9iFuSakTWVei8DvEgsMZzHpjpPUoDYaxctHRlo+3rqPJ53UFW
         5pyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:date:message-id
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=459/IcTshUTvFnR1TstUEsG4hvYOQreCsLDPb+a1dtI=;
        b=elS9mmJXV6t/8B5LWR79JV+QNgnz6CZkJuXSIYpnXjwC/k6NVRNqYPuIOqT7MKVguO
         5wq7xTLA9MNxHEKDA5/pfK3Mg9O/2Bf5GIzJs8lVNlseahaCBnXgxOoDU4IvrYoXlzWO
         +e3aEV0IG+tqcAJTyiYfyWsxeE1fE6sTHj5BjeQyFYpbjall44/wYCBW/vmVjr4dKaQ9
         sCtg8r2woYVQK8rrgmZuHWYtAavpyEAj5qewyHxeeLd7S9XznFpwJTgb/UE7GB0gMA3a
         btnTjN6Fnn8HRWEJ/0XhzcWUkAUOTGc4+AU6lJFKTvI8ZciO8woZIAAwx1G6jxdGPVDL
         S30A==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533+j6R2GMGBsF1Ifn47jL8SBnBxd7qGtENDmZ/WwTTF7k6XkkY9
	zKikkPXWziJXBE3T+Q2rKsE=
X-Google-Smtp-Source: ABdhPJy0aL8UPuo2rhfZJa+03SSRhQVoue35/THQwSUvNjp9kp0SjIYTNQRcCaMHlpuQ18M0ou+Fxg==
X-Received: by 2002:a05:6402:610:: with SMTP id n16mr6004005edv.172.1607597321994;
        Thu, 10 Dec 2020 02:48:41 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:906:a190:: with SMTP id s16ls2114394ejy.3.gmail; Thu, 10
 Dec 2020 02:48:41 -0800 (PST)
X-Received: by 2002:a17:906:f05:: with SMTP id z5mr5963663eji.8.1607597321208;
        Thu, 10 Dec 2020 02:48:41 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1607597321; cv=pass;
        d=google.com; s=arc-20160816;
        b=WFLjY/YSHDdPIyzwmNoj7nhgE9FtLT+35Hfz8SiO7qyasI6ZZetCXk20nNTydjhJcf
         T3/KuDGKeAYxA2OzYJ8Alxi/iloVyVFYbi1EJjCXTbf9Gz/GrxKO53o+b3YqOTemrqDN
         i+noGyIxKU0eaHn5uGgPgmSL1NG3HM8FrgSdKGABoMhMVEgQi43V9bsPYiNF6PGzWbxV
         iL3SkDYVK0f0ICWEU/oP9OreRjSvN4NtzwaNlnyNSH2dIBqOACrJVSjytWhhtvsVn19D
         qEAKCSD0J+/5ZuBAqy3LWeKBk5WPKkd/UI9vhnxT0AxOlWEWuTLmogWRn4zirKa5/Ovs
         azZQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=Q7GGRaeuyYUHu/Ne4NgF2zGEXU4Xg72CytR72Uq6xNk=;
        b=NCNL6zdw7cZTcH6QsFPBtJaeWo14ep0wKmlbWlXobTs8P91vfdNUfIg3YxoOozXXHX
         C0mjdSGG84wydo5kMfCXoowAKp9QxZmZvMsA6BXHEFqHNRbXdIQq/ddO5zf7MJN4LOiB
         yf5zvvl9OWGaH9ch+4qKb0oN8N8+asCbiM6H3J/chyZL4XyI5w/hEY4QDPGo1KDnj5uV
         BtSf64Ey8+LeDCqOrPSiG6151nnZqUFrfT6TtvOlfbQZo8gGhupJpFqnJd4CafHanxtQ
         7Vzg423v2QK3xvsQbxjEzqBN17yaR58JvqfKUmZB9aTERECKKJBeFItGPzxBUyjQD4O+
         T5AA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=mLsTXORI;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of hongbo.wang@nxp.com designates 40.107.6.75 as permitted sender) smtp.mailfrom=hongbo.wang@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (mail-eopbgr60075.outbound.protection.outlook.com. [40.107.6.75])
        by gmr-mx.google.com with ESMTPS id f26si134211ejx.0.2020.12.10.02.48.41
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 10 Dec 2020 02:48:41 -0800 (PST)
Received-SPF: pass (google.com: domain of hongbo.wang@nxp.com designates 40.107.6.75 as permitted sender) client-ip=40.107.6.75;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GUZkLhXPYcR5b1z0HEC2IozDdhyK+8/20nKhD4ILWLUopcF3SfnqpHWxPE00vAMGZdcOZbL1Mr5ySO+DUs4/I7EWfaUV27rGR1KC//hQ8v3WNU+2H/Gv+skdOFKRxKSs/JuZHrmrqWzsWLl+SPeAN35/7CtqPAZnVWijMY1rBlsL9G4rSiFcyCDAFkXsFSDGEe2eLJfF/lGyXWnRTdH2dywtIvTQ1WjEsxKJsgM3OF0yxey4z0qkQ61hY2s9MfqDd+4+c7tJwd36eVI2gvqZlLM3HTcsFLWTYb3C/w+BSvq1fk1ZXAn6YvhFlJayXEMjs1t/UUX1g1bWfRQf4dBUqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q7GGRaeuyYUHu/Ne4NgF2zGEXU4Xg72CytR72Uq6xNk=;
 b=ncBliy5WlnPlB3Dh3I4BHF7EPWmEbDjjqOuQjdEcCmUbJh1IsE/N6yQKByr82MJF5tC/yr2nAJDB0EKgRZ9mO87Htz8ptmu3j2SfiOxaTt/Jk2YceyKLzmunwW47HvViRZmR1p3S61bIZZJufl1UHtC8tG5+bMFeKlOj9encODkfAxOG688nmsY8TpSJgQWc4Nd7Vq3PKgAz5yCljeA/XZk3bQc4aWK5fh+LBvyxmK+z4xomBhS6WfhH7O1pfRifRyBeVT0YIkOslXl5RjFbDFtrPUFS+O2U8/n9Vsl2NNh6I6E7UiH30nZfT2Q7bsn1DlQEYJRf3KgXR3huVnbAYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
Received: from VI1PR04MB5677.eurprd04.prod.outlook.com (2603:10a6:803:ed::22)
 by VI1PR0402MB3664.eurprd04.prod.outlook.com (2603:10a6:803:1e::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.13; Thu, 10 Dec
 2020 10:48:40 +0000
Received: from VI1PR04MB5677.eurprd04.prod.outlook.com
 ([fe80::a8e4:608c:b05c:7565]) by VI1PR04MB5677.eurprd04.prod.outlook.com
 ([fe80::a8e4:608c:b05c:7565%7]) with mapi id 15.20.3632.023; Thu, 10 Dec 2020
 10:48:40 +0000
From: hongbo.wang@nxp.com
To: jailhouse-dev@googlegroups.com,
	jan.kiszka@siemens.com,
	mingkai.hu@nxp.com,
	hongbo.wang@nxp.com
Subject: [PATCH v1 0/2] Add configure files and dts for NXP ls1043a RDB platform
Date: Thu, 10 Dec 2020 18:51:26 +0800
Message-Id: <20201210105128.25554-1-hongbo.wang@nxp.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain; charset="UTF-8"
X-Originating-IP: [119.31.174.73]
X-ClientProxiedBy: SG2PR01CA0098.apcprd01.prod.exchangelabs.com
 (2603:1096:3:15::24) To VI1PR04MB5677.eurprd04.prod.outlook.com
 (2603:10a6:803:ed::22)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from whb-OptiPlex-790.ap.freescale.net (119.31.174.73) by SG2PR01CA0098.apcprd01.prod.exchangelabs.com (2603:1096:3:15::24) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.12 via Frontend Transport; Thu, 10 Dec 2020 10:48:38 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 5b34a4a1-9bca-49aa-6666-08d89cf927d9
X-MS-TrafficTypeDiagnostic: VI1PR0402MB3664:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR0402MB3664DC7D2A3AEDB9D8CB5257E1CB0@VI1PR0402MB3664.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1728;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GVl1tzwAF+8NZ8uVV6APBb1uJPwChIr6stpcjSptdIz6seipWYpYTXFY0ggGg+AzbvtPSCSbQD5Iu++cc0F1mT2TWZENJRnDrCTGto0KzIHVrSkC5vdezD4iebyeUG0Cb0UQ0JlMJ+L0sD9zn0T5ZupAhrz6iwpI8nFk64aPEOX8uhjpHRXkKsOeYVwMstNnYO436f6XUp1JwCpIy7f7NWYAvnj6wBECprFagXhWb0OiNjA3onOmvHBcAY7BSBoZA83TRJyrsfIueLfZ2QbS441TOkVWkJF4kh1AAtogaR+e2xdP7FE6GH3ndWDgsjlxAnPNoAhvjVTtL6DSeF3KtA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5677.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(376002)(366004)(396003)(136003)(39860400002)(6486002)(2906002)(956004)(6666004)(2616005)(86362001)(66556008)(66946007)(66476007)(5660300002)(478600001)(8676002)(8936002)(6506007)(316002)(9686003)(26005)(4744005)(16526019)(186003)(6512007)(36756003)(1076003)(52116002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?GQMkWsFmGg1t2fYHHDd4Utms9qUqUOjg2UDZ4PPcShB1DTNlRaDI0GL7zjLG?=
 =?us-ascii?Q?qkzTiDV/n2lkKfxz28roU1F1I5kvcMqLB5tp9seVur5STxyWHYxdau3xhps/?=
 =?us-ascii?Q?+IZjXRrpRCuzApnUIGTCSAbOJDU3LZ3tvbb9FVobRvVln5ih9mgZidn7qyi5?=
 =?us-ascii?Q?sgnHiPJKPwJQLhtNcaaAfTO/tPq6X0nYQlwPmha9T2VoRVeCrKUxtdYsokOq?=
 =?us-ascii?Q?2K3+sT1DO9e4Gh1HrtDoXVduSIst/O+xZK1x7VRwt7ffZQ+szOklo3wEze3l?=
 =?us-ascii?Q?Oay1urnn44wkct3U1oomny8euVo0yTTWjWonxZKR2jAHEp9LpLcaMecU/nHg?=
 =?us-ascii?Q?NEf2tg0CuAkoawqaOc60t2vDK4jIpGvnSvVrGaZ5842tkXDKYFQ+9kEiz9OT?=
 =?us-ascii?Q?BCk5wC1GkIqBANCNXez9y3evvsRql3WGHjV6zC2RDc9E5mXlNJDYI3VHQLFZ?=
 =?us-ascii?Q?abgCnHfxaG+QOHOUqVJMhZt4G+u0TwzibuYqmIWHy3tw8rYuNN0IoEtr9ohq?=
 =?us-ascii?Q?1C9prTAC7X63YpBlg4Pw9H3hpafJO4SxoQViOulpFNU4qr8KzO5QcnSWBE9j?=
 =?us-ascii?Q?L+O4ri+zq8lZHey8kekieZo4NyDfIggI6v7Y3r0vkCj3RdABEznmctJ+p25K?=
 =?us-ascii?Q?uzALPgZ7TmUF9Zm10QssTeNkg0ZAwHSpPitgSXwV7Tcd/6p+NbFbh8uMjIr4?=
 =?us-ascii?Q?0GjekmW5EfHaSmIzrMKFYDT3XXz2x/eGBOHzmaOfjiCQxixMGe7aRZ9a2Ywz?=
 =?us-ascii?Q?VO+6+sN7Wz264FZLAHdGIQIfjtJqR+x+ueRk85PvQN0h7p9mgM6L3g5W9jnr?=
 =?us-ascii?Q?gqebfgE/HMm2tvHkptOKa40OvU8wE0u33Nv9riCFJ3rV+JfTHTgRBOHEegCN?=
 =?us-ascii?Q?ouITTZrBO6aMQ+9fohZFwH0oRcpz+I7YMmA5wQ9Yh+p7H5GkSHi3d2FarDcm?=
 =?us-ascii?Q?O6DXCjAm6wu6/Z3QiYIb5oso9E+PVHtYvd24pE0Ud+PBQBEf9Xj8PLVgZtS0?=
 =?us-ascii?Q?R/hz?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5677.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Dec 2020 10:48:40.0714
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b34a4a1-9bca-49aa-6666-08d89cf927d9
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +gi0KBC0o2lJXiyIy1puHhqPrNakA70V5SxGZrKCBp0QIhv2e7ruK9+G0Pmaxemw+KTUkbuNSocgdWMamQAYTA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3664
X-Original-Sender: hongbo.wang@nxp.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@nxp.com header.s=selector2 header.b=mLsTXORI;       arc=pass (i=1
 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass
 fromdomain=nxp.com);       spf=pass (google.com: domain of
 hongbo.wang@nxp.com designates 40.107.6.75 as permitted sender)
 smtp.mailfrom=hongbo.wang@nxp.com;       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
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

From: "hongbo.wang" <hongbo.wang@nxp.com>

hongbo.wang (2):
  configs: ls1043a-rdb: add cell configure files
  configs: ls1043a-rdb: Add linux inmate dts demo

 configs/arm64/dts/inmate-ls1043a-rdb.dts | 176 ++++++++
 configs/arm64/ls1043a-rdb-inmate-demo.c  | 137 +++++++
 configs/arm64/ls1043a-rdb-linux-demo.c   | 165 ++++++++
 configs/arm64/ls1043a-rdb.c              | 498 +++++++++++++++++++++++
 4 files changed, 976 insertions(+)
 create mode 100644 configs/arm64/dts/inmate-ls1043a-rdb.dts
 create mode 100644 configs/arm64/ls1043a-rdb-inmate-demo.c
 create mode 100644 configs/arm64/ls1043a-rdb-linux-demo.c
 create mode 100644 configs/arm64/ls1043a-rdb.c

-- 
2.17.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20201210105128.25554-1-hongbo.wang%40nxp.com.
