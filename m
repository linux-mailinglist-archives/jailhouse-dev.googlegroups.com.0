Return-Path: <jailhouse-dev+bncBDJMJPGY2MGRBK5A6WHAMGQEYCEBSRY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x13c.google.com (mail-lf1-x13c.google.com [IPv6:2a00:1450:4864:20::13c])
	by mail.lfdr.de (Postfix) with ESMTPS id D633148AAAF
	for <lists+jailhouse-dev@lfdr.de>; Tue, 11 Jan 2022 10:38:52 +0100 (CET)
Received: by mail-lf1-x13c.google.com with SMTP id l29-20020a19495d000000b0042d1e9c46f3sf3241443lfj.22
        for <lists+jailhouse-dev@lfdr.de>; Tue, 11 Jan 2022 01:38:52 -0800 (PST)
ARC-Seal: i=3; a=rsa-sha256; t=1641893932; cv=pass;
        d=google.com; s=arc-20160816;
        b=Jp25I0WZg0SnMxZkKT7fXocfTA6bXx3vIQ8aSFLX/9OQa91nerauShtvlr89F855et
         KgeCcAKYCbT7E6WXdenuu6JxioXtzDAs4xsEbpiGPGUHRIbifck9qRYZpM3UlrtXSpaV
         y0FpBJ66dAnj0LQFVerYq4ripgCc0rhxkPHHsTQMMnwLpkRo0XWSeaKhMyWudBTep26D
         NfcNI4djUgT1tWX7/uHWuHW8UXlKVqHvgwTkinAm0Fibgpwnxr+/j6KEjjfbzOG4uUfr
         K6M9pSGhBUCqViNjtyFCM+IVT+yKg+ib7gJVgwVpNn5/dqAb1UZvW35JnJtOMnukHJQ4
         3DWA==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:sender:dkim-signature;
        bh=+YhsCUo3LpSCnjl4/rDFq8bLWEX0NkHGKISzyLetO8A=;
        b=RyD4CrnZeWuwPabeyvfzD9KVezgvOsrlSDLeFebPV1QnveTPycwRw9sqEAy84eF4yP
         7mMKFYRGFH0g4LR3mHxN1MbV2UTHvR8pdhGU109auxCAFwYrHLioD74/F/GNacKvzcKE
         o5AyPUd6ONtuXUZecIjjOU/6dOdiA6KBfQbYeb15gV0fI4cjF3GctGr95JNq+8zhl+pt
         LYtp9YdNYt+/SdxcB5n/rDvJMsbI83JWzcLwPo+V3rp//lynyIOlsELWnvlvG46GTjDN
         Sd53cM9BQCwf/rjMThSn9OjunDgo9SlpKIiqXAUPSPNkr7Kmq+MjadjMG0dQ3plr5qNL
         IAHw==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@siemens.com header.s=selector2 header.b=BYhMpHvk;
       arc=pass (i=1 spf=pass spfdomain=siemens.com dmarc=pass fromdomain=siemens.com);
       spf=pass (google.com: domain of henning.schild@siemens.com designates 40.107.1.47 as permitted sender) smtp.mailfrom=henning.schild@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:date:from:to:cc:subject:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=+YhsCUo3LpSCnjl4/rDFq8bLWEX0NkHGKISzyLetO8A=;
        b=MU1i5qnia6f1gu1gxPa8EM/7HCelVpMgfV/yO0kThVsQbGEKJ34TP0RTuHCcYI+4h/
         zr4ugE0tDFBoUkjzUD1n/N7YzffsZD98wrCIctsapZn+ywTyGPItwog6JLsjYbWug1CY
         i8oPOP51nVH7A8TpmYsk99qXP5EZQeaoqCGHiiKO8LByd4NctmXdHNhIWEtmaauRpMKb
         K0b8OANi8XHtLka3PmCNu/OMa9E4alIO3C7FNHV/ftIgP5/GQ+rSEFCHc4bdQTVRUNYm
         ezdPZTiSe5vDbfiv3XSe6RyeS/LbfNqWcg8th9OoSa/rkMftYNQMq0ljjDqor8qjNt5u
         epCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:date:from:to:cc:subject:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=+YhsCUo3LpSCnjl4/rDFq8bLWEX0NkHGKISzyLetO8A=;
        b=G+t5ny9Cd8KEtk9QJ0hM5ALumfPHX1iN9mfurfCY7DKKwKlAdnEqIbaoqW7arR3z6e
         00TKfio151WU9UoWAPz9mgJ8DZT+cF3G2AIwhnT7N9E4nmjicET8iBlAmWambOpGGDWC
         EDuXITsihKmNe5TaLP3yvoHc+nHRatEnSa7cq/Vl48lkAgCsfYbCfjllMesenN2Gt/v2
         mg/fP6K2xnwEGYElLvzb9YQabqZVqn0pO4zTmPggLBK1ZePcG7nU4+VIUKofCNv3/JeV
         HBpF/Yf7xoHntcEbw8GBQE2d9IJpwDI+XvtjxW423QwJ8Fxxp1eO85GIUpbwjPQyImiY
         ylVQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533asiePfwEFPB2Upwa/SOA3xgNfYXnp/588Zvi7QOIKnvYs4DfT
	/cbrAWeWNZRR0b2Pv+JM9rQ=
