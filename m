Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBA5GXCGQMGQEX2DRM4A@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x13d.google.com (mail-lf1-x13d.google.com [IPv6:2a00:1450:4864:20::13d])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C36A469751
	for <lists+jailhouse-dev@lfdr.de>; Mon,  6 Dec 2021 14:41:24 +0100 (CET)
Received: by mail-lf1-x13d.google.com with SMTP id i6-20020a0565123e0600b00417d29eede4sf3811151lfv.12
        for <lists+jailhouse-dev@lfdr.de>; Mon, 06 Dec 2021 05:41:24 -0800 (PST)
ARC-Seal: i=3; a=rsa-sha256; t=1638798084; cv=pass;
        d=google.com; s=arc-20160816;
        b=PRgtLD/ePNGaWCqJ1Epjwn6eZjWE6Vy1vHvDj4QAAGHRyrAEfChp1tlmuGZGedxZM0
         nO99Vu2BoSDSotOgckJRqyScFfgUr8dD0JDqs4OkfnUo4p1DFgw73OR8CivhOoIYrtiA
         IcW3M8CUXfaxV9xwCur7ZjZOpQsa18tlibPbilfXueqAMpuuxFxodMgxElVtSDz7H6Be
         XqTy6GawhL+bFfVCkSdXgCV3dEG0gY3kuyQYI/+JOzP0/W5ERDSUIcch1Y2rGmpKuyck
         sYXY9FINRObR5gA4YNFT8Ghs0sFfnBITofN2MdpGRtXdc/CszKNzWU6w6HW3bxEMPb9v
         z/vA==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:cc:to
         :subject:sender:dkim-signature;
        bh=GU10rLjKDr8axEMgX5VeRQ4mj2vbT+uDfi24wI2KqFI=;
        b=fZ15T3k4UmeTOgPnQp3zlIqf0I6tKUJEDgsr9F+CpNrKyJzuxwmfv9AH8RPp3EJsw3
         rJZ5FiYIMJVirF6dY2txXsbpyihnTs+itBD/A3GqrxskyV/2RGk5IWw6z9izIynS+Adm
         JNuIeXdL9k5A3wR6160UbTm6kmHFNo+wDPAm7AysKY8uVatk2kZYUaOdfhkXHNVEv7+w
         mhi83qmV0YmHyfZ1MvlAcgXRCKPOctCYYX62OokoiuAbMUIsWLxB6Vnja5F6Jszqurcl
         mAgBmBlsnYGiCYR7lA2lhwQpnLrGfCzSvMX52y7sQWfKa6FykUWqz+7jUDPmdGolFF79
         4bOQ==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@siemens.com header.s=selector2 header.b="sFg4K/Ox";
       arc=pass (i=1 spf=pass spfdomain=siemens.com dmarc=pass fromdomain=siemens.com);
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 2a01:111:f400:fe07::612 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=GU10rLjKDr8axEMgX5VeRQ4mj2vbT+uDfi24wI2KqFI=;
        b=nTjwNyzEoAiwkjXFg544p577K1dBxZncmAO8TAsLiZ5+kDyk5Wq/xV6rDJUMtFUNBJ
         /K560r8hDEp0TegjSoqoeQr3rEsbdeH0KJwEtH7MxFoczwmc21n2XLkWN2FeD7NwsXJ/
         FxzjjNw2JKJUWKnL+ht04cT/Qr4HVKfkYOfBXLr2OuGMsb4G+R8pd00OP6Oapank7VHB
         n7zJ7oxR07FvmtgWKcLvrldzNc0shTF9hE8LM0hjRGiJlEfj50rlc/HobBPE7r44Lkx8
         FoO8mnhBY0qHnyvjTpzkPPCBPTf7/DEpUAHC+Rklwz/Xp9eZdlU+JJIPWapAleSK7vqa
         W9AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=GU10rLjKDr8axEMgX5VeRQ4mj2vbT+uDfi24wI2KqFI=;
        b=tUWVjlhwmCRqREwbe5yaHqXYJcbOyD9sZwtFvbeeZw67AeWOHlMN64aOwUn6O6Z5HU
         vpdG7YYT4bIEZhbMG4lf6SKlB8X+K572CTTSrB6ALXOG3V4qYywwJd9UMDF8h3cX6BmL
         4LM0DxaaVpM0ijLrrFGIaSqjyi6XQ2YkhO+BYIysrijmktZ1zAcO5pV//CqVY6i0xAAh
         lbeBodrIynJBdqDou3L0b30iAakhKC3+0RAC0WpZUoCOvtMQcGoiX+CcPCUkYfF/iHKQ
         IrXYoxCP994mCwj52Ee51pM0fkj3rgQ3hrQCscOrZCE7prTFyJdtoA0B3BflgFVQrBnT
         rqug==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530GqjXWgO5CGBwpmx+Rb5pME9ZEsEH1/KTbaw3iD0diD+Ia+sXV
	WcAvhn0FBl202bhkAV9hc4Y=
