Return-Path: <jailhouse-dev+bncBC44VTVY2UERBHWUTWCQMGQEQJ2FIFQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23c.google.com (mail-lj1-x23c.google.com [IPv6:2a00:1450:4864:20::23c])
	by mail.lfdr.de (Postfix) with ESMTPS id 26F6438C156
	for <lists+jailhouse-dev@lfdr.de>; Fri, 21 May 2021 10:06:55 +0200 (CEST)
Received: by mail-lj1-x23c.google.com with SMTP id j2-20020a2e6e020000b02900f2f75a122asf8471267ljc.19
        for <lists+jailhouse-dev@lfdr.de>; Fri, 21 May 2021 01:06:55 -0700 (PDT)
ARC-Seal: i=3; a=rsa-sha256; t=1621584414; cv=pass;
        d=google.com; s=arc-20160816;
        b=Tpt2lL4Ykv8qgRGDrgKsaoUyux3J6Y87zR1G2aCgm4st3/ffn3RTwRDelt5oXIiAFr
         Qm2jtq2N9OQQbrmMgVKTnQXzSfx6sUXR4axCWBy9K3hK3G61I0//p77fxmldO/NqAhYU
         ZHRXl2SYEpYnoBcimHfnlqmDUGdvmS4J1K2UI7ktMoKUxdLqonnTvPGPaRvHXPZubVWX
         2TvcrQWBVwmXMr+7cNXHIP2TA7ZfVGhYK76g+MLTjqGJiF/C+9f3ZxkdK67+8QJH1Q2j
         1iRupcq8FG1cV7Egk/EXMd1DiQdtOqA2YpZvHRIB6fr+5NdYD3wEmckgILQlTM2cvIBw
         bDBg==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=a35dPfHljQW4T7emJB/knbehZbcZ0sMfArlq3mQOBhA=;
        b=iPuxblcMeC1VH+Dyw1ngmYUxsZwnY4k6itho65zGhrP+29ygMjZI9C674zZ+RdfmSv
         yob6epZNHgAuS74NNm34Fns0E/IpkE9FpO4ojqbz4QN1HStRC7YyoKdFqKb+PuFbzbBY
         QqAr53Tdw1ReY2xegqckp/py9yeyNuH7xfdVvDKYlqCO8hr1jejwcapKUH5cLVODRzxV
         vbNy4C1DQ1tH9IdMhZ+XCPMlFuI8jh0HkvHrMFLddIME1kJTo0N++hG5wjOU6waoxl84
         GvElB6qOsNtZtg7ziTtiA57oeQ6Cv4x+2Mff0JV4sh/t44JbKuBlewljBzNMAoAbPwfa
         FRdg==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@siemens.onmicrosoft.com header.s=selector1-siemens-onmicrosoft-com header.b=ZLuU5StF;
       arc=pass (i=1 spf=pass spfdomain=siemens.com dkim=pass dkdomain=siemens.com dmarc=pass fromdomain=siemens.com);
       spf=pass (google.com: domain of florian.bezdeka@siemens.com designates 40.107.20.79 as permitted sender) smtp.mailfrom=florian.bezdeka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=a35dPfHljQW4T7emJB/knbehZbcZ0sMfArlq3mQOBhA=;
        b=S2HGzLRCWFZv8v+fPFiNSVhleSQMcVK8P3bkH2PysmnZWn0RnA7fnMjfhr1rcYDOYG
         7Z37iaJAGw3+7flQYHIhYWZMmse1gXQEhz/SlGCk7P5BYAX2YUtjZnIk4blDOAcGGNun
         6JxPQcleIWVJSfoQ5wN3+0Q3mljFya8HaqjJxeubkHV3X/5/QEZfZ9/QYrZETheKcRmf
         cX9LsisZ2kNUgC1S0bG8YnfJj91sw6jhWUpcsS/UZ9jpTHp+oJZudhqiO8NZEYqottWa
         LsRqPSDwTNhmk4n/TbdXNnhKr/A8qC+5+L841tZfPsZj6ftsh/cwYNaQMlvySxjX7vGH
         Iohg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=a35dPfHljQW4T7emJB/knbehZbcZ0sMfArlq3mQOBhA=;
        b=kacxvNCCJJzsdQtcCRDRDtQ7YY3fhV9AMDCA+jO3+YIPMojO2f0Boz5V2+GsM/B57G
         xnfkcmM7M3Gput9uZNtHzXX4XNCYCAMk58gqX5hjY5pmxU59l13Y3TL0CYrElaqEYd/z
         4rBENzfRKSkzubhUw0WAIOWOxAcnrOuRK1mUILUbzo75DstF8sS0nERjs6m/hjVE4WOY
         A/WKHCeBA6J9vGFv98RLt8L3HTvx3hJ7vOsvsmhRhASnwK4yv/PWnEwrvQAOY0NvjRJ/
         hnBrnnI/D+D+0j6joEek3smgaPEgxkD0/VR3zCAh4kam/a/hsvFZ63TP+tOogt+abGCI
         h8uA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531lR+UMoEuDoNX0Uz9lMgwCcamqBgjEqfmfLQjLSOsOh7iVkXYQ
	UKl3jZhDWmytvtvBIRaPU+o=