X-Google-Smtp-Source: ABdhPJw+eB/QzGYDgc/MnCdnDzgbEMl9BuHOO4EF6C4BlLcs0JhDRlQ0AZgorPhgcHHLzttDu+YDaA==
X-Received: by 2002:a2e:9019:: with SMTP id h25mr2273624ljg.257.1641893932170;
        Tue, 11 Jan 2022 01:38:52 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6512:ac9:: with SMTP id n9ls390391lfu.1.gmail; Tue, 11
 Jan 2022 01:38:51 -0800 (PST)
X-Received: by 2002:a05:6512:1392:: with SMTP id p18mr2867328lfa.98.1641893931286;
        Tue, 11 Jan 2022 01:38:51 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1641893931; cv=pass;
        d=google.com; s=arc-20160816;
        b=Xmz3HYYWbGX5p2GshTUcZh9DQNZ8tbzCczwJeNzwG19QBtUDZSOpZe4BzxQKF8B3Ij
         j1J3jBBMVsv+isev6HW1yXrT+dEKFs6ykRX3ygNUn7OLEWRip7fYwSl9jqw9vMCgc0Kb
         S1WQGN1ivMMhg0mOTJt8/ddFPjrmIkXOZiAwFfPFz+rX/VWeX6+mMxO9j1zsEDQdtvmQ
         T5rAMaWjBblmnQXjiVUxwTjCM+j+nDCtgYnLu2UYYvGotThucVSltSOsVM3NZtA30qgt
         GERoJuqOvYGpq63GrT7o1RzBvcjYFD3T95JCHKX8XuZw6f7hCVuZGl3pFOFa/kvvXDu7
         ZbCg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:dkim-signature;
        bh=eHw1yxmWdN1J/EMmKxljo7rV41KWKtTwoQhCsJ/sUpU=;
        b=ELNq30B6ImeyWrcfq208T4w/o8WNQ9xDrK44JLEhxv4Shb1Hko2HC7iKwZwkEahc5O
         vQ8bDGsEiA9GN27nWBHOS24kret+91S6CX3E8mJbbWmO81jeUEuVqAb9WgKdgaZc7gPk
         srmmyH840lrs6LvSfiGeSrYUk5XJ5KDWBwsXLw9WJgXCC4qQbCury0L/tEuSuoxCaagb
         s9W1lFkCjlKr8zqyqf/Py8mnfb9v5CjXLbif5Zc9/iiDpqlwid4Qb1eVZMnCHdBCbi+C
         on4gM9MFt1O5B0/ROZMw9bVPXgegSLxRyml2w2S3PIxRPRbq8GpAvJ/h0QEXdWIVLXYW
         PZdg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@siemens.com header.s=selector2 header.b=BYhMpHvk;
       arc=pass (i=1 spf=pass spfdomain=siemens.com dmarc=pass fromdomain=siemens.com);
       spf=pass (google.com: domain of henning.schild@siemens.com designates 40.107.1.47 as permitted sender) smtp.mailfrom=henning.schild@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from EUR02-HE1-obe.outbound.protection.outlook.com (mail-eopbgr10047.outbound.protection.outlook.com. [40.107.1.47])
        by gmr-mx.google.com with ESMTPS id c2si417580ljb.7.2022.01.11.01.38.51
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 11 Jan 2022 01:38:51 -0800 (PST)
Received-SPF: pass (google.com: domain of henning.schild@siemens.com designates 40.107.1.47 as permitted sender) client-ip=40.107.1.47;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RIYrZ61xQiMKD+L4ghn/Wvmw1/BWVnfBHb0O+oQeFJBbpIMpbMTmkbbc2Fw0syuhilNq+a1o8oqOBW+knZgz/OZaXnuEKOuivWjg9cqJ/wkrH5A+FSkKLmWdod+h4b80BAyHJxce3MHPebZtdTaum8KdbwA+pfEOE5zJOslHU59xMarQsyt/488ZI3EcNZeROCURf1v+AVg8jtrd3/Ir0S4OzJtM/zZnGaxhWaWUAhPeWb2KNk4YhFHr6RcxlPFZMlYyN33IV8URPd2noV5hFzeJAmZtC1XAtCf+A7T5/N1VgMEjZKCrhLk8Og2NWmuEszXFEIHRjldzfZzmrbYE9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eHw1yxmWdN1J/EMmKxljo7rV41KWKtTwoQhCsJ/sUpU=;
 b=dkG0ec7fyw7r8cK1QwusRz1POozVyO5dBHmTDLW8huycY9feTWXwl/T8OCSf/3PlSRiQz+bj98IWmtrBBGCU+LEzULwGyaPiuSdR6sT2insJwLI5Zdgoe2nPcr8FUja1ILZpwUyn5qhVHpn9SxRqT1ijTNuRPF6zZgk0VvAdf6cASQ3WJK0l82NswinyT82ui1F59s/s/Oh32FWv/KECf+zS7lVJ8oms/yiaMeSovsQxSiELd8nboHFvUbiEp6ovE6voPcQGx6oR8jfpLhbH3wVnFPy+vlrlg89mFRArT4zSBTFWPaIjOW7DH0azCyGm4X/Dl3AF102NmRFY77gp5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 194.138.21.70) smtp.rcpttodomain=gmail.com smtp.mailfrom=siemens.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=siemens.com;
 dkim=none (message not signed); arc=none
