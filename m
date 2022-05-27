Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBUVYYGKAMGQELLUU6GI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x237.google.com (mail-lj1-x237.google.com [IPv6:2a00:1450:4864:20::237])
	by mail.lfdr.de (Postfix) with ESMTPS id E910A5358A1
	for <lists+jailhouse-dev@lfdr.de>; Fri, 27 May 2022 07:06:27 +0200 (CEST)
Received: by mail-lj1-x237.google.com with SMTP id f10-20020a2e9e8a000000b00250925fec6asf1014019ljk.20
        for <lists+jailhouse-dev@lfdr.de>; Thu, 26 May 2022 22:06:27 -0700 (PDT)
ARC-Seal: i=3; a=rsa-sha256; t=1653627987; cv=pass;
        d=google.com; s=arc-20160816;
        b=sGYMEkrVhwsVadtNRQfh3xPRCusz+vukARqb9t0YVyQQ37IfTQrfEAY+fWTr6SBfqX
         vuAmODJuYMaL9ARIDQ1drs5E2t80j5/P+D8KrqIiBs1rGxStKw08mVmfgVjOMtfFfNLM
         JXFFrDT9QbpvOoLOX+PLP35KlYD5N52dw6W6hYg7rux7NW5GgWt23g5LRL0dZeZMKnOe
         QbSW07LBvWy0IVfLhXKBFVF5H7JdQ2Vxddqf2bQ8kqmBFll2/v/+rMyyNwjCaRQtmdEh
         6NDf9rQ/m6vKPik1lWM9wgVzObbUgRkqw5AeJTouxpnu1nY3RhpcpSxnjHsupyG3koe0
         Rc8g==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:dkim-signature;
        bh=8aCeQ/WXnKNrnumLWou0o58p7WKeXSDh8NLW5gCWvYQ=;
        b=lZBns0zj8nzAUy78tPdn1gd9O15bnzYxB3PpXBS3qAZOx/yDvZy+S0Mmr591X7Hxb2
         SH2hILMVajpFzCFAnxLOKa3gz1jIwvHlkY4fzRUUEh8235tFZ49ztU6qkMRNr8TV4s//
         dVdwP10wlvvHEFpBPbRV82tAn29t2W20s69l/qesV32DJBOCnCDTqtjSw3ggFFdnYUNm
         1VVR5FNrxQzeowYZAk5mt/NnHuG36/+Dj5Jl+HDJDvb9m3MfbQu6+gDeJZzwFtZJodY3
         P8u9ymB84F4KIgqLtPvDAvcMDY7VuATKqFx98E/BkkMpvWFnNDQ1fSJ89WNLW83ls3S+
         lQgw==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@siemens.com header.s=selector2 header.b=fMJhc7kt;
       arc=pass (i=1 spf=pass spfdomain=siemens.com dmarc=pass fromdomain=siemens.com);
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 2a01:111:f400:fe07::623 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=8aCeQ/WXnKNrnumLWou0o58p7WKeXSDh8NLW5gCWvYQ=;
        b=JHI+v1iY+JqS/fTuATGEj8BxUYftK1R0A2gf4nnufIdj8q5Ts/+JsVXmyHae/1IdC+
         sCM6YViPaEbXcXXcrPaAnsytGHwh8XX3oS4ffk7Ce6v675pmlb3n2mKrfWzSIqR5X/y4
         KiGNpcTVvYwZiDc72je9BOJ7kKtDzcsVytcD8aHraAn4feWJX8Dk38re9tyqdRn48Qd7
         +5Kv5yW+pEVzRZyAd+T/RTUISlBKNODuRmrOI+2X8hV8XfFKR6pErEZH7Dre96PulOUK
         zgV1XzjMf8JR/vEgvwWwZCy82E5JsiMK8c0ryXSDMXGz2ERukQ2ym6K7cd2s5/32SOle
         LWsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:message-id:date:mime-version:user-agent
         :subject:content-language:to:cc:references:from:in-reply-to
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=8aCeQ/WXnKNrnumLWou0o58p7WKeXSDh8NLW5gCWvYQ=;
        b=u0Ue13CX7LojQizhN1O8WayMVGBQnrcQe68KNLgt4que6yoslxGFGZ3RZfRgg4j9Ga
         s8d/7U0CSX5dkF4nMx4ntbBGOhvhMniGbzH/VWGRQQQLwfMHVD8mGnF1IjMosWEuWx2B
         5CdvuqqVwgYY81Q6DgYHakt/75brevm51l7y3/GyXcimKZoBPXJ5Wd65iMJkPHlyScaJ
         WKoVQZfd4G44EEUoVYsem8HLTr4WnJ5oIPpyTUc/osEGOQLH/QkgQhbX3tbKB2bo9B9/
         KgWsRont+Xwd2klQQ4xQisHUlWIIAIr1qH3PQUs9irBiW/TyBTlrfYV6Bqjk18zRDes7
         5yhA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531zWwb5GqkVcc5RWWUdCqLMc99xkcbyqJ9WEbWDytA39q1/k18c
	jtctrTA/Xdi4aQkVSxUFzKg=
