Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBUPATSKAMGQEHON2F3I@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43c.google.com (mail-wr1-x43c.google.com [IPv6:2a00:1450:4864:20::43c])
	by mail.lfdr.de (Postfix) with ESMTPS id 1807E52E4AA
	for <lists+jailhouse-dev@lfdr.de>; Fri, 20 May 2022 08:08:18 +0200 (CEST)
Received: by mail-wr1-x43c.google.com with SMTP id o11-20020adfca0b000000b0020adc114131sf2257965wrh.8
        for <lists+jailhouse-dev@lfdr.de>; Thu, 19 May 2022 23:08:18 -0700 (PDT)
ARC-Seal: i=3; a=rsa-sha256; t=1653026897; cv=pass;
        d=google.com; s=arc-20160816;
        b=h+zx8bmmt7hUM4eI2+Q0psTslGW5kAObGW7fPVj7VI/K9CJNfC64yzO1Czn+i1yNs+
         CGggCZuRCxJ8L9fFd/l5yFv6C+ldYgD9h9MHOf/gv+kV73oaQyC44BbX3t1GFuKDgUBJ
         9nHLU4B51MuiONC3PZA/Kop+3eXCN7i1J+w8ROuo9fXDeJhioxqveU0pfszm1DJaXyy6
         hubTZ8+yhCdiXcU3HjMUNvdqhjLd/sbjOzEgsYEIc+zM6zHmQlG5DqltL1yMPE2L9M5T
         57oi/bvERoR2bhiKrX2ozY6Dgf5t7Yb7BzCdmby0IpsBQLWsjoa+NggbHuWoqzNJ3jZK
         B5tg==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:dkim-signature;
        bh=XGxlNPD0KV25K5DV9aERKykwF6dZnXq3zeoWYxG2tkU=;
        b=OY7Ik938FW0+0bdZNyaobWo05T9GgK1SyBjLQSFpNE1bf4y4oR9mopzOePDkM/QFtc
         Lc22LsMYQGD1FQsRL1V3S/1QV0uJ2gp3DBHIN7tTsAFJhhOXlAico1R2z2kM0IGr53Sh
         y3TMJcOCitRQzM8l//od3giyLEjieNq4u11KUqzNjqTnFy8k6zfdlgEJ4f8KSyEZO5Ra
         39tOrY0I0y1djgXZwUU0/h4qkJPoiCvoFj+c5aNeMOG16x8kiOYu0TJQj7OIsqsZZfSr
         bcxFcdT0YHfIb5xZ/YaNNn9r/4ZkfI/ng00FJYsUXy1/8vhVjuVoh5r4/DaQzZvKu2dl
         Vbqw==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@siemens.com header.s=selector2 header.b=hcNsQtt6;
       arc=pass (i=1 spf=pass spfdomain=siemens.com dmarc=pass fromdomain=siemens.com);
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 2a01:111:f400:7d00::61a as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=XGxlNPD0KV25K5DV9aERKykwF6dZnXq3zeoWYxG2tkU=;
        b=g9g9KDXwzJprv0LCg/OKf//sjVjXGiOBXnSMAmfbR5gZdKQSPqFvPmZsSsmGqwO89q
         ikQ0NIkzVOxVIULCqiDOgyfsnOudNGjFCbBbRvR1Vk2ICDoyL0SD8HL5Am/ppehlb9jj
         91a0cH2PQEduDldkgNLoF1cONhYihmXl8dRKF6gOxkLI+2qpuR41DXzDd7RSlae9fq/j
         ZoI+PBjqP9jzdHlE9buwsnLOvox5Er+kYsnekr13yhSH0XAYXCipuCwxJnyb9nx/kf21
         NdGITFQ0uS470Vi1C4dxZrsiE2VFOJZXc7K8ZqKICw0zifOf4Yuald2exMOxZy190hXc
         Yjag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:message-id:date:mime-version:user-agent
         :subject:content-language:to:cc:references:from:in-reply-to
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=XGxlNPD0KV25K5DV9aERKykwF6dZnXq3zeoWYxG2tkU=;
        b=u2jEEz5VpJ1YGWgoXP/NScpp+TGIowKfCeRTANypIoTn3kGBOyHSRiVQXUU4ipMeBx
         ne72iVx2KhjL8u0xyr1O6QLUTH4Q3k51a70kS6pbH9twEtwnXtew30Oqm6ZKEauO204+
         +5IuN0Ptm8YmgkxW0HeiDoqMIZfy+ZYnTZBOZO9dBzH30ZRVpsJ+3Gh+nd/79OfFBmNF
         pLqySKXpwLFnM1BtHHBA+U2Rc6TbPKvG7g40e3DFrCesLGHW3FuMZtuiqlaQ/NR/Gb9I
         UhRFdTep81hqbNXCYHfp09jCw0eDe26quj7P7FOZInCg2/8VcqhPrmmac7OR1Via6BZG
         fKsQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530HzP4E+oL3aWIaqsdl/PZWwYLNrHSU2BsYr4OOfTI3PX1jVzTb
	7AQToQ8OS9yNScNNPlzFUac=
