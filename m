Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBUMP3SOQMGQE7VTSWGQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x33d.google.com (mail-wm1-x33d.google.com [IPv6:2a00:1450:4864:20::33d])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E7EC65F291
	for <lists+jailhouse-dev@lfdr.de>; Thu,  5 Jan 2023 18:24:34 +0100 (CET)
Received: by mail-wm1-x33d.google.com with SMTP id m7-20020a05600c4f4700b003d971a5e770sf17897020wmq.3
        for <lists+jailhouse-dev@lfdr.de>; Thu, 05 Jan 2023 09:24:34 -0800 (PST)
ARC-Seal: i=3; a=rsa-sha256; t=1672939474; cv=pass;
        d=google.com; s=arc-20160816;
        b=jgqT4A25x918KO51ctM38cMewk2iQyX2IAO75xAf5wRkLz+pXgmZMjDfW9uspmOfQ4
         dXeDtw2CLGcIQVwqHKEnjCUsSfF5qaZeQxcWBBVEcoj+658nMyeVQn77IWuw52Qbg1Es
         NuNohC22LlUu4+//kOlNoxVjQjzHsSGvxf+TjUtnXOKzDplurNNo3ihL+OC2KwhIb7Ax
         /k4hyDOw47YtmJLh3GPHEuhliVJC/ii7FElMQkTn5x+Mz7+1aaQXgKcSuwSgYSQJhqoi
         AIzJffm8WetobZv1hpGSSpA0iyG5Hi8H+JYOsz1ia9Q0kTeEtg2/EUNupUPJDy3YECHj
         qi3A==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version
         :content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:date:message-id:sender
         :dkim-signature;
        bh=q1LS8JWtE20hynbpvB8lL7FO27kKJsULZdeXXtDrQoE=;
        b=UtehyijYYshHt5FT8dKzdKJV6EuepKmRuKOIUkuHRdroASrGhQ2Y9qMag0RAQt+Wyf
         +EKd9kZ8FhGTiqwRsPI5v+oI5fCk0Ysw333BaJLifxvmcqnOKh0PSaks9o6f90fBhe+d
         5/ITuh9WRJFc0zfICcALVuDnP/JxYz3p1kkRX6n6SP/C3JLvYEO7zGp6qQrZlpXOSqQW
         FbwWkH48DJKTKKoSAGaoLMwmkJh1vQGtv4R6urDTTLgfjVb+jPedYEjtKqW0RArGYg4q
         SxCUGU4BAvCHtSikMAxPwfo3lvtGHWdkQXD3M7at/T2uK4GLBjaiCDtbrQOCpoQvnbgX
         XnxQ==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@siemens.com header.s=selector2 header.b=Y3GO93xh;
       arc=pass (i=1 spf=pass spfdomain=siemens.com dkim=pass dkdomain=siemens.com dmarc=pass fromdomain=siemens.com);
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 40.107.8.83 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:mime-version:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:date:message-id:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q1LS8JWtE20hynbpvB8lL7FO27kKJsULZdeXXtDrQoE=;
        b=jqd4lqPy6vqDwUT4GaQKASPQ4xvMjx5VIHbRvBPsus6cDAk5MWcb+MgtqdSgeRaYPX
         kM3rS1lFPBVIkiPvkyn4A20yg5chtyLCvACKb3f4dAc8I7v9DLkmOMpmtpEdHtAm/lXs
         3xfK1ypsADd5nng4m0TeB68YB9Wn6Oewjz3w//ts7dU8y1xWrr3InkBiOGmJLo4GG2QV
         pu9xD5nVan8Kshjb+CJSe84DLMg4uZ20dceZ0B1ao0PYEn/HNTwUEK7czeFFFtEeC6K5
         W3tQQ3cj/VAtSJwe8Bli2qDuONrvJeY90WRABQqJErerfQ2ZmTL94l4Xn1ZP2KLZ+Ff+
         aPcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:mime-version
         :content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:date:message-id
         :x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=q1LS8JWtE20hynbpvB8lL7FO27kKJsULZdeXXtDrQoE=;
        b=NwnefO4JudC9fxhFH8U/LGPVCA96sfw43dlDQ3nBFVlVyJa06udC2wlDQ14RcIIu4r
         Eg5VBi5/J1mOKqSTXYftoVFuCzp+QqJEybhNtMTtwl9m5cQJ+WpZGsv11tLDgPljn8lB
         GSnEbuDJCpJAC32znoAhuTUUugXMHMnRptdmUDGGCRPNGXjFDUlWL3GRZOS6Qa5JBnl7
         rjX+/1Q36dc4bSY64n6DV8hB8MJGF5M/NMAQ+SHDPeykr8os4wZNiiZpkYuJChscNqIs
         9YBmnxLF02RPMarlUeA7UGl9bXVn/ROcD8Grw4UKK+j1CTSJQi1AB7dmm8Igd++SVDem
         ZsGw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AFqh2krdhNTkgKf3/5iMdsZGk6Ziu6ezuCMBDZsdZe6Qm9tVV7nlkdyv
	cZ3Bx3oCA7DV0HlYCktUj0U=
