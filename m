Return-Path: <jailhouse-dev+bncBDEN32754MOBBMWZYT4QKGQEGFEJA5A@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x140.google.com (mail-lf1-x140.google.com [IPv6:2a00:1450:4864:20::140])
	by mail.lfdr.de (Postfix) with ESMTPS id B03F024051F
	for <lists+jailhouse-dev@lfdr.de>; Mon, 10 Aug 2020 13:17:07 +0200 (CEST)
Received: by mail-lf1-x140.google.com with SMTP id p192sf2815634lfa.0
        for <lists+jailhouse-dev@lfdr.de>; Mon, 10 Aug 2020 04:17:07 -0700 (PDT)
ARC-Seal: i=3; a=rsa-sha256; t=1597058227; cv=pass;
        d=google.com; s=arc-20160816;
        b=O6nlz7OeUWSuDM0uH6qOYNkhpCPpQIPwmd8ZdIGR2QN67WMmVDnH57Tmo5u0wlAhHI
         RIOeXr3ltfRkLSF74ItZzpStDQPFmDOhcUDnbygtf6mJfnVlMiajUnQeGgQTbf797sDV
         AuhdxAfEGetSUcN0ncoTPJvxTgmnijVSnSfDQJmm9lWiMNHYQ+VvU0LabHOPTninPCvB
         65oo64pcy39gsX8Vesj33YpNkolMS+B88p/EeVpshBhRkvVG0W1EoIQYPKWkn0woNIxt
         xSMo3dO0zZ7fCk+St4lglaAzsKttq4psxD2fdDUZHNY4rtI8kDknsToBOt9SyihHUa4p
         jgPQ==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=mMd9Jl5fxF5N9nOBj1H4/6c10DgAcJnUZKcwSIYSXwo=;
        b=FlNAo2CEoyA6dLxQ/ppgRDctF/pn6S2gvhiZ11JDN0Lmd9KuDw8/YUSEcccYkoz6Kl
         g0bM+WJyhfDwojNF4WALQmwLA5s8luzjmyM1PqyHQtaqm4rqTPl3W4YLI0Nta/BFavxb
         bL1Qyw3aSm84isfU6czAXBFPttcj54lljel4WkAVSZPPXFGFKzkbVwFeYL5ARmxLSaKz
         l5vE6PeHH+1dC53pLmvkUMp0B5zpibE9msUI1vbw3RvChpNmp9RakColk5EGWOd+aPsR
         AjilKt6048EV/5mNm3sQ4mCtLISkcTyGk2PtvkW/o8rcvsxVWulsyaABtPwEDy+Hv1/V
         81gQ==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=dtfdjoPO;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of alice.guo@nxp.com designates 2a01:111:f400:fe0e::62b as permitted sender) smtp.mailfrom=alice.guo@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=mMd9Jl5fxF5N9nOBj1H4/6c10DgAcJnUZKcwSIYSXwo=;
        b=GcUcAoi4dhLFesO/CgPdojiAldOgooXX3rmf98rBgm3Y9wnhc85/7G3HyJ5KtHlqVt
         kcHxt44PrOXS9iEpBSjH+LFZ7o3tF0VzPI6kJoXo668s8iS5NkZ3374uAKQB4U0IgRMG
         +MTENCSPigdnYSrvshpc48ONxSPxgqkOg2BR4vcO8ERGhEoCVdKQy1UoFWItZ0zi/n40
         OWYSxlUPBl5D1grB+MDhP4qL2X4U2o4qo45HcpABIKSPYzJ5DY0QCvLiNFObsKS3npaM
         Lzo+sd4t+NEKs2Jtkjvl46S0W0NpGvo5xgI9kDTf2H5JESx8flYPDsqu1DNm7ro7k3wn
         bEyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=mMd9Jl5fxF5N9nOBj1H4/6c10DgAcJnUZKcwSIYSXwo=;
        b=LsjdqeOyyKalQeLzU8HfMjhR+EO11VHgCsc42USbTkuefa5yVAX7vf8Gz4V3an7rZ/
         W/xBddhsBk3zZfuDIuOAKFeKT3vtk9ucbYzjaZFqPyZHWqwdz/kpRN8ESujwPi9L563y
         CRVQiprOIrbcfSE/LOxA2B5Tnl7kBj9E7kT6mOdva9p8ibMcPMw/+9vJvqnWdi6LIHU6
         EUUXCVGARZxewHbdMVpgl0iHaQaRDXNQYeX4oSHVYTlVKBT88w7wfPybaZJFQTcy78rV
         hHxaPokArtmZdY6FUTxwsMIwuUMpRCCQPL/PwA1kUKF6MKREH4HiCuiLmRmxjqOhuiPu
         L+uw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM5339O6k50axB8HT5NgaYpdaxhUIkHvaukMEVUE2aB3iGNGpouwgT
	W0kznnunTcof26nDlQkPRIc=