X-Google-Smtp-Source: ABdhPJzqO+hyJw1+JV76If8GCo28RbYZROixWt6Afm0dErsYz/P2ZtykuiIvmznqiglVaEU8NETGjA==
X-Received: by 2002:a05:651c:169c:: with SMTP id bd28mr35537580ljb.186.1638798083853;
        Mon, 06 Dec 2021 05:41:23 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:651c:b1f:: with SMTP id b31ls2584932ljr.0.gmail; Mon, 06
 Dec 2021 05:41:22 -0800 (PST)
X-Received: by 2002:a2e:8892:: with SMTP id k18mr35292016lji.288.1638798082541;
        Mon, 06 Dec 2021 05:41:22 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1638798082; cv=pass;
        d=google.com; s=arc-20160816;
        b=uqv4xuqfpV742gJa+l55ckzCO/KuD/Vk+Czh0srXLnimVAEqupbHYiS87uxZolXmeE
         cYPQf9oyIAryvsGBevCmNmIA8oQJZGIQ68xiQ2WBrbrdZqE9f193Bl84E94W8EaAN1S6
         yqCjlWfObwPKpRRPSTUgghUigS3oFWkQusXJE4+yixhIbVIhVdwlBlQst+biLbcDsbxi
         UfkPS2Eu5vEQUI8ejsWp7Im7dThpbGPex2SupJBHVdvx0SboWSFglLUEGFNrCHeD/yP+
         aV7NoBoEGKmMvZiuhVIaDZP/eQgmZpKtgxSzFrmy02JAJY5qtfD3oZbNDmwdFglk5yVb
         JXIQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=e8NeOW6VJbNJX79750ARyBDBiiIqEHVvejD4DUQMGRY=;
        b=gapLm3P75v5HI7/BLzoAbfbGWshKa3hl8px6DWfmEptANqcNIV42D0Ltt2bl5V0zNp
         KRfaoUseDkX3aj7XNlXzgR0GhI/4pQRtLBEgyIUOMQkvPeVZwz8ULGoHowwEn7lULCd5
         7R1cTTr3XQ8ZrB+dhAT3TOwbQgiP9XvshVOwmbSxdvJ2HNuta6pAEnpR2JWJTU8BEJv3
         eZgyv3QDOj77gaw/Dt3eOHraOsojdUC40ZxTOp1p2iT3RBkAD2pa93x/+xbg92NKVsdq
         LcfF4iJszIQ3QgjglKPs8rJOJun/48RWwNNrj/yzRkHNQQa/XKHljpBfnn2JJIEHF5c1
         wrwQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@siemens.com header.s=selector2 header.b="sFg4K/Ox";
       arc=pass (i=1 spf=pass spfdomain=siemens.com dmarc=pass fromdomain=siemens.com);
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 2a01:111:f400:fe07::612 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from EUR02-AM5-obe.outbound.protection.outlook.com (mail-am5eur02on0612.outbound.protection.outlook.com. [2a01:111:f400:fe07::612])
        by gmr-mx.google.com with ESMTPS id e18si610507lji.3.2021.12.06.05.41.22
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 06 Dec 2021 05:41:22 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 2a01:111:f400:fe07::612 as permitted sender) client-ip=2a01:111:f400:fe07::612;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hIDs5K8WPbfq49/eUb83Mq64N+k5eYNyqHL9xuLPc/gdYIdTQG8/ixcgVLM94jtBdiX+40931Vq6mjCaZkBMPbNjKO6BdAeb994FprsK4hZQ8agMEm5L6gracZ+wEqlIO1nxy+z2jPP/0NKrJ6pWmz3/zOwjyGJPhwuduia2gan/cSluvyGAE67lyw/PfPOj48xGWeeqWOf28rgciFQxD3JaPGXZzB4dfKMp3BRpvP3rKlFkKChOVDM5FpPo8WAxsPbHs1SSYDfQx4LQ75+pA4jZxGMsKhzg5b7HBQWh7luF4mmK12hv9eyNR7Sb6b0myr6p7m6SUbAeEx/4l3rPzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e8NeOW6VJbNJX79750ARyBDBiiIqEHVvejD4DUQMGRY=;
 b=YQBkt2+OaPJzi31TPXIGvOjEywcbXk9nZUpLvTAehFDmcmyNE3NHLPmHMpfVGNEZTB6QKvGaPW9R55ZEDGKXTbkeyJPORhqyXaD9hpUPl9H49E2Oih7M6i27AZsdMu6jXQq1zyZvtbDREAH7Z7ffgRI3NksHkZKc2EP4P8Oirm9HAbZ3iOxw6hAxH9ZB5cotGLGkToJfNm4+/2s0fz2JmKAiMNNrY3SZng2IpxMp+9HIMRuQRrCeJQqCn42cc+AcTIV2EhnzIzjHu++ESIuLokmNOj0hs6kM+GLPuOCbZshihdXlSo22QRKTTvhrCkJCfbMHEvGoywLC41uxp5ZlOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 194.138.21.73) smtp.rcpttodomain=binary-kitchen.de smtp.mailfrom=siemens.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=siemens.com;
 dkim=none (message not signed); arc=none