X-Google-Smtp-Source: ABdhPJzgRW4X4nMFG+0PU6Vzj6ZDCTgqJF8jbzMjo3TLRCmNEX1L78Zu/7pFnEdQgqX7nC0q4AyCuA==
X-Received: by 2002:a5d:6c66:0:b0:20f:86f3:ea05 with SMTP id r6-20020a5d6c66000000b0020f86f3ea05mr522634wrz.154.1653026897605;
        Thu, 19 May 2022 23:08:17 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a5d:64ca:0:b0:20c:bb44:bd7 with SMTP id f10-20020a5d64ca000000b0020cbb440bd7ls326994wri.0.gmail;
 Thu, 19 May 2022 23:08:16 -0700 (PDT)
X-Received: by 2002:adf:d201:0:b0:20d:117c:5e8d with SMTP id j1-20020adfd201000000b0020d117c5e8dmr6975267wrh.576.1653026896049;
        Thu, 19 May 2022 23:08:16 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1653026896; cv=pass;
        d=google.com; s=arc-20160816;
        b=hUiIe8cpD7mFgOr2lnIaj+Jngtmh92mMILL4cf3c6A+iQLlpdgVwJeLmZ782tSD9H7
         Ctj8tnsFtuSMCxxkpC3m9DxqRynnJ2MQU7AubFSJILhd5dyF1YOkupdD+S6NiDVIrlqf
         WKLMrTtwXkZgmx7glrsSDqsEk5Aq/0m9kCKotwVxo/h5S5eVHwNdgeZAqscvqxV0dXEo
         7tug6uKopagwDZLO1yb+vHTnMIXK5XHyRML233EjuMhaWHNnuWMZy61zeK9X5K/LKktI
         4h4W0cqdhx2G6LkI88J9UxEibnUwSduM8HltGjSqGyuXvAD+IyEi7Eqh/+7bXJtzI41y
         2lxg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=JyDBlB0Q54l/oF3MQ/JqBylh8JNAQ92sf8Pvl+3R1NA=;
        b=Fgl6pYXHx4qp7RCcHl6EdQaBDVG/w3m+apyCLuTtYWePwxIMtVEsol0FTihWTtDpMV
         Sc2HpomU/vyt1vY86wh9/ejKHEkk5dsQAKRoFmnzLKLlLS0y3PRJz3+D7c75nGG9T/sX
         TlYhiJyNZoUInodMrfEBlI69+YgQv/eY2M1o/K5+SJOncB+pURUJLSI5g5NilKYxzH8/
         6Ay4E442N8YtG6fmocigiXqlDUXSzAOrkfP86vGlBuBBgJiXDIMMAL4yAcDC10unFFLD
         oAaRJsjgIKTMOZhXwXWrnpIAASy9vYvJ6c7Ixi0hRsb0Ul3SWYBmf7riyXBq745vaASo
         s2LA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@siemens.com header.s=selector2 header.b=hcNsQtt6;
       arc=pass (i=1 spf=pass spfdomain=siemens.com dmarc=pass fromdomain=siemens.com);
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 2a01:111:f400:7d00::61a as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2061a.outbound.protection.outlook.com. [2a01:111:f400:7d00::61a])
        by gmr-mx.google.com with ESMTPS id ay14-20020a05600c1e0e00b00394803e5756si101449wmb.0.2022.05.19.23.08.15
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 19 May 2022 23:08:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 2a01:111:f400:7d00::61a as permitted sender) client-ip=2a01:111:f400:7d00::61a;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NKU6PYCb/wk8sr69NkPAReYbAZUKjlpjXkgHuAtAL95ZygirfqF11a+VrFTLVUNccXxI/1EwhGxf7S/zNw8xsFzcW1fkNNutXlJ7kFh5XBQ+Nc35yL/sYihcfEKp7rLQlxH6j2MdQ9uJhBwH5ud5wQUkLn3Hq8nZ+l3UAjv1MeoEUDEQBK9vNE94O380uurxUQyQBEsszAPd5xn3/q5YPMjcqkoApcOaSZf08SXhF2KeXJjRdHiOOVensUiphVoEj7q2Qv6CXXYIjDPFyCasaATvEM7NHeJaMGqER6nhT/w6v0D41v1lScS36ZbOG23PadPu+8dJeRrRVt4CxUOJwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JyDBlB0Q54l/oF3MQ/JqBylh8JNAQ92sf8Pvl+3R1NA=;
 b=aB/XOit0koKpOgi4PPGA6Xu90TBqOGBGPDEQVt5pedBZo+ZKt1HXrRyu9zK/2d3mI0DCEPDRjE1ydaSqdMJp3ER+1sgRMqXZSxiQSevH2ddPGRD7E9eOJudQkqNJtflnLCr/xnnujJKiT+b2uSqtPkjpuRQFGiFRh2gOxOVfEQUad0Y7dsSTUx98kTlCHUkqoI7Paa4AJy1uufbCO3TGMiqku2SUQBYDo3Yu0j0XqFO8YsPFwLuX0KyBCXlU+7Ig4RiX6tXcNsCc3I7z18R18S9qqucBKO35IpK7o9qdhMgkJppjjyMZPYMDMnNUKfn89FK16/hPDCJmjDlOS+F4yA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 194.138.21.70) smtp.rcpttodomain=gmail.com smtp.mailfrom=siemens.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=siemens.com;
 dkim=none (message not signed); arc=none