X-Google-Smtp-Source: AMrXdXva86ae6viBTNd4Sc8i0mK2ovQjEUsXF8h33ji9R4qG2q9w5ZU+wiwIICR67XNGsDzqnRyDzA==
X-Received: by 2002:a5d:6888:0:b0:278:2203:cbdd with SMTP id h8-20020a5d6888000000b002782203cbddmr1121503wru.632.1672939474313;
        Thu, 05 Jan 2023 09:24:34 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:600c:3d89:b0:3d1:be63:3b63 with SMTP id
 bi9-20020a05600c3d8900b003d1be633b63ls20878326wmb.1.-pod-canary-gmail; Thu,
 05 Jan 2023 09:24:33 -0800 (PST)
X-Received: by 2002:a05:600c:1c21:b0:3cf:9844:7b11 with SMTP id j33-20020a05600c1c2100b003cf98447b11mr44785122wms.23.1672939472937;
        Thu, 05 Jan 2023 09:24:32 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1672939472; cv=pass;
        d=google.com; s=arc-20160816;
        b=nQyFJuiJlZWntVG9/xcXvyYs58FE4Ac+aFAbfPcZh+frVtOqGkGKBqrcvn6XDfdPAq
         QYlT9GQu4Jowgs0bs7Pdt+rHBoKnhtPMXQJa9c9sMeKcjVwH34cffNWHE25ed01oHrq4
         CdLdTsb0ZZvLTacR17Wta892I4w0mQyOEussSNWQhsiczxddFvKUTpmyCOfcgjraHpMS
         KBOxYjeJ5zv9DtaxOMdiK3A4YR//Kt+hr5x1YytYwP0SpirLduDzdy4pzDNL5VDOqyqA
         dPte+8q26QCCsYJs9Yb+Gy5kJLSnjSKDL1HQNmWR53W0hJ4UFQoM8JIJL+mzrScUFPN7
         2Xcg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:date:message-id
         :dkim-signature;
        bh=YxsmQyPscM6FPry8fkPn/4xTgzWEPZni1Pa9Esl23PY=;
        b=R6TRW2kMQffxEsYzJYtc9NkKeoVukZ2kvdvsPzWLBY7IN74UYesju7KajK7aaa7knD
         oNFaz04qs7tkE75bNdSSAiTRzuGSA6Rw6+3ZmmBB8eKqKsDGnP/Xk0mn3/hkEOPrxl3K
         4y68NEnHa4MmfFye1sg5p2vaXakqHkEq7lRnB/pu7JLQBYRI+aQaDB+ocAVqYB6yxfBP
         J5be/fpc3dbxa+Fhq6Eka9pbFehRvfKedgYwR6ict/qLo5u/+xu3lGYNlGP8JYcafAPx
         YkwKCrmKqVHx1U5/MVNGVxvz+/KqNssIc92PYWeCa3ERY4jY0HGSm3e0EgU78iMcnfkX
         XeDQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@siemens.com header.s=selector2 header.b=Y3GO93xh;
       arc=pass (i=1 spf=pass spfdomain=siemens.com dkim=pass dkdomain=siemens.com dmarc=pass fromdomain=siemens.com);
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 40.107.8.83 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (mail-vi1eur04on2083.outbound.protection.outlook.com. [40.107.8.83])
        by gmr-mx.google.com with ESMTPS id ay6-20020a05600c1e0600b003d9c716fa3csi232933wmb.1.2023.01.05.09.24.32
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 05 Jan 2023 09:24:32 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 40.107.8.83 as permitted sender) client-ip=40.107.8.83;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SPaL/ympeGT+zZdxrm+Au/h7IWbuK+5PkhWsXCjDM3YQEOgomzLen8+6zcvnF7u8tUiLEe4q47qJ3kADVj52GDAiANhJx8WqRX2KIUtPWRrqgwp4d2AhkJbjj+JylDahmBqM7EeH5xuEwixDFGdEEvXop6ZcNBB2H5016qfRKbciPMFR9H8y7UUHRMZGoMJ2LTHGUicu55w8hbxeVCNQzV0Mt/41rY6v8YsvdqMhr1irva98X0ALiQILzFtkTKemcki3LZL1ZtoeR7tzC7p8uX25i+CaSykkBDM7jdvLqVN9o6i0rvH3wi01H5TXU04nIRJCyi09cMMNtnpPzuLc6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YxsmQyPscM6FPry8fkPn/4xTgzWEPZni1Pa9Esl23PY=;
 b=kfqRLDk/u9wEHuLe6dlk/SbM1znMzURWmCO8kwvpZhEMX6hRWuWDpFn+2d2dKA/oju2h2/l681YY3hsmIGRs1hc6/C8uD0DZpTHBhHHy1vQXwsPFwAxer15hSr/aCiyZv2gQAmIjTOvNAlenUT75ucuWEFby/BsmvtYiTDMvEPTW/vzsKkd0yIjIDsJlHPjoQ6vmw2RECm4zhuF8rAM3LbXFxA8WT3nCHhTxqdC5nkdiwHzXxRa3LTwzJLmvBhyzk1DJEC00y6+d2lBzS8KfFF6UrETQd0at81cwaY45vbKiOv5fgOu2JqtBrSUkROh0WkLhC6M11Yw+ZIUw2JGrYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