X-Google-Smtp-Source: ABdhPJycvVAVo4D+8Si5UlaNbTXIA9Jkk23IvTrkI+9qBeZofDVHVY501G473TI8dxcHX9v3LVA7aA==
X-Received: by 2002:a2e:390b:: with SMTP id g11mr5906900lja.505.1621584414671;
        Fri, 21 May 2021 01:06:54 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6512:3f94:: with SMTP id x20ls28849lfa.0.gmail; Fri, 21
 May 2021 01:06:53 -0700 (PDT)
X-Received: by 2002:ac2:48b1:: with SMTP id u17mr1382664lfg.294.1621584413589;
        Fri, 21 May 2021 01:06:53 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1621584413; cv=pass;
        d=google.com; s=arc-20160816;
        b=eqE9aUF0UjPOCYvAb6mq1L0Nk/5oRg1yclG7rctYh/k36YRGo221Zl/HDePlined2q
         /O7BRxfFyG6Ezzpxu53XUJYiYAdJiO4fpRdeIjatc/tvl2oATpfhlHNtC6mn2XUWeVob
         me7WA22NLXa50+51IAIJsDGQZm1zjawsUUg4C13est3+GxiXTnlDSu21jT+AMezdePO2
         mO3+YqJa05zNPmMjacbgrLdGW7C/qdjjr5ScGn0UEX80Qx4S6/16fgl3uLV+CxOcmUXB
         ONFsLkf+o8XueZojS1FB36XDVpmLYNDdz25B2k+zhc1vPx73tEEqFtRIehdu6KaQcxeo
         Tzlw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=eg8fVDSPIxiGAFxVpwz06Q/usxbtHrFClR5JZGY3J6Y=;
        b=lA3L5gx5ub5f6Vp2V9vZM2H41FKIUtcp/zHlDC1UEuVbssxrZtMIiDiMxOCxHO3zzH
         RwFEADrSZaSxoj8ouZ3ObWY7vvxlxBqnLVfMCrmnsBbmnL3hR492XwQlmFpegKYxlcrZ
         ig62urc/pl6M4cRHCWnyFDOtzQg5MRYi8cGKzGaXVToLc0GAO7/stm1TFCjhL3+dutbG
         CJ2SkdsKfpWRAdQ1qZ2Qx/mK03l46chps8iA9zoPbjDdlDR0pUvNXS9GJGPFQpV3Yoqv
         zXMUHeKOkeNGr9CPwVKY6SMnKrB/83HnR5Fq6JJj/T+Y3cwicmgQzHkM/3Be+Rdenf7Y
         w3eg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@siemens.onmicrosoft.com header.s=selector1-siemens-onmicrosoft-com header.b=ZLuU5StF;
       arc=pass (i=1 spf=pass spfdomain=siemens.com dkim=pass dkdomain=siemens.com dmarc=pass fromdomain=siemens.com);
       spf=pass (google.com: domain of florian.bezdeka@siemens.com designates 40.107.20.79 as permitted sender) smtp.mailfrom=florian.bezdeka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2079.outbound.protection.outlook.com. [40.107.20.79])
        by gmr-mx.google.com with ESMTPS id q8si322049ljg.4.2021.05.21.01.06.53
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 21 May 2021 01:06:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of florian.bezdeka@siemens.com designates 40.107.20.79 as permitted sender) client-ip=40.107.20.79;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J3GI52+6RwvcubgHQgiIHghW5uZn4M18cfoKho/HhGEoUVr8xO6vbKEb9XGEcRaBbEQzgk35GahvDTjGtY6tIZ4un4EXLukzOf6UCNstC71GXNT2XX9rkmcMDh29L1oKVMJlC71r7KUc3Kta+AOFPySUb5+NuqLhBooca2KWdMoHNYsY3Tycodq2H8sGxakxd7WzA4N9Fri6+41wbV5kCMJsceH0MFgQFXH9vbnFX3PM5Jl/lECzUILE1JKB6xWOyh6fI6lmN3AKrFplYx+s92gGsCFx4pCnWnLyyn8rqn9gssPDt7yPjreMr92xIw0yXn+6MZiMZiiFfgp2KPtzww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eg8fVDSPIxiGAFxVpwz06Q/usxbtHrFClR5JZGY3J6Y=;
 b=l7VLOt3tPtkoULj9ivM/Y5Ojyx4ZnFAeTNKqVO/+i3Unfa68zZ4VeJwpzLiRoxOg4nDfZP0tO24z9Jx/x41MfR8xHmu9i49NbdvdjEep038ibmYh6agsAliITavK72qcxUheov0cLhCdCDuqk4muLsQ3BPGh0C1dKcI3g6tVIaENGJ9pBV5CWWyXuIAEtT4qQngRuIQhLzo1WxiUvYiqZJZY5wdIOxh/lmXaXl7sIXdGbwdkfFyxt3nYOXuooEVnMeHvrNdq3AihLyzaq1cGRTr7st+S/nw1Q4CmRa1BKbpPUAnKZOhjK8KdJvQ1w1OpCb3j4OaSqc9mRDlxsJQjyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