Received: from FR0P281CA0052.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:48::20)
 by PRAPR10MB5323.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:298::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.17; Fri, 20 May
 2022 06:08:14 +0000
Received: from VE1EUR01FT101.eop-EUR01.prod.protection.outlook.com
 (2603:10a6:d10:48:cafe::4d) by FR0P281CA0052.outlook.office365.com
 (2603:10a6:d10:48::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.7 via Frontend
 Transport; Fri, 20 May 2022 06:08:14 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 194.138.21.70)
 smtp.mailfrom=siemens.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=siemens.com;
Received-SPF: Pass (protection.outlook.com: domain of siemens.com designates
 194.138.21.70 as permitted sender) receiver=protection.outlook.com;
 client-ip=194.138.21.70; helo=hybrid.siemens.com; pr=C
Received: from hybrid.siemens.com (194.138.21.70) by
 VE1EUR01FT101.mail.protection.outlook.com (10.152.3.40) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5273.14 via Frontend Transport; Fri, 20 May 2022 06:08:14 +0000
Received: from DEMCHDC89XA.ad011.siemens.net (139.25.226.103) by
 DEMCHDC9SJA.ad011.siemens.net (194.138.21.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.9; Fri, 20 May 2022 08:07:43 +0200
Received: from [167.87.32.180] (167.87.32.180) by
 DEMCHDC89XA.ad011.siemens.net (139.25.226.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.24; Fri, 20 May 2022 08:07:42 +0200
Message-ID: <eafaaed1-604f-569b-47f5-232b01cfcee5@siemens.com>
Date: Fri, 20 May 2022 08:07:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: Kernel panic on enabling root cell
Content-Language: en-US
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
CC: Jailhouse <jailhouse-dev@googlegroups.com>
References: <2dcadf3d-1df9-497a-a530-be01a5da96e9n@googlegroups.com>
 <CA+V-a8tM_umwZ-+vt7VST1pBJF2MxmbOJSonzDDbJz_OV=GE3w@mail.gmail.com>
 <2fe4d998-1784-53c5-a653-994882ec7fb6@siemens.com>
 <CA+V-a8s9Ta0fPD6V=yGYDhvKngiMrCghi07Y_4XTbDPk9HeHfw@mail.gmail.com>
 <c44b2378-e682-4b0b-8443-57f28aeea9ee@siemens.com>
 <CA+V-a8ufXHeaMTwmMmtYdVijY_OVwU_+eTtSbr=Rx=oiQa=9tg@mail.gmail.com>
 <e1b5e28e-f6a7-b603-95f3-8a72f0405d7f@siemens.com>
 <CA+V-a8t9brsw1fu_x9ou7uHOYxhO8AjuKiLfW+1MJ6tw=A=f=A@mail.gmail.com>
 <8e895901-cd60-9696-935a-293245586a77@siemens.com>
 <CA+V-a8tLSnKSRVOGwHmNUs+y58QoiDazwBA9rrQ1yGXWcFLVRg@mail.gmail.com>
 <234b1a2d-ea25-e38c-5053-eea15f57b933@siemens.com>
 <CA+V-a8vUAEZUkbhhHEHKHzf-OhXqnfMkojP5o0nSEtgBdSbRQw@mail.gmail.com>
 <35cddc35-a563-ca93-8e29-b9ae06844030@siemens.com>
 <CA+V-a8uGOP49BWzY1bwprzLzhUXFjfqW6yD1c-LZN7i94mrzbQ@mail.gmail.com>
 <a87eb794-7dc1-f447-c13a-de600a48d59e@siemens.com>
 <CA+V-a8uBuBZb5z-HvuLF96jTtKLLKCt8nHmqKt4jtX9ninJAtw@mail.gmail.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
In-Reply-To: <CA+V-a8uBuBZb5z-HvuLF96jTtKLLKCt8nHmqKt4jtX9ninJAtw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Originating-IP: [167.87.32.180]
X-ClientProxiedBy: DEMCHDC89XA.ad011.siemens.net (139.25.226.103) To
 DEMCHDC89XA.ad011.siemens.net (139.25.226.103)
X-TM-AS-Product-Ver: SMEX-14.0.0.3080-8.6.1018-26680.007
X-TM-AS-Result: No-10--18.894500-8.000000
X-TMASE-MatchedRID: OMk5Q+H0IT45QaOxwNGfvo9bHfxDWoib5BqRf5kNIzL+xRIVoKNMvEYj
	0zDHPzJpJeI9RhD7ZBGipFNLeO72SFhKDdNdlrOor4+R+6ldzMoDI91I0N0Y7wPZZctd3P4BjWP
	6asaL88U+9dYKTm5jhEY+53TsI7l7RgL8bfVL3cqxpMXwFK0zmWPKPn3I8aTkpyEWs4H2RqcBDy
	a2JbH/+gdY+faaPuhEjJ2ZvLV5BfsegE7wWr44F48F3Ylz5PzGYDYgBcRN64oIvxEURH+P04PL5
	Pgu788ebVkSV/UXp2tEotrrfbJfNGUEpJZFU04zo3OQ9cMz+QYcvw2fLc9Qi/NmGUwdG/ivsA4Z
	nTP1AH/Hcpx10+ABgfBUq5JsuvxSVy2IBz5gEjfuPtnLBVKiMoWYwRXCL6rdR4PPMO+JjQ45B3K
	UNlRt58uSXx71bvSLJ3IOVnYrbXeQyMedJ2g4ojBqcJ6LaTQkONFwC8T7+SuJkf5qQgIh3dKwBB
	/OFHVCx8cf8zkUc1ppGe7B2ogoeyvn27+DO/kwtTOrxEGQm4ZJI5ZUl647UDl/1fD/GopdWQy9Y
	C5qGvz6APa9i04WGCq2rl3dzGQ1grgdOBBsccb4dGTOYKrHZNKyWQCUPc85QNQ8+m3NgVRgY2MV
	eE9GlgkrYwrjkf4Y
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--18.894500-8.000000
X-TMASE-Version: SMEX-14.0.0.3080-8.6.1018-26680.007
X-TM-SNTS-SMTP: 536AA62E4B9951F0B0556CBD0CB3476CF42A613434DDCA5491B4BFB1AC5691B32000:8
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 902ff948-dff5-4e27-9835-08da3a272054
X-MS-TrafficTypeDiagnostic: PRAPR10MB5323:EE_
X-Microsoft-Antispam-PRVS: <PRAPR10MB53232A9DA230439AF15894EF95D39@PRAPR10MB5323.EURPRD10.PROD.OUTLOOK.COM>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vdUnzq2g1xF6RXzgnfjBJVIuxbS/fDkKLekpZOocQZHFhqpVzvgOvmkvmFHToryQO0xukrfmsccfvCuSwGSdOeg1uiUG62AjXorvSL3nWR+XR5W+dHRc8rF/rMAJm4gm0rczmCLHTOO4NbZeeqYkZLcuG0TfGNnD5avojLiBbJGPqGVeOkBSAyyoxXBT1Hn3zzCSK+UOWa5L42NR3MA5zeZzouLMtjSVkblwE1unzMb7EsUeIO4Vhu95AoM0OelowM0UsaXYnvFSB/AD9GxY/Rz1w5MHqmLIJVsTRvPUjTDyP6h0Pp+UnCfMX8pEHQ15IF7nceZXElqUNPqjN/Wn5Ite60G8C2gIfnIyWruzUMoRNhJfbSRk8vE4tlt8FgOBAjQ9qM9q/4MYuH8FtX3O8phrGQ+D5SeHmt6rYYWtIfZWUXB3MpzUmr2LTT0p45A4zcVbGh2OwRNeV++E0ccrA+foEPCGxfNhY6pEMVfAynqzA4snlIXUA7eZhDLmNcYuDz3rC5XNKQEf7SjLknIejYJS/msgmzMXhubVGAVNHSuWuatrUj/DkcqsyfZBt5s+qB47xZYeyGHUh6TqkReh6Xtm1nwp4KYgJyDrk43M8sP2uFimqOYiM0OzYAUEAes8iMhHoH41RnXuB6dEih3JlLzVGpv0U8Ho3aa57uz0bwDRPcnle0KdoBu6LHIEImcMqIBOJOPFX+8PXWAcvmKrP0L24xz5Cm7afR2LgR5Er0U4byDnaA1cxlSKZ5Pwld+uuyp0FnptxdqZB4eZ1HmWUiMnJKddw4X+VFA7ANaa3tcZXcKiAAaZSBqyHvOFkUCWjlN02TznRMICLfFdttDTtg==
X-Forefront-Antispam-Report: CIP:194.138.21.70;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:hybrid.siemens.com;PTR:hybrid.siemens.com;CAT:NONE;SFS:(13230001)(4636009)(36840700001)(40470700004)(46966006)(8936002)(966005)(70206006)(70586007)(8676002)(4326008)(82310400005)(2616005)(31696002)(40460700003)(956004)(36860700001)(6916009)(53546011)(6706004)(82960400001)(7596003)(7636003)(16526019)(5660300002)(31686004)(186003)(2906002)(356005)(36756003)(47076005)(336012)(44832011)(508600001)(86362001)(26005)(83380400001)(16576012)(316002)(3940600001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2022 06:08:14.6377
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 902ff948-dff5-4e27-9835-08da3a272054
X-MS-Exchange-CrossTenant-Id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;Ip=[194.138.21.70];Helo=[hybrid.siemens.com]
X-MS-Exchange-CrossTenant-AuthSource: VE1EUR01FT101.eop-EUR01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PRAPR10MB5323
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@siemens.com header.s=selector2 header.b=hcNsQtt6;       arc=pass
 (i=1 spf=pass spfdomain=siemens.com dmarc=pass fromdomain=siemens.com);
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates
 2a01:111:f400:7d00::61a as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
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

On 19.05.22 15:23, Lad, Prabhakar wrote:
> Hi Jan,
> 
> On Thu, May 19, 2022 at 12:39 PM Jan Kiszka <jan.kiszka@siemens.com> wrote:
>>
>> On 19.05.22 11:44, Lad, Prabhakar wrote:
>>> On Thu, May 19, 2022 at 6:30 AM Jan Kiszka <jan.kiszka@siemens.com> wrote:
>>>> Forgot: that cannot work. The call of arm_dcaches_flush will overwrite
>>>> lr, thus the second ret will only return to where the first ret jumped
>>>> to - endless loop. You would have to restore lr (x30) from x17 in
>>>> arch_entry first:
>>>>
>>>> mov x30, x17
>>>> ret
>>>>
>>> That did the trick thanks!
>>>
>>> diff --git a/hypervisor/arch/arm64/entry.S b/hypervisor/arch/arm64/entry.S
>>> index a9cabf7f..7b340bd1 100644
>>> --- a/hypervisor/arch/arm64/entry.S
>>> +++ b/hypervisor/arch/arm64/entry.S
>>> @@ -109,6 +109,8 @@ arch_entry:
>>>         mov     x0, #LINUX_HVC_SET_VECTORS_LEGACY
>>>  1:
>>>         hvc     #0
>>> +       mov x30, x17
>>> +       ret
>>>
>>>         hvc     #0      /* bootstrap vectors enter EL2 at el2_entry */
>>>         b       .       /* we don't expect to return here */
>>>
>>>
>>> With the above diff I do get the below:
>>>
>>> [   42.980805] jailhouse: loading out-of-tree module taints kernel.
>>> Reading configuration set:
>>>   Root cell:     Renesas RZ/V2L SMARC (renesas-r9a07g054l2.cell)
>>> Overlapping memory regions inside cell: None
>>> Overlapping memory regions with hypervisor: None
>>> Missing resource interceptions for architecture arm64: None
>>> [   46.582588] obcode @arm_dcaches_flush: d53b0024
>>> [   46.582616] obcode @arm_dcaches_flush: d53b0024
>>> [   46.611311] The Jailhouse is opening.
>>>
>>> So it looks like something to do with the debug console. This has to
>>> be poked in the dark or any easy way to debug?
>>
>> Well, we do not yet know what goes wrong. We do know that we can call
>> into the hyp take-over stub and register Jailhouse with it. We do not
>> know if we will then end up in Jailhouse in hyp mode and just lack
>> console output or if we crash on entry already.
>>
> Right agreed.
> 
>> To move the uart console out of the picture: Did you already check if
>> the driver you select in the Jailhouse config is actually one that
>> should support the UART on your board? Next is to double check if poking
> The UART on this platform is almost identical to
> JAILHOUSE_CON_TYPE_SCIFA type, but with some differences which I have
> patched to work on this platform.
> 
>> registers in the way the Jailhouse driver will do at the addresses you
>> configured will work: Pull the code into the kernel module or even into
>> a userspace application with /dev/mem raw register access and try out if
>> that works in a "safe" environment (without hypervisor mode).
>>
> Sure will give that a shot, any pointers on doing this from userspace?
> 

Something like this may help if you do that the first time:
https://bakhi.github.io/devmem/

Jan

-- 
Siemens AG, Technology
Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/eafaaed1-604f-569b-47f5-232b01cfcee5%40siemens.com.
