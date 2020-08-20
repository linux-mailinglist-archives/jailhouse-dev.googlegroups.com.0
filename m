Return-Path: <jailhouse-dev+bncBDAMFR7JZAEBBW4K7H4QKGQETSZZZ5I@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ej1-x63f.google.com (mail-ej1-x63f.google.com [IPv6:2a00:1450:4864:20::63f])
	by mail.lfdr.de (Postfix) with ESMTPS id ECFC224B321
	for <lists+jailhouse-dev@lfdr.de>; Thu, 20 Aug 2020 11:41:47 +0200 (CEST)
Received: by mail-ej1-x63f.google.com with SMTP id i23sf656118ejx.11
        for <lists+jailhouse-dev@lfdr.de>; Thu, 20 Aug 2020 02:41:47 -0700 (PDT)
ARC-Seal: i=3; a=rsa-sha256; t=1597916507; cv=pass;
        d=google.com; s=arc-20160816;
        b=bXSnMiK/KaC2141rt6Z2vicQkU9mQV3WDjxKL7mCIS6lc/ChcfYteMUVPelicnowqO
         It/4z/ZYjZqg1qn92NEfc1DBvPgT6iad7ZKE9s5B/zB7rKFvjDkWgxei5ViSwomHFUy3
         N7owEXbY8q5KkWbeb8icavxohNx9Fx5QylXBTPb2uUYbyK25rWc34LeCQoj2x0kX6gv7
         9QoWhbt7WgXE5wbyw4+bsFt2mNxCjuaAmKN3YOdMAru6kxW0fMkCKG69q78dqlK+INhm
         txtB0giDEL9Tq6AvQEQznlazJ0egCX0MVm2TXCxSWFOtOm8oZy4TfHj1ghBjaAqh/f/g
         5XJQ==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=cyTvQ/UdN4oPVedI20aibbItTJHKzsx+HpAMyZ3CxPc=;
        b=r4VeML8JPguN9jkXlGgUqDmwRYDes50oKPtRGrii1L0P9qLFU1tSevkRWyxPUwXFGx
         eDW9V9+ZmbrmZsStnc+oJRqqUnEuZi9lLNmdWzMb6FFVzrw1YafJCcjFAc6bTQCjZUhW
         YF5AX+L0VGhDATHAWA/9S8tWDH3LQjtd1LIPflYluZsjPUuTnDGgG7FCttCLQ+b9p1My
         EwSYIS084V8EUnwojJRacc4vPCKuR0NQwR1XBLuvNh7IhLVJuOkjZNrD38iBwHJBo8Wu
         kxUIlah6vK1ySbBXAitp5U/hzILHVvxWH7V3Boc2JCClcmeKdkm7cJpj031afS655yVw
         j0yQ==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=iGrX7Cdl;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of peng.fan@nxp.com designates 40.107.3.42 as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=cyTvQ/UdN4oPVedI20aibbItTJHKzsx+HpAMyZ3CxPc=;
        b=RvAB9b+ii4oIo8921npwMiI4uQrBwWVJCFSO7ZlKUTtSHu9S4PnO/oMwxwtWA5Hur9
         00rOd+INtVlVgdVdeiOCU5+qc4JbrtQaD52DG+By8Geqe813i7QsttWQ4b1QkOdHplZ1
         IVc2DDk1YxEEvyl4dkOyVXjGZNEvYah4xtqyGXMmkboyiC2Qd1NNApIwOSY/wA285zfy
         8MLBI/0Rb5EI3i1P+5SMx8I7jokbmTNq0oBs4Jsj0Bk8mwShK9W8RarscMsNhGY+f7pG
         kg3tLVtmZldSC2e5JYPO66fiJ/tienbsqAKHGaB0Yt4B18JNSz1y4UARdg5liuMALwre
         DodA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=cyTvQ/UdN4oPVedI20aibbItTJHKzsx+HpAMyZ3CxPc=;
        b=GzetKgxmuorzqF/koyahGaa2TfDrdm4BtqtMeWDrRz1zHyIr52UDehz0VA/E2u+31A
         3Lp4Rd7dvHEx+X+ayNtw5IYvWALMsgQVgT9M9UGmC/2X92owLmpVLpOWygFHolKSbByh
         7hWeJ78t6Y++3bTXR89hg0KM6nKcZupWT1drZcHlvaiMwYudZ770Y3RbahxkRqboOj44
         n+EbLE3Vp3f8RMJskdMdzDX0Ul/4weMRgY4iCyTUudPy1OmB5bWtO/x0wSPnGwJ34db0
         LM0OcCmjYEHRHkzYXzFY6gK/QeJAHQzzzfZpeW2kE1OLPZ6yBC3GQnMWN9SP9ZS8iUZX
         3qgQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM5311Mut/Ggn9AcyczvHsx8xL37e2Ygklo+dYI7sVvfTuG80fMcU+
	Okj/X6sbPSdek32ChsPYLCY=