Received: from AS4PR10MB6181.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:588::19)
 by DB9PR10MB7931.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:303::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Thu, 5 Jan
 2023 17:24:31 +0000
Received: from AS4PR10MB6181.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::2957:50e8:8ce6:124a]) by AS4PR10MB6181.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::2957:50e8:8ce6:124a%9]) with mapi id 15.20.5944.019; Thu, 5 Jan 2023
 17:24:31 +0000
Message-ID: <82959f20-2de7-5d7b-ce9b-cb8aa1476c32@siemens.com>
Date: Thu, 5 Jan 2023 18:24:27 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: STM32MP1 hangs on when entering hypervisor
Content-Language: en-US
To: Tommi Parkkila <tommi.parkkila@gmail.com>
Cc: Jailhouse <jailhouse-dev@googlegroups.com>
References: <bfb4732c-21e8-4a5d-8a0d-382041e7554cn@googlegroups.com>
 <3071214a-b5a8-4096-8ad4-3a79b6634de5@siemens.com>
 <CAP8Rr63c3LS3Z_OU201aSokZ8NCUdoeXeAMGZ=Qu4d-TMV+wVQ@mail.gmail.com>
 <990aa280-3365-429b-cd73-d1b89b0b4a83@siemens.com>
 <CAP8Rr619HSJUVs3GTLBzP=r_4_svq8yvbP5JAADjWK2dwoLLZg@mail.gmail.com>
 <e9acd20c-b3cb-4887-788a-266534ab5a19@siemens.com>
 <CAP8Rr628BM-8rQR+K4gw2GFPHZZXgVvbtdNF90fpyXU9Nxsx1A@mail.gmail.com>
 <CAP8Rr619qqqSCc0QBBzet2DfL10B0axK_2s0Pohb6p_JqrBxqg@mail.gmail.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