X-Google-Smtp-Source: ABdhPJw4vv/JyebghGXe8ZkpLaOjoywobyA6GODgo74PIuVMIQzbDbFlW+W4mj/ezq3gNX0/72YOHw==
X-Received: by 2002:a19:4343:0:b0:474:d7a:634d with SMTP id m3-20020a194343000000b004740d7a634dmr28938053lfj.168.1653627987121;
        Thu, 26 May 2022 22:06:27 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:651c:b26:b0:253:eed2:23fd with SMTP id
 b38-20020a05651c0b2600b00253eed223fdls2628260ljr.2.gmail; Thu, 26 May 2022
 22:06:25 -0700 (PDT)
X-Received: by 2002:a2e:7212:0:b0:253:daf1:301a with SMTP id n18-20020a2e7212000000b00253daf1301amr21510371ljc.386.1653627985184;
        Thu, 26 May 2022 22:06:25 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1653627985; cv=pass;
        d=google.com; s=arc-20160816;
        b=Xpd2Wi7LMzvkQXFwePYn1nt0uKVm/OFMhJDTuQmB2vS2WYTqfRl4rwsg6jR1ZFfzQ8
         RQsY0TUJSgIZWPFDk6C8cpmjBGixp/9jVRSMZ2Yy0WgCkp6N/hlNJkJk/O09oTz65B6w
         oyRVDZpPLhTD7gKfdzqL5GOI9Ke+BF/9DiO0oSLHOS6/aEVLyI88EPAOTqiIBnNhFlWx
         rDHHOScEnHpX0Hjnu2ueTCRL5ACCGSHCCjiINFMufpLSp1WTmvM7lGhp86lnvENBGCup
         24jPwTyOogfE8ChOCLM08mTCvwCafRlcbFZnPOOtnwpzJ7BVIto4XRw088+EUi54v187
         Nxjw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=tSNzoCud8uUqxewTr9BG78RRUpWobJsdGyOodCZSJzc=;
        b=yhz2maYWHKmu0SrWmCNLOvkVTViPPJJJnBvDdoMqtbet2YtfTLgfr+N2O/MVUn6016
         MG8ZZ2FGwMUDMY3IGAIDM4LucUgUJeJEviPNEOpGbZVHp9DSB2UjvbMNSwoNpWA8mLIA
         1nwJZ4WN1x3qnBpgPB+ulP3ADGzAXXBC1yv4GhesTHaAJyFl9GKWx/ADmwYeuajQwueQ
         AqwMcblZZ6gWKZtWSykz1UDNrc8b5hg64dJOwFGROqlCze1lVUVifDsY7xFV2NRBEHNb
         i3KUYGjiJTgC9LVc5nS+mA/54iKAACaK8Molqbad1YV4+HQcGqHGaAQPYYbinvcp+vCO
         oMAg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@siemens.com header.s=selector2 header.b=fMJhc7kt;
       arc=pass (i=1 spf=pass spfdomain=siemens.com dmarc=pass fromdomain=siemens.com);
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 2a01:111:f400:fe07::623 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from EUR02-AM5-obe.outbound.protection.outlook.com (mail-am5eur02on0623.outbound.protection.outlook.com. [2a01:111:f400:fe07::623])
        by gmr-mx.google.com with ESMTPS id c14-20020a056512074e00b00471902f5be2si142513lfs.3.2022.05.26.22.06.24
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 26 May 2022 22:06:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 2a01:111:f400:fe07::623 as permitted sender) client-ip=2a01:111:f400:fe07::623;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g6MBP7Q0IDyTPbpj2FHhwjio2YXCUVZrrQ1n8jUmcDcyNLEx/jAfLvATluB+mgVpB9w1gon4e30LnEd2bjDt3aao+WXcZqaUpOfE/ujYm0+XBVtmPzFQJeLugJ53s1DRuJwVFZSGccaOHqWswnYJZ70+AfHNnFJmyNmy06vSBAHslJStB08rJws9xTHd4mrUncPYyeTsZISuDhJ/Arq5hQnmgFoo+WtoLPGTJBCWuThxLN3VCg75WlNVtaaQD+wLGr3a9vjgBZtg8vqUPFgcznT1ZBDVMC6/+7kN1KaukR9Ve7HYY5D//1IhqzWQ0KCXDBvKiIhYbvKEuU4Ysni6kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tSNzoCud8uUqxewTr9BG78RRUpWobJsdGyOodCZSJzc=;
 b=SY5HvtVjuOTIH/95AELbNQesCRq6gaQrpNEilW1Looecz6hsU+1vr+0KmtWnInB+srs0pULM5tDOjCHDQbnaKNGybCyd7u5VdO4ByDxpOCQnWDDgdpVNPvpriSSqL3fGDsoIdG02Ox2ocsNVQFebENPtGeYtaSxEPM/bn1/7O5ksR+HiM6EjmEfgMujKpY8SatEg18Efz8UhmVl6P2dgtKelzP8QQxub+/SwQ+jM9IyiWoQQ069Pwzd0jphyrWV+65SWU/Mh9wAZHt7IXc00Bgay0wrK0KFhn9Pxd9vbXd9vi62wdUN4zTEIgWXw+8fyd7nXdAApMuLRc6nhSu+k3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 194.138.21.72) smtp.rcpttodomain=ti.com smtp.mailfrom=siemens.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=siemens.com; dkim=none
 (message not signed); arc=none
