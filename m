Return-Path: <jailhouse-dev+bncBDAMFR7JZAEBBU76WL4QKGQES62UWUQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23d.google.com (mail-lj1-x23d.google.com [IPv6:2a00:1450:4864:20::23d])
	by mail.lfdr.de (Postfix) with ESMTPS id BEE6323E5ED
	for <lists+jailhouse-dev@lfdr.de>; Fri,  7 Aug 2020 04:41:24 +0200 (CEST)
Received: by mail-lj1-x23d.google.com with SMTP id z9sf103088ljj.21
        for <lists+jailhouse-dev@lfdr.de>; Thu, 06 Aug 2020 19:41:24 -0700 (PDT)
ARC-Seal: i=3; a=rsa-sha256; t=1596768084; cv=pass;
        d=google.com; s=arc-20160816;
        b=WM3oPCFjYO4CTwhfUXkkgi7NK2LmL9eimxGFerM/btnYOofsH4h/y5sbS7TlF7iamE
         a2dMBtsJfLg1gcw9NIUx7IOV6iAEtFWipKNLTaJxJe0gJbn98YQSVTOX7ELVuha8ClNH
         Jf4ZmxNBSYynuaNPQbZqCS4FDqU0+6ADQkQGz5UvNa6IDcZ3BtzGtlWipTFP3iDCilRp
         efD2diEl2ONrUeuIgaQEf5aj2PYjzxSnlIViTa1KFPgQUDenb5BagaJXuVz3vBzK+hRG
         O/cyFS8x4GzvLaL9BfoWxCjySLdCnpV5o6LOj9j5EGr7VLgas67pt4zlqOG7Jzle08q+
         pPFw==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:message-id:date
         :subject:cc:to:from:sender:dkim-signature;
        bh=pNSNSwyc90ZT95KtXvUb2tVit9OWGGl7mNkQ2HxfG6A=;
        b=Ze/H9t70mgjd/cZ7ynM4vqRCYIHIte4xWfsYiEaf5eP+2Cavq8iJr2ImEqEIZZYCqj
         y0Y/Zgz5Q5xAqdGq+nLYdd38jLCqBGW5md6YKZdU5CUam60ZMSPB6yCQYgTFduo+KfjU
         nIVuoMfxI2/cRRGeIkaHSKncDvBKZXEmm4QSj1eZhzDP4JBlLZAtqhY8OgB9XotZBlaE
         bKNEDTxoamGSguxftYHNZ84rx3q3uhW4UUR9sk8357cvalxDzY1ZfyKam/+GQiRNGoU1
         uAIQS2Ba1xnb9pFG71b4VstCrnWRVWUjU34y8zyv87H6uoPjbwkbhtupebyZ1URrRLYF
         Fo7A==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=iurdIxq8;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of peng.fan@nxp.com designates 40.107.15.71 as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=pNSNSwyc90ZT95KtXvUb2tVit9OWGGl7mNkQ2HxfG6A=;
        b=ip1SvMnlG55n9s3U2f0wIiUAhNoqY0726Nw44PG3TVeH8B2Nf0cDpz8JItItjlb9Fi
         p9Uw6pKir8Jj5UBPe5LyDQx1tYX17Xozs/pbk0c+kB3MSOlHMSxx5Uo/SV2hnFqVTGuS
         tkj69G1z+M4CyS3pF3vNeX82NxJnfNS0o6VT1fPafMeDUbABcrFoDKMf58RQvKbcYgB2
         I0PHroVxiiVG0A37+anavHFvnztAkTpH3qCAsOSn4xs2lGObxaLl1mllyXYm+jINnUjX
         /bjyKWkutfK/c2owuqN5RFrOkCvwHnE6uZqMjAWhZ16EazF0IEyKdN5Rl598iAD6jCgy
         24/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=pNSNSwyc90ZT95KtXvUb2tVit9OWGGl7mNkQ2HxfG6A=;
        b=YA0CMxwJwJRfHSmDPyQ5eSOwuG7xu6kiruwmyycLI1ZKcdRyv9ssQOZMSd8NNYpLu3
         dQP3nNgNvfoRGiT9GxNDILhDx1cPa3vhIpbQnX8w8FV+8+pmZZtNa8/oKQj6kAijVeGC
         bdpxBGD2k7+Wn1txzrCFYJmGspKJGs8ekSSqKACj1FndbfclHsOxSBI9jBpFBb8GpCCV
         Q1yR1FpFIayT+3zi2r85z0SXAmglQD+APrRqkT1BmkY50pIXnIEsbqu+vlpEuVCEddfb
         XYipPAACQQ0vfzAZ/kao0TlFfzinZQ7msCaYBH/0v98aEdxdz3UwcLze0Wg9Qz+wGa+Y
         RDjQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531G8Ay2DD4e3cYKaAuSaP4GsSzcoMHjITTSgmAHGhjEn4RH+D+q
	hQ9xxwxMEir1pJDWeTRXC/4=
