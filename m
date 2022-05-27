Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBB55YYGKAMGQENANHHCI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x238.google.com (mail-lj1-x238.google.com [IPv6:2a00:1450:4864:20::238])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DC975358A2
	for <lists+jailhouse-dev@lfdr.de>; Fri, 27 May 2022 07:07:04 +0200 (CEST)
Received: by mail-lj1-x238.google.com with SMTP id f10-20020a2e9e8a000000b00250925fec6asf1014148ljk.20
        for <lists+jailhouse-dev@lfdr.de>; Thu, 26 May 2022 22:07:04 -0700 (PDT)
ARC-Seal: i=3; a=rsa-sha256; t=1653628024; cv=pass;
        d=google.com; s=arc-20160816;
        b=cT4uCT+yqdqaAmsdMDMu1EpBtGJjXXekwxprf+sduScpNePRcgWMuWQvZ24O/8xsnu
         fsGYnd4vNCVII6pFLFUjhW86WPX29XXk9ROXvRTFQleKGRCYrMpfyBHrDGs3qg87hIFv
         6aebe2KTTLtUz5BkWvQTpzOWoHJ9/5Sw2U4FQh4X356iA+We7Qw8/BpaY9wag1qWOqkA
         WQ5yDyURNe9q1nxMjIoIe4g8FsW6wvdGQpG6gPlxsprWRiTBDPShUsHMiknaVG7v1E3E
         Ga03sn10OEUbv5mv1Mm1DrtIK/MkmJG4+a5Kfi2Tj67BRGbNbGLFhahBu27f/uPhghXW
         WBjA==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:dkim-signature;
        bh=aQdeKfjvoPKu50/k0oy++mjApm124LCNVDgND92Bp8U=;
        b=Psrib1dp+bCFX/1TcVEU1uXTisfWgm9R0+x4v8I+t9lN+4jX24Ul7XJig+GaPghsEs
         tCtbFEdq7f28PjBZHrycB77IqsUabRffNMRodl/631h0TYs4WBnjDTMhoqeLRJEjfizJ
         0iE9muQoPSEsiOeaL931iqHYSyw10Qu5ytmWUbNTAbU7ri0TcVGCInbD2q12RzxbCMzd
         Uo9hieF7i/hJDL41EmBuG8w5UtTetHk2NADdn9x11EUjP5CgmRMYeQZxlq+7A5r4txep
         MYJfLWSr0B/eW7hYxkK/q20jlmG9mFgTBRHRpJRAVSewCuaJQgzRQnL9UEYiR+kX8ih2
         0B0Q==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@siemens.com header.s=selector2 header.b=FnBm93cW;
       arc=pass (i=1 spf=pass spfdomain=siemens.com dmarc=pass fromdomain=siemens.com);
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 2a01:111:f400:fe08::623 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=aQdeKfjvoPKu50/k0oy++mjApm124LCNVDgND92Bp8U=;
        b=ULRHmVw+sNLz+MgqMa46fdxZOLeW9unAn7udcPL40KhqQEbs4mJsx/D4O4ee45tnRO
         iLtEefnBz+7Aa0xbYnprcIiw31im0BjisFVmYJP8ijgVl0e+UPG07vkdjUIt0ZQtDaXl
         53XHufjf8f/wCkzU9I7ZVEgDLfOBzJLKrZ20EGKkxN02EtoSbiQm6blMn1OvwNUYxHRC
         7P/oaOU1mNrH1UGHZTEXBIMqeT28EX4mUqcTVKX13HEKMhI3J9z+pznJdj5W+8qKIRfu
         RwXGwajHIVddmFBjqmaS5Oi5oGYvXEPi6vI/G6Yw9zFkWOzGXaq47Bum0nZjjYs1+Kbw
         2sjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:message-id:date:mime-version:user-agent
         :subject:content-language:to:cc:references:from:in-reply-to
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=aQdeKfjvoPKu50/k0oy++mjApm124LCNVDgND92Bp8U=;
        b=4lgFVy6soLn0KardVPIiTg8TwfeWWcyX8bm86Y0kATBq61LH2/uWGdoqIZYCaW9YFB
         3XZRPdkguXPt0MOqjJvLkHc+cZqZM+rLpDTB3LNBC8yVvBXoEuV7hAcSdACp1nWNodZl
         TNIq7UczsxTSV5JXN835Z/l+hCVjS1XyjgkDzvtWw2fw63gnYx25DiR3P+4zEcQ4t973
         rJc3EuUspVQbdv8MI7MvaBWT4Y3HBvU0C3VpSRuYYCMoqxIjmN0mgV6iQr71HtLx8n+c
         ROIYbiRT3ygyOs9NDnuNwVP04K6sKVpql0WT+1/uFSfSxFX5F8AI9KXGQttWf4d7EMZh
         uYTQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM5312U4OzmUWyIXP0R3LJCY01JrcA7S+zLz1pxcRBexUNnywadJ+K
	tQHHlvtcPoae+KaY78X6fHE=