Received: from OL1P279CA0039.NORP279.PROD.OUTLOOK.COM (2603:10a6:e10:14::8) by
 AM0PR10MB3505.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:15a::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4755.11; Mon, 6 Dec 2021 13:41:19 +0000
Received: from HE1EUR01FT045.eop-EUR01.prod.protection.outlook.com
 (2603:10a6:e10:14:cafe::b3) by OL1P279CA0039.outlook.office365.com
 (2603:10a6:e10:14::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.16 via Frontend
 Transport; Mon, 6 Dec 2021 13:41:19 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 194.138.21.73)
 smtp.mailfrom=siemens.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=siemens.com;
Received-SPF: Pass (protection.outlook.com: domain of siemens.com designates
 194.138.21.73 as permitted sender) receiver=protection.outlook.com;
 client-ip=194.138.21.73; helo=hybrid.siemens.com;
Received: from hybrid.siemens.com (194.138.21.73) by
 HE1EUR01FT045.mail.protection.outlook.com (10.152.0.239) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4755.13 via Frontend Transport; Mon, 6 Dec 2021 13:41:19 +0000
Received: from DEMCHDC8A0A.ad011.siemens.net (139.25.226.106) by
 DEMCHDC9SNA.ad011.siemens.net (194.138.21.73) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Mon, 6 Dec 2021 14:41:18 +0100
Received: from [139.25.68.37] (139.25.68.37) by DEMCHDC8A0A.ad011.siemens.net
 (139.25.226.106) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Mon, 6 Dec
 2021 14:41:18 +0100
Subject: Re: [PATCH v2] configs: x86: qemu: Add an extra variant for AMD
To: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>, Jailhouse
	<jailhouse-dev@googlegroups.com>
