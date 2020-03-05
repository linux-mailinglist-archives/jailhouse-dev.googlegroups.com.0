Return-Path: <jailhouse-dev+bncBDAMFR7JZAEBB3MHQPZQKGQED6E2ZBA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x53e.google.com (mail-ed1-x53e.google.com [IPv6:2a00:1450:4864:20::53e])
	by mail.lfdr.de (Postfix) with ESMTPS id C942017A21C
	for <lists+jailhouse-dev@lfdr.de>; Thu,  5 Mar 2020 10:18:37 +0100 (CET)
Received: by mail-ed1-x53e.google.com with SMTP id y23sf3904834edt.2
        for <lists+jailhouse-dev@lfdr.de>; Thu, 05 Mar 2020 01:18:37 -0800 (PST)
ARC-Seal: i=3; a=rsa-sha256; t=1583399917; cv=pass;
        d=google.com; s=arc-20160816;
        b=PplFeGVARh4bXwXtJyyy8jz0YTQnS4jCGbOSrJUkymlOfPpVzWBtXFqCXaJgLzgLg4
         LBm5aTYo8dseHR50lmkwzIarWfIwg8/16V1fdGgGJLRGF0klHL7XmwvnGfrPR1fzJyKH
         X1HojyhHlT1jVDzYNMEZ8pvvdtuL47KM/IQHGbr8f84mj6I1K3Rf0TfwprJ4F9hRweto
         YcqYRVCtKOclufh+x1n+cY6p44pJoYBC0eTbiX33pJPRrN2cSuyIuVZl/iO5AmlKe0on
         VK7yRE6fnjDg52+cAypCVmFDOHZIxQI2ugbm87VTNOv9fCJu3S1bpco3lTOrFwFgjCmG
         mn6g==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:message-id:date
         :subject:cc:to:from:sender:dkim-signature;
        bh=/9vmrQ321Y70/JzjWmhlqj7lzxUEe0ACRdpxLobL/L8=;
        b=dDj+4Ye0xgu5AvXLG6FwqqWICctn9Tc84ijPJQO1O3SkPDLpPkC/kEZmtMkm/w0R/S
         jrIWfobPRK+zEJPY/4zZ1pnZxc7JEoden/gOUwOWX/xeRodp9hPbSc/iws0cIZ7barqM
         YCgxET6elVMlQwK8QYd/h9+HMFHjzkeAZw8ZgB1xKscl9ySuNyvKOqB4dsK8gX1nk8Fa
         +e4VdFUeuAApnaP/Dj5UHtX+3lhNwW7tmZJEVvy5mWk0jYgtQB5tmTiHG6/cicpX3f2l
         O2n6H6JiKHSoMRWa4XI9bcwEiH3VdCjstJUBFaaLBhsj7AxEbnarPhgfEeO7Rp/QLYAI
         7veQ==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=mSEQ7RLJ;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of peng.fan@nxp.com designates 40.107.7.87 as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=/9vmrQ321Y70/JzjWmhlqj7lzxUEe0ACRdpxLobL/L8=;
        b=bdeMe/uIHczPUl8ELVz1ZlzOhezmu9EtWg8PhyAnUX6ym+cDOPErmSQsg/qAJ7hcyz
         f/ZNdku3GZPH2ues7G+U2bpQGCa3nVxJZpQayqnbUlYHx9mxVVa3RiQ8a31Xc/WYMlzb
         4YVOVI1bt30w2dSnFUTpuvMG3WFvvGWrrj/rTcyQdptA2LtoIT19wEP8FsRK5XVyqckN
         yQGDcYd3kq1FFT0H7c7kxzBAVOzglQsvaBOFM8zOhSllwSIvRNz9JlGihKUEsAwKctTF
         vviM5hUIlbBOCIbd+xVOtxh7IEpXDRit+0sH/q4tiHm9ulFZZMBfz/QgHkKBoZahpaRb
         qLBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=/9vmrQ321Y70/JzjWmhlqj7lzxUEe0ACRdpxLobL/L8=;
        b=sT/HLqPHOW1wrfAVWcFkKpGk3tOIlNSThtdRrohEjcRyoHuQQwHx1ExunSEAkhHptm
         sOZC8eCGSiPD8NLIh8mGYYhGdnFaX7xw7ynQGEsK3dN3Lp31j8VQBd8zEFeC/8FjY8YE
         NQvd+lsdxte+RPZIWZBZhhlSfsMydMOD64J56MLSkAYSOh9QmSlmTC5+8Xr/RB1TJk/Q
         5uWLVHh5QwoGnECdptiX0SUcKFDHW+/gjlqvIqJ8LzibO+IGx4lMP4nhMd564WUoBhKY
         MtQHzmsAjQQc9K2vLFiUBJTpTWk/bKg5doqd8MytqGL8PdRbRt9xVMTQM8sWOJpL0c24
         rSRQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: ANhLgQ2t0IbEk9eN0kVNI6d0X5FJypBYqdTQk6dg7kWrbS/UPNffwcJD
	l2s+C8vHuOpu6dzS/VufGwY=