X-Google-Smtp-Source: ABdhPJx05X+IRlLtk+HkJs4uxMiBRla1/2IfU2Nrb0OQy3qGgJgQQr/Xb/lLUcbjrePrUhRIC5/HzA==
X-Received: by 2002:a2e:90cf:0:b0:253:ec29:ad7b with SMTP id o15-20020a2e90cf000000b00253ec29ad7bmr13905154ljg.340.1653628024110;
        Thu, 26 May 2022 22:07:04 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:a590:0:b0:253:ebd4:ca17 with SMTP id m16-20020a2ea590000000b00253ebd4ca17ls2792898ljp.3.gmail;
 Thu, 26 May 2022 22:07:02 -0700 (PDT)
X-Received: by 2002:a05:651c:1502:b0:253:ed7e:5778 with SMTP id e2-20020a05651c150200b00253ed7e5778mr12985577ljf.47.1653628022227;
        Thu, 26 May 2022 22:07:02 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1653628022; cv=pass;
        d=google.com; s=arc-20160816;
        b=a/g0SShbpztGkQIXx47P/xIUimzhyaTb64gbEcJz+js26xkfQg5Pf3DzLmN1pDV310
         PGNvgh4gUeb/Kd1hHbVti78CNUhNzfCq3eWwDkC1F7EFm9Vq6NFs5d4Wm/NRKQFpXK4e
         ioR9o9skPEmuxMVicXUcFVHA5NQG6LW7rT2tKEz7QIGyoqRsD7OyNtt6ng8RLXCAQGzJ
         RVaX0MLZEpRrBiAHjkPxPKf/d1nLmeU5lmoU0rsmCaPUL+F00yVVsYbDPumyReyDXraZ
         Rfi/zssmf5dsLKE+lz1lieBmhzc48UwC12XcOs2f7v48Iv/TTNHjf+U4myESZ7ciVzV1
         ZYSg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=fZMBNQsgXlvXK4FcqifNgPvN5xcw7T4GoPnEy1/Wrhg=;
        b=eALyMS3mNyrsN12Feg6VC8lc313wXTX+RERglLkbbt4pb2uqNBWBVgDHclqomm/o/+
         9qSIIjSCx1cLeYXhhMtyTmRMQIwq7nOHAk7/hfHNLQKRQY8awXBzCFgRrRlqgtw4XpOd
         5ElxsJ1hDc6yiyXUTxbEbCi1H4AMLWHkZVgEqyJtl5cAMqFKGSLtfs0zDvqo02HmTcLc
         whGMw4vLLvs7Kw7EoyTxXFfx6ewUTmTRVam8+AP/lLqgHQfcN+B6H72Fzp0Dg3Lxabdw
         70YktMcgpkwV2v2czmKX+XnnlptOB5nMBtH2Dn7WZDD1Xp4HyAz+UIxg+SfoV/+kya1d
         Yqig==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@siemens.com header.s=selector2 header.b=FnBm93cW;
       arc=pass (i=1 spf=pass spfdomain=siemens.com dmarc=pass fromdomain=siemens.com);
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 2a01:111:f400:fe08::623 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from EUR03-AM5-obe.outbound.protection.outlook.com (mail-am5eur03on0623.outbound.protection.outlook.com. [2a01:111:f400:fe08::623])
        by gmr-mx.google.com with ESMTPS id q11-20020a056512210b00b00478805f57b5si137484lfr.11.2022.05.26.22.07.01
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 26 May 2022 22:07:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 2a01:111:f400:fe08::623 as permitted sender) client-ip=2a01:111:f400:fe08::623;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ArStNe6c3TOMTkXgJgpNVKSrmS9lIFFjhnq4xfwym1InvF1r7EQkWpUo5OFDyZs8MIYw15wyIlhrZ0AAhBxFQ30gc54xMt6M3H9SiACQqb6Fh0/YyXSuBATOUL83/Puw9SK+67z/A5pGQGFUond2BASkuPLHPhP5IyrrfHWFZNfhPcWLqoUF+erpKbit3SRzBqaYGJIPIc361cyiS0+2Et0AOe17Ie+63AFjYYfRXZ2dxXnm4UZ+jk1ciFQZhrxYA1gJasHjE2mQnLtxWMH51OdbLfsSKzkNZqAOM62iLfRHTo3QisRZgaQCuK2gdvb/H+zlXIJHK7VTS4wJe6q3pQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fZMBNQsgXlvXK4FcqifNgPvN5xcw7T4GoPnEy1/Wrhg=;
 b=hnoAjjnvhBOlCbznHtEVfdUkiTo/B3VWWDGseb7IyZc0tk3r91K5YFvTD3XeGCA3GTyUgE3ankFngmETndCnFTrdus9ZDZzHf+IT0tR57TQ9/EAkWlK9a7OwzEapsTG7v19nwEuQClKlzpkyLOwPo3tXw/dgIX3EuCtTVArFQT4nBQCTkVioJz7loZO7oa84wliLhaE6anY6X3RL+BimJSZOKgm2TOS4gf6a6zuRmhKNA/YEfWEcaeXVJGiyWmi8buKbs7361Yu41Jah6L4h9Mzkvs9U5JK6b222qXBMnCrimRdS9uo2JtCvm05nP1UR4ulMRwHmtYM68DSD4HxdEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 194.138.21.71) smtp.rcpttodomain=gmail.com smtp.mailfrom=siemens.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=siemens.com;
 dkim=none (message not signed); arc=none