CC: <meep@binary-kitchen.de>
References: <20211206133404.155078-1-ralf.ramsauer@oth-regensburg.de>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <c18c7102-1368-7a84-9ebe-a1cc730e85c6@siemens.com>
Date: Mon, 6 Dec 2021 14:41:18 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211206133404.155078-1-ralf.ramsauer@oth-regensburg.de>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
X-Originating-IP: [139.25.68.37]
X-ClientProxiedBy: DEMCHDC8A1A.ad011.siemens.net (139.25.226.107) To
 DEMCHDC8A0A.ad011.siemens.net (139.25.226.106)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3526685a-5a8a-4151-6085-08d9b8be157d
X-MS-TrafficTypeDiagnostic: AM0PR10MB3505:EE_
X-Microsoft-Antispam-PRVS: <AM0PR10MB3505BBDC21EFB81CB1B64692956D9@AM0PR10MB3505.EURPRD10.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: L16vxfL2aOMZkjUPQ0EuxdeJR60RqxbYg2sggIDhF/V0/yxYV5zhfbjL832KfJ6ZwprJASFJxkTmQp5N7OwR+4Xf1uvTI2v50Y0R9fX1Ie0vimgf2nv23PqPbN44JM3TZi8/zwMYmsKCRUmt00W8l1VNKzzwQKv52VA1SaQmPGiIZ8+z+7IULH5FbEJ8OvTsRhvjzvv5ZhO7ljH3F67vXGN+GikYjoo/WAFkDVsa5feHArn9/4/QE3Jr8QVW+8GH7WiQptqbCj5cH7z+pUMBQMmSJsS45rbkAnkTMh58o3LEGptmF165fuCkSgJi/ypT5RXnqUoAakcFcy3Xr6WL8wTYtAkuAzvTH+2kXqt+NB1jnRQ9vuAlEk4Y2VjCZzMeWe98wwnOU7sQHTKLsQqtRiwclPg3VL9K40pJFhrjnkHMJpkhZM10hp4l//5gyURyrwPIBBmjOVlHKGltwxC74ufy18DIa/d58X3t0CuROEJvs7Cwiu7T7492Pi6AFAr0z2jUpa2BQd1ncDWcMwETclBn4fKlqSU/PllZzz2f3f3LwDaF1H5bSbJpw67jgMhTChGRDMwaeo+n/QEe06/sZRcybphwnrBdNAkDVAZvSMuJbPP4/BALC85SZAtx+truawhR+URA928RiBoxHg5DwS32S6BvYlCVqafHZEWKc0uFgMJD7U8eoRTR5ODcjhOaRV/boY4eJ/j3baJpDEIqRanHOW9iEgBwMWD3yf6y1oyvva8uz8EkD233EY8BX731gdH7Yuz2sDhpDO2qIntj7Tq9R+IjOgUB5b2pbEaG0g9lHo1PRjHAwpX4TKD1TjIuVTUwF0D3U6vtcR6MzPBX/FdjEwDz0HLAY1Uk9IoAdkk=
X-Forefront-Antispam-Report: CIP:194.138.21.73;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:hybrid.siemens.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(40470700001)(4326008)(86362001)(31696002)(956004)(6706004)(36860700001)(2616005)(356005)(110136005)(16576012)(2906002)(316002)(81166007)(8676002)(47076005)(82960400001)(8936002)(70206006)(186003)(16526019)(31686004)(83380400001)(508600001)(40460700001)(336012)(26005)(53546011)(82310400004)(5660300002)(36756003)(44832011)(70586007)(3940600001)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Dec 2021 13:41:19.2533
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3526685a-5a8a-4151-6085-08d9b8be157d
X-MS-Exchange-CrossTenant-Id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;Ip=[194.138.21.73];Helo=[hybrid.siemens.com]
X-MS-Exchange-CrossTenant-AuthSource: HE1EUR01FT045.eop-EUR01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR10MB3505
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@siemens.com header.s=selector2 header.b="sFg4K/Ox";       arc=pass
 (i=1 spf=pass spfdomain=siemens.com dmarc=pass fromdomain=siemens.com);
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates
 2a01:111:f400:fe07::612 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
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

