Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBLXU7GJQMGQETBWLNII@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x438.google.com (mail-wr1-x438.google.com [IPv6:2a00:1450:4864:20::438])
	by mail.lfdr.de (Postfix) with ESMTPS id 7425F52662D
	for <lists+jailhouse-dev@lfdr.de>; Fri, 13 May 2022 17:33:05 +0200 (CEST)
Received: by mail-wr1-x438.google.com with SMTP id s14-20020adfa28e000000b0020ac7532f08sf3046450wra.15
        for <lists+jailhouse-dev@lfdr.de>; Fri, 13 May 2022 08:33:05 -0700 (PDT)
ARC-Seal: i=3; a=rsa-sha256; t=1652455985; cv=pass;
        d=google.com; s=arc-20160816;
        b=p4p3gsZVPd2/N885ywQqOzFpAiro51iLF2RskDqJA+inOsJDjGQcoQGbOU3bm0DBFv
         hc4XR5XywCsoBrS1JOJ81wKB7iCNgW4mYA+HNIHYrQr7/xdinDfYPSrbHpSl6dJ3vkmr
         itCGtSze9JxgMDq6GwrJcuSGEUXqAMelSwAY+9LBxJAxfGga84S0akLT9kx90yJ54ZuP
         zYHWSY9xUEEO/K23Cr9hhdsGhLKLQD5avN9gyE97xAmdMDpH+ukfQeiJXskLmpLp4RPv
         JK0rao05ctLZu5IjZfs49IqqwB+8Ll8mgDU7rhllL5DkWszDe1vj2OvN04A9ikGkKjlK
         fDVQ==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:dkim-signature;
        bh=kGNN2Zmmi+mHuKaBkZno7om9y/Z+KTXvaEx7iuZowqk=;
        b=QlUh+vHbyVYHibHvVxBxIm0HNpvgrwG1RiVhfj1EGZ65wYkIPldobKjooVMSN2AiOz
         8yk/MTB9JXVhQAe4aHA2wMGd34uAZTFEue/ABzcMdSPq0c1bPW54w29hfcsRGQDzNXPb
         UnkDJysv9X9aLnng6px/0cqn4WTuFuaw5a3lAhwkp+SZfkXEMnitL11qlMOnocTgCjmb
         AipuCrYR/6JPHhmPSwdutL0y2NGSWoSvI0R1g634Yhf444BDyO1bNot1WiwoXxgxDvVK
         zfu2djox8jiaVRzHN1jAjhmyqgBa6nK3liO1fMVt+tpQKFc9WbD/gcO+oCrIg0dwBvC8
         84zw==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@siemens.com header.s=selector2 header.b="XsG/SzmZ";
       arc=pass (i=1 spf=pass spfdomain=siemens.com dmarc=pass fromdomain=siemens.com);
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 2a01:111:f400:fe0e::630 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=kGNN2Zmmi+mHuKaBkZno7om9y/Z+KTXvaEx7iuZowqk=;
        b=YmkVP0qDpWwno/purLNxwC2Nr4yJ6OpZrYSELUUwYea+tdRsahdlGX1mSJrsbRcfr7
         MFmZaX6z9TjfmcVuYPHqIm7EQD8Mi07VQYJOi/NWJFrgfA3cxMnzHIreBt3QtGNnJDAY
         0fTr4w3cl0Vn1/t2rCMWLUCIky+Nk4C13aL4RIvPNbMPCzezcjFgGNxWLc8HV+0V1iuf
         uLFHR+QW6FFbxYdgn5ZIptKjW+/c8wneL3igus6JDnOWkJTP/sp5P9jZbU4AvIHTpksL
         jQ0s+aIV+sUF8TCjS/qtwX8Wj+bLN8nc75gxJsW/ySlRtRLs81uBJoGhxE/A4ACUFR0C
         9BqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:message-id:date:mime-version:user-agent
         :subject:content-language:to:cc:references:from:in-reply-to
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=kGNN2Zmmi+mHuKaBkZno7om9y/Z+KTXvaEx7iuZowqk=;
        b=BMedpJKcNCOTgnrUXOm3cXtShQQSDa1S4GvlAZWpLRniX8K4erIUmdfx+5lwxEjbiv
         dvrwdD4kzx6OhqCiSTzhWUxpsHxBo24MmDsGRbRPaBNQm/0VfdGh3Rz50UVIJmbuhc7m
         hUj1TKx3yxyxSZx8qyz6jhy+wUzZjIgf6nJmAot/Zg4F++fcOcCPqVAi6SLgaqIvN7Eu
         wyXdHax8Q0F9y9lRGLtpPDZ4kPJz+G+pMWtOa8127ZTgMuO+dHeTlyM40QAgHVde6+KS
         Vkr4uaZ6wo8aNOJ7pXdq+Yx+6XK9gAPh9uCU2rpyc8ByPXFh/SAZPNqVxxHpozRtSzC/
         lMUQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530xyzaVmt5IspsQBjuVfmMxvWX+ONF8T0zCQmt+sApuUSQw9S3P
	bXlhwV2Ea1bJNoFW6sFP7qk=
