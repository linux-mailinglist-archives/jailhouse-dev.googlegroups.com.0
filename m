Return-Path: <jailhouse-dev+bncBDAMFR7JZAEBBZ76WL4QKGQENZD53VA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x239.google.com (mail-lj1-x239.google.com [IPv6:2a00:1450:4864:20::239])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E09723E5F7
	for <lists+jailhouse-dev@lfdr.de>; Fri,  7 Aug 2020 04:41:44 +0200 (CEST)
Received: by mail-lj1-x239.google.com with SMTP id z18sf107230lji.9
        for <lists+jailhouse-dev@lfdr.de>; Thu, 06 Aug 2020 19:41:44 -0700 (PDT)
ARC-Seal: i=3; a=rsa-sha256; t=1596768103; cv=pass;
        d=google.com; s=arc-20160816;
        b=n+l2tfTOBjC7NmEt+PaLQDVa3gve5vrlEl8oN7KWfASKU3ik8y8hrXD8FB2eNWtkoa
         f7MxTsAUgNWBmcwXvWGF0Ml6QlclDz8htmgxRKXSUWtJAqMMdyGXZzzh8LIoLzqghe4P
         546sAN0XUPQimm5B0Wv92vrbhmNPhbfFCMUWUh1lmYGPfKMXoRhXPFxEPw2eLSc7LY8d
         ahW5gxFffDSP9UYPpBxdKo2PmJgoGoZYQ9gSHGtLmIowgw7IwJr9jqlwLb9Yyyr0cpM5
         FdTVGaD+R31eSF0pE2hOx1J5m7Uk5zrQtIky0NuvhNjjasI+6ou85lh+CCSNboCj4oBR
         ZY7g==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=a/6hY/nTXSgHmgl4vRTLG6UxIYASK73Q5nQtrL1ea0w=;
        b=ZY3JlnDRroW5TQsiLUI7RDktb9bugUlDbIa5T2ppNWfq4gw6eBI+7wvOaF+kzkQAJ8
         LtZOV6tLlETXNzRxW2Me0kpE3zmSZRgvv4mcbdFB/UEe3aIKQyUGnqlhxcguoHw/jnLv
         aOmvvodu3jUBOIGURqjaBjd8rsoCBJgqNfQwT5nnjkCCT9EeRBuC5fcqBLwPYsGV5hwN
         d/vrZ3mUw039A0E906c5asUvEd7gzbrkCPk06/pu2PQ4SeVysc3PYo7+0OLxm1vd0YfD
         FaXVmJDW78+IrYmHXC8L4uCKb/0JLwFi6BPps/SsAudintkpyxY2m5WT+/bgjRLqS79O
         HL/w==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=gcluXGJY;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of peng.fan@nxp.com designates 40.107.15.71 as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=a/6hY/nTXSgHmgl4vRTLG6UxIYASK73Q5nQtrL1ea0w=;
        b=aoIU6CuKD+MR+qqCY3L6oMTo7qjEjwUIaCbx4+oFdBO9PblganfgBSM5Klc2aUsAUt
         onG21Y1lM66qsoTbejAfK3btwSuBTL7TldCYgpPzmPomg0aEAVYq6TnpCdRupaGDpgGE
         FTrDkyzDEKti0jD2EaDqLisG2sNz2wRTIb8UlscguPj3M3c0tiPmczLA0rbILYQ3xATL
         MFAxIhAzqCuV0g6dJGgaxqqKWH2Qx0oxnNrJIHD2q9lQMiG3MYBAHN/+SlDLQioC7NNq
         PqsEiMnIO5GbbAQbvPna6trgSB6+vhGaiR4WsoWZzCeoE+zBi6Y8EG2X9vZbnnBggKgI
         VZBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=a/6hY/nTXSgHmgl4vRTLG6UxIYASK73Q5nQtrL1ea0w=;
        b=P5kh/8hSdQOBYh9OJPCuVJBV0kTQhfwanJ16+sXLPy7bohs5HQHNgvC3MDrv//Rutx
         h806GQycSOB8ZALETpo104rFNDgPequCFh8QctDeRTpEgC+fnzPsay7P7LnGzajm7CnT
         FITrT7R0/BKG36SnFni++UzY1hRw6FiscJnnW+jsL7LB4glHZXr8lETD0FqfCdMkqB2U
         4GsSADnnLrCSonplVmU69I7lS7UTRuDkyep9oVzqQgRygSjy1APZ95cqkjduOi8dea7O
         02aJTIYG6o946yfGbvwBn6ivPnf7njTWpAdCTLVsjZgplXVy6ctq1joM+TPL9Autk6Gs
         LxTA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533cWaywcOor8nLQ07HQaFEV7lRBecnXkezPFzU6A86peK5vvLZ7
	GJ4slZ5ycHbkfNc37lHvxF0=
X-Google-Smtp-Source: ABdhPJzbiGUpJvnPWOOU34+Zg/a9WS5pNArWYesoAJnZjLgm9kInzV0ICiVo5j7gZyMooQewdhQHOg==
X-Received: by 2002:a2e:9e5a:: with SMTP id g26mr5587711ljk.207.1596768103458;
        Thu, 06 Aug 2020 19:41:43 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:300f:: with SMTP id w15ls1412697ljw.1.gmail; Thu, 06 Aug
 2020 19:41:42 -0700 (PDT)
X-Received: by 2002:a2e:85a:: with SMTP id g26mr5425138ljd.319.1596768102605;
        Thu, 06 Aug 2020 19:41:42 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1596768102; cv=pass;
        d=google.com; s=arc-20160816;
        b=UgX8487dRVpD1TWxA3MKBoq02bmwOSNLHox9VKJFl5EJDszkHH0Bz4kAnkTQ0j7V0V
         iPkaiVmI4WDbzhFr6JzYe0DuNapbrAgukx2Fex9XIGs0rriVsdVgIp1UpkpENuCPDmoz
         dZWI+WxJrlKuNfh1HEX3Vl0cAfbkaV8OS6fFxMhZDvBB2hLAa5hJXazIm/s0wZsC1SRb
         jam61fuJEy/11TFCJ5VbcrIVtLZh7bXkdqkQM6TmI3mxJeqKCiW2L+5ud59G/elmSO1a
         Rnz0+MCAg57e1s35YYOno+9lF0HY8uMgqwrIofrRi/pYZkGDdzaYfnk0/JmeJ9vcz4s4
         TzWA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=GLNGhzsuoB19x1KRo+UwAXpbfLPnDaCisaNLr7VVIwM=;
        b=vZdHsp610egjgYHyTpuHxVe3qrR0o/i4u3AnTyeBLLGWNGD5GMLvJzH3WDLsSRaR6l
         c1k0ExzvW1SIDaP635qJ4YXuSy/Y4kxqEWJdgXfF8uZ4VOmzCXAT/sqHcWRvNjs0bMNQ
         WBSvvdVmGYqfydCylP7ML4xruu1rVZ1ie2Y0aBQqQVZAMr7PPr2OsR0TCMDwbXcBUNAO
         pjuqY46fJD6wsreF1IJKArSEQTHxDRaDT/NHt6xr+WvW0wZg7TOFbqS3DvSWyCuWK1Aq
         etbItE2F9/pqnRdpJdDnamoeKqE05A0mhDw/rDG9pUbwLXgHZ8m0ssRxlLr0MuNQMrsU
         ytBQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=gcluXGJY;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of peng.fan@nxp.com designates 40.107.15.71 as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
Received: from EUR01-DB5-obe.outbound.protection.outlook.com (mail-eopbgr150071.outbound.protection.outlook.com. [40.107.15.71])
        by gmr-mx.google.com with ESMTPS id 141si361595lfh.4.2020.08.06.19.41.42
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 06 Aug 2020 19:41:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of peng.fan@nxp.com designates 40.107.15.71 as permitted sender) client-ip=40.107.15.71;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d+uQla612AgvZ7Zcl6cx79CSetX0ub2l2UL4aJF/YFAGU06rOnEWismJiHIZp2A9fFh3HIBxgsLHaScMr1KgWTB38RF+2vAXh4Y+kSC9cVOfIDyZAFig4BF1qDzsO0AuFrh0yDaQrtkSfRPS1obqGzeC1Obm6tush71qkAxQwSPrvbOcsYVmEjVgz0sf29HuKTnnWunFTfb2Kpu4lT2Sv6gS71b0qjpyYGKPT7k0JQ58WNQTb3z1PNVsAZTwuK4BoPZNKJjYVcL0S1goOW5Ar3gEQOwYaxM3E+CN0wSnYX0zcr4oO61DceS+LAMEVFMUg3cizVx+ZJBRqlOapyIb4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GLNGhzsuoB19x1KRo+UwAXpbfLPnDaCisaNLr7VVIwM=;
 b=ZrZLZh851EJXdLl3KrGVvVN/M15qwr2xS5S93yd+vRe6f6xPnt0TL3bDCamaPSMW1J7L1orCTKTB/jW9v2fPHKtAcpqje1kaUlb7usrnjy/lPhIkAueJdu/VlBgeBYxsolkNK7B8xU8YiuOqqlJhKkiT/jn4+tG9q+OBrMa/wm5xiGw0VZR8/X2jxbiEYyo364UbV1GziBWc9JF6K+S+lCACgykmFkkJ0kE9VXEXbZAlFXc77Z8RJpP+1qgYJAcDqZl1Lwfz7ijTmgcXJT5gKX2E6teesC/nZfOSTU3A8fNH7fl6gSeEvn/IA/qqtVja88UyA5hxJw1g0QI3YTjU0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
Received: from AM5PR0402MB2756.eurprd04.prod.outlook.com
 (2603:10a6:203:99::22) by AM6PR04MB4087.eurprd04.prod.outlook.com
 (2603:10a6:209:4d::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.17; Fri, 7 Aug
 2020 02:41:39 +0000
Received: from AM5PR0402MB2756.eurprd04.prod.outlook.com
 ([fe80::485:d415:5f2f:e599]) by AM5PR0402MB2756.eurprd04.prod.outlook.com
 ([fe80::485:d415:5f2f:e599%10]) with mapi id 15.20.3239.023; Fri, 7 Aug 2020
 02:41:39 +0000
From: peng.fan@nxp.com
To: jan.kiszka@siemens.com
Cc: jailhouse-dev@googlegroups.com,
	alice.guo@nxp.com,
	Peng Fan <peng.fan@nxp.com>
Subject: [PATCH 09/10] ARM64: Add jailhouse bootloader support
Date: Fri,  7 Aug 2020 11:06:31 +0800
Message-Id: <20200807030632.28259-10-peng.fan@nxp.com>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20200807030632.28259-1-peng.fan@nxp.com>
References: <20200807030632.28259-1-peng.fan@nxp.com>
Content-Type: text/plain; charset="UTF-8"
X-ClientProxiedBy: SGBP274CA0019.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b0::31)
 To AM5PR0402MB2756.eurprd04.prod.outlook.com (2603:10a6:203:99::22)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from linux-1xn6.ap.freescale.net (119.31.174.71) by SGBP274CA0019.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b0::31) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.19 via Frontend Transport; Fri, 7 Aug 2020 02:41:37 +0000