Received: from FR3P281CA0007.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:1d::6) by
 DB8PR10MB3433.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:e3::24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5273.19; Fri, 27 May 2022 05:06:23 +0000
Received: from VE1EUR01FT035.eop-EUR01.prod.protection.outlook.com
 (2603:10a6:d10:1d:cafe::77) by FR3P281CA0007.outlook.office365.com
 (2603:10a6:d10:1d::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.6 via Frontend
 Transport; Fri, 27 May 2022 05:06:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 194.138.21.72)
 smtp.mailfrom=siemens.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=siemens.com;
Received-SPF: Pass (protection.outlook.com: domain of siemens.com designates
 194.138.21.72 as permitted sender) receiver=protection.outlook.com;
 client-ip=194.138.21.72; helo=hybrid.siemens.com; pr=C
Received: from hybrid.siemens.com (194.138.21.72) by
 VE1EUR01FT035.mail.protection.outlook.com (10.152.2.236) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5293.13 via Frontend Transport; Fri, 27 May 2022 05:06:22 +0000
Received: from DEMCHDC89XA.ad011.siemens.net (139.25.226.103) by
 DEMCHDC9SMA.ad011.siemens.net (194.138.21.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.9; Fri, 27 May 2022 07:06:22 +0200
Received: from [139.22.142.41] (139.22.142.41) by
 DEMCHDC89XA.ad011.siemens.net (139.25.226.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.24; Fri, 27 May 2022 07:06:21 +0200
Message-ID: <9351380d-60cf-f97b-ed17-54f3bdb44d64@siemens.com>
Date: Fri, 27 May 2022 07:06:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH] configs: arm64: k3-am625-sk: fix UART reference comments
Content-Language: en-US
To: Matt Ranostay <mranostay@ti.com>
CC: <jailhouse-dev@googlegroups.com>
References: <20220526192847.77340-1-mranostay@ti.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
In-Reply-To: <20220526192847.77340-1-mranostay@ti.com>
Content-Type: text/plain; charset="UTF-8"
X-Originating-IP: [139.22.142.41]
X-ClientProxiedBy: DEMCHDC8A0A.ad011.siemens.net (139.25.226.106) To
 DEMCHDC89XA.ad011.siemens.net (139.25.226.103)
X-TM-AS-Product-Ver: SMEX-14.0.0.3080-8.6.1018-26680.007
X-TM-AS-Result: No-10--17.562300-8.000000
X-TMASE-MatchedRID: 3OnHKS+pL/Q5QaOxwNGfvo9bHfxDWoibvE0Zd97DR2aFTLRMAFrHXOvG
	seyykgyEY4zJvUjGrxVyKMxmuvaJna3aC25avUuae0bKGi4Iljq58YsbEkjqIukpglpnF5UNf3P
	Pz7C7ukZhR1Y/uhfqyNkurgZsDfqe/ylbX2Ykg6beAMGbXnKiNwQBdUgWg+akjrVn4cme+w4ujM
	j6uE1hubbMVaqtU3gFXjesFOd0pM7i8zVgXoAltkWL4rBlm20vBLPx9cDMrKax5amWK2anSPoLR
	4+zsDTt+Tf0tcxKuLoOVs4Rmv7zifH/mx44gqXSjR38FD9guDa7PPIBCGr7pw==
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--17.562300-8.000000
X-TMASE-Version: SMEX-14.0.0.3080-8.6.1018-26680.007
X-TM-SNTS-SMTP: 57C87EFF27781E509CDAD84F7440CEEFA033EED42260EAFF2B50F89274CA94BB2000:8
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ce86d9f1-bf1a-4b5b-442b-08da3f9ea495
X-MS-TrafficTypeDiagnostic: DB8PR10MB3433:EE_
X-Microsoft-Antispam-PRVS: <DB8PR10MB3433EDC9EA7CF24018322E5195D89@DB8PR10MB3433.EURPRD10.PROD.OUTLOOK.COM>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: v0ak8pcVEzWxGMCcbvyjWQR4r5PJy9O0koRIr7PpAYgGD+0XNp8UFH+SmdKqi+sY3OXctCp3wQuHkGDDg5DTMnQkBi1r9+/AIlAXYgwDSPKHRM69jo4IafFbSNv9rgcmVj1l4pumfzFDyWjDFI1P3LPLF9ogeFdxBHxeIQhE6RHFmGzeTh+9xkj51+4CrpMBVlo9V1GHgUbwbvmKuqJMSmwpwap6EIFCfCvU+3Z5m1MHwSFEPnJykwSDMMC7dn5AZDwJJrYlCf0DSVpy/S+GKwrxnHR5y3GSGJabkkn1DVWbQq7z0P+wDQtBqadv2H9VL8JV5Jd5x+q2E9vCpV5GPm6ykh/+6zobSE4SJcGyI7/Fd384m1dIbypmVwvLtl8JgEtQwW29PFF6tnvxoj0X932JBnxEn+IBC/8whQXAmPz0SsbN5ksFw5hiV98Avjdwjfg4tCwtYKZ53SKE1A8c2G2017UVd4T37OpHhAWc2Y3kVkX/A/odsZo0kl+qj5qxU/pV1fEQ31NgHj6joruI9NoxDtY2Qro8rXJHZ9J5uqgVRq34WQqPdblvE1bQ/FN/wwaRk1iAJcBsYZSd8eixKNK0u1H0sQJzS0HFH67EVuqLUL7AUbwqpYZgSGUKjPcQR+GSwtqAASSMStbwSqkzUffbxdERQh1C6JBGi937wnQu9/F3bw391NEebRCrpVRzj1pSPhM532mJ1AVAEHVCcxuN1X4X2DvRCmmlUIVQSrQb4CsA5Upqy94JevbMur11KxK4Z34M1qQYHJMuUBsq6P+TqzcDmeXfawnUXEhz2V0wjkJk7JN5sFoACnklpZxYEpB8Wor5CsDvspcMYys6UrFMntw/3jHGaJ22EJsIor0=
X-Forefront-Antispam-Report: CIP:194.138.21.72;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:hybrid.siemens.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230001)(4636009)(46966006)(36840700001)(40470700004)(6916009)(8936002)(31686004)(26005)(316002)(956004)(2616005)(16576012)(36860700001)(5660300002)(40460700003)(83380400001)(70206006)(8676002)(4326008)(31696002)(70586007)(336012)(86362001)(6706004)(16526019)(47076005)(44832011)(186003)(82310400005)(36756003)(82960400001)(508600001)(966005)(356005)(53546011)(81166007)(2906002)(3940600001)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2022 05:06:22.4506
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ce86d9f1-bf1a-4b5b-442b-08da3f9ea495
X-MS-Exchange-CrossTenant-Id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;Ip=[194.138.21.72];Helo=[hybrid.siemens.com]
X-MS-Exchange-CrossTenant-AuthSource: VE1EUR01FT035.eop-EUR01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR10MB3433
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@siemens.com header.s=selector2 header.b=fMJhc7kt;       arc=pass
 (i=1 spf=pass spfdomain=siemens.com dmarc=pass fromdomain=siemens.com);
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates
 2a01:111:f400:fe07::623 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
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