In-Reply-To: <CAP8Rr619qqqSCc0QBBzet2DfL10B0axK_2s0Pohb6p_JqrBxqg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: FR2P281CA0087.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9b::6) To AS4PR10MB6181.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:588::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR10MB6181:EE_|DB9PR10MB7931:EE_
X-MS-Office365-Filtering-Correlation-Id: 71c86b6d-fbb4-4e56-9355-08daef41b489
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JIJWdNBkKLzNPNj+tCXQlVwWd8Z8pi+qKLBVfAlI1WxfiBmsSY+IjgqDvEGOjoGSHOsIonAeYkHDNd4oWK059KiPyTp2jmKpmdKMxhgYnysEMqUgmMfnUq8JpXHRp3ncBKnDMMfXeeIYewqQCLxKsGELcgxUQgcCsCMaNdSFoX3tyo8Okn0zAqMCaJXwIp7AhHB1yxPm7bZumw7xWvvdsaMickW7z6zB9ke30KJDrjQPr0tyJ5x+u5FayxOUwEE2pV5HVK7H29xHR9fXJ4t9TZJ4RvuHol7P9vz1CZpOsGzQfhl7jEfIsYXYiISxM1miN3KBV6/W0dMk8iiBIbsElGUpDj3IA/kTKfVS+gXp+QwE53RNgLnfGkneGn/OcNFcmC7pELm4wdiJ3Q4J76z2/iNzXQYYvrngcwO+PFhcshFUKi0i89yVFV70mjnkTobSYl1eFbBzk5EYCrHJbg1RQQvIfcixIKbY0ZbJbIx4JN0h3I8pCVDBYxh21CvVu9HwGZfQi9rCaYRZVHbhJHiSA1T314Hq2Nzb67sOy9SToLuUJpjhAlScLx9FmSJ1yOrowudlR6kElMXtWoTDX+wuezj1uLCxNRKI4Oit4Lf+RuOBUSrOrZjafcRrTN5xfTbpe8nmHrhE8rVK6xcgJkhrjKebNOu0DtQaBmxhhVqOuJJaR7ZmjEIwVxgw/MCHbcuI4BKKBdeptfYhhRntOgLp/VPlUO8qxTq52/iFzpFcsms=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR10MB6181.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(366004)(346002)(39860400002)(396003)(376002)(451199015)(2906002)(5660300002)(31686004)(44832011)(8936002)(41300700001)(4326008)(8676002)(66476007)(316002)(66946007)(6916009)(6486002)(478600001)(66556008)(53546011)(2616005)(26005)(6512007)(6666004)(6506007)(186003)(83380400001)(38100700002)(82960400001)(31696002)(86362001)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dGVTR2xxYU1IdnpaMTVPaXYwRG5yeEEybG1sdStRdjdWckFEcFdCWm1vN2NQ?=
 =?utf-8?B?a0dwUG50dnlCcTIvK3VtQnNiQWVFNSs3T09XUXg0R21SWVk4SkZxUFlsOTI4?=
 =?utf-8?B?eXQ5T0pZSjVWY0c2SkZZY0tleXpWY1kzUFE4K2NwNWVWWEt1eWlXcGdLMW9E?=
 =?utf-8?B?YTR0aGlKTlo5K2YvL3oyZHlieFRxTE11d2ZpZlMzdnZubkVwb0xuYWQrMGdh?=
 =?utf-8?B?UjVTNVdiY2YvbitmSVZheGVOWW5IS2VIWGdpOE13UGJHYXZzUEtVT2xta3dI?=
 =?utf-8?B?blN4T2NlK1NnVlExL0gyWHh2dVpZa24velU4ZVIwcURCNVI1UjFMTzNib0xz?=
 =?utf-8?B?ZW1pbFFYdHNYVG1XeHdDc1RncjBrMTEvNkR2T3pub0tSMmNGdGxqT2U3L0tl?=
 =?utf-8?B?NmgrMXhlbDJMR0RITmxERjdnNWppQy9YSmZ3QlNLT240UFZhWXRXa3h1WjdD?=
 =?utf-8?B?aHhnK1BiL2pQekxiQUMzL0VSbW5qa1ZxNXExWHFJa2d2TmJXaDJMRGtqNWI0?=
 =?utf-8?B?d1JNVTN1blljdWI5cnlsME05T1ZkNEMwVTFGMUZNWmlHMUNTQmRyMDVHRWQ1?=
 =?utf-8?B?TnFtV2lLYnNNOTY4U2ZaTmNtR2dBaHNSYzQ0UTB3d01DRk13OFBBd2V6TGpt?=
 =?utf-8?B?NFRXemRpQk5CYjFndkxJZ3NJUnlPcEV0UTQrc2tnTmpUWE1rdS9DcnBlZ3Fr?=
 =?utf-8?B?eUx0elJQdTl2bmV1VXQxcGtrbU9MNEt3aGxSZG9nbnVETnY2TWVPR0FRM2pO?=
 =?utf-8?B?a202bTNNdU5LQVhlaWFNUkd6RGpLdlM2UXFudGJpR00vZHJHd0hHc01CTXIr?=
 =?utf-8?B?MEVhZG9xVFRrWHFhaTFmK1F5NTZpVDFQY2lxdG0xMElSVGhRYUZFakYrM1dW?=
 =?utf-8?B?OVhkYlZXN3VyNEtmWEppY2VTMkgzeGo5K3NFclRvMUN5MnZvSmxSZ0dJSk16?=
 =?utf-8?B?Snd4NnVjdjhUcUpneTU2VDhoa1JrSFRoaTNJVjBMeThLRTB3WURtdlZqM3pl?=
 =?utf-8?B?MHZsbVBKSFNtMFFWdG9vSzJ4eEVKNU1sWDhQdG8vRmxRQm9tRkJwZStST0p3?=
 =?utf-8?B?a3VPZkIyZUpQUnlIOGJXRWpiNTIrOVI5dnVMWlN6SFMzWDNUNDdpbkpkQjQ4?=
 =?utf-8?B?VEpiaVZSbkc1NElwL05CcSt6a1kySlBIaUVWZ3oxNnI1cGNCUHpoVlZ0clRT?=
 =?utf-8?B?ZS9idDJrSXYrSk9HakdhQlB1bEliODhMUGVpVXBBbk1jRDhjY3krSWY4RFlj?=
 =?utf-8?B?OEJtbzJsNTlwV0F2KzZKTmlGbS9WOE8yZzRDczM4VWswcmFhSTJ2dzFDaTlM?=
 =?utf-8?B?akthbkFZYkxRUEVYUHNENlFMZzlSQ21lSnBOODhDSTBaaDladW8zMndFQnh5?=
 =?utf-8?B?R1dyOCtkRjBRU1lqRU1CL3UrR3NiSTZXbjljQnR5dmFMcmUremxPTkk4Z1No?=
 =?utf-8?B?c0ZnMmowRktLWUgzUVdWMysrK0NQNnMxSy9sRjVLM0o1ZFlzTFM5MUpib3Rx?=
 =?utf-8?B?REpDbkxqdTBKMjNXalNUY1gxZ28zSHJjSmF5eFlrS09CVHloZFREMUI3b0xO?=
 =?utf-8?B?NENXUXZoNjFXY25Fa0UxdGpQamd2YXZBYzB1bWIxRGtQVjcwcjI1cDQ0UDZr?=
 =?utf-8?B?RWZPcjVUeWpQSUZBTFAzMlAvZmxad3c0Slo4UlYrNnlrS3Fjdk1zelpOY3Ba?=
 =?utf-8?B?ODhYQ2ZyRGdVN0J0L2p0cnNwQzZDVW1sR1NKNU91M1NrSVRwYlBRcE9Pbi96?=
 =?utf-8?B?cCtlUE1ZUVdqSURhYkR0dGNLa2Z5MDdiTXJGVEZuWXZURFprR2hwTVRIOWVF?=
 =?utf-8?B?aE5YOStMdW1ldGljcDVyN2R4YWFUcFlnbS9ST2pTNlg0VmZ3YXVsZWJYL29i?=
 =?utf-8?B?WGZlT1hKVndrOFlmVFdrUFhDY00rRUZmeEZwdTd0SGNZeVlRY2JuUmNuQ2Yz?=
 =?utf-8?B?VEVpcWFHc2xPdGRrSDNVN0lwRXM5NTFlS1pId1ZkRUpSZ2R6YUVjcWNrdjFt?=
 =?utf-8?B?d1ZhR3VTUjlrREpmdHl0OUNzNU15dG8xQnVFajQ3dzdOanpuNTdCQ2xDZTNK?=
 =?utf-8?B?a3ArVTYvS2ZOMjdZUE12T3dmWlZ2SnZmSG5yZE5QQVhxdXFrb1h2dFlyMGlw?=
 =?utf-8?B?RHRkN0c0SUdtOXdjS3ZVUmpYVUdTUDBWMTZVUzN6SkdmeTFPVHY3SVBiNmpV?=
 =?utf-8?B?V3c9PQ==?=
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 71c86b6d-fbb4-4e56-9355-08daef41b489
X-MS-Exchange-CrossTenant-AuthSource: AS4PR10MB6181.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2023 17:24:30.8892
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: y9XO0ax3+Ta5QXsmNFoSKCK2tZGMArUX+Oe70YzwyZZkyntGAdD8IHLNJQ2CLYlXWecJlCtMRLFuVrlGotjpXw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR10MB7931
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@siemens.com header.s=selector2 header.b=Y3GO93xh;       arc=pass
 (i=1 spf=pass spfdomain=siemens.com dkim=pass dkdomain=siemens.com dmarc=pass
 fromdomain=siemens.com);       spf=pass (google.com: domain of
 jan.kiszka@siemens.com designates 40.107.8.83 as permitted sender)
 smtp.mailfrom=jan.kiszka@siemens.com;       dmarc=pass (p=NONE sp=NONE
 dis=NONE) header.from=siemens.com
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