Received: from AM0PR10MB1906.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:49::10)
 by AM9PR10MB4870.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:419::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.25; Fri, 21 May
 2021 08:06:52 +0000
Received: from AM0PR10MB1906.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::bda0:21a9:36c7:c9f6]) by AM0PR10MB1906.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::bda0:21a9:36c7:c9f6%7]) with mapi id 15.20.4129.035; Fri, 21 May 2021
 08:06:52 +0000
From: Florian Bezdeka <florian.bezdeka@siemens.com>
To: jailhouse-dev@googlegroups.com
Cc: jan.kiszka@siemens.com,
	henning.schild@siemens.com,
	Florian Bezdeka <florian.bezdeka@siemens.com>
Subject: [jailhouse-images][PATCH 2/4] Update jailhouse-demo distro from Debian 10 to 11
Date: Fri, 21 May 2021 10:06:44 +0200
Message-Id: <20210521080646.488836-3-florian.bezdeka@siemens.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210521080646.488836-1-florian.bezdeka@siemens.com>
References: <20210521080646.488836-1-florian.bezdeka@siemens.com>
Content-Type: text/plain; charset="UTF-8"
X-Originating-IP: [2a02:810d:82c0:38fc:e180:2248:7590:2b4d]
X-ClientProxiedBy: VI1PR04CA0105.eurprd04.prod.outlook.com
 (2603:10a6:803:64::40) To AM0PR10MB1906.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:49::10)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost (2a02:810d:82c0:38fc:e180:2248:7590:2b4d) by VI1PR04CA0105.eurprd04.prod.outlook.com (2603:10a6:803:64::40) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4150.23 via Frontend Transport; Fri, 21 May 2021 08:06:52 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: dab6ad18-9f63-4e67-6af4-08d91c2f6459