X-Google-Smtp-Source: ABdhPJyiXDwDEhZnUXrQKc5WH8PW//TkBiifl6KU+hpYo9x0ITYnEoZT2NE605Qk/70upVHj0Mctjg==
X-Received: by 2002:a05:6402:1c07:: with SMTP id ck7mr2103512edb.84.1597916507680;
        Thu, 20 Aug 2020 02:41:47 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:906:3404:: with SMTP id c4ls797069ejb.2.gmail; Thu, 20
 Aug 2020 02:41:47 -0700 (PDT)
X-Received: by 2002:a17:906:260c:: with SMTP id h12mr2503522ejc.457.1597916506915;
        Thu, 20 Aug 2020 02:41:46 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1597916506; cv=pass;
        d=google.com; s=arc-20160816;
        b=JPnNWpcSUb5uioQWiL2SzK4XyX2rdifsQFqZLPWUc92JJIq7YBE/huUOL5PgoGLIPX
         L5sOUkbkoZaXYUq9ANtRjzhMG7vl8mELJg4jY6xuLmbKSyfXPVIVJnFVR8Q4mH/Jgahi
         fhUd5F33ioyR4vJj86TtrISAXvnirzWZAGBOZor0qwaiu0P0GAowGbO/KMbLk1QSUffK
         UiD+XBFch6fkAnHo/Jtzegn6xe9hfRcVj720MSBQnizb52vmfnUjGq+zOhqkZw6P3+Fk
         /NR84CGpxpMcr52Ea9dTbqKD0s9TIOuJ0hlRuxlO8UlGnrACcPSsPlUio4mAS9V4QP4c
         4DBg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=qa7WFYj1N6xq1PefExmbMjp5TrlZFpgQ1j8dMpLgdLA=;
        b=TD+C07PqUmiC3OTAjcAIf2vUqUDm4ydERrSDC9TB9m4FVvFM67LeJ/rQ/veVJwfgof
         OKoXCS/TuU0cgJwZJ6xv/px6OqolQ96mA9orGLlB44vhmBSeHW5YBaF3pcHi6YdPva6o
         GR251wVC51ni1ckiswW4XoKJq5ShISWFsQqVrxK9UWdEz3JEpPpQW2gsxapl8fIl82xQ
         DIsEnxqoSHjriuYZAHKFfBo/AW4T7c2OiyoWGaWZaji//1HDwfayrd0YTVLIpZdK8KZf
         aTu6YQLyJXcQfxsCmTTEtBMFnaA/vseAO0LNhhe0VOtumb90u4JseDjuHtbcw7RZRXI4
         UwqA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=iGrX7Cdl;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of peng.fan@nxp.com designates 40.107.3.42 as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