Received: from DU2PR04CA0356.eurprd04.prod.outlook.com (2603:10a6:10:2b4::14)
 by VI1PR1001MB1311.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:800:e1::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.16; Fri, 27 May
 2022 05:07:00 +0000
Received: from DB5EUR01FT097.eop-EUR01.prod.protection.outlook.com
 (2603:10a6:10:2b4:cafe::e6) by DU2PR04CA0356.outlook.office365.com
 (2603:10a6:10:2b4::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.15 via Frontend
 Transport; Fri, 27 May 2022 05:07:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 194.138.21.71)
 smtp.mailfrom=siemens.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=siemens.com;
Received-SPF: Pass (protection.outlook.com: domain of siemens.com designates
 194.138.21.71 as permitted sender) receiver=protection.outlook.com;
 client-ip=194.138.21.71; helo=hybrid.siemens.com; pr=C
Received: from hybrid.siemens.com (194.138.21.71) by
 DB5EUR01FT097.mail.protection.outlook.com (10.152.5.142) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5293.13 via Frontend Transport; Fri, 27 May 2022 05:06:59 +0000
Received: from DEMCHDC89XA.ad011.siemens.net (139.25.226.103) by
 DEMCHDC9SKA.ad011.siemens.net (194.138.21.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.9; Fri, 27 May 2022 07:06:58 +0200
Received: from [139.22.142.41] (139.22.142.41) by
 DEMCHDC89XA.ad011.siemens.net (139.25.226.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.24; Fri, 27 May 2022 07:06:57 +0200
Message-ID: <5172e723-49ce-a870-2066-d22f44115da3@siemens.com>
Date: Fri, 27 May 2022 07:06:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: Kernel panic on enabling root cell
Content-Language: en-US
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
CC: Jailhouse <jailhouse-dev@googlegroups.com>
References: <2dcadf3d-1df9-497a-a530-be01a5da96e9n@googlegroups.com>
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
 <eafaaed1-604f-569b-47f5-232b01cfcee5@siemens.com>
 <CA+V-a8vshtRo3Kot2xCVV=L+kySoP1XkOrc3U8tWXxLeCCb4Ow@mail.gmail.com>
 <385f8761-8d70-d0c4-f903-9adadb3c9a90@siemens.com>
 <CA+V-a8uGNUis=XLwewkePUTUDrJp0QBfgkaOMf=8KvPJh4pW_A@mail.gmail.com>
 <CA+V-a8uA+y-p5GmYavLpc6s1O-TJiRGSkpRHM4-dEA=XsqU_mA@mail.gmail.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
In-Reply-To: <CA+V-a8uA+y-p5GmYavLpc6s1O-TJiRGSkpRHM4-dEA=XsqU_mA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Originating-IP: [139.22.142.41]
X-ClientProxiedBy: DEMCHDC89XA.ad011.siemens.net (139.25.226.103) To
 DEMCHDC89XA.ad011.siemens.net (139.25.226.103)
X-TM-AS-Product-Ver: SMEX-14.0.0.3080-8.6.1018-26680.007
X-TM-AS-Result: No-10--21.944700-8.000000
X-TMASE-MatchedRID: BT/GoH6jIcY5QaOxwNGfvo9bHfxDWoibUlQrLabIzZOi0SXROOMWcEEe
	5VjFzwNb+S5C/08hWc2uS0/tEHklZdc7XKOIt77D9at+ROpQ0K/S2CkXfoLSXj8Ckw9b/GFeTJD
	l9FKHbrljjMm9SMavFVwbMdBpRzwcn4+tlp789HmRtvxxSNJ73RqXhvBXA7wbN+75FOVyJeBHAN
	Trr3brvGww+4tkH8hHQPUnSIMN7VvcLUMnDfuntNUW7fqDXv0BlE0VgxbvH2wCg1rav4R3DWDm3
	C/FJwHxXU4B+rpt6K4Yn7Bx83pZc4uAWOXddgObq4JZA278nkHdNfZjGlCTo0+zv2ByYSDQoSs2
	20phCBeymFjUCnviibRjKIIi+AUknIqnRXCrHEAe15Pp+puThuSOZMGfgLFkyPPRU9ScEDUzAx8
	HYox0h1sGhVKfUJ+C9VlGBjCDncgbRwLQ5rhVG6LJS3FoNl/Adm4kbLKk/25Fo9d++f6R6s6gBd
	MBUo41P8N/b4aeAbfZznXqu/OquyYtWDA2ZZars4yeeW5uAqrJwIkjG/GOnCyKzJY7d2nbp2Uv2
	mII687KTGsUj/bUwuhwDwqATBtTvs75gcY5ey69LoqU79k0b8iJarnq3PDe9cb9iRwZHB/UHmaN
	+mm9YO9FCyScBaYa8z7pgBkCSSZsB5e+gaXjEpaOSCpwEzmq5SstZ9GMMDLlAR4uQ+noslRcicY
	o1UZghmxWwcNZqOFOztZJlzePWxRrOBePTiOdCMO3A8admEe9TGmwrVcPSwAYYobwIbwCvMRNh9
	hLjFmUAUfla+IhaLKXWmEvaG3ECxvAgaTHFy+Rk6XtYogiau9c69BWUTGwVnRXm1iHN1bEQdG7H
	66TyAGg7gLXIU5O
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--21.944700-8.000000
X-TMASE-Version: SMEX-14.0.0.3080-8.6.1018-26680.007
X-TM-SNTS-SMTP: FAFB3896CE5414CC2BE359D2287F24068F3A0BC0345918C89A45FF6D0DC7304D2000:8
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9ad48821-212b-47c2-21c8-08da3f9ebad7
X-MS-TrafficTypeDiagnostic: VI1PR1001MB1311:EE_
X-Microsoft-Antispam-PRVS: <VI1PR1001MB1311DAACE4DA35AB7473C75695D89@VI1PR1001MB1311.EURPRD10.PROD.OUTLOOK.COM>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: afnYXLULTO9taz/fgbOTt3zOjYuEr9L5hK7BRwHtVKw72kz/3GnZZw2ssC9Z46B788M9korbkTDBkb0ibOQ8ChYpzGCLL4VK6NX0uEMTH0qqn+5KSS+Pkbvn1ygt9zxZaopriR/okS6hODRlLQEsQmhtVRjlXkNPrinhukrkVb0eHevoimqv7TC1P1tZFnrV7kFZbUIQ5IqXrGbGyY11EGidbnKKHH3j/bcQAx5UZL7CyQQrAEWVuVZhut8Ink+NplShMERmlR/ZL5LqqqNtsa39VKq1WDzCwwJ164QtQpTDKPQpR6WL3j8ohkVygDeIQGCGGIh2/m1N2+61II437aF4qfLCLSVktNy/1830xyZ1Pg832dpar9Bn6SEUoCnHgZiRyfWF2v7aN5f6dFJ/7dIO7Ghq5sgC+XryP9DEhZXDxbF1wEoDOOAOCDy7y7uhJ44CUdiRG9d0+0jv3wq8v2hGEiUlTsvOyNpgsZl2tyExEyaWmCZdgOO0cqGP5bx1HEu39PxqVOgp6xy+5pkT0oksk/joRmZnN4d/nKPQlr2H9SnQnQeU0zCQJJzksf3024xrC7hdLfsUkMrEcvjSVLZ0OHuR4yCm51vgAy760ysMbvrFkaLhjHiwA3ilKqBgwoz7q+HoI+i6MbWI9v9FrOfTp0K2/StG2EaasgWRX+YxL9a+DC23BRZ8AObBr8T9TXaQLfptmrHq7Vj6jZXpcJcHCX4USOOXcmTbaAxjf7i4c8vYm5mpU5juFaNYCggg+T0g6Y8oxJG8mJ9boV1Unm2N4T/0z838bQWOnhBi4vfiS368S+Ko2bhA1JYLeFe1EueVAbQvWpj33l8Vm611nkjCz+55P18UAAkeFPMGHos=
X-Forefront-Antispam-Report: CIP:194.138.21.71;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:hybrid.siemens.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230001)(4636009)(46966006)(36840700001)(40470700004)(966005)(316002)(4326008)(6706004)(6916009)(82310400005)(16576012)(40460700003)(8936002)(2906002)(26005)(508600001)(5660300002)(44832011)(8676002)(31686004)(36756003)(70206006)(70586007)(2616005)(336012)(956004)(186003)(53546011)(16526019)(31696002)(86362001)(47076005)(83380400001)(36860700001)(82960400001)(356005)(81166007)(3940600001)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2022 05:06:59.7296
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ad48821-212b-47c2-21c8-08da3f9ebad7
X-MS-Exchange-CrossTenant-Id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;Ip=[194.138.21.71];Helo=[hybrid.siemens.com]
X-MS-Exchange-CrossTenant-AuthSource: DB5EUR01FT097.eop-EUR01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR1001MB1311
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@siemens.com header.s=selector2 header.b=FnBm93cW;       arc=pass
 (i=1 spf=pass spfdomain=siemens.com dmarc=pass fromdomain=siemens.com);
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates
 2a01:111:f400:fe08::623 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
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

On 26.05.22 17:48, Lad, Prabhakar wrote:
> Hi Jan,
> 
> On Tue, May 24, 2022 at 12:55 PM Lad, Prabhakar
> <prabhakar.csengg@gmail.com> wrote:
>>
>> On Mon, May 23, 2022 at 4:13 PM Jan Kiszka <jan.kiszka@siemens.com> wrote:
>>>
>>> On 23.05.22 15:55, Lad, Prabhakar wrote:
>>>> Hi Jan,
>>>>
>>>> On Fri, May 20, 2022 at 7:08 AM Jan Kiszka <jan.kiszka@siemens.com> wrote:
>>>>>
>>>>> On 19.05.22 15:23, Lad, Prabhakar wrote:
>>>>>> Hi Jan,
>>>>>>
>>>>>> On Thu, May 19, 2022 at 12:39 PM Jan Kiszka <jan.kiszka@siemens.com> wrote:
>>>>>>>
>>>>>>> On 19.05.22 11:44, Lad, Prabhakar wrote:
>>>>>>>> On Thu, May 19, 2022 at 6:30 AM Jan Kiszka <jan.kiszka@siemens.com> wrote:
>>>>>>>>> Forgot: that cannot work. The call of arm_dcaches_flush will overwrite
>>>>>>>>> lr, thus the second ret will only return to where the first ret jumped
>>>>>>>>> to - endless loop. You would have to restore lr (x30) from x17 in
>>>>>>>>> arch_entry first:
>>>>>>>>>
>>>>>>>>> mov x30, x17
>>>>>>>>> ret
>>>>>>>>>
>>>>>>>> That did the trick thanks!
>>>>>>>>
>>>>>>>> diff --git a/hypervisor/arch/arm64/entry.S b/hypervisor/arch/arm64/entry.S
>>>>>>>> index a9cabf7f..7b340bd1 100644
>>>>>>>> --- a/hypervisor/arch/arm64/entry.S
>>>>>>>> +++ b/hypervisor/arch/arm64/entry.S
>>>>>>>> @@ -109,6 +109,8 @@ arch_entry:
>>>>>>>>         mov     x0, #LINUX_HVC_SET_VECTORS_LEGACY
>>>>>>>>  1:
>>>>>>>>         hvc     #0
>>>>>>>> +       mov x30, x17
>>>>>>>> +       ret
>>>>>>>>
>>>>>>>>         hvc     #0      /* bootstrap vectors enter EL2 at el2_entry */
>>>>>>>>         b       .       /* we don't expect to return here */
>>>>>>>>
>>>>>>>>
>>>>>>>> With the above diff I do get the below:
>>>>>>>>
>>>>>>>> [   42.980805] jailhouse: loading out-of-tree module taints kernel.
>>>>>>>> Reading configuration set:
>>>>>>>>   Root cell:     Renesas RZ/V2L SMARC (renesas-r9a07g054l2.cell)
>>>>>>>> Overlapping memory regions inside cell: None
>>>>>>>> Overlapping memory regions with hypervisor: None
>>>>>>>> Missing resource interceptions for architecture arm64: None
>>>>>>>> [   46.582588] obcode @arm_dcaches_flush: d53b0024
>>>>>>>> [   46.582616] obcode @arm_dcaches_flush: d53b0024
>>>>>>>> [   46.611311] The Jailhouse is opening.
>>>>>>>>
>>>>>>>> So it looks like something to do with the debug console. This has to
>>>>>>>> be poked in the dark or any easy way to debug?
>>>>>>>
>>>>>>> Well, we do not yet know what goes wrong. We do know that we can call
>>>>>>> into the hyp take-over stub and register Jailhouse with it. We do not
>>>>>>> know if we will then end up in Jailhouse in hyp mode and just lack
>>>>>>> console output or if we crash on entry already.
>>>>>>>
>>>>>> Right agreed.
>>>>>>
>>>>>>> To move the uart console out of the picture: Did you already check if
>>>>>>> the driver you select in the Jailhouse config is actually one that
>>>>>>> should support the UART on your board? Next is to double check if poking
>>>>>> The UART on this platform is almost identical to
>>>>>> JAILHOUSE_CON_TYPE_SCIFA type, but with some differences which I have
>>>>>> patched to work on this platform.
>>>>>>
>>>>>>> registers in the way the Jailhouse driver will do at the addresses you
>>>>>>> configured will work: Pull the code into the kernel module or even into
>>>>>>> a userspace application with /dev/mem raw register access and try out if
>>>>>>> that works in a "safe" environment (without hypervisor mode).
>>>>>>>
>>>>>> Sure will give that a shot, any pointers on doing this from userspace?
>>>>>>
>>>>>
>>>>> Something like this may help if you do that the first time:
>>>>> https://bakhi.github.io/devmem/
>>>>>
>>>> Thanks for the pointer.
>>>> I have tried reading/writing from the hypervisor location and that
>>>> goes all OK.
>>>
>>> Means, you were able to generate output on the UART. Hmm, would have
>>> been too easy.
>>>
>> No I meant I was able to read/write into the hypervisor memory which
>> is reserved in DTS.
>>
>>>> To avoid any issue related to debug UART is there any way
>>>> I could test this prior to enabling?
>>>
>>> Not without extra measures: Without JAILHOUSE_BORROW_ROOT_PT, which
>>> applies to arm64, the driver will not map the physical UART page. That
>>> only happens in init_bootstrap_pt which is run after jumping to EL2. So,
>>> we the jump goes wrong, you cannot find out where you are.
>>>
>> I see. Just to confirm it's not the debug UART the watchdog is enabled
>> in Linux and I see the platform reboots after 60 seconds, which is
>> hinting we are seeing a kernel freeze.
>>
>> Just a fyi I tried the queues/jailhouse branch from [0] and still
>> seeing the same issue.
>>
>>> Do you have the chance to get hold of some jtag to find out where the
>>> CPUs are?
>>>
> 
> X0   FFFF00063F7ECD88  X16                 0  ^S+ ^Stack_________+
> X1                  0  X17                 0
> X2                  0  X18  FFFFFFFFFFFFFFFF
> X3   FFFF8000112870E8  X19                80
> X4   FFFF00063F7ECD80  X20  FFFF800011179000
> X5   FFFF800011179A48  X21  FFFF80001130BE70
> X6   FFFF80001101E000  X22  FFFF800010DFDED8
> X7   FFFF800011179000  X23          86000004
> X8   FFFF00063F7ECD80  X24  FFFF80001101CB38
> X9                  0  X25  FFFF800011308000
> X10          00040000  X26  FFFF80001130C000
> X11                 0  X27  FFFF800011182A40
> X12                 0  X28  FFFF800011182A40
> X13  FFFFFFFFFFFE0000  X29  FFFF80001130BC40
> X14  FFFF800011192008  X30  FFFF800010B3B464
> X15  FFFF800011192048  PC   FFFF8000100D9F78
> --------------------------------------------
> CPSR     80000085   N N  I I  SS  _
> EL1h                Z _  F _  IL  _
> nsec                C _  A _
>                     V _  D _
> --------------------------------------------
> Current ELx:           SP   FFFF80001130BC40
>                        ELR                 0
>                        SPSR         20000085
> --------------------------------------------
> EL0:                   EL1:
> SP   FFFF800011182A40  SP   FFFF80001130BC40
>                        ELR                 0
>                        SPSR         20000085
> 
> EL2:                   EL3:
> SP   0000FF0000011000  SP           4400A500
> ELR  FFFF8000104CC8A8  ELR  0000FFFFC02064AC
> SPSR         20000085  SPSR         200003C9
> --------------------------------------------
> SPSR_ABT            0  SPSR_SVC     20000085
> SPSR_IRQ            0  SPSR_HYP     20000085
> SPSR_FIQ            0
> SPSR_UND            0  ELR_HYP      104CC8A8
> 
> 
> Above is the CPU state, when the kernel freezes. Any hints on what
> might have happened?

Can you correlate the PC value with the hypervisor disassembly? Or are
we actually back in Linux? Current SP == EL1 SP...

If that should be the case, you could use the JTAG to "trace" how far
you get: Add an infinite loop at some point the setup should get along,
and then check with the debugger if PC points to that address and if EL2
is active. With that, you could also check if the UART print-out is
executed.

Jan

-- 
Siemens AG, Technology
Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/5172e723-49ce-a870-2066-d22f44115da3%40siemens.com.