On 26.05.22 21:28, 'Matt Ranostay' via Jailhouse wrote:
> Fixed incorrect comments that referenced the UART as connected to MCU.
> 
> Signed-off-by: Matt Ranostay <mranostay@ti.com>
> ---
>  configs/arm64/k3-am625-sk-inmate-demo.c | 4 ++--
>  configs/arm64/k3-am625-sk-linux-demo.c  | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/configs/arm64/k3-am625-sk-inmate-demo.c b/configs/arm64/k3-am625-sk-inmate-demo.c
> index 65cf4a7f..49edd62d 100644
> --- a/configs/arm64/k3-am625-sk-inmate-demo.c
> +++ b/configs/arm64/k3-am625-sk-inmate-demo.c
> @@ -2,7 +2,7 @@
>   * Jailhouse, a Linux-based partitioning hypervisor
>   *
>   * Configuration for demo inmate on K3 based platforms.
> - * 1CPU, 64K RAM, 1 serial port(MCU UART 0).
> + * 1CPU, 64K RAM, 1 serial port(MAIN UART 1).
>   *
>   * Copyright (c) 2019, 2022 Texas Instruments Incorporated - http://www.ti.com/
>   *
> @@ -48,7 +48,7 @@ struct {
>  	},
>  
>  	.mem_regions = {
> -		/* MCU UART0 */ {
> +		/* MAIN UART1 */ {
>  			.phys_start = 0x02810000,
>  			.virt_start = 0x02810000,
>  			.size = 0x10000,
> diff --git a/configs/arm64/k3-am625-sk-linux-demo.c b/configs/arm64/k3-am625-sk-linux-demo.c
> index 81f4e880..a3385efc 100644
> --- a/configs/arm64/k3-am625-sk-linux-demo.c
> +++ b/configs/arm64/k3-am625-sk-linux-demo.c
> @@ -105,7 +105,7 @@ struct {
>  				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA |
>  				JAILHOUSE_MEM_LOADABLE,
>  		},
> -		/* MCU UART0 */ {
> +		/* MAIN UART1 */ {
>  			.phys_start = 0x02810000,
>  			.virt_start = 0x02810000,
>  			.size = 0x10000,

thanks, applied.

Jan

-- 
Siemens AG, Technology
Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/9351380d-60cf-f97b-ed17-54f3bdb44d64%40siemens.com.