On 06.12.21 14:34, Ralf Ramsauer wrote:
> If we want to use the qemu-x86.c on AMD platforms, we must not define
> Intel IOMMU units. Build an extra variant for AMD platforms.
> 
> Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
> ---
>  README.md              |  8 ++++++--
>  configs/Makefile       | 11 +++++++++++
>  configs/x86/qemu-x86.c |  2 ++
>  3 files changed, 19 insertions(+), 2 deletions(-)
> 
> diff --git a/README.md b/README.md
> index f1b0cbe3..ac457119 100644
> --- a/README.md
> +++ b/README.md
> @@ -288,11 +288,15 @@ installation steps.
>  The Jailhouse QEMU cell config will block use of the serial port by the guest
>  OS, so make sure that the guest kernel command line does NOT have its console
>  set to log to the serial port (ie remove any 'console=ttyS0' arguments from the
> -grub config). Reboot the guest and load jailhouse.ko. Then enable Jailhouse
> -like this:
> +grub config). Reboot the guest and load jailhouse.ko. On Intel x86 platforms,
> +enable Jailhouse like this:
>  
>      jailhouse enable /path/to/qemu-x86.cell
>  
> +On AMD platforms, use:
> +
> +    jailhouse enable /path/to/qemu-x86-amd.cell
> +
>  Next you can create a cell with a demonstration application as follows:
>  
>      jailhouse cell create /path/to/apic-demo.cell
> diff --git a/configs/Makefile b/configs/Makefile
> index 327043b7..5af0647a 100644
> --- a/configs/Makefile
> +++ b/configs/Makefile
> @@ -28,6 +28,17 @@ OBJCOPYFLAGS := -O binary --remove-section=.note.gnu.property
>  CONFIGS = $(shell cd $(src); ls $(SRCARCH)/*.c)
>  
>  always-y := $(CONFIGS:.c=.cell)
> +ifeq ($(SRCARCH),x86)
> +	always-y += x86/qemu-x86-amd.cell
> +	targets += x86/qemu-x86-amd.o
> +endif
> +
> +$(obj)/x86/qemu-x86-amd.cell: $(obj)/x86/qemu-x86-amd.o
> +
> +$(obj)/x86/qemu-x86-amd.o: $(obj)/x86/qemu-x86.c FORCE
> +	$(call if_changed,cc_o_c)
> +
> +CFLAGS_x86/qemu-x86-amd.o += -D__IS_AMD
>  
>  targets += $(CONFIGS:.c=.o) $(CONFIGS:.c=.cell)
>  
> diff --git a/configs/x86/qemu-x86.c b/configs/x86/qemu-x86.c
> index 9ca5c528..3f8f673b 100644
> --- a/configs/x86/qemu-x86.c
> +++ b/configs/x86/qemu-x86.c
> @@ -45,6 +45,7 @@ struct {
>  		.platform_info = {
>  			.pci_mmconfig_base = 0xb0000000,
>  			.pci_mmconfig_end_bus = 0xff,
> +#ifndef __IS_AMD
>  			.iommu_units = {
>  				{
>  					.type = JAILHOUSE_IOMMU_INTEL,
> @@ -52,6 +53,7 @@ struct {
>  					.size = 0x1000,
>  				},
>  			},
> +#endif /* !__IS_AMD */

Nope, please not. Rather enable the AMD IOMMU in a separate AMD config
(common inclusion would be fine). Will require some tuning of the QEMU
command line, and we may also have to think about what to do with SMI
blocking which is demanded by Jailhouse but not emulated by QEMU. The
rest is supposed to work, though.

Jan

>  			.x86 = {
>  				.pm_timer_address = 0x608,
>  				.vtd_interrupt_limit = 256,
> 

-- 
Siemens AG, T RDA IOT
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/c18c7102-1368-7a84-9ebe-a1cc730e85c6%40siemens.com.