X-Google-Smtp-Source: ABdhPJxz3Ivv56MI40wJz00QMPeJJ3u+2MKGB/EpUrKhji9hBZONnbLJOg//9AiFy0Z0rgqq+USIGA==
X-Received: by 2002:ac2:530e:: with SMTP id c14mr243673lfh.127.1597058226386;
        Mon, 10 Aug 2020 04:17:06 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:651c:1182:: with SMTP id w2ls1293874ljo.2.gmail; Mon, 10
 Aug 2020 04:17:05 -0700 (PDT)
X-Received: by 2002:a2e:4c02:: with SMTP id z2mr294475lja.177.1597058225654;
        Mon, 10 Aug 2020 04:17:05 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1597058225; cv=pass;
        d=google.com; s=arc-20160816;
        b=J3qG3qlO4Peq+lBxRg/pjvTrpfICu9+s8BA1XMXwl/MJt+Bi96bVXBozpVHD4OfR7Z
         9uM+Dn/TAGH2fWETi4VqMGAndSIoOAcbip2r5NvpXcebqqINvTWMIUPSDKZLL+k1FIyd
         e7FTyAg8do8m/X3EDkSc8BzTU9JbXRoyritS+1me6UwtJ46ZtLFZvCYhwFw5LFLyrsSR
         lJk0oHCqcA8aKtpGKepkA+Nn0gMiFRw2MZq0qLH1+4khFmWxJHb4fIDe6vz1l3J0tDla
         s5LNhxH253+LcIglQDT6+5SR+baEZNWfNU02k1HZ8hdV1tLcdSSAGXFyDMqJwV3UfM6a
         Yeww==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=rrbg3thsUnO74gVKTd0V9quL42xCVynbyPKP8rb+OFQ=;
        b=YaBZ4KUHkIsRsNeHteV9S5PSjpAiu4TOLVDXhxlauxK6oGJ10xyocNDJM0e6SZvjlP
         GA6FvDI2qP+IFdImtyfh/rn5O07BARQYSR1hMB2UGXqm+azw+tl7/TSh7SpQzyO0GSBW
         hUtY/J1BwJz0WHbT27WyXiJG5W4SxUZnZ+uqAY5zK2Rcx6OnljMYNnRnsD+Ya5d5bdS/
         cb2GyQ5gaXD1mJd0RfWfvlFrnjbowwduo6kdwv1IVhgDDULNmpITNa8i2mUPCMRgXkKt
         x2nSJ9d7Tmy0Gq8ubAOFM/H6ylifpOsGeXBwE1tUH+WZg5UYKHVdDWq9dYz3uH+xYcol
         LXaA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=dtfdjoPO;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of alice.guo@nxp.com designates 2a01:111:f400:fe0e::62b as permitted sender) smtp.mailfrom=alice.guo@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (mail-vi1eur04on062b.outbound.protection.outlook.com. [2a01:111:f400:fe0e::62b])
        by gmr-mx.google.com with ESMTPS id o13si760592lfc.0.2020.08.10.04.17.05
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 10 Aug 2020 04:17:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of alice.guo@nxp.com designates 2a01:111:f400:fe0e::62b as permitted sender) client-ip=2a01:111:f400:fe0e::62b;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Jr6863qCviibRyBmu5u9pWVQ2FJDh74CaZrQTyKAQM/bw06YO/shmawIQrZrApa9BLN9KW8G4LyRZtGbjRLMCDcZeVOXfbmktRBtmoJL4pmmSGcPS4QhkT9Q8qQGIiuADgvTOP0yzIfCNx3MEv6h88yfNHJM69z+CRUjwAfMszhTfr7fFrmorK5+E7CHTPgZnoHRuzlnQhEBlOTsBEVMH5ZEHVWeL9NDCpTjMOZus1gn5rFIGzYro56+AxKKsQWtTok3VS6QvbjQ1WSq4KczGf6q0cwExarptWcRDnQj9hA2vqM7cgylX+omibqYpiUerHB8/iEQKx+cL5RGPpo5Vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rrbg3thsUnO74gVKTd0V9quL42xCVynbyPKP8rb+OFQ=;
 b=LgphlbmiCqGWzN1E+ElGQ7C2Ry41A3bC3VUCzwQSZgooi1h6gkA8B6xlz6VuRMlU3ORZnZ3J5T7CFdTbIO3UcMoc2dhzw/M7To8463GwkqMLNYemu1COl4gMk4rylgNd7qE64r0v4h0Lcq/4yfQYKpQLrAhdB2qO7ofN+GXpP4gxs82DIBDfYnAG2W6FZl4U+W/ZGjaTl8w7+L9Kywoc4FBzzCHckh0LVUYzetnuMKfgvWfcKOu7EpDI9g+8aWBUVTmbqP8fL9XcuhMWRQHG+IdFx0oBP41hfDV8kCN1d0fgvDkEEae4wBEfj8cxex2VnQM5W3g9P6ZtEh0CxvWycg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