X-Google-Smtp-Source: ADFU+vuNPSXwovtrbksiJXxTYasczS24mRHkkHEMqjVoObzYnUGrsiqycS8O+GXrBoFytRgdCCCdwQ==
X-Received: by 2002:a05:6402:1618:: with SMTP id f24mr6149781edv.51.1583399917520;
        Thu, 05 Mar 2020 01:18:37 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:906:33d6:: with SMTP id w22ls1170955eja.11.gmail; Thu,
 05 Mar 2020 01:18:36 -0800 (PST)
X-Received: by 2002:a17:906:4089:: with SMTP id u9mr6632417ejj.184.1583399916658;
        Thu, 05 Mar 2020 01:18:36 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1583399916; cv=pass;
        d=google.com; s=arc-20160816;
        b=dxOCDixfGWH751VqFp4lQFFEK+8f7QajpBchyUNhRF7Vd3fYDlk0q1DEC9NxlabUpg
         hfSUUS6N4qg/F0SbabBK/XRjIQsfGg80v4U7pm2/dwNBDXIJYNLAJQJ9IbBt/92ZVEGa
         vipCr+AQBbpHCN3Cc2aT4QjshR6YUkpXsXZYnMUPvhJo3cNJV0dJJu8YNOHexO38l6PL
         dfUW+8929zeno5zwH1/7l1nT2SZW4cubbokly/1CQwMmuf6cKyTioWngfB5nzqnhTjts
         kgTeF+YbBaZd8c94d7lM1bHZSCT/vQFLCsYCYYS6xktwY6IwsdEMbAZPf8yIFxsQW8v3
         fI3g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=zlsB1tYdU0cn4EJEFAaDTNYk0iea3+jyNe3afjAfnjk=;
        b=xu/9vONdte82jeKX9Jt4mXBe2ZPKzRGs+dmuZKMSgYHbH5Cn2Z6C1hSAczTbAmrSn/
         ZN8LiiVG+U3+YHL79y5FCo2pi4FwMq0IjTNLOQ9wsNozTaxt4m3/j3OhMMz09L+e0Oso
         FsBQ/lsMdtzoAWuSV7wSZpZC9mZVQeimy3zBIRivqj82THZButRmmxp1WsCAct5CKVDh
         t2itqzzhFD4KlujGCErj1sEwXqrkl1QTGlok60zwieuA2vCZfiRtM+kbEzjP1b8Gulsr
         Hj/yvM9bEDzuU4FjTYZXAcl8KKYp184Ge1UgB9WDbAMJz0LJZJlTRgI4P9n5FBH4c2o9
         A/Lg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=mSEQ7RLJ;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of peng.fan@nxp.com designates 40.107.7.87 as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (mail-eopbgr70087.outbound.protection.outlook.com. [40.107.7.87])
        by gmr-mx.google.com with ESMTPS id g12si316587eje.1.2020.03.05.01.18.36
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 05 Mar 2020 01:18:36 -0800 (PST)
Received-SPF: pass (google.com: domain of peng.fan@nxp.com designates 40.107.7.87 as permitted sender) client-ip=40.107.7.87;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D9ZjCa/LCKmXMWpRUL8SP3P881ujk0IHTKjvh5WuqnZVTTX39j3Hb67oI3YubjbdqThr/C3WZJCiRsoE1qia/u+nTcxfdivwCl3D3xdBPS4fKFaSLLBppCs/cBsSfkrx4DNKLawj4JRz8CDEEUgrV0a2fsPcl7urX4o+IzkW0Hny5Yu+yBmVnNCKTOPTrdwJ27+DK37fAGKyfZ3ctiaObA772Ziqr1Hkv8cR7/xg/1xQOoKxghGC0hjELzWZmOjJhhT3JxIMXsQ6CrI0tCgsju20g5gbWEptOtL0RIhNi2E0qMUNiANSfjotbuyrtjuHfKFpp2Ze+YyNSTMuUPwTHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zlsB1tYdU0cn4EJEFAaDTNYk0iea3+jyNe3afjAfnjk=;
 b=jwmIMaqwoAZAZk0u8zkqYbqGV+vvujU4ANwOZRM3TR/L82vtNyeS7VDxlOAjWVV7yhGemqsVQZf7FsDSfjvpprFoJmE8CusI3F+6mNPnFbAppHQYMR6AwjnT8/VfHDnVjQAMxMirSZ1R8+ZNevZPUqMgHkE2FViqiLy7rttjchQdJ/KF6S8yZX4qcnPg2Q41QyzByGkrpwsJBmzha300WY+60biBqhnEbngPxvyf9b+7vNJvMpm4Z2h+JbFhKa5KFRcbV8pnICroTaDdE33+LpOE/KFo04xb9j/Z8EvT0VMqfgA5UpcFphgZu+n1vwdWshsEtG+9iq/C0+bikLFl9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