On 05.01.23 18:21, Tommi Parkkila wrote:
> Oh, I was missing *.cell from the point 2. Now fixed=C2=A0and no complain=
ts.
>=20
> to 5. tammik. 2023 klo 12.20 Tommi Parkkila (tommi.parkkila@gmail.com
> <mailto:tommi.parkkila@gmail.com>) kirjoitti:
>=20
>     Jan - Just ran the config check on the host PC and on target.=C2=A0
>=20
>     1. On host, it identified some memregion overlappings that were due
>     my own copy/paste errors. It also complained a missing resource
>     interception for architecture x86:
>     */In cell 'STM32MP1-Root', region 1
>     =C2=A0 phys_start: 0x00000000f7600000
>     =C2=A0 virt_start: 0x00000000f7600000
>     =C2=A0 size: =C2=A0 =C2=A0 =C2=A0 0x0000000009a00000
>     =C2=A0 flags: =C2=A0 =C2=A0 =C2=A0JAILHOUSE_MEM_READ | JAILHOUSE_MEM_=
WRITE |
>     JAILHOUSE_MEM_EXECUTE
>     overlaps with xAPIC

Another detail when running cross: "-a arm" - you don't have to worry
about x86 resources on your target.

Jan

>     =C2=A0 phys_start: 0x00000000fee00000
>     =C2=A0 virt_start: 0x00000000fee00000
>     =C2=A0 size: =C2=A0 =C2=A0 =C2=A0 0x0000000000001000
>     =C2=A0 flags:=C2=A0=C2=A0/*
>     I fixed the copy paste mem=C2=A0overlappings, do I need to worry abou=
t
>     the xAPIC overlapping?
>     */
>     /*
>     2. On target, the check complained the configuration is not root
>     cell configuration???
>     */root@stm32mp1:~# jailhouse/tools/jailhouse-config-check
>     jailhouse/configs/stm32mp157.c
>     Reading configuration set:
>     Not a root cell configuration: jailhouse/configs/arm/stm32mp157.c/*
>     The config here is the same as ran on the host PC. What causes it to
>     complain the above?
>=20
>     to 5. tammik. 2023 klo 11.55 Jan Kiszka (jan.kiszka@siemens.com
>     <mailto:jan.kiszka@siemens.com>) kirjoitti:
>=20
>         On 05.01.23 17:53, Tommi Parkkila wrote:
>         > Jan - Thanks again. I have not tried the config check yet.
>         Actually, it
>         > does not work on hw currently, it does not find pyjailhouse
>         module. I'll
>         > check whats=C2=A0going wrong with it and=C2=A0let you know.
>=20
>         You can also run it offline, even directly from the source folder
>         (tools/jailhouse-config-check ...).
>=20
>         Jan
>=20
>         > -tommi
>         >
>         > to 5. tammik. 2023 klo 10.21 Jan Kiszka
>         (jan.kiszka@siemens.com <mailto:jan.kiszka@siemens.com>
>         > <mailto:jan.kiszka@siemens.com
>         <mailto:jan.kiszka@siemens.com>>) kirjoitti:
>         >
>         >=C2=A0 =C2=A0 =C2=A0On 05.01.23 15:34, Tommi Parkkila wrote:
>         >=C2=A0 =C2=A0 =C2=A0> Thanks for your reply, Jan. I managed to g=
et forward
>         from the 'hang'
>         >=C2=A0 =C2=A0 =C2=A0> condition. There were several misdefinitio=
ns on my root-cell
>         >=C2=A0 =C2=A0 =C2=A0> configuration. Now I get the root-cell sta=
rted
>         sometimes, but more
>         >=C2=A0 =C2=A0 =C2=A0often
>         >=C2=A0 =C2=A0 =C2=A0> I get two types of issues after enable com=
mand. Any help
>         or ideas
>         >=C2=A0 =C2=A0 =C2=A0where
>         >=C2=A0 =C2=A0 =C2=A0> to continue my debugging would be greatly =
appreciated.
>         Please, see the
>         >=C2=A0 =C2=A0 =C2=A0> issues explained below.
>         >
>         >=C2=A0 =C2=A0 =C2=A0Already tried "jailhouse config check"?
>         >
>         >=C2=A0 =C2=A0 =C2=A0>
>         >=C2=A0 =C2=A0 =C2=A0> Thanks,
>         >=C2=A0 =C2=A0 =C2=A0> -tommi
>         >=C2=A0 =C2=A0 =C2=A0>
>         >=C2=A0 =C2=A0 =C2=A0> +++++++++++++++++++++++++++++++++
>         >=C2=A0 =C2=A0 =C2=A0>
>         >=C2=A0 =C2=A0 =C2=A0> 1. Terminal hangs
>         >=C2=A0 =C2=A0 =C2=A0> -- After the enable command for the root c=
ell, jailhouse
>         gets started
>         >=C2=A0 =C2=A0 =C2=A0> but then the terminal goes unresponsive. B=
elow, example
>         log, where I
>         >=C2=A0 =C2=A0 =C2=A0> give ls cmd, which then causes terminal to=
 go
>         unresponsive...:
>         >=C2=A0 =C2=A0 =C2=A0>
>         >
>         >=C2=A0 =C2=A0 =C2=A0Missing interrupts could be one reason. Or s=
omething is
>         completely
>         >=C2=A0 =C2=A0 =C2=A0broken with memory mapping so that a kernel =
device driver
>         gets stuck on
>         >=C2=A0 =C2=A0 =C2=A0waiting for some register bit to flip, e.g. =
But most
>         frequent are
>         >=C2=A0 =C2=A0 =C2=A0interrupt issues, specifically around GIC re=
sources being
>         improperly
>         >=C2=A0 =C2=A0 =C2=A0passed through. The config checker may find =
that.
>         >
>         >=C2=A0 =C2=A0 =C2=A0> /*root@stm32mp1:~# modprobe jailhouse
>         >=C2=A0 =C2=A0 =C2=A0> [ 1315.034414] jailhouse: loading out-of-t=
ree module
>         taints kernel.
>         >=C2=A0 =C2=A0 =C2=A0> root@stm32mp1:~# jailhouse enable
>         >=C2=A0 =C2=A0 =C2=A0> ~/jailhouse/configs/arm/itron_stm32mp157.c=
ell
>         >=C2=A0 =C2=A0 =C2=A0>
>         >=C2=A0 =C2=A0 =C2=A0> Initializing Jailhouse hypervisor v0.12
>         (314-gc7a1b697-dirty) on CPU 0
>         >=C2=A0 =C2=A0 =C2=A0> Code location: 0xf0000040
>         >=C2=A0 =C2=A0 =C2=A0> Page pool usage after early setup: mem 28/=
1514, remap
>         0/131072
>         >=C2=A0 =C2=A0 =C2=A0> Initializing processors:
>         >=C2=A0 =C2=A0 =C2=A0> =C2=A0CPU 0... OK
>         >=C2=A0 =C2=A0 =C2=A0> =C2=A0CPU 1... OK
>         >=C2=A0 =C2=A0 =C2=A0> Initializing unit: irqchip
>         >=C2=A0 =C2=A0 =C2=A0> Initializing unit: PCI
>         >=C2=A0 =C2=A0 =C2=A0> Page pool usage after late setup: mem 50/1=
514, remap
>         5/131072
>         >=C2=A0 =C2=A0 =C2=A0> [0] Activating hypervisor
>         >=C2=A0 =C2=A0 =C2=A0> [ 1355.352714] The Jailhouse is opening.
>         >=C2=A0 =C2=A0 =C2=A0> root@stm32mp1:~# ls*/
>         >=C2=A0 =C2=A0 =C2=A0>
>         >=C2=A0 =C2=A0 =C2=A0> 2. Issue with setting CPU clock
>         >=C2=A0 =C2=A0 =C2=A0> -- The second issue I see is related to i2=
c bus and
>         system clock.
>         >=C2=A0 =C2=A0 =C2=A0> Terminal starts printing error statements =
infinitely
>         after Jailhouse
>         >=C2=A0 =C2=A0 =C2=A0> opening. Below, is a snippet of an example=
 logs.=C2=A0