Received: from DB8PR04MB7065.eurprd04.prod.outlook.com (2603:10a6:10:127::9)
 by DB7PR04MB5451.eurprd04.prod.outlook.com (2603:10a6:10:8e::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.17; Mon, 10 Aug
 2020 11:17:03 +0000
Received: from DB8PR04MB7065.eurprd04.prod.outlook.com
 ([fe80::8cf6:40ae:36ee:9b42]) by DB8PR04MB7065.eurprd04.prod.outlook.com
 ([fe80::8cf6:40ae:36ee:9b42%9]) with mapi id 15.20.3261.024; Mon, 10 Aug 2020
 11:17:03 +0000
From: Alice Guo <alice.guo@nxp.com>
To: jailhouse-dev@googlegroups.com,
	jan.kiszka@siemens.com
Cc: peng.fan@nxp.com,
	Alice Guo <alice.guo@nxp.com>
Subject: [PATCH V1 2/5] arm64: support inmate cell in AArch32 mode
Date: Wed, 12 Aug 2020 02:16:38 +0800
Message-Id: <20200811181641.7282-2-alice.guo@nxp.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200811181641.7282-1-alice.guo@nxp.com>
References: <20200811181641.7282-1-alice.guo@nxp.com>
Content-Type: text/plain; charset="UTF-8"
X-ClientProxiedBy: SG2PR03CA0149.apcprd03.prod.outlook.com
 (2603:1096:4:c8::22) To DB8PR04MB7065.eurprd04.prod.outlook.com
 (2603:10a6:10:127::9)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from nxf55104-OptiPlex-7060.ap.freescale.net (119.31.174.71) by SG2PR03CA0149.apcprd03.prod.outlook.com (2603:1096:4:c8::22) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3283.6 via Frontend Transport; Mon, 10 Aug 2020 11:17:02 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [119.31.174.71]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: e80ecbee-5573-452f-41e3-08d83d1ee8c0
X-MS-TrafficTypeDiagnostic: DB7PR04MB5451:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DB7PR04MB5451110E495EC9578B858AAEE2440@DB7PR04MB5451.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5236;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Ka6/gp/10Cwp21FGvV5jDMeKkAsn/s1zv6Cdwd2pp/BmA+m54qwQ3C5VgwLP4jQdv66eAjGvOsplnRWQ2Kmpi5AP11bz9YDGab/LsoTbadlq+TvR2PeZgqfOTkra2Pdg9j3hrM8DtwlBoBwl97K3CODCtFuVayoyN+wlTMUFd2z7mi5H1s9lA3s98KV+tMXGuIA2ENO0ZzCm8EvbMDOzORlVOVCsHdNQUnw2+r24qUJecP+uPv7OCu9ckBHj6mK7bHdam3GP/FWl8xFYZbOh9UnQCHOwd8zdauIVbTlhBXrew6Lsh4A1MSFT8/thTtboVo5oU7NTQnI6mpq26cUegg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR04MB7065.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(136003)(396003)(366004)(346002)(39860400002)(376002)(2906002)(956004)(6512007)(8676002)(52116002)(1076003)(8936002)(478600001)(44832011)(86362001)(5660300002)(66476007)(66556008)(2616005)(83380400001)(36756003)(4326008)(316002)(66946007)(6486002)(186003)(16526019)(26005)(6506007)(6666004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: uPy77Z8rqmT+LBffw6b0qKHs5zhPOena893jDRlWE/9V6OsBowL4aIz8Lh8JnxZR0Jy+ZEq+3WQredF40WGyqOtHSjKw6EM0pGduxmx9hABtXiutgHE/EhH4KcXBXamOBsjohVESDfA5OF6TiINaEU49okh48VGcWa1JZokzjmCUByxPZEuyWgacOw7C/3h82W3lXT9ZTtnS/m2NBQPc/O1/C8asoCRDTbAdNxiMIaFPIITIqqQ51322+Cb/m0s3T7tKij+4dJ+5ejNWz6dEIjZ3DxRKP9vmE10qd6NPDLZxkkVUzXeYAHTZlPFst2x8t//yZ1h5ukA45ChTf+Mi90aTRUsf4uuFRXud4em5mUJmDGo7Jvm3eb6QDuQiC/BuGYWJd1GTvO3nceCTk82XW41cHEB2gulKu+Yo/Qo+t1H6hxuq+70Kk8bw73v+Ltx1Dk93KquWBvQQiX+2WgCg/v9AQyPcRKw7aHC9uhP1epf5XHT60S7Spf1ZW3rLjIbleMIobKaqLe2WUiCLsOY8UGYLBcR38sIfWd9sRfK7P3Uhu/ZptsmoI4EeWUmzazI4FN8OcdwqtJ/JrzhnPeyUgs4hTPQbdPhPqfFSa3dC8qFjLWO9u9msqCwT8Y/UMnNcarsqdV4lNh+tzvGnLaYP5w==
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e80ecbee-5573-452f-41e3-08d83d1ee8c0
X-MS-Exchange-CrossTenant-AuthSource: DB8PR04MB7065.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Aug 2020 11:17:03.7645
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qnX46cbwGMFp5TY9RQLSFB6usgCzudlDpRqfvyx7AWZyOTRZqcdt43MN6hEqbZJmFYXDKcSrHqLPwFGKGxpUnA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB5451
X-Original-Sender: alice.guo@nxp.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@nxp.com header.s=selector2 header.b=dtfdjoPO;       arc=pass (i=1
 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass
 fromdomain=nxp.com);       spf=pass (google.com: domain of alice.guo@nxp.com
 designates 2a01:111:f400:fe0e::62b as permitted sender) smtp.mailfrom=alice.guo@nxp.com;
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

An AArch64 hypervisor can host both AArch32 and AArch64 virtual machines
at the same time. If the inmate cell wants to run in AArch32 mode, the
assigned cpu must change to AArch32. Because AArch64 hypervisor and
AArch64 root cell are used, when the AArch32 inmate cell is destroyed,
cpu owned by inmate cell will be reassigned to AArch64 root cell, switch
the cpu back to AArch64.

The following is a summary of some of the points when supporting inmate
cell in AArch32 mode:
Define a macro "JAILHOUSE_CELL_AARCH32" to indicate AArch32 execution
state. Add a member variable cpu_mode to struct public_per_cpu, and
cpu_mode can use this macro to indicate whether the processor is AArch32
or AArch64 execution state.

AArch32 and AArch64 virtual machines use different ARM_PARKING_CODE.
0xd503207f and 0x17ffffff are used in AArch64 and 0xe320f003 and
0xeafffffd are used in AArch32. Add ARM_PARKING_CODE which is used by
AArch32 in arm64/include/asm/processor.h, and then select which one to
use by cpu_mode and cpu_mode and arm_cpu_reset().

When an exception occurs, the processor must execute handler code which
corresponds to the exception. When the exception is being taken at a
lower Exception level, the execution state of the next lower level
(AArch64 or AArch32) will be used. Fill exception handling functions for
Lower EL using AArch32 in hypervisor/arch/arm64/entry.S.

Changing to AArch32 happens after the command "jailhouse cell start 1"
is executed. In arch_cell_reset(), get the mode of cpu owned by inmate
cell from the member variable .flags which is defined in the configuration
file of inmate cell. If the inmate cell is AArch32, SPSR_EL2.M[4] will
be set to 0b1 which means AArch32 execution state, SPSR_EL2.M[3:0] will
be set to 0b0011 which means Supervisor, and HCR_EL2.RW will be set to
0b0 which means lower levels are all AArch32. If the inmate cell is
AArch64, make sure HCR_EL2.RW is 0 and the other registers are configured
according to the previous code.

Changing to AArch64 happens after the command "jailhouse cell destroy 1"
is executed. Since the cpu owned by inmate cell will be reassigned to
root cell, get the mode of cpu from .flags of the root cell configuration
file by arch_cell_destroy().

After Linux operating system boots up, execute the following commands to
use AArch32 virtual machine on the i.MX8DXL:
./jailhouse enable imx8dxl.cell
./jailhouse cell create imx8dxl-gic-demo-aarch32.cell
./jailhouse cell load 1 gic-demo.bin (32-bit)
./jailhouse cell start 1

Signed-off-by: Alice Guo <alice.guo@nxp.com>
---
 hypervisor/arch/arm-common/control.c          | 10 ++++++++--
 hypervisor/arch/arm64/control.c               | 13 +++++++++++++
 hypervisor/arch/arm64/entry.S                 |  8 ++++----
 hypervisor/arch/arm64/include/asm/processor.h |  4 +++-
 hypervisor/arch/arm64/include/asm/sysregs.h   |  2 ++
 hypervisor/include/jailhouse/percpu.h         |  2 ++
 include/jailhouse/cell-config.h               |  1 +
 7 files changed, 33 insertions(+), 7 deletions(-)

diff --git a/hypervisor/arch/arm-common/control.c b/hypervisor/arch/arm-common/control.c
index 70793432..c0f9f229 100644
--- a/hypervisor/arch/arm-common/control.c
+++ b/hypervisor/arch/arm-common/control.c
@@ -32,7 +32,10 @@ void arm_cpu_park(void)
 	enter_cpu_off(cpu_public);
 	spin_unlock(&cpu_public->control_lock);
 
-	arm_cpu_reset(0);
+	if (cpu_public->cpu_mode == JAILHOUSE_CELL_AARCH32)
+		arm_cpu_reset(8);
+	else
+		arm_cpu_reset(0);
 	arm_paging_vcpu_init(&parking_pt);
 }
 
@@ -169,6 +172,7 @@ void arch_cell_reset(struct cell *cell)
 	 * starts at cpu_reset_address, defined in the cell configuration.
 	 */
 	public_per_cpu(first)->cpu_on_entry = cell->config->cpu_reset_address;
+	public_per_cpu(first)->cpu_mode = cell->config->flags & JAILHOUSE_CELL_AARCH32;
 	for_each_cpu_except(cpu, cell->cpu_set, first)
 		public_per_cpu(cpu)->cpu_on_entry = PSCI_INVALID_ADDRESS;
 
@@ -184,8 +188,10 @@ void arch_cell_destroy(struct cell *cell)
 	arm_cell_dcaches_flush(cell, DCACHE_INVALIDATE);
 
 	/* All CPUs are handed back to the root cell in suspended mode. */
-	for_each_cpu(cpu, cell->cpu_set)
+	for_each_cpu(cpu, cell->cpu_set) {
 		public_per_cpu(cpu)->cpu_on_entry = PSCI_INVALID_ADDRESS;
+		public_per_cpu(cpu)->cpu_mode = root_cell.config->flags & JAILHOUSE_CELL_AARCH32;
+	}
 
 	arm_paging_cell_destroy(cell);
 }