Received: from AM0PR04MB4481.eurprd04.prod.outlook.com (52.135.147.15) by
 AM0PR04MB5442.eurprd04.prod.outlook.com (20.178.116.96) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2772.18; Thu, 5 Mar 2020 09:18:35 +0000
Received: from AM0PR04MB4481.eurprd04.prod.outlook.com
 ([fe80::91e2:17:b3f4:d422]) by AM0PR04MB4481.eurprd04.prod.outlook.com
 ([fe80::91e2:17:b3f4:d422%3]) with mapi id 15.20.2772.019; Thu, 5 Mar 2020
 09:18:35 +0000
From: peng.fan@nxp.com
To: jailhouse-dev@googlegroups.com
Cc: alice.guo@nxp.com,
	Peng Fan <peng.fan@nxp.com>
Subject: [PATCH 0/2] boot jailhouse before root cell linux
Date: Thu,  5 Mar 2020 17:39:48 +0800
Message-Id: <20200305093950.848-1-peng.fan@nxp.com>
X-Mailer: git-send-email 2.16.4
Content-Type: text/plain; charset="UTF-8"
X-ClientProxiedBy: SG2P153CA0014.APCP153.PROD.OUTLOOK.COM (2603:1096::24) To
 AM0PR04MB4481.eurprd04.prod.outlook.com (2603:10a6:208:70::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from linux-ljuv.ap.freescale.net (119.31.174.71) by SG2P153CA0014.APCP153.PROD.OUTLOOK.COM (2603:1096::24) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2814.1 via Frontend Transport; Thu, 5 Mar 2020 09:18:33 +0000
X-Mailer: git-send-email 2.16.4
X-Originating-IP: [119.31.174.71]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: fa0e7148-7280-422f-6ec4-08d7c0e62e63
X-MS-TrafficTypeDiagnostic: AM0PR04MB5442:|AM0PR04MB5442:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM0PR04MB5442B8AF81C55B2D97EB301788E20@AM0PR04MB5442.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:913;
X-Forefront-PRVS: 03333C607F
X-Forefront-Antispam-Report: SFV:NSPM;SFS:(10009020)(4636009)(376002)(366004)(136003)(39860400002)(346002)(396003)(189003)(199004)(1076003)(8676002)(2906002)(81166006)(8936002)(36756003)(66556008)(66476007)(66946007)(6916009)(478600001)(81156014)(4326008)(30864003)(5660300002)(52116002)(6512007)(86362001)(26005)(9686003)(16526019)(186003)(2616005)(6506007)(956004)(6486002)(6666004)(316002);DIR:OUT;SFP:1101;SCL:1;SRVR:AM0PR04MB5442;H:AM0PR04MB4481.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
Received-SPF: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: R9o/ttyeTyUfcPjvs+zs/h+r/reikLW4lIk24Z018EREJCG1f6cK9oPm5w52LuhiES/kmFDRhTftLwRWp2Pl4T6lkl7UhQFtb2EPZba010rgEtx1bivUMzv2F9DSXpQdqPuF5d4Dtkzi2UUuv3wzUio8msXT/6NiUnvYvLSRR/N3VjvhxThCZrmVU8RWA+G64V6U8HN2zIxbdUgw+hUbKS8jDwRkqUF8Kp0kFYiB1CKqYMHUZ+l/Sqvzv1njWzK61x3GDZ78iOXZxSdBQLqUPhIG7zfeWgOfGi2/EL0D/guE3p5y5LEhw+LwNael4DyUvvGy4ArVGkF5NU8d8PTaYPP5iZmy/VgCjiNW28p69zp/11JPZbJw2hV5bsItCDSmWdzFPGsBJUoBVdksaG1iBtsDqLtF/FgZHcYRPDaXUlBrhbKsaRtStHMIYdvYZVK8
X-MS-Exchange-AntiSpam-MessageData: G8bJWw+lUqUZD2UiU/lk7bYjvdVFE2HIZa5ORlO6UoQPicXBfZ257tFAJX6z75rx4qIiHdYrXA4yqEt/UAjnfXlwqNhzCgUHiZvbXLRu7b/vc7NT8tKSJe+vNj6vWplHFNoLnuG0lBlLUnGCdVNgXA==
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fa0e7148-7280-422f-6ec4-08d7c0e62e63
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2020 09:18:35.1892
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2UU9SrEFdw+jrTnDjh26eTf2eoCsPvaJiM9pocxShDC7wcmWn2ARDK8Hig2/liX9xAK3CMxcS3R6qo/qJQr5gQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB5442
X-Original-Sender: peng.fan@nxp.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@nxp.com header.s=selector2 header.b=mSEQ7RLJ;       arc=pass (i=1
 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass
 fromdomain=nxp.com);       spf=pass (google.com: domain of peng.fan@nxp.com
 designates 40.107.7.87 as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
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

This patchset tested on i.MX8MN arm64 with quad A53 cores

Patch 1 is to align jailhouse_system. Since the loader not have
MMU enabled, unaligned access will cause abort.

Patch 2 is not that well orgnized. It does GICv3 initialization,
SMP boot up. Then kick inmate cell and root cell.
Some code are hardcoding for now.

The boot log as below, you could see root linux and gic demo both running:
root cell not able to manage inmate cell for now. But I think it
could be supported. intercell communication not aded currently.

From test log, linux root cell boot will cause large latency for gic-demo
jitter.

It maybe good to use cache color on ARMv8, but still have issues
for root cell DMA without SMMU.

## Loading kernel from FIT Image at 60000000 ...
   Using 'config@1' configuration
   Trying 'kernel' kernel subimage
     Description:  linux
     Type:         Kernel Image
     Compression:  uncompressed
     Data Start:   0x60000650
     Data Size:    6072 Bytes = 5.9 KiB
     Architecture: AArch64
     OS:           Linux
     Load Address: 0x40000000
     Entry Point:  0x40000000
   Verifying Hash Integrity ... OK
## Loading fdt from FIT Image at 60000000 ...
   Using 'config@1' configuration
   Trying 'fdt' fdt subimage
     Description:  fdt
     Type:         Flat Device Tree
     Compression:  uncompressed
     Data Start:   0x61a90f90
     Data Size:    39890 Bytes = 39 KiB
     Architecture: AArch64
     Load Address: 0x43000000
   Verifying Hash Integrity ... OK
   Loading fdt from 0x61a90f90 to 0x43000000
   Booting using the fdt blob at 0x43000000
## Loading loadables from FIT Image at 60000000 ...
   Trying 'hypervisor' loadables subimage
     Description:  Jailhouse hypervisor
     Type:         Standalone Program
     Compression:  uncompressed
     Data Start:   0x60001e08
     Data Size:    104456 Bytes = 102 KiB
     Architecture: AArch64
     Load Address: 0x40200000
     Entry Point:  unavailable
   Verifying Hash Integrity ... OK
   Loading loadables from 0x60001e08 to 0x40200000
## Loading loadables from FIT Image at 60000000 ...
   Trying 'cell@0' loadables subimage
     Description:  i.MX8MN cell
     Type:         Standalone Program
     Compression:  uncompressed
     Data Start:   0x6001b610
     Data Size:    1218 Bytes = 1.2 KiB
     Architecture: AArch64
     Load Address: 0x40300000
     Entry Point:  unavailable
   Verifying Hash Integrity ... OK
   Loading loadables from 0x6001b610 to 0x40300000
## Loading loadables from FIT Image at 60000000 ...
   Trying 'inmate@0' loadables subimage
     Description:  ROOT CELL image
     Type:         Standalone Program
     Compression:  uncompressed
     Data Start:   0x6001bad4
     Data Size:    27720192 Bytes = 26.4 MiB
     Architecture: AArch64
     Load Address: 0x40480000
     Entry Point:  unavailable
   Verifying Hash Integrity ... OK
   Loading loadables from 0x6001bad4 to 0x40480000
## Loading loadables from FIT Image at 60000000 ...
   Trying 'cell@1' loadables subimage
     Description:  i.MX8MN GIC-CELL
     Type:         Standalone Program
     Compression:  uncompressed
     Data Start:   0x61a8b4d4
     Data Size:    236 Bytes = 236 Bytes
     Architecture: AArch64
     Load Address: 0x40310000
     Entry Point:  unavailable
   Verifying Hash Integrity ... OK
   Loading loadables from 0x61a8b4d4 to 0x40310000
## Loading loadables from FIT Image at 60000000 ...
   Trying 'inmate@1' loadables subimage
     Description:  i.MX8MN GIC-DEMO
     Type:         Standalone Program
     Compression:  uncompressed
     Data Start:   0x61a8b5c0
     Data Size:    22992 Bytes = 22.5 KiB
     Architecture: AArch64
     Load Address: 0xb3c00000
     Entry Point:  unavailable
   Verifying Hash Integrity ... OK
   Loading loadables from 0x61a8b5c0 to 0xb3c00000
   Loading Kernel Image ... OK
   Using Device Tree in place at 0000000043000000, end 000000004300cbd1

Starting kernel ...


Initializing Jailhouse hypervisor v0.12 (20-g40c6fd8f) on CPU 1
Code location: 0x0000ffffc0200800
Page pool usage after early setup: mem 39/993, remap 0/131072
Initializing processors:
 CPU 1... OK
 CPU 0... OK
 CPU 3... OK
 CPU 2... OK
Initializing unit: irqchip
Initializing unit: ARM SMMU v3
Initializing unit: PVU IOMMU
Initializing unit: PCI
Adding virtual PCI device 00:00.0 to cell "imx8mm"
Adding virtual PCI device 00:01.0 to cell "imx8mm"
Page pool usage after late setup: mem 60/993, remap 144/131072
Activating hypervisor
Created cell "gic-demo"
Page pool usage after cell creation: mem 72/993, remap 144/131072
Cell "gic-demo" can be loaded
Started cell "gic-demo"
Initializing the GIC...
Initializing the timer...
[    0.000000] Booting Linux on physical CPU 0x0000000000 [0x410fd034]
[    0.000000] Linux version 5.4.3-00028-g643910d36b96-dirty (Freenix@linux-ljuv) (gcc version 9.2.0 (GCC)) #105 SMP PREEMPT Wed Mar 4 15:21:58 CST 2020
[    0.000000] Machine model: NXP i.MX8MNano DDR4 EVK board
[    0.000000] earlycon: ec_imx6q0 at MMIO 0x0000000030890000 (options '115200')
[    0.000000] printk: bootconsole [ec_imx6q0] enabled
[    0.000000] efi: Getting EFI parameters from FDT:
[    0.000000] efi: UEFI not found.
[    0.000000] Reserved memory: created CMA memory pool at 0x000000006a000000, size 640 MiB
[    0.000000] OF: reserved mem: initialized node linux,cma, compatible id shared-dma-pool
Timer fired, jitter:   2999 ns, min:   2999 ns, max:   2999 ns
[    0.000000] NUMA: No NUMA configuration found
[    0.000000] NUMA: Faking a node at [mem 0x0000000040000000-0x00000000bdffffff]
[    0.000000] NUMA: NODE_DATA [mem 0xbdd04500-0xbdd05fff]
[    0.000000] Zone ranges:
[    0.000000]   DMA32    [mem 0x0000000040000000-0x00000000bdffffff]
[    0.000000]   Normal   empty
[    0.000000] Movable zone start for each node
[    0.000000] Early memory node ranges
[    0.000000]   node   0: [mem 0x0000000040000000-0x0000000093bfffff]
[    0.000000]   node   0: [mem 0x00000000b8000000-0x00000000bb6fffff]
[    0.000000]   node   0: [mem 0x00000000bbc00000-0x00000000bdffffff]
[    0.000000] Zeroed struct page in unavailable ranges: 256 pages
[    0.000000] Initmem setup node 0 [mem 0x0000000040000000-0x00000000bdffffff]
Timer fired, jitter:   1624 ns, min:   1624 ns, max:   2999 ns
[    0.000000] psci: probing for conduit method from DT.
[    0.000000] psci: PSCIv1.1 detected in firmware.
[    0.000000] psci: Using standard PSCI v0.2 function IDs
[    0.000000] psci: MIGRATE_INFO_TYPE not supported.
[    0.000000] psci: SMC Calling Convention v1.1
[    0.000000] percpu: Embedded 24 pages/cpu s58904 r8192 d31208 u98304
[    0.000000] Detected VIPT I-cache on CPU0
[    0.000000] CPU features: detected: ARM erratum 845719
[    0.000000] CPU features: detected: GIC system register CPU interface
[    0.000000] Built 1 zonelists, mobility grouping on.  Total pages: 360612
[    0.000000] Policy zone: DMA32
[    0.000000] Kernel command line: console=ttymxc1,115200 earlycon=ec_imx6q,0x30890000,115200 root=/dev/mmcblk1p2 rootwait rw
[    0.000000] Dentry cache hash table entries: 262144 (order: 9, 2097152 bytes, linear)
[    0.000000] Inode-cache hash table entries: 131072 (order: 8, 1048576 bytes, linear)
[    0.000000] mem auto-init: stack:off, heap alloc:off, heap free:off
Timer fired, jitter:   7999 ns, min:   1624 ns, max:   7999 ns
[    0.000000] Memory: 742552K/1465344K available (16316K kernel code, 1342K rwdata, 6380K rodata, 2944K init, 1015K bss, 67432K reserved, 655360K cma-reserved)
[    0.000000] SLUB: HWalign=64, Order=0-3, MinObjects=0, CPUs=4, Nodes=1
[    0.000000] rcu: Preemptible hierarchical RCU implementation.
[    0.000000] rcu:     RCU restricting CPUs from NR_CPUS=256 to nr_cpu_ids=4.
[    0.000000]  Tasks RCU enabled.
[    0.000000] rcu: RCU calculated value of scheduler-enlistment delay is 25 jiffies.
[    0.000000] rcu: Adjusting geometry for rcu_fanout_leaf=16, nr_cpu_ids=4
[    0.000000] NR_IRQS: 64, nr_irqs: 64, preallocated irqs: 0
[    0.000000] GICv3: 128 SPIs implemented
[    0.000000] GICv3: 0 Extended SPIs implemented
[    0.000000] GICv3: Distributor has no Range Selector support
[    0.000000] GICv3: 16 PPIs implemented
[    0.000000] GICv3: no VLPI support, no direct LPI support
[    0.000000] GICv3: CPU0: found redistributor 0 region 0:0x0000000038880000
[    0.000000] ITS: No ITS available, not enabling LPIs
[    0.000000] random: get_random_bytes called from start_kernel+0x2b8/0x44c with crng_init=0
[    0.000000] arch_timer: cp15 timer(s) running at 8.00MHz (virt).
[    0.000000] clocksource: arch_sys_counter: mask: 0xffffffffffffff max_cycles: 0x1d854df40, max_idle_ns: 440795202120 ns
[    0.000004] sched_clock: 56 bits at 8MHz, resolution 125ns, wraps every 2199023255500ns
[    0.008448] Console: colour dummy device 80x25
[    0.012571] Calibrating delay loop (skipped), value calculated using timer frequency.. 16.00 BogoMIPS (lpj=32000)
[    0.022844] pid_max: default: 32768 minimum: 301
[    0.027546] LSM: Security Framework initializing
[    0.032169] Mount-cache hash table entries: 4096 (order: 3, 32768 bytes, linear)
[    0.039565] Mountpoint-cache hash table entries: 4096 (order: 3, 32768 bytes, linear)
Timer fired, jitter:   2374 ns, min:   1624 ns, max:   7999 ns
[    0.071508] ASID allocator initialised with 32768 entries
[    0.079504] rcu: Hierarchical SRCU implementation.
[    0.088337] EFI services will not be available.
[    0.095538] smp: Bringing up secondary CPUs ...
Timer fired, jitter:    749 ns, min:    749 ns, max:   7999 ns
[    0.127643] Detected VIPT I-cache on CPU1
[    0.127671] GICv3: CPU1: found redistributor 1 region 0:0x00000000388a0000
[    0.127700] CPU1: Booted secondary processor 0x0000000001 [0x410fd034]
[    0.159684] Detected VIPT I-cache on CPU2
[    0.159700] GICv3: CPU2: found redistributor 2 region 0:0x00000000388c0000
[    0.159717] CPU2: Booted secondary processor 0x0000000002 [0x410fd034]
[    0.191721] psci: failed to boot CPU3 (-1)
[    0.227974] CPU3: failed to boot: -1
[    0.231609] smp: Brought up 1 node, 3 CPUs
[    0.235680] SMP: Total of 3 processors activated.
[    0.240396] CPU features: detected: 32-bit EL0 Support
[    0.245568] CPU features: detected: CRC32 instructions
[    0.259436] CPU: All CPU(s) started at EL1
[    0.260692] alternatives: patching kernel code
[    0.266398] devtmpfs: initialized
Timer fired, jitter:    749 ns, min: [    0.274443] clocksource: jiffies: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 7645041785100000 ns
[    0.281523] futex hash table entries: 1024 (order: 4, 65536 bytes, linear)


Peng Fan (2):
  cell-config: reserve an entry to align jailhouse_system
  support booting jailhouse before root cell linux

 Kbuild                                          |   2 +-
 hypervisor/arch/arm-common/include/asm/gic.h    |   3 +
 hypervisor/arch/arm-common/include/asm/gic_v3.h |  18 ++
 include/jailhouse/cell-config.h                 |   1 +
 loader/Makefile                                 |  49 ++++
 loader/configs.h                                |  30 +++
 loader/fit.its                                  |  85 ++++++
 loader/gic-v3.c                                 | 154 +++++++++++
 loader/head.S                                   | 327 ++++++++++++++++++++++++
 loader/inmate.c                                 |  63 +++++
 loader/lib.c                                    |  56 ++++
 loader/loader.h                                 |  15 ++
 loader/loader.lds.S                             |  66 +++++
 loader/main.c                                   | 194 ++++++++++++++
 loader/mmio.h                                   |  21 ++
 loader/psci.h                                   | 119 +++++++++
 16 files changed, 1202 insertions(+), 1 deletion(-)
 create mode 100644 loader/Makefile
 create mode 100644 loader/configs.h
 create mode 100644 loader/fit.its
 create mode 100644 loader/gic-v3.c
 create mode 100644 loader/head.S
 create mode 100644 loader/inmate.c
 create mode 100644 loader/lib.c
 create mode 100644 loader/loader.h
 create mode 100644 loader/loader.lds.S
 create mode 100644 loader/main.c
 create mode 100644 loader/mmio.h
 create mode 100644 loader/psci.h

-- 
2.16.4

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20200305093950.848-1-peng.fan%40nxp.com.