X-Google-Smtp-Source: ABdhPJxz6XYl6SYlmhw3Ixi1vNTgw8yMF7VC0hi1ihlwA0pU8xOl2hAUBI/Hu4/W363mJWDEWoQTUg==
X-Received: by 2002:a05:651c:91:: with SMTP id 17mr5308676ljq.173.1596768084145;
        Thu, 06 Aug 2020 19:41:24 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a19:60e:: with SMTP id 14ls2188250lfg.0.gmail; Thu, 06 Aug
 2020 19:41:23 -0700 (PDT)
X-Received: by 2002:a19:3f07:: with SMTP id m7mr5182132lfa.68.1596768083289;
        Thu, 06 Aug 2020 19:41:23 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1596768083; cv=pass;
        d=google.com; s=arc-20160816;
        b=cVqR6i1NBOkAiaGOd81SfJEVZ0q67jVQF56g3NpSTeFaDY1acsBoFPDv/5ANBMUbED
         6e096xF3VMVKvVg/MbUAbh88eR6/fzPWOC1yUEv5blQv0sAUQVBPng0b6qDYvMwFME48
         IAkl9FxryeK/UdLJIGvUZBOhdDQF5il6W48qaKgJugrk1hGDaAnJpS9GgHH0WLphb6cH
         f1YOOfUZ7LIk8NtDqxDyPgG8E0wONncV24WY5/U3P6GzfcUGvjTuI6c1qhL+IZc+vAq2
         VpaofBY2TsVM6rwpXKqWvvHtY3qGnwB3gkpgV8ahrfAEqifLCagVIAvaStrFarQRg13k
         9JRg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=yiu8Orq3EPL/NxpeuCINDKw9SAI8Twb0VJ8kkXETZ8M=;
        b=Fu3eQ3uPgynPkDN/29gms6vb7YCTDX/EYbxgX72TxdFEk9Ao5991J0e82w6ULRWxdP
         GfQJuJUWkFHn8YERQdUoJwiVB7+F8fJ/45WfE6ceTChkTPNPCLH1OJVmtWst/tUCoivD
         hbiL29jmu5okOGdnrcI0Hn/tKT1ChpVzm33DdRAjzx4E4ZBYOnVNnBNgrFheA94ARzln
         AVQzQ0Cavis6IEg/eNYtJe2kyjiVff+TF/zf05oW4g5T/6XMCnKA2zU/yBU0cETV2gtT
         Xp4uET0esegfOvfKAEZ1eG6vx/C5PAa62kpnMM2FFY7OvlLnLAHsHnAQaCYfk1TTZG9T
         9TOA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=iurdIxq8;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of peng.fan@nxp.com designates 40.107.15.71 as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