X-MS-TrafficTypeDiagnostic: AM9PR10MB4870:
X-LD-Processed: 38ae3bcd-9579-4fd4-adda-b42e1495d55a,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM9PR10MB4870604869CA94EDD435E97AF6299@AM9PR10MB4870.EURPRD10.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:296;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: OPOjOz/K/eZFBd7TP0n3QhHoQzidZuFivEukBKfoNmgUKc+OR3QG+66bBmZLsw2WXVrLipNnm4A0z9kt9nnhsp+I/mHI/Bhw38BIaQUjqE2aayF40BNe7g0nGIhSoE5/5vyCnd8O3a8ydo6qi6kh9inYbRuEa86W2h0FFKMyHTlvRXjvnHsct2/qzFtxI7tpc88DJDMl0vi5lavRrQSC5j2DwKW0OXiuce+Swp0ut08tJYkV3Nfbj+HvkaWwcuzdWsHQI8Wm2+WihmtaZl1d7yjsOWDw+yeYB9dauMLlScP23/RU6FZPSXQa2S6jQo3FJ48e4Lfw6Oc+tkLGAxnW8C66p1AyGDnZ53q5N9oWbbSll8EyOW55V+5rKwQhT7XuF7UDVqu0a7L8AUBqPIKhBX8xMvuK6xKXRb1qM5EXXes5pdJW4zWRC5sVIFCMZrpR2801EmhN6YSzsQhNTEgFav78lvf/+1C7tcxEuuycVYzL+uTVDxAl5dyK3pdG+guf1Q6LFSNKi7QsFdC8jh7pkdR8DcGQK8pcyA0bcGRVmPJR9cCPZ/B7y3tAjcVb+YG9BeRORCRduXXVr9NTyo4B0w==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR10MB1906.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(376002)(366004)(136003)(346002)(396003)(16526019)(1076003)(478600001)(8676002)(2906002)(6486002)(107886003)(66946007)(36756003)(186003)(2616005)(44832011)(86362001)(66556008)(4744005)(6916009)(38100700002)(66476007)(6666004)(6496006)(316002)(83380400001)(4326008)(5660300002)(8936002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?pPBLcOOIJHhlqtyebvctQ43qjf3QaCYfgnMEAfKbTvI9fBHrocYt1H+dF/a/?=
 =?us-ascii?Q?Hxi0g5TwUPQn0zEFyO+UACjdJkxcxvAj0+YvRIhEK7APSmEEWEyQgpMIOE9j?=
 =?us-ascii?Q?P24VtLnfHm6MhaOdI2l7P99qAVFXFSOJW2VXYqof5FDzr84gJ8h4oruVRGes?=
 =?us-ascii?Q?LUakD66h1vsui066mb17tlNUd2lirLYRjeARDwdrapw9vG/1tPHLVKLmUctj?=
 =?us-ascii?Q?b36v1cBd7AUrr2hhpK5pfWDLsP24lzSkWDop/vn15UVYP/0nuUoQj83dz4aI?=
 =?us-ascii?Q?Q7Lxk6Le//trJyZSEiSbAebsHjX/R7TFhStfkLXR4DcWydtxvWRtX7Nq7bCw?=
 =?us-ascii?Q?fquQfsg2GqB16wss9+sTE8I4YdKr6v0cIbQExUImYaX+Ea2qEwnx65rLQ6M3?=
 =?us-ascii?Q?Pl6w/iLFpNEv7TCIDtYX7iJ6qe7ZqYa24pCfPBrHsmXjJ5clPJjipaqe99FO?=
 =?us-ascii?Q?6GD1uWdhmDG2gh3Rug66GQxp0hHywTZi65RuCYoRstiBS6nMOZ964l0GRdP2?=
 =?us-ascii?Q?9HSjZsydcC3INSwmkID84lRmpgC6SCbNUQpWzoOrvZETrCMsWjvFVLxt5ug2?=
 =?us-ascii?Q?B4nBjIPzdp35AtRV7IrI2gII23wtNdlJucvF17eg50gzeO4ewkelfg0xs04P?=
 =?us-ascii?Q?988ybGI50+PGxu6hGGELr24I3sHPhOcnamLVeKsaKLNBYGdBVk5SVBl9Full?=
 =?us-ascii?Q?yG9vml8nA4VNFjXObputLxqklJOJMmeKA9Yu72lVAD50nthX4MPZOfotcgCb?=
 =?us-ascii?Q?pdsREd8JTnjvDZ4jS+ABRU/G6e6XBo9bNLOvtKBaACvFTWnyf//hRnQf8Rqg?=
 =?us-ascii?Q?d0b2jgxXgqCY9U4/KQPKLJGhAeeOI/8HMTbJdbwGQavH1KGVaJfH5wlX7ul5?=
 =?us-ascii?Q?hV9Lj9l9IFMkgSq73zgl1FGHXP1UAyCNxYHtCcQ7JjJmenlQsl5KRHdUXheu?=
 =?us-ascii?Q?8oFUp4YhfJQnQ30XUtoZQK/VzMHLIO0xPQss5/2Bo4gmlFIn+Sm+PHf/t7b1?=
 =?us-ascii?Q?/1WLS2xNT9h8Jh71h7qUYnydkxWWwYaSptRZ3IuD4vJ0nR43UVPI8Aw1thaL?=
 =?us-ascii?Q?O2Jv8IcOxyzJHhAZHFJGGMmqtvIB7txZ4HQx4XIU1gHOJMAF5WIUZrBYAGGz?=
 =?us-ascii?Q?W/gBu/EJlgthi2RA63GfY4LjtvAxAL8Sej0A7z83ATZ0qSTlu6cWJ9aotT2N?=
 =?us-ascii?Q?u9fUKf4YG5v++kiSXf+VrvH/8Kd9oBv5nNy+5fpWFOfNykbezS70mBQJgKPK?=
 =?us-ascii?Q?hed6hqzkHJUGIM4/FTaO1Kljk0PM8GpqzkfGKI/esVjvBA8AalA2quqlolXS?=
 =?us-ascii?Q?4jBCN1R27OpZIYEAYjcQz5axU2lvf2ZDSI1fhnEvatLhLrITK/BOIGgwcTpd?=
 =?us-ascii?Q?vS1rGhdLH2Qq0j5eYZGJzB20BQnF?=
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dab6ad18-9f63-4e67-6af4-08d91c2f6459
X-MS-Exchange-CrossTenant-AuthSource: AM0PR10MB1906.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2021 08:06:52.3497
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9bgHPGIS7RFgy6hbUTG0Z3F//Y4Isw+QtjtVtzr8GKsU02h6pCEmbvK00IZGqqP/o5QB87RAGKtR4TQkl+s0ukF0qfJOCYV5d7PqE2Mnu5I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR10MB4870
X-Original-Sender: florian.bezdeka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@siemens.onmicrosoft.com header.s=selector1-siemens-onmicrosoft-com
 header.b=ZLuU5StF;       arc=pass (i=1 spf=pass spfdomain=siemens.com
 dkim=pass dkdomain=siemens.com dmarc=pass fromdomain=siemens.com);
       spf=pass (google.com: domain of florian.bezdeka@siemens.com designates
 40.107.20.79 as permitted sender) smtp.mailfrom=florian.bezdeka@siemens.com;
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

Signed-off-by: Florian Bezdeka <florian.bezdeka@siemens.com>
---
 conf/distro/jailhouse-demo.conf | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/conf/distro/jailhouse-demo.conf b/conf/distro/jailhouse-demo.conf
index 5b0fb54..6f2c021 100644
--- a/conf/distro/jailhouse-demo.conf
+++ b/conf/distro/jailhouse-demo.conf
@@ -9,9 +9,9 @@
 # SPDX-License-Identifier: MIT
 #
 
-require conf/distro/debian-buster.conf
+require conf/distro/debian-bullseye.conf
 
-DISTRO_APT_SOURCES = "conf/distro/debian-buster.list"
+DISTRO_APT_SOURCES = "conf/distro/debian-bullseye.list"
 
 KERNEL_NAME ?= "jailhouse"
 
-- 
2.31.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20210521080646.488836-3-florian.bezdeka%40siemens.com.