>         >=C2=A0 =C2=A0 =C2=A0>
>         >=C2=A0 =C2=A0 =C2=A0> */[ =C2=A0 85.322027] The Jailhouse is ope=
ning.
>         >=C2=A0 =C2=A0 =C2=A0> [ =C2=A0 85.322648] stm32f7-i2c 5c002000.i=
2c: failed to
>         prepare_enable
>         >=C2=A0 =C2=A0 =C2=A0clock
>         >=C2=A0 =C2=A0 =C2=A0> root@stm32mp1:~# [ =C2=A0 85.339233] cpu c=
pu0:
>         _set_opp_voltage: failed to
>         >=C2=A0 =C2=A0 =C2=A0> set voltage (1350000 1350000 1350000 mV): =
-22
>         >=C2=A0 =C2=A0 =C2=A0> [ =C2=A0 85.350413] cpufreq: __target_inde=
x: Failed to change cpu
>         >=C2=A0 =C2=A0 =C2=A0frequency: -22
>         >=C2=A0 =C2=A0 =C2=A0> [ =C2=A0 85.357706] cpu cpu0: _set_opp_vol=
tage: failed to set
>         voltage
>         >=C2=A0 =C2=A0 =C2=A0> (1350000 1350000 1350000 mV): -22
>         >=C2=A0 =C2=A0 =C2=A0> [ =C2=A0 85.365124] cpufreq: __target_inde=
x: Failed to change cpu
>         >=C2=A0 =C2=A0 =C2=A0frequency: -22
>         >=C2=A0 =C2=A0 =C2=A0> [ =C2=A0 85.381985] cpu cpu0: _set_opp_vol=
tage: failed to set
>         voltage
>         >=C2=A0 =C2=A0 =C2=A0> (1350000 1350000 1350000 mV): -22
>         >=C2=A0 =C2=A0 =C2=A0> /*- - -
>         >=C2=A0 =C2=A0 =C2=A0> +++++++++++++++++++++++++++++++++
>         >
>         >=C2=A0 =C2=A0 =C2=A0Same possible reasons as above. Or do you kn=
ow how clock
>         control happens
>         >=C2=A0 =C2=A0 =C2=A0on that platform? Is there firmware (TF-A?) =
involved?
>         >
>         >=C2=A0 =C2=A0 =C2=A0Jan
>         >
>         >=C2=A0 =C2=A0 =C2=A0--
>         >=C2=A0 =C2=A0 =C2=A0Siemens AG, Technology
>         >=C2=A0 =C2=A0 =C2=A0Competence Center Embedded Linux
>         >
>=20
>         --=20
>         Siemens AG, Technology
>         Competence Center Embedded Linux
>=20

--=20
Siemens AG, Technology
Competence Center Embedded Linux

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/82959f20-2de7-5d7b-ce9b-cb8aa1476c32%40siemens.com.