Received: from EUR01-DB5-obe.outbound.protection.outlook.com (mail-eopbgr150071.outbound.protection.outlook.com. [40.107.15.71])
        by gmr-mx.google.com with ESMTPS id a7si222434ljp.2.2020.08.06.19.41.22
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 06 Aug 2020 19:41:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of peng.fan@nxp.com designates 40.107.15.71 as permitted sender) client-ip=40.107.15.71;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iGaTBXQrGvWd6le3m/xsyMN3VSg2CoIxhAdtw0aj3hbAbt03aOq4pj9wRArCmucE9lXLXqEDiAV30hSCZxO5UkkRCT+m7hMfmeqFSI5j/34C8809jwrovRV9gKjCONkMF6vvnOH+p+uwwqYEl5OBw+I5Rq0CA9ZYu7EVeKuGPRgLNxBSKcCDvaj/vBgN4OvoIdZ+A0usJOYx6kP+f/dQhbW8zMy0pyAE5XZIXNXGaDTCt2zg0nbL8+a0ePUu3+dyhRjw9l2p0WqCbZjp8N1QcJLIbWhafztaARrYfZ4I64PxVSnk6NJPtOhsrhBEC/EoLXtkTBwcpZrcnUsKvlb/kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yiu8Orq3EPL/NxpeuCINDKw9SAI8Twb0VJ8kkXETZ8M=;
 b=I3RyV+Z5C/86C3w7ckv06ATLG3Vt9onZ55e4w45ZsiuykbRjWlXWluFeKuDdmd0zCDMsKZ/JaGfPV8KJ1VE19iYwEg93ObLLg45acCbJ22sxzzoYgv8MYuGeCuEA3SbOVGbATHN8hz3M/XsFQ9F50wsVAqidIbUjNLI6PUFZaDJ/8KDSKk749Xwkn0uLqTb0tOCEzFB24VQ6q7deXiNWV0BVtBi3DVZdS3iAKr39MsDwu1pKOAtHpwFXmgB/5RHpfJ+LgCWFkdD4qmRDGCV1R//I+53POWJWzrNUEWy5878A3VYcOqtUkF9fE/FynYb0ydGTE7lwpHW0zTipWX1u9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
Received: from AM5PR0402MB2756.eurprd04.prod.outlook.com
 (2603:10a6:203:99::22) by AM6PR04MB4087.eurprd04.prod.outlook.com
 (2603:10a6:209:4d::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.17; Fri, 7 Aug
 2020 02:41:21 +0000
Received: from AM5PR0402MB2756.eurprd04.prod.outlook.com
 ([fe80::485:d415:5f2f:e599]) by AM5PR0402MB2756.eurprd04.prod.outlook.com
 ([fe80::485:d415:5f2f:e599%10]) with mapi id 15.20.3239.023; Fri, 7 Aug 2020
 02:41:21 +0000
From: peng.fan@nxp.com
To: jan.kiszka@siemens.com
Cc: jailhouse-dev@googlegroups.com,
	alice.guo@nxp.com,
	Peng Fan <peng.fan@nxp.com>
Subject: [PATCH 00/10] ARM64: boot jailhouse before root cell linux
Date: Fri,  7 Aug 2020 11:06:22 +0800
Message-Id: <20200807030632.28259-1-peng.fan@nxp.com>
X-Mailer: git-send-email 2.16.4
Content-Type: text/plain; charset="UTF-8"
X-ClientProxiedBy: SGBP274CA0019.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b0::31)
 To AM5PR0402MB2756.eurprd04.prod.outlook.com (2603:10a6:203:99::22)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from linux-1xn6.ap.freescale.net (119.31.174.71) by SGBP274CA0019.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b0::31) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.19 via Frontend Transport; Fri, 7 Aug 2020 02:41:19 +0000