X-Google-Smtp-Source: ABdhPJwSLej9MYhozgFRld05Nte9RKqWSa7DS7SyIddWF/e08PCfyvtX60NZmTokftIvw0Mbj/w+fw==
X-Received: by 2002:a5d:47a4:0:b0:20c:788b:92fa with SMTP id 4-20020a5d47a4000000b0020c788b92famr4577925wrb.383.1652455983193;
        Fri, 13 May 2022 08:33:03 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:600c:3c9c:b0:393:ef44:c49d with SMTP id
 bg28-20020a05600c3c9c00b00393ef44c49dls6421616wmb.2.canary-gmail; Fri, 13 May
 2022 08:33:01 -0700 (PDT)
X-Received: by 2002:a7b:c3cb:0:b0:394:3533:c712 with SMTP id t11-20020a7bc3cb000000b003943533c712mr5210301wmj.141.1652455981598;
        Fri, 13 May 2022 08:33:01 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1652455981; cv=pass;
        d=google.com; s=arc-20160816;
        b=f0GcztoYQ0SNWviDP6iW6BEOECgdv+p+OAjz4V/dwI7XV29/waRzwU1xvvDzaX+OaG
         VusT3JRhk5P8ne9cSlgXdV5ppAdAWiuvoAnDXYKALPKfrqtGWLLXfYKEB3P2bUdusfyc
         t9Ejt/IGPxvJPZAiXkwhhcBus9a7ZYmHnz6EQSZoXpHTQZ5QT85vne6xKTprQ7XyhaIi
         KRddUzO1BQ6tCTc3iiD7Jy3z+uxgQNX+kkY/ShNa2AAOXY6XV+mBZq9Zzk4v1S2HExbf
         ZvjRXa+jWTWS5jSLP1B7J/LEBXAvTskrmJxLCH3D6AQQVZiL9Uspuk6EqP9jHSU+AqKr
         jhvQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=7jRAcVXDHH2KvwgNr1dXb6Af4jYZuUYFHhqngdojFVQ=;
        b=z+7XknMBt4i+zPMJ+WAqlKhJUkew2+E4becPwIuRoqHai8ACTWHaM35PGdaUTnw2u2
         Kdlt7fWTvK4nsyeO3aoR3efXybYGzSpRsbZR4q+cqIlM6dBxbFgKx9x2iTDxCFa8ifY+
         K7QNA4B7P+rQS2RPYIXGHJwmzMcTobS50Qeu//KWUsJ2Prfludzxo8PsMHR72skM/0M6
         Nv4L33tCkfU6t+Hr1QR9r8IZWHW2In0MQ4foxWoQZW266OVhsQM8DBfnej21dKhZUj6I
         SmuQ7+qRn6jSDatlSrX1wQ8qSbI25MrW8qO+MTjG8sHMWHWtLVZ58xCVvkD5uUJCShAE
         QooA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@siemens.com header.s=selector2 header.b="XsG/SzmZ";
       arc=pass (i=1 spf=pass spfdomain=siemens.com dmarc=pass fromdomain=siemens.com);
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 2a01:111:f400:fe0e::630 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (mail-vi1eur04on0630.outbound.protection.outlook.com. [2a01:111:f400:fe0e::630])
        by gmr-mx.google.com with ESMTPS id p6-20020a05600c358600b00393e80e70c9si449037wmq.1.2022.05.13.08.33.01
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 13 May 2022 08:33:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 2a01:111:f400:fe0e::630 as permitted sender) client-ip=2a01:111:f400:fe0e::630;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Qpxbjq1JLFEAV+oE/CmuJcJC3DzOGo59SCe6HWug6sFOli7+cvn/o8itsWFX4JQBrz45qon6JH0P3mRgqp2Cfu4GXq74dedC4p2A1SFhO4CA5ex6vF2C9TV2CrvfInIklfknMPvlTwNBKJrhOQ+gq6bEW6jNBERTAd580zKAza8SH8eRO/KFesUkq4PW0ZZmAN3Z8Q4I0AcrBMQoUEc04p84JvlT7leEUK24mc07lNG2+t3pnuQV4WOLU7cU5TckqvZ1+Br41y9r3ytyQJ1ASA9KC+xzoYbD9tIris6GnGtH0sLcP2Dq0PGnRtXgnY+7fgdHi7Gl75nRIZk3QzGfGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7jRAcVXDHH2KvwgNr1dXb6Af4jYZuUYFHhqngdojFVQ=;
 b=i2S2feL9IrDZiysjmFPMhQupOGBHkyQ7yPJcSE+EaK3ivt6HCNwtOBosaPuJW/8ksntW5amNQIvcKRxZVEOmIgsceiDBERYPSB8jaCDJXWwXO1aO0yLfc+E00taAV81KhKjgvCmp+YiNw6pA/UfF3qTJPIxXWIXPdYQRKVueehIJBDWfLWpL4TaUID2FvrvQlp1J7T00uOHkJIKLgZkS8xBbZygznbWwQnAdFxRbB+9d1/QAZ8XfGbxjpqtVgKcgojpSxYE6RG9QlW4XO/swaaYPj6+l9IYUDbleStyTwXsiKBiCpzrxnFgddrujPg+Q/c9eKwg7G8/SwVBjbQMK4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 194.138.21.73) smtp.rcpttodomain=gmail.com smtp.mailfrom=siemens.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=siemens.com;
 dkim=none (message not signed); arc=none