Received: from SV0P279CA0016.NORP279.PROD.OUTLOOK.COM (2603:10a6:f10:11::21)
 by VE1PR10MB2989.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:803:10c::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4867.11; Tue, 11 Jan
 2022 09:38:49 +0000
Received: from HE1EUR01FT006.eop-EUR01.prod.protection.outlook.com
 (2603:10a6:f10:11:cafe::dc) by SV0P279CA0016.outlook.office365.com
 (2603:10a6:f10:11::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4867.7 via Frontend
 Transport; Tue, 11 Jan 2022 09:38:49 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 194.138.21.70)
 smtp.mailfrom=siemens.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=siemens.com;
Received-SPF: Pass (protection.outlook.com: domain of siemens.com designates
 194.138.21.70 as permitted sender) receiver=protection.outlook.com;
 client-ip=194.138.21.70; helo=hybrid.siemens.com;
Received: from hybrid.siemens.com (194.138.21.70) by
 HE1EUR01FT006.mail.protection.outlook.com (10.152.1.228) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4867.7 via Frontend Transport; Tue, 11 Jan 2022 09:38:49 +0000
Received: from DEMCHDC8A0A.ad011.siemens.net (139.25.226.106) by
 DEMCHDC9SJA.ad011.siemens.net (194.138.21.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Tue, 11 Jan 2022 10:38:48 +0100
Received: from md1za8fc.ad001.siemens.net (139.25.68.217) by
 DEMCHDC8A0A.ad011.siemens.net (139.25.226.106) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Tue, 11 Jan 2022 10:38:48 +0100
Date: Tue, 11 Jan 2022 10:38:48 +0100
From: Henning Schild <henning.schild@siemens.com>
To: Moustafa Nofal <mustafa13e09940@gmail.com>
CC: Jailhouse <jailhouse-dev@googlegroups.com>
Subject: Re: Adding another vpci
Message-ID: <20220111103848.5abbc20e@md1za8fc.ad001.siemens.net>
In-Reply-To: <e630d89c-45ab-40c1-ab9e-222fbbe26f30n@googlegroups.com>
References: <e630d89c-45ab-40c1-ab9e-222fbbe26f30n@googlegroups.com>
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-Originating-IP: [139.25.68.217]
X-ClientProxiedBy: DEMCHDC89XA.ad011.siemens.net (139.25.226.103) To
 DEMCHDC8A0A.ad011.siemens.net (139.25.226.106)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a105910e-ab27-43d2-b388-08d9d4e62bf3
X-MS-TrafficTypeDiagnostic: VE1PR10MB2989:EE_
X-Microsoft-Antispam-PRVS: <VE1PR10MB29893BDB56ED68DA13C4150885519@VE1PR10MB2989.EURPRD10.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5UxxLsBvwbXe6HdQa1aPrzm03IRcUjwyjWI3NL5lkUVvEiND3ENm7U6LK3L7L7zaFtYfunTkO85lmKkZ7vzQfBau0E6jvlTvhikUqVU7OnwiYZuN273Lyffba21MkWatyoNY5O5XjAad7b30nwX6sCAK0c/FTkKRAWWq26vY7RmXm70dsbKPZxcUPyZJTx1TtSW6JtkDj2HNxG6zLe5uj4fpeXDlVsGIB7d6wSxy7me8z2zB7Z/heyKq3s5A6syvO1uVz+MyGjYunPfAffrEsfhiW647ZZezLPM0nLz/UtHzdvkUKp6Bwowp0ERlDJ1T62GTal9FbKtFUaKNgfIdl3h1bwqNBd8O0ZC+uw+EGXzIcQs/7C2H9oUF407BPTVkAKiwOrxbPiOiluZAOgMnNRZInLN790ilL44ZbcduhRjw0T4MouTxQMpEKhjH06W6O+9peth2vp8wVNkob3nHBGBVE2VJXO6pb0uS2K6R70p0cITNk1q5JqtbMxA9AniJZJzD+AspohLqd1ydZXuDQjntZ4XYLZ94kdcukVwS6n0tOtq6HrbJ+3ax6T/8YivBtXXK7x6tQVz2RGcNeAqLxpktazjin4+WKUJTnWWHxqSct/rP1INJSWqnIwmLIt3on5hofTN7kvNTj6iK24l/AZ0KRZyfrfvslLXJTRJ8ktV3vSWKHMY9V6EUQF/qTnNmvb+GQqsOOjgkodh+EiaWy/ngTy+c7dLtKnH4+xFbZcSzjfr5XBPGCXApOxqUgaFSzbL0MaaCcuGxjYUk63/a7A==
X-Forefront-Antispam-Report: CIP:194.138.21.70;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:hybrid.siemens.com;PTR:hybrid.siemens.com;CAT:NONE;SFS:(4636009)(36840700001)(40470700002)(46966006)(86362001)(1076003)(508600001)(4326008)(36860700001)(5660300002)(70586007)(70206006)(16526019)(186003)(26005)(7696005)(82310400004)(55016003)(7596003)(336012)(40460700001)(3480700007)(8936002)(6916009)(7116003)(9686003)(8676002)(956004)(2906002)(4744005)(356005)(7636003)(82960400001)(44832011)(316002)(47076005);DIR:OUT;SFP:1101;
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jan 2022 09:38:49.3812
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a105910e-ab27-43d2-b388-08d9d4e62bf3
X-MS-Exchange-CrossTenant-Id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;Ip=[194.138.21.70];Helo=[hybrid.siemens.com]
X-MS-Exchange-CrossTenant-AuthSource: HE1EUR01FT006.eop-EUR01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR10MB2989
X-Original-Sender: henning.schild@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@siemens.com header.s=selector2 header.b=BYhMpHvk;       arc=pass
 (i=1 spf=pass spfdomain=siemens.com dmarc=pass fromdomain=siemens.com);
       spf=pass (google.com: domain of henning.schild@siemens.com designates
 40.107.1.47 as permitted sender) smtp.mailfrom=henning.schild@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
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

Am Mon, 10 Jan 2022 13:31:16 -0800 (PST)
schrieb Moustafa Nofal <mustafa13e09940@gmail.com>:

> Hi, 
> I intend to add another Linux on Raspberry Pi4. So, I added also a
> memory region on rpi4.c and extended the size of mem_regions by, and
> managed to get working. I added a pci device, and extended the array
> by one, and the pci device is added, but without kernel driver in
> use? So, how to add the driver to it?


What kind of device is it? The kernel should simply find it and bind
any driver that fits, in case it has one that does.

If it is a virtual network device based on ivshmem2 you need to add the
pci device, and multiple memory regions for it
JAILHOUSE_SHMEM_NET_REGIONS for the driver to pick it up correctly you
need to set the shmem_protocol of the pci device to
JAILHOUSE_SHMEM_PROTO_VETH and set the index shmem_regions_start to
your newly added memory regions.

regards,
Henning

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20220111103848.5abbc20e%40md1za8fc.ad001.siemens.net.