diff --git a/hypervisor/arch/arm64/control.c b/hypervisor/arch/arm64/control.c
index 6e1ffebf..661dcd77 100644
--- a/hypervisor/arch/arm64/control.c
+++ b/hypervisor/arch/arm64/control.c
@@ -20,6 +20,9 @@
 
 void arm_cpu_reset(unsigned long pc)
 {
+	unsigned int cpu_mode = this_cpu_data()->public.cpu_mode;
+	u64 hcr_el2;
+
 	/* put the cpu in a reset state */
 	/* AARCH64_TODO: handle big endian support */
 	arm_write_sysreg(SPSR_EL2, RESET_PSR);
@@ -67,6 +70,16 @@ void arm_cpu_reset(unsigned long pc)
 	/* AARCH64_TODO: handle PMU registers */
 	/* AARCH64_TODO: handle debug registers */
 	/* AARCH64_TODO: handle system registers for AArch32 state */
+	if (cpu_mode == JAILHOUSE_CELL_AARCH32) {
+		arm_write_sysreg(SPSR_EL2, PSR_32_BIT | PSR_MODE_SVC);
+		arm_read_sysreg(HCR_EL2, hcr_el2);
+		hcr_el2 &= ~HCR_RW_BIT;
+		arm_write_sysreg(HCR_EL2, hcr_el2);
+	} else {
+		arm_read_sysreg(HCR_EL2, hcr_el2);
+		hcr_el2 |= HCR_RW_BIT;
+		arm_write_sysreg(HCR_EL2, hcr_el2);
+	}
 
 	arm_write_sysreg(ELR_EL2, pc);
 
diff --git a/hypervisor/arch/arm64/entry.S b/hypervisor/arch/arm64/entry.S
index 27e148c6..4789e933 100644
--- a/hypervisor/arch/arm64/entry.S
+++ b/hypervisor/arch/arm64/entry.S
@@ -401,8 +401,8 @@ hyp_vectors:
 	ventry	.
 	ventry	.
 
-	ventry	.
-	ventry	.
+	handle_vmexit arch_handle_trap
+	handle_vmexit irqchip_handle_irq
 	ventry	.
 	ventry	.
 
@@ -425,8 +425,8 @@ hyp_vectors_hardened:
 	ventry	.
 	ventry	.
 
-	ventry	.
-	ventry	.
+	handle_abort_fastpath
+	handle_vmexit irqchip_handle_irq
 	ventry	.
 	ventry	.
 
diff --git a/hypervisor/arch/arm64/include/asm/processor.h b/hypervisor/arch/arm64/include/asm/processor.h
index b52782b7..e7b048e0 100644
--- a/hypervisor/arch/arm64/include/asm/processor.h
+++ b/hypervisor/arch/arm64/include/asm/processor.h
@@ -34,7 +34,9 @@ union registers {
 
 #define ARM_PARKING_CODE		\
 	0xd503207f, /* 1: wfi  */	\
-	0x17ffffff, /*    b 1b */
+	0x17ffffff, /*    b 1b */	\
+	0xe320f003, /* 2: wfi  */	\
+	0xeafffffd, /*    b 2b */
 
 #define dmb(domain)	asm volatile("dmb " #domain "\n" : : : "memory")
 #define dsb(domain)	asm volatile("dsb " #domain "\n" : : : "memory")
diff --git a/hypervisor/arch/arm64/include/asm/sysregs.h b/hypervisor/arch/arm64/include/asm/sysregs.h
index 0105b109..1d68ec54 100644
--- a/hypervisor/arch/arm64/include/asm/sysregs.h
+++ b/hypervisor/arch/arm64/include/asm/sysregs.h
@@ -15,11 +15,13 @@
 
 #define PSR_MODE_MASK	0xf
 #define PSR_MODE_EL0t	0x0
+#define PSR_MODE_SVC	0x3
 #define PSR_MODE_EL1t	0x4
 #define PSR_MODE_EL1h	0x5
 #define PSR_MODE_EL2t	0x8
 #define PSR_MODE_EL2h	0x9
 
+#define PSR_32_BIT	(1 << 4)
 #define PSR_F_BIT	(1 << 6)
 #define PSR_I_BIT	(1 << 7)
 #define PSR_A_BIT	(1 << 8)
diff --git a/hypervisor/include/jailhouse/percpu.h b/hypervisor/include/jailhouse/percpu.h
index 344ed65f..ece11bc9 100644
--- a/hypervisor/include/jailhouse/percpu.h
+++ b/hypervisor/include/jailhouse/percpu.h
@@ -59,6 +59,8 @@ struct public_per_cpu {
 	 *  host physical <-> guest physical memory mappings. */
 	bool flush_vcpu_caches;
 
+	unsigned int cpu_mode;
+
 	ARCH_PUBLIC_PERCPU_FIELDS;
 } __attribute__((aligned(PAGE_SIZE)));
 
diff --git a/include/jailhouse/cell-config.h b/include/jailhouse/cell-config.h
index 6df4a745..2a968dd5 100644
--- a/include/jailhouse/cell-config.h
+++ b/include/jailhouse/cell-config.h
@@ -56,6 +56,7 @@
 
 #define JAILHOUSE_CELL_PASSIVE_COMMREG	0x00000001
 #define JAILHOUSE_CELL_TEST_DEVICE	0x00000002
+#define JAILHOUSE_CELL_AARCH32		0x00000004
 
 /*
  * The flag JAILHOUSE_CELL_VIRTUAL_CONSOLE_PERMITTED allows inmates to invoke
-- 
2.17.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20200811181641.7282-2-alice.guo%40nxp.com.