Received: from DU2PR04CA0075.eurprd04.prod.outlook.com (2603:10a6:10:232::20)
 by GVXPR10MB5885.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:150:68::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5250.14; Fri, 13 May
 2022 15:33:00 +0000
Received: from DB5EUR01FT061.eop-EUR01.prod.protection.outlook.com
 (2603:10a6:10:232:cafe::3b) by DU2PR04CA0075.outlook.office365.com
 (2603:10a6:10:232::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5250.15 via Frontend
 Transport; Fri, 13 May 2022 15:33:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 194.138.21.73)
 smtp.mailfrom=siemens.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=siemens.com;
Received-SPF: Pass (protection.outlook.com: domain of siemens.com designates
 194.138.21.73 as permitted sender) receiver=protection.outlook.com;
 client-ip=194.138.21.73; helo=hybrid.siemens.com;
Received: from hybrid.siemens.com (194.138.21.73) by
 DB5EUR01FT061.mail.protection.outlook.com (10.152.5.197) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5250.13 via Frontend Transport; Fri, 13 May 2022 15:33:00 +0000
Received: from DEMCHDC89XA.ad011.siemens.net (139.25.226.103) by
 DEMCHDC9SNA.ad011.siemens.net (194.138.21.73) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Fri, 13 May 2022 17:32:59 +0200