Received: from EUR03-AM5-obe.outbound.protection.outlook.com (mail-eopbgr30042.outbound.protection.outlook.com. [40.107.3.42])
        by gmr-mx.google.com with ESMTPS id b6si59615edq.1.2020.08.20.02.41.46
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 20 Aug 2020 02:41:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of peng.fan@nxp.com designates 40.107.3.42 as permitted sender) client-ip=40.107.3.42;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BvOd2Y9kk1GDa9RKir5wLV22oYMERz4SZFvk5vyVHQT5tDXOIw9q+sbLHS8cmi+qQJ+Asn9lW+DON5d5O7eas86A0BY1wSbJHW5e71Nlx1f/8d4wuWTA3rqprDrJJzvUy3mJM05hg9wo+8X5bbdVzBK/UR4K9upnUPuIos4R/cpoll3CAR+y2aGEesEde7tbweaOdZajmJava5Rxc3v56cjEwP+DxPDOpY3T/UPAJzQlzV8cYXDJEILG9Hdj7mDkd/z81sQIOqSJS/JV4FbjyVuaMG6303aAkAdexx3CudXQa5oA9v1QKkviZF+oLVNFWhZmR5AE40dVGIpum099Eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qa7WFYj1N6xq1PefExmbMjp5TrlZFpgQ1j8dMpLgdLA=;
 b=NpNkS8X68wEnZw8NhJXCwJuLWmHmTLzG/XgOPcd9n1OHmn2Ryq0WRG+GtKB7vF2uwlMifgbduAapGSMCBtfVhgX4n0NR48siGkH/OpRgZDawC4Ja19qc2qp975X2wzN+72kEzyKLpAdrHoZBCsHPS3PyXRIhHZFWwC7CEX+SE2rQRyp32yk/WdYZMq+kMCheuRpnqBJslS5WY990ykvpTXmsO2EV1V2lNXX7kcNtoYUuicnBSp0JOJHlzj7pX5old/Yi3gCHGh8Q+uGkWOVpt2ihukK4jE7zwF1HFkNcgDoZJtxOliq0NWaeJyg71NT+jF9LJKGYx7827ozvvOOstw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com (2603:10a6:4:a1::14)
 by DB3PR0402MB3660.eurprd04.prod.outlook.com (2603:10a6:8:c::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3283.23; Thu, 20 Aug
 2020 09:41:46 +0000
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::24d0:f783:3c7d:e232]) by DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::24d0:f783:3c7d:e232%12]) with mapi id 15.20.3283.027; Thu, 20 Aug
 2020 09:41:46 +0000
From: peng.fan@nxp.com
To: jan.kiszka@siemens.com
Cc: jailhouse-dev@googlegroups.com,
	alice.guo@nxp.com,
	Peng Fan <peng.fan@nxp.com>