X-Mailer: git-send-email 2.16.4
X-Originating-IP: [119.31.174.71]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 1a434ba9-f8fc-4aca-3cb7-08d83a7b5e2a
X-MS-TrafficTypeDiagnostic: AM6PR04MB4087:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR04MB4087FFF0EE151D66D782C8FE88490@AM6PR04MB4087.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1775;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6tB5TPC21BmqffMSdG6We+HqdeABt6aQMp70oPuqnga5iSfaVyL+TuTO6Dq3hHNBBxkGyUmP8XP6UjCzDyaKo2DYubsOhh0VzkcWDl3kWWhQTfny5qqQOWaUoIgf8XlU7m0QSU9hBrvmHVngPePxfnm9GTVABNaV8hmYOm8xNn4YCfz6XvWOK4RXx4tuyrOoolCUXEqTIsA+yJ8ZQpAsYoSkCdYMyIi+5LPgx3J1Ud4kmUwoAEVEc/HlijBQEQciyq+bHEd71dH9BvlmGSGzjl1CLA3wL83ic6JZycrtOg0vIA3kAQU2Bkf2y/3Bv2ZMu5HZbo4I1raoqq7lNLPqs+qmgAFOBCM/jha2oRbPOPI+FnpIvdr+ui5Eeruv2vd3Bp1sU/BHbJhMOtKVGbh3Aw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM5PR0402MB2756.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(39860400002)(396003)(346002)(136003)(376002)(366004)(8676002)(52116002)(478600001)(966005)(6916009)(1076003)(6506007)(83380400001)(9686003)(6512007)(6666004)(8936002)(66946007)(66556008)(66476007)(2906002)(16526019)(26005)(956004)(2616005)(4326008)(5660300002)(316002)(36756003)(86362001)(186003)(6486002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: ksVWuHZS4EYmA8h+sYvu2JrtFVG9yfU3d5saz57hH/GJcPEJc09Zd8dsozYBENrwUvPTvWplE0h/c9WZGBz2mheDdGi7oQ8LcL7iq039TtIzonW8kmx/ULZNm5uiSUaJnj710w7yi8PdVe2lkoF+LO1UBITj7yHyvi4m2xDR5GyNj481Xv0WGwaEGLcySSOrJjsc+NyTKk7lIZ6XPKIp7HJUWndl4n629D11oRSmuLRSODPxezHLXHGAZ0OYbHGJuHtDhxMyTLMIJ1YRpW8WbIIYnxPKtlx8225GhBxn+BSeTLFoJBxXs02Lbhl/hjp2Sqhd0qmdf0f+NQMKXGqaykCCFkeNP5qr3iMcVd0nriw/CC7VD+PFaUEVj/EPYG5PiaJ9IANlxRm1eN7jeObJLbFSgzfp1MEluehk3CIhlahxYdHbEKq/wmaJnMAYJ5WOxLNR3+eQvBrvrlDFuRHdAcmRt+sm0+BuY+z2RvI+a8NkoQQBBABsy0Qstm9EJ6L8Ug6nV/Bau42LOb5pnM5VSvlwRnxhPmO7vcvr0VXvseCMq0ppZRz0Gdn5sJk2L4qkezlbDrgG7zyL0gV3UoMT8yWk+SMa03CEOXERArkb5Q3/xPYV7kbmIM46clG+SIyOyqtWIWXjlOZOECFucyYDFg==
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a434ba9-f8fc-4aca-3cb7-08d83a7b5e2a
X-MS-Exchange-CrossTenant-AuthSource: AM5PR0402MB2756.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2020 02:41:21.0898
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LT0HXd+QiK9kLAI3RF7LV9/i30IV1bMmwLwOcByw0+cKk2dgh+mSV6peUNdI0j4l/vBa6PTsVwNYtieECj9jPg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB4087
X-Original-Sender: peng.fan@nxp.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@nxp.com header.s=selector2 header.b=iurdIxq8;       arc=pass (i=1
 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass
 fromdomain=nxp.com);       spf=pass (google.com: domain of peng.fan@nxp.com
 designates 40.107.15.71 as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
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

This patchset is to support boot jailhouse before Linux.
The previous RFC patchset:
https://groups.google.com/g/jailhouse-dev/c/IZEFz-e2lh4/m/BBmGI_spIQAJ

Patch 1~6 is to create an new folder libbaremetal to hold
files that could shared between inmates and new bootloader.

Patch 9 is the central part to boot jailhouse with a baremetal
bootloader, which only support ARM64 + GIC_V3 now. It will use
psci to power up secondary cores, do GIC_V3 dist initialization,
Then kick inmate cell.

Images/cells loading is done by U-Boot bootm command to boot a fit image.

Patch 10 is to support using jailhouse userspace tool even boot jailhouse
before linux, just do as "insmod jailhouse.ko early_loader=1", then
it will bypass fw loading and etc, but setup information for linux usage.

Peng Fan (10):
  inmates: arm-common: move mmio helpers to mmio.h
  libbaremetal: move mmio.h out of inmates
  inmates: lib: move string function prototypes to string.h
  inmates: lib: move string.h to libbaremetal
  inmate: lib: string: use header file from libbaremetal
  Add libbaremetal
  cell-config: reserve an entry to align jailhouse_system
  arm64: sysregs: correct SCTLR_EL1_RES
  ARM64: Add jailhouse bootloader support
  driver: main: introduce early_loader param

 Kbuild                                            |   8 +-
 bootloader/8mm.its                                |  75 +++
 bootloader/Makefile                               |  68 +++
 bootloader/arch/arm-common/Kbuild                 |  17 +
 bootloader/arch/arm-common/gic-common.c           |  34 ++
 bootloader/arch/arm-common/gic-v3.c               | 127 ++++
 bootloader/arch/arm-common/include/gic-common.h   |   2 +
 bootloader/arch/arm64/Kbuild                      |  21 +
 bootloader/arch/arm64/Makefile                    |  15 +
 bootloader/arch/arm64/head.S                      | 201 +++++++
 bootloader/arch/arm64/inmate.c                    |  53 ++
 bootloader/arch/arm64/main.c                      | 218 +++++++
 bootloader/include/bootloader.h                   |   5 +
 bootloader/include/config.h                       |   5 +
 bootloader/include/fls.h                          |  42 ++
 bootloader/include/linux/irqchip/arm-gic-common.h |  21 +
 bootloader/include/linux/irqchip/arm-gic-v3.h     | 674 ++++++++++++++++++++++
 bootloader/include/linux/irqchip/arm-gic.h        |  34 ++
 bootloader/loader.lds                             |  22 +
 driver/main.c                                     |  89 +--
 hypervisor/arch/arm-common/include/asm/psci.h     |  10 +
 hypervisor/arch/arm64/include/asm/sysregs.h       |  15 +-
 include/jailhouse/cell-config.h                   |   1 +
 inmates/Makefile                                  |   8 +-
 inmates/lib/arm-common/Makefile.lib               |   2 +-
 inmates/lib/arm-common/include/inmate.h           |  49 +-
 inmates/lib/arm/Makefile.lib                      |   2 +-
 inmates/lib/arm64/Makefile.lib                    |   2 +-
 inmates/lib/include/inmate_common.h               |   9 +-
 inmates/lib/x86/Makefile                          |   2 +-
 inmates/lib/x86/Makefile.lib                      |   3 +-
 libbaremetal/Makefile                             |  46 ++
 libbaremetal/arm-common/Makefile.lib              |  41 ++
 libbaremetal/arm-common/include/mmio.h            |  88 +++
 libbaremetal/arm/Makefile                         |  44 ++
 libbaremetal/arm/Makefile.lib                     |  63 ++
 libbaremetal/arm64/Makefile                       |  44 ++
 libbaremetal/arm64/Makefile.lib                   |  63 ++
 {inmates/lib => libbaremetal}/include/string.h    |   8 +
 {inmates/lib => libbaremetal}/string.c            |   3 +-
 libbaremetal/x86/Makefile                         |  66 +++
 libbaremetal/x86/Makefile.lib                     |  69 +++
 42 files changed, 2266 insertions(+), 103 deletions(-)
 create mode 100644 bootloader/8mm.its
 create mode 100644 bootloader/Makefile
 create mode 100644 bootloader/arch/arm-common/Kbuild
 create mode 100644 bootloader/arch/arm-common/gic-common.c
 create mode 100644 bootloader/arch/arm-common/gic-v3.c
 create mode 100644 bootloader/arch/arm-common/include/gic-common.h
 create mode 100644 bootloader/arch/arm64/Kbuild
 create mode 100644 bootloader/arch/arm64/Makefile
 create mode 100644 bootloader/arch/arm64/head.S
 create mode 100644 bootloader/arch/arm64/inmate.c
 create mode 100644 bootloader/arch/arm64/main.c
 create mode 100644 bootloader/include/bootloader.h
 create mode 100644 bootloader/include/config.h
 create mode 100644 bootloader/include/fls.h
 create mode 100644 bootloader/include/linux/irqchip/arm-gic-common.h
 create mode 100644 bootloader/include/linux/irqchip/arm-gic-v3.h
 create mode 100644 bootloader/include/linux/irqchip/arm-gic.h
 create mode 100644 bootloader/loader.lds
 create mode 100644 libbaremetal/Makefile
 create mode 100644 libbaremetal/arm-common/Makefile.lib
 create mode 100644 libbaremetal/arm-common/include/mmio.h
 create mode 100644 libbaremetal/arm/Makefile
 create mode 100644 libbaremetal/arm/Makefile.lib
 create mode 100644 libbaremetal/arm64/Makefile
 create mode 100644 libbaremetal/arm64/Makefile.lib
 rename {inmates/lib => libbaremetal}/include/string.h (82%)
 rename {inmates/lib => libbaremetal}/string.c (98%)
 create mode 100644 libbaremetal/x86/Makefile
 create mode 100644 libbaremetal/x86/Makefile.lib

-- 
2.16.4

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20200807030632.28259-1-peng.fan%40nxp.com.