Received: from [139.22.104.221] (139.22.104.221) by
 DEMCHDC89XA.ad011.siemens.net (139.25.226.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Fri, 13 May 2022 17:32:59 +0200
Message-ID: <e1b5e28e-f6a7-b603-95f3-8a72f0405d7f@siemens.com>
Date: Fri, 13 May 2022 17:32:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: Kernel panic on enabling root cell
Content-Language: en-US
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
CC: Jailhouse <jailhouse-dev@googlegroups.com>
References: <2dcadf3d-1df9-497a-a530-be01a5da96e9n@googlegroups.com>
 <f0853228-55dd-465b-8db1-01f6d3f26d8fn@googlegroups.com>
 <d22051fb-2c80-2d88-af8c-5f1ccdb69197@siemens.com>
 <CA+V-a8sQAYXHykiGqn8DD8=cL4fv4NcszvgFgza2gE3_MCyRmQ@mail.gmail.com>
 <37be2e7c-c1f4-c5b6-f200-8d1cc48e0ee5@siemens.com>
 <CA+V-a8t-wvud8MF0oyAsHBSUuVQrrkqSr9RWE2tQLCoOzuQikw@mail.gmail.com>
 <fe2e7e92-8530-9913-307f-85437412fd81@siemens.com>
 <CA+V-a8sgPXsMmsKYwE6etP=JG8Ef83Qz4RHoWAZKeHdVHhk_Pw@mail.gmail.com>
 <5ea8c025-13f2-4754-479a-21395de9306d@siemens.com>
 <CA+V-a8tM_umwZ-+vt7VST1pBJF2MxmbOJSonzDDbJz_OV=GE3w@mail.gmail.com>
 <2fe4d998-1784-53c5-a653-994882ec7fb6@siemens.com>
 <CA+V-a8s9Ta0fPD6V=yGYDhvKngiMrCghi07Y_4XTbDPk9HeHfw@mail.gmail.com>
 <c44b2378-e682-4b0b-8443-57f28aeea9ee@siemens.com>
 <CA+V-a8ufXHeaMTwmMmtYdVijY_OVwU_+eTtSbr=Rx=oiQa=9tg@mail.gmail.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
In-Reply-To: <CA+V-a8ufXHeaMTwmMmtYdVijY_OVwU_+eTtSbr=Rx=oiQa=9tg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Originating-IP: [139.22.104.221]
X-ClientProxiedBy: DEMCHDC8A0A.ad011.siemens.net (139.25.226.106) To
 DEMCHDC89XA.ad011.siemens.net (139.25.226.103)
X-TM-AS-Product-Ver: SMEX-14.0.0.3080-8.6.1018-26680.007
X-TM-AS-Result: No-10--19.057900-8.000000
X-TMASE-MatchedRID: AnkS0S6+UFo5QaOxwNGfvo9bHfxDWoib5GpNAiPonKiCCtrY06jaLY1j
	+mrGi/PFV4i674aSi3ybAPxtNvAfmGMJRJ1WGnFogoYjLp9hKaAxs7ulGdJ/volSWYvdSPSYOZU
	kkswTRZg8sS0dkmSGjEGzU7CKX1sdGIfsX2xHdgvQdf1OKvQxXXnYsjCinlm9MB2m5K0KuImW31
	x27U9QYjhYqvU+Y921QPUnSIMN7VvcLUMnDfuntNUW7fqDXv0BlE0VgxbvH2wjCTunWqnclrq5g
	apsvWFSRaXolgMyx3Gg8+YbImnC34uHeZzoCcZNiK4b8Rx6I9buKBhavMuvY9F8NCC76P7lETMx
	8OI4obnLN5nQQXYmEuHTrDSrqn2s3sOh0RJcYlUvHEcEx0NzujLvC8LxRzodngIgpj8eDcC063W
	h9WVqgtQdB5NUNSsi4Hwn1pZzW/9XKaQsz6vtVDsAVzN+Ov/sOfUuW60DPqPdVOoFRKQ8Xmfes3
	lRweLz2qOaJAR3qNKyxaoW9Y3sSQ==
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--19.057900-8.000000
X-TMASE-Version: SMEX-14.0.0.3080-8.6.1018-26680.007
X-TM-SNTS-SMTP: B73C515F73AFB86E1D6057DC60EA78A84CCAE99A15502EBBDF0CD1597FED5E972000:8
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c2d6c892-6cc7-42bf-3621-08da34f5dcb7
X-MS-TrafficTypeDiagnostic: GVXPR10MB5885:EE_
X-Microsoft-Antispam-PRVS: <GVXPR10MB5885DF24901434951A97A54B95CA9@GVXPR10MB5885.EURPRD10.PROD.OUTLOOK.COM>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: eVKYNHZ53ZBWodTepCR+PGL7KjYphF4tYYmLqgonUDnLVsZ4avIt3D+RYchCi7NQ1WwQSnl1fZSBBaKGUSzWXQoFjYbu4nLapQd/t6shH7aTZ7XRt0FfLiWI+4/ASISmVPs24wSdrFWmhTkrm2ju3nF+IgWtci6ENqUp1rX1DYA9dS+Seyou6jVVnqTMT4triwpAEq8uK0uT1eDI0hZfQd5hppL7hpDM4tuMSzmF5GeilGEDPqfQXV6EezHWv0mZajaNenLKfRWaZ/3FIbgyXmNgCnNeMOuLZ1c2wYpkURbQd6AAt8QuyPYqy/fHe87cO05eamenuA+IkQGLC1RjkEEU3RgmlPHkiSXMAkOgDTwKQMLFk/ues7UYBL98St895zhs/CGT3yGJsv6xZeR8kmryBaGqRujouBw0XbuKrudEuLy06YVA8Rw6P+AuNfn6cmhH/drV/V9J6GK2sy3qJuRDgL58KDkaHBSzCCh/vUZEaKsnZc3utaQ2yDhw1QHmS0bnYMd/5Xl5Eqzvrqep2nGIPOoh27eg4YaNh+LyeuCU+ST18zNU/qvACgSaMmlZdZhtVptaJRYGmPY8OpeL3xQvmDGIQpnt2ERtIKEIKJeUZYE42aJXtD3G9glKjGMbf9aUjz8GZa2WTawIpmSZFF5gKeJKZMtjslrvLmJGdyEIElNLsVox3fGa1y3+FNwHkvZrj1h0OCd4Pp3GxCfgLJdXiGua+sKWU4pU+S8q17FeetU6R0Btvcqr4VyKoY14KQWVAqEEivKEpOWp2/FfTw==
X-Forefront-Antispam-Report: CIP:194.138.21.73;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:hybrid.siemens.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230001)(4636009)(36840700001)(46966006)(40470700004)(8936002)(44832011)(5660300002)(2906002)(81166007)(316002)(6916009)(16576012)(6706004)(8676002)(4326008)(70206006)(356005)(82960400001)(70586007)(83380400001)(53546011)(186003)(26005)(956004)(2616005)(508600001)(336012)(47076005)(40460700003)(16526019)(36860700001)(82310400005)(86362001)(31696002)(31686004)(36756003)(3940600001)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2022 15:33:00.0219
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c2d6c892-6cc7-42bf-3621-08da34f5dcb7
X-MS-Exchange-CrossTenant-Id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;Ip=[194.138.21.73];Helo=[hybrid.siemens.com]
X-MS-Exchange-CrossTenant-AuthSource: DB5EUR01FT061.eop-EUR01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR10MB5885
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@siemens.com header.s=selector2 header.b="XsG/SzmZ";       arc=pass
 (i=1 spf=pass spfdomain=siemens.com dmarc=pass fromdomain=siemens.com);
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates
 2a01:111:f400:fe0e::630 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
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