X-Mailer: git-send-email 2.16.4
X-Originating-IP: [119.31.174.71]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 05164867-eb00-4a9f-5159-08d83a7b693e
X-MS-TrafficTypeDiagnostic: AM6PR04MB4087:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR04MB40879D3DD62B5ADF8210634188490@AM6PR04MB4087.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3173;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8GWKulZU4bgwaZw9at8UPQTigc6+x0VkB8LArol6zXWN9U8deIHw5RAKmpti6kXTq3YUI5p/2W8qWfEVOFUrT+47SRcffwC6JlEr0tMKjdi7xMg8JwQPbl0Lq2lkVyCFx05nxChlVNUW3wFbwuWtwrTNT+kSOK8Z73pIPnMiTYEneMDhsMsCzJ7E15B7dGucTCSNBH8VU24YZjdPmL2Di7IFOyKnRqM+/D283+xW1IosFtDNOnIz4x8YDtsTRaFhl5xkj6/CDMaE32s2eQ1jIFDDMPOhr1rJKUbJi+bpy1OqzSgqp6MbBu7nENQZ7mToANpVpaTWBftWwDGQKlzsSw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM5PR0402MB2756.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(39860400002)(396003)(346002)(136003)(376002)(366004)(8676002)(52116002)(478600001)(6916009)(1076003)(6506007)(83380400001)(9686003)(6512007)(6666004)(8936002)(66946007)(66556008)(66476007)(2906002)(16526019)(26005)(956004)(2616005)(4326008)(5660300002)(316002)(36756003)(86362001)(186003)(6486002)(30864003)(579004)(559001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: siU5yOB3MYCabX8rnMMrNMVdd5r1sK38Q62/Vl/2/WgLOIBPn38+pFwNuzHRXziuuaVuwjd0EBnP8Kb8mu4fjeJStrDrlNM/NJxzFlP9JGVHkj/3FQIzt+44Zy01I/pTv2HjQzEjqIxb4MlK+IEsGAzv8ycAbDopjOmpgpDsTN0hm8bW6OK4EqqbVW5wcy+Q1SkxEpNG/d4cihD3TQlaEFP6JEaGuy0hMTQiep3WvRy97NLBM3dd/uaaLXCsOT9kx5jOcY0/IR8GvsY4qpElpkIdP+Z+uqDQv330u1E302nZ3XUHbE0oZXcUHTmGqZIkKHmfiazhNoIIS9JeFpdGEyGbiyjauPHaQP5pyNIOUCTsmSd1CHcwsTO0ZXbboIcXrfBf4lc0u+LlMBvq0rVeghXJN6jv/yWGiIhOW79YmCWgSS7YV3zO+dpnVr4VOpChwsk7J9bYl51S2nBeKLSZVEHOqgt7t6YztgZDcK1CiVXTa37yv/RdN+hD4qH7qg8ag/o5UPuZHauI0ZXEbyPLiHGGRej583G+8kWJfxrhZIOam/hzwrlBWUMCVUiCWhSJwPToMSmB8qNkH0HZuN0MOOysTEgDRvnSqeaSipKh979tOq6DX347OBGNDWCkPI31dkXHS4GDYSjf/hTcmpe5Cw==
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 05164867-eb00-4a9f-5159-08d83a7b693e
X-MS-Exchange-CrossTenant-AuthSource: AM5PR0402MB2756.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2020 02:41:39.8733
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 38HQxCfgh+xWDNTIzgUhJ5siR+mrtsrYaqTS17tNfpZQ4z3ggbGsw6woDzEMBDd2Y8M3lyYZDA9r3P40pwJ5/w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB4087
X-Original-Sender: peng.fan@nxp.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@nxp.com header.s=selector2 header.b=gcluXGJY;       arc=pass (i=1
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

To boot jailhouse before linux, we need a preloader to initialize
GIC, boot up all cores, did basic EL2 initialization, then kick
inmate/root cell.

This patchset only supports ARM64 with GICv3 and tested on
i.MX8MM EVK board.

The gicv3 initialization is mostly reused from Linux Kernel.

The images are all packed into a FIT image, and U-Boot load
the FIT images. When bootm, U-Boot will parse the FIT image and
copy payload to address specific in fit image.

The fit file in the patch is fit.its, currently the address are
hardcoded. Later, a script would be used to automatic generate it.

The script to generate the FIT image for U-Boot

cp hypervisor/jailhouse.bin loader/
cp configs/arm64/imx8mm.cell loader/
cp configs/arm64/imx8mm-gic-demo.cell loader/
cp inmates/demos/arm64/gic-demo.bin loader/
cp <Linux>/arch/arm64/boot/dts/freescale/imx8mm-evk-root.dtb ./loader
cd loader
mkimage -E -f fit.its loader.itb
cd -

The boot command:
=>run mmcargs
=>dhcp 0x404800000 Image
=>fatload mmc 1:1 0x60000000 loader.itb
=>bootm 0x60000000

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 Kbuild                                            |   4 +
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
 hypervisor/arch/arm-common/include/asm/psci.h     |  10 +
 hypervisor/arch/arm64/include/asm/sysregs.h       |  13 +
 21 files changed, 1661 insertions(+)
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

diff --git a/Kbuild b/Kbuild
index dc6423ad..db746a64 100644
--- a/Kbuild
+++ b/Kbuild
@@ -52,6 +52,9 @@ $(GEN_PCI_DEFS_PY): $(src)/scripts/gen_pci_defs.sh
 	$(call if_changed,gen_pci_defs)
 
 subdir-y := hypervisor configs inmates tools libbaremetal
+ifeq ($(SRCARCH), arm64)
+subdir-y += bootloader
+endif
 
 subdir-ccflags-y := -Werror
 
@@ -63,6 +66,7 @@ ifeq ($(filter %/Makefile.clean,$(MAKEFILE_LIST)),)
 $(obj)/driver $(addprefix $(obj)/,$(subdir-y)): $(GEN_CONFIG_MK)
 
 $(addprefix $(obj)/,inmates): $(addprefix $(obj)/,libbaremetal)
+$(addprefix $(obj)/,bootloader): $(addprefix $(obj)/,libbaremetal)
 
 $(obj)/driver $(obj)/hypervisor: $(GEN_VERSION_H)
 
diff --git a/bootloader/8mm.its b/bootloader/8mm.its
new file mode 100644
index 00000000..55d215fc
--- /dev/null
+++ b/bootloader/8mm.its
@@ -0,0 +1,75 @@
+/dts-v1/;
+
+/ {
+	description = "Configuration to load Images";
+
+	images {
+		kernel {
+			description = "linux";
+			os = "Linux";
+			data = /incbin/("loader.bin");
+			type = "kernel";
+			arch = "arm64";
+			compression = "none";
+			load = <0x40000000>;
+			entry = <0x40000000>;
+		};
+
+		hypervisor {
+			description = "Jailhouse hypervisor";
+			os = "jailhouse";
+			data = /incbin/("jailhouse.bin");
+			type = "standalone";
+			arch = "arm64";
+			compression = "none";
+			load = <0x40200000>;
+		};
+
+		cell@1 {
+			description = "i.MX8MM cell";
+			data = /incbin/("imx8mm.cell");
+			arch = "arm64";
+			type = "standalone";
+			compression = "none";
+			load = <0x40300000>;
+		};
+
+		cell@2 {
+			description = "i.MX8MM GIC-CELL";
+			data = /incbin/("imx8mm-gic-demo.cell");
+			arch = "arm64";
+			type = "standalone";
+			compression = "none";
+			load = <0x40310000>;
+		};
+
+		inmate@2 {
+			description = "i.MX8MM GIC-DEMO";
+			data = /incbin/("gic-demo.bin");
+			arch = "arm64";
+			type = "standalone";
+			compression = "none";
+			load = <0xb3c00000>;
+		};
+
+		fdt {
+			description = "fdt";
+			data = /incbin/("imx8mm-evk-root.dtb");
+			type = "flat_dt";
+			compression = "none";
+			arch = "arm64";
+			load = <0x43000000>;
+		};
+	};
+
+	configurations {
+		default = "config@1";
+
+		config@1 {
+			description = "imx8mp-evk";
+			kernel = "kernel";
+			fdt = "fdt";
+			loadables = "hypervisor", "cell@1", "cell@2", "inmate@2";
+		};
+	};
+};
diff --git a/bootloader/Makefile b/bootloader/Makefile
new file mode 100644
index 00000000..63114fa3
--- /dev/null
+++ b/bootloader/Makefile
@@ -0,0 +1,68 @@
+-include $(GEN_CONFIG_MK)
+
+BAREMETAL_LIB = $(src)/../libbaremetal/$(SRCARCH)
+export BAREMETAL_LIB
+
+INCLUDES := -I$(BAREMETAL_LIB)/include \
+	    -I$(src)/../include/arch/$(SRCARCH) \
+	    -I$(src)/../include	\
+	    -I$(src)/include	\
+	    -I$(src)/../libbaremetal/include \
+	    -I$(src)/../hypervisor/arch/$(SRCARCH)/include \
+	    -I$(src)/../hypervisor/include
+
+
+ifeq ($(subst arm64,arm,$(SRCARCH)),arm)
+INCLUDES += -I$(src)/../hypervisor/arch/arm-common/include
+INCLUDES += -I$(src)/../libbaremetal/arm-common/include
+INCLUDES += -I$(src)/arch/arm-common/include
+endif
+
+LINUXINCLUDE  := $(INCLUDES)
+KBUILD_AFLAGS := -D__ASSEMBLY__ -fno-PIE
+KBUILD_CFLAGS := -g -Os -Wall -Wstrict-prototypes -Wtype-limits \
+		 -Wmissing-declarations -Wmissing-prototypes \
+		 -fno-strict-aliasing -fno-pic -fno-common \
+		 -fno-stack-protector -fno-builtin-ffsl \
+		 -D__LINUX_COMPILER_TYPES_H -mstrict-align
+
+CORE_OBJECTS := arch/$(SRCARCH)/head.o
+
+ifneq ($(wildcard $(INC_CONFIG_H)),)
+KBUILD_CFLAGS += -include $(INC_CONFIG_H)
+endif
+
+#ccflags-y := -I$(src)/../hypervisor/arch/$(SRCARCH)/include \
+#	     -I$(src)/../hypervisor/include \
+#	     -I$(src)/../include/arch/$(SRCARCH) \
+#	     -I$(src)/../include
+
+always :=
+
+subdir-y := arch/$(SRCARCH)
+
+define BUILD_loader_template
+always += loader$(1).bin
+
+$$(obj)/arch/$$(SRCARCH)/lib$(1).a: $$(obj)/arch/$$(SRCARCH)
+	@true
+
+loader$(1)-y := arch/$$(SRCARCH)/lib$(1).a $$(CORE_OBJECTS) loader.lds
+targets += $$(loader$(1)-y)
+
+loader$(1)_OBJS = $$(addprefix $$(obj)/,$$(loader$(1)-y))
+
+LDFLAGS_loader$(1).o := --whole-archive -T
+
+targets += loader$(1).o
+$$(obj)/loader$(1).o: $$(src)/loader.lds $$(loader$(1)_OBJS) $(BAREMETAL_LIB)/lib.a
+	$$(call if_changed,ld)
+
+OBJCOPYFLAGS_loader$(1).bin := -O binary -R .eh_frame
+
+targets += loader$(1).bin
+$$(obj)/loader$(1).bin: $$(obj)/loader$(1).o
+	$$(call if_changed,objcopy)
+endef
+
+$(eval $(call BUILD_loader_template,))
diff --git a/bootloader/arch/arm-common/Kbuild b/bootloader/arch/arm-common/Kbuild
new file mode 100644
index 00000000..6e291f69
--- /dev/null
+++ b/bootloader/arch/arm-common/Kbuild
@@ -0,0 +1,17 @@
+#
+# Jailhouse, a Linux-based partitioning hypervisor
+#
+# Copyright (c) Siemens AG, 2013-2017
+#
+# Authors:
+#  Jan Kiszka <jan.kiszka@siemens.com>
+#
+# This work is licensed under the terms of the GNU GPL, version 2.  See
+# the COPYING file in the top-level directory.
+#
+
+-include $(GEN_CONFIG_MK)
+
+objs-y += gic-common.o gic-v3.o
+
+common-objs-y = $(addprefix ../arm-common/,$(objs-y))
diff --git a/bootloader/arch/arm-common/gic-common.c b/bootloader/arch/arm-common/gic-common.c
new file mode 100644
index 00000000..104d7d10
--- /dev/null
+++ b/bootloader/arch/arm-common/gic-common.c
@@ -0,0 +1,34 @@
+#include <jailhouse/types.h>
+#include <gic-common.h>
+#include <mmio.h>
+#include <linux/irqchip/arm-gic.h>
+#include <linux/irqchip/arm-gic-common.h>
+
+void gic_dist_config(void *base, int gic_irqs, void (*sync_access)(void))
+{
+	unsigned int i;
+
+	/*
+	 * Set all global interrupts to be level triggered, active low.
+	 */
+	for (i = 32; i < gic_irqs; i += 16)
+		mmio_write32(base + GIC_DIST_CONFIG + i / 4, 0);
+
+	/*
+	 * Set priority on all global interrupts.
+	 */
+	for (i = 32; i < gic_irqs; i += 4)
+		mmio_write32(base + GIC_DIST_PRI + i, GICD_INT_DEF_PRI_X4);
+
+	/*
+	 * Deactivate and disable all SPIs. Leave the PPI and SGIs
+	 * alone as they are in the redistributor registers on GICv3.
+	 */
+	for (i = 32; i < gic_irqs; i += 32) {
+		mmio_write32(base + GIC_DIST_ACTIVE_CLEAR + i / 8, GICD_INT_EN_CLR_X32);
+		mmio_write32(base + GIC_DIST_ENABLE_CLEAR + i / 8, GICD_INT_EN_CLR_X32);
+	}
+
+	if (sync_access)
+		sync_access();
+}
diff --git a/bootloader/arch/arm-common/gic-v3.c b/bootloader/arch/arm-common/gic-v3.c
new file mode 100644
index 00000000..39b1e1fc
--- /dev/null
+++ b/bootloader/arch/arm-common/gic-v3.c
@@ -0,0 +1,127 @@
+#include <jailhouse/types.h>
+#include <jailhouse/mmio.h>
+#include <gic-common.h>
+#include <linux/irqchip/arm-gic-common.h>
+#include <linux/irqchip/arm-gic-v3.h>
+
+#include <asm/sysregs.h>
+#include <asm/processor.h>
+#include <mmio.h>
+
+#define GICD_INT_DEF_PRI                0xa0
+#define GICD_INT_DEF_PRI_X4             ((GICD_INT_DEF_PRI << 24) |\
+                                        (GICD_INT_DEF_PRI << 16) |\
+                                        (GICD_INT_DEF_PRI << 8) |\
+                                        GICD_INT_DEF_PRI)
+struct rdists {
+	unsigned int	gicd_typer;
+	bool		has_vlpis;
+	bool		has_direct_lpi;
+};
+
+struct gic_chip_data {
+	void 		*dist_base;
+	struct rdists	rdists;
+};
+
+static struct gic_chip_data gic_data;
+
+#define GICD_TYPER_ESPI			(1U << 8)
+
+#define GICD_TYPER_SPIS(typer)		((((typer) & 0x1f) + 1) * 32)
+#define GICD_TYPER_ESPIS(typer)						\
+	(((typer) & GICD_TYPER_ESPI) ? GICD_TYPER_SPIS((typer) >> 27) : 0)
+
+#define min(x, y)	((x) < (y) ? (x) : (y))
+#define GIC_LINE_NR	min(GICD_TYPER_SPIS(gic_data.rdists.gicd_typer), 1020U)
+#define GIC_ESPI_NR	GICD_TYPER_ESPIS(gic_data.rdists.gicd_typer)
+
+
+static void gic_do_wait_for_rwp(void *base)
+{
+	u32 count = 1000000000;	/* 1s! */
+
+	while (mmio_read32(base + GICD_CTLR) & GICD_CTLR_RWP) {
+		count--;
+		if (!count) {
+			return;
+		}
+		cpu_relax();
+#if 0
+		udelay(1);
+#endif
+	}
+}
+
+/* Wait for completion of a distributor change */
+static void gic_dist_wait_for_rwp(void)
+{
+	gic_do_wait_for_rwp(gic_data.dist_base);
+}
+
+static unsigned long phys_processor_id(void)
+{
+	unsigned long mpidr;
+
+	arm_read_sysreg(MPIDR_EL1, mpidr);
+
+	return mpidr & MPIDR_CPUID_MASK;
+}
+
+void gic_dist_init(void *base)
+{
+	unsigned int i;
+	u64 affinity;
+	u32 typer;
+
+	gic_data.dist_base = base;
+
+	typer = mmio_read32(gic_data.dist_base + GICD_TYPER);
+	gic_data.rdists.gicd_typer = typer;
+
+	/* Disable the distributor */
+	mmio_write32(base + GICD_CTLR, 0);
+	gic_dist_wait_for_rwp();
+
+	/*
+	 * Configure SPIs as non-secure Group-1. This will only matter
+	 * if the GIC only has a single security state. This will not
+	 * do the right thing if the kernel is running in secure mode,
+	 * but that's not the intended use case anyway.
+	 */
+	for (i = 32; i < GIC_LINE_NR; i += 32)
+		mmio_write32(base + GICD_IGROUPR + i / 8, ~0U);
+
+	/* Extended SPI range, not handled by the GICv2/GICv3 common code */
+	for (i = 0; i < GIC_ESPI_NR; i += 32) {
+		mmio_write32(base + GICD_ICENABLERnE + i / 8, ~0U);
+		mmio_write32(base + GICD_ICACTIVERnE + i / 8, ~0U);
+	}
+
+	for (i = 0; i < GIC_ESPI_NR; i += 32)
+		mmio_write32(base + GICD_IGROUPRnE + i / 8, ~0U);
+
+	for (i = 0; i < GIC_ESPI_NR; i += 16)
+		mmio_write32(base + GICD_ICFGRnE + i / 4, 0);
+
+	for (i = 0; i < GIC_ESPI_NR; i += 4)
+		mmio_write32(base + GICD_IPRIORITYRnE + i, GICD_INT_DEF_PRI_X4);
+
+	/* Now do the common stuff, and wait for the distributor to drain */
+	gic_dist_config(base, GIC_LINE_NR, gic_dist_wait_for_rwp);
+
+	/* Enable distributor with ARE, Group1 */
+	mmio_write32(base + GICD_CTLR,
+		     GICD_CTLR_ARE_NS | GICD_CTLR_ENABLE_G1A | GICD_CTLR_ENABLE_G1);
+
+	/*
+	 * Set all global interrupts to the boot CPU only. ARE must be
+	 * enabled.
+	 */
+	affinity = phys_processor_id();
+	for (i = 32; i < GIC_LINE_NR; i++)
+		mmio_write64(base + GICD_IROUTER + i * 8, affinity);
+
+	for (i = 0; i < GIC_ESPI_NR; i++)
+		mmio_write64(base + GICD_IROUTERnE + i * 8, affinity);
+}
diff --git a/bootloader/arch/arm-common/include/gic-common.h b/bootloader/arch/arm-common/include/gic-common.h
new file mode 100644
index 00000000..7c239f3e
--- /dev/null
+++ b/bootloader/arch/arm-common/include/gic-common.h
@@ -0,0 +1,2 @@
+void gic_dist_config(void *base, int gic_irqs, void (*sync_access)(void));
+void gic_dist_init(void *base);
diff --git a/bootloader/arch/arm64/Kbuild b/bootloader/arch/arm64/Kbuild
new file mode 100644
index 00000000..4b5c9a5a
--- /dev/null
+++ b/bootloader/arch/arm64/Kbuild
@@ -0,0 +1,21 @@
+#
+# Jailhouse AArch64 support
+#
+# Copyright (C) 2015 Huawei Technologies Duesseldorf GmbH
+# Copyright (c) Siemens AG, 2016
+#
+# Authors:
+#  Antonios Motakis <antonios.motakis@huawei.com>
+#  Jan Kiszka <jan.kiszka@siemens.com>
+#
+# This work is licensed under the terms of the GNU GPL, version 2.  See
+# the COPYING file in the top-level directory.
+#
+
+include $(src)/../arm-common/Kbuild
+
+always := lib.a
+
+lib-y := main.o inmate.o
+lib-y += $(common-objs-y)
+obj-y := head.o
diff --git a/bootloader/arch/arm64/Makefile b/bootloader/arch/arm64/Makefile
new file mode 100644
index 00000000..0718994d
--- /dev/null
+++ b/bootloader/arch/arm64/Makefile
@@ -0,0 +1,15 @@
+#
+# Jailhouse AArch64 support
+#
+# Copyright (C) 2015 Huawei Technologies Duesseldorf GmbH
+#
+# Authors:
+#  Antonios Motakis <antonios.motakis@huawei.com>
+#
+# This work is licensed under the terms of the GNU GPL, version 2.  See
+# the COPYING file in the top-level directory.
+#
+
+LINUXINCLUDE += -I$(src)/arch/arm-common/include
+
+KBUILD_CFLAGS += -march=armv8-a+nofp
diff --git a/bootloader/arch/arm64/head.S b/bootloader/arch/arm64/head.S
new file mode 100644
index 00000000..7c289ad8
--- /dev/null
+++ b/bootloader/arch/arm64/head.S
@@ -0,0 +1,201 @@
+/*
+ * Jailhouse AArch64 support
+ *
+ * Copyright (C) 2015-2016 Huawei Technologies Duesseldorf GmbH
+ * Copyright (c) 2016 Siemens AG
+ * Copyright (C) 1994-2002 Russell King
+ * Copyright (C) 2003-2012 ARM Ltd.
+ * Copyright 2020 NXP
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2.  See
+ * the COPYING file in the top-level directory.
+ */
+
+#include <asm/sysregs.h>
+
+	.section ".header", "ax"
+	.global secondary_entry
+
+el2_entry:
+	/* Clear BSS */
+	adr	x8, __cpu_id
+	adr	x9, __stack_pool
+	sub	x9, x9, x8
+	lsr	x9, x9, #3
+1:	str	xzr, [x8], #0x8
+	sub	x9, x9, #1
+	cmp	x9, #0
+	b.ne	1b
+
+	/*
+	 * args in bss area, so put after bss clearing
+	 * Store bootargs
+	 */
+	adr	x8, args
+	stp	x0, x1, [x8]
+	add	x8, x8, #16
+	stp	x2, x3, [x8]
+
+	.align 4
+secondary_entry:
+	msr	SPsel, #1
+	mrs	x0, CurrentEL
+	cmp	x0, #CurrentEL_EL2
+	b.eq	2f
+	b	.
+
+2:	ldr	x0, =SCTLR_EL2_RES1
+	msr	sctlr_el2, x0
+
+	mov	x2, xzr
+
+	/* Hyp configuration. */
+	ldr	x0, =HCR_HOST_NVHE_FLAGS
+	msr	hcr_el2, x0
+	isb
+
+	/*
+	 * Allow Non-secure EL1 and EL0 to access physical timer and counter.
+	 * This is not necessary for VHE, since the host kernel runs in EL2,
+	 * and EL0 accesses are configured in the later stage of boot process.
+	 * Note that when HCR_EL2.E2H == 1, CNTHCTL_EL2 has the same bit layout
+	 * as CNTKCTL_EL1, and CNTKCTL_EL1 accessing instructions are redefined
+	 * to access CNTHCTL_EL2. This allows the kernel designed to run at EL1
+	 * to transparently mess with the EL0 bits via CNTKCTL_EL1 access in
+	 * EL2.
+	 */
+	cbnz	x2, 1f
+	mrs	x0, cnthctl_el2
+	orr	x0, x0, #3			// Enable EL1 physical timers
+	msr	cnthctl_el2, x0
+1:
+	msr	cntvoff_el2, xzr		// Clear virtual offset
+
+#ifdef CONFIG_ARM_GIC_V3
+	/* GICv3 system register access */
+	mrs	x0, id_aa64pfr0_el1
+	ubfx	x0, x0, #ID_AA64PFR0_GIC_SHIFT, #4
+	cbz	x0, 3f
+
+	mrs	x0, SYS_ICC_SRE_EL2
+	orr	x0, x0, #ICC_SRE_EL2_SRE	// Set ICC_SRE_EL2.SRE==1
+	orr	x0, x0, #ICC_SRE_EL2_ENABLE	// Set ICC_SRE_EL2.Enable==1
+	msr	SYS_ICC_SRE_EL2, x0
+	isb					// Make sure SRE is now set
+	mrs	x0, SYS_ICC_SRE_EL2		// Read SRE back,
+	tbz	x0, #0, 3f			// and check that it sticks
+	msr	SYS_ICH_HCR_EL2, xzr		// Reset ICC_HCR_EL2 to defaults
+
+3:
+#endif
+
+	/* Populate ID registers. */
+	mrs	x0, midr_el1
+	mrs	x1, mpidr_el1
+	msr	vpidr_el2, x0
+	msr	vmpidr_el2, x1
+
+#ifdef CONFIG_COMPAT
+	msr	hstr_el2, xzr			// Disable CP15 traps to EL2
+#endif
+
+1:
+	/* Stage-2 translation */
+	msr	vttbr_el2, xzr
+
+	cbz	x2, install_el2_stub
+
+	isb
+	ret
+
+install_el2_stub:
+	ldr	x0, =SCTLR_EL1_RES1
+	msr	sctlr_el1, x0
+
+	/* Coprocessor traps. */
+	mov	x0, #0x33ff
+	msr	cptr_el2, x0			// Disable copro. traps to EL2
+
+	/* SVE register access */
+	mrs	x1, id_aa64pfr0_el1
+	ubfx	x1, x1, #ID_AA64PFR0_SVE_SHIFT, #4
+	cbz	x1, 7f
+
+	bic	x0, x0, #CPTR_EL2_TZ		// Also disable SVE traps
+	msr	cptr_el2, x0			// Disable copro. traps to EL2
+	isb
+	mov	x1, #ZCR_ELx_LEN_MASK		// SVE: Enable full vector
+	msr	SYS_ZCR_EL2, x1			// length for EL1.
+
+	/* Hypervisor stub */
+7:	adr	x0, __hyp_stub_vectors
+	msr	vbar_el2, x0
+
+	/*
+	 * Set Stack
+	 * We are not able to get a software friend cpu id, so
+	 * use smp_cores to count how many cores runs into el2_entry,
+	 * and set stack for the core. There is no concurrent access.
+	 * And smp_cores - 1 will be used as cpuid when entry
+	 * Stack size as 0x400
+	 */
+	mov	x7, #0x400
+	adr	x9, smp_cores
+	ldr	x8, [x9]
+	add	x8, x8, #1
+	str	x8, [x9]
+	adr	x10, __stack_pool
+	madd	x10, x8, x7, x10
+	msr	sp_el1, x10
+
+	adr	x1, entry
+	mov	x0, #(PSR_F_BIT | PSR_I_BIT | PSR_A_BIT | PSR_D_BIT |\
+		      PSR_MODE_EL1h)
+	msr	spsr_el2, x0
+	msr	elr_el2, x1
+	adr	x9, smp_cores
+	ldr	x0, [x9]
+	sub	x0, x0, #1
+	eret
+
+.macro	ventry	label
+	.align	7
+	b	\label
+.endm
+	.align 11
+
+	.global __hyp_stub_vectors
+__hyp_stub_vectors:
+	ventry	.
+	ventry	.
+	ventry	.
+	ventry	.
+
+	ventry	.
+	ventry	.
+	ventry	.
+	ventry	.
+
+	ventry	el1_sync			// Synchronous 64-bit EL1
+	ventry	.
+	ventry	.
+	ventry	.
+
+	ventry	.
+	ventry	.
+	ventry	.
+	ventry	.
+
+
+	.align 11
+
+#define HVC_SET_VECTORS 0
+
+el1_sync:
+	cmp	x0, #HVC_SET_VECTORS
+	b.ne	9f
+	msr	vbar_el2, x1
+	b	9f
+9:	mov	x0, xzr
+	eret
+	.ltorg
diff --git a/bootloader/arch/arm64/inmate.c b/bootloader/arch/arm64/inmate.c
new file mode 100644
index 00000000..136dba71
--- /dev/null
+++ b/bootloader/arch/arm64/inmate.c
@@ -0,0 +1,53 @@
+/*
+ * Jailhouse, a Linux-based partitioning hypervisor
+ *
+ * Copyright 2020 NXP
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2.  See
+ * the COPYING file in the top-level directory.
+ */
+
+#include <bootloader.h>
+#include <config.h>
+#include <string.h>
+#include <jailhouse/types.h>
+#include <jailhouse/cell-config.h>
+#include <jailhouse/header.h>
+#include <jailhouse/hypercall.h>
+#include <generated/version.h>
+
+int kick_inmate_cell(void)
+{
+	struct jailhouse_cell_desc *config;
+	int i, err;
+
+	/* Ignore ROOT CELL */
+	for (i = 1; i < MAX_CELL; i++) {
+		config = (struct jailhouse_cell_desc *)(START_ADDR_CELL + i * STRIDE_CELL);
+		if (memcmp(config->signature,
+			   JAILHOUSE_CELL_DESC_SIGNATURE, sizeof(config->signature)) != 0)
+			break;
+
+		if (config->revision != JAILHOUSE_CONFIG_REVISION)
+			break;
+
+		config->name[JAILHOUSE_CELL_NAME_MAXLEN] = 0;
+
+		/* Start from high end */
+		config->id = 256 - i;
+
+		err = jailhouse_call_arg1(JAILHOUSE_HC_CELL_CREATE, (unsigned long)config);
+		if (err)
+			return err;
+
+		err = jailhouse_call_arg1(JAILHOUSE_HC_CELL_SET_LOADABLE, config->id);
+		if (err)
+			return err;
+
+		err = jailhouse_call_arg1(JAILHOUSE_HC_CELL_START, config->id);
+		if (err)
+			return err;
+	}
+
+	return 0;
+}
diff --git a/bootloader/arch/arm64/main.c b/bootloader/arch/arm64/main.c
new file mode 100644
index 00000000..3381ca7e
--- /dev/null
+++ b/bootloader/arch/arm64/main.c
@@ -0,0 +1,218 @@
+/*
+ * Jailhouse, a Linux-based partitioning hypervisor
+ *
+ * Copyright 2020 NXP
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2.  See
+ * the COPYING file in the top-level directory.
+ */
+
+#include <jailhouse/types.h>
+
+#include <asm/sysregs.h>
+#include <asm/psci.h>
+#include <bootloader.h>
+#include <config.h>
+#include <fls.h>
+#include <gic-common.h>
+#include <string.h>
+#include <jailhouse/cell-config.h>
+#include <jailhouse/header.h>
+#include <jailhouse/hypercall.h>
+#include <generated/version.h>
+
+unsigned long __attribute__((aligned(64))) smp_cores = 0UL;
+unsigned long __attribute__((aligned(64))) args[4];
+
+struct jailhouse_header *header;
+struct jailhouse_system *config_header;
+struct jailhouse_system *config;
+struct jailhouse_memory *hv_mem;
+static unsigned long hv_core_and_percpu_size;
+unsigned long config_size;
+void *hypervisor_mem;
+long max_cpus;
+
+static unsigned long call_smcc64(unsigned long fid, unsigned long a0,
+				 unsigned long a1, unsigned long a2,
+				 unsigned long a3, unsigned long a4,
+				 unsigned long a5, unsigned long *ret)
+{
+	register unsigned long x0 asm("x0") = fid;
+	register unsigned long x1 asm("x1") = a0;
+	register unsigned long x2 asm("x2") = a1;
+	register unsigned long x3 asm("x3") = a2;
+	register unsigned long x4 asm("x4") = a3;
+	register unsigned long x5 asm("x5") = a4;
+	register unsigned long x6 asm("x6") = a5;
+
+	asm volatile ("smc #0\n"
+		      : "+r" (x0), "+r" (x1), "+r" (x2), "+r" (x3),
+		      "+r" (x4), "+r" (x5), "+r" (x6)
+		      :
+		      : "x7", "x8", "x9", "x10", "x11", "x12",
+		      "x13", "x14", "x15", "x16", "x17" );
+
+	if (ret) {
+		ret[0] = x0;
+		ret[1] = x1;
+		ret[2] = x2;
+		ret[3] = x3;
+	}
+
+	return x0;
+}
+
+static int psci_cpu_on(unsigned long cpuid, unsigned long entry_point)
+{
+	int err;
+	u32 fn;
+
+	fn = PSCI_0_2_FN64_CPU_ON;
+	err = call_smcc64(fn, cpuid, entry_point, 0, 0, 0, 0, NULL);
+	return err;
+}
+
+static int psci_cpu_off(void)
+{
+	u32 fn;
+
+	fn = PSCI_0_2_FN_CPU_OFF;
+	u32 state = PSCI_POWER_STATE_TYPE_POWER_DOWN <<
+		    PSCI_0_2_POWER_STATE_TYPE_SHIFT;
+
+	call_smcc64(fn, state, 0, 0, 0, 0, 0, NULL);
+
+	return 0;
+}
+
+static int psci_cpu_affinity(unsigned int cpuid)
+{
+	u32 fn;
+
+	fn = PSCI_0_2_FN64_AFFINITY_INFO;
+
+	return call_smcc64(fn, cpuid, 0, 0, 0, 0, 0, NULL);
+}
+
+/* Run in EL1 mode */
+static void enter_hypervisor(void *info, int cpu)
+{
+	struct jailhouse_header *header = info;
+	int (*entry)(unsigned int);
+
+	entry = header->entry + (unsigned long) hypervisor_mem;
+
+	entry(cpu);
+}
+
+static long get_max_cpus(u32 cpu_set_size, const struct jailhouse_system *system_config)
+{
+	u8 *cpu_set = (u8 *)jailhouse_cell_cpu_set((const struct jailhouse_cell_desc *)&system_config->root_cell);
+	unsigned int pos = cpu_set_size;
+	long max_cpu_id;
+	u8 bitmap;
+
+	while (pos-- > 0) {
+		bitmap = *(cpu_set + pos);
+		max_cpu_id = fls(bitmap);
+		if (max_cpu_id > 0) {
+			return pos * 8 + max_cpu_id;
+		}
+	}
+	return -2;
+}
+
+static void panic(void)
+{
+	/* TODO */
+	asm volatile("b .\r\n");
+}
+
+int entry(unsigned int cpuid)
+{
+	int i, ret;
+	void (*kernel_entry)(void *fdt_addr, void *res0, void *res1, void *res2);
+	unsigned long mpidr;
+	void *gicd_base;
+
+	arm_read_sysreg(MPIDR_EL1, mpidr);
+
+	if (cpuid) {
+		__cpu_id[cpuid << 1] = cpuid;
+		/* Used by psci affinity */
+		__cpu_id[(cpuid << 1) + 1] = mpidr & MPIDR_CPUID_MASK;
+		enter_hypervisor(header, cpuid);
+		psci_cpu_off();
+	}
+
+	header = (struct jailhouse_header *)JAILHOUSE_ADDR;
+	config_header = (struct jailhouse_system *)START_ADDR_CELL;
+	hv_mem = &config_header->hypervisor_memory;
+	gicd_base = (void *)(unsigned long)config_header->platform_info.arm.gicd_base;
+
+	if (config_header->platform_info.arm.gic_version != 3)
+		panic();
+
+	max_cpus = get_max_cpus(config_header->root_cell.cpu_set_size, config_header);
+	if (memcmp(header->signature, JAILHOUSE_SIGNATURE, sizeof(header->signature)) != 0)
+		panic();
+
+	hv_core_and_percpu_size = header->core_size +
+		max_cpus * header->percpu_size;
+
+	config_size = jailhouse_system_config_size(config_header);
+
+	if (hv_core_and_percpu_size >= hv_mem->size ||
+	    config_size >= hv_mem->size - hv_core_and_percpu_size)
+		panic();
+
+	hypervisor_mem = (void *)config_header->hypervisor_memory.phys_start;
+	/*
+	 * Copy hypervisor's binary image at beginning of the memory region
+	 * and clear the rest to zero.
+	 */
+	memcpy(hypervisor_mem, header, header->console_page);
+	memset(hypervisor_mem + header->console_page, 0,
+	       hv_mem->size - header->console_page);
+
+	header = (struct jailhouse_header *)hypervisor_mem;
+	header->max_cpus = max_cpus;
+	header->arm_linux_hyp_vectors = (unsigned long long)__hyp_stub_vectors;
+	header->arm_linux_hyp_abi = HYP_STUB_ABI_OPCODE;
+
+	header->online_cpus = max_cpus;
+
+	config = (struct jailhouse_system *)(hypervisor_mem + hv_core_and_percpu_size);
+	memcpy(config, config_header, config_size);
+
+	/* Init GIC */
+	gic_dist_init(gicd_base);
+
+	/* PSCI CPU ON */
+	for (i = 1; i < max_cpus; i++) {
+		ret = psci_cpu_on(i, (unsigned long)secondary_entry);
+		if (ret)
+			panic();
+	}
+
+	enter_hypervisor(header, cpuid);
+
+	for (i = 1; i < max_cpus; i++) {
+		do {
+			/* Wait until off */
+			ret = psci_cpu_affinity(__cpu_id[(i << 1) + 1]);
+		} while (ret == PSCI_CPU_IS_ON);
+	}
+
+	/* Create inmate cells */
+	ret = kick_inmate_cell();
+	if (ret)
+		panic();
+
+	/* Jump to Kernel */
+	kernel_entry = (void (*)(void *, void *, void *, void *))KERNEL_ADDR;
+	kernel_entry((void *)args[0], (void *)args[1], (void *)args[2], (void *)args[3]);
+
+	return 0;
+}
diff --git a/bootloader/include/bootloader.h b/bootloader/include/bootloader.h
new file mode 100644
index 00000000..ba2f626e
--- /dev/null
+++ b/bootloader/include/bootloader.h
@@ -0,0 +1,5 @@
+int kick_inmate_cell(void);
+int entry(unsigned int);
+void secondary_entry(void);
+extern void *__hyp_stub_vectors;
+extern unsigned long __cpu_id[];
diff --git a/bootloader/include/config.h b/bootloader/include/config.h
new file mode 100644
index 00000000..d815f71e
--- /dev/null
+++ b/bootloader/include/config.h
@@ -0,0 +1,5 @@
+#define MAX_CELL	16
+#define STRIDE_CELL	0x10000
+#define START_ADDR_CELL	0x40300000ULL
+#define JAILHOUSE_ADDR	0x40200000ULL
+#define KERNEL_ADDR	0x40480000ULL
diff --git a/bootloader/include/fls.h b/bootloader/include/fls.h
new file mode 100644
index 00000000..e170738d
--- /dev/null
+++ b/bootloader/include/fls.h
@@ -0,0 +1,42 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef _ASM_GENERIC_BITOPS_FLS_H_
+#define _ASM_GENERIC_BITOPS_FLS_H_
+
+/**
+ * fls - find last (most-significant) bit set
+ * @x: the word to search
+ *
+ * This is defined the same way as ffs.
+ * Note fls(0) = 0, fls(1) = 1, fls(0x80000000) = 32.
+ */
+
+static int fls(unsigned int x)
+{
+	int r = 32;
+
+	if (!x)
+		return 0;
+	if (!(x & 0xffff0000u)) {
+		x <<= 16;
+		r -= 16;
+	}
+	if (!(x & 0xff000000u)) {
+		x <<= 8;
+		r -= 8;
+	}
+	if (!(x & 0xf0000000u)) {
+		x <<= 4;
+		r -= 4;
+	}
+	if (!(x & 0xc0000000u)) {
+		x <<= 2;
+		r -= 2;
+	}
+	if (!(x & 0x80000000u)) {
+		x <<= 1;
+		r -= 1;
+	}
+	return r;
+}
+
+#endif /* _ASM_GENERIC_BITOPS_FLS_H_ */
diff --git a/bootloader/include/linux/irqchip/arm-gic-common.h b/bootloader/include/linux/irqchip/arm-gic-common.h
new file mode 100644
index 00000000..e274ee6c
--- /dev/null
+++ b/bootloader/include/linux/irqchip/arm-gic-common.h
@@ -0,0 +1,21 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * include/linux/irqchip/arm-gic-common.h
+ *
+ * Copyright (C) 2016 ARM Limited, All Rights Reserved.
+ */
+#ifndef __LINUX_IRQCHIP_ARM_GIC_COMMON_H
+#define __LINUX_IRQCHIP_ARM_GIC_COMMON_H
+
+#define GICD_INT_DEF_PRI		0xa0
+#define GICD_INT_DEF_PRI_X4		((GICD_INT_DEF_PRI << 24) |\
+					(GICD_INT_DEF_PRI << 16) |\
+					(GICD_INT_DEF_PRI << 8) |\
+					GICD_INT_DEF_PRI)
+
+enum gic_type {
+	GIC_V2,
+	GIC_V3,
+};
+
+#endif /* __LINUX_IRQCHIP_ARM_GIC_COMMON_H */
diff --git a/bootloader/include/linux/irqchip/arm-gic-v3.h b/bootloader/include/linux/irqchip/arm-gic-v3.h
new file mode 100644
index 00000000..2a2ba056
--- /dev/null
+++ b/bootloader/include/linux/irqchip/arm-gic-v3.h
@@ -0,0 +1,674 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (C) 2013, 2014 ARM Limited, All Rights Reserved.
+ * Author: Marc Zyngier <marc.zyngier@arm.com>
+ */
+#ifndef __LINUX_IRQCHIP_ARM_GIC_V3_H
+#define __LINUX_IRQCHIP_ARM_GIC_V3_H
+
+/*
+ * Distributor registers. We assume we're running non-secure, with ARE
+ * being set. Secure-only and non-ARE registers are not described.
+ */
+#define GICD_CTLR			0x0000
+#define GICD_TYPER			0x0004
+#define GICD_IIDR			0x0008
+#define GICD_TYPER2			0x000C
+#define GICD_STATUSR			0x0010
+#define GICD_SETSPI_NSR			0x0040
+#define GICD_CLRSPI_NSR			0x0048
+#define GICD_SETSPI_SR			0x0050
+#define GICD_CLRSPI_SR			0x0058
+#define GICD_SEIR			0x0068
+#define GICD_IGROUPR			0x0080
+#define GICD_ISENABLER			0x0100
+#define GICD_ICENABLER			0x0180
+#define GICD_ISPENDR			0x0200
+#define GICD_ICPENDR			0x0280
+#define GICD_ISACTIVER			0x0300
+#define GICD_ICACTIVER			0x0380
+#define GICD_IPRIORITYR			0x0400
+#define GICD_ICFGR			0x0C00
+#define GICD_IGRPMODR			0x0D00
+#define GICD_NSACR			0x0E00
+#define GICD_IGROUPRnE			0x1000
+#define GICD_ISENABLERnE		0x1200
+#define GICD_ICENABLERnE		0x1400
+#define GICD_ISPENDRnE			0x1600
+#define GICD_ICPENDRnE			0x1800
+#define GICD_ISACTIVERnE		0x1A00
+#define GICD_ICACTIVERnE		0x1C00
+#define GICD_IPRIORITYRnE		0x2000
+#define GICD_ICFGRnE			0x3000
+#define GICD_IROUTER			0x6000
+#define GICD_IROUTERnE			0x8000
+#define GICD_IDREGS			0xFFD0
+#define GICD_PIDR2			0xFFE8
+
+#define ESPI_BASE_INTID			4096
+
+/*
+ * Those registers are actually from GICv2, but the spec demands that they
+ * are implemented as RES0 if ARE is 1 (which we do in KVM's emulated GICv3).
+ */
+#define GICD_ITARGETSR			0x0800
+#define GICD_SGIR			0x0F00
+#define GICD_CPENDSGIR			0x0F10
+#define GICD_SPENDSGIR			0x0F20
+
+#define GICD_CTLR_RWP			(1U << 31)
+#define GICD_CTLR_nASSGIreq		(1U << 8)
+#define GICD_CTLR_DS			(1U << 6)
+#define GICD_CTLR_ARE_NS		(1U << 4)
+#define GICD_CTLR_ENABLE_G1A		(1U << 1)
+#define GICD_CTLR_ENABLE_G1		(1U << 0)
+
+#define GICD_IIDR_IMPLEMENTER_SHIFT	0
+#define GICD_IIDR_IMPLEMENTER_MASK	(0xfff << GICD_IIDR_IMPLEMENTER_SHIFT)
+#define GICD_IIDR_REVISION_SHIFT	12
+#define GICD_IIDR_REVISION_MASK		(0xf << GICD_IIDR_REVISION_SHIFT)
+#define GICD_IIDR_VARIANT_SHIFT		16
+#define GICD_IIDR_VARIANT_MASK		(0xf << GICD_IIDR_VARIANT_SHIFT)
+#define GICD_IIDR_PRODUCT_ID_SHIFT	24
+#define GICD_IIDR_PRODUCT_ID_MASK	(0xff << GICD_IIDR_PRODUCT_ID_SHIFT)
+
+
+/*
+ * In systems with a single security state (what we emulate in KVM)
+ * the meaning of the interrupt group enable bits is slightly different
+ */
+#define GICD_CTLR_ENABLE_SS_G1		(1U << 1)
+#define GICD_CTLR_ENABLE_SS_G0		(1U << 0)
+
+#define GICD_TYPER_RSS			(1U << 26)
+#define GICD_TYPER_LPIS			(1U << 17)
+#define GICD_TYPER_MBIS			(1U << 16)
+#define GICD_TYPER_ESPI			(1U << 8)
+
+#define GICD_TYPER_ID_BITS(typer)	((((typer) >> 19) & 0x1f) + 1)
+#define GICD_TYPER_NUM_LPIS(typer)	((((typer) >> 11) & 0x1f) + 1)
+#define GICD_TYPER_SPIS(typer)		((((typer) & 0x1f) + 1) * 32)
+#define GICD_TYPER_ESPIS(typer)						\
+	(((typer) & GICD_TYPER_ESPI) ? GICD_TYPER_SPIS((typer) >> 27) : 0)
+
+#define GICD_TYPER2_nASSGIcap		(1U << 8)
+#define GICD_TYPER2_VIL			(1U << 7)
+#define GICD_TYPER2_VID			GENMASK(4, 0)
+
+#define GICD_IROUTER_SPI_MODE_ONE	(0U << 31)
+#define GICD_IROUTER_SPI_MODE_ANY	(1U << 31)
+
+#define GIC_PIDR2_ARCH_MASK		0xf0
+#define GIC_PIDR2_ARCH_GICv3		0x30
+#define GIC_PIDR2_ARCH_GICv4		0x40
+
+#define GIC_V3_DIST_SIZE		0x10000
+
+#define GIC_PAGE_SIZE_4K		0ULL
+#define GIC_PAGE_SIZE_16K		1ULL
+#define GIC_PAGE_SIZE_64K		2ULL
+#define GIC_PAGE_SIZE_MASK		3ULL
+
+/*
+ * Re-Distributor registers, offsets from RD_base
+ */
+#define GICR_CTLR			GICD_CTLR
+#define GICR_IIDR			0x0004
+#define GICR_TYPER			0x0008
+#define GICR_STATUSR			GICD_STATUSR
+#define GICR_WAKER			0x0014
+#define GICR_SETLPIR			0x0040
+#define GICR_CLRLPIR			0x0048
+#define GICR_SEIR			GICD_SEIR
+#define GICR_PROPBASER			0x0070
+#define GICR_PENDBASER			0x0078
+#define GICR_INVLPIR			0x00A0
+#define GICR_INVALLR			0x00B0
+#define GICR_SYNCR			0x00C0
+#define GICR_MOVLPIR			0x0100
+#define GICR_MOVALLR			0x0110
+#define GICR_IDREGS			GICD_IDREGS
+#define GICR_PIDR2			GICD_PIDR2
+
+#define GICR_CTLR_ENABLE_LPIS		(1UL << 0)
+#define GICR_CTLR_RWP			(1UL << 3)
+
+#define GICR_TYPER_CPU_NUMBER(r)	(((r) >> 8) & 0xffff)
+
+#define EPPI_BASE_INTID			1056
+
+#define GICR_TYPER_NR_PPIS(r)						\
+	({								\
+		unsigned int __ppinum = ((r) >> 27) & 0x1f;		\
+		unsigned int __nr_ppis = 16;				\
+		if (__ppinum == 1 || __ppinum == 2)			\
+			__nr_ppis +=  __ppinum * 32;			\
+									\
+		__nr_ppis;						\
+	 })
+
+#define GICR_WAKER_ProcessorSleep	(1U << 1)
+#define GICR_WAKER_ChildrenAsleep	(1U << 2)
+
+#define GIC_BASER_CACHE_nCnB		0ULL
+#define GIC_BASER_CACHE_SameAsInner	0ULL
+#define GIC_BASER_CACHE_nC		1ULL
+#define GIC_BASER_CACHE_RaWt		2ULL
+#define GIC_BASER_CACHE_RaWb		3ULL
+#define GIC_BASER_CACHE_WaWt		4ULL
+#define GIC_BASER_CACHE_WaWb		5ULL
+#define GIC_BASER_CACHE_RaWaWt		6ULL
+#define GIC_BASER_CACHE_RaWaWb		7ULL
+#define GIC_BASER_CACHE_MASK		7ULL
+#define GIC_BASER_NonShareable		0ULL
+#define GIC_BASER_InnerShareable	1ULL
+#define GIC_BASER_OuterShareable	2ULL
+#define GIC_BASER_SHAREABILITY_MASK	3ULL
+
+#define GIC_BASER_CACHEABILITY(reg, inner_outer, type)			\
+	(GIC_BASER_CACHE_##type << reg##_##inner_outer##_CACHEABILITY_SHIFT)
+
+#define GIC_BASER_SHAREABILITY(reg, type)				\
+	(GIC_BASER_##type << reg##_SHAREABILITY_SHIFT)
+
+/* encode a size field of width @w containing @n - 1 units */
+#define GIC_ENCODE_SZ(n, w) (((unsigned long)(n) - 1) & GENMASK_ULL(((w) - 1), 0))
+
+#define GICR_PROPBASER_SHAREABILITY_SHIFT		(10)
+#define GICR_PROPBASER_INNER_CACHEABILITY_SHIFT		(7)
+#define GICR_PROPBASER_OUTER_CACHEABILITY_SHIFT		(56)
+#define GICR_PROPBASER_SHAREABILITY_MASK				\
+	GIC_BASER_SHAREABILITY(GICR_PROPBASER, SHAREABILITY_MASK)
+#define GICR_PROPBASER_INNER_CACHEABILITY_MASK				\
+	GIC_BASER_CACHEABILITY(GICR_PROPBASER, INNER, MASK)
+#define GICR_PROPBASER_OUTER_CACHEABILITY_MASK				\
+	GIC_BASER_CACHEABILITY(GICR_PROPBASER, OUTER, MASK)
+#define GICR_PROPBASER_CACHEABILITY_MASK GICR_PROPBASER_INNER_CACHEABILITY_MASK
+
+#define GICR_PROPBASER_InnerShareable					\
+	GIC_BASER_SHAREABILITY(GICR_PROPBASER, InnerShareable)
+
+#define GICR_PROPBASER_nCnB	GIC_BASER_CACHEABILITY(GICR_PROPBASER, INNER, nCnB)
+#define GICR_PROPBASER_nC 	GIC_BASER_CACHEABILITY(GICR_PROPBASER, INNER, nC)
+#define GICR_PROPBASER_RaWt	GIC_BASER_CACHEABILITY(GICR_PROPBASER, INNER, RaWt)
+#define GICR_PROPBASER_RaWb	GIC_BASER_CACHEABILITY(GICR_PROPBASER, INNER, RaWb)
+#define GICR_PROPBASER_WaWt	GIC_BASER_CACHEABILITY(GICR_PROPBASER, INNER, WaWt)
+#define GICR_PROPBASER_WaWb	GIC_BASER_CACHEABILITY(GICR_PROPBASER, INNER, WaWb)
+#define GICR_PROPBASER_RaWaWt	GIC_BASER_CACHEABILITY(GICR_PROPBASER, INNER, RaWaWt)
+#define GICR_PROPBASER_RaWaWb	GIC_BASER_CACHEABILITY(GICR_PROPBASER, INNER, RaWaWb)
+
+#define GICR_PROPBASER_IDBITS_MASK			(0x1f)
+#define GICR_PROPBASER_ADDRESS(x)	((x) & GENMASK_ULL(51, 12))
+#define GICR_PENDBASER_ADDRESS(x)	((x) & GENMASK_ULL(51, 16))
+
+#define GICR_PENDBASER_SHAREABILITY_SHIFT		(10)
+#define GICR_PENDBASER_INNER_CACHEABILITY_SHIFT		(7)
+#define GICR_PENDBASER_OUTER_CACHEABILITY_SHIFT		(56)
+#define GICR_PENDBASER_SHAREABILITY_MASK				\
+	GIC_BASER_SHAREABILITY(GICR_PENDBASER, SHAREABILITY_MASK)
+#define GICR_PENDBASER_INNER_CACHEABILITY_MASK				\
+	GIC_BASER_CACHEABILITY(GICR_PENDBASER, INNER, MASK)
+#define GICR_PENDBASER_OUTER_CACHEABILITY_MASK				\
+	GIC_BASER_CACHEABILITY(GICR_PENDBASER, OUTER, MASK)
+#define GICR_PENDBASER_CACHEABILITY_MASK GICR_PENDBASER_INNER_CACHEABILITY_MASK
+
+#define GICR_PENDBASER_InnerShareable					\
+	GIC_BASER_SHAREABILITY(GICR_PENDBASER, InnerShareable)
+
+#define GICR_PENDBASER_nCnB	GIC_BASER_CACHEABILITY(GICR_PENDBASER, INNER, nCnB)
+#define GICR_PENDBASER_nC 	GIC_BASER_CACHEABILITY(GICR_PENDBASER, INNER, nC)
+#define GICR_PENDBASER_RaWt	GIC_BASER_CACHEABILITY(GICR_PENDBASER, INNER, RaWt)
+#define GICR_PENDBASER_RaWb	GIC_BASER_CACHEABILITY(GICR_PENDBASER, INNER, RaWb)
+#define GICR_PENDBASER_WaWt	GIC_BASER_CACHEABILITY(GICR_PENDBASER, INNER, WaWt)
+#define GICR_PENDBASER_WaWb	GIC_BASER_CACHEABILITY(GICR_PENDBASER, INNER, WaWb)
+#define GICR_PENDBASER_RaWaWt	GIC_BASER_CACHEABILITY(GICR_PENDBASER, INNER, RaWaWt)
+#define GICR_PENDBASER_RaWaWb	GIC_BASER_CACHEABILITY(GICR_PENDBASER, INNER, RaWaWb)
+
+#define GICR_PENDBASER_PTZ				BIT_ULL(62)
+
+/*
+ * Re-Distributor registers, offsets from SGI_base
+ */
+#define GICR_IGROUPR0			GICD_IGROUPR
+#define GICR_ISENABLER0			GICD_ISENABLER
+#define GICR_ICENABLER0			GICD_ICENABLER
+#define GICR_ISPENDR0			GICD_ISPENDR
+#define GICR_ICPENDR0			GICD_ICPENDR
+#define GICR_ISACTIVER0			GICD_ISACTIVER
+#define GICR_ICACTIVER0			GICD_ICACTIVER
+#define GICR_IPRIORITYR0		GICD_IPRIORITYR
+#define GICR_ICFGR0			GICD_ICFGR
+#define GICR_IGRPMODR0			GICD_IGRPMODR
+#define GICR_NSACR			GICD_NSACR
+
+#define GICR_TYPER_PLPIS		(1U << 0)
+#define GICR_TYPER_VLPIS		(1U << 1)
+#define GICR_TYPER_DIRTY		(1U << 2)
+#define GICR_TYPER_DirectLPIS		(1U << 3)
+#define GICR_TYPER_LAST			(1U << 4)
+#define GICR_TYPER_RVPEID		(1U << 7)
+#define GICR_TYPER_COMMON_LPI_AFF	GENMASK_ULL(25, 24)
+#define GICR_TYPER_AFFINITY		GENMASK_ULL(63, 32)
+
+#define GICR_INVLPIR_INTID		GENMASK_ULL(31, 0)
+#define GICR_INVLPIR_VPEID		GENMASK_ULL(47, 32)
+#define GICR_INVLPIR_V			GENMASK_ULL(63, 63)
+
+#define GICR_INVALLR_VPEID		GICR_INVLPIR_VPEID
+#define GICR_INVALLR_V			GICR_INVLPIR_V
+
+#define GIC_V3_REDIST_SIZE		0x20000
+
+#define LPI_PROP_GROUP1			(1 << 1)
+#define LPI_PROP_ENABLED		(1 << 0)
+
+/*
+ * Re-Distributor registers, offsets from VLPI_base
+ */
+#define GICR_VPROPBASER			0x0070
+
+#define GICR_VPROPBASER_IDBITS_MASK	0x1f
+
+#define GICR_VPROPBASER_SHAREABILITY_SHIFT		(10)
+#define GICR_VPROPBASER_INNER_CACHEABILITY_SHIFT	(7)
+#define GICR_VPROPBASER_OUTER_CACHEABILITY_SHIFT	(56)
+
+#define GICR_VPROPBASER_SHAREABILITY_MASK				\
+	GIC_BASER_SHAREABILITY(GICR_VPROPBASER, SHAREABILITY_MASK)
+#define GICR_VPROPBASER_INNER_CACHEABILITY_MASK				\
+	GIC_BASER_CACHEABILITY(GICR_VPROPBASER, INNER, MASK)
+#define GICR_VPROPBASER_OUTER_CACHEABILITY_MASK				\
+	GIC_BASER_CACHEABILITY(GICR_VPROPBASER, OUTER, MASK)
+#define GICR_VPROPBASER_CACHEABILITY_MASK				\
+	GICR_VPROPBASER_INNER_CACHEABILITY_MASK
+
+#define GICR_VPROPBASER_InnerShareable					\
+	GIC_BASER_SHAREABILITY(GICR_VPROPBASER, InnerShareable)
+
+#define GICR_VPROPBASER_nCnB	GIC_BASER_CACHEABILITY(GICR_VPROPBASER, INNER, nCnB)
+#define GICR_VPROPBASER_nC 	GIC_BASER_CACHEABILITY(GICR_VPROPBASER, INNER, nC)
+#define GICR_VPROPBASER_RaWt	GIC_BASER_CACHEABILITY(GICR_VPROPBASER, INNER, RaWt)
+#define GICR_VPROPBASER_RaWb	GIC_BASER_CACHEABILITY(GICR_VPROPBASER, INNER, RaWb)
+#define GICR_VPROPBASER_WaWt	GIC_BASER_CACHEABILITY(GICR_VPROPBASER, INNER, WaWt)
+#define GICR_VPROPBASER_WaWb	GIC_BASER_CACHEABILITY(GICR_VPROPBASER, INNER, WaWb)
+#define GICR_VPROPBASER_RaWaWt	GIC_BASER_CACHEABILITY(GICR_VPROPBASER, INNER, RaWaWt)
+#define GICR_VPROPBASER_RaWaWb	GIC_BASER_CACHEABILITY(GICR_VPROPBASER, INNER, RaWaWb)
+
+/*
+ * GICv4.1 VPROPBASER reinvention. A subtle mix between the old
+ * VPROPBASER and ITS_BASER. Just not quite any of the two.
+ */
+#define GICR_VPROPBASER_4_1_VALID	(1ULL << 63)
+#define GICR_VPROPBASER_4_1_ENTRY_SIZE	GENMASK_ULL(61, 59)
+#define GICR_VPROPBASER_4_1_INDIRECT	(1ULL << 55)
+#define GICR_VPROPBASER_4_1_PAGE_SIZE	GENMASK_ULL(54, 53)
+#define GICR_VPROPBASER_4_1_Z		(1ULL << 52)
+#define GICR_VPROPBASER_4_1_ADDR	GENMASK_ULL(51, 12)
+#define GICR_VPROPBASER_4_1_SIZE	GENMASK_ULL(6, 0)
+
+#define GICR_VPENDBASER			0x0078
+
+#define GICR_VPENDBASER_SHAREABILITY_SHIFT		(10)
+#define GICR_VPENDBASER_INNER_CACHEABILITY_SHIFT	(7)
+#define GICR_VPENDBASER_OUTER_CACHEABILITY_SHIFT	(56)
+#define GICR_VPENDBASER_SHAREABILITY_MASK				\
+	GIC_BASER_SHAREABILITY(GICR_VPENDBASER, SHAREABILITY_MASK)
+#define GICR_VPENDBASER_INNER_CACHEABILITY_MASK				\
+	GIC_BASER_CACHEABILITY(GICR_VPENDBASER, INNER, MASK)
+#define GICR_VPENDBASER_OUTER_CACHEABILITY_MASK				\
+	GIC_BASER_CACHEABILITY(GICR_VPENDBASER, OUTER, MASK)
+#define GICR_VPENDBASER_CACHEABILITY_MASK				\
+	GICR_VPENDBASER_INNER_CACHEABILITY_MASK
+
+#define GICR_VPENDBASER_NonShareable					\
+	GIC_BASER_SHAREABILITY(GICR_VPENDBASER, NonShareable)
+
+#define GICR_VPENDBASER_InnerShareable					\
+	GIC_BASER_SHAREABILITY(GICR_VPENDBASER, InnerShareable)
+
+#define GICR_VPENDBASER_nCnB	GIC_BASER_CACHEABILITY(GICR_VPENDBASER, INNER, nCnB)
+#define GICR_VPENDBASER_nC 	GIC_BASER_CACHEABILITY(GICR_VPENDBASER, INNER, nC)
+#define GICR_VPENDBASER_RaWt	GIC_BASER_CACHEABILITY(GICR_VPENDBASER, INNER, RaWt)
+#define GICR_VPENDBASER_RaWb	GIC_BASER_CACHEABILITY(GICR_VPENDBASER, INNER, RaWb)
+#define GICR_VPENDBASER_WaWt	GIC_BASER_CACHEABILITY(GICR_VPENDBASER, INNER, WaWt)
+#define GICR_VPENDBASER_WaWb	GIC_BASER_CACHEABILITY(GICR_VPENDBASER, INNER, WaWb)
+#define GICR_VPENDBASER_RaWaWt	GIC_BASER_CACHEABILITY(GICR_VPENDBASER, INNER, RaWaWt)
+#define GICR_VPENDBASER_RaWaWb	GIC_BASER_CACHEABILITY(GICR_VPENDBASER, INNER, RaWaWb)
+
+#define GICR_VPENDBASER_Dirty		(1ULL << 60)
+#define GICR_VPENDBASER_PendingLast	(1ULL << 61)
+#define GICR_VPENDBASER_IDAI		(1ULL << 62)
+#define GICR_VPENDBASER_Valid		(1ULL << 63)
+
+/*
+ * GICv4.1 VPENDBASER, used for VPE residency. On top of these fields,
+ * also use the above Valid, PendingLast and Dirty.
+ */
+#define GICR_VPENDBASER_4_1_DB		(1ULL << 62)
+#define GICR_VPENDBASER_4_1_VGRP0EN	(1ULL << 59)
+#define GICR_VPENDBASER_4_1_VGRP1EN	(1ULL << 58)
+#define GICR_VPENDBASER_4_1_VPEID	GENMASK_ULL(15, 0)
+
+#define GICR_VSGIR			0x0080
+
+#define GICR_VSGIR_VPEID		GENMASK(15, 0)
+
+#define GICR_VSGIPENDR			0x0088
+
+#define GICR_VSGIPENDR_BUSY		(1U << 31)
+#define GICR_VSGIPENDR_PENDING		GENMASK(15, 0)
+
+/*
+ * ITS registers, offsets from ITS_base
+ */
+#define GITS_CTLR			0x0000
+#define GITS_IIDR			0x0004
+#define GITS_TYPER			0x0008
+#define GITS_MPIDR			0x0018
+#define GITS_CBASER			0x0080
+#define GITS_CWRITER			0x0088
+#define GITS_CREADR			0x0090
+#define GITS_BASER			0x0100
+#define GITS_IDREGS_BASE		0xffd0
+#define GITS_PIDR0			0xffe0
+#define GITS_PIDR1			0xffe4
+#define GITS_PIDR2			GICR_PIDR2
+#define GITS_PIDR4			0xffd0
+#define GITS_CIDR0			0xfff0
+#define GITS_CIDR1			0xfff4
+#define GITS_CIDR2			0xfff8
+#define GITS_CIDR3			0xfffc
+
+#define GITS_TRANSLATER			0x10040
+
+#define GITS_SGIR			0x20020
+
+#define GITS_SGIR_VPEID			GENMASK_ULL(47, 32)
+#define GITS_SGIR_VINTID		GENMASK_ULL(3, 0)
+
+#define GITS_CTLR_ENABLE		(1U << 0)
+#define GITS_CTLR_ImDe			(1U << 1)
+#define	GITS_CTLR_ITS_NUMBER_SHIFT	4
+#define	GITS_CTLR_ITS_NUMBER		(0xFU << GITS_CTLR_ITS_NUMBER_SHIFT)
+#define GITS_CTLR_QUIESCENT		(1U << 31)
+
+#define GITS_TYPER_PLPIS		(1UL << 0)
+#define GITS_TYPER_VLPIS		(1UL << 1)
+#define GITS_TYPER_ITT_ENTRY_SIZE_SHIFT	4
+#define GITS_TYPER_ITT_ENTRY_SIZE	GENMASK_ULL(7, 4)
+#define GITS_TYPER_IDBITS_SHIFT		8
+#define GITS_TYPER_DEVBITS_SHIFT	13
+#define GITS_TYPER_DEVBITS		GENMASK_ULL(17, 13)
+#define GITS_TYPER_PTA			(1UL << 19)
+#define GITS_TYPER_HCC_SHIFT		24
+#define GITS_TYPER_HCC(r)		(((r) >> GITS_TYPER_HCC_SHIFT) & 0xff)
+#define GITS_TYPER_VMOVP		(1ULL << 37)
+#define GITS_TYPER_VMAPP		(1ULL << 40)
+#define GITS_TYPER_SVPET		GENMASK_ULL(42, 41)
+
+#define GITS_IIDR_REV_SHIFT		12
+#define GITS_IIDR_REV_MASK		(0xf << GITS_IIDR_REV_SHIFT)
+#define GITS_IIDR_REV(r)		(((r) >> GITS_IIDR_REV_SHIFT) & 0xf)
+#define GITS_IIDR_PRODUCTID_SHIFT	24
+
+#define GITS_CBASER_VALID			(1ULL << 63)
+#define GITS_CBASER_SHAREABILITY_SHIFT		(10)
+#define GITS_CBASER_INNER_CACHEABILITY_SHIFT	(59)
+#define GITS_CBASER_OUTER_CACHEABILITY_SHIFT	(53)
+#define GITS_CBASER_SHAREABILITY_MASK					\
+	GIC_BASER_SHAREABILITY(GITS_CBASER, SHAREABILITY_MASK)
+#define GITS_CBASER_INNER_CACHEABILITY_MASK				\
+	GIC_BASER_CACHEABILITY(GITS_CBASER, INNER, MASK)
+#define GITS_CBASER_OUTER_CACHEABILITY_MASK				\
+	GIC_BASER_CACHEABILITY(GITS_CBASER, OUTER, MASK)
+#define GITS_CBASER_CACHEABILITY_MASK GITS_CBASER_INNER_CACHEABILITY_MASK
+
+#define GITS_CBASER_InnerShareable					\
+	GIC_BASER_SHAREABILITY(GITS_CBASER, InnerShareable)
+
+#define GITS_CBASER_nCnB	GIC_BASER_CACHEABILITY(GITS_CBASER, INNER, nCnB)
+#define GITS_CBASER_nC		GIC_BASER_CACHEABILITY(GITS_CBASER, INNER, nC)
+#define GITS_CBASER_RaWt	GIC_BASER_CACHEABILITY(GITS_CBASER, INNER, RaWt)
+#define GITS_CBASER_RaWb	GIC_BASER_CACHEABILITY(GITS_CBASER, INNER, RaWb)
+#define GITS_CBASER_WaWt	GIC_BASER_CACHEABILITY(GITS_CBASER, INNER, WaWt)
+#define GITS_CBASER_WaWb	GIC_BASER_CACHEABILITY(GITS_CBASER, INNER, WaWb)
+#define GITS_CBASER_RaWaWt	GIC_BASER_CACHEABILITY(GITS_CBASER, INNER, RaWaWt)
+#define GITS_CBASER_RaWaWb	GIC_BASER_CACHEABILITY(GITS_CBASER, INNER, RaWaWb)
+
+#define GITS_CBASER_ADDRESS(cbaser)	((cbaser) & GENMASK_ULL(51, 12))
+
+#define GITS_BASER_NR_REGS		8
+
+#define GITS_BASER_VALID			(1ULL << 63)
+#define GITS_BASER_INDIRECT			(1ULL << 62)
+
+#define GITS_BASER_INNER_CACHEABILITY_SHIFT	(59)
+#define GITS_BASER_OUTER_CACHEABILITY_SHIFT	(53)
+#define GITS_BASER_INNER_CACHEABILITY_MASK				\
+	GIC_BASER_CACHEABILITY(GITS_BASER, INNER, MASK)
+#define GITS_BASER_CACHEABILITY_MASK		GITS_BASER_INNER_CACHEABILITY_MASK
+#define GITS_BASER_OUTER_CACHEABILITY_MASK				\
+	GIC_BASER_CACHEABILITY(GITS_BASER, OUTER, MASK)
+#define GITS_BASER_SHAREABILITY_MASK					\
+	GIC_BASER_SHAREABILITY(GITS_BASER, SHAREABILITY_MASK)
+
+#define GITS_BASER_nCnB		GIC_BASER_CACHEABILITY(GITS_BASER, INNER, nCnB)
+#define GITS_BASER_nC		GIC_BASER_CACHEABILITY(GITS_BASER, INNER, nC)
+#define GITS_BASER_RaWt		GIC_BASER_CACHEABILITY(GITS_BASER, INNER, RaWt)
+#define GITS_BASER_RaWb		GIC_BASER_CACHEABILITY(GITS_BASER, INNER, RaWb)
+#define GITS_BASER_WaWt		GIC_BASER_CACHEABILITY(GITS_BASER, INNER, WaWt)
+#define GITS_BASER_WaWb		GIC_BASER_CACHEABILITY(GITS_BASER, INNER, WaWb)
+#define GITS_BASER_RaWaWt	GIC_BASER_CACHEABILITY(GITS_BASER, INNER, RaWaWt)
+#define GITS_BASER_RaWaWb	GIC_BASER_CACHEABILITY(GITS_BASER, INNER, RaWaWb)
+
+#define GITS_BASER_TYPE_SHIFT			(56)
+#define GITS_BASER_TYPE(r)		(((r) >> GITS_BASER_TYPE_SHIFT) & 7)
+#define GITS_BASER_ENTRY_SIZE_SHIFT		(48)
+#define GITS_BASER_ENTRY_SIZE(r)	((((r) >> GITS_BASER_ENTRY_SIZE_SHIFT) & 0x1f) + 1)
+#define GITS_BASER_ENTRY_SIZE_MASK	GENMASK_ULL(52, 48)
+#define GITS_BASER_PHYS_52_to_48(phys)					\
+	(((phys) & GENMASK_ULL(47, 16)) | (((phys) >> 48) & 0xf) << 12)
+#define GITS_BASER_ADDR_48_to_52(baser)					\
+	(((baser) & GENMASK_ULL(47, 16)) | (((baser) >> 12) & 0xf) << 48)
+
+#define GITS_BASER_SHAREABILITY_SHIFT	(10)
+#define GITS_BASER_InnerShareable					\
+	GIC_BASER_SHAREABILITY(GITS_BASER, InnerShareable)
+#define GITS_BASER_PAGE_SIZE_SHIFT	(8)
+#define __GITS_BASER_PSZ(sz)		(GIC_PAGE_SIZE_ ## sz << GITS_BASER_PAGE_SIZE_SHIFT)
+#define GITS_BASER_PAGE_SIZE_4K		__GITS_BASER_PSZ(4K)
+#define GITS_BASER_PAGE_SIZE_16K	__GITS_BASER_PSZ(16K)
+#define GITS_BASER_PAGE_SIZE_64K	__GITS_BASER_PSZ(64K)
+#define GITS_BASER_PAGE_SIZE_MASK	__GITS_BASER_PSZ(MASK)
+#define GITS_BASER_PAGES_MAX		256
+#define GITS_BASER_PAGES_SHIFT		(0)
+#define GITS_BASER_NR_PAGES(r)		(((r) & 0xff) + 1)
+
+#define GITS_BASER_TYPE_NONE		0
+#define GITS_BASER_TYPE_DEVICE		1
+#define GITS_BASER_TYPE_VCPU		2
+#define GITS_BASER_TYPE_RESERVED3	3
+#define GITS_BASER_TYPE_COLLECTION	4
+#define GITS_BASER_TYPE_RESERVED5	5
+#define GITS_BASER_TYPE_RESERVED6	6
+#define GITS_BASER_TYPE_RESERVED7	7
+
+#define GITS_LVL1_ENTRY_SIZE           (8UL)
+
+/*
+ * ITS commands
+ */
+#define GITS_CMD_MAPD			0x08
+#define GITS_CMD_MAPC			0x09
+#define GITS_CMD_MAPTI			0x0a
+#define GITS_CMD_MAPI			0x0b
+#define GITS_CMD_MOVI			0x01
+#define GITS_CMD_DISCARD		0x0f
+#define GITS_CMD_INV			0x0c
+#define GITS_CMD_MOVALL			0x0e
+#define GITS_CMD_INVALL			0x0d
+#define GITS_CMD_INT			0x03
+#define GITS_CMD_CLEAR			0x04
+#define GITS_CMD_SYNC			0x05
+
+/*
+ * GICv4 ITS specific commands
+ */
+#define GITS_CMD_GICv4(x)		((x) | 0x20)
+#define GITS_CMD_VINVALL		GITS_CMD_GICv4(GITS_CMD_INVALL)
+#define GITS_CMD_VMAPP			GITS_CMD_GICv4(GITS_CMD_MAPC)
+#define GITS_CMD_VMAPTI			GITS_CMD_GICv4(GITS_CMD_MAPTI)
+#define GITS_CMD_VMOVI			GITS_CMD_GICv4(GITS_CMD_MOVI)
+#define GITS_CMD_VSYNC			GITS_CMD_GICv4(GITS_CMD_SYNC)
+/* VMOVP, VSGI and INVDB are the odd ones, as they dont have a physical counterpart */
+#define GITS_CMD_VMOVP			GITS_CMD_GICv4(2)
+#define GITS_CMD_VSGI			GITS_CMD_GICv4(3)
+#define GITS_CMD_INVDB			GITS_CMD_GICv4(0xe)
+
+/*
+ * ITS error numbers
+ */
+#define E_ITS_MOVI_UNMAPPED_INTERRUPT		0x010107
+#define E_ITS_MOVI_UNMAPPED_COLLECTION		0x010109
+#define E_ITS_INT_UNMAPPED_INTERRUPT		0x010307
+#define E_ITS_CLEAR_UNMAPPED_INTERRUPT		0x010507
+#define E_ITS_MAPD_DEVICE_OOR			0x010801
+#define E_ITS_MAPD_ITTSIZE_OOR			0x010802
+#define E_ITS_MAPC_PROCNUM_OOR			0x010902
+#define E_ITS_MAPC_COLLECTION_OOR		0x010903
+#define E_ITS_MAPTI_UNMAPPED_DEVICE		0x010a04
+#define E_ITS_MAPTI_ID_OOR			0x010a05
+#define E_ITS_MAPTI_PHYSICALID_OOR		0x010a06
+#define E_ITS_INV_UNMAPPED_INTERRUPT		0x010c07
+#define E_ITS_INVALL_UNMAPPED_COLLECTION	0x010d09
+#define E_ITS_MOVALL_PROCNUM_OOR		0x010e01
+#define E_ITS_DISCARD_UNMAPPED_INTERRUPT	0x010f07
+
+/*
+ * CPU interface registers
+ */
+#define ICC_CTLR_EL1_EOImode_SHIFT	(1)
+#define ICC_CTLR_EL1_EOImode_drop_dir	(0U << ICC_CTLR_EL1_EOImode_SHIFT)
+#define ICC_CTLR_EL1_EOImode_drop	(1U << ICC_CTLR_EL1_EOImode_SHIFT)
+#define ICC_CTLR_EL1_EOImode_MASK	(1 << ICC_CTLR_EL1_EOImode_SHIFT)
+#define ICC_CTLR_EL1_CBPR_SHIFT		0
+#define ICC_CTLR_EL1_CBPR_MASK		(1 << ICC_CTLR_EL1_CBPR_SHIFT)
+#define ICC_CTLR_EL1_PMHE_SHIFT		6
+#define ICC_CTLR_EL1_PMHE_MASK		(1 << ICC_CTLR_EL1_PMHE_SHIFT)
+#define ICC_CTLR_EL1_PRI_BITS_SHIFT	8
+#define ICC_CTLR_EL1_PRI_BITS_MASK	(0x7 << ICC_CTLR_EL1_PRI_BITS_SHIFT)
+#define ICC_CTLR_EL1_ID_BITS_SHIFT	11
+#define ICC_CTLR_EL1_ID_BITS_MASK	(0x7 << ICC_CTLR_EL1_ID_BITS_SHIFT)
+#define ICC_CTLR_EL1_SEIS_SHIFT		14
+#define ICC_CTLR_EL1_SEIS_MASK		(0x1 << ICC_CTLR_EL1_SEIS_SHIFT)
+#define ICC_CTLR_EL1_A3V_SHIFT		15
+#define ICC_CTLR_EL1_A3V_MASK		(0x1 << ICC_CTLR_EL1_A3V_SHIFT)
+#define ICC_CTLR_EL1_RSS		(0x1 << 18)
+#define ICC_CTLR_EL1_ExtRange		(0x1 << 19)
+#define ICC_PMR_EL1_SHIFT		0
+#define ICC_PMR_EL1_MASK		(0xff << ICC_PMR_EL1_SHIFT)
+#define ICC_BPR0_EL1_SHIFT		0
+#define ICC_BPR0_EL1_MASK		(0x7 << ICC_BPR0_EL1_SHIFT)
+#define ICC_BPR1_EL1_SHIFT		0
+#define ICC_BPR1_EL1_MASK		(0x7 << ICC_BPR1_EL1_SHIFT)
+#define ICC_IGRPEN0_EL1_SHIFT		0
+#define ICC_IGRPEN0_EL1_MASK		(1 << ICC_IGRPEN0_EL1_SHIFT)
+#define ICC_IGRPEN1_EL1_SHIFT		0
+#define ICC_IGRPEN1_EL1_MASK		(1 << ICC_IGRPEN1_EL1_SHIFT)
+#define ICC_SRE_EL1_DIB			(1U << 2)
+#define ICC_SRE_EL1_DFB			(1U << 1)
+#define ICC_SRE_EL1_SRE			(1U << 0)
+
+/*
+ * Hypervisor interface registers (SRE only)
+ */
+#define ICH_LR_VIRTUAL_ID_MASK		((1ULL << 32) - 1)
+
+#define ICH_LR_EOI			(1ULL << 41)
+#define ICH_LR_GROUP			(1ULL << 60)
+#define ICH_LR_HW			(1ULL << 61)
+#define ICH_LR_STATE			(3ULL << 62)
+#define ICH_LR_PENDING_BIT		(1ULL << 62)
+#define ICH_LR_ACTIVE_BIT		(1ULL << 63)
+#define ICH_LR_PHYS_ID_SHIFT		32
+#define ICH_LR_PHYS_ID_MASK		(0x3ffULL << ICH_LR_PHYS_ID_SHIFT)
+#define ICH_LR_PRIORITY_SHIFT		48
+#define ICH_LR_PRIORITY_MASK		(0xffULL << ICH_LR_PRIORITY_SHIFT)
+
+/* These are for GICv2 emulation only */
+#define GICH_LR_VIRTUALID		(0x3ffUL << 0)
+#define GICH_LR_PHYSID_CPUID_SHIFT	(10)
+#define GICH_LR_PHYSID_CPUID		(7UL << GICH_LR_PHYSID_CPUID_SHIFT)
+
+#define ICH_MISR_EOI			(1 << 0)
+#define ICH_MISR_U			(1 << 1)
+
+#define ICH_HCR_EN			(1 << 0)
+#define ICH_HCR_UIE			(1 << 1)
+#define ICH_HCR_NPIE			(1 << 3)
+#define ICH_HCR_TC			(1 << 10)
+#define ICH_HCR_TALL0			(1 << 11)
+#define ICH_HCR_TALL1			(1 << 12)
+#define ICH_HCR_EOIcount_SHIFT		27
+#define ICH_HCR_EOIcount_MASK		(0x1f << ICH_HCR_EOIcount_SHIFT)
+
+#define ICH_VMCR_ACK_CTL_SHIFT		2
+#define ICH_VMCR_ACK_CTL_MASK		(1 << ICH_VMCR_ACK_CTL_SHIFT)
+#define ICH_VMCR_FIQ_EN_SHIFT		3
+#define ICH_VMCR_FIQ_EN_MASK		(1 << ICH_VMCR_FIQ_EN_SHIFT)
+#define ICH_VMCR_CBPR_SHIFT		4
+#define ICH_VMCR_CBPR_MASK		(1 << ICH_VMCR_CBPR_SHIFT)
+#define ICH_VMCR_EOIM_SHIFT		9
+#define ICH_VMCR_EOIM_MASK		(1 << ICH_VMCR_EOIM_SHIFT)
+#define ICH_VMCR_BPR1_SHIFT		18
+#define ICH_VMCR_BPR1_MASK		(7 << ICH_VMCR_BPR1_SHIFT)
+#define ICH_VMCR_BPR0_SHIFT		21
+#define ICH_VMCR_BPR0_MASK		(7 << ICH_VMCR_BPR0_SHIFT)
+#define ICH_VMCR_PMR_SHIFT		24
+#define ICH_VMCR_PMR_MASK		(0xffUL << ICH_VMCR_PMR_SHIFT)
+#define ICH_VMCR_ENG0_SHIFT		0
+#define ICH_VMCR_ENG0_MASK		(1 << ICH_VMCR_ENG0_SHIFT)
+#define ICH_VMCR_ENG1_SHIFT		1
+#define ICH_VMCR_ENG1_MASK		(1 << ICH_VMCR_ENG1_SHIFT)
+
+#define ICH_VTR_PRI_BITS_SHIFT		29
+#define ICH_VTR_PRI_BITS_MASK		(7 << ICH_VTR_PRI_BITS_SHIFT)
+#define ICH_VTR_ID_BITS_SHIFT		23
+#define ICH_VTR_ID_BITS_MASK		(7 << ICH_VTR_ID_BITS_SHIFT)
+#define ICH_VTR_SEIS_SHIFT		22
+#define ICH_VTR_SEIS_MASK		(1 << ICH_VTR_SEIS_SHIFT)
+#define ICH_VTR_A3V_SHIFT		21
+#define ICH_VTR_A3V_MASK		(1 << ICH_VTR_A3V_SHIFT)
+
+#define ICC_IAR1_EL1_SPURIOUS		0x3ff
+
+#define ICC_SRE_EL2_SRE			(1 << 0)
+#define ICC_SRE_EL2_ENABLE		(1 << 3)
+
+#define ICC_SGI1R_TARGET_LIST_SHIFT	0
+#define ICC_SGI1R_TARGET_LIST_MASK	(0xffff << ICC_SGI1R_TARGET_LIST_SHIFT)
+#define ICC_SGI1R_AFFINITY_1_SHIFT	16
+#define ICC_SGI1R_AFFINITY_1_MASK	(0xff << ICC_SGI1R_AFFINITY_1_SHIFT)
+#define ICC_SGI1R_SGI_ID_SHIFT		24
+#define ICC_SGI1R_SGI_ID_MASK		(0xfULL << ICC_SGI1R_SGI_ID_SHIFT)
+#define ICC_SGI1R_AFFINITY_2_SHIFT	32
+#define ICC_SGI1R_AFFINITY_2_MASK	(0xffULL << ICC_SGI1R_AFFINITY_2_SHIFT)
+#define ICC_SGI1R_IRQ_ROUTING_MODE_BIT	40
+#define ICC_SGI1R_RS_SHIFT		44
+#define ICC_SGI1R_RS_MASK		(0xfULL << ICC_SGI1R_RS_SHIFT)
+#define ICC_SGI1R_AFFINITY_3_SHIFT	48
+#define ICC_SGI1R_AFFINITY_3_MASK	(0xffULL << ICC_SGI1R_AFFINITY_3_SHIFT)
+
+#include <asm/arch_gicv3.h>
+
+#ifndef __ASSEMBLY__
+
+/*
+ * We need a value to serve as a irq-type for LPIs. Choose one that will
+ * hopefully pique the interest of the reviewer.
+ */
+#define GIC_IRQ_TYPE_LPI		0xa110c8ed
+
+#endif
+
+#endif
diff --git a/bootloader/include/linux/irqchip/arm-gic.h b/bootloader/include/linux/irqchip/arm-gic.h
new file mode 100644
index 00000000..df0394ae
--- /dev/null
+++ b/bootloader/include/linux/irqchip/arm-gic.h
@@ -0,0 +1,34 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ *  include/linux/irqchip/arm-gic.h
+ *
+ *  Copyright (C) 2002 ARM Limited, All Rights Reserved.
+ */
+#ifndef __LINUX_IRQCHIP_ARM_GIC_H
+#define __LINUX_IRQCHIP_ARM_GIC_H
+
+#define GIC_DIST_CTRL			0x000
+#define GIC_DIST_CTR			0x004
+#define GIC_DIST_IIDR			0x008
+#define GIC_DIST_IGROUP			0x080
+#define GIC_DIST_ENABLE_SET		0x100
+#define GIC_DIST_ENABLE_CLEAR		0x180
+#define GIC_DIST_PENDING_SET		0x200
+#define GIC_DIST_PENDING_CLEAR		0x280
+#define GIC_DIST_ACTIVE_SET		0x300
+#define GIC_DIST_ACTIVE_CLEAR		0x380
+#define GIC_DIST_PRI			0x400
+#define GIC_DIST_TARGET			0x800
+#define GIC_DIST_CONFIG			0xc00
+#define GIC_DIST_SOFTINT		0xf00
+#define GIC_DIST_SGI_PENDING_CLEAR	0xf10
+#define GIC_DIST_SGI_PENDING_SET	0xf20
+
+#define GICD_ENABLE			0x1
+#define GICD_DISABLE			0x0
+#define GICD_INT_ACTLOW_LVLTRIG		0x0
+#define GICD_INT_EN_CLR_X32		0xffffffff
+#define GICD_INT_EN_SET_SGI		0x0000ffff
+#define GICD_INT_EN_CLR_PPI		0xffff0000
+
+#endif
diff --git a/bootloader/loader.lds b/bootloader/loader.lds
new file mode 100644
index 00000000..fccc7910
--- /dev/null
+++ b/bootloader/loader.lds
@@ -0,0 +1,22 @@
+SECTIONS
+{
+ . = 0x40000000;
+ .header : { *(.header) }
+ . = ALIGN(16);
+ .text : {
+  __text_start = .;
+  *(.text)
+ }
+ . = ALIGN(16);
+ .rodata : { *(.rodata) }
+ . = ALIGN(16);
+ .data : { *(.data) }
+ . = ALIGN((1 << 12));
+ __cpu_id = .;
+ . += 0x400;
+ __bss_start = .;
+ .bss : { *(.bss*) }
+ . = ALIGN(16);
+ __stack_pool = .;
+ .eh_frame : { *(.eh_frame*) }
+}
diff --git a/hypervisor/arch/arm-common/include/asm/psci.h b/hypervisor/arch/arm-common/include/asm/psci.h
index 4b724877..0b400771 100644
--- a/hypervisor/arch/arm-common/include/asm/psci.h
+++ b/hypervisor/arch/arm-common/include/asm/psci.h
@@ -31,6 +31,16 @@
 #define PSCI_CPU_OFF_V0_1_UBOOT		0x95c1ba5f
 #define PSCI_CPU_ON_V0_1_UBOOT		0x95c1ba60
 
+/* PSCI v0.2 power state encoding for CPU_SUSPEND function */
+#define PSCI_POWER_STATE_TYPE_POWER_DOWN        1
+
+#define PSCI_0_2_POWER_STATE_ID_MASK		0xffff
+#define PSCI_0_2_POWER_STATE_ID_SHIFT		0
+#define PSCI_0_2_POWER_STATE_TYPE_SHIFT		16
+#define PSCI_0_2_POWER_STATE_TYPE_MASK         (0x1 << PSCI_0_2_POWER_STATE_TYPE_SHIFT)
+#define PSCI_0_2_POWER_STATE_AFFL_SHIFT		24
+#define PSCI_0_2_POWER_STATE_AFFL_MASK		(0x3 << PSCI_0_2_POWER_STATE_AFFL_SHIFT)
+
 #define PSCI_SUCCESS			0
 #define PSCI_NOT_SUPPORTED		(-1)
 #define PSCI_INVALID_PARAMETERS		(-2)
diff --git a/hypervisor/arch/arm64/include/asm/sysregs.h b/hypervisor/arch/arm64/include/asm/sysregs.h
index a7370373..597b643d 100644
--- a/hypervisor/arch/arm64/include/asm/sysregs.h
+++ b/hypervisor/arch/arm64/include/asm/sysregs.h
@@ -68,6 +68,8 @@
 #define SCTLR_EL2_RES1	((3 << 4) | (1 << 11) | (1 << 16) | (1 << 18)	\
 			| (3 << 22) | (3 << 28))
 
+#define HCR_APK_BIT	(1uL << 40)
+#define HCR_API_BIT	(1uL << 41)
 #define HCR_MIOCNCE_BIT	(1u << 38)
 #define HCR_ID_BIT	(1u << 33)
 #define HCR_CD_BIT	(1u << 32)
@@ -106,6 +108,8 @@
 #define HCR_SWIO_BIT	(1u << 1)
 #define HCR_VM_BIT	(1u << 0)
 
+#define HCR_HOST_NVHE_FLAGS (HCR_RW_BIT | HCR_API_BIT | HCR_APK_BIT)
+
 /* exception class */
 #define ESR_EC_SHIFT		(26)
 #define ESR_EC(esr)		GET_FIELD((esr), 31, ESR_EC_SHIFT)
@@ -159,6 +163,15 @@
 /* exception level in SPSR_ELx */
 #define SPSR_EL(spsr)		(((spsr) & 0xc) >> 2)
 
+#define CurrentEL_EL2		(2 << 2)
+#define CPTR_EL2_TZ		(1 << 8)
+#define ZCR_ELx_LEN_MASK	0x1ff
+
+#define ID_AA64PFR0_GIC_SHIFT           24
+#define ID_AA64PFR0_SVE_SHIFT		32
+
+#define SYS_ZCR_EL2			S3_4_C1_C2_0
+
 #ifndef __ASSEMBLY__
 
 #include <jailhouse/string.h>
-- 
2.16.4

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20200807030632.28259-10-peng.fan%40nxp.com.