Subject: [PATCH 4/5] arm: pass -march=armv7ve to KBUILD_AFLAGS
Date: Thu, 20 Aug 2020 18:07:06 +0800
Message-Id: <20200820100707.20013-4-peng.fan@nxp.com>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20200820100707.20013-1-peng.fan@nxp.com>
References: <20200820100707.20013-1-peng.fan@nxp.com>
Content-Type: text/plain; charset="UTF-8"
X-ClientProxiedBy: SG2PR02CA0073.apcprd02.prod.outlook.com
 (2603:1096:4:90::13) To DB6PR0402MB2760.eurprd04.prod.outlook.com
 (2603:10a6:4:a1::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from linux-1xn6.ap.freescale.net (119.31.174.71) by SG2PR02CA0073.apcprd02.prod.outlook.com (2603:1096:4:90::13) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.24 via Frontend Transport; Thu, 20 Aug 2020 09:41:44 +0000
X-Mailer: git-send-email 2.16.4
X-Originating-IP: [119.31.174.71]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: f3935bb7-4878-4549-3a3a-08d844ed40cb
X-MS-TrafficTypeDiagnostic: DB3PR0402MB3660:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DB3PR0402MB3660497580BC03E1D8DB878D885A0@DB3PR0402MB3660.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Q8kuL/taH4e/mk/lBPaO2+e9/8YJtGHKaBJXjkNSDjaJxUiT+k7qCGkXTLzwz/zjpIHzgfKULqepBhYEClj29/O55nxZhdr5tYjVdFLFAmoAqPQM3M2SW29QAr9IzvgJ/SCAsx6aov3wW6M37MgIklHUj0DXt10GfGn95ZZNoRyXGLlvTNLNIXXR9NG6aMdb37sXDQeec0SyTyvmdDeFyWa02icyrXOrwjQhZMHs3k4CkG/ezmp3ACU2Er0c+GnEqwmGIcr2aW1eBj7XQ8ZjsJ9kHdE24qs8A5zMrTizVpf5RbAUrM5twtr9T0WgdrhQQCcE+2uLtO/LNTrHAIzykQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0402MB2760.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(136003)(346002)(366004)(396003)(376002)(6916009)(66946007)(9686003)(6506007)(66476007)(52116002)(186003)(8676002)(66556008)(6512007)(8936002)(6666004)(16526019)(4326008)(36756003)(316002)(5660300002)(2906002)(956004)(478600001)(6486002)(86362001)(1076003)(26005)(4744005)(2616005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: miAcYduI5ZG19/coxydyPWh7flS0vWiE2xZt5TkVnfFpUbl+NzyV/T/BhdF/5EPZFO4muaTP14GIILV31hR691uOj3d6Tz6mSTvkkzhNb/WFE8xv7SqKUuC4pLd6sEkw9ktOipE9N7BSaVn5KaaEs/cuiTCp54YhiPQyfGPoYy8O7/maJFDxDAJfvzHIi4Eh4wqCMDjigbxNQfSw8hAEIptoFMrUFer8E6E3QAqN2RE0XYFw1YCLR7NQaey9jOzed4wxVkD2mCdusAfZtREp5IHKyLcZWULAhwW+YFRYSR5DUbYCPj/nZx5Mgapt4catVVI4zniMvv3xiR8m1GCW45qtmcbqbDpccYwJMCy2R2Fg/FzXtC6ebRHr+b5TtzWUGgM17spnBwhD1/lENNv56qFA62/SycVyLjqDCoq03yD7Y1iTiY2ZNh5r7lZ6Q6cgyMCL+cf5HRzNJgHa0tfxHI1fZjRdMD0guvj9/fy5ZGS38zOwgYwpGxKx4Yqacotn+42B0gV75vkwa9ztN6ra4UzxUbI/AuROFp3wT79N+BuTYqHmENHZBFDB9jtqkueG6Xo3satoK6VI3HwMe9OqQGdYY3Ck7r6foKvPiTAVM+lDw7Uq9q0HyE6poTvA7CZxxVsTBHapJPbBM2BRLRXMIA==
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f3935bb7-4878-4549-3a3a-08d844ed40cb
X-MS-Exchange-CrossTenant-AuthSource: DB6PR0402MB2760.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2020 09:41:46.2141
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3S3A5TtUed1xxqxfjbIajzm6w8fnPhB/FbYWCTWbTIRkoxFn70bIm8STKXVLmM/BOrHg2VzBAFSpMqYa0WRmVw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR0402MB3660
X-Original-Sender: peng.fan@nxp.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@nxp.com header.s=selector2 header.b=iGrX7Cdl;       arc=pass (i=1
 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass
 fromdomain=nxp.com);       spf=pass (google.com: domain of peng.fan@nxp.com
 designates 40.107.3.42 as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
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

Some toolchains might not have this flag default set, so when compiling,
there will be error that "dsb not supported" in cache.S.

So pass the flag to force toolchain use v7.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 hypervisor/arch/arm/Makefile | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hypervisor/arch/arm/Makefile b/hypervisor/arch/arm/Makefile
index a170b593..ad5b2276 100644
--- a/hypervisor/arch/arm/Makefile
+++ b/hypervisor/arch/arm/Makefile
@@ -13,3 +13,4 @@
 LINUXINCLUDE += -I$(src)/arch/arm-common/include
 
 KBUILD_CFLAGS += -marm -march=armv7ve
+KBUILD_AFLAGS += -march=armv7ve
-- 
2.16.4

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20200820100707.20013-4-peng.fan%40nxp.com.