On 13.05.22 17:20, Lad, Prabhakar wrote:
> On Fri, May 13, 2022 at 1:18 PM Jan Kiszka <jan.kiszka@siemens.com> wrote:
>>
>> On 13.05.22 13:32, Lad, Prabhakar wrote:
>>>> Could it be that arm_dcaches_flush was a red herring? Maybe we are
>>>> actually crashing on hvc in arch_entry, and that because of Linux not
>>>> starting in HVC mode, thus no hypervisor take-over stub being installed.
>>>>
>>>> Could you share the boot log of the kernel?
>>>>
>>> Attached is the complete log.
>>>
>>
>> "CPU: All CPU(s) started at EL1"
>>
>> As suspected. Must be EL2 or HYP. Reconfigure your firmware to enable that.
>>
> Argh my bad, I've now enabled it to start in EL2 mode (attached are
> the complete logs). Now I see the below panic,
> 
> [   33.920507] jailhouse: loading out-of-tree module taints kernel.
> Reading configuration set:
>   Root cell:     Renesas RZ/V2L SMARC (renesas-r9a07g054l2.cell)
> Overlapping memory regions inside cell: None
> Overlapping memory regions with hypervisor: None
> Missing resource interceptions for architecture arm64: None
> [   34.741847] Bad mode in Synchronous Abort handler detected on CPU0,
> code 0x5a000000 -- HVC (AArch64)
> [   34.741850] CPU: 0 PID: 0 Comm: swapper/0 Tainted: G           O
>   5.10.112-cip6+ #13
> [   34.741853] Hardware name: Renesas SMARC EVK based on r9a07g054l2 (DT)
> [   34.741855] pstate: 20400089 (nzCv daIf +PAN -UAO -TCO BTYPE=--)
> [   34.741857] pc : 0xffff800013004868
> [   34.741859] lr : 0xffff80001300484c
> [   34.741860] sp : ffff8000118cbed0
> [   34.741862] x29: ffff8000118cbed0 x28: ffff800011632f80
> [   34.741869] x27: ffff800011632f80 x26: ffff8000118cc000
> [   34.741873] x25: ffff8000118c8000 x24: ffff80001162a344
> [   34.741877] x23: 0000000000000000 x22: 0000000000000000
> [   34.741881] x21: ffff800013000000 x20: ffff800013004800
> [   34.741885] x19: ffff800008c17000 x18: 0000000000000001
> [   34.741889] x17: ffff800008c11828 x16: 0000000000000000
> [   34.741893] x15: 0000ffffc004b800 x14: 000000001004b800
> [   34.741897] x13: 0000ffffc0200000 x12: 00000000b6f00000
> [   34.741900] x11: ffff0000f6d00000 x10: ffff8000118cbed0
> [   34.741904] x9 : ffff8000118cbed0 x8 : 3062333564203a68
> [   34.741908] x7 : 0000000000000000 x6 : ffff00007fc6caa0
> [   34.741912] x5 : ffff00007fc6caa0 x4 : 000000000000003f
> [   34.741916] x3 : 0000000000000040 x2 : 0000000000000002
> [   34.741920] x1 : 00000000b6f05000 x0 : 0000000000000000
> [   34.741924] Kernel panic - not syncing: bad mode
> [   34.741927] CPU: 0 PID: 0 Comm: swapper/0 Tainted: G           O
>   5.10.112-cip6+ #13
> [   34.741929] Hardware name: Renesas SMARC EVK based on r9a07g054l2 (DT)
> [   34.741930] Call trace:
> [   34.741932]  dump_backtrace+0x0/0x1c0
> [   34.741934]  show_stack+0x18/0x68
> [   34.741935]  dump_stack+0xd8/0x134
> [   34.741937]  panic+0x180/0x398
> [   34.741939]  bad_mode+0x8c/0x90
> [   34.741940]  el1_inv+0x3c/0x60
> [   34.741942]  el1_sync_handler+0xac/0xe0
> [   34.741943]  el1_sync+0x84/0x140
> [   34.741945]  0xffff800013004868
> [   34.741947]  flush_smp_call_function_queue+0xf8/0x268
> [   34.741949]  generic_smp_call_function_single_interrupt+0x14/0x20
> [   34.741950]  ipi_handler+0x8c/0x158
> [   34.741952]  handle_percpu_devid_fasteoi_ipi+0x74/0x88
> [   34.741953]  generic_handle_irq+0x30/0x48
> [   34.741955]  __handle_domain_irq+0x60/0xb8
> [   34.741957]  gic_handle_irq+0x58/0x128
> [   34.741958]  el1_irq+0xc8/0x180
> [   34.741960]  arch_cpu_idle+0x18/0x28
> [   34.741961]  default_idle_call+0x24/0x5c
> [   34.741963]  do_idle+0x1ec/0x288
> [   34.741964]  cpu_startup_entry+0x24/0x68
> [   34.741966]  rest_init+0xd8/0xe8
> [   34.741967]  arch_call_rest_init+0x10/0x1c
> [   34.741969]  start_kernel+0x4b0/0x4e8
> [   34.981086] SMP: stopping secondary CPUs
> [   34.981088] Kernel Offset: disabled
> [   34.981090] CPU features: 0x0040026,2a00aa38
> [   34.981091] Memory Limit: none
> [   34.981094] Bad mode in Synchronous Abort handler detected on CPU1,
> code 0x5a000000 -- HVC (AArch64)
> [   34.981097] CPU: 1 PID: 232 Comm: jailhouse Tainted: G           O
>     5.10.112-cip6+ #13
> [   34.981099] Hardware name: Renesas SMARC EVK based on r9a07g054l2 (DT)
> [   34.981101] pstate: 20400089 (nzCv daIf +PAN -UAO -TCO BTYPE=--)
> [   34.981103] pc : 0xffff800013004868
> [   34.981104] lr : 0xffff80001300484c
> [   34.981106] sp : ffff800011f93b30
> [   34.981107] x29: ffff800011f93b30 x28: 0000000000000000
> [   34.981111] x27: ffff800013000000 x26: ffff800008c17000
> [   34.981115] x25: ffff800008c17000 x24: 0000000000000002
> [   34.981119] x23: 0000000000000870 x22: 0000000000000001
> [   34.981123] x21: ffff800013000000 x20: ffff800013004800
> [   34.981127] x19: ffff800008c17000 x18: 0000000000000001
> [   34.981131] x17: ffff800008c11828 x16: 0000000000000001
> [   34.981135] x15: 0000ffffc004b800 x14: 000000001004b800
> [   34.981139] x13: 0000ffffc0200000 x12: 00000000b6f00000
> [   34.981143] x11: ffff0000f6d00000 x10: ffff8000116996c8
> [   34.981147] x9 : ffff800011699720 x8 : 0000000000017fe8
> [   34.981151] x7 : 0000000000000000 x6 : ffff00007fc82aa0
> [   34.981155] x5 : ffff00007fc82aa0 x4 : 000000000000003f
> [   34.981159] x3 : 0000000000000040 x2 : 0000000000000002
> [   34.981163] x1 : 00000000b6f05000 x0 : 0000000000000000
> 

Please validate first if KVM is working in your setup. I suspect there
are still things wrong that are unrelated to Jailhouse.

Jan

-- 
Siemens AG, Technology
Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/e1b5e28e-f6a7-b603-95f3-8a72f0405d7f%40siemens.com.
